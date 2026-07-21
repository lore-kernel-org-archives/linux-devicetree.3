Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700347E105
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637923; cv=none; b=eicjE5d3JaYjf+ee4khuOEAJCggDGHoVDbD0UfDeaTN25IxbemY5f1mO2ZXBxWY14mNGDyzw63I8WTx1qKcBq5HfnHyuKwxmuIauNBXd6AYx1/JbXDwehU1SRsjHwhP0hr9NCHRkd27XZE5AUTnpjj7nznaaYhRf5yhcf5wSj70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637923; c=relaxed/simple;
	bh=aRtleE4sx9mAOjZKmWbVQ4cbXecc5eKdQcnDqZzssTs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sC1fpxye39RwfKxTDM4oj4fXSQQ3mK9n5v8yiUXOfmaBfXbTnICW1Ew4cwfD6rywLX4OHWYfHGJn+xtjapzzMEY0a/Wx1Hipg4LaQMs4IvL4l2Zt6DUO2KapuRZBmWs5Us7yjiYdCkK3vJgMozmDy+qru3k88l3htgw3T9kObEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQVmme1b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQVmme1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90621F000E9;
	Tue, 21 Jul 2026 12:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784637922;
	bh=prfFGeGl6/ywmmndyJnXEIBxTQnpndrvIJkXrsYh5Xo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQVmme1b5GgZ9sPZVj4iHGebM9CPVW+U4/6RPy4hOe+yTsFX3Hkzr41A1YUqWAAel
	 27A2XeJBBSEdDCbh/Rasn1WLiZE2LkhhFN4pFy7n+AcCqGJB6yfaiyF5Xj3fagMzOn
	 fuXZ+1dkKkW/HM7Ig2RyuXvvfh9SlL5nlxAJtBzXZZ05kwLZcXYkR/r93FJ3TD31c4
	 TM3DVn4WJvk1zVWrrIeJ1bLwpJKWgR4axCCM69dK4LpO5DBBbiHvHwp3trObx6gFJW
	 0owv4pTmo+0Jy/Efxf+x1TafITl+hDJf+uwI6x8ycdvcj/ebDNF7ImN6a3bMGTwyai
	 YFR8eB0h6Elbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260721-pixel3-camera-v7-1-82d323c6c5d2@ixit.cz>
References: <20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz>
 <20260721-pixel3-camera-v7-1-82d323c6c5d2@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 12:45:20 +0000
Message-Id: <20260721124521.D90621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatched Pinctrl Sleep State: `&cci0_sleep` overridden instead=
 of `&cci1_sleep`
--

--- Patch [1]: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add dual fro=
nt IMX355 cameras ---
commit 6f3cf4398dc835a329292905a7fe098ccc06dc9c
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras

This patch adds support for the dual front IMX355 cameras on the Pixel 3.
The cameras are connected via CSIPHY ports 1 and 2, and are controlled over
the CCI I2C1 bus.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm845-google-common.dtsi
> index 9368fd6b87515..c8a28133fb38d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi

[ ... ]

> +&cci0_sleep {
> +	/* bus has external pull-up */
> +	/delete-property/ bias-pull-down;
> +	bias-disable;
> +};

[Severity: Medium]
Is it intentional to modify the sleep state for &cci0_sleep here?

The new front cameras are added to the &cci_i2c1 bus below, which depends on
&cci1_sleep for its suspend state. Modifying &cci0_sleep means &cci1_sleep=
=20
will retain its default bias-pull-down configuration.

During suspend, the SoC will actively pull down the &cci_i2c1 pins, which
will fight the external pull-up resistors on that bus and cause continuous
leakage current and battery drain.

Should this remove the bias-pull-down property on &cci1_sleep instead?

> +
>  &cci {
>  	status =3D "okay";
>  };
> @@ -358,7 +444,63 @@ &cci {
>  &cci_i2c1 {
>  	/* actuator @0c */
> =20
> -	/* front camera, imx355 @1a */
> +	front_cam: camera@10 {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-pixel3-cam=
era-v7-0-82d323c6c5d2@ixit.cz?part=3D1
