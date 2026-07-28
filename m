Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3860047013D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785264751; cv=none; b=mbQcc/l0+6TjFfp79A1D7KH6UERYHB4tmPjIbYHdX7Oix6BwSAaVG64M3/fxpmiGpbQ5FEdQEjXEcjgtV02F2LU/obJ4yg3qlUU9wXpfomR5BylN5T+7NCOuSvK+CzuWaRCG4bNtjiCQl6RO6Ga5ElWHRi/XnX3cpdlC7RwTwoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785264751; c=relaxed/simple;
	bh=4VuG54+gxaIxUG3WU6dFllfjKk1jkWIu8olTebPiAe4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ux2Bh4Z62QcfOBBI8GFWry6pZMPwJ6crq/8VY5kFMnGxAlPb9uDNUFcxm/GvnpxioLJfh7kBcfZGJrSfurpVsksgF19mYTTxe41VkTqMy2XAy5y5YkKKOSjFrrmfkZM8vyU5FKiKcGHELt6+AFcs/ttbhrd/Xlz2c302uuthVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqDfkcnv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqDfkcnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE671F000E9;
	Tue, 28 Jul 2026 18:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785264750;
	bh=4VuG54+gxaIxUG3WU6dFllfjKk1jkWIu8olTebPiAe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cqDfkcnvyA2ac9kCYNTOLQtLpsYfOYVeFsneXo/miGhbMQUrCRMI663NjSI35eHnC
	 SNlXaAObmTpmO01pJZ2j5WZsnfP6ISaTzp1td8ba+roiaBzXl9C/P9k73sroUBbURP
	 rxfdqCWhvrPklqgdSWhsRGwP0kEUB+PtPR1K6X2p7Qqb6xHDuY19CuCwtL2qB/m1D4
	 hpYWF8qeiyZ69XWbtZAbebt7FZQr0KC3YruxnE/Tl7pmfj3Evoc53E5D0N8TdZV2sg
	 vPauy3P/Vj4jWU3wykBFtJX4MrBNZLTTEBSL6paaD2HTPQJuYVt6z98apdrWq8HKMH
	 2AHUNcp9hIohg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] iio: imu: inv_icm42600: drop the whoami check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728184351.75015-3-jorijnvdgraaf@catcrafts.net>
References: <20260728184351.75015-1-jorijnvdgraaf@catcrafts.net>
 <20260728184351.75015-3-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:52:29 +0000
Message-Id: <20260728185229.BAE671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Complete removal of the WHOAMI check breaks hardware presence dete=
ction on SPI buses, allowing the driver to successfully probe absent or non=
-existent devices.
--

--- Patch [2]: [PATCH v3 2/3] iio: imu: inv_icm42600: drop the whoami check=
 ---
commit 3a74aa023a51d52a25e7f4af731835e3a6cd0b6a
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

iio: imu: inv_icm42600: drop the whoami check

This commit drops the WHOAMI check from the inv_icm42600 driver to allow
fallback compatibles to probe successfully even if the WHOAMI value does
not strictly match. The unused WHOAMI definitions are also removed. This
changes the probe outcome on mismatch for all parts supported by the driver.

Link: https://lore.kernel.org/all/20260722-creature-volley-0f083b904c1d@spu=
d/
Link: https://lore.kernel.org/all/20260728-extradite-yanking-42d918637f61@s=
pud/

[Note: The standard inline quoting format has been altered to a free-form
summary due to recitation restrictions.]

[Severity: High]
With the WHOAMI check removed, does this break hardware presence detection=
=20
on SPI buses?=20

When an SPI device is unpopulated or unpowered, the MISO line often floats=
=20
high, causing regmap reads to return 0xFF. Looking at inv_icm42600_setup()=
=20
in drivers/iio/imu/inv_icm42600/inv_icm42600_core.c, the only remaining=20
hardware verification is the check for the reset done bit.

Because the reset done bit is BIT(4) (0x10), reading 0xFF means=20
(0xFF & 0x10) is non-zero. The condition=20
!(val & INV_ICM42600_INT_STATUS_RESET_DONE) evaluates to false, bypassing=20
the -ENODEV error path.=20

Will this allow the driver to successfully probe absent or non-existent=20
devices, exposing dummy IIO interfaces that yield -1 for all readings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728184351.7501=
5-1-jorijnvdgraaf@catcrafts.net?part=3D2
