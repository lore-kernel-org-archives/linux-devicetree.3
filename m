Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834344;
	b=3tShPm9cxmkEL79WXqlsUswdOow2Jzfk+00Uhfz/WItOXG8yhHt9kw1NZCZEC9jxAzmE
	 R7q7ezQ9A5GJbb2aXIOKmL7Rdoum17HXdyBuNCFTCEPKdRxdkzhcKWyKQgSNlmmwTbBL2
	 yjJp5IX94bKa8JXRCU5DOgs0LFHKjHIyBdBcr24Z1J7x/ZpOPKoGHsazXlb+Zbe51rZKy
	 BSlaZzPRplADwginIio1+V3rTG+7V9IDqpLg1p7YiUTWIOtAUcrp0eQwVrDNsRBRB7uNr
	 7Mmm427fAxZFaaGyHLtIVsdrID0TAOizPFTiZI1Mh18Qg/5jpORRWuK+h+0rn+Px5ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mUpNefJE/J90Sefj1ZIu5Iq8L/qVGagwwxyCZBgYA1Q=;
	b=ekE7cfW8IYtCWKFuiCXsJy53cirt91/sKq7JlfWhlk4Rp8YKh+368xtI7DPHcR5ingTW
	 ioO1yNNRmcUcFl01gQ81tkf7DSQ06AAozg6g6LwZa5ukezlmm7by2a52pu4aEHH83S2o6
	 tsx928689dq3oiYHUNriBBj12gAuiPHlnbRc377ZvMd4xPGBhhWhk+O9hpOYxS/72Sf8H
	 /Ds/l/SnAOEfmn98eMz61OYr7mlNZRYaefmti0+sGdwwBeJBFQE5DoByJ0Io6PlI28nHn
	 0X9PB8BUh7dlF4twIAkTi0fpb57J5e1ruT/5NqwHqJGUwpfzx7YGup8TKVb4ZMNqmCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QJXNH1aP;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE96606A31E
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 02:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE96606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QJXNH1aP
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so4102938a12.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834343; x=1796439143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUpNefJE/J90Sefj1ZIu5Iq8L/qVGagwwxyCZBgYA1Q=;
        b=QJXNH1aP4uq2TFqwOhqOoRRoVAopzch1145SbAVmuNTahStP9QdMWAN6Y+IUTFCcKA
         RjF9pO0n51/MYAL/ouYVgvhgKHIy1I3bSxsda27gsxHs5dGBU3s4IC7aBXCIaVGQvqX3
         24duqNnbvIpXeQOkvhZUP90xetahv3XWMf2no/tSOuAf8m5c7Qo5g47lGhre6ue6UgIB
         0tObL229++KXjv983TyzoMhkUw6uhG+SJc6hdVtRntekiwScRLruWA++ukF/WUBQPe7J
         6oBUUahb8M97tfn4Pf1yYJe8RtqXT2B+GgJ8+RUgeWIYc4PacZh2iTo+IU9jIav7V9il
         jIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834343; x=1796439143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUpNefJE/J90Sefj1ZIu5Iq8L/qVGagwwxyCZBgYA1Q=;
        b=GcS452P/kqwkO3hLRG90ARIhpnLwKlY2sM+k95owU8XcjF6a+5f4103AXqEX94E5QP
         AmsEcqtK5jUQwJpnYyOxS1zk5RfKFE6UWlg0wRLLsJPzdigS7fHa4Yp9gfgkyuNeuprz
         rcCUfOOpF1aFrnti1f9xGk5FOQzeAOlNNZyDbPABd0w4ylrxVp0fOzZLZp5UKitBj8nL
         fjPzwTLonaQdP41cNloYkfJGaeoVi/X1Stsjp/PDQIcuhjWURj7CrwKY458aPFV1Sbmu
         82D3QQIS8xsooKW4x8SEZzI0FlYPfeN+UGx+U/pEh9JHgcvTY+50ldnbPRWMXXiTumWl
         bimQ==
X-Forwarded-Encrypted: i=1; AL+hErGP424HHg6Ynx56bt2Zo4Ndzq9g7Cgwvz3qj4rS6W37JkuTZxuVQ9slLVeuSn8cyfxV4QPUQitZswcI@vger.kernel.org
X-Gm-Message-State: APuU4Z8e1dwDebyE/VliqUaJhFXGCBX3r+7X4/PLtm60zfXsKxqqKfMn
	IGq/3RUsOZVsaGq/h71cJhwIwRuRwRp9Yzn+FotadcIxavwaJo4O9WhbChnPYC0SUzw=
X-Gm-Gg: AZFdTZdf3dnq+xycc5OwYMQBiLCaNlTA4FIuNoZbF1ScbFA5iiyFGADLlDIKTYuCBqA
	aMDZaD6rcQtRLB1fl3/Ok5G3vhEjWvTbXGSi0dhJSUMNbFCcwpSQ2UOx+Wv7lrk1brQkapGM3HI
	293fv7+RQM4F7dbMv87vdFnq8hxORbi2IN9B2E3q9APASd3Eug9uI1QtUpDYezYZGUP5lIRUSj/
	B7LLe/TWz5IKjpYFqam66g37haOe7p0hMCuTQIHMc/RA7eiHwe7QUT+9HM8F8rzUW1BW3jkUSRx
	Tt9aBSqJEwlSmSuGFX0B1lhJYwY8q+JjSJCy2KxTHyzfVYTRtBPQ/DzkL1IVmt3pchGj8vMKspr
	Zltoy6huAHVc9zNw/GEa5jIYxiMo17DwLmJhRDsunvrX1gjE/DU4U7TVATJMFoOQZ1O/aaY7EX4
	LKxZDVym8N0STYWncy3fGkfM7pW6UVKrqblt5T7Urn6ln+4dnGL24nVdH/SGQPCSUkoHdf/Jz8T
	SO+Wv4mstIJGFZHRB5tKXGy5r1Yj8/9Drh6rjcL8I6O75Yv1n8YcFbvlI0tcQBboPOjNMmdC7qh
	rn2k+yCAotgS/hM00DTPsblMN1GNSGdh6Kg78wGpYASeLY+0wSbn7SCwXE4Npo8BsEJ/Rrp8lDP
	w/Fwhy80gDzYL2Q==
X-Received: by 2002:a17:90b:3ec8:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3b41cafdb7dmr22496986a91.47.1795834342573;
        Fri, 27 Nov 2026 18:52:22 -0800 (PST)
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
Subject: [PATCH 1/2] ARM: dts: nuvoton: npcm7xx: Fix PECI controller reg offset in APB
Date: Sat, 28 Nov 2026 02:52:18 +0000
Message-ID: <20261128025219.2679805-2-william@wkennington.com>
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

The peci node lives under /ahb/apb, whose ranges property maps
0x0..0x00300000 to 0xf0000000..0xf0300000. Using the absolute address
0xf0100000 fails address translation and causes peci-npcm to fail probe
with -EINVAL (invalid resource).

Use the APB-relative offset 0x100000 like sibling APB nodes and
nuvoton-common-npcm8xx.dtsi. Tested on an NPCM730 BMC where peci-npcm
and all six CPU/DIMM PECI hwmon devices now probe cleanly.

Fixes: 9949f98ca5a8 ("ARM: dts: nuvoton: Add PECI controller node")
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 83cd10b47273..3862adf85b68 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -325,9 +325,9 @@ kcs3: kcs3@0 {
 				};
 			};
 
-			peci: peci-controller@f0100000 {
+			peci: peci-controller@100000 {
 				compatible = "nuvoton,npcm750-peci";
-				reg = <0xf0100000 0x200>;
+				reg = <0x100000 0x200>;
 				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk NPCM7XX_CLK_APB3>;
 				cmd-timeout-ms = <1000>;
