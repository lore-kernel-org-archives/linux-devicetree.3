Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379D1427F9C
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895402; cv=none; b=ZS9vmJ6oa/GzCkcpIUe4TytqyUYKgtE6bPqYvpwoR792qUo9UtQtARV/Mqw0K3fQ2wMp3jRhIWbpMi00ou69uX/qov95dErzCP3bH/bdJpDPdKZ12RUECgbMqgXJDHz5o8pjbgxU/nRosGx9tm8nXkgWZYio0FAJvuvCD9nIpVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895402; c=relaxed/simple;
	bh=jdcVsRqbDRtlDkkC5iz3gUPjvodAW4MHuRcauK+yiho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H7q5p+29mgtMBJw4rMy1P8VoUM/JsNVvTr3tm6rlkajCq8tmKElpcMm8ZGVLdCpyc0lZRQPVF00c7xM4aijHwFDfg+PKGZ6yyd6kRRxSzOgUlBX72vHN6qCVtHe+qVnBs3pXQsX/IK3dRUqz9TjPbLm1CJSSTK2rqdZqe5Tg1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XROpzxl/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XROpzxl/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3811F000E9;
	Fri, 24 Jul 2026 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784895398;
	bh=oco4ltOW3S7Mkz9qXxqcEE/ds+kmtiAVdBxLCsLhTrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XROpzxl/sq2k97wKHFWySuyEHpYXlZveIhC6na+lkiaPpzf6/BF9hUnre8xAdQrpc
	 PHJ60eD6vq0sAqjCpbUY1EZvQFp5LWqwbZYAU4rB9m2JMAVgUtsaUOnNBV/JaV9Rc8
	 ZvoUlP1qH24IhaAgOhN0QzVE1+Vh7d5IQYBygMIs9Gw+4QoPE2N5ho3MwikHsdoQT+
	 stgL10wFq1kMkJ3/CoMKbheE1utkGhVBoztBGyYkh3WXDaY+pcfGrrMb5BHbvO2wDp
	 mFC1DRW3tyJHxsA5qEJlqcLdzBbpCNkYzCfr5rj8XK67NbPGwS2jBYPxdCPRyrW2pV
	 RKEllvNrAyFcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] iio: dac: ad5686: refactor device list and file
 header comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-ad5686-extend-dev-support-v2-3-cfc2b30ce988@analog.com>
References: <20260724-ad5686-extend-dev-support-v2-0-cfc2b30ce988@analog.com>
 <20260724-ad5686-extend-dev-support-v2-3-cfc2b30ce988@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 12:16:37 +0000
Message-Id: <20260724121637.EB3811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete implementation of device removal: AD5337R is left in =
ID tables despite commit message claim.
--

--- Patch [3]: [PATCH v2 3/6] iio: dac: ad5686: refactor device list and fi=
le header comments ---
commit f78bcff1ca70cede516f95f60a18e8d26ad243b8
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: refactor device list and file header comments

This commit refactors the Kconfig device list by sorting devices by channel
count and removes device descriptions from the file headers. It also states
in the commit message that AD5337R is being omitted.

> AD5337R is ommited as it does not seem to exist, i.e. its documentation c=
ould not be found.

[Severity: Medium]
Is the removal of AD5337R incomplete in this patch?

The commit message notes that AD5337R is omitted, and it was removed from
the Kconfig text, but the driver still registers the device.

For example, it remains in the i2c_device_id table:

drivers/iio/dac/ad5696-i2c.c:ad5686_i2c_id[] =3D {
    ...
    { .name =3D "ad5337r", .driver_data =3D (kernel_ulong_t)&ad5337r_chip_i=
nfo },
    ...
}

It also remains in the of_device_id table in the same file:

drivers/iio/dac/ad5696-i2c.c:ad5686_of_match[] =3D {
    ...
    { .compatible =3D "adi,ad5337r", .data =3D &ad5337r_chip_info },
    ...
}

The core driver also still exports its chip info structure:

drivers/iio/dac/ad5686.c:
const struct ad5686_chip_info ad5337r_chip_info =3D {
    .channels =3D ad5337r_channels,
    .int_vref_mv =3D 2500,
    .num_channels =3D 2,
    .regmap_type =3D AD5686_REGMAP,
};
EXPORT_SYMBOL_NS_GPL(ad5337r_chip_info, "IIO_AD5686");

Should these entries be removed as well to fully drop the device support?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-ad5686-ext=
end-dev-support-v2-0-cfc2b30ce988@analog.com?part=3D3
