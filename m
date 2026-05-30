Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2B384CD8;
	Sat, 30 May 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136875; cv=none; b=lOx9ShNMoGP+BX7XsGiqbeBUy61VEtx5WcOSs+rjVXf+qVUC3E7ZZe+EWAnhsC4ovxivZ+4LhPosXqfz5PSOM2A0cuDG0CcpPq0/KXkQo2vwwwL6tY6kzXbx99zgmCzgv4yDwO/0RX4jyx+8xv2TILsm85XmOYMhMsO46POwk7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136875; c=relaxed/simple;
	bh=xIGVJHDXpcmxVhUELeooaud4zDPbQF75EH7ok2C0qKU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=r2Hr/pCB02LEhbp0wxEEYv/bIDD/0iHt0Gs0kt6WNweDPsP9LO8XUiYcg8LouZeZrxvUw2b6kFmAuhUIOxJGHNzKs4Zx9hNQAMdF89/A33JYDY1eZJv+DUlt5XG9XSYFP8/h/m/LPUe/awrBmLTpSAClhUg3noC4CnI+LcO+GGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oAmTDck9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oAmTDck9"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:382:6f:8c15:9eec:bfe9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D74B7CA;
	Sat, 30 May 2026 12:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780136851;
	bh=xIGVJHDXpcmxVhUELeooaud4zDPbQF75EH7ok2C0qKU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oAmTDck9dwCihc7pzbDIKdz8iRU2fvIkyf5klsPbJbEo2bQoWutWjOqAbvjx11EMO
	 kzmpWVxdLzDD3jwk3Z8O3JU65RsXYRw0sOrMeWxR32/u/p4+P9cgIfLRZjRGl/7EWX
	 QB+ARSCp1VoEbTZG6g9aalF/LxOzNZX88nFBXm38=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260529144917.wp46oj6z3clarvft@blabber>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com> <20260515-beagley-cameras-v2-3-f6acb66c9995@ideasonboard.com> <20260529144917.wp46oj6z3clarvft@blabber>
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Date: Sat, 30 May 2026 15:57:47 +0530
Message-ID: <178013686712.933414.13519886286669092495@freya>
User-Agent: alot/0.13.dev20+g31692a239

Quoting Nishanth Menon (2026-05-29 20:19:17)
> On 06:46-20260515, Jai Luthra wrote:
> [...]
>=20
> > +&main_i2c2 {
> > +     status =3D "okay";
> Comes last.. please follow:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/dts-coding-style.rst#n117
>=20

Oops. Will fix everywhere in v3*

* just realized I was calling it v2 in other replies

Thanks,
    Jai

> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&main_i2c2_pins_default>;
> > +     clock-frequency =3D <400000>;
> > +
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +
> --=20
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource
