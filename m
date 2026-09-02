Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015230149F
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337132; cv=none; b=RQPV4YbWw/s7lnFhqpzG3/h1psJMDrq+GV9inLW+DXyfzeDXz9VB588ZtKyfdPb/bhXIU54Aj9Lw/m0LA7OFAk7g0q9bVcHfc6j6FrFD36a+4VOQlnBxbaiQcNw6jaCFZ4uCBv7TT1Jy61S10/VSqnlNnMbjRM51EezTMX9I54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337132; c=relaxed/simple;
	bh=uIs7AGfj81rzp7gXXrvYlWTMZu6PuwMDaC+4NZ0qFqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=joHPRono9uSUBpD3LNMJ2FigMOAxO/fd0sPpijAqtGWckKuUEySynvONAr9M5cf7fsxGJh4/65ue41X2l2EcOeX/0Nh4XgoC7oar+LWweq5wEmO6smuE98MB3AfWfPyoMIzz18/fX+5a6+I3P+x93rHSft0mfu3QY6xwcnXfqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByFrE6GS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByFrE6GS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15861F000E9;
	Wed,  2 Sep 2026 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337131;
	bh=WcFTBaE3Fvhco3U/uCHd+gcFr6P0HVYx7wbLGVfZylQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ByFrE6GSx2sx8rvkdpH0HEwNhNXtoRTphSTSeKDMfY+cKzu9sNX1lO3rOot/9yXzI
	 ETldjnhMElhAZaD4dzIggnSTzZ4/cFmz5WZrHBJV7EXQ+e7DMsQuLt0lVYduZj6hsM
	 yyuAN47XidaE827UUTJWaieglAw1BfSlpuVZVx8EcHYN5UsejSDKD6Dmy7gOt8zzdy
	 am9MepXvRrBoyWQcc5cya1n36l9vqDck8BB9kLIyG6BT6otYwJR8xFTlWPS9IeQ6xZ
	 bsJRbNYRFwv50xG9wB/H/fQ5uqbQ8bmuYm9mOZX8aYohBRDU5cc+dgsw/tsOLNUuD2
	 vFY1ZXLFPCXsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722
 GPU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com>
References: <20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 08:18:50 +0000
Message-Id: <20260902081850.C15861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The overridden DT nodes are not sorted alphabetically by label.
--

commit 69d2b599210486d1fb104df39a0da4a840c7aa02
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU

Enable the Adreno 722 GPU on the Eliza CQS SoM board and provide the zap
shader firmware path.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boo=
t/dts/qcom/eliza-cqs-som.dtsi
> index 5ef6c51618bf9..918f5289ca45f 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> @@ -374,6 +374,14 @@ &pm7550ba_eusb2_repeater {
>  	vdd3-supply =3D <&vreg_l17b>;
>  };
> =20
> +&gpu {

[Severity: Low]
This isn't a bug, but should the overridden DT nodes at the root level be
sorted alphabetically by their label to maintain consistency?

Since 'g' comes before 'p', the &gpu and &gpu_zap_shader nodes inserted here
in arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi should probably be placed
before &pm7550ba_eusb2_repeater.

> +	status =3D "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name =3D "qcom/eliza/gen71700_zap.mbn";
> +};
> +
>  &remoteproc_adsp {
>  	firmware-name =3D "qcom/eliza/adsp.mbn",
>  			"qcom/eliza/adsp_dtb.mbn";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-dts-qcom-e=
liza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com?part=3D1
