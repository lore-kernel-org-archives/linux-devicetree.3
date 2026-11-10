Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285919;
	b=HGDN4yTcuPxrXk/h5FAOZSDI0YZaOs46FtfwlN16f5i0OVphqh04eQGN5f4nmVbM8aL9
	 0rQa1i8dyQVnvXVIRNNeCgta+wSbu92rDXjf2mqNWG0zCjJ0BW6YuELB+jCqMo0kHICDd
	 dQZUQl21/yshMglcu9KKNNZhnJSd0/EIJHXZNzWeWpzfvriwqhvkouTfg16tAnxZN1Qjh
	 jzr4XMgh5PUhRZNF+jMtW8MIs1+rWHVihb6iFz7tPj0bqIlSbk8isV0Ta4IZm9g8wAOsr
	 uqPbCxRIMY+Knsk6pMPsHTk+FiGMXzQC0NZrikHREnLfmDQF48tBRoSSYOky65kNU8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
	b=G8zozaAE89t5DHWmGqYdJuVBl0GESDxEiApLwsAs5wJtcrJ8qkskOlT54/lKsKQa680g
	 mzSYYowP5F9csxMZqzTTdKg7r6kh/D1T4HkiGbMkmkxHwV5Yp+fnsd6ihCU6AMXSHxddl
	 ivG+LnPfYRJvXP4v/sImqhSLD83nPdMZcE1WCZgocM36vyUv/Hopo4osvD8Si62X8e8XI
	 8X/J4EIyfMtxI1wdIwFCsxskpe3bmCUpNtjNdej69SKhvZ5YhzRFX13F28tI8zsIzffnC
	 EgC3TilTO8DUPkccKagNzNjO3SVkiD3LLGVScq2PbJARAnZ9K747WXxrpYUUtUVF1mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqBXmhMY;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC89606A336
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC89606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqBXmhMY
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6de2f213b7aso551998eaf.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 20:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285918; x=1794890718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
        b=yqBXmhMYPBOK3exAqlDiiBCr64Uj9OAXfncsQtZQgSfrPNJuNwK5pxAxgFLtoemd0t
         lEm2zWsN9y3WE9BdYQnTkPI5CrBG4+aUyctuLz2ycqF8nkpV52uV/Dqxn3m6C+pZFcTX
         awaeVaWN+fTFC1Pkfnxp6ShcnFn+ibHX49kmdMA7iKiVvg95cFnnQYs+v/HbqReL4UAO
         vAfFQk/bVib/DobCme4GbS0qvYpjHglAzB8taUDptfzwhr9Fch0JNU2P8AzPwySu8HLW
         iUv9pGYjeFnVp5dWIewDNCUSZ7RBrBFDBKSnM+QlaNDjg3U/bKWgIDtT0ShQVQKMIcKQ
         mHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285918; x=1794890718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
        b=uahwj5wrnVJl9JOnpTLSXaSW9DbFGJCy09HXmkgtX0sqoc5Xfegnblhw9D3e4vT/f9
         Xw1CKP2+ejQ2YHg7WZCRvzdT3P51ezyTdOPzpgD+AAOtGq5tSe0WBY0bzbEHk8KfBIpY
         x2mYSDotWE35LHrmuODOrhfEMiImFkFGJHeLBWKwy1jgBTiz6N3bDOmWm03M3K/j92o8
         fdqUcTJnxXyvx7DnYkTwttmUlppRdMyGUVefdjYED97N25krbh/HEsg6Jf63Bu1Kg9dn
         r6s4KJicsilY5w08UmXM5KYbJvmqg1nw3aAB4HV74zX3+MRWqt2A6g0X7Z16MT0gRMAK
         Dm1g==
X-Forwarded-Encrypted: i=1; AL+hErFgCgAtAPHw5BCkjIjJRSvHpe1+D/o1vD4o+hkqoOTschalEmD8O7SoVs3lbClT0zpv13tPIl8XWiYj@vger.kernel.org
X-Gm-Message-State: APuU4Z+1zm84aYhMwKGb8FhInwsMTzl7JMknMw6oIDWR+kml5AQ4Mv56
	GbW/7D+kJO22IE9p/RWvIJXQTXZtefLLfuMERUKpygbFD5Rc7vpbbHOB
X-Gm-Gg: AYBFou0Rwwi7oJFiBUqIhR1pERZW4Gme2L8/zZzN/h5Z+gDrlhoOg0mMd7oAO/HrBqt
	nNqKcd55gA4U9BctBOvA09KROVu4lwTuEiWJfhIZg+0tm2AvU+HdVEMVCFSnSxCSoDlTTCqd9pK
	aWEfp9joQ6tKcu+7bsmUOnl5STWhbgZ/I7la8shNroovCwlByjQG2UaVx15ccOLTjIJwSEr0ZgN
	qJC1UIYh9+dytdQPWsWdRGzPmx8syd6ceZutAsg8n/mymjJXxXIJOdw06eWW4GpuSFCMhNeMihZ
	irzi1lZN+rr2kLKn1LZUcZATOk2kPYIxOPSUqTgiD3B+DL1jGr3DtAg7Ur99ItBFQuUjfBcB0nW
	myxBbxGd9Ee2O28+2ZLnDwOM97eyub4RhxxGsDPVdUHq4GfZmE2Taul0WcPD/WQLKVI5O/7cccN
	oFczGFHoMm9fDXSCEsv2qEA0fOT7jPJnLYoqZsg2nLkbIqUbdrTGUNKtBvC4xccMX2fl5pJPlHT
	uNo/H8RtiSuaIls13LEwJzy7FHxwCQk9oqQC4jpEebgPI8Wdf7WLF1k+zui+Yh7lhTngyWHi2lK
	L2jYF27BQv6YGBFS41QNS77I7TLoe//NaEXsnFQPmv+bL8YyXpnvBWodu2SHMi5krBsW84Zpglq
	oJc/WKg==
X-Received: by 2002:a05:6820:c453:10b0:6ca:8e07:15 with SMTP id 006d021491bc7-718a197a67cmr482559eaf.7.1794285918159;
        Mon, 09 Nov 2026 20:45:18 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c5csm876306fac.16.2026.11.09.20.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:17 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v3 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Mon,  9 Nov 2026 23:45:15 -0500
Message-ID: <cover.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the initial Allwinner A733 and Radxa Cubie A7S device
trees, enabling UART0, the AXP318W PMIC and the 3.3 V microSD path.

Base: v7.4-rc1 (6628e7d4c6b25c8d18f1345e3a20d21829aae7e4).
Previous posting (v2):
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-dt-v2-0@gmail.com

Changes in v3:
- Defer SMHC3/mmc3 until it has a tested user; omit binding, node and pins.
- Rebase on v7.4-rc1 and list public schema prerequisites.

Dependencies, in application order:
[1] A733 CCU v6:
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[2] AXP318W PMIC v8:
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[3] Pinctrl IRQ-bank v3:
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[4] A733 8250_dw v2, patches 2-4:
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[5] Firmware clocks (separate from CCU v6):
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[6] Pinctrl voltage-mode fix v3:
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

DTB/schema checks need only [1] 1/8, [2] 3/5, [3] 2/3 and [4] 3/4,
applied in that order before this series. Runtime needs the full CCU,
PMIC and IRQ-bank series, [4] patches 2-4, and [5]-[6]. The clock helpers
listed in v2 are already in v7.4-rc1.

Validation: arm/sunxi.yaml schema check, W=2 CHECK_DTBS=y DTB build
and clean git-am reader test passed. The November 4 DT v2 RAM boot
exercised UART0, PMIC and MMC0 reads on Cubie A7S with vendor firmware
and pinctrl v2; v3 removes a disabled controller and unused pin group.

Untested: boot with pinctrl v3, card writes, hotplug, 1.8 V switching,
other UART/I2C and storage instances, RTC alarms, EL2/ITS/MSI, and
physical BLDO2 voltage.

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 +++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 601 ++++++++++++++++++
 4 files changed, 891 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
