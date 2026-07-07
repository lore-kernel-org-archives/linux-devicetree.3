Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DFD3E5A01
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441066; cv=none; b=s9yMc24sm5iWMnnhjmhtBF2eu1tFvaKt8Pt01bgli+0BRhdWXp07AtYpP5gMsZdpXt5Ur+zjI7RWoWPKEWrHlGULEVL6i02+9SG4MglRYbYY3Lah3c+V6/2EzsuffIpnPb/NKirzW3DtSU2yVTyZ0+sBxs2FI2yqHUaoCh12XMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441066; c=relaxed/simple;
	bh=hArr/PSt1vtN/x7OS7H8FAjSt8jJwbzMeoHDddix3qs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J2xV7fbhynCwhWHlQuS61rNvlVb1zqHUhA1KhYeE7t5yAHO9oF58ExaKqAtGZaY4aWGB06MDUsU7P6U/Wtf0z7RKdHygsMy6IPjr63QpDH/WjCZsTfqTTwBOykmzOZ5s6/Qj+yV3gfZJzdOEvMXad1EXtDbKb0LxhUL9LsnxKkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMlb++6G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMlb++6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0286B1F000E9;
	Tue,  7 Jul 2026 16:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783441065;
	bh=fTWNHNWIWtsQEt+NQhvnyHYw91RCga+lUYtBcuk1QZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IMlb++6GvGJ9yTQUAawAgQki09rK7W+aW7sUxFDJOVA1hI8OFyJc/kY9PFvT3dckk
	 0gffoot4/5njUrJsuRYIXQkeYKpBTR7s8PvvcrlSrUNINqnc16gP4pNszVGjS3CVOo
	 gUUZonJ72sR4Fj+cFtk8x5USXCxoKNEQGecElJTQzcCASZl8QL2Bo+JW7NlxYb8QL+
	 /aV3eMcSpDHxeai8YyJ0zZr2HQqoO4sZ/eT0BlfH3HpookHzYymmRASnEDX7Amvpct
	 mjc5eoPrchlR783q02rlrMx4pj1kZiPkSmHf2a62QVZkgV1hWgK8wU/Q2Wz1HUMz7q
	 oxQk3AQ+kMvqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 17/17] docs: iio: add documentation for ad9910 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707-ad9910-iio-driver-v7-17-a4ec30f63700@analog.com>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
 <20260707-ad9910-iio-driver-v7-17-a4ec30f63700@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 16:17:44 +0000
Message-Id: <20260707161745.0286B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing newline at the end of the newly added documentation file.
--

--- Patch [17]: [PATCH v7 17/17] docs: iio: add documentation for ad9910 dr=
iver ---
commit 96ab956a41cf5e3619f02b259c8c1dedbd083c07
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

docs: iio: add documentation for ad9910 driver

This commit adds documentation for the AD9910 DDS IIO driver. It describes
the channel hierarchy, operating modes, attributes, and provides sysfs ABI
usage examples.

> diff --git a/Documentation/iio/ad9910.rst b/Documentation/iio/ad9910.rst
> new file mode 100644
> index 0000000000000..ab5223c70c01a
> --- /dev/null
> +++ b/Documentation/iio/ad9910.rst

[ ... ]

> +Power down the device:
> +
> +.. code-block:: bash
> +
> +  echo 1 > /sys/bus/iio/devices/iio\:device0/out_altcurrent100_powerdown
> \ No newline at end of file

[Severity: Low]
This isn't a bug, but could we add a terminating newline to the end of this
new documentation file? Missing EOF newlines typically trigger checkpatch
warnings and violate standard file formatting conventions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-ad9910-iio=
-driver-v7-0-a4ec30f63700@analog.com?part=3D17
