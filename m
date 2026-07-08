Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9DD3A6B65
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783545519; cv=none; b=B9E7rM61lvBHs3lsfz1UX9s7mRY3uhoejM81r+pFOHSIqj6V8dfMe/kqC1LJpcKnDGR2jVSUX92gWrbKA08/wo2FQ+PKyBOE5ZeYK1+pdlgo33pytdbN87S4pNGKYWJdFOrB+RWn3RMh3GaEIC0wr2HzmzodfAuCO48ARJLSAks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783545519; c=relaxed/simple;
	bh=EDQPvvbMQ9ScxH9hOlf6W01xdBRPeBBObtt/dSq3uEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUMUvw7hO7avA5dR9yE2iylEhPikFMriH0nnKOKwSClyLK19fSjdvJsjdWZEQEX1Gn/GPJO0/VisNTP6PutpUYWa3q5hmiaesAq7HEBW3TxH6drRib6WaWVFyMEJRPR/z+dELohI44LjkarKT+mlFcgbyb7tsNxfiAttXi7HDrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwW1+Src; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwW1+Src"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so6315705e9.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783545515; x=1784150315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRu2JDPnd+KPGNqW7sFeAghfeumOeGPFi0g23iNWPro=;
        b=QwW1+SrcBde0aiTP7eMIhTNql2wq2Pts+Xs7LgGyGiB1uLwXvk38NZPXAl49tCDpkF
         OhKhAWYIplSNi3keDiqJu3smR62eEuTdWACH+vq088D6myGXQWfTAfzs6PeWj0875/V5
         eZInmMFNf71x8inSLeOAJcEFP1qnV8Vsi8PGk3B+/6gM+he6+CCJBNwvZBLzsHYmwaDd
         M6DCtp2aXQq2BstCyxbmiH/peRjDgv5Wchu0wTIHpgCcOEGhbDzEIrTRMT0azuddNqiK
         6PamRwgdGvSe9pf+Wz9Zflxix5al1cKKLSCjq0/MVl65CNWrWZlBAajmu6n+7fhxG6Vc
         kVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783545515; x=1784150315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRu2JDPnd+KPGNqW7sFeAghfeumOeGPFi0g23iNWPro=;
        b=hstkwd77HFW4j+HyRzbop5dFn+wdI3SM/Dfg0WuvrF4J9fxw1kjF7yXvbwo8eoRTDn
         A2tOM737YzdtJKhGAybXxHQXP/9rQ1pN2mu66EUbGCyXf4OMQRLvkNbuR5t+9pax9h2W
         9a98y9I6GFd+NHnBxVgn0pLJCtr1EpcFxYIxb/LWnbtH8iyzeb3Yi+QFS31z3XvJOSHr
         +VPxt9JhCKl09EayP9CmImxsLw/kltaB90rNgt8/Tv1m7Lg8dz+/o6ojV/Nhv4dqgJ37
         KxbohbXJQd7pg5eyE9yr4/0Y1b6n81wX0paL8IT1uzEuaVaWptBVlFKC+HLGmpMFtK/H
         k+KA==
X-Forwarded-Encrypted: i=1; AHgh+Rp80iTpMDZjf4JAN2jyvX0wX7ZyDOzcveT9MS3lxSQ8wtETNSF/UoCneC4P1gW7PGAcUA6U3aSsm9wI@vger.kernel.org
X-Gm-Message-State: AOJu0YwXcVas8RHfW9kqTyf/tgp5FRy9PnG77n0e2TIAp6X6q9+eoXmp
	aNsWeyvopR6jkS9LgfuM+n5UH1fWaXAcXJ6mpi1yhhxrhXAFZHyiFLF+
X-Gm-Gg: AfdE7cm2AbaYM4EyHMvBetuYSCCZCAHgagluexuj+l991mKHvm2ahQH8JhJS56kz6In
	vSHcg4MpO5HsUZGbPcOphB5PBogyOGy7xZewwB/n/5Jv7QC1EG/8Yxz9OJF7OVCm3SZja8LNdkt
	xWtiv9lwNcKOZ7KsELYtUD0HaGaea2c0NRYOKEh8wnCgpGeUyRWN8n8Y/xFhTSnS9o/CqDoswFr
	Q2NkpCorpTbp7qgyKWKVDRd6LMP0KoK08iDnw12lZyCGbI2CEA8tYUH4HlGEMvTpF7M3+f6Uef8
	Mc4ALgvu8058XTC06J+lSP4/XS4UV3AtPi4RJ9Zr0TKMP73JDTEmuTgnq2UXqy9Zz2Xm3VQXcEL
	qoRfWVNT6fk4RkoMt7l/beAPA5IBpofKv6Z2zYHRs4YIJPw+x2p6uHTVnkYnBZ2KOdZN87rCE1J
	o2UJ+mvcn6LIMMtShMXwuQOLlooHv4YdYWfJfBHvmkqR/3KRXt4z2bd1p+5YY2Tgl27XHSUiPWx
	KQzb9lCzj1R3BiBsIDaytpmBWg=
X-Received: by 2002:a05:600c:1d04:b0:493:df58:90a3 with SMTP id 5b1f17b1804b1-493e68926bfmr42265745e9.25.1783545515083;
        Wed, 08 Jul 2026 14:18:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a58853sm68494175e9.1.2026.07.08.14.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:18:34 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-AM62 and Symphony board
Date: Wed,  8 Jul 2026 23:18:24 +0200
Message-ID: <cover.1783545241.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
  arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts | 545 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi  | 491 ++++++++++++++++
 4 files changed, 1043 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi


base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
-- 
2.47.3

