Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DBC2472B6
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781480859; cv=none; b=qPqw77elbUeH5wUUvwwDvHAWd1ORVo3HP00EOm/1jDy9CiDLlT/2GEHKS9Gsj56a+K2V5oo+yMNxmCpAmcyTteo6LcacmNtHERvxGFIfmmbXIvaIl6sAEjAgOS9a4zExG8A4VMkkmzm4d3AKLnt5XQGNTO7Up4urQn26pIfGR1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781480859; c=relaxed/simple;
	bh=vdkjQvKYlvtBrIDHGHHuOvVQfJhBD579GlytwraY8W8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o46X4AD+sUepsOvhwEdLJkv4B9rJcn5FL5+LtQcaR6dbWfGYKrQeM1lyMHp3c6/0NBPkt19OIPbLyG9q1cn4mVi+fotJ7naOszVuEvOADFWvs91chFN1+3TurE8TqqRW6svvbj/l9DncXBYaIjus8lFVPleXgs9z//2fZyF9wK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZGfiqAr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZGfiqAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127091F000E9;
	Sun, 14 Jun 2026 23:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781480858;
	bh=zySge7hxPChQbR1+1s3agDTrQ4Wzz21JWV9TwNqWqsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FZGfiqArIy1bUFaoUUVSX882WQJWweBbHyn7b9l5Zkd6twelaL/UiUwnrcsVbKEw7
	 CD9PIYwlIhlNJoGlCF3HDMDTcl0I76B6Z0rh7hzYdNCZg6s26EIYbDcyK2VEpHgOi5
	 33dGsj6EODU0sfUOo9oTEFtvFp2PqeENuDEivT6soqrnWEVLw00NFI4niYguBEqIKY
	 0rWpxhuKyJmlBmjNu7E7TmpDWz64vAQdcdOYQ/v7SqZkKswjTSXdnZPvIiVZ9oaemr
	 Gxj9FtgYXkPm7Y1qsLgFvXCn+MGC41qQgxUpkN6F0Ah4aIm61VBzCyEoTNR+VqD/cL
	 737HpA9YHhOEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/5] iio: adc: versal-sysmon: add oversampling
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260614233722.2603459-6-salih.erim@amd.com>
References: <20260614233722.2603459-6-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 23:47:37 +0000
Message-Id: <20260614234738.127091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Software cache for oversampling ratio is not synchronized with h=
ardware state.
--

commit 10aa21fe8c20849d9568e9f27df70f27c183249f
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add oversampling support

Add support for reading and writing the oversampling ratio through
the IIO oversampling_ratio attribute. The hardware supports averaging
2, 4, 8, or 16 samples, plus a ratio of 1 (no averaging).

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index 16feb373bc704..d9599a7bc8978 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
[ ... ]
> @@ -839,6 +988,8 @@ int sysmon_core_probe(struct device *dev, struct regm=
ap *regmap)
> =20
>  	sysmon =3D iio_priv(indio_dev);
>  	sysmon->regmap =3D regmap;
> +	sysmon->temp_oversampling =3D 1;
> +	sysmon->supply_oversampling =3D 1;

[Severity: Medium]
Will this cause the software cache to be out of sync with the hardware if t=
he
bootloader or firmware previously enabled oversampling?

Since these defaults are not written to the hardware registers during probe,
and the actual hardware state is not read back to populate the cache, the I=
IO
sysfs interface might incorrectly report a ratio of 1 while the hardware is
actually averaging samples.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614233722.2603=
459-1-salih.erim@amd.com?part=3D5
