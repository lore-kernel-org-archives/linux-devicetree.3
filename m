Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841918A93F
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 01:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778289859; cv=none; b=X0VZUqyGCwte53K3qD7xTCGDrzEeEUY3K5K33x6kbvOWDQeHJpFqCo+qNaCQngbG08Y732oPHX7wU7J/5iAdkrRSzpLMzhBoa6MsQL5QbteNrSuWEeDm2RmmKO2YXXkRqEsgAFE9vcSykCX2lRI/JFAlpdQ/H620FO+Pj/FulGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778289859; c=relaxed/simple;
	bh=hqxVYh0cpp6UeLUg/C0hsorr0WIhhLJ2YbpaRBdGmqI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EDsv/2X1v+wCNvO5VoJb/wkVxTEOjpIZvLV9PIh40qfS3CXgabWQ85qLz1QPjErBjhvGHsgJLBbbZLkhxNlBTN47XsBxIpFMmZzckG1Bqg10kGr0Lo6lSoBDPhSRI28yrED8s2fOdq6x2rk+o8ZWsbIM93G/WEPA+8nUPhxD3Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNSZPrPm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNSZPrPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C61CC2BCB0;
	Sat,  9 May 2026 01:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778289859;
	bh=hqxVYh0cpp6UeLUg/C0hsorr0WIhhLJ2YbpaRBdGmqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nNSZPrPmgMdt1oKeZbbfFSHhOZQUNYCMK0dErgmNqg9llU9pGXSepgl6TU8z7wRQJ
	 uipzVrH0oxclgfFsetr+Ccv9SAuYjqN/StMBsLBzqHjWG9xYwOZDgXJU4QAQFRSI0V
	 7J8y5jESXvu8P5MBlCnWU8J20dMZpYDOW4EUARUPY0xizPP7/gN2GJy7dAMbnPN8Aj
	 cchaA8gaTYREEUSQtXE1qHpHU4MxpZ1WkSIehF8+qbUPjg4ugEZzLp2zKNCYB44wkN
	 1yyCJY9Boos8hQRhV7Rw20puLxEbRf2SVd/hsEkCErkVjG943yIV6K/95yyzGGnozs
	 tmHkVWgoXQv2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 09/10] Documentation: ABI: testing: add docs for
 ad9910 sysfs entries
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508-ad9910-iio-driver-v4-9-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-9-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 01:24:18 +0000
Message-Id: <20260509012419.4C61CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The newly added ABI documentation file omits the `Date:` field and =
leaves the `KernelVersion:` field empty for all entries.
- [Low] Awkward and confusing phrasing in the descriptions of multiple ABI =
attributes: 'is a result with the sum of this value'.
--

commit a42d44a5e6db95765e7fc42b4509b02bd033fda8
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

Documentation: ABI: testing: add docs for ad9910 sysfs entries

This commit adds a custom ABI documentation file for the DDS AD9910 with
sysfs entries to control Parallel Port, Digital Ramp Generator and OSK
parameters.

> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9910 b/D=
ocumentation/ABI/testing/sysfs-bus-iio-frequency-ad9910
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9910
> @@ -0,0 +1,73 @@
> +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_offset
> +KernelVersion:

This isn't a bug, but the Date field is missing and the KernelVersion field
is empty for this and all subsequent entries in the file. Should these be
populated with the creation date and the expected kernel release?

> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		For a channel that allows frequency control through buffers, this
> +		represents the base frequency value in Hz. The actual output frequency
> +		is a result with the sum of this value.

This isn't a bug, but the phrasing "is a result with the sum of this value"
is slightly confusing. Would it be clearer to phrase this as "is the sum of
this value and the input value"?

This same phrasing is also used below in the descriptions for
out_altvoltageY_phase_offset and out_altvoltageY_scale_offset.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-ad9910-iio=
-driver-v4-0-d26bfd20ee3d@analog.com?part=3D9
