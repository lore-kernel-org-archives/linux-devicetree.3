Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6646D552
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519286; cv=none; b=sF9hg7emsh1Tl0WKagkSpjMTQ5MwGzcss8hTdny+4VccmEoLQmhBcSu2AcDMQMoXQxwoH2RMDWRA3d7RwqRcvK5UyincHAG7Ld36wnx73z5kh+DWt+SNBUasm56K7XE8nHxn2udnc+4gYbiCdVwZSLajD0PzUZjVvSj6Nb7mCWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519286; c=relaxed/simple;
	bh=KrvJ34lmhsYxv9sSF5LVXAV4Q4FyS6DZmifEWnHfbxA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FcFZ+hqWJ5VIsRwb59IvUjIMvtIoqtFkMFMThxBI4iyekMmLHyh6at1RefdABm621c5UznBrSSay34VTHVW8MfZ7Z4Rm0F7B5eFkkT0Kvmew4dRmtGCiOfHocVL4E0MTwnmMVR1t1sIbv8kK+kow9dJz36xETHLUw3Kc4PJ9vnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dh4R7qjh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dh4R7qjh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9D41F00AC4;
	Fri,  4 Sep 2026 10:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788519284;
	bh=VJq2Q/7faxl5cWntUR75HKuy7GKw3Lju3oqcfj1JJ+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dh4R7qjh0bU4aKRmJMUP8Z29PBDBHAF6C+WSIB+M2Q4JL7hQz2ueGQbcr1WLrgHJ1
	 jv51HCANSEKiVCF0deZe+GmOhIsWWjiYIt3QyiPSl7yHhkm5mCX3PU7jj8EA5P6P8e
	 zpIy7L0u+XBGhTnCcIpjKebK2tTSl62q7Nu9NmY/cAZfmB2R4Txb8u+BqbF9RIHrGB
	 67qEjI3ciX3hKakZjY4epTYWBT78JMVsmbVk3CSjsqrWxiyW+82n7+E1UT8zFR8PPk
	 /ESi2Mt7ztmNdIZtSrY7XW+TKJBFlpH95657gGGsqDYLnac+6uULTzib9Td9HCbHHU
	 EDT416blq3cRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] ASoC: qcom: common: Add generic headset jack
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-rubikpi-next-20260605-v3-3-f49146d85af3@thundersoft.com>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
 <20260904-rubikpi-next-20260605-v3-3-f49146d85af3@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 10:54:43 +0000
Message-Id: <20260904105444.4E9D41F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup in qcom_snd_wcd_jack_setup error path leads to a U=
se-After-Free of the jack object.
- [High] Static array `qcom_headset_jack_pins` suffers from list corruption=
 if multiple sound cards are instantiated.
--

commit b92ab42f39f7bdd943113ea9586e913e225e1a7f
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>

ASoC: qcom: common: Add generic headset jack helpers

This commit factors out common jack allocation and DAPM pin registration
into a private initializer. It adds a generic setup helper to attach jacks
to codec components and a matching cleanup helper. The WCD setup behavior
remains unchanged.

> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index d9f256d519733..83b745f617a86 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -339,13 +339,11 @@ static struct snd_soc_jack_pin qcom_headset_jack_pi=
ns[] =3D {
>  	},
>  };
> =20
> -int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
> -			    struct snd_soc_jack *jack, bool *jack_setup)
> +static int qcom_snd_headset_jack_init(struct snd_soc_card *card,
> +				      struct snd_soc_jack *jack,
> +				      bool *jack_setup)
>  {
> -	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> -	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
> -	struct snd_soc_card *card =3D rtd->card;
> -	int rval, i;
> +	int rval;
> =20
>  	if (!*jack_setup) {
>  		rval =3D snd_soc_card_jack_new_pins(card, "Headset Jack",

[Severity: High]
This is a pre-existing issue, but can this static array usage cause list
corruption if multiple sound cards are instantiated concurrently?

qcom_headset_jack_pins is a global static array passed into
snd_soc_card_jack_new_pins() here. The ALSA core function
snd_soc_jack_add_pins() directly mutates this array by calling
INIT_LIST_HEAD and list_add on the embedded list nodes of each element.

If multiple sound cards or multiple instances of a machine driver are
instantiated, the !*jack_setup check evaluates to true for the new instance
since the boolean resides in the per-card private data. The second instance
would overwrite the list_head pointers in the shared static array elements,
corrupting the linked lists of the first card and causing list traversal
crashes.

[ ... ]

> +int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
> +			    struct snd_soc_jack *jack, bool *jack_setup)
> +{
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_card *card =3D rtd->card;
> +	int rval, i;
> +
> +	rval =3D qcom_snd_headset_jack_init(card, jack, jack_setup);
> +	if (rval)
> +		return rval;
> +
>  	switch (cpu_dai->id) {

[Severity: High]
This is a pre-existing issue, but I noticed the new generic helper
qcom_snd_headset_jack_setup() includes a cleanup on failure, whereas
this existing function does not.

In qcom_snd_wcd_jack_setup(), if snd_soc_component_set_jack() fails for a
codec DAI after successfully configuring earlier DAIs in the loop, the
function returns immediately without rolling back the configurations:

	for_each_rtd_codec_dais(rtd, i, codec_dai) {
		rval =3D snd_soc_component_set_jack(codec_dai->component,
						  jack, NULL);
		if (rval !=3D 0 && rval !=3D -ENOTSUPP) {
			dev_warn(card->dev, "Failed to set jack: %d\n", rval);
			return rval;
		}
	}

A probe failure will cause the sound card and its dynamically allocated
snd_soc_jack structure to be freed.

The successfully configured codec components (which reside in separate
codec drivers and persist beyond the sound card probe failure) will retain
dangling pointers to the freed jack. If a hardware jack event triggers an
interrupt later, the codec driver will attempt to report it using the
dangling pointer, resulting in a use-after-free kernel panic.

Should this function be updated to use a cleanup mechanism similar to what
was added for the new generic setup helper?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-rubikpi-ne=
xt-20260605-v3-0-f49146d85af3@thundersoft.com?part=3D3
