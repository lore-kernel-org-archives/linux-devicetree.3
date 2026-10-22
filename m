Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669590;
	b=SKodPlxd1L9uBlkx3XQ/0eL9zRshM9c/qTDQmWjLIkaFN8LDIsVQKBW9SrbQzP3Nb6uA
	 PW19/K20MnOBBBCVS5/Db2I88pH5ABXOfiuFv2pxmOSXM3Glm4hNlnbwrO7GwAWyMe/YC
	 /LJ0s9HdQJRgwmtACJ12TuuHzc9Vh0jwlsnOQepZgiwFRHCBGixt2smoxTwH6FLjz+gHc
	 bfmtfHMnEbCM08M4/fjyuKECqonUUhYnPshmuUUs4S2r4H0RXyqv2JSHhxisFUkk1EGh2
	 4gR6GlaAh+CG9I+EfJsS93o429OJdGQg/wT86/MKEvZfnuOgljVYkyA8RFhnhNBE3+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669590;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6nUmZ4oC0B0x4U/ZB5SctCoPAjxEgqnBD6Dmju/DMFs=;
	b=dCelcLtf8D8K7nQyLJWZe/XVtVfYp1breZ+StC6gMy1UzafJ3mGR/FP+i9n+OWvqDK+u
	 9a2FASs9n9Wq26xmEngtirAG5D8+QKxU49cLsi/kEBQIE7wXTogpjzJ6+Nvyxpw9/iNUF
	 idkH/uk+GaIm5LffnU6KOEae/TuFJY9l/S9ePJSq4MoMsCmUH60d1RlLxPKvE3LnZJAz/
	 J+geZ7PV+JvPZE8jMCy6Pr93tpHCTBjr3wEZOZ6/haCz7lKelXFxtqjeBkXFtjjZnGjvs
	 XMvoWw+oNjBB/wFylZTDq13gbVbH5pnAjHiQvQKB1Ylf8IYIL4dIiDG+HwHWHqawdCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+nIqEuT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B970A606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+nIqEuT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072F71F000C1;
	Thu, 22 Oct 2026 11:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792669589;
	bh=6nUmZ4oC0B0x4U/ZB5SctCoPAjxEgqnBD6Dmju/DMFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E+nIqEuTtoNSJB2Mw53yMBiKhECYsdHSDqXYJJhrdOS6FWLyc72OAc2jlRfDf310b
	 F7vuWa3xswVBJF0+CLEUtpsx3cDj3XysTiogwS31LBjFe4gIkxYKh7g4VMqGWBL89y
	 +NijyoTfzlkz1S4N9Zh3MCeWiMCkeTe9F9UO5B1F18BthDj56a+292zIkYp1ORyk2K
	 IB7ccxEM8VQCpfuw1zdIuqjRmKnOcXJTVjf1SO3sdGhsDT+wQu5rGlN8R8Cwas0jE+
	 NWi3c44uisVRHmsmVRMu/ZG+aCNICDuIViE5KrUS3zZ0P8qYfUoLOmq3parGwo6ELY
	 bLVBxGZMiWxwA==
Message-ID: <sashiko-outbox-181380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "ShiTou Hong" <redstone.dcity@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022113601.2320940-4-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
 <20261022113601.2320940-4-dc_redstone@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 11:46:28 +0000
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
- [Medium] arm64: dts: qcom: undefined phandle reference vreg_3p3 in pcie2 =
node
--

commit be0d22fcb00f618941a1790f86db070c0405b5a5
Author: redstonee <1516235445@qq.com>

arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports

This commit enables the pcie0 and pcie2 controller and PHY nodes in
arch/arm64/boot/dts/qcom/sm8250-hdk.dts for the on-board WiFi and M.2
connector.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8250-hdk.dts
> index 9ff15d9d7f0f6..77273b6c2216a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -712,3 +712,24 @@ pm8150b_typec_sbu_out: endpoint {
>  &usb_1_qmpphy_dp_in {
>  	remote-endpoint =3D <&mdss_dp_out>;
>  };
> +
> +&pcie0 {
> +	status =3D "okay";
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply =3D <&vreg_l5a_0p88>;
> +	vdda-pll-supply =3D <&vreg_l9a_1p2>;
> +	status =3D "okay";
> +};
> +
> +&pcie2 {
> +	status =3D "okay";
> +	vddpe-3v3-supply =3D <&vreg_3p3>;
> +};

[Severity: Medium]
Does enabling pcie2 with vddpe-3v3-supply =3D <&vreg_3p3> in
arch/arm64/boot/dts/qcom/sm8250-hdk.dts break building qcom/sm8250-hdk.dtb =
at
this commit?

Neither arch/arm64/boot/dts/qcom/sm8250-hdk.dts nor any of its included fil=
es
(sm8250.dtsi, pm8150.dtsi, pm8150b.dtsi, pm8150l.dtsi) defines the vreg_3p3
label at this point in the series, which causes dtc to fail with a reference
to a non-existent node or label.

The vreg_3p3 fixed-regulator node is only introduced in the subsequent comm=
it
b98ad1ad783f ("arm64: dts: qcom: sm8250-hdk: Add the QCA6390 NIC"). Should =
the
vreg_3p3 regulator definition be moved into or before this commit so that e=
ach
commit in the series builds cleanly for bisection?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022113601.2320=
940-1-dc_redstone@outlook.com?part=3D4
