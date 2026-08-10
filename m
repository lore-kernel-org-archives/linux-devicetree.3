Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FBF3C1086
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360995; cv=none; b=SDoyOTst2dg3Dc6CAaNvn5F9ifVhLa4p36kjaS8coX9JiFKxyG7E5s+GBBemkaKJ5WQhUFtZMwRp6mN90F5cgZwPEtpESCFPrD77xIr0vbbS78AvdGQW6FAtZ0mGTGmi42H/i1tKoS7ZLbHKcKS8Jz9DVvC2Z5bzDZmVGNd48Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360995; c=relaxed/simple;
	bh=pPK0G2Map/Q10mROOrHxfAEU/9uUClnwScbvu1CW8D4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XPImbQHd8tMZ1lKMpY7lBLK/FAEyw8YD2xesOnNR8AITwin6i+BgPc7/Z/YzqOFnKkPm7TqHNjkrWb121+SZJQVsahq2FEvH6BdlEHqZZ0cJJYzCawbJCvRjsVL+4AiM1WzP3HSRebqWha8Vk7MmGCb7KT8dYQVHcNf40ns4bOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlsxr7pq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlsxr7pq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A841F000E9;
	Mon, 10 Aug 2026 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360994;
	bh=oABy49CJ8XHrc0zOUgotz7HvnhqCnHOKFx/GnAgxlAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jlsxr7pq6BneQJCKz4F8A6JqmS8MOO6VSKqotK3TWWgiI/2zk5IvoiasRaa7unslh
	 YtiXWtuu2b5Z4xhkP0Zvn9+eMXqZhAtejuYMpeqNttrK3+XiLOT62DEyAAkVp0jbKU
	 YMxzpFH8mfvhnh9CRXMzVdWU8xSWHtNSa20gB3CUU3oQQm4uAfbso4MaEpjH0Z4p6r
	 8inORiiD4ph5LZNAQD/EBPE37HZDKdBd84a0C76Gr61aWHoRHE4YtPX8m+7wGH2m56
	 PTMsjwNy2WmBH7fHvImTOAwgm+WjxtZ7ZX8z2PDCY8M3uUrAWmf1PqYnd58MXRjCXH
	 3Da75VhMEA3xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/6] arm64: dts: qcom: Add device tree for Nord
 GearVM variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810110726.775084-4-shengchao.guo@oss.qualcomm.com>
References: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
 <20260810110726.775084-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:23:13 +0000
Message-Id: <20260810112314.45A841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The scmi23 node introduces a thermal sensor protocol (protocol@1=
5) which is not documented in the commit message.
- [Low] The dummy interrupts assigned to SCMI nodes scmi57 through scmi63 e=
rroneously claim GIC_ESPI 32 through 38, conflicting with the statically as=
signed interrupts for apps_smmu_0.
--

--- Patch [2]: [PATCH v10 2/6] arm64: dts: qcom: Add device tree for Nord G=
earVM variant ---
commit 948fb9a917a28aaf25a94ebad3d151be888b0a2f
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord GearVM variant

This commit adds a new device tree file for the Nord GearVM variant, where a
VM controls platform resources as an SCMI server. It exposes shared memory
regions, QUPV3 GENI SE blocks, and a UFS host controller via SCMI.

> Add SoC-level device tree include for Nord GearVM variant, where a VM
> controls platform resources (clocks, regulators, powerdomains, etc.)
> as SCMI server. It currently covers:
>=20
>  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
>    for SMC-based firmware communication channels
>  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with I2C/SPI/UART
>    controllers using SCMI power and performance domains via scmi11
>  - UFS host controller with SCMI power domain via scmi3

[Severity: Medium]
Could the commit message be updated to mention the thermal sensor protocol
support? The device tree adds scmi23_sensor utilizing protocol@15, which
is undocumented in the commit message.

> diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/=
dts/qcom/nord-gearvm.dtsi
> new file mode 100644
> index 0000000000000..cd20acb89c1bb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi

[ ... ]

> +	scmi57: scmi-57 {
> +		compatible =3D "qcom,scmi-smc";
> +		arm,smc-id =3D <0xc6008012>;
> +		shmem =3D <&shmem57>;
> +		interrupts =3D <GIC_ESPI 32 IRQ_TYPE_EDGE_RISING>;

[Severity: Low]
Do the dummy interrupts in scmi57 through scmi63 conflict with apps_smmu_0?

Since apps_smmu_0 is statically assigned GIC_ESPI 32 as IRQ_TYPE_LEVEL_HIGH=
 in
nord.dtsi, if the bootloader enables these SCMI nodes but fails to rewrite =
the
dummy interrupt numbers, wouldn't genirq reject the interrupt request during
probe due to conflicting hardware interrupt assignments and trigger types?

> +		interrupt-names =3D "a2p";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		arm,max-msg =3D <10>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810110726.7750=
84-1-shengchao.guo@oss.qualcomm.com?part=3D2
