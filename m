Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9EA3264F5
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096541; cv=none; b=WaEnHzI3JEfBEUbguEyt9vqo6luMKIhKvN35BFtpYS0pqWGTZ7D56TQUfo20o1/AHIiXYs+QIp95b7Bify1eFKlvm0yzXFsIBHWqGIxxVnszVbS2HK7FFJmCJnrEZdK+32IbBygM2fihnqfwdZGt9d5FMedi7SKS1Z50priMSLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096541; c=relaxed/simple;
	bh=SRq4aV3Vv1KtanwaZu/HUbm5QTW8rISjxiq71Wm2JKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEgWv2amMJ0YfhAo0EW9laMpE09TW4J9hyJTbP6gXQ7JiZodk9qO+JlPGVm80QzKoUb5bcKxAxZq3qRv9uyQE+998DsZB+69yBXS+kpcB552Eh80/mwZUg3XMDJzCRaPzD7US5LMsn0fRLEJedpkDys3MViNG5guAmEEeesJy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QCub6Qf+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QCub6Qf+"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c16794450aeso50453566b.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096538; x=1784701338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=QCub6Qf+MgAgUN8YEkiJsAGCdSbQOERO9GT8YsSf1WFstWVlPeDSr1d85CeKaFAvlY
         KzFIE9BU4ap43PjAPXPjobmNzFj4ENp2gvdCjdR1uP3FtEmdpfnWwptoEed7By23Epl2
         HSWVrlqnWDHC0j947kJ4O4S5CiCsS/E/X/3CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096538; x=1784701338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=m257ZvHPeCwBD+gvaUl8mjrzc0b1i5wFcNXygdCnenJfWMgZSCaj8JFuBzHJHMY5PQ
         blMQI6digIfPRX47efWEIRhHRLz5X7Ids8rQcl5zgXPmhoHHCTmTPDJdbEuSgZR2xspI
         DOCDYXWPhyJ82O3tr9kWxENheG/9x7IHTug0DswPL9TlpFNGU6r2WhKa00Xepx7pvGpl
         sgNitElRHwFyS5+/lZLkqBW1e6pt1W5ZRvxPS/lj24yS14lAwP1vWZwSWUhsFyuk+wcb
         SPvSjTbB3T2kSFgCpZ1cjFUMKTJz5m/GfSqi5h7u+jcyPUvCH+2Li8JQr99JMDCodwaD
         sUaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0UZgipApiYsC57ngQ45JbeZkcOR1BZRJD99i4DSqohVWLaBGQcItxPrLLXdBXoS8yjh7TxaAEhasG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf9obkLfVCSW2ABw/o7kFm4XOmcQZH3IOWoQBNJZDFyfYJSa+q
	JoN7AqAmOy6VtFczmHwFsuNbbhR9GumH+qPKao7gmLFm7eLlaUvWtCOrSvfwxCpGpl0=
X-Gm-Gg: AfdE7ckjbhImT/vH8OrkrpuUIkJdLdtv8iFa8C2kHwDlhMh9wtmg3uAevHSUKq7OqBw
	eCvLTfFjtLSO8Q97cKGE6hDpKSw2qpnoV3TTiSJCwe9+zLvL6X2Yr1lKRN+8mWgTfYbaBkyC59R
	3W9YL4gNCUj+HGzwexpnOWI6Z/KVxdKOyIYQ4LJpkEM8fw0u3eRjXx3JcZOQe+i94zRvynYuCXu
	bcsbtGyQn+pOywBAU+rP4Q+kmv4xBo/sm25HBOdXlMYR8ISQR18SRGD5jyYM7zFouNPy0dqaXb4
	T7oHOx7gEixtvHZ282BPsjNqzHOOW9QqJWR3BKJfczEVyhwssT7imtaNUvBWoA2TBED3vrnsUTC
	J43mR5nc+Dq0E+NNYwjdQHUjVHSKvlX9P7YNJluZ5hBsTXaKpxEWUj06t/OvjS1Ze/vNsho3OaS
	OjvYi6A9kuV7xjnRSJbyKJgJs0cNx3x6Q+PBtCFeb4pPABVPvq3mmoj051PXqovo1j/1B7WOc5e
	YBKNe4Qil/nXisFeMV/rvI=
X-Received: by 2002:a17:907:7292:b0:c15:ee0d:9a32 with SMTP id a640c23a62f3a-c1661680353mr381793666b.21.1784096538053;
        Tue, 14 Jul 2026 23:22:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Wed, 15 Jul 2026 08:20:20 +0200
Message-ID: <20260715062201.3599458-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..ae36d703532c 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0

