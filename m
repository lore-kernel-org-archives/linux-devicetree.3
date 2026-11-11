Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398601;
	b=k2RqIsib+l0EBrnzdmWvKzRrxmRq0eQTMpztFfqE6LCregdF2RspdxOoDpxpeWa0AHcn
	 +cuhn7JY++AT7J5LsoPSPE0wew1Kae4zho+Uwdp9KH67d+/Dg4KpqekMQp0bRa4LNUfpi
	 zKOHPUt8GY89K4WDH9zWqo1Rkxse640YwyfIROV7O9THN39nGYBN8+o4/XOx1K2NFQ4+y
	 E1pTAMiNBwu+tDfLkkxsZd1/UURLODrHzIGxJnH22ghDKdXU8eGahhKcBu2ltX5uIVt+O
	 LNwWXp40h3ygGgtvo+AmeZsiE/HftoyXZzvcLIqSRd0aICuWS/KULy2tXHhJUw5ZCPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
	b=ttFSxAsydZqpCgLLT06cYapCj700e6sW5AYtmEBnAD4yPW3f5/ay+J1FsIZtFsJF3l2S
	 MfldecNeY8/luhN8l0WmNateEvp26wEWfPtHm8dPbLzhh3BG4dP6cF059D2KjQV8JFNPj
	 JYCGz/9KC/5lc3eFkxrokYTJGygSFj6KsNEFTVHf7qadZi74Qs000RRHnaNMB+G5dCu+R
	 UfvJiavDJM1A1RoSrrLpF3hKaCUIkCzJNuy+0ZMaAP49ljFjusypDseOSrehTD9sExHmJ
	 ooUDNBZIwu5QOuLnVDs2XanmSqKx/4tKmkr2boW6+SmX7bNaD7EuRWfAkx8UGOAm1Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBkjc51O;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2B606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C2B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBkjc51O
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67c6f1019a3so371917d50.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398600; x=1795003400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
        b=pBkjc51OphVSOwhCdOltnrUOcIL+F7afGlrKKau62RTGi32/YVQDIKIW04qh/UBBvA
         QI6He6DncEKAh8cGRS71C2ZNdmAb0l2CUZ89Gs1s6LqPsE6pfoahu4VEMa4XBkqwfUnV
         94n4yWd735Iq8TPKDKK83KglYNHINHMWw/9s30LzxAQoVQZINKYU0oeC5PJyE3ACGrcU
         vdzVTUFzuj5u3sLLooVDjzbJhPmBU/FNyaRFESone2QJPCNr9EJqKwMIVMxB6xTPC2qz
         vvijN6NSqR5wM7NFuHwoBKaDLIC9QdlbHQKSMJGZISI9bO0miG5wxpybrtynJKh3wVtb
         Hh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398600; x=1795003400;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
        b=Wti476wRI0FH+fHGzoCT7I+USG63LuI5CSQz9yGalnsGyOkeBHsF4MCpEAdfpGJHti
         pAmaAMqvWrLJ4JVtl3wOoR9PpOz86qE7SNzvLbqAYuKX7P9IkG5rA6bHEIe4hrxwIgjY
         c12X726R1efkfUJzHyVeWN/tjoQvOPfYNnWoBQltBKqN9L+Ab7CmfazDHwNUOWOpOXTx
         JcWdcFZQfTiePgLCZrnfNpWiv7/YoBbllqwKux9qqWhvCVrETgn2Bqv6Vn8pihFfZvgE
         4oy0jLxi5ko6pwJAe9/pdZaFUf27nu7kyop6Dr0p9eGo0tE8ud8ktsHGdNCfjJ6Nq0sA
         iA0w==
X-Forwarded-Encrypted: i=1; AL+hErEN7BfVRcJoRhGTlbw7LbfOdquwimKZ/D6/pjh+gSGIG9xFcPiK5ki+rvVN8XpVunmh+DJwcenDhMyK@vger.kernel.org
X-Gm-Message-State: APuU4Z+QaWGd3+S865tv2ZS/dbvYt0IL9aZheoFVTTBpl7PW6AufIDjy
	kmIModYyvDT6g1w7GZyXCztkobYe4wvkgcjfm7rp8Y2ZIfPYrEAaOBzx
X-Gm-Gg: AYBFou1baJk0X9fcc4QAdDRJPNoPvDWPxMgfP/LTe+x/NE0G0CCLxnH2MZqx+EZfBvE
	MgF/t4Ctf2313FCNCynehDIv5HxLjQtwmMXvOk3q3jzIlM6AW0eo4yv+NAlHmBq+1VYsqM1Eq7t
	1dsQ+K1yOti6VH4RJGPZRIqOTsORBPUjmPWYGYYC0ttg9fQ8bmA9NW8FUnZF65WUDAbAlmjA2IC
	7uEW6dbd3dknmyZGhcnLRivq7GqS8O/pk+vTubYLONBmL6l0lo2yvcVoSPvHCmhFEyRN+6i8poQ
	bJXkO6Kg2SeoOKAWoo7xzkYZ9FYpvPrEcIunrXm9Kx/Nn/6ITB0MbfTOSfr/oA2/JD2dtVjF/XO
	Jeo5TuYIE6y2UBaBqb93tvTbzqJIooMI80Wa3FG/JusDbxdLL/c1yjAbPLVfUXQTsIox9U2C13R
	nbIMEFjDrTwPIn3tXhuhlCEtPElVe3WRRqIvvpOT10/JtkUwVVB/Dv0TPcYaTc/6s6mzSOqtCev
	ZOZ3Xbk89oNMyRDNUAmfShd7umOCkHlcdLh3hu67iLkPqqoRx0mFmi+E6ffPNXJHiM/7xu0/2EF
	F908RFcCsa2IhECPIhPO6POCOanNDk99wCa310BDIDgm5ZpXO5NtkOb0AyDJxCtMPNOKp92yFl2
	5d9Jp9U5W0EHNovSp2CnZuEbY5qrm4io4o5zdy8ANkW2J/iXtcszfQiuHvTOYst+SEvnHpr4lUu
	s=
X-Received: by 2002:a05:690e:134c:b0:67c:33ba:4367 with SMTP id 956f58d0204a3-67c67fee82emr1588399d50.123.1794398599941;
        Wed, 11 Nov 2026 04:03:19 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a09074sm4389527d50.18.2026.11.11.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:03:19 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Wed, 11 Nov 2026 09:02:35 -0300
Message-ID: <20261111120240.32497-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/9/26 23:45, Enzo Adriano wrote:
> Provide the SoC description needed for the Cubie A7S console, PMIC and
> microSD support.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z

I tested the A733 SoC dtsi with the posted prerequisite series and a
local board DT.

UART0, R-I2C0/AXP318W, RTC, MMC0 at 3.3 V (hash-checked reads and
writes), eight CPUs, PSCI reboot/power-off and 20 CPU hotplug cycles
worked. GPIO interrupts worked on both edges for PB, PC, PD, PE, PG, PH,
PJ and PK.

MMC0 card-detect hotplug needed my separate A733 EINT-mux fix. PI is not
exposed on this board, and I haven't tested the R-PIO interrupts or the
A7S-specific DT patches.

I'll send the A7Z board DT as a separate series based on this one.
