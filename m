Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9283A6B66
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786214395; cv=none; b=jT0E5SpQH87qOafj6eELDGR/WnMyy/M9lQcZo9OPdrsXgBo4rSo8OoQ4AEsCFkzGmzzkasPLTFA33ItDjYcQo5rUfNPZY8uIpoRowxnhY/8kwRYX7W5srIjPjwbwMVxOuy927Vp3ukoTgLVWvikHtVZZ50UYGJDKFPNMSS718+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786214395; c=relaxed/simple;
	bh=+PW2aGmH9t2vekwoGwf8HbBp9LErPE2vOPp/zXXjYMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rZYEavbSogMJ4GqEY1VlW/i8hemvNLbzvB7zB1mIjf0hu2aZ8yaHPKSh9dih/ZINsiEzayks1/5HdLOq8PSgDKLCvWQxg/vIjQ6Kv//cNP0kavT/y4/KHPaSzDqaAMJBKyoWtvXhVLyPMYd06eXUK1jVvMtsikhe3+6oZCEdUcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoSttn1Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoSttn1Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492F11F000E9;
	Sat,  8 Aug 2026 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786214393;
	bh=hIOiE7Mva1zQywgg3emEAM363BRaY/e578q7zVqKcUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YoSttn1Z/+yw3s8JnQHZcsfCi4/DjYXHUmhIvveH0SrOk8/Sg7M/Kd+jNBfa+X/xs
	 gLOGmMA0cwaHCExLKYRRlUaQSR9MJ0NbDh6vnpoXlyUj452P0zaaDZr+GYCCbiHHMM
	 biS7/7vJe5l5cV7oADubJAmVJzuWne61R6ynR+VJ/Jj/pGuBSHEjHAg1UXzT4LcQZy
	 Tci74VzoZMV3O94O6iXiulr1JIpHnnoMj6dGB9ysIoI1Dz0jzP8yK6iAiPqfMFXhe4
	 eQC1SZWYRHLtoeB8YiqaUMnNfjwcnqsJZD2qUQf555jpKhy8Ttq/YJxWKqz/uFdSn+
	 IKkh0LaBEJO/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/5] ASoC: qcom: common: Distinguish missing and
 invalid TDM slot configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260808181948.2489187-5-prasad.kumpatla@oss.qualcomm.com>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-5-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 18:39:52 +0000
Message-Id: <20260808183953.492F11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete API update breaks TDM configuration parsing and error h=
andling in the sc8280xp machine driver.
--

--- Patch [4]: [PATCH v1 4/5] ASoC: qcom: common: Distinguish missing and i=
nvalid TDM slot configuration ---
commit 2828c15bbb01105bac7c7698b0dd46a75894895f
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration

This commit modifies the TDM slot configuration parser to return -ENOENT for
missing DAI-link configuration while preserving -EINVAL for malformed
properties. It also updates qcom_snd_apply_dai_tdm_slots() to handle the new
-ENOENT return code.

Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatl=
a@oss.qualcomm.com

> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index d231024206dbf..d9f256d519733 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
[ ... ]
> @@ -172,7 +172,7 @@ int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_r=
untime *rtd)
> =20
>  	ret =3D qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
>  	if (ret)
> -		return ret =3D=3D -EINVAL ? 0 : ret;
> +		return ret =3D=3D -ENOENT ? 0 : ret;

[Severity: High]
Does this API change break other callers that were not updated?

Looking at sc8280xp_tdm_hw_params() in sound/soc/qcom/sc8280xp.c, it still
expects -EINVAL for missing TDM configuration:

sound/soc/qcom/sc8280xp.c:sc8280xp_tdm_hw_params() {
    ...
    ret =3D qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
    if (ret)
        return ret =3D=3D -EINVAL ? 0 : ret;
    ...
}

Will this cause hw_params to fail when TDM configuration is intentionally
missing, since it now receives -ENOENT?

Could this also silently succeed on malformed configurations that return
-EINVAL, defeating the intent of the patch?

> =20
>  	return qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808181948.2489=
187-1-prasad.kumpatla@oss.qualcomm.com?part=3D4
