Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3774A3090D5
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543408; cv=none; b=KgLgHytgLJmq8z/MxPsamvfY4Xv24NFMJmcDrHN266eaaTboGBwnXBmAHQKWYAAh+T6j9+oU/VAUfGGyHCJyB7bc1EWIUdmo3B2O/h+I19D9zjSfta92QHOlmQkkRvKrXo64ZLtYKSEc30J3EGa6D+IWpLsq+T4ur6f1BEah7FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543408; c=relaxed/simple;
	bh=kysC6MdlGHLYijGiX8oILpsxu5tpjzeYnEpHiLBe74o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bycgma/I5HpSTXUU9MfEQqFBl0X/F5lmO4v/M0nNHsjs95JG3VasWhfqQHbEk2DLRVpabG9HdEus88FB0x262PJaqHe3iGG2YrqzWkbvD3Sln+Eh4yjmpz8AXnRv5nIlrMqNGtGLP2wcxN0G+Myew3LkcIt10aBVFfxSmjGhyb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNYKejhG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNYKejhG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CAB1F000E9;
	Mon, 15 Jun 2026 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781543406;
	bh=YmwEPL+7pIwLXCHcD/ZN6exp0snAl4luxZ9swauXDTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nNYKejhGlFPujhHTyaYn7h8x46rU6plbeX1PQqUHW05yViwM7TINnFQ8JxOIdJBHg
	 s57gi9CcLR58W/jvuKuPNOoPqLwElresQIECfNplK2HJJF2sffSMmWj6de9LOBpB/p
	 lGT4MThGO4g1bmxd4jGRubB+ELG2uZZsLpf+HcST8X+Ub21vOm8wXXQYygGsFS4ocI
	 q6b8LwlXx9hUS7iaks6kO3hp3Lra+nNg7hLNq6YHxfClZmx9Wnl/ZESWnYQVwW3ekI
	 Jon2o3Lj7F/Yy0DwQImCGQIOYpjMaP47dDYyNzquCN/6okMton93LigW1pu7wLIP4H
	 YTXEkA/KNjc4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sm8450: Add missing CX power
 domain to GCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-4-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-4-6b5752dd4747@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:10:06 +0000
Message-Id: <20260615171006.88CAB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `pm_genpd_remove()` and error path cleanup in `gdsc_regist=
er()` leads to use-after-free in `gpd_list` upon unbind or probe failure.
--

commit e4315c043469a13f84ee75ac94f4e0790692142c
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8450: Add missing CX power domain to GCC

This commit associates the GCC with RPMHPD_CX by adding a power-domains
property to the device tree, preventing under-voltage conditions by allowing
votes to propagate.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -935,6 +935,7 @@ soc: soc@0 {
>  		gcc: clock-controller@100000 {
>  			compatible =3D "qcom,gcc-sm8450";
>  			reg =3D <0x0 0x00100000 0x0 0x1f4200>;
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: High]
This is a pre-existing issue, but since this patch configures the power
domains for this device, it brings up a concern in the underlying Qualcomm
GDSC driver framework.

If probe fails or the module is unloaded, does the error handling in
gdsc_register() leave dangling pointers in the core gpd_list?

Looking at drivers/clk/qcom/gdsc.c:gdsc_register(), if a subsequent
gdsc_init() fails, it returns directly:

drivers/clk/qcom/gdsc.c:gdsc_register() {
    for (i =3D 0; i < num; i++) {
        if (!scs[i])
            continue;
        ...
        ret =3D gdsc_init(scs[i]);
        if (ret)
            return ret;
    }
}

This seems to leak the previously initialized power domains in the global
gpd_list because it misses calling pm_genpd_remove() for scs[0..i-1].

Similarly, if of_genpd_add_provider_onecell() fails at the end of the
function, it also returns immediately or bypasses domain removal:

drivers/clk/qcom/gdsc.c:gdsc_register() {
    ...
    return of_genpd_add_provider_onecell(dev->of_node, data);

err_pm_subdomain_remove:
    gdsc_pm_subdomain_remove(desc, i);

    return ret;
}

Furthermore, gdsc_unregister() removes subdomains and deletes the provider,
but entirely misses pm_genpd_remove() before the backing memory is freed
on module unload:

drivers/clk/qcom/gdsc.c:gdsc_unregister() {
    ...
    gdsc_pm_subdomain_remove(desc, num);
    of_genpd_del_provider(dev->of_node);
}

Could this result in a use-after-free kernel panic if gpd_list is iterated
(for example, by genpd_power_off_unused() or debugfs) after an unbind or
probe failure?

>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  			#power-domain-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-topic-sm8x=
50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org?part=3D4
