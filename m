Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534048;
	b=UF09DBuejLfaq41RTUun5WVC/bjJkav1dlx4DBjIKzyuyFUTwYFmSzGpuwJFcAvXB+QY
	 4MLRRpD01x3D+YO6IaMjAookX+yxr8pmFW+Ii+tlVujFOnF0SqqdY1c/HazlWwXVJjS1H
	 P2rSHiT9MX/mkRLIr1+3BpyozlnK3REVbbRrNwjdBYJSjHedOCDp9jV/846tjlJ1pGO6T
	 /XQnmQdiTHa0NZlx7kQG9omw77b6Eqx3b2Ds8sIm9YnNhWd++NxMwx8PXfC6yL7G4St6Y
	 KEUdGxynmjajht1Cwmb3AxSZDTLJH21v937S7kH7Cd41XDHVx2G6t1laalis/LrPPFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534048;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Tqsq7DvU/IpDDIq00aR0Q6COF7tVcZ4eqelbtsbxLEU=;
	b=JfDXbim5t5dmy7Ey8XNwyMPhgbNzNGwM2nYLa3cmF2QpjkrlRdf96OJgrWHDCYQDIaqF
	 TbB1Rek9PG9367RDCOhYUxvHeIOn+NlzAeUmXZHaLOC8mvX79+GW//H6qJMqRqrD8d8Dl
	 vWNNZ23ZlCy+jqlfw0DnYc9/YB7ucaF2i8Ruc3/vmlFB7q0yoNuA/CSys5AhL/8Btn3bz
	 tl0Lb5hgM5IB+H1NKazOkIk+qdAquIGmUv/9xdXa4aXMM0ng1E/Mjo6clzWn6JcykO5Nv
	 7zpnF5bwPPyxwqaLPI+xeNRi9rvAtg0+yoWyDyCooXQtzTd6uPj26rc2+lpTvG+sBaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ7VbLbV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066E7606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ7VbLbV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F181F000C4;
	Fri, 13 Nov 2026 01:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794534047;
	bh=Tqsq7DvU/IpDDIq00aR0Q6COF7tVcZ4eqelbtsbxLEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQ7VbLbVyCrko2ZrjTpms4BZq95ByurvA4TyHzjeUnMhfvn/Np0ZfTVbUNI8oc/Ij
	 ehxkt5dk/HKpAGM0ciUTC4U/EUAhrN9dgKA9tYw4IfPgrtTwhd0AaTWLsXW0xzbBTe
	 B91DzJ3QpXR5rBeSvIoVbQputMmvCD1NHYN7rqDZgw1BE8JEM4AOTuNXn+XIMv3eYZ
	 b4/Pv55o2ge1DVisqtGO5K9ofBOslyeP8lDDCiMmwZSGZCgA5ANU31s8OOhhMPBqGW
	 XObdAxEAfa0h13BOR/qce9X/6lzYeCUXrLiXrhF06wz8TGr6d+psI2mKA+e9/xXBXA
	 dVcOj1mdcauMw==
Message-ID: <sashiko-outbox-212072@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-4-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-4-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:40:46 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: qcom: Signed-off-by uses handle erebion instead of
  real name
- [Low] arm64: dts: qcom: sm6350-lena: inconsistent Sony firmware-name
  path
--

commit 242b8f170866c87626f6fca5aa977fc4b21bc731
Author: erebion <erebion@erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP, IPA & MPSS
>
> Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
The Author and Signed-off-by lines use a handle ("erebion") instead of a
real human name, which does not meet the Developer's Certificate of Origin
requirements in Documentation/process/submitting-patches.rst.

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index a393b7533ccbf..4066de20ea23a 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -68,6 +68,12 @@ memory@fe901000 {
>  	};
>  };
> =20
> +&adsp {
> +	firmware-name =3D "qcom/sm6350/Sony/pdx213/adsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &apps_rsc {
>  	regulators-0 {
>  		compatible =3D "qcom,pm6350-rpmh-regulators";
> @@ -291,6 +297,12 @@ pm6150l_bob: bob {
>  	};
>  };
> =20
> +&cdsp {
> +	firmware-name =3D "qcom/sm6350/Sony/pdx213/cdsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &gpi_dma0 {
>  	status =3D "okay";
>  };
> @@ -316,6 +328,18 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&ipa {
> +	firmware-name =3D "qcom/sm6350/Sony/pdx213/ipa_fws.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&mpss {
> +	firmware-name =3D "qcom/sm6350/Sony/pdx213/modem.mbn";
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Should firmware-name for adsp, cdsp, ipa, and mpss use the platform
codename ("qcom/sm6350/Sony/lena/...") instead of "pdx213"?

Other Sony Xperia device trees in arch/arm64/boot/dts/qcom/, including
single-board files such as sm6375-sony-xperia-murray-pdx225.dts and
sm8550-sony-xperia-yodo-pdx234.dts, follow the
qcom/<soc>/Sony/<platform>/<file>.mbn convention standardized in commit
f0a577c3a807 ("arm64: dts: qcom: sm8350: sagami: Fix remoteproc firmware
path").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D4
