Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C825552D2C9
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867767; cv=none; b=fTBK4TMfI1xj31xpZmyNKO92pf/2RDavwvwZxQ52YCkIdendR375dfZE92byawLOyrjgYSUOQNUl58NPxRStMvbO+QAM1s/qw+Dntz5R118JN1fJjbCVRwL2tQkNXNfnKOpSlYqG3PJuCnRMvNiji74AUBEbDUIZHCEkVjBNA3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867767; c=relaxed/simple;
	bh=VtN6JH/HKVQ34kIXpMyL0H5+e0uwIVydnZzHmFESRZY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mBkHvQOKn6vr8ZcupAocJArX77WB9nVZGE5SMrGlnrAcsGnImmylDm8ye0jBT2YCb2q/tjb6Dh3i/U5jQ3SIIXhlxODUPvG0DMeurwdAdlNsGpskFdl1H8zz4awVq544FiJfImM3oLNtdXel4vxANwvh+bo21lpz4LaUuQsE9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geBFt129; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geBFt129"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C681F000FF;
	Thu,  1 Oct 2026 15:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790867765;
	bh=GVaACCDEX8Y9/5kkkn4Z0WFg5rGp/fj1UKYx9dxRef4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=geBFt129Y86lNKtuRT8p39eXsvhkktrEhn0ktKqicSP4NqFErHvaM6VuM5GiY5jXC
	 PtGAsO+XsZfE3xWeXOF+k9qAdmSR4XSbXTYhjz6F68LMDAuc9VjJsAYBdzwFtBeTJg
	 6f8zSbgnpMZTVb2/CDhcA2PaMDHtzS9T9wiw/40XNixVkl9mjOtAdeh3m9AoBrzdfd
	 GFJknaV/uQh5oPggn8p5GFSCfL+ylpNAwWXAoqKrQXYyjesQUEG1DvqW1YDxuvxq2Q
	 B1akhSZDrq2g0AQhGmFLkpXpw45wGmKxvgPsdsc91Ns515fDI56swcVp4cE52VRp68
	 0LmQqHqb+6rZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001-imem_restart_reason-v1-5-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
 <20261001-imem_restart_reason-v1-5-79f516906010@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 15:16:04 +0000
Message-Id: <20261001151605.14C681F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: unit-address mismatch for restart_reason node
--

commit 5d6664a4ef4cd5e108f7a22f5edd5974f3708b98
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

This commit adds the sram property to the watchdog device node to enable
retrieval of the system restart reason from IMEM. It also defines the
restartreason-sram node in the IMEM SRAM block.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5332.dtsi
> index 3e10f45e182e1..6a54a548b4f86 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -496,8 +496,16 @@ qpic_nand: spi@79b0000 {
>  		sram@8600000 {
>  			compatible =3D "qcom,ipq5332-imem", "mmio-sram";
>  			reg =3D <0x08600000 0x14000>;
> +			ranges =3D <0 0x08600000 0x14000>;
> =20
>  			no-memory-wc;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			restart_reason: restartreason-sram@7b0 {
> +				reg =3D <0x7a4 0x4>;
> +			};

[Severity: Low]
Does this node name violate the Devicetree Specification? The unit-address =
in
the node name (7b0) does not match the first address specified in its reg
property (0x7a4). This will cause a unit_address_vs_reg compiler warning
during dtc execution.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-imem_resta=
rt_reason-v1-0-79f516906010@oss.qualcomm.com?part=3D5
