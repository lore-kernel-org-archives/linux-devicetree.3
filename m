Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448327;
	b=T0OQRRz8TKTzFl0a9PJuXiEG8fywJ0PeOowiKu2MKCdLvypE5WE5o7gHH/1rdnBtQHYB
	 TLABrZW6LM5DryJkPouzmb5fabOU76CVI3UYt01beforBT3C0rW00tj466niekF3Bk+QA
	 PtauAwS4BVPjW2Nq0TarV6bw6GO4pxVfmXozsCrNcvDr1kptdxPcx0rfzGHld4I1I4cg1
	 A4gNBuvnrtDC2u8krClG3SElbT5lC6uRONHGy95cp1DE5uuq9Y7GTzL9aW53AjLayzi1J
	 rN33l/3FaZentJTE8cNB108USgGhs2Z2mGMKXWRpIgVFiPQbXwvb5EZWw3pj8yMSPfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
	b=BBlvt0NBtKZqU2TATho8jlZN4S8wnXf5xr56qB8SxQGkMaNS0a1QwOa+ACwqdBboswEM
	 6PNr0dVf9FsoydLUhvfBJ+e0S2fq+tj/svylRTHh3ZAkQ8RGezBkKCYzgpo1YSGV5Fotw
	 KwuS6M6o33c9rewD2gXX4d85FehEkD+ahejYkYIKcqrC7QOjaIMtSbVA4BV46T7DAuCBE
	 62ScSUJfMDp12QKv47jSClfJcUnm748JzbiaUQUDIny3DiOLI29HcL+NokjhMVOn7qOy0
	 ZQAYQSGG03ft9OXH97lKHnaXQBPDLD/qGjQDvmhHim/1HtgBb4Pe2uK3bXshUzrWvyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ND1+QOw;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD63606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD63606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ND1+QOw
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-537548b811aso29983951cf.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448325; x=1795053125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
        b=0ND1+QOwW5zYHgp98KmfG5+gF6wM+hxCcoi7ET25XbEPtpM1QkWvoZDhV4T3m3GzA/
         S+EUwlPKG1/jcd+nz5+wisLK4PlmPxEMXfLUqXM1pTUiK6pAOnXYWEz0UsQSZdWbR7Sx
         uPx2cdZQ2vrSsTMYu0IAMtWJCcB9Zl8z76QSlyXxbdztXOD9tderaHqieP/HIomM6v8U
         DtBDan9JKHOQNxJWkUzY+VvZC4Fi9PIx0Y7SO1T9BkfuqtkuxbddmozhK37dqJt09m6I
         fggfNe9Tj+DOz4vA1lQs2ZV5j+UfJ180IOYGK8f70q/VzM9R4ZRcM0ZS6CPHTKRMXFuR
         BQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448325; x=1795053125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
        b=Xqmd7zCxps1g51Wo7487K/ha+d42KyfUgZNPb9uISUIYFWiQ6aT3qFSjtZlUIHqFup
         7CMwetcyhpbHSIuNBDY28zYtRiV0BAj3x8DLkIzqTLVwl7ZVWPP7nExzn9H76pZ3G4WT
         9gqdYv1HxZSchzAHimq0qlbqMzGl56LhQu3Ge2bqxgpt1hlaphexR8cMEYEN3PQvLPik
         diwW2+UeE+Pek051tshlCJV7RHCN725GGBUYSDeJfVwFJXZ+3ilCwr+fVK56F0KweFmj
         +wYgCffiw9EJb+68TmIsPtedEIfA+Ukp/BfTQh82kyaCUEubfe9I0j3sf6V5xyBMr0Ko
         /bLw==
X-Forwarded-Encrypted: i=1; AL+hErF7Dx9TM1LYHkF5sc5wokqK4l/t/tPtEoE9QXFVAnihfWjpdki7d2S8lQiyBs+HVA0k5Vqj6Qymtblp@vger.kernel.org
X-Gm-Message-State: APuU4Z9OdTaTPa0N+1aCEDURtluwJoQ6mNsoPjEdCK5YV7KBR534MCWX
	hj8lHHlpBWIDd8vC9iZBiGkMSSn9BPI8sNZFUhMBZydxey9jWvAULM4=
X-Gm-Gg: AYBFou2W1IpapJZNqb9jWzRyFKCXZwFKcm0UxSEQ+uhSbSomMQCYofhe85123HiLIph
	r5JoyPaVysZXmN3kHlqlg2gLy6LNLh/EhHzotyt/tL0CmFVg90EPZq1vBbUdNouwbHJyLz1ruCH
	cj2MKSlv3iqwsV3zfBSxWcK5JLTyklMzajR4HHeb56Q7QOnIHzoVb2EcGVB+lBoZ0zQlFMoHBNI
	pklMlYX5jphCPyrEpUyq59tyutJgVysFjtpiRbwUL6rFnDA/yg8OVKKfqpiX4VdhGpdhuYVv/Uf
	27kCRTGu584BPfTwIaMMlsXz00aVgqpf6eZM8MukDA5uZlOZ3H0tDVsDhTGAYj2koE1xSKWI8Nv
	gw/qjnxFWIvTj/QBspQ7J1Kejz7ceCA5RKdwVhsOYWt9suVQbGCUvxWGFtnmnijhFKaFMvhRZfg
	b+CuQPDFU1DxQErHbB928jqmGXH/wJCAODV6OvO8DFsuj3w26RFxVjMRGErhSQh99kRJZlCOZbb
	W8mtulZ1ddcBqMp0pXcu0RK3EzViqU3GFONmROJ56oaf3qNTq5XU81X7Wx2V8RH6jeK5lYfNL6y
	CDMixpgZyYsdMjbIDKHget/i4jF8
X-Received: by 2002:a05:622a:5917:b0:536:98a5:cd8c with SMTP id d75a77b69052e-556c06e37c4mr54334061cf.30.1794448325483;
        Wed, 11 Nov 2026 17:52:05 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f0ffc6f60sm16052726d6.14.2026.11.11.17.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:52:05 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: troy.mitchell@linux.spacemit.com,
	wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com,
	jyc0019@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Wed, 11 Nov 2026 20:51:47 -0500
Message-ID: <20261112015148.3911178-1-montrealtango@gmail.com>
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

The dma-ranges of the shared pcie-bus skip bus addresses
0x8000_0000-0xb7ff_ffff, the union of the three ports' outbound memory
windows. CPU addresses 0x1_0000_0000-0x1_37ff_ffff are therefore
unreachable from all three ports.

SpacemiT's vendor device tree gives each port its own map that skips
only that port's window (dram_range2/6/7). Do the same here. On boards
with more than 4 GB of RAM, each port can then reach another 512-640 MB
without SWIOTLB bouncing.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---

Notes:
    RFC: the per-port maps come from SpacemiT's Bianbu kernel (linux-6.6,
    k1-bl-v2.2.y, arch/riscv/boot/dts/spacemit/k1-x.dtsi). They imply that a
    port's inbound DMA to another port's outbound window reaches memory. I
    have not verified that on hardware. Yixun, Encrow, can SpacemiT confirm
    that this is how the K1 routes inbound PCIe traffic?
    
    On an OrangePi R2S (8 GB, RTL8125B NICs on pcie1 and pcie2), up to 87
    SWIOTLB slots were in use under load with the shared bus, and none with
    this patch. Receive pages were kept below 4 GB in that test, so only
    transmit buffers could use the new ranges.

 arch/riscv/boot/dts/spacemit/k1.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..949843bb7789 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1152,13 +1152,14 @@ eth1: ethernet@cac81000 {
 			};
 		};
 
-		pcie-bus {
+		pcie0-bus {
 			compatible = "simple-bus";
 			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			/* skips pcie0's own window, bus 0x8000_0000-0x8fff_ffff */
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
-				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+				     <0x0 0x90000000 0x1 0x10000000 0x3 0x70000000>;
 
 			pcie0: pcie@ca000000 {
 				device_type = "pci";
@@ -1203,6 +1204,17 @@ pcie0_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie1-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie1's own window, bus 0x9000_0000-0x9fff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x10000000>,
+				     <0x0 0xa0000000 0x1 0x20000000 0x3 0x60000000>;
 
 			pcie1: pcie@ca400000 {
 				device_type = "pci";
@@ -1247,6 +1259,17 @@ pcie1_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie2-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie2's own window, bus 0xa000_0000-0xb7ff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x20000000>,
+				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
 
 			pcie2: pcie@ca800000 {
 				device_type = "pci";

base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.53.0

