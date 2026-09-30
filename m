Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FCB443A88
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 08:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755399; cv=none; b=opuibtIN1kGt2jYAFEAk0cq6V6biumGXajZjRF0B1u8ax1qSS5CLD4nBHkEWRpTfztZiKwGz4oETQoZ9tC3LjKZcoqN8EblWhmYk+ITWDrVmVocuHncwO+ahHQPqXQga7ZTxQ+215x5CoNP/HVrdOyE87HGv4s7Vr8vqqo8zJOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755399; c=relaxed/simple;
	bh=TtKIlTWobYIQor+VEy1gUCSvEBFMws2qq1G5GfF4wUE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eSCd1K9l+ERKjKyV/C5la/cAnby+EMQQGi/T4EQcdC10eUQURM1buhRwr7lEblDgi6AhQW6L3EqumeRLgxakDgurYzQBDb16T5lxuCpG5LZ4A4oR/NBW1oQrXS6DrI+j2cT0rkV8t8bpK5dhKESW55jnJGfXZKwTvtHLmiFIiNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otIn/SNL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otIn/SNL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EDE1F00893;
	Wed, 30 Sep 2026 08:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790755398;
	bh=He9ANk/jDXOTmZPkcACRxctagEfoSfbWERrlHk6zXuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=otIn/SNLG7SLwJkzpvCqpWszPZyWKy1HRLDHh03OreTaspKjNzBOKs24/ndg7cAQL
	 KjlWPyyrHUlNNJ3po8zmKV1Ut+zOt4Lqmg+zXETraAA19+07GYMArcWIcF90MRVONT
	 9dPnDJDqD4pLJdt8JdKO2drayKiaPHGKSTnH4XUJSdkW8XaAzspkzuCIzQb1jUoPlf
	 5fLZ7DiB8cj1n6a6xRsqky24Thlp78DNoF+kf98AoBCMoDOlzLZkVmmPxaU5QKFwqd
	 l9aOP+2Aip6xXWQ3QDx2TLZ+u7yN4plG3SWtKoPttQVoAH8WAPE+yrYnkVGTuQrnow
	 ZG3L88cMFd4FA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] ARM: dts: stm32: add TAMP backup register in
 stm32mp151.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930-upstream_tamp_nvram_dts_part-v2-2-bd73158ce46b@foss.st.com>
References: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
 <20260930-upstream_tamp_nvram_dts_part-v2-2-bd73158ce46b@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 08:03:17 +0000
Message-Id: <20260930080318.38EDE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: stm32: data race on TAMP registers due to dual regmap=
 mapping
--

commit 8441cd6ab8bc051ddef5b9749ba604477c2ab5e4
Author: Simeon Marijon <simeon.marijon@foss.st.com>

ARM: dts: stm32: add TAMP backup register in stm32mp151.dtsi

This commit adds the TAMP backup registers as individual nvmem cells in the
stm32mp151 device tree. They allow information sharing between different
software components and execution levels.

> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/=
stm32mp151.dtsi
> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
> @@ -2060,7 +2060,90 @@ i2c6: i2c@5c009000 {
> =20
>  		tamp: tamp@5c00a000 {
>  			compatible =3D "st,stm32-tamp", "syscon", "simple-mfd";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
>  			reg =3D <0x5c00a000 0x400>;
> +			ranges;
> +
> +			nvram: nvram@5c00a100 {
> +				compatible =3D "st,stm32mp15-tamp-nvram";
> +				reg =3D <0x5c00a100 0x80>;

[Severity: High]
Does this child resource definition cause a data race by overlapping the pa=
rent
syscon's memory region?

When this node is added, the stm32-tamp-nvram driver binds to it and creates
a second independent MMIO regmap covering the physical address 0x5c00a100:

drivers/nvmem/stm32-tamp-nvram.c:stm32_tamp_nvram_probe() {
    ...
    priv->bkpregs_regmap =3D devm_regmap_init_mmio(dev, base_addr,
                                                 priv->data->bkpregs_regmap=
_cfg);
    ...
}

Because this new regmap has its own independent spinlock, it bypasses the
parent syscon regmap's lock.

If a userspace write to the NVMEM cells triggers stm32_tamp_nvram_write_byt=
e(),
it performs a read-modify-write using its independent lock. At the same tim=
e,
other drivers like remoteproc might concurrently update the exact same
physical registers using the parent syscon regmap's lock:

drivers/remoteproc/stm32_rproc.c:stm32_rproc_set_m4_state() {
    ...
    err =3D regmap_update_bits(ddata->m4_state.map,
                             ddata->m4_state.reg,
                             ddata->m4_state.mask,
                             state);
    ...
}

Could this concurrent access with separate locks lead to data corruption in=
 the
TAMP backup registers?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-upstream_t=
amp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com?part=3D2
