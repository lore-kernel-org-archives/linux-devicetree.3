Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E49489FCE
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257052; cv=none; b=XCfeyMOSD9jxAZYWMhlC8243RNG/ry8CXtIImVJQX36EEPebxyla/g3cV5USDGSFs9YI9nc8GURrLhyN+vFqeWPQzR/D8xmObzZquehE5aUraz4rTcDDb8sr65QkU9k8HBh4GH/6ONFtmF2unPANnzaY2SjT3RgeNQBG7PU3yKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257052; c=relaxed/simple;
	bh=hz5QJ3/dFc0EWUbLhrhNJuR3CKvm+90IEBMg3m+bEA0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MbVTqlgUiQTCzkyOd9ALQ5k+3ES+EUzLvp/ENCbeL1x2vXHvdL4H47QqfYUO6tVuXl4Mbn5Q4lGzSAR4pOaIUXOka4OUPlQZvC2K9OkKWbnw7PskgSOhmuAGxGLzE8ViA0Wka3Z/7p24z0YFnnUButZ4+NQA906h2xGNbUlqFPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbM7hiJ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbM7hiJ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEFF1F000FF;
	Thu, 24 Sep 2026 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790257041;
	bh=lVc5HCzXruiUL7S38zfk+OX8/majeytjF41XtWNWu3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CbM7hiJ2hJqwuYba/h5NRxZd/H/+p1jUd3z+TH+mcAWYsb12Ir4DiAj/WnJugZ/o7
	 HdO/CGIIDXTQ6oCweieAnl91yfZfPqUBxtTiktFC9gVwxFflTmOmMBVdtLslr3eLfm
	 Gay3fYo3zb8SBrhArl15VSbsF7B2ny3BMxKV+wYaKk4hx7k8bXsP9lbAnx0gZrJdNq
	 v1UOTo98j7M5tbBEudsn8d/6dTawu0qhRlfP+TYpNVBFNUqDoUbW6r2IOXrZWcepki
	 HNIfBz5hoOO6Upio9oA2RHK6a2zy1vJc85YgObQAm0fZBpA3WUPjJqMBn9ZfkmKhFj
	 rPplXrsn+HmOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] arm64: dts: qcom: sdm845-google: Add basic audio
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260924-pixel3-audio-v4-6-85b5d133aa5e@ixit.cz>
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-6-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:37:21 +0000
Message-Id: <20260924133721.ADEFF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: incorrect sound card model name propagated to crosshatch
--

commit cc7bf455060c791244c0b8599e2eec24bc61fc65
Author: David Heidelberg <david@ixit.cz>

    arm64: dts: qcom: sdm845-google: Add basic audio support
   =20
    Introduce support for sound card and wire two CS35L36 audio codecs for
    top and bottom speakers.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm845-google-common.dtsi
> index f1379857e2742..bc826d211e4a7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
[ ... ]
> @@ -474,6 +537,39 @@ &qup_uart9_tx {
>  	bias-disable;
>  };
> =20
> +&sound {
> +	compatible =3D "qcom,sdm845-sndcard";
> +	model =3D "blueline";

[Severity: Low]
Because sdm845-google-common.dtsi is shared and included by the Pixel 3 XL
board file (sdm845-google-crosshatch.dts), does this hardcoded ALSA sound
card model incorrectly propagate to crosshatch devices?

Since crosshatch does not override the &sound node's model property, its so=
und
card will identify itself as 'blueline' to userspace ALSA subsystems (e.g.,
UCM profiles).

Should this use a generic name here and get overridden in the leaf dts inst=
ead?

> +	pinctrl-0 =3D <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
> +		    <&quat_mi2s_sd1_active>;
> +	pinctrl-names =3D "default";
> +
> +	/* mm[0-9]-dai-link nodes must be positioned first regardless of sortin=
g */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-pixel3-aud=
io-v4-0-85b5d133aa5e@ixit.cz?part=3D6
