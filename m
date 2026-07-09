Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695603A718D
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590105; cv=none; b=Bie1R35sGaTz+cJ7A9shjdttYeva/S9hd2lO0jRKsare/oNEwoVKn+Z/mUm3fyEqUEZyrqndhqkeFqSJ2mas9NC5YokpUhIgCNGGlpoyiZ4EoRqGa7tTqdSs/xcbuQpDlWHS8O/MKvdYbMFkGlfUeBAf5xDnDvcRbV6ZoHienYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590105; c=relaxed/simple;
	bh=vtbqPBDquYy8Lp3NK0DpFrtFFw0g3WVmLGgHiqZws4k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GuyLFvjIlyQfjJz65uQVYyOX+Nl+l6aP6D6HkBdE+TMqraj1Ct8i9SekWrdKMckQcaLgPChqydUayqduyULoxabfVix3qYAeWDUBBx+KUJbsvMfIFQFPVJ+m0bimNWbzpvDdI8eOKEy6/FCO3T1ZS+Bd3XRWnXte70wGT73Ndpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUj1KFNy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUj1KFNy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63291F00A3A;
	Thu,  9 Jul 2026 09:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783590103;
	bh=2MZrSsA4UchXIaHFeuaIm0LzANa+dYkGrG6JpnW1cQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bUj1KFNyfNCZKT0CXi5hO2+jRpq1fe2UP0LwfXKaCMrNR51qvYy+z3Fww9THnZv/R
	 BhGQg2fZlL3PNgR4NfNX8w+fGN8zye5ySSClnW7KbZlP453Vd2cLFVikSzS+E7EUmL
	 rlP7JQF4M6GvdXbN5GtAWi9CSMr3Be7AEA/IGXSSGXVGw+hCzb7i2PJXT/p9dTFpnK
	 Suwy83M+nVes3gNZENwcb3xcyCGeFQ8L2SiEPV5c90d5Uy5xAKC/cVsG/l34QElBSH
	 PnPsSMEKeKmbun23FnNqPnS6e/2xB7a6JWAgh+RVe3wt5Bog8fI+OHJZWr0BtWWEgf
	 i4rKLIl/zaq3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] Documentation: iio: Add AD7768 Documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-ad7768-driver-v1-6-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-6-44e1194fd96a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:41:42 +0000
Message-Id: <20260709094142.B63291F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The sysfs attribute ``in_voltage<N>_filter_type_available`` is spli=
t across two lines in the RST grid table, which will introduce an unwanted =
space when rendered.
--

--- Patch [6]: [PATCH 6/6] Documentation: iio: Add AD7768 Documentation ---
commit 14bceb1fc9d8c59930a466f42580515ee4eaaf95
Author: Janani Sunil <janani.sunil@analog.com>

Documentation: iio: Add AD7768 Documentation

This commit adds driver documentation for the Analog Devices AD7768 and
AD7768-4 ADCs. It covers supported features, power modes, data output
configurations, and IIO device attributes.

> diff --git a/Documentation/iio/ad7768.rst b/Documentation/iio/ad7768.rst
> new file mode 100644
> index 0000000000000..438e33d4f3759
> --- /dev/null
> +++ b/Documentation/iio/ad7768.rst
[ ... ]
> +Filter configuration
> +---------------------
> +
> ++---------------------------------------+-------------------------------=
-------------------------------+
> +| Attribute                             | Description                   =
                               |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +| ``in_voltage<N>_filter_type``         | Current filter type for channe=
l N: "wideband" or "sinc5".    |
> +|                                       | Channels assigned to the same =
mode profile share this value. |
> ++---------------------------------------+-------------------------------=
-------------------------------+
> +| ``in_voltage<N>_filter_type_          | Available filter types for cha=
nnel N: "wideband sinc5".      |
> +| available``                           |                               =
                               |

[Severity: Low]
This isn't a bug, but splitting the inline literal across two lines in
this RST grid table will cause Sphinx to insert an unwanted space. Does
this result in the sysfs attribute being incorrectly displayed as
in_voltage<N>_filter_type_ available in the rendered HTML or PDF output?

> ++---------------------------------------+-------------------------------=
-------------------------------+

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ad7768-dri=
ver-v1-0-44e1194fd96a@analog.com?part=3D6
