Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778663;
	b=vY8aMHtzJfSnLNR7ESAnMpv3waGX6C6Fx6dJS9XfiF3xOeWBEbcJZ9IdFED8i2twevuE
	 nqHgO6Xug6VECGKZCx1JnBGvv/WpaLBcV4ZjvszZqeAv/xLbqlDCbJTGM7i58KTaThTI6
	 ToZ9DvYNwAE8n2R6IxMPOBwF8kdZaEF2ZrJMCD8djUeATIBtREJmqwYyBh/Nf2EvaKUV1
	 iHvrLLgNX7rLokamlymH5+F3WU8hNXM29njaGjPEND9KsPpw2TC45s2WrHSJMuYziWUV3
	 7cpUSiGAmaSKr0khFjCp7ay/axNnLTDXaIlVRUQLlqw/m6o8O2UqIIBxBctbeVhyEJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778663;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pd1LeG4YSyVzhkAEDrQRjo9EK9eodI/Jl3tuo5xNq2A=;
	b=D8ujTwXFlMZuyA9+Monzdiwlf7VJDYyBxzUkrqwn9dPeSvimfWtkUWDuG+EYMGC8Tiyx
	 v/Mt9J/lF/CccIGZCzyg4M4W/Ud6fPQxhRjTQY7zAmbjqHaZYo6ErCNRUjWCv/0rK/HaD
	 Crh+sKkpYh2Et0T0ThXE8s2er+02Wa1T5A6Dpi+0Ff0EqPQqFsccA+20jezTaGmuZIB3F
	 QapEEfUZ7KWHAGFe9rrjy9yhfIIMRxDEScaQBPtGZLo0SIqMS4FFEMmq4lA+tUupRNYpI
	 nu/KPwcQern2HDCpGbfd4mbBuPLq1M8zaCg+tOx1QSdh13oWuo51xodGSrJY7ingprw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bE9Py9Tr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F07E606D805
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bE9Py9Tr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B167D1F00A02;
	Wed,  4 Nov 2026 07:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793778663;
	bh=Pd1LeG4YSyVzhkAEDrQRjo9EK9eodI/Jl3tuo5xNq2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bE9Py9TrIWlL4Z8pJU+Mlk3LorzHI7WnypNpD9drkkqFqGWDbVYjRD7N5s4oowRsy
	 fPFIUrMoZY2hHPHvwIIYLo0HX+zMm5fJK/G4CR9vsYNPE8DVbvr6Xi4BQ8yJlUzZWf
	 930618CPfb7hqMJG2czqhwxgIY6mSW3I2H8hPeHJdpiWB/OaYOEiIaAHqWXg4+ZzCp
	 xqAw93FNvm+mQXlIfYjcz5uZ23uMtk0F3FSa45C3bO7m1aXbBFjWZKBLryYkRkTE+Y
	 s6amxXAlpq4CIOAbDUrv6ocHZIsjfiEmQhTfcYzJfPUJ4Uo7hK7JjYD+2/oZ474+KD
	 3dlWZMdP/mlSg==
Message-ID: <sashiko-outbox-196833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Add SLPI remoteproc node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104074200.123842-1-val@packett.cool>
References: <20261104074200.123842-1-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:51:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: sc8180x: remoteproc_slpi compatible violates DT b=
inding
--

commit 0d379b187776a8ea6d877b7ca4de413f6a03989d
Author: Val Packett <val@packett.cool>

arm64: dts: qcom: sc8180x: Add SLPI remoteproc node

This commit adds the Sensors Low-Power Island (SLPI) remoteproc device tree
node to sc8180x.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/=
qcom/sc8180x.dtsi
> index a85e3211958d1..18f03aa62d85e 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -2259,6 +2259,67 @@ tcsr_mutex: hwlock@1f40000 {
>  			#hwlock-cells =3D <1>;
>  		};
> =20
> +		remoteproc_slpi: remoteproc@2400000 {
> +			compatible =3D "qcom,sc8180x-slpi-pas", "qcom,sm8150-slpi-pas";

[Severity: Low]
Does this two-entry compatible property pass dtbs_check against
Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml?

In Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml,
qcom,sc8180x-slpi-pas is only permitted as a single standalone enum entry
under properties:compatible:

      - enum:
          - qcom,sc8180x-adsp-pas
          - qcom,sc8180x-cdsp-pas
          - qcom,sc8180x-slpi-pas

Additionally, the allOf conditional block in qcom,sm8150-pas.yaml that sele=
cts
the lcx and lmx power-domains checks compatible with enum rather than
contains, which does not match a two-item compatible list:

  - if:
      properties:
        compatible:
          enum:
            - qcom,sc8180x-slpi-pas
            - qcom,sm8150-slpi-pas

Looking at qcom_pas_of_match in drivers/remoteproc/qcom_q6v5_pas.c, the oth=
er
SC8180X remoteproc nodes use standalone compatible strings, while
qcom,sc8180x-slpi-pas is not yet in the match table:

	{ .compatible =3D "qcom,sc8180x-adsp-pas", .data =3D &sm8150_adsp_resource=
 },
	{ .compatible =3D "qcom,sc8180x-cdsp-pas", .data =3D &sm8150_cdsp_resource=
 },
	{ .compatible =3D "qcom,sc8180x-mpss-pas", .data =3D &sc8180x_mpss_resourc=
e },

Should Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml be
updated to allow qcom,sm8150-slpi-pas as a fallback for qcom,sc8180x-slpi-p=
as
(and use contains in the power-domains conditional), or should remoteproc_s=
lpi
use a single compatible string with qcom,sc8180x-slpi-pas added to
qcom_pas_of_match?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104074200.1238=
42-1-val@packett.cool?part=3D1
