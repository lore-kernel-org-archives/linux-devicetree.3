Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4A3ACEEA
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775736481; cv=none; b=BCO4VZbyzoQhtJ8B2GKk9E3sLlOoHzwE7VS7A0/hgOujMQCX25JIU9jRFjGGsioKTj/RlPB3gYiqOXfmfc3BFjN8mHUc/kei0Lp5PBfpzZMf5nDkHCPEN+Zyq1TwmDLv9dJiVXy8G86V+zygiQJCpp8+2MJh+1Wlw4jZxlzhLmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775736481; c=relaxed/simple;
	bh=ir1VdmviffzXBZPmE93/M0r5Z01m2FdEOc1nRHQQYMM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=K+IZ4/rhAcWOd+S0H4VbngPmrl6OnyrU8mgpbUan8zgO9HhzUlnIM/+Na0o9wvg8JZwyJndgXVamb1QeXaOBF0776dLy2TGcyVPHJj7PHLHhmOp3LOvBTUNYJKlLPQuLwSAkxiBvm2EYeOWdudAA+6aUV+DhlOxH+O+3ZqeURaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzfztKj7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzfztKj7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d02a71526so467614f8f.3
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775736477; x=1776341277; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C159+BoCf0JeccgPtowgYy9MrOmnFdOSeFm140he7+U=;
        b=LzfztKj7xiXIaFfy+V5Zg064uDxB8CrD+BmlL+NOkrDbp8qXNkWgRpaplSCw5aYrPE
         8O9AKOv7WqxuCrUUdS88N0SSIuJTi6B0wLswV3BYOed6BMdJU16nXjHzlOIQxAoMCpuu
         Lild9e0VgwP508J9OZROOhmfh1Uo3DupTUH36G/VVWX7cW5+DAZ0e8gIUAfpd4aBItJq
         5pT3/ObsrmMd/JslfdF+PaBsf3Ou3rtcps5ZCpCpZBbXdPfPH71bAdCK27GvKe9/zr92
         Ng6orys/52s8biAMRZuk5ZuHbYUbwlz5ecObGXSyNHrASHo8+4XM/mjZCcKjrDYNcRKw
         N9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775736477; x=1776341277;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C159+BoCf0JeccgPtowgYy9MrOmnFdOSeFm140he7+U=;
        b=dM5+mnT/DCzOpF1QJhVKKREirdHFea3ElqTno0+3byPw8y4P61jsXQgGRr+TLJSY+C
         /zQYZJHTojFXG7eANrX7+GckH2f3xfhVi/BH1Wi1Wq4AaB3NCPjKUIeLbjvQIX0KVH8m
         nvvmxxRp0Pfhj3ITdoR3CwYU9yIyGj3cZj0FJQglgD2qN5vz2e5GKcy+FxZ+fiTAyf8G
         uifdFkPbA3LWoah4MENbtyFD16ohLbs2av1h2ud5zfIWbqEbhaQZmZsbbf+TSsR8ywqH
         UXxq0nQzdSQo1wLA2Kt//Yy5MJl5UCTcdT/6AE+4gIgXFUNWOeV75mwTyRilHVyFNRNc
         Gs2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrupcn3ZPcizt335DvaDuP4+vEzLt3bWunnWBz0JleJQKIcs18alPGT56RWgteGKkbKaYNkI5tIOrx@vger.kernel.org
X-Gm-Message-State: AOJu0YymOzXuolfF+9iz3uwewr/TbUUH+IoHulobTzpLtps25cYoNKrr
	tnzf7GqGhkcJmhcFrezkzv7YXwc4N+DoYPYQ3ZDpC0x3Meyt/v6UF7avi4nBuyYco/0=
X-Gm-Gg: AeBDiesHgZ5DH+LCCBchInE/29sjpEWkNaxBDGzMWiOWchqNgP14NILmBt0fd7EathD
	9AxJUKXfhsgJ9bYaM3ga7ZXgfTvjjUbbOHIU2EWSBivqbTLSiHhBHN3IKhD1jaxEY2fhlSZg6si
	LHah4wcRntJWCXQi/lic8Hg69g1QCrISY09oVYHgSYvD4ay2so1LCkeW6HXOjEV++JTkCRMuW8V
	cJLYhFAoui/UoPcg8p4QQoYUsAF810rjBqjqPpdJTwyrQm0GsZW6wyRWL39jnv8hXfDNpAUte73
	YKI9KdnEZNmg9wpHYPFEZvJnpAW68SI0ngIP6WraWpcDAnsghuiuKgXW6nwzh7MmCZIOP1cCEZ0
	wecFzy+arLpBMN28tAjCCSWpHQGNHoHQ3VyPI06CewKBUjaiVu3f5zMiwb3uLRufpFSkVFDXcCn
	7mTNsPtZqIkF3G3BurRhMax2yM7w7HlCCLbdh8rBECLsga/MAcd5jNFCFkwvPNSJu7iFzGHkDOm
	A7mxJ7HJR9sNJIxd55nEPa2ay6Q
X-Received: by 2002:a05:6000:2086:b0:43d:309b:f2db with SMTP id ffacd0b85a97d-43d5a126f8dmr4358618f8f.7.1775736476554;
        Thu, 09 Apr 2026 05:07:56 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:e6b4:ab32:911e:de1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2971sm66154263f8f.22.2026.04.09.05.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 13:07:54 +0100
Message-Id: <DHOM1MT2MQON.3F5MF0V2RYSFJ@linaro.org>
Subject: Re: [PATCH v2 5/7] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Henrik Grimler" <henrik@grimler.se>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-5-c5a760a3e259@linaro.org>
 <20260409115630.GA15706@localhost>
In-Reply-To: <20260409115630.GA15706@localhost>

Hi Henrik,

On Thu Apr 9, 2026 at 12:57 PM BST, Henrik Grimler wrote:
> Hi Alexey,
>
> This patch breaks compilation for arm(32) exynos devices. Compiling
> with exynos_defconfig I get:
>
> [ ... ]
>   CC      drivers/soc/samsung/exynos850-pmu.o
>   CC [M]  fs/squashfs/page_actor.o
> ../drivers/soc/samsung/exynos850-pmu.c:17:21: error: call to undeclared f=
unction 'MPIDR_AFFINITY_LEVEL'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
>    17 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                            ^
> ../drivers/soc/samsung/exynos850-pmu.c:17:42: error: call to undeclared f=
unction 'read_cpuid_mpidr'; ISO C99 and later do not support implicit funct=
ion declarations [-Wimplicit-function-declaration]
>    17 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                                                 ^
> ../drivers/soc/samsung/exynos850-pmu.c:48:21: error: call to undeclared f=
unction 'MPIDR_AFFINITY_LEVEL'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
>    48 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                            ^
> ../drivers/soc/samsung/exynos850-pmu.c:48:42: error: call to undeclared f=
unction 'read_cpuid_mpidr'; ISO C99 and later do not support implicit funct=
ion declarations [-Wimplicit-function-declaration]
>    48 |         u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpid=
r(), 2);
>       |                                                 ^
> 4 errors generated.
> make[6]: *** [../scripts/Makefile.build:289: drivers/soc/samsung/exynos85=
0-pmu.o] Error 1
> make[5]: *** [../scripts/Makefile.build:548: drivers/soc/samsung] Error 2
> make[4]: *** [../scripts/Makefile.build:548: drivers/soc] Error 2
> make[3]: *** [../scripts/Makefile.build:548: drivers] Error 2
> make[3]: *** Waiting for unfinished jobs....
> [ ... ]

Thank you! My bad.
I will check for the next series what I missed.

Thanks,
Alexey

