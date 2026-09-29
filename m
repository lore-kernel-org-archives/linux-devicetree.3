Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AE940EB80
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662371; cv=none; b=rZ+fen6lANgwX8P4N9QmhgWxsMrEgeCxh89zn5aGf/mD5J9iFsGUHvNcI0aMcpenMoMOPh/hIAiO0FuzZt4h3OiSDGicmqgzDJhjmfAsK3UdQgCoiMhfRauZDcsckWsiat87Ej4T9aBxBObi7QdqcK1YSx7BdxBD5CEDDMSzOJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662371; c=relaxed/simple;
	bh=TKB/2Q1yp2zgC0PI6JVmtOiOwdoh5AoALxgHCYfI9o4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KufA3hNCCxMC/o5djXQU3KFLbZzJKkEmM0gNsW+ldTwYXJqENb+53brXOdlze8O+bmJ4fK8DtY5nM25zg2t5+U3+eW4rnx/oWWVFXqch2jau44JqMCukjSA44bhtvodixYv/KUDBIAuskaQbxpH0JhR6+K+QsKFYdaJ7CZVDS5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFB6LMis; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFB6LMis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E035C1F000FF;
	Tue, 29 Sep 2026 06:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790662369;
	bh=W6qDKbxwGAsefH2+rFjvL4PbiWHWFZq+CSEU4fCTMNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cFB6LMis3qPqwADAaMVBcpYYSZ5Khbvmq1xReIPlzfh5/HFTOFtAYdpkWDF5ReabG
	 OfBC7cKBw6tKPS0GF8H/QZdIIoeErtF7qaSlfo5/kCAl+AC38pyp6P7FsfzZiuPj1c
	 OFH/d+cmN/fBYSCtGsAoyQc5PN5etiz23Tt5uY55RvUKgqL0yz9pNZFgaYkayysJGu
	 nhCG6fUgsi+N9o00m2/GQ8Gjyo3q8n4Jfzu/kun+F09DCEUrlRz/DKG18JXnZrUOpx
	 LMPpcRuyzJ7jLyeyNXwWG5jRe9+kvhjKUKdzSBu1nieTxzT19kE+HQyerd5Z48Z97i
	 cQnTWmvqTBRbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 08/11] media: qcom: camss: tpg: Add support for
 v2.4.0 TPG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260928-kaanapali-camss-v17-8-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-8-dcf3fd37f76c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:12:48 +0000
Message-Id: <20260929061248.E035C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: camss: uninitialized tpg->hw_version used in tpg_reset()
--

commit e2a0aed20f3751127d25b2596032eac51d537c58
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: tpg: Add support for v2.4.0 TPG

This commit adds support for the TPG hardware version 2.4.0 found on
Kaanapali. It updates the configuration and reset logic to use the new
TPG_CTRL_CMD register instead of TPG_CTRL.

> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers=
/media/platform/qcom/camss/camss-tpg-gen1.c
> index d29de5f93c18e..770a9e5d5ba5f 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c

[ ... ]

> @@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)

[ ... ]

>  static int tpg_reset(struct tpg_device *tpg)
>  {
> -	writel(0, tpg->base + TPG_CTRL);
> -	writel(1, tpg->base + TPG_CLEAR);
> +	/*
> +	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
> +	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CM=
D.
> +	 */
> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
> +		writel(0, tpg->base + TPG_CTRL);

[Severity: Medium]
Will this execute the legacy reset logic on v2.4.0+ hardware during the
first power-on sequence?

When the driver powers up the device, tpg_set_power() calls the reset
function before calling hw_version():

drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
	...
	tpg->res->hw_ops->reset(tpg);
	tpg->res->hw_ops->hw_version(tpg);
	...
}

Because the tpg object is zero-initialized and tpg->hw_version is not
populated until after the reset function is called, tpg->hw_version
is strictly 0 during the first execution of tpg_reset().

Does this mean the condition here evaluates to true for all hardware
versions on the initial power-up, inadvertently causing an unintended
write to TPG_CTRL?

> +
> +	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-kaanapali-=
camss-v17-0-dcf3fd37f76c@oss.qualcomm.com?part=3D8
