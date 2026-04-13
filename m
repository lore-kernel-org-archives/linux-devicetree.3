Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E844C1DF75A
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776077385; cv=none; b=cDTL9re2eHF5kKaFv3iNTd5xoCSwxq5NiyX6aRv2mbfx8Ai65Xm2E/ZNA7TNZJkULJfreuGqcRWdc+UW2DaJxzdc0Eoj+ctiPd3W/YsoEOgOZeVYeQfqWDp5oQVUh54RYf1TC+45Z4hTODRJFBrmW/MS293jlHvhyGfry/HGs+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776077385; c=relaxed/simple;
	bh=ANNS0ARrq+yqt38ilBc0b/VrBSbg8FDzwRhQod1Hlxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbKPFVQ/OKBKa2LVZ7hXLugtrO++UzbdiPeGNGKhNTLxeIh/wGylvRsY3z5+bGXaKb12cSmKy4m6HV41qKTKBFt1oKoJ7RAQgt/bestHs0yr1tGNFjOR8CLfppWAKAMgguL4Q+b3J2/7v73KjtqTacuwwOt49asbI7+1iIPY77A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a4j8A0+Y; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a4j8A0+Y"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f0fc82c76so1060239b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776077383; x=1776682183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NprvUAprn5meoPNFX+W3YdkJtUZncCH1TUsT0ByUXfo=;
        b=a4j8A0+YGMqH79iuUXJq0wUbDghGLkygnNr6O/vaEjeR+hRw8uPBfKFo6nqwefLLya
         SOJSq4JfWnds3geicRh+RqVVNDpeXeEt+V+F8kY5becVvkYrAi8b61qvIvg8Qr0besK3
         pbIjhi25CNVY6Cj/RuU6v+TeXMnAvARUYtCaju8bg9akOwgrm2HYFDKn8+7JmeIi/BYI
         8LQ3QTozkPFlM19pyCVciDFKZ5QT1JgLx+5HEq2jsCjNQ8HzX8BrOcVkjRVyxJD7N43z
         bwxgi9GQr2obgf/Vc35F0AXvewrJGM+p2Ufnrl0oPp6ttEYvMInMXuNzKU/UKQXLmiFn
         ZpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776077383; x=1776682183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NprvUAprn5meoPNFX+W3YdkJtUZncCH1TUsT0ByUXfo=;
        b=IJ+xim03JQ11ncgokkUxm5SEOUnyCDaadCp31L7DEjoU5wm80mCp5JtCM1Hi9LoOAR
         qzxjpZuaSTdyh4To+IhtCGofee5WfERfgj/86dzhChJ4/YCzF0pZ58x7levLy3F6X8l4
         kaItmX1OqQKbrD8ey/DlijaorXYxFmThEwuAa9mqmCBhm1ZEcUHXiEovdPnRPVdlzOZX
         7Er1H1sthfjpC8XN5iT5+Br44wIVmkMLg2DCcOcXNwtB69WJKHedbWRdp/Aa++dq8jvA
         xJZOwbRs6PUCWerzKMF6KMlPB9lSt+FLtLBOavtiFMZ/VVJPl6CB0988FJJQNw1qNJl7
         nTTA==
X-Forwarded-Encrypted: i=1; AFNElJ/mKUJ4Cjd2fbOzPxnA3uo1TwHzW74lLZevI8znIfVJ5n16LnQMMqDIDD531cvqtZZ7LZXgCdaLyBXo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfzty43i1vMVIyY6tZhxMl773bwk4yjURLeSEyvaChUgRL1JD3
	Js84sTmvOaLoSnq+IDuS/jKMMX6sbwqKpieUi3k42qRh5hrn+9Fx3nHZ5mMfTcGVpD8=
X-Gm-Gg: AeBDietZYu3EPuHcywSokTLOfIc/f5Dyy+0wOx0/V+YsVaxeHSJXUAR1C88RaZyyNM2
	CqSqT0xk+tjrFZEXO7kOt5Zp2MckVvRlAz9mo+BonnGxj6yHV87C9TM2DyXX8Ppkj3ICFBvM3/F
	UpLa6dQC4wvRmNs5ZY1ntDsTdl1R1g3fUA1/gGVmThUgvdgkAyrhkxSXNfPYJQzQy8O7nq2Zz+G
	kppFDX1NfbwfbhIjmyxYAKrhdCVBeBnWMKyHrysFjWRNeBayQPk/gNxUP22A8EM1O9PoJR1K4KS
	7dLw55G31auQc9BmmakSBXdPWIxxR5nz5LdRdRMoPSOAXP3r10PH07DBt50r2REAkaQh6gdJYIP
	AvT22Yd8EWkKFPnZW0jWqEIMrClrbTl1XJxEbPz0G/pdi/0zXfNZFjxp24pMPuTA2DMEZtcD7T4
	BJJ5WzlBuQOR/moJUZGbxdPhG4
X-Received: by 2002:a05:6a00:398d:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-82f0c187fa6mr13079040b3a.24.1776077383128;
        Mon, 13 Apr 2026 03:49:43 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm12070430b3a.13.2026.04.13.03.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:49:42 -0700 (PDT)
Date: Mon, 13 Apr 2026 16:19:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Message-ID: <siqn3bu63fxp7ignbaleamvfqskhjjtuzqp64taynlvz2vtiwq@uhpitslu3xnb>
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>

On 10-04-26, 15:58, Shuwei Wu wrote:
> This series enables dynamic voltage and frequency scaling (DVFS) for
> the SpacemiT K1 SoC using the generic cpufreq-dt driver.
> 
> Tested on Banana Pi BPI-F3, the execution time scales as expected
> across different CPU frequencies:
> 
> ~ # echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> 
> ~ # echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 1.07s
> user    0m 1.07s
> sys     0m 0.00s
> 
> ~ # echo 1228800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 1.40s
> user    0m 1.40s
> sys     0m 0.00s
> 
> ~ # echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 1.72s
> user    0m 1.72s
> sys     0m 0.00s
> 
> ~ # echo 819000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 2.10s
> user    0m 2.10s
> sys     0m 0.00s
> 
> ~ # echo 614400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 2.80s
> user    0m 2.80s
> sys     0m 0.00s
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> ---
> Changes in v2:
> - Move OPP tables to dedicated k1-opp.dtsi
> - Enable OPP only on BPI-F3 with cpu-supply present
> - Link to v1: https://lore.kernel.org/r/20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org
> 
> ---
> Shuwei Wu (2):
>       cpufreq: dt-platdev: Add SpacemiT K1 SoC to the allowlist
>       riscv: dts: spacemit: Add cpu scaling for K1 SoC
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
>  arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
>  drivers/cpufreq/cpufreq-dt-platdev.c            |   1 +
>  4 files changed, 148 insertions(+), 1 deletion(-)

Feel free to take it via the arch code.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
