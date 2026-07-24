Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD4436E46E
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918228; cv=none; b=s1gR18vAjlLWHgKxDdyxgeF5e0nee+C1ISuK37ideuzmMP4CKyEYvyzJSBkj4VpYvf9eR37OtBoPOoyEf4A4EJDjkcTUNCJ+yX1W6izllduSICjtvOqQmp/eCHYGvNTwMLZg5hQBa+5vxdNZlspVzd0j8jKjDif+76372VyOEfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918228; c=relaxed/simple;
	bh=dIsQxI83TstLyOPi1JtBq6ISbpa9H3lZZSSMbWRIYY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XL/IRhOTlNFw37dH8HkiGlaHeCJcc5fvEkfnNpf2AY4LG6b+Gh+ZIqL2K6xbxsuKcBz1aiz1UGADHwOK5LfyzbcDnmjy3hZ9gqTZ5MgPC4T09GFqK0mhNfMDYp8+HnXr4aDXU1x6MYj+Zf9XAZSWPA0AJhWC3guGMhJ0h1bB+pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPGLKe3Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPGLKe3Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E2E1F000E9;
	Fri, 24 Jul 2026 18:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784918226;
	bh=UgqvfxBSgoCv5jDCZb6MWmsQszRFwxAmovl0/TSdiFo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BPGLKe3QkMM/eUh2b5+w1qUksiyfpLkBPGH8IsdgBb+wwDCEP/Scz1HZIjy+AFS7+
	 xZkYSVfjuV0NA20YN0dKD9Hq6oSpbmLUzYX/vmrYoT3i2P8XVr0wu6AE0Go8MUJRB6
	 2+0B8wQQ8RBJTf7nZP85cuRFjIY1CIJnlS12s1y4DAqTsUD6QVMp+s+7ol5he+0ekR
	 DsmbI+rN+C1vgcvqtHP3g9oXgZuIhQUpRBiYvcalgJOdeWgBDMHx0YTtOjZ22ARP6d
	 UinHLEwBprX0nD1Svm2/ZK7dkfHD+Wph0CdKe9mc5bWNDoHnZ2J78Dezm8wwxqwLl6
	 bk6327n+Hgh2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] ASoC: qcom: sc8280xp: enhance machine driver for
 board-specific config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260724182446.1484894-4-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260724182446.1484894-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:37:05 +0000
Message-Id: <20260724183706.52E2E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The logic to dynamically configure MI2S MCLK frequency for 44.1k=
Hz family sample rates is unreachable because the DPCM backend limits the r=
ate to 48kHz.
--

--- Patch [3]: [PATCH v7 3/3] ASoC: qcom: sc8280xp: enhance machine driver =
for board-specific config ---
commit 35ddc33297c8c62cbca7eda0115b4a7dad6d8a8f
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: ASoC: qcom: sc8280xp: enhance machine driver for board-specific co=
nfig

The sc8280xp machine driver is currently written with a largely SoC-centric
view and assumes a uniform audio topology across all boards. This change
enhances the sc8280xp machine driver to support board-specific configuratio=
n.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 98b15a527e37e..2ecba74d736e5 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
[ ... ]
> +static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *param=
s)
> +{
> +	int rate =3D params_rate(params);
> +
> +	switch (rate) {
> +	case 11025:
> +	case 44100:
> +	case 88200:
> +		return I2S_MCLK_RATE(44100);
> +	default:
> +		break;
> +	}
> +
> +	return I2S_MCLK_RATE(rate);
> +}

[Severity: Medium]
Will these 44.1kHz family switch cases ever be executed?

Looking at sc8280xp_be_hw_params_fixup(), the sample rate for all DPCM back=
end
links appears to be unconditionally clamped to 48000Hz:

sound/soc/qcom/sc8280xp.c:sc8280xp_be_hw_params_fixup() {
	...
	rate->min =3D rate->max =3D 48000;
	...
}

Because of this backend fixup, won't the frontend resample 44.1kHz streams
to 48kHz, meaning sc8280xp_get_mclk_freq() will only ever receive a rate of
48000Hz when called from sc8280xp_snd_hw_params()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724182446.1484=
894-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D3
