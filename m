Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEBE4D9577
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952057; cv=pass; b=sIykb/uu86nUfSwALcnS53Dzc2BE3cLFQteeZBJJr1LNprcve3UdOIVBp/fGra9YBTvGdaNGIgW79V/Xu1f5wo9XVN+iwL2/J/viLhFxyBoqfw/FddCm1TagcNQ2DypD1ab9GMN5Zj+oDPZiUfM+LVzDuekQvPj5pIkaPshHep4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952057; c=relaxed/simple;
	bh=yThCC7PHEtVrekbHIcRKtJ+4ThQy3inWeHk3llKz7M4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVBqjEDedkh8Q+hsscu1ZZJaj1SiJPQmL+ii87obPQTM/zoMRYO11pAUaDJxqY3zIj+pHDBA/w34UjPHyODaIuvJf//GB7hW2I03TObr39cidASZaXYaHT+GIqXkuDp/++GRJt1+uqnIPK3PkcdU7jagEinD2FhLeSYa7i1ctC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sHPmXUXP; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sHPmXUXP"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7bf2de022d5so1723120137.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 07:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952048; cv=none;
        d=google.com; s=arc-20260327;
        b=r+F6n/6v1/UbDpl+cA0snj/FKbsDqz22su2oUuHegQ9Ul6G0awL8W4W8dHCrEIeT3u
         8E9y/lz1JGAdMnft58nMz8AeFMm2vWYlkOOLd011o4e+YWOUgwlcidMN0OY97I53bLAY
         pq6e5ot2pr+91i2yP1TLcxgYVIufsI0+wSd3FNd7Qd9JMHfEycuqL/SYeb0hSpNViigF
         YZyHmM008M74zoXuB1DLXmqdUtNwKa+NqDS/dYZQL3eU8TcrFff9hqYNBRLdtwLnqc8i
         7nj9lOFL69qGeVcEMEAr7TiyTn3Zl2NTzivnVM3gQtgdofBEBOg939QGxydG+UyFTNm/
         N3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        fh=RWwW4aXGFEC8ohKKG3B/bqpvwRiarq0t2O/Q/Yhgg+4=;
        b=nlIHwPnEPMYR0trU8TZ0kMoQFjG7c5H5zalZmgQ9qyb9d0kN9sUzBEJLWOENL0t8gx
         nuCUp6SX+vr5fiwtybRM56IrN7d7vvc+X4Qj0XnpOI3IqfY1N8VDtEha7fHt0o6HxuFV
         jBuk5EXFgJTRv1DuVp3/GFRgwvH0lzW9ha9tfoFvTWWuSvaJRXy8P7/dhXgDiw9uQoyE
         lqOGdIS4eqDab6P8aPIOOTzyqJQkPXllwTH7lW3mxtOLGgNpSs3m8kICA8TUP4ssGsaR
         RKD4FCF+dUyJPxBIdswKidHyfXA/qpBx6ZA2x69bLQDYP49IdMzPjUzqjUlQQfVMHUp5
         omuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790952048; x=1791556848; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        b=sHPmXUXPHIaj4Ir2ypLxJIs89CzNrMaVK+Z9qVO/U+tUtAXBmX5r99af9qgmMsbJ9Z
         RtPHbvLmn4PcTW79yDcqw+KjgLIxFknWOKc4aDIhXCSwNFXEmhyOPkSjo3DUM03FtNtE
         YbtcU0MvNKVG9Bo+z4WXgeBD15hyDFXDiFKwq9eYEx/cqNwMuQuQBWFryhMASRJARVcY
         E4nvTnMZJdknQdYGcmzJ3woVX0Jj/89cPuL9jZzXGc0nHTVEXPnEQxBPleakS5SN8w9m
         +y3x0zwVfZ/E4ZOsMKBQ5zgdDiTrlGTBa6f/09xK0VXwhN2zmftqs1Y2eYpBBIwKVzla
         L+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952048; x=1791556848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        b=GCJu3jUHtJX/859DOlvpXU7ardCWBCWPf/RfCnH6IQWR7ebYsb5fcQiKZJTtKVfVQY
         gIQfQQx5yGc6SMz/KvZIfc7HFUjBPwWzZSNRJANCw+uJ2YXBdHs3Ic1r9tymhtMt4n+4
         M/3eIY7sNRzuku9Tssf2fYxB6FTUxzVH7pfhL/0RyqdNUh5vk6YJNy60nVdca5Qh0Zfi
         TMpowq/SP13m4cHeiudsB1uAnjQQAZG73T2LpqBJPm+tq5oK0wk41Wg3ds/PUJqAAvDw
         n77eXWYfkFVYJRtEH69xtOTxM/6c3Q9UNLoTa40fyzWgdRvbSkMx62P8BiK5u9FLXTSH
         3zxg==
X-Forwarded-Encrypted: i=1; AKwUvBwKEBHqJNiUXAk6+gVS6v+jFt5WavjzpIHSfcHlX+QH3dyg8j7fPjL+pCOdDk3rxPf/XuFRgH1SFqSs@vger.kernel.org
X-Gm-Message-State: AFq9FYL14ZJ5PLcEXC/FoWby+uoWzD0H8QqmUlmKJIMkX0F/Aa0CItgr
	XWhLV6XMSJPrPQjkUGwapZ/klYgmdcc5f4D0I1a0Zg1vtIbM2H6nKUJbJaAcGTKXF2kpfcI6C6T
	sILjmJhPNURoqZOyoc/EGPlx0ZD0iyae5LDSNDS9d29DP7FcpGT+yFRw=
X-Gm-Gg: AYBFou2hC6CyjirVFds+aSERubjCCPrC92D9y3kI/vKDknDnFjnAQ/tkqLnupROF6+e
	dgN3J/1MhLstPm6dCkxMHot+KP+FCaikVAK5pxx0fXWfuFrAPOInJo2+Q1rAvTRpFaRRsRPAWLW
	7RjJsI7fKFUy/K2jQqEvoypYX9sxmWB23j51JisVycKlOL6Yv0WPiSDbJYMRtoLQgADCMbLIXaq
	+fkvxBqG9fd5tiCzwHtsqUov6eenZClTmKiCalVsJEmv7mPIYhCu2nkakLlUpUivv/4W38LRWkm
	JTQVIRERzQrkZhkn4jHNR3oq72afrP1QBakzqyPrL6xtBSngLXVPxIQv8P7jprF8dx2+yCz2+9w
	pb+vApRbzrWRGBg==
X-Received: by 2002:a05:6102:1624:b0:7a8:10eb:9775 with SMTP id
 ada2fe7eead31-7c0f1de9f8amr776221137.4.1790952048089; Fri, 02 Oct 2026
 07:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-2-5a86c1d404b8@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-2-5a86c1d404b8@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:40:33 +0100
X-Gm-Features: AclHuK8D6xaEDYaJjeS22_XFdGHe8Vl0E2LtBv0KYmeFPY7diuDQNpJU8hTUVF8
Message-ID: <CADrjBPrTNGN7N9Q+rRO61O-mkz-j7YVV4D3tT0W=xj=KM-GT7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: exynos850: Add operating points for CPUs
 and enable cpufreq
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Turner <tturner@lineageos.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 04:11, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Exynos850 has two clusters with four Cortex-A55 cores each. The OPPs are
> identical for both clusters.
> Add OPPs for both clusters and replace cpu clocks with ACPM
> EXYNOS850_CLK_ACPM_DVFS_CPUCL{0,1} clocks.
>
> The maximum nominal frequency should be 2.002 Ghz but at this point the
> following OPP is not added here:
>
>         opp-2002000000 {
>                 opp-hz = /bits/ 64 <2002000000>;
>                 opp-microvolt = <1050000>;
>                 clock-latency-ns = <500000>;
>         };
>
> due to stability issues. Testing on a fully loaded system with CPU-bound
> tasks triggers data aborts and illegal instruction errors at 2.002 GHz
> after 1-2 hours of such stress testing.
> Running the same workload overnight on a CPUs fixed at previous OPP didn't
> lead to any issues so opp-1846000000 is currentlly the highest one as it is
> considered safe.
>
> Higher OPPs can be re-evaluated once thermal support is implemented.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 224 +++++++++++++++++++++++++++++-
>  1 file changed, 220 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 91c6cee8f483..36501e5903f8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -100,8 +100,9 @@ cpu0: cpu@0 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x0>;
>                         enable-method = "psci";
> -                       clocks = <&cmu_cpucl0 CLK_CLUSTER0_SCLK>;
> -                       clock-names = "cluster0_clk";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       clock-names = "cpucl0";
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu1: cpu@1 {
> @@ -109,6 +110,8 @@ cpu1: cpu@1 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x1>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu2: cpu@2 {
> @@ -116,6 +119,8 @@ cpu2: cpu@2 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x2>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu3: cpu@3 {
> @@ -123,6 +128,8 @@ cpu3: cpu@3 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x3>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu4: cpu@100 {
> @@ -130,8 +137,9 @@ cpu4: cpu@100 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x100>;
>                         enable-method = "psci";
> -                       clocks = <&cmu_cpucl1 CLK_CLUSTER1_SCLK>;
> -                       clock-names = "cluster1_clk";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       clock-names = "cpucl1";
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu5: cpu@101 {
> @@ -139,6 +147,8 @@ cpu5: cpu@101 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x101>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu6: cpu@102 {
> @@ -146,6 +156,8 @@ cpu6: cpu@102 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x102>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu7: cpu@103 {
> @@ -153,6 +165,210 @@ cpu7: cpu@103 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x103>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
> +               };
> +       };
> +
> +       cpucl0_opp_table: opp-table-0 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-130000000 {
> +                       opp-hz = /bits/ 64 <130000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-182000000 {
> +                       opp-hz = /bits/ 64 <182000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-247000000 {
> +                       opp-hz = /bits/ 64 <247000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-351000000 {
> +                       opp-hz = /bits/ 64 <351000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-442000000 {
> +                       opp-hz = /bits/ 64 <442000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-546000000 {
> +                       opp-hz = /bits/ 64 <546000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-650000000 {
> +                       opp-hz = /bits/ 64 <650000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-806000000 {
> +                       opp-hz = /bits/ 64 <806000000>;
> +                       opp-microvolt = <656250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-949000000 {
> +                       opp-hz = /bits/ 64 <949000000>;
> +                       opp-microvolt = <681250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1053000000 {
> +                       opp-hz = /bits/ 64 <1053000000>;
> +                       opp-microvolt = <706250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1157000000 {
> +                       opp-hz = /bits/ 64 <1157000000>;
> +                       opp-microvolt = <737500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1300000000 {
> +                       opp-hz = /bits/ 64 <1300000000>;
> +                       opp-microvolt = <781250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1456000000 {
> +                       opp-hz = /bits/ 64 <1456000000>;
> +                       opp-microvolt = <825000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1586000000 {
> +                       opp-hz = /bits/ 64 <1586000000>;
> +                       opp-microvolt = <875000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1742000000 {
> +                       opp-hz = /bits/ 64 <1742000000>;
> +                       opp-microvolt = <937500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1846000000 {
> +                       opp-hz = /bits/ 64 <1846000000>;
> +                       opp-microvolt = <981250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +       };
> +
> +       cpucl1_opp_table: opp-table-1 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-130000000 {
> +                       opp-hz = /bits/ 64 <130000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-182000000 {
> +                       opp-hz = /bits/ 64 <182000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-247000000 {
> +                       opp-hz = /bits/ 64 <247000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-351000000 {
> +                       opp-hz = /bits/ 64 <351000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-442000000 {
> +                       opp-hz = /bits/ 64 <442000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-546000000 {
> +                       opp-hz = /bits/ 64 <546000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-650000000 {
> +                       opp-hz = /bits/ 64 <650000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-806000000 {
> +                       opp-hz = /bits/ 64 <806000000>;
> +                       opp-microvolt = <656250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-949000000 {
> +                       opp-hz = /bits/ 64 <949000000>;
> +                       opp-microvolt = <681250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1053000000 {
> +                       opp-hz = /bits/ 64 <1053000000>;
> +                       opp-microvolt = <706250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1157000000 {
> +                       opp-hz = /bits/ 64 <1157000000>;
> +                       opp-microvolt = <737500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1300000000 {
> +                       opp-hz = /bits/ 64 <1300000000>;
> +                       opp-microvolt = <781250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1456000000 {
> +                       opp-hz = /bits/ 64 <1456000000>;
> +                       opp-microvolt = <825000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1586000000 {
> +                       opp-hz = /bits/ 64 <1586000000>;
> +                       opp-microvolt = <875000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1742000000 {
> +                       opp-hz = /bits/ 64 <1742000000>;
> +                       opp-microvolt = <937500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1846000000 {
> +                       opp-hz = /bits/ 64 <1846000000>;
> +                       opp-microvolt = <981250>;
> +                       clock-latency-ns = <500000>;
>                 };
>         };
>
>
> --
> 2.51.0
>
