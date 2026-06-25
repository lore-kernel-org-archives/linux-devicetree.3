Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDEF2571B8
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395580; cv=none; b=FO36+aEKawaNt2iD/PQI8ZlrGUJhlFRYLni7T1FjclcpqRXnvhAitRJ1kjD7A5RGXE6LJAos5KPbtWoULbBEr42PyIL22QQOpCHIW2SqNZg13plFTRjAEb1set0kydiWHk/75HsdWnN3qI3Nr+cFcXbfA2GZipovMPazbEUC82M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395580; c=relaxed/simple;
	bh=ScfhJIg+uuwPUyeZ/DUTb6f2xHuFz1mhT4Mx7fnADuA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HDnO7Ug0FA0ZxC0Fv4PWRGexu/wVHyYQY0cXJGkBbewXZG2v2X4BaS6xPDVTOsTvpsNaaLa6wfQ09dgZgtXJ3sRwCq/rY72yRRvDiV5Mms2qSfobF9jOaAXzJwHudAKNOcnhaLU+AQEmKb1962200Z9ClODbkPmYYWxZrIIYmXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qbdiewv+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qbdiewv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492571F000E9;
	Thu, 25 Jun 2026 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782395579;
	bh=ewFN2pDy9+b6dwpAcyV9TQ9DmkvHpzIPe3rLxDSfPRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qbdiewv+sjnMA5LnaiDT7nnN/R8WrCxkXJl3nytYy42iX5mcz68CnhVVvcycFoQ9+
	 RtP0HTgbcXFbR7Z71ptcWAjOLxu6QBPl6EutXYFwUU5BOcRUg+SBagQfPQQA3vo6rB
	 KGuf11pW46naYZRJHkwMpfB1VyQRn6IOaaaqX1Op0bJC6fhGg3w2kQeDVwT6x5biui
	 6AphJoeR5gMIYEPNzqq9XFN30zBo52k+cVNHGeYAOCkftXK+ZiSiB3uslA7HXQzNwn
	 GG9xNrcO2U8npljFyFrtvmmd0GWm/NyKfm3+dckDWSIBx+B42F0a1eo6IMft7jAhJV
	 bEXjkNOvPk4bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625133828.3221781-3-atanas.filipov@oss.qualcomm.com>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
 <20260625133828.3221781-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 13:52:58 +0000
Message-Id: <20260625135259.492571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The OPP node name `opp-600000000-nom` violates the standard `operat=
ing-points-v2` device tree binding schema.
- [Low] The `qcom_jpeg_enc` node is missing the `status =3D "disabled";` pr=
operty, enabling it unconditionally across all SM8250 boards.
--

commit 00630d0f1aab28af7917b8a2e9b6daedb6cc070c
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

arm64: dts: qcom: sm8250: Add JPEG encoder node
   =20
Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index 7076720413ab2..3d741179c9165 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4469,6 +4469,71 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		qcom_jpeg_enc: jpeg-encoder@ac53000 {
> +			compatible =3D "qcom,sm8250-jenc";
> +
> +			reg =3D <0 0xac53000 0 0x1000>;

[Severity: Low]
Should this node include a status =3D "disabled" property?

Without it, the JPEG encoder driver will unconditionally probe on all SM8250
boards that include sm8250.dtsi, registering a /dev/video node and allocati=
ng
memory even on boards that might not want this IP enabled. Other multimedia
blocks in this file typically default to disabled and are enabled per-board.

[ ... ]

> +			jpeg_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
> +
> +				opp-300000000 {
> +					opp-hz =3D /bits/ 64 <300000000>;
> +					opp-level =3D <0>;
> +					required-opps =3D <&rpmhpd_opp_svs>;
> +				};

[ ... ]

> +				opp-600000000-nom {
> +					opp-hz =3D /bits/ 64 <600000000>;
> +					opp-level =3D <3>;
> +					required-opps =3D <&rpmhpd_opp_nom>;
> +				};
> +			};
> +		};

[Severity: Low]
Does the node name opp-600000000-nom violate the operating-points-v2 device
tree binding schema?

Running dtbs_check will likely flag this or silently skip validating the
node's properties because the name does not match the enforced regular
expression for opp nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625133828.3221=
781-1-atanas.filipov@oss.qualcomm.com?part=3D2
