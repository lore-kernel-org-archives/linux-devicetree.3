Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF113C661D
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043511; cv=none; b=RNSq/W/S8dPCDt21YEwChVYxNHvsuE6zlvDITZInm5drfn3JEwSd7/+vs5nxTav0ZuTYGhNchGLBP5sd+1CIy7ae1d9bfjI4RmSIPfyZP3uR5yupNOwjdm6wExBXQ++UoAyaiFO6ZIBPnhwgjrpd7Gf2P+AK3XwL7E0W+IRufLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043511; c=relaxed/simple;
	bh=VBnYIXE/jRrJI/iQwBwkm0+ju/A1ytmEAQdA7tkrQzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RnnYd6e+rbY++DYy5aeT38Vwxyrz1MopaTFjTMExqLvpuB9EItjp/N8tAVfNlkWFsEnavNfMgiOXTsJa1RhKDDoOKO20ZAuC34gN9vKQIPL//IJEhEQq4yh8yL5KmHYYfqBd/UGFTP9Imyj7VN2M6SgJPfAuE5QmWRD4937BiTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5mRsG4b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5mRsG4b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35ACC2BCB0;
	Sun, 17 May 2026 18:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779043511;
	bh=VBnYIXE/jRrJI/iQwBwkm0+ju/A1ytmEAQdA7tkrQzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=I5mRsG4b8YbRk/t3SNeOqNrYgj6fpabviyhgg2+7kXIQzXPgf42Uk4dIqYNeeDCTh
	 ehWl6JJxUIhzq3x3qrYilm5XC4iYPaZ5k3mxywdwUD2aE8qc5Q4Wrkll+UVwbkUdjG
	 0S8ywdPqcnUxMOJ6kN3CGv1sMIh6mn9iYaJ0TZh3QtlR9LuPN754QE1ZRUMUFhLII2
	 TiX38xCwAQcltP6cWP1KVZ96ZHIs1syYOXyRJBmrfx+HFNU4NHIHCiFtOhfUmCJEqS
	 Y9iWoMsI8y1hU0A2WhE31kn4Iwf9s022Yd4KUliKdIhGERjYjHQKjS/LeL/yHhg3zP
	 jeb8FmbLWHlCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/13] Documentation: ABI: testing: add parent entry
 for iio channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260517-ad9910-iio-driver-v5-4-31599c88314a@analog.com>
References: <20260517-ad9910-iio-driver-v5-4-31599c88314a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 18:45:10 +0000
Message-Id: <20260517184510.B35ACC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Fragile UAPI design using optional, non-unique labels for channe=
l hierarchy.
- [Low] Grammatical error in the ABI documentation description.
--

commit f761a355fe0232b081f1443ebe1a92190c5be5cb
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

Documentation: ABI: testing: add parent entry for iio channels

Add documentation for a read-only sysfs attribute that allows to expose
parent-child relationships between IIO channels.

> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/=
testing/sysfs-bus-iio
> index 925a33fd309af..399944974e34d 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -2118,6 +2118,19 @@ Description:
>  		specific attributes. This is useful for userspace to be able to
>  		better identify an individual channel.
> =20
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_parent
> +What:		/sys/bus/iio/devices/iio:deviceX/out_voltageY_parent
> +What:		/sys/bus/iio/devices/iio:deviceX/in_altvoltageY_parent
> +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_parent
> +KernelVersion:	7.1
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Read-only attribute containing the label of the parent channel

Would it be more robust to expose the parent channel's unique sysfs base na=
me
(e.g. in_voltage0) instead of its label?

IIO channel labels are optional strings and are not guaranteed to be unique
within a single device. Relying on them might create an ambiguous UAPI, as
the relationship cannot be exposed at all if a parent channel does not have
a label.

> +		for hierarchical channel relationships. Only present on channels
> +		that have a parent channel with a valid label. This is useful for
> +		userspace to organize channels in tree-like structures that reflects

This isn't a bug, but there is a typo here: "structures that reflects" shou=
ld
be "structures that reflect".

> +		the physical or logical relationships between them.
> +
>  What:		/sys/bus/iio/devices/iio:deviceX/in_phaseY_raw
>  KernelVersion:	4.18
>  Contact:	linux-iio@vger.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-ad9910-iio=
-driver-v5-0-31599c88314a@analog.com?part=3D4
