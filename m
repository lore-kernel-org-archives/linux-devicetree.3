Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3CA2ECD3A
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 12:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781870773; cv=none; b=mSuHSz08B7HDYB75M7VS0UCKLcnoMgKG3eanbbkuw0XqeQ5FLD6YAX+L+hxaKDzpBUXemqaMVmVgRVrOm11Y2t2BxFfugkQiFnLz/nvYJ3XNezgTQyGlrXSOf2pfpN/nPSqxJIgv/JX/hqK/BIRwlucbu+WXW6Q1pJwPhg1ZX7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781870773; c=relaxed/simple;
	bh=bjbQoJQwSShHrEApvL4AyvfbvrOmpsSPjZePRQwdfbo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bw5/oVrJxqe6609wC2thn/Cw/CRGGf83tMQTNxYcleCXTPJKogKZFVdEU/iIjmLPS0EAiWs3KC7iPmSF9eAsYSI9ZYk7SaYlPoj5J7bXfvSLnOVqeAWBuZHeMk3kUI+LKZzoDXqOzdfhDqYXo57xpdOKmlkfKaNfXB1p4d7IC70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcYLC0Yg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcYLC0Yg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3861F000E9;
	Fri, 19 Jun 2026 12:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781870771;
	bh=2oKQFj9Up89LG3dHooMV/thXuAnzkujJkL+jOp+W2Z4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OcYLC0Ygq4lUIMci5WSevL2T9ZQs6HZpONYJZciMlgUon0IZ4H5vvat4MEZJ3UTLX
	 gFYqKjpdEQ28nyc6fb2LF/VOI5rKPXa67WFFJV6BO8UA9Ngra5qanE9jS0XUTjd6Ii
	 j3o+D3hQXADxIBXQh7hdXg/lFiL/7VUsvuyEEOd8T9UZpDnmWlt2W6nLKo6+hwI4S8
	 rn+RlWjLRygauSQ3MUATuNmjngq2Trnh7tQU7rqhl44Hv6sQKAqzZqTTrF0fRZ4vTe
	 gYfBOHKSk8Xoix9kmR1H2xn2aVUsq+F++8BLvu5RZmv9zB1I/P0IXl907o1h+GRbnc
	 95KL4zk3UPODg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: iio: st-sensors: drop lis302dl-spi
 from deprecated list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jad Keskes" <inasj268@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260619115649.840676-2-inasj268@gmail.com>
References: <20260619115649.840676-1-inasj268@gmail.com>
 <20260619115649.840676-2-inasj268@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 12:06:11 +0000
Message-Id: <20260619120611.9F3861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect Schema Removal / Broken Validation for st,lis302dl-spi
--

commit 23c740836661eab02e0a98566f673ed373f8b4d3
Author: Jad Keskes <inasj268@gmail.com>

dt-bindings: iio: st-sensors: drop lis302dl-spi from deprecated list

This commit removes the st,lis302dl-spi compatible string from the deprecat=
ed
list in the IIO st-sensors binding. It claims the compatible string is only
used by the misc driver.

> st,lis302dl-spi is only used by the misc/lis3lv02d driver. Its
> binding is now in Documentation/devicetree/bindings/misc/.

[Severity: Medium]
Is this statement accurate? Looking at drivers/iio/accel/st_accel_spi.c, the
IIO SPI driver still explicitly matches st,lis302dl-spi:

drivers/iio/accel/st_accel_spi.c:st_accel_of_match[] =3D {
	{
		/* An older compatible */
		.compatible =3D "st,lis302dl-spi",
		.data =3D LIS3LV02DL_ACCEL_DEV_NAME,
	},

> diff --git a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml b/D=
ocumentation/devicetree/bindings/iio/st,st-sensors.yaml
> index a1a958215cdb7..2a5451589fabf 100644
> --- a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
> +++ b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
> @@ -90,10 +90,8 @@ properties:
>            - st,lsm9ds0-imu
>        - description: Deprecated bindings
>          enum:
> -          - st,lis302dl-spi

[Severity: Medium]
If st,lis302dl-spi is removed from the IIO binding, won't dtbs_check fail f=
or
any valid device tree that pairs this compatible string with standard IIO
properties (such as vdd-supply or mount-matrix)?

Since the misc binding (st,lis3lv02d.yaml) enforces additionalProperties: f=
alse,
it would reject these IIO properties. It appears st,lis3lv02d was kept in t=
he
schema for the exact same reason that st,lis302dl-spi should be kept.

>            - st,lis3lv02d
>          deprecated: true
> -
>    reg:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619115649.8406=
76-1-inasj268@gmail.com?part=3D2
