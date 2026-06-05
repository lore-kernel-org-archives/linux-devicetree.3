Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26C3E5EF8
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656519; cv=none; b=nZq3WavgPHbqIL7T4/Bwu/7iyltGEmq/7cTRy2RpKsJqhztxkzIbCPzopKQ1QER3caVpzk3CEjIZ1ecNYrutaUVu7+B8dohLscYU+qvbesvpPI8ZBdvaAMiBRVwnB7NUSxH8vZRUhGm3f7+rHcoRLADA1JiODVYQhjj4WJNaqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656519; c=relaxed/simple;
	bh=JQzxY8eogRt8+6ENdxRVDs8TWldkGbGlwslhx0mOdeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mgPmByY+ZWfXTBSkc2Wn1vN0LGA9Frhu54uPgys6iRPajB9DO1tJ+MDwcDfleWGrnTdp/gKre6PzBv18NyQYARACeWnupdiHqqXQF6dMW3lC8UhXFxNrkFoSD/yzHeiNtyFkKZvXyc4LxoQ0unZ9tFrqGehe8dtUvgXO8UEVSEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZP9I8u7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZP9I8u7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39341F00893;
	Fri,  5 Jun 2026 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780656516;
	bh=wz7Lvr55Wvf5pc38s3oOAaC5rxxXP3MJWaKZsQSVSEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BZP9I8u73HehYtFXkFkh5k1A6SHlv5sSqiSRVe9z/2aqgYtS9NxMly3eWcHKAe41Y
	 vIV8qRh7zVsdhbBGnvZ+ldzHfIKqQHrMaA5pHxkAj38m9RGKsoe2Hx1Fv5yuBESPyG
	 7O0ncFEa7I9VJbxYIGmVGB4dpT50axmfgXlyC9QisJVzvUZgXZQwqaLttSLhSApBwu
	 CQISkFQ8z2PKM8ozzR/3bmcPfwqpl1+t0lz1q3taXwS0h65aku1Tri8RF0X5o0WI8E
	 ACiLmuq9v+hdqIaZcbmDhTbzzgA4fQtg3eLSVtg25b5Fmk22apQeFvomUB/ohj9+I1
	 vJp/sJjbkkoHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/13] ASoC: qcom: Add generic of_xlate_dai_name helper
 to common
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605103739.3557573-9-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-9-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 10:48:36 +0000
Message-Id: <20260605104836.A39341F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Compilation failure due to conflicting static and non-static declar=
ations of `asoc_qcom_of_xlate_dai_name`.
--

commit 49b02ad6fd90538b16f9ce1c7f6c4b2db0f7936f
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add generic of_xlate_dai_name helper to common

Multiple Qualcomm ASoC CPU DAI drivers need to resolve a sound-dai phandle
argument to a DAI name. This commit extracts the common logic into
asoc_qcom_of_xlate_dai_name() in common.c so it can be shared.

[ ... ]
> diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
> index ee6662885593c..5baf51a39c975 100644
> --- a/sound/soc/qcom/common.h
> +++ b/sound/soc/qcom/common.h
[ ... ]
> @@ -15,5 +16,9 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime =
*rtd,
>  int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
>  			   struct snd_soc_jack *dp_jack, int id);
> =20
> +int asoc_qcom_of_xlate_dai_name(const struct snd_soc_dai_driver *dai_drv,
> +				int num_dai,
> +				const struct of_phandle_args *args,
> +				const char **dai_name);
> =20
>  #endif

[Severity: Low]
Does this new declaration break the build when included by lpass-cpu.c?

There is an existing static function in sound/soc/qcom/lpass-cpu.c with the
exact same name but a different signature:

static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
                                       const struct of_phandle_args *args,
                                       const char **dai_name)

Since lpass-cpu.c indirectly includes common.h, the compiler will see the
non-static declaration followed by the static definition, resulting in a
conflicting types error.=20

While this is fixed later in the series by commit 761cbeeaa59f ("ASoC: qcom:
lpass-cpu: Use asoc_qcom_of_xlate_dai_name helper"), could we avoid the
conflict in this patch to keep the commit history bisectable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605103739.3557=
573-1-harendra.gautam@oss.qualcomm.com?part=3D8
