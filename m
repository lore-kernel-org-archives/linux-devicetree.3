Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE771EA7DB
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198395; cv=none; b=DbFxdMpUDHMrZ5dpPHjIy3aK56TkB3nkSgo4cuEdpO3AtRLoI+nNYq64lkxqgiDaA/YGEdL3Mk4lHxfS5tbE8gPicZOzUqz5YTHb9QN4W3Jxi25kzKfQXDbx4hGebpFTJjBIWk3Xj9kBwFz/6guLM2M3QqS5outtWf33JMZe67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198395; c=relaxed/simple;
	bh=bv6n07AdYbcu7CUlDHwkUaSaBoaNi/w+WlQKLUMbmiM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lLnbaCZ2z/5xJ+CALLK9FAEf1Dy7xBnBQHrjQ5yv/2B3Dde9tE9BBp9OL+gDvL17LVf2isBOHGqATtVcj+jrBQFHrV3gRfeshZfSwBnG1kjGnzCAGnT+ohOdxcI2KXl/5Ird4AQi5eILV6NIwH8UFyVn33Yc4+GEs84gltjQctQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7I8S1nv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7I8S1nv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0671F000E9;
	Tue, 28 Jul 2026 00:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785198394;
	bh=fvao3haWBmBz4JOhiZ9NrDX9OzoO7vIObjotoSjRgec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P7I8S1nvLCDkV4fqwij+j6SGmyBpxtqZ4uIGD6p4lQhUl4eypHgFDAhDC63CpBq+3
	 72ranABBG03INw3mipZH4947Kf3IfWV1+a1UFvpBi/ZL2iW9J/lpt+Hh+uhBLm1+s7
	 ace5XDCws8wpmO84akRM8DvzIqXDRJ6H4PQutFrH1g6RbmtYXZ2idCeo9en9JUlQG+
	 A096rfMeDRl1yXx5QgVY4bLMJRiu1TuUNNjobTWNacmLiIIqOxaRsX5l+JK2QpP3dv
	 BRaFGBGQZbiUikOePNtSOfy73ctVBLnZhaC0XXDHIyKNbJEyOMnsPJ2iPV7WPkOqbZ
	 IJYZZ66zvjU3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/6] arm64: dts: qcom: Add AYN Odin 2 Portal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-ayn-qcs8550-v9-5-e3db456e10e5@gmail.com>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
 <20260727-ayn-qcs8550-v9-5-e3db456e10e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:26:33 +0000
Message-Id: <20260728002634.3B0671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Fixed regulator nodes use a deprecated naming convention that will =
trigger devicetree validation warnings.
--

--- Patch [5]: [PATCH v9 5/6] arm64: dts: qcom: Add AYN Odin 2 Portal ---
commit 0ad21da21b369d77d78a0eaf792c099796b2fd81
Author: Teguh Sobirin <teguh@sobir.in>

arm64: dts: qcom: Add AYN Odin 2 Portal

This patch adds devicetree support for the AYN Odin 2 Portal, a handheld
gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts b/ar=
ch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts
> new file mode 100644
> index 0000000000000..2c6e63f47cceb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts
[ ... ]
> +&{/} {
> +	model =3D "AYN Odin 2 Portal";
> +	compatible =3D "ayntec,odin2portal", "qcom,qcs8550", "qcom,sm8550";
> +
> +	vdd_bl_5v0: vdd-bl-5v0-regulator {

[Severity: Low]
Will this node name trigger devicetree validation warnings? Fixed regulators
typically use a regulator-* prefix rather than a -regulator suffix to comply
with the devicetree specification. Could this be named regulator-vdd-bl-5v0
instead?

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd_bl_5v0";
> +
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +
> +		gpio =3D <&tlmm 52 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vdd_disp_2v8: vdd-disp-2v8-regulator {

[Severity: Low]
Similar to above, will this trigger a dtbs_check warning due to the -regula=
tor
suffix? Should this be regulator-vdd-disp-2v8 to match the generic node name
expectations?

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd_disp_2v8";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-ayn-qcs855=
0-v9-0-e3db456e10e5@gmail.com?part=3D5
