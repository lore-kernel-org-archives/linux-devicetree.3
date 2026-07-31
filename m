Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FC344C4E3
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514600; cv=none; b=K3nwe2cNom077VnKw98fRL8yaxRjVv25WGmIBo955kPKrw/ETcVVwPI7dqPwcBZK9SIv9mrk6+dl9biGxsswLUhw42MXpY+TlqqAUIsDbOWnk3NNnqvQ73AtDQsWBb76Hi7BMaC5/kRvBheVe2y1cB+/UQX+whzzsbth2BkNqs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514600; c=relaxed/simple;
	bh=eSFWXZ1UQO4wJAXwdtBEwG1a0KSI1xuGUPOe/uuyLHQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oe5uxWHGIFcg7dZzGzh6X742plD/5PFkDjQimIB4pwuNoAVIXlywELAkSZQUovF/wNH8bbvBRt9m8tcz1ARzori8UCoIhPvJhNULPZGd3FBQ3ezTXkrDmseQlXJJf+BZjWWW4QsrcLXFqqxAPqDphAGKylIuEXcOfdTchDRbJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9Nsfo7I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9Nsfo7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74131F00AC4;
	Fri, 31 Jul 2026 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785514588;
	bh=WLrhxGnki3Kw7sopbL/iJRgkIQ/u5z/+Ddg37AauneU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G9Nsfo7IckeW0JaYtfqpMtWzia3sOC3bFrE9G81d5tzyLCElSp5/vKHHnGyxlp5yb
	 E69rfCO6OrwYorNOIt/5YpzPCxqh5TG+ZbegIYYCaKswReWSUirSvng8CvdzdAeNP6
	 6MkvlpIvlviROyTX07OfFQj8iwJ3hFjTN60oJqZjrIHTXUfzVKsWShR9EXWgqfARkU
	 zCLscJxFSQ14evMTZF1HfsI6IqntNAm4Gb3qcICaHH7XXn40bVXZf03BjooPoYdh60
	 el14+qcgpQrFRFzdxkTREGhnYRelxgKRhCps9Nsek4JlU5/rkGD7sDJlLELouiQiJm
	 rBjPNkC3D7jQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/21] drm/bridge: synopsys: dw-dp: Fix support for
 short I2C reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-7-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-7-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:16:27 +0000
Message-Id: <20260731161627.B74131F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Buffer overflow and integer underflow due to missing bounds check =
on DP AUX read length.
--

--- Patch [7]: [PATCH v8 07/21] drm/bridge: synopsys: dw-dp: Fix support fo=
r short I2C reads ---
commit db106fc9593a19fc4e0e7028df22f1cecf9e1c41
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Fix support for short I2C reads

This commit modifies dw_dp_aux_transfer to support short I2C reads by
returning the data received rather than returning -EBUSY when the read
count doesn't exactly match the requested size.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1513,7 +1513,7 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux=
 *aux,
>  		if (msg->request & DP_AUX_I2C_READ) {
>  			size_t count =3D FIELD_GET(AUX_BYTES_READ, value) - 1;
> =20
> -			if (count !=3D msg->size)
> +			if (!count)
>  				return -EBUSY;
> =20
>  			ret =3D dw_dp_aux_read_data(dp, msg->buffer, count);

[Severity: High]
Does this code adequately protect msg->buffer from overflow if the hardware
reports a count greater than msg->size?

By removing the exact length match check, an anomalous DisplayPort sink mig=
ht
return an AUX_BYTES_READ value resulting in count > msg->size. This unverif=
ied
count would then be passed to dw_dp_aux_read_data(), which could write past
the bounds of msg->buffer.

Additionally, if the hardware reports an AUX_BYTES_READ of 0, could count
underflow to SIZE_MAX? Since SIZE_MAX is non-zero, it would bypass the !cou=
nt
check, potentially causing dw_dp_aux_read_data() to attempt an excessively
large read and write operation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D7
