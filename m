Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE76440A00
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043578; cv=none; b=Bo1Hi3yyrFbuRLVhvIlp2bEEr3rITQv5hlJeJ+WnH1lBgEOPGqaLuoB4c/5BlWVxe1CgB9sT4zQoKQW5ZVWmmeoYxW74Z0+hlPKLKY75IRPwgFNyVQSiAdtzu9gNofbuHNcFpmNiTV+aRztVwxe6cBUWEcraZ5DusMn+tv7rFmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043578; c=relaxed/simple;
	bh=2EnjDanLl6c9i50ekhi03jVhOUYi07lKs7idOrPJc5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LUsPtOLhrzfKdAirFdYK+113do6TxmD5vgR8uykcl0Rp17oHICej/BhyJhttoIhe0oleRLtH6l6fMMtv5bO6gV1OJ6I4eYy1REPokoLU0uq+D2BWD+prt0h+J8yC+pVYX1at+5OjS3C+qJV7ZhISGBe2pInJrOvhlL/PPdWxzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6q6s8MY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6q6s8MY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0723F1F000E9;
	Tue, 18 Aug 2026 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043577;
	bh=Gd6IV6nzO/ros2MHcpApJmipAMf1IHvgIb/IcGWDYMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G6q6s8MYJccRl5vjrRrWSKlOlnaxGBqUdqS5x4hihbZiv5wNjvhisK6tjJKRWq+mn
	 dYiBYpmEv0YQjKO4IzrN/Qiu8jxHaYJpggJy4wsOHkwthOFUQeOW7dAvASQNMo025o
	 oFDMZf5QnBi2TWzKF5AaJGf5AeMw2omfexIxb3OImNOSlrYk9iBD5Wa6xS7jYgB8o+
	 Fegp8XLpEhU30uF+wTWz6hTXO+YnvAgaFxnpa3jqlCbEHvAv27w9Y2kaLrmUIlQ9CL
	 lpaaqfRrTI9UwocTW4bF7PP0pJbUNpSb7M2CggcEh4w9n6VDfnfptspZz3yH1SYWXS
	 VI9sMCReKquiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] ASoC: qcom: common: Distinguish missing and
 invalid TDM slot configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260818084655.3240284-4-prasad.kumpatla@oss.qualcomm.com>
References: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
 <20260818084655.3240284-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 08:59:36 +0000
Message-Id: <20260818085937.0723F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Un-updated caller sc8280xp_tdm_hw_params() causes PCM initializati=
on failure for missing TDM configurations and ignores malformed ones.
--

--- Patch [3]: [PATCH v2 3/4] ASoC: qcom: common: Distinguish missing and i=
nvalid TDM slot configuration ---
commit 6f19acb6aca2ed0950dcc6a8cc707f166eb0eb8c
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration

Return -ENOENT for missing DAI-link configuration and preserve -EINVAL
for malformed TDM slot properties.

Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatl=
a@oss.qualcomm.com

> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index d231024206dbf..d9f256d519733 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -103,14 +103,14 @@ static int qcom_snd_parse_dai_tdm_slots(struct snd_=
soc_pcm_runtime *rtd,
>  	int ret;
> =20
>  	if (!link_np)
> -		return -EINVAL;
> +		return -ENOENT;
> =20
>  	struct device_node *cpu_np __free(device_node) =3D
>  		of_get_child_by_name(link_np, "cpu");
>  	struct device_node *codec_np __free(device_node) =3D
>  		of_get_child_by_name(link_np, "codec");
>  	if (!cpu_np || !codec_np)
> -		return -EINVAL;
> +		return -ENOENT;
> =20
>  	ret =3D qcom_snd_parse_tdm_slot(cpu_np, cpu_cfg);
>  	if (ret)
> @@ -172,7 +172,7 @@ int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_r=
untime *rtd)
> =20
>  	ret =3D qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
>  	if (ret)
> -		return ret =3D=3D -EINVAL ? 0 : ret;
> +		return ret =3D=3D -ENOENT ? 0 : ret;

[Severity: High]
Does changing the return value here also require an update to
sc8280xp_tdm_hw_params() in sound/soc/qcom/sc8280xp.c?

Looking at sc8280xp_tdm_hw_params(), it calls qcom_snd_get_dai_tdm_slots()
which now returns -ENOENT for missing configurations. However, it still
appears to check for -EINVAL:

sound/soc/qcom/sc8280xp.c:sc8280xp_tdm_hw_params() {
	...
	ret =3D qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
	if (ret)
		return ret =3D=3D -EINVAL ? 0 : ret;
	...
}

Will this cause sc8280xp_tdm_hw_params() to mistakenly return an error
(-ENOENT) when the configuration is missing, and incorrectly ignore the
error (-EINVAL) when the configuration is actually malformed?

> =20
>  	return qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818084655.3240=
284-1-prasad.kumpatla@oss.qualcomm.com?part=3D3
