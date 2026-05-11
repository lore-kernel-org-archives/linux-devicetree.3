Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6254E4D90D6
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537107; cv=none; b=XbWCaXPgtADf71UT0S0XP0TtKZV6DlIidfJszaLo90nFzT4WFHrf6gTaTWXKAjEYa9w/dzk+LEqpnvA+5xfewK66IZe8EB5eDVXtqbVhTzO9dtg3SAZMANbRpnZ1d+R7pKIrrjGx8O+069VPa0dmW+2cF4VFmPB2OFLRN8x12DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537107; c=relaxed/simple;
	bh=sBLrWRjLEnHMazQVQZf+AXsv0V3GIkijwZjwt1731BY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZflSTCLe3ZM9rmcZ4aTaB6cyAPYH3oc5pr5bWHEWAYtJ/J3+egfslwEkzcc+5m03IWHN3siRvlB7XRyHu6uHahA5rTD3WQbCV8ygzw+HozGzTXHyOgw/35MjFMIod0tfy7o7grbKwksA159au8PuJ7yH9+d/dFNhWCSz5cF+Gsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0WbDqL2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0WbDqL2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54B0C2BCB0;
	Mon, 11 May 2026 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778537107;
	bh=sBLrWRjLEnHMazQVQZf+AXsv0V3GIkijwZjwt1731BY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=S0WbDqL2QQKreyPqgda8PpeHbXD81zvgvvnH8UZsKfimxvzUg9StdfConOK35KOYx
	 Re+VtXxKEns7UFlAoSXvP/7nesQDPYdXGV3hCIScFpaRFzky3e/yr3HsR8nFNOrjaI
	 d/Cbsi8ZgfCnRVfWO0WumbaiyHf3Yo2mGrRnDyvA1WCKu8h0mZDGwy13tm5TIoGMi7
	 kW/SFf5A0UHxb4V8CN7vViGRz3Kg6jd32eBlp9wQdjPYRVp74v/a4WR7wzPoSGD8e/
	 I4INGWfbWCHES0qygjOc2n5plyPmPmRdMnPBy1wSN4+uYOBtPU0MMHClBlwpjE2htz
	 gjLs0BGMweD/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: add Rohm BM92TXX Type-C
 controller
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511-bm92t-v2-2-2145e4f4386b@gmail.com>
References: <20260511-bm92t-v2-2-2145e4f4386b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:05:06 +0000
Message-Id: <20260511220506.C54B0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Missing type definitions and non-standard unit suffix for `rohm,pd-=
*v-current-limit-ma`.
- [Low] Invalid Devicetree property naming with underscores (`pd_bat_chg-su=
pply`).
- [Low] Use of deprecated singular GPIO property suffix (`rohm,vconn-en-gpi=
o`).
--

commit 482fd67d1e5e9ceafc592495c4e2a23d21e35b0e
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

dt-bindings: usb: add Rohm BM92TXX Type-C controller

Add the device-tree binding documentation for the Rohm BM92TXX family
of USB Type-C and Power Delivery controllers.

> diff --git a/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml b/Docu=
mentation/devicetree/bindings/usb/rohm,bm92t.yaml
> new file mode 100644
> index 0000000000000..007f70a8f5bb1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml

[ ... ]

> +  vbus-source-supply:
> +    description: VBUS source (provider) regulator.
> +
> +  pd_bat_chg-supply:
> +    description: Battery charger regulator gated by Power Delivery state.

Does this property name violate Devicetree naming conventions? Devicetree
properties typically use hyphens instead of underscores (e.g.,
pd-bat-chg-supply).

> +
> +  rohm,vconn-en-gpio:
> +    maxItems: 1
> +    description: GPIO controlling the external VCONN switch.

Should this property use the standard -gpios suffix? Even for a single GPIO
line, the standard suffix is -gpios rather than the deprecated -gpio.

[ ... ]

> +  rohm,dock-power-limit-disable:
> +    type: boolean
> +    description:
> +      Disable the lower power limit applied when a dock is detected.
> +
> +  rohm,pd-5v-current-limit-ma:
> +    description: Charging current limit in mA when 5V PD contract is act=
ive.

Does this property lack an explicit type definition? Custom properties with=
out
standard unit suffixes require a type reference, otherwise schema validation
will fail for integer array values. Also, the -ma suffix is not a standard
unit suffix (such as -milliamp or -microamp).

I see this schema validation failure is fixed later in the series by commit
315ea48f16e75d9fc77bc6e2af87cacc47b7249f ("dt-bindings: usb: fix properties
type").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-bm92t-v2-0=
-2145e4f4386b@gmail.com?part=3D2
