Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE536361DCA
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543059; cv=none; b=IkBPK/SZfzW+os+LBCNnoHDNJh5vqo7T8VrFkAnvpXe+Sdv6ciESsCTUwDiHrebAgVFM6TBeqQWIcp29WSLIw/KdOMZYtuoha239ecSmE2dlxoRDZAD4dqldRmtGDE+xrPEkrwJ/MZnFFTW80oXHoQo46sNaK4FpK52l/vuWA0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543059; c=relaxed/simple;
	bh=oDpdu83rUxGjNfVJ5E0LNpPZhnsEKNq+98RMOSM6HfA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FPPoKoSVKKSwaSM6reeFLV4oyUKTqC5V0CLZVdaYooOx2U5ywZA20X6ABmCrQyTOYML2OuS44QyimF8C5tsVSU2vGoihPokBnQFH4K4jHX/NiO3Uq4tY4hRLwiH74rezV3HlLSUZeyl4c3O0Rg+SdxuqFc58Oe9W8VHY6P/kCY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIPCRZUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIPCRZUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F0BC2BCB0;
	Mon, 11 May 2026 23:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778543059;
	bh=oDpdu83rUxGjNfVJ5E0LNpPZhnsEKNq+98RMOSM6HfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DIPCRZUbEinsBMw3aNtYkju0vnD4TCYqyqPqKL4LEiVSH2N/ub7nFtT9w+Bcp2j/x
	 HTXWLjLdkeZXCTi6Re9AuSbUPArIRTmZzWnwfNcqSD20Nl3Ff9D5Xca6Satr7WHJM8
	 ZwMR0Mtl8svaNb9lXkRzvT95WF9wMiKRjWxwTzSO4FG5xhV1EHuhH8xDVL9sgRB0J0
	 lTP6+bfvlwmwG5qH31JyP/5HABCo8bVRTZMCiC9o/+e1lNFmVxV9Q86o7vEdiTcTnW
	 Yvihj/BVg50cYjhcn0dfPbhXva3Z393TPJOPpNnOoxp09b2nf3Glyeyegwsftj5IrA
	 gtftprYy8C3VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 10/11] docs: iio: add documentation for adf41513
 driver
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260510-adf41513-iio-driver-v12-10-34af2ed2779f@analog.com>
References: <20260510-adf41513-iio-driver-v12-10-34af2ed2779f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:44:18 +0000
Message-Id: <20260511234419.35F0BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The documentation example for 'High Resolution Frequency Control=
' contains an inconsistency that actively misleads users about achieving su=
b-Hz precision.
--

commit b24787f890c3b4daf22d09c32612a52b6731f5a4
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

docs: iio: add documentation for adf41513 driver

This commit adds documentation for the ADF41513 driver, describing the
supported devices, operating modes, and providing usage examples for
frequency control and monitoring.

> diff --git a/Documentation/iio/adf41513.rst b/Documentation/iio/adf41513.=
rst
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/iio/adf41513.rst

[ ... ]

> +4.2 High Resolution Frequency Control
> +-------------------------------------
> +
> +Configure for sub-Hz resolution and set a precise frequency:
> +
> +.. code-block:: bash
> +
> +    # Set resolution to 0.1 Hz (100,000 =C2=B5Hz)
> +    root:/sys/bus/iio/devices/iio:device0> echo 0.1 > out_altvoltage0_fr=
equency_resolution
> +
> +    # Set frequency to 12.102 GHz (1 =C2=B5Hz precision)
> +    root:/sys/bus/iio/devices/iio:device0> echo 12102000000 > out_altvol=
tage0_frequency
> +    root:/sys/bus/iio/devices/iio:device0> cat out_altvoltage0_frequency
> +    12101999999.980131

This isn't a code bug, but does this example contain an inconsistency that
could mislead users about achieving true sub-Hz precision?

The narrative claims to demonstrate 1 =C2=B5Hz precision, but it configures=
 the
resolution to 0.1 Hz. As a result, the readback value shown
(12101999999.980131) misses the 12.102 GHz target by 0.019869 Hz (19,869 =
=C2=B5Hz).

This discrepancy shows the driver correctly satisfied the requested 0.1 Hz
(100,000 =C2=B5Hz) tolerance, likely by falling back to the lower-resolutio=
n 25-bit
fixed modulus mode rather than switching to the 49-bit variable modulus mod=
e.

To actually achieve the advertised 1 =C2=B5Hz precision in the example, sho=
uldn't
the resolution be set to a much smaller value, such as 0.000001?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-adf41513-i=
io-driver-v12-0-34af2ed2779f@analog.com?part=3D10
