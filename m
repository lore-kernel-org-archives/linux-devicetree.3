Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8A03806AF
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054178; cv=none; b=LNaldVSznhMzk618Tus/CN2uXCMFLVWR7WXjyLpAizXBTjlEMmMfAiD5XQkExH+R2/7mRgLW75pL8sMJyxa5kf8ibaIK5rcK57wGEkrxmGvqVVUDZiTotZC3jERppXj7QrceSUi6Djm9VTE58VYm2CCk9EXUDdSl/IiGmozzoAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054178; c=relaxed/simple;
	bh=/cLaHmKujOcAfMuRrr9c6l9svHe3j5pp5fR3asU16qk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YPigIEWZ/CrDCd6MCvMVVMmnazzPvaaaUBMkD6QBGrdxErZDU+NNI2HM4lgtVyY9iBbEa/wS4FSTsiTcaNWO3XVxZ3RoECrbhAD204q104q6OSsYd6VhBf3SHDCSjnJYL06OEDpK4taA/V6HsAsYnYtq/vIBvOD1vCLeqs82xlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0gnSv2O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0gnSv2O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E461F000FF;
	Thu, 10 Sep 2026 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789054176;
	bh=beCS4lvbz/zTtIhX3Asrpp3/bjax12EVu0zxfSsqPLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h0gnSv2OEU+f0v4vP2PAij7aNh/zbvuZrCpnOdSdtbhLbIWdlfiknRdBoIvp8QO7m
	 QrFY9NXbvLyvwMEC85cveoncCOWjix5J2KkmB0S4k3dVsnnTBDAlwPSATmPsT9sMCF
	 0OMeqZhvw13+cDXj6pPQDtt5r8ebQFbquZtQE8byHl7IaD/2pk0SZ/NoPbQEYWdYAr
	 8xFFEqAiZjMGnj8wmMJaGadpOq7WdgMvcmLiI7z2j4em7NoTBW39qxwhSQLms3Aooy
	 VmkBt4c2na8F14O3j6HQhdOs/2pL7AA9w3xcuvUQFr99fY42XbxOc5CSHW0nCSeIMw
	 15JLvC3f2iU4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] ARM: dts: stm32: add TAMP backup register in
 stm32mp131.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-upstream_tamp_nvram_dts_part-v1-1-e2bca58a65f4@foss.st.com>
References: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
 <20260910-upstream_tamp_nvram_dts_part-v1-1-e2bca58a65f4@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 15:29:35 +0000
Message-Id: <20260910152936.59E461F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding child nodes and properties to a syscon node that has `additi=
onalProperties: false` in its schema causes immediate validation failure.
--

commit fd4960b03c2c4e269bdd41d3965ee803d12b57df
Author: Simeon Marijon <simeon.marijon@foss.st.com>

ARM: dts: stm32: add TAMP backup register in stm32mp131.dtsi

This commit adds TAMP backup registers as nvmem cells in the stm32mp131
device tree to allow information sharing between different software
components.

> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/=
stm32mp131.dtsi
> index 83ae59b73dd09..b37c22b1379cc 100644
> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
> @@ -1918,5 +1918,39 @@ gpioi: gpio@5000a000 {

[ ... ]

> +
> +		tamp: tamp@5c00a000 {
> +			compatible =3D "st,stm32-tamp", "syscon", "simple-mfd";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x5c00a000 0x400>;
> +			ranges;
> +
> +			nvram: nvram@5c00a100 {

[Severity: Low]
Will this introduce a schema validation regression when running make
dtbs_check?

The matching schema in
Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml dictates
additionalProperties: false and does not define #address-cells, #size-cells,
ranges, or child nodes like nvram.

Does the schema need to be updated to support these new properties, or
should they be structured differently?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-upstream_t=
amp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com?part=3D1
