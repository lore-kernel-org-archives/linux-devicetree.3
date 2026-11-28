Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834344;
	b=b84ZLYSODE1RpdqF4r7BEQAw4NvT4KzH2z0wAoq5B/1kaWJFpnYC80odNjkPk6EksVJA
	 q0Aiof8VpAbbYB0J7ahnjCY31mflJL+5NBYYixoijUFrfA8NL0R9P+EyejFA5rnZgxJs8
	 FwEH/jUbA7zz7cUxgx6ULcijzHv8pj4pkF9+eGGAZNXAb6Uag+riPDH5YfoM2ZDBFLIMU
	 4p5+a8SSxRys0N6zv9NT3zgLuzan15DG6Wg97raDfpuaXI9YJwKR8lOiVMJV81tdWhPLw
	 ZmCJdFyfCca/6xh0C07tuXnQKqDHrDd+xbk+hzhGCBVhw+Aot/BeGqKxbGLsbuZ96+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t00wUIQOglo4PlqX8mnXlhh7m8/kx6uygSjOG16Nct4=;
	b=TEIbu5cMnV6VgeT/wydSiDboU8bqbyHa4Fm1tTS5mnE0W792NPku3M/1xk780f8FnWeR
	 5HB3FSWtexWyavYCEydTUxz6V4uwFIqFD96p7jNNY1yYtrV3eIsdv3ndK9SS7r1Sgm0Q6
	 CtbIzxhEqcbpMfHN284iTMpRT1PuRiJ6Rz+RPj7wfDYZVtO6ZvMOAO4pBg1e5Dmxos3QJ
	 8k/2Sb+47stIe0AiaVrt/V4rzm0k/NYUIMGCuTPF+ruAupFD8hHt8o9r64TQJIZR5Ypwv
	 RbHIkFtdnokOC74dAN6NkTOCoanHaCyRehqhzO97stzN61UeOEp6Lx8T1df+ORd/7xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eXrOaUP7;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC955606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 02:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC955606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eXrOaUP7
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f020d0169eso43102065ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834343; x=1796439143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t00wUIQOglo4PlqX8mnXlhh7m8/kx6uygSjOG16Nct4=;
        b=eXrOaUP7ZMi7Y5YkwsA3wJ1/qilJCUdfCSQxmvukSfpUrVAZQ7M7HGEd0RPXLOBf7U
         iDLe9YM/IXea5VEUXvxOHkyS7ILU/5rH0Ij1A6p57c+X0n5N2q+Vlod0vcjDx6Vl4OSz
         E7JRzqsNZH3AL5YU8qeXUZZ+v1IS7+GP9gf2LzILmhX2r5kDG/cHO5Yl/DyTeF8edn0h
         fJQIx2RoId/lZrHZsDiZjBr/SIPc3qmcvLTvQ62rxVnOpxTTNE5qUrA2lUVW9z+qPoXg
         w2vj95FsKVvK1n3uW3UNOE0Xe/phS7HxIMzUDpGlj5aZbmXfvnqY3PqPQpoPNIwC3nSM
         VLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834343; x=1796439143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t00wUIQOglo4PlqX8mnXlhh7m8/kx6uygSjOG16Nct4=;
        b=baCulp1K/4Z9cE0O0M+w4IT8IMpqaal14i0C1brl+/J6bFK4RPuOP9ujxxLLUVcuYM
         z0C9LuXdZsSKGYsnkKucNCD031fohToch3E4x+dP4pZrYECjV+a6V4TNkOgwEMe5ZICj
         s8hffaCQF3TI67t8a+zEnMQs7HLHzDHeE8moLOVgIYmFwsuIN3a87eqGAbDpeqPhBX5l
         ksMf1mNYSyuZXKNT30j1Amy+KESMp7XTAv4nsLMX7P4ceFB9li4Ee65cJSBh8+5o8PYO
         r4eXKzY3X1Bqj+YDp7xzKth8okrNfQbddewj67Dg8WD0mvxFmk+QgN2o4xEQTTYju1iI
         pysA==
X-Forwarded-Encrypted: i=1; AL+hErHwVTBGQIjgHiUiQCkE6KwQGBCa6J++QIs6XViQy5/SsGRhze9+lAHD6Fd74sUAacAYn5DVCXYArW/X@vger.kernel.org
X-Gm-Message-State: APuU4Z/JV8CN3T8IDYErNp8skoONC4ja2mnSzG+jFpEtSaIWeXj1VLKu
	jtL0Zo+w4grsFCitY57i5qMKxQqCzgEg/ZBs7zEwpduQ+I34UN1+3uu/aVbNuhmsEwc=
X-Gm-Gg: AZFdTZcfdHcZg9aOrxk58K81ERPwW4YOmaQlqf3XHuvZ7BQNIOeCkBNz5LJWkz9c9bp
	B61NFt2264voJDOmy9zCmzie4IDO2sInTZBT3qtA2nZ/kldkaynzmy8pzbAK/V+KWjg9Yx0nuYP
	ayAlD9uZ4imfHthOvDDiY6/m8sr/ldxy76RocN4Fs+0FwZ/PYdHH0xG/7puobwkl9HysPNVqviJ
	OE1j3MkELJxoJzAfQEH6+twrXKecN4h5mZN88prziRH1jeSeQZGR/ByWDenrWeatOiimnBr+liW
	kfQTG3vhg/67hpCr7iYciv3eBxtFecec9kgyiqz/rh02trjiQlh618dN4JZ3PYCEbrH/SScxK9R
	yd1fp0Wq9QKhh+YSfgR1pUDdeYEL+nJtEouIRenH4elSmeuBCJ7ufeXMcC2GHgHB2Nz3L0DBkUI
	tDRqHnlSArrwanORatmfdQdvksKp1YC1xauUCN74CtlSO7qY2b6mTCJoxafCdPj4q/W6UTTgtiK
	FOj6DNx0Fvw17zw9aiyMLVXtV1gE379P/Pc+QS0OoXw+tGdG9xfewaG59Y41rVb5DHFEl14pKOH
	J1eT6TJx2FB113tR+Qe0ffs7hr61DTrYV/JY3GVxXuSrZ6vM+oSI7qIBsG222YhFAeQO40MlkH8
	bR0/885Wk7JvPIDlzQ/bMNmrI+BU5vNAwd+E=
X-Received: by 2002:a17:90b:2f8c:b0:3b3:af8e:ea8d with SMTP id 98e67ed59e1d1-3b41c92a403mr26168454a91.39.1795834343106;
        Fri, 27 Nov 2026 18:52:23 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492174a91.17.2026.11.27.18.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:22 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	devicetree@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH 2/2] ARM: dts: nuvoton: npcm7xx: Add nuvoton,sysgcr to watchdog nodes
Date: Sat, 28 Nov 2026 02:52:19 +0000
Message-ID: <20261128025219.2679805-3-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261128025219.2679805-1-william@wkennington.com>
References: <20261128025219.2679805-1-william@wkennington.com>
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

Since commit 7762911c0d8c ("watchdog: npcm: add bootstatus support"),
npcm_wdt looks up the GCR syscon via the optional nuvoton,sysgcr
phandle (defined in nuvoton,npcm750-wdt.yaml) to read reset status and
logs a warning when it is absent:

  Failed to find nuvoton,sysgcr, WD reset status not supported

Wire <&gcr> to watchdog0..2 in nuvoton-common-npcm7xx.dtsi. Tested on
an NPCM730 BMC, clearing the warning and enabling bootstatus.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 3862adf85b68..e9765fd6ef8e 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -375,6 +375,7 @@ watchdog0: watchdog@801C {
 				reg = <0x801C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				nuvoton,sysgcr = <&gcr>;
 			};
 
 			watchdog1: watchdog@901C {
@@ -383,6 +384,7 @@ watchdog1: watchdog@901C {
 				reg = <0x901C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				nuvoton,sysgcr = <&gcr>;
 			};
 
 			watchdog2: watchdog@a01C {
@@ -391,6 +393,7 @@ watchdog2: watchdog@a01C {
 				reg = <0xa01C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				nuvoton,sysgcr = <&gcr>;
 			};
 
 			serial0: serial@1000 {
