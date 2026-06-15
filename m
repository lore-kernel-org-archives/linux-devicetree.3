Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7DE2356C6
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781500043; cv=none; b=ZwOXapOJDcWWxUH59ITeBhuNrYw+R0hXlyl10yaXThAxnbsml59cVPusNei98UhBOhvi3ZViDf5lQWGj0ouXJCLfuKTWzEkTnC+2M9cNKcmQodxisAHaWBGFpW1OpHJbNM6Z2xk2G9w1YNZ454QfxxHVcpQ2dgZs5e1yTSbirSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781500043; c=relaxed/simple;
	bh=iNVf5YMgw7v/1a27+G4oX6+gXGKseRTy3IsG+KE4wnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5bCW/J6FaIsXphe3Xi9Xsq/N8i6PC+/LnB2Zq4Jd8SJVg0Ql7f5XckgCXI/QMOfirwE1aYSVUG+d2Vf3q2hUC3VQdgSe8xLI6Gy8/hmjJUsqLExQ2dYFmmBVU4h88CKHC2r6D4DfyCoFxHJNM/S/pbCFQ9BpT3LvfOw3K1goJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ROwbjCRS; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ROwbjCRS"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso19515615ad.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781500041; x=1782104841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/Oj6obfAcAELe8NNKZFmVNeON2ZbUEPKWSKWZaFYsM=;
        b=ROwbjCRSdrLcW/+1H75OoElt/IuJy73o6Avqea6TlWTWexD0sRe0XIt7/I6mD4Tr9M
         UysNsuDNrhSv2aUM6laIQEkc5wNH+edqK8s9IeFIeJyP6xQ6QEWnLr13+7uiaGl9eLzD
         TsNp5Buwm2dRJ0vckLAtM9QJZep09MeflKdKPTloDA5QprFB5lI3AGvddX1t1GbeeEx0
         wkBffgiGSuD1S5db9TrCRcZlPdSXiEAINGPOdFpX4BRAgIUw5ryyod9eKjNP78mrExaw
         PlAKjKwSxABaLi6Bv0ITRd5hF0MVY64tSfA2mTn+tQURa5AGjSxHV4357DrrhtSi2q6a
         bT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781500041; x=1782104841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/Oj6obfAcAELe8NNKZFmVNeON2ZbUEPKWSKWZaFYsM=;
        b=sdQZZsRfzfiNH2LmhUifdj7uIZ/YqkOs1l6hGMGUUx3pqFebFhi44VmHt86xfCan+9
         4nK1WD8Ol2DORhv+K+gekKRCwaGMXB193aoLGUFNg/B+0qB8JxGzYfNqLWwDQDAwgeAj
         /EjxigyBlWOUakiJOZg576K/EdE2QM66ZgsuQ2XoOyvTjkcQUCFgzTfkr6I18QP/mfAE
         GyBKappuI4aGKYtrjHmemqNSB++M2glhRZ1qsDXGMhh+Dtg/1tLrmrIfO+toFkHA601L
         nDCBl6+lgecUv2a4KgaS2HHg/znkJh0X9zlDZX8yb8JdyWMqzKKVr1cHcVp+NFLPkBNZ
         wpbg==
X-Forwarded-Encrypted: i=1; AFNElJ+hiYdHmb5rpib+QJJT2+jNrhPCoC3D4k4Qqc00bwCwFxF7zbVCi5UJu53h8DALsHiHFHfFnJ3it7Pf@vger.kernel.org
X-Gm-Message-State: AOJu0YySsFGQ/IBJwwRHrx5Sjj5j5Ag/mR0pLvYbLWAy3AoQaVwtjMhS
	DMTATNS+P/EXBikuT0RpREaQQZU+ioPo4kpMVJGTIYfhE2ohmo8xgVG8LArug+9Vjv8=
X-Gm-Gg: Acq92OHSWFV2caP3zd7EAWtHB94MANRjwdj7AVoD/EUKPLJelodvpRfbVwIKKdT0qS2
	hMn+/MWA8MwCIeI7klQ34yLuJ8wV6wzCAkdBQd0CeiniZ0VqtYGIaVW/FFGQA+S5Dbff9h8jvxq
	68+K08StAaoEVg5Piq9Hn0MgGS0O6Fyt2UuqKQtK4t7KdTwyIASFGExflK0gXs308dvh12mZ3T+
	l2wQdmQkpuLWFsL1TjiopdfKKvZfT5zDnD7Rx6nnU+1w03xzEAtvxJlygTAncrHXoEKmeKLiYt1
	rdy8Yh1b/ZJnrSfgTleZYAoFPjr/jmlbUDdM6Vvd8JUBfYy7FNOKeei9aohIEZcnLMz+THO8Xx4
	j8uauMTN7ew+U1PcWowdNSnNaZIM1ep8oVXEcbzJaptLKjeKA9JVHd79oi6xaRJp972qB6fhxq4
	GD4EUuW+tAhK5hCa+yv5as/7o=
X-Received: by 2002:a17:903:2c0c:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2c66417d194mr100735495ad.16.1781500041150;
        Sun, 14 Jun 2026 22:07:21 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433558449sm89984355ad.78.2026.06.14.22.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:07:19 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:37:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Message-ID: <lt7l6hvia6hahvizr6qwirgnhzjqdfn4edzt7fakqxbhkcmaxr@x6d5h4i55edw>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>

On 12-06-26, 17:51, Shuwei Wu wrote:
> Changes in v3:
> - Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology

Why ?

> - Use one shared CPU OPP table and one cpufreq policy for all CPUs
> - Link to v2: https://lore.kernel.org/r/20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org

-- 
viresh
