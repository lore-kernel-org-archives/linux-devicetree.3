Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0683B37FF44
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709266; cv=none; b=Ymef14bwIeR3c/aMBk1+eNM6YxOFdTufcVVzlHMKoyOGi5c4yYy2TDuTMKVXaYRoTosJV7t5uWAi5qLWARetS05E3HbXBq3k5a2ApWJAc3VM/vsoluEhvq8nbh6uzo7yLKPgrGoTAtlCk1FOhjF4aGFV/xW9nMLyeGPTbNdBbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709266; c=relaxed/simple;
	bh=9kJghh+kFOC7vPikt520bUNLL0u14h5cPfYz9NaBpRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fhEfywUHjPffdkyGUx0kqUDWwRJ/S0xEziZaKrB1ix3kOMaSXzYQcUhUHIaoixm8S0B4agnuFRGBZ8l4ly6R3IRI542PKnhn0IiF7U3SnAgxbuKwVaXNOX3HZ1r/Qe0DzxQZMMxitt6Jck+qUA2JVQ9zDCAkwgqHzNWTqSDgfF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXXLNUMV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXXLNUMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682B21F00A3A;
	Mon, 25 May 2026 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779709264;
	bh=DsbO3vVtHEUahvJgSKSAHoVdSUWotUjxUopEwXWoWpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QXXLNUMVp5YIXS66WraYn0RgRf0kUObgUsrz7SLJYUkKCs+WahEiojy7PQA1tYcdQ
	 1BeXuPXl+jnsd7JLFX2EmnP5VbYTc+WOEjgPbVH98LpUImzK4e7ukN/y6NGgpbfjIU
	 FGv1lSBivOIHa5X3J0gVTjXBNkOm+P5T02rKd+jbTDt8lmSmoY4jS3+qJ8YQ/smilX
	 T/DF5SPBzaq6IWsZrQKb+eWi6/VUH+QZ2UP208PZas1Cjkbx83r/O80ep6GmpFWpN8
	 KshlQdFKIWevk382sNTlAttW92aNQ0YKkExWNjeWHvra8zfbbGipv5YCAGdhJzjawJ
	 QgFJ3o34ah0pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/8] arm64: dts: renesas: rzv2h: Add audio clock
 inputs
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260525110603.4018170-4-john.madieu.xa@bp.renesas.com>
References: <20260525110603.4018170-4-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:41:04 +0000
Message-Id: <20260525114104.682B21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Newly added fixed-clock nodes use a deprecated naming convention th=
at will trigger dtbs_check warnings.
--

commit cf2cd1c875fd06adde5a2a08dd0af97c4fa1ae15
Author: John Madieu <john.madieu.xa@bp.renesas.com>

arm64: dts: renesas: rzv2h: Add audio clock inputs

This commit models optional external audio clock inputs as CPG input clocks
for RZ/V2H family SoCs, allowing the Audio Clock Generator (ADG) to derive
internal audio clocks. The clock frequencies are left at zero to be overrid=
den
in board DTS files.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g047.dtsi
> index 95a4e30a064d1..eedc5bb933b7b 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -14,6 +14,20 @@ / {
>  	#size-cells =3D <2>;
>  	interrupt-parent =3D <&gic>;
> =20
> +	audio_clkb: audio-clkb {

[Severity: Low]
Will this node name trigger dtbs_check warnings?

According to the fixed-clock device tree bindings, node names should match =
the
pattern '^clock-([0-9]+|[a-z0-9-]+)$'. The "audio-clkb" name falls under the
'any name allowed' fallback, which is explicitly marked as deprecated in the
schema.

While this matches the style of the pre-existing "audio-clk" node, adding n=
ew
nodes with deprecated names might not be desired.

> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency =3D <0>;
> +	};
> +
> +	audio_clkc: audio-clkc {

[Severity: Low]
Will this node name also trigger dtbs_check warnings for the same reason?

> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency =3D <0>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525110603.4018=
170-1-john.madieu.xa@bp.renesas.com?part=3D3
