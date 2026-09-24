Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD0248EC85
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256993; cv=none; b=A8id2/ZX7UcSewYBOq4KWcxOLUDUpB/ARMyPpRlw/b/0JdkGZAHezdzqsVGpeebfWOoiJpo8lXD1UrZddieQa6AV0x1Zug6zBM4X1j8YibJdN7OriruCzrQ1jglWtO4ifzSRoOgIlp5Qt2cNpFToYvN9XqAk3oLwoFA+dKFTc+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256993; c=relaxed/simple;
	bh=k4j/5YSNHhHziJiAaOV7cqMxvIT9Gu2cNUX2Du/Ma7s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XkhIkVPMz1k7D9VQFsrNwjOi1EZLjdLPBy9vbVJNoVWito8BnQGHvpHhAoPhEyV/ckILEBo6yHm2J6dg36pLM3fxL3CSRMEOLhKF4vRw6wNDJs/zvqNATe/IvkZBf1zVmvEkOfD9zlqXu4gI09LgpAk6dQkQytqAcu+NOKHlZ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SljM4rdU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SljM4rdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3D81F00893;
	Thu, 24 Sep 2026 13:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256981;
	bh=bXTumamLuGbiaANrQN+nYA6tqtrRuJB4ss/SdaJU/yU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SljM4rdUv0EqUs8AbMq9GU9j5IkymwREFiMJp8Iswd8e+HI5NV1BlTqJV/6EwADHX
	 Th5trBvHHhe/kSFWHX9uDL7mzQTzGO/cS0x8hOr/wwXuqz79rapPOqXtdMsU5da9Xx
	 K69oA6jXxwedefR7wtqpvdQVDg235/MLLOX87ZshQItFo4Er70e9zsEjyjz66w+DLz
	 rdAjCD2oPSbDITXYXPvJBzH6f2yR0hXcpL9r7Fchj2atnizuDfbJtwJZrWYecCMv9O
	 jWIvZYKzLFdWAzeYznkLoXnKbkgwwkVDaEg4YBeAoChWVGyRrmbKXxFqfT0CYdfeVJ
	 dYnsvVCLJ4Qyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] slimbus: qcom-ngd-ctrl: Remove data channels on
 stream disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-pixel3-audio-v4-7-85b5d133aa5e@ixit.cz>
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-7-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:36:20 +0000
Message-Id: <20260924133620.DD3D81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] slimbus: missing -EREMOTEIO check on RECONFIG_NOW in qcom_slim_ngd_=
disable_stream()
--

commit 7a7223e63ca0ed5ba65c3227ee6a4afb69755791
Author: David Heidelberg <david@ixit.cz>
Subject: slimbus: qcom-ngd-ctrl: Remove data channels on stream disable

This patch implements the disable_stream controller operation for explicitly
removing data channels on stream disable. It sends a CHAN_CTRL(REMOVE)
message followed by RECONFIG_NOW to the ADSP SLIMbus master to prevent
channels from remaining active on closed streams.

> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-c=
trl.c
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c

[ ... ]

> +static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
> +{

[ ... ]

> +	txn.mc =3D SLIM_USR_MC_CHAN_CTRL;
> +	txn.rl =3D txn.msg->num_bytes + 4;
> +	ret =3D qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
> +	if (ret) {
> +		slim_free_txn_tid(ctrl, &txn);
> +		/* Controller restarting, the channels are gone anyway */
> +		if (ret =3D=3D -EREMOTEIO)
> +			return 0;
> +		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
> +				txn.mt);
> +		return ret;
> +	}

[ ... ]

> +	ret =3D qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
> +	if (ret) {
> +		slim_free_txn_tid(ctrl, &txn);
> +		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x", txn.mc,
> +				txn.mt);
> +	}
> +
> +	return ret;
> +}

[Severity: Low]
If the controller restarts during the SLIM_USR_MC_RECONFIG_NOW transfer,
qcom_slim_ngd_xfer_msg_sync() will return -EREMOTEIO.=20

Does this second transfer intentionally omit the -EREMOTEIO check that is
present in the preceding SLIM_USR_MC_CHAN_CTRL transfer?=20

Without the check, this path appears to log a spurious "TX timed out" error
when the controller restarts during teardown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-pixel3-aud=
io-v4-0-85b5d133aa5e@ixit.cz?part=3D7
