Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A339F4BB26F
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613666; cv=none; b=k7vNWjkEqHXP49t1pvm8SWqIwkSmavpYwRXZYLBh4B2cyEfPW/1ekP8g7M0OOsdAToZo61AZnpY0651eygxPNwsEsozuUmErzHv9sAJ1MYp4/h49sluQVKU82Ct5aeBLqe2QyPFlPGv/aqAtf9GmUM+T4x+B04kHugPPv3Kp010=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613666; c=relaxed/simple;
	bh=mq0r/11RMh0rRPAGuj/f/UbUtE+5gES2vKY+vfx+t8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JQQYDXXVxnK2YpVQHYp6E9OXgLIZCVI+6yheza8HTr4lnvmZK4OSF+RDryJu8zyxJur22SIC21z/qyg99eQ7PQ/G+52TDVyHgXkJ8/gRBrH7I4lRtrzrc8R6tH9a6oV52ow31MPVPAYkbeM6vMvLZQDIZFfRBJouDL+L5eV/JsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuPw4tDF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuPw4tDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030E31F000FF;
	Mon, 28 Sep 2026 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613665;
	bh=WdgMeEgDisc8/yn1pKXIHSpeT+cRX8Os10ijMOQpj1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CuPw4tDF7seO7/KQjtSF91hWXLXk8UvVMfOhkKTghbxN39zTIeuhKIgxB0PVdmp3Y
	 RLPxyUJg8h/A+MoaTF9MGVn0hMyeLq2MS99eb8ZIIP1ckkzEz0Dp7yq7MbhZdBVzth
	 +/k5Je1OUuFW44g/ifT9IgSsy/CX8rljCsE4HRqEUs3ywUDrmD7MWSEkHM+luVexEz
	 yFSbdwTkCvG9IrZ9q2lWSslJ2p10iCkQZX7opYbkwXi390LccSUe3nrkud7disLv47
	 jsyeKFGzf7z8em7xx/2vsWBRF2rhGGs9p8aeAbOFfedUi9sn6z6WwgLDppLbZA+1mG
	 czdJHJAw8SW6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: eliza-cqs-evk: Move sound card
 support to Eliza EVK generic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-2-9a2fdbf6baf2@oss.qualcomm.com>
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
 <20260928-dts-qcom-eliza-add-ufs-variant-v3-2-9a2fdbf6baf2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 16:41:04 +0000
Message-Id: <20260928164105.030E31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] sound: hardcoded cqs model string in generic eliza-evk.dtsi
--

commit 59abb23a6bd8ac9951db58edd7aaebd3f7f631c7
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK gener=
ic

This patch moves the sound related device tree nodes from the Eliza CQS EVK
specific file to the generic Eliza EVK implementation. The stated goal is
to allow reuse across all variants, including the upcoming CQM EVK.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dt=
s/qcom/eliza-evk.dtsi
> index 6c5cc47a183ea..726fd8dd6c0d0 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi

[ ... ]

> @@ -63,6 +65,55 @@ pmic_glink_ss_in: endpoint {
>  		};
>  	};
> =20
> +	sound {
> +		compatible =3D "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
> +		model =3D "eliza-cqs-evk";

[Severity: Low]
Since the eliza-evk.dtsi file is meant to be generically shared with other
variants like the Eliza CQM EVK, will hardcoding the model string to
"eliza-cqs-evk" in the shared sound node cause those other variants to
incorrectly advertise their ALSA sound card as the CQS EVK to userspace?

Could this model property be defined or overridden in the variant-specific
device tree files instead of the generic include?

> +
> +		audio-routing =3D "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-dts-qcom-e=
liza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com?part=3D2
