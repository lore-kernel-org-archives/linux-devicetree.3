Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865113E6DF5
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173136; cv=pass; b=b3Lok9IAt0FzRWh1M87Dl4PBTioe2AcoVxaqAreyqjAVSUU423+lqTlp7D+xvjMOTrKsdonu03SZunTtVt1z6S7emJcLW511svJb2iwsnTIu6VBYxNVE5+vLq8fBbbygQvwo7egoe1F3eaf68fgiwxggOEXTe/9vUHCB/pKeCkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173136; c=relaxed/simple;
	bh=dmToRAa8rVmFxITbHNAQ7orPAttrnubK2XAvnPFoPcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/4sSDuoVyjeUddC7O453FKuvLr2z/LCuMGK5uEkLBJDLUYTA25a1TL4PbkTshwLLeF7uGAsc43XJbsKPA1f/t3AcdKbFYpSPVbEwPTDBqaarMC1ZO3MPClxnQ7DV76bXysaUc2uZbRUu3rhvAQ+xhvwuLrme2jrYrdrGjoslDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oT4GN7Vv; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oT4GN7Vv"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9c6f1d1282so745429966b.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776173133; cv=none;
        d=google.com; s=arc-20240605;
        b=XNNR2bufse1WqCaRa0vOpbOncSs/3AQbZrj6/iww3Z/1DGLJy87uoiOG4jIBh+RF4C
         h+nA1k7FZ+PGmZ/9v7Nqz53O8oc5GxPvwA0mT8n0fUyoMpryxSc/d5KPy10wegPq9y9F
         VtMz/GjyEjN3bQ2l+hL03/0mhB8QWrVzL35NVm9xIwzopkfMvTY0nk0A21v9pYPKe7TX
         WdhwrWQXp600cdAWLlPV45kBjkuuYk1Nu8gMlSdxPwNMWZN7pWd+AQiSa8bQlpiHbXPh
         CAtmG/pt0yR5EVJnSGGJElhtLZm0wlR19r2OB3OMKfAT59x5HNsXoEbQdLe3YAK+Adji
         rAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1rwaCRc2r8z5iPqTUdHmuFvHmmiQ+YCHzv+doVAKPkg=;
        fh=oOFcFR45S5wtMdhuk/gXAPhfPlTbCgyA1CwYH1hPRR4=;
        b=hxG7du12BwvBs9NePbZOJrzPVXwXnMlJCOSUBTyH59SryMhJ5w5cElcoRSnLnBvYhF
         D55xXxSLz4vReea7KnLj1h494GgEwdLV2wgFqWVr74LG3nNv5NztKjmUTC6z3h87hpAP
         utJt+FDg6pRzEtMcE8gXcmPi8GxNTxhkeNqSggVGo4ai0j9EOk+B7cdXExVjBSCnxfqu
         1s/vkmS3dxOD585RlJS8YWmh3d4Zbu5+oSVbJM4/KCN++ZBV/5d8jhaCwX+kzs/Vsmb8
         qWMiQ46qcAv1cdHmTt0s3tpPSvrRGEpU6kG7WIK7FlxuUFxSqA38qX2U93oetQ7pJQ6q
         QwHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776173133; x=1776777933; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1rwaCRc2r8z5iPqTUdHmuFvHmmiQ+YCHzv+doVAKPkg=;
        b=oT4GN7VvgRQ/5JQR1IgmPKVxb1MzrBjTsTwAIzwTpN3XUi2RU92j+KMgkJL+GIUsHr
         H+3U+bFZ7VlsZmjzGn1zlxRy8qwokV4mE2KwkmIEAsD/P76gf6nXxJwrp8AH2L89wYIu
         reB7+Yw+sTQyQXmSOb9j/FgUMpEzazHHoHcIV4q92P1nVl1jD0z9cG1Y0IfA2YoxpM9Z
         K7vLeseHZWV9CGf78/jpL7/vvRlr4gdxMxwhiG/PgY7s7D8x6cZozmp/kxoJVYSVYBom
         sJgfmhoecdtMUh6pPY2UOfeJv+efVLRCc0kiOZxhXJj6mv+bjuzEHh08OB0j/RAOSV+q
         7ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776173133; x=1776777933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rwaCRc2r8z5iPqTUdHmuFvHmmiQ+YCHzv+doVAKPkg=;
        b=PUnaEq+wfhFDZxMyYKkIp42T/oNXMuofNkdGAbE1FlvszMT9FYxPtrhVdvoOoqrG4N
         YbUjC0BrhR+f/4n0wCGN7LYIowd+FY9lkGqdMoTzzjHTXZftQld9E3jBi1WljLdWJfgb
         /KVL/npdyL5F0PxnhLX0rdnjKcsZEQqCibc5VO/t77aocegximHwFWrdTddSMt/4i7JF
         wVU8/UddHw1wb1+D6u+VMcHYs56Sxn3L5mvBrSxmsB/ANLk5W+7z83OfFdGvxYaMp5OT
         kCjrpNBbxDrC/DXPuA9kJ1doZfrGUCKVaZ3VY3Jlla0CZs4DUd3WhYyA9Q3gJKpu9YPi
         yJdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ptE87+4gWLNbC8eEgTF6cs27kIbncRUGbyqDEN6gkZ90LIJr1rTTqYGTXGg6p9JNtaG881sLqccnx@vger.kernel.org
X-Gm-Message-State: AOJu0YyHLdSZJljLjuRWjDGugL4r2qhm9Q66JFpey373ushs+DQmT7rM
	mo58NhJmjFBt1PXNm/ReH65Z26sBd7IdMGDc7k8eo+T+sWMYLGi41pn7RyPkPvRxUqcNDIJJph6
	bcdbOgUjqvSMPNdCnKU+gyAkRU83Sg7g=
X-Gm-Gg: AeBDietxaiDjHVjEwZQFSUXFYYpJmV+cHJi3q6WaGrSqBp/gityHXh87QWGXQG+e+CS
	bbOBmm62R8VmcJC9TxUplQjJ/q+CdwNrPEIv7XLVbewpWQfEsZKWBWsHLYksByeV/aUPAmDb0BS
	DZTGmGL3T6QEg0TYsA/OxN5QkRlXvkkCcCaeFC788wM2EE7vhVAouw6D1SNHQid0iIqOguO2To9
	yGHoKmzjHZTglsQigPIk91UIztE35c3DqnDuQjMls5txhhWI4qL5c+uemIdUN80f7nENoWuEEQm
	sv6sbA==
X-Received: by 2002:a17:906:ba8b:b0:b98:b08:7442 with SMTP id
 a640c23a62f3a-b9d7277caf6mr927238066b.7.1776173132486; Tue, 14 Apr 2026
 06:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org> <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
In-Reply-To: <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 14 Apr 2026 18:55:16 +0530
X-Gm-Features: AQROBzA45N5tX_gxF8wNR9dEOurmKJqRG5G4HXCsGJ5ETbsePSdurO7YbSqgcRs
Message-ID: <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shuwei,

On Fri, 10 Apr 2026 at 13:30, Shuwei Wu <shuwei.wu@mailbox.org> wrote:
>
> Add Operating Performance Points (OPP) tables and CPU clock properties
> for the two clusters in the SpacemiT K1 SoC.
>
> Also assign the CPU power supply (cpu-supply) for the Banana Pi BPI-F3
> board to fully enable CPU DVFS.
>
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
>
> ---
> Changes in v2:
> - Add k1-opp.dtsi with OPP tables for both CPU clusters
> - Assign CPU supplies and include OPP table for Banana Pi BPI-F3
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
>  arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
>  3 files changed, 147 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 444c3b1e6f44..3780593f610d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -5,6 +5,7 @@
>
>  #include "k1.dtsi"
>  #include "k1-pinctrl.dtsi"
> +#include "k1-opp.dtsi"
>
>  / {
>         model = "Banana Pi BPI-F3";
> @@ -86,6 +87,38 @@ &combo_phy {
>         status = "okay";
>  };
>
> +&cpu_0 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_1 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_2 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_3 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_4 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_5 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_6 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_7 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
>  &emmc {
>         bus-width = <8>;
>         mmc-hs400-1_8v;
> @@ -201,7 +234,7 @@ pmic@41 {
>                 dldoin2-supply = <&buck5>;
>
>                 regulators {
> -                       buck1 {
> +                       buck1_3v45: buck1 {
>                                 regulator-min-microvolt = <500000>;
>                                 regulator-max-microvolt = <3450000>;
>                                 regulator-ramp-delay = <5000>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-opp.dtsi b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> new file mode 100644
> index 000000000000..768ae390686d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/ {
> +       cluster0_opp_table: opp-table-cluster0 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-614400000 {
> +                       opp-hz = /bits/ 64 <614400000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-819000000 {
> +                       opp-hz = /bits/ 64 <819000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1000000000 {
> +                       opp-hz = /bits/ 64 <1000000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1228800000 {
> +                       opp-hz = /bits/ 64 <1228800000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1600000000 {
> +                       opp-hz = /bits/ 64 <1600000000>;
> +                       opp-microvolt = <1050000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +       };
> +
> +       cluster1_opp_table: opp-table-cluster1 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-614400000 {
> +                       opp-hz = /bits/ 64 <614400000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-819000000 {
> +                       opp-hz = /bits/ 64 <819000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1000000000 {
> +                       opp-hz = /bits/ 64 <1000000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1228800000 {
> +                       opp-hz = /bits/ 64 <1228800000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1600000000 {
> +                       opp-hz = /bits/ 64 <1600000000>;
> +                       opp-microvolt = <1050000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +       };
> +};
> +
> +&cpu_0 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_1 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_2 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_3 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_4 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_5 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_6 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_7 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 529ec68e9c23..bdd109b81730 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -54,6 +54,7 @@ cpu_0: cpu@0 {
>                         compatible = "spacemit,x60", "riscv";
>                         device_type = "cpu";
>                         reg = <0>;
> +                       clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>                         riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>                         riscv,isa-base = "rv64i";
>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -84,6 +85,7 @@ cpu_1: cpu@1 {
>                         compatible = "spacemit,x60", "riscv";
>                         device_type = "cpu";
>                         reg = <1>;
> +                       clocks = <&syscon_apmu CLK_CPU_C0_CORE>;

Based on the Spacemit kernel source, the k1-x_opp_table.dtsi file
defines several additional clocks for the Operating Performance Points
(OPP) table:

 clocks = <&ccu CLK_CPU_C0_ACE>, <&ccu CLK_CPU_C1_ACE>, <&ccu CLK_CPU_C0_TCM>,
                        <&ccu CLK_CCI550>, <&ccu CLK_PLL3>, <&ccu
CLK_CPU_C0_HI>, <&ccu CLK_CPU_C1_HI>;
                clock-names = "ace0","ace1","tcm","cci","pll3", "c0hi", "c1hi";

These hardware clocks are also explicitly registered in the APMU clock driver
via the k1_ccu_apmu_hws array, confirming their availability for frequency
and voltage scaling on the K1-X SoC.

static struct clk_hw *k1_ccu_apmu_hws[] = {
        [CLK_CCI550]            = &cci550_clk.common.hw,
        [CLK_CPU_C0_HI]         = &cpu_c0_hi_clk.common.hw,
        [CLK_CPU_C0_CORE]       = &cpu_c0_core_clk.common.hw,
        [CLK_CPU_C0_ACE]        = &cpu_c0_ace_clk.common.hw,
        [CLK_CPU_C0_TCM]        = &cpu_c0_tcm_clk.common.hw,
        [CLK_CPU_C1_HI]         = &cpu_c1_hi_clk.common.hw,
        [CLK_CPU_C1_CORE]       = &cpu_c1_core_clk.common.hw,
        [CLK_CPU_C1_ACE]        = &cpu_c1_ace_clk.common.hw,

Yes, it is possible to add these clocks for DVFS to work correctly,
provided they are managed by the appropriate driver and declared in
the Device Tree (DT).

Thanks
-Anand
