Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0992548986F
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785580230; cv=none; b=qAlGBUmmMsPtIQIgXlUD5AI8yruHyB8aG/teLxHxar6YAuqZyrVGvUcyZa933VbWA+9XhcW4peg3lYvCGQe2qWAcmRsPYy959EiIaO8AgjawdhjGP39LQHi3d6tANTeh/BKXPjt5k5goW9BCvDbrj0L3QHZHdLuYsWhUfsvs85M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785580230; c=relaxed/simple;
	bh=tW3dnDyOCLjnceyyNadHdZgTU93vYSpeSy1aramD7tQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RiYRUuLBcvf9DXWEPeIjahMcoUd8lSvmFbzyLa6+fsi+5FcvRRiRCO7eDWhLJnyTnJpmT2FLe91ZT723NYq+JqeirZ51ncGm14RG6akneeFQyuInDBMhOuGZ0P5o70Y6dN5jp48iaEZWRkzuSsdrOqbSRBnig9uAFyDGcc9sBCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfxzer4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfxzer4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576A11F00AC4;
	Sat,  1 Aug 2026 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785580228;
	bh=o1++qi9Ui/1vKqxB24qzATumnBdnQL7pe2tHXw2R18s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lfxzer4GBxLqVK+fQYguj+1TAkDqpnvolKZ3u0+9fZCrzuaqUdb7Z9u/WgMKENA6G
	 +XSaYkzMxyHegSZwg0lCS4HmzfPsiPDZRgrVQTURsfvXOHVytHa4uLeWjydoE8NNcd
	 6lFLDSJazRGM5mL8CPeR+QutrNGmcQ4FZMjbOSGdIT5uEml9Wk1M30tz/BCPYvFHK8
	 SMVD0qU6mxCs7X2Y90b7SIToLVn1lmKm23iQ7gU/2FHyoeqmbwV7J5BFzKjMbgrs38
	 eBUbZSPgqcqi5Uh0nGcbuVL+AphmO2YpUYUGZp/J1rlIUu+Ul30tdfxC5CWwybF32t
	 QGXUY8kKyZ5wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: adjust display status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Robinson" <pbrobinson@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260801102000.551644-1-pbrobinson@gmail.com>
References: <20260801102000.551644-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 10:30:27 +0000
Message-Id: <20260801103028.576A11F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The top-level `vc4` DRM master node is disabled in the SoC `.dtsi`=
 but not re-enabled in the Raspberry Pi 5 board `.dtsi`, completely breakin=
g the display pipeline.
--

--- Patch [1]: [PATCH v2] arm64: dts: broadcom: bcm2712: adjust display sta=
tus ---
commit b39f5cc8783fb43e147088a4ba5ca6fbab8b9d6c
Author: Peter Robinson <pbrobinson@gmail.com>

arm64: dts: broadcom: bcm2712: adjust display status

This commit disables the display IP by default in the BCM2712 SoC device
tree. It then re-enables the required display components in the Raspberry
Pi 5 board configuration to allow display output when desired.

> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arc=
h/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> index b7a6bc34ae1ab..51c8533f31812 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi

[ ... ]

> @@ -250,6 +273,14 @@ &pcie2 {
>  	status =3D "okay";
>  };
> =20
> +&pixelvalve0 {
> +	status =3D "okay";
> +};
> +
> +&pixelvalve1 {
> +	status =3D "okay";
> +};
> +
>  &v3d {
>  	clocks =3D <&firmware_clocks 5>;
>  };
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/=
dts/broadcom/bcm2712.dtsi
> index 761c59d90ffc9..9b36ecd7bba54 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi

[ ... ]

> @@ -667,6 +676,7 @@ v3d: gpu@1002000000 {
> =20
>  	vc4: gpu {
>  		compatible =3D "brcm,bcm2712-vc6";
> +		status =3D "disabled";
>  	};

[Severity: High]
This disables the top-level vc4 DRM master node at the SoC level, but looki=
ng
at the overrides in bcm2712-rpi-5-b-base.dtsi, the corresponding &vc4
enablement seems to be missing.

Since the other display subcomponents are being re-enabled, does the missing
status =3D "okay" for the vc4 node completely prevent the display pipeline =
from
probing on the Raspberry Pi 5?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801102000.5516=
44-1-pbrobinson@gmail.com?part=3D1
