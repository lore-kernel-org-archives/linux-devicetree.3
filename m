Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482623D25DD
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786900; cv=none; b=UVFzSA3UWpLa+o9JcR7ArXLMaqgPqvrVEZUCKMdzobIQcvE3knelqFOCiMErSb8gpg4n4h/aWT0RB0Xr/+YqVlHwwFWvD5cSd+ol4Te4HbTGYZLBBI3uKYs9xLtheFxf3kkrqQwAhEEuFKcH8+9K35XejHJ05deLPDumAX32k/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786900; c=relaxed/simple;
	bh=DJL95nKDXE1o5NMG3aU99oWpXgrgG579jHm+yDf9GYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W/Hhbm552npJUggKbE938TTKEJisQx5hrDCqWtNIOeFo2ut7n2FC0PX3N+Zw1XSecUkK7zaF0b8mdVIZvl7xsMLJzQHTYNm4C6UpB55nSiieYUCp1yxeW2vnkGhwDNDBJLaTNRRjr4AYQuivKv6Az9A7+iNXYbMihToqfK/GcyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=kh0+m+IT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="kh0+m+IT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1779786894;
	bh=hmKWSVYAeX10VPM8iTfTYEFLAHsIwW+5Ei73jSt1qjI=;
	h=Date:From:To:Cc:Subject:From;
	b=kh0+m+ITzPhElb1zQ91kjxCg+ykQ/XSx7i/O6qnAw9Q63fWbeiE2Hj8AkihujDtiY
	 epNRdGumgX0bT1QNuPyOIyFWdPrJp3eCL98qM5pim2jBDuFeVCwtYfrcWAFFenHvlw
	 Lu0ikWs3AdQQ9RqPbpW+MSjEtv7JTmGPd+4TRRGubpJqPh1AWzd2erS4fRfwsRsvst
	 VXlBTJxfvnhshO3NgDNNXAinhe7vo1wSGlOEGKnzpUpE7SixN3UhCQI0C8tj6CwmpQ
	 8uZ4wQLQkT970CpjqT08mLz/zrm5yaAU+iYwLn8Ogc9+jTDYvSHdiea4stQ9FDkOWC
	 4LU34RjxQdTlQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4gPnC23dq3z4xHL; Tue, 26 May 2026 19:14:54 +1000 (AEST)
Date: Tue, 26 May 2026 19:14:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: deviceree-compiler@vger.kernel.org
Cc: devicetree@vger.kernel.org
Subject: DTC 1.8.0 released
Message-ID: <ahVka0oWJ3RApioU@zatzit>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8faiXFy08h7vGmA4"
Content-Disposition: inline


--8faiXFy08h7vGmA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

DTC 1.8.0

Changes since v1.7.2 include:
 * dtc
   - Add informative error for stray identifiers (e.g. unexpanded macros)
   - Better decompiling of plugins
     - Restore labels from __symbols__ node when possible
     - Restore phandle references from __local_fixups__ and __fixups__
       when possible
     - Improve type guessing when compiling to dts format
   - Add only new data to fixup nodes instead of complete regeneration

 * libfdt
   - Add fdt_setprop_namelen() and fdt_setprop_namelen_string()
   - Add fdt_get_property_namelen_w()
   - Add fdt_find_string_len_()
   - Introduce fdt_downgrade_version()
   - Verify alignment of sub-blocks in dtb
   - Handle FDT_NOP tags before FDT_END in fdt_check_full()
   - Document most remaining functions in libfdt.h
   - Standardise "returns:" annotation in documentation

 * checks
   - Warn about missing #address-cells for interrupt parents
   - Relax avoid_unnecessary_addr_size to allow child ranges properties
   - Fix detection of 'i2c-bus' child node
   - Remove check for graph child addresses (redundant with schema validati=
on)
   - Do not check overlays for alias paths

 * fdtdump
   - Remove overly strict dtb version check

 * pylibfdt
   - Fix backwards compatibility of return values with SWIG v4.3
   - Port python bindings to build natively via meson and meson-python

 * Build
   - Deprecate Makefile in favor of Meson
   - Support building libfdt without static library
   - Don't build test programs by default
   - Fix -Dtools=3Dfalse build
   - Add FreeBSD and non-GNU linker compatibility

 * CI
   - Add macOS build to GitHub Actions
   - Add Cirrus CI for FreeBSD testing
   - Add GitLab CI for Linux builds
   - Update GitHub Actions ubuntu runner to 24.04
   - Skip swig install for mingw32 Windows build

 * Tests
   - Add compatibility with uutils (Rust coreutils)
   - Mark .so from asm output as non-executable stack (glibc-2.41 compat)

 * General
   - Consider drive letters when checking absolute paths on Windows
   - Add AI contribution guidelines
   - Assorted bugfixes and cleanups
   - Add clang-format config
   - Add SBOM file in CycloneDX format

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--8faiXFy08h7vGmA4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmoVZGEACgkQzQJF27ox
2GcPqw/7B5sUpD3pFEhlnNerryeEggt9OQnoWCGVp21BU3Ppn5XCt0xv+ELk9rS4
BLA3UlcaGxJE7t+lvRY7mdBmruhddVfu/eEZ2ZSrhlmn6J8QI33uTot1RJzbffDI
xhmwuDb4zKdewFddcwhoB4keNDVGdOdl+/8lkD1b4/TM9TF5zTK0JNnfjfIsfNFM
nD/+w+qU+zy7CdlGCf2bQkG5pabW46Wj6BRbHDuWg9CJ5J0plM4rPa4LAuVAbJdW
HLfXyb1hgTjBtyIlDU566HU+Sum0o8Al3v2HE6txMH6c5GWWyh7RrfGW6n28p6Pp
UQomCrUoOYFNubmHeX3JdHnn9UvieX65teoQCGybm0zpCL/vl3KDbe9SO71F8PYa
7RNZbiquekF6gzdlYuSQQe4FphggXiRo5kKllNuFTaCsht/j0vAHzK0AfIkRNhY0
sQadlxa8u4CRFa/1sBJaKK4N3+xFZJTZ61yMy6P8gtnYc2xAcUMeV/1UKUEdudO/
X1yZzP9Qqj02TiOVmZnCxZCxlP1nWRXg0yBzv/ikp/KvPUfn3VwMGImjP1JD1G2X
0sUUSBHG4EMYaH+sEQ8jnU+59FqID5wFm9+mK3UlS0hYmXlKd2MIukL4M9Exgq1X
jkj1u6pOIRjJ2+BID/rYFxFr4ovbZPgUxw02LgLtl38No8/fz8w=
=M8j2
-----END PGP SIGNATURE-----

--8faiXFy08h7vGmA4--
