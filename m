Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55F7477991
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118999; cv=none; b=u2/pxkngA6DgFmovAm1blPOgGQqw2QnkQn4i2JGnpvovz+QqCbyE/bCIAiaF3nD4F45OhW5c49WB7kXWQnAdGSaJoDDbsf+Ix9GBR7Bcj+G4vpHqSLohdPAye6ub7D/IVmXaNyQ2g+KJmyk1ec5klJWHitFe4LpJE8hz8LO8uqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118999; c=relaxed/simple;
	bh=HP/1QmXSnHiBENJ8POm6tA+Rj5M4INRE2qcOg2IW7Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gml72S8v1/n6xvtAO51yAGyTb+ufWojrZ81tXBpjGoSWStUs06ChFo60reRA/LY/TqrgljX27WcN0gfnfXdW3pNVmIWVm5CVeXXJ5j+SD+AcpUGK4HzSmHflV8PoXRyL4CjR05f6BjX2jG8nXIYiGLAIEU9dmjXICjwnc6PCzOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=XIDP0uGt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="XIDP0uGt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b27c7451so7719405e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784118996; x=1784723796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5g57A5VbRGUC82ryAttIcVIyb54fRoQlQaSUTrU3GWI=;
        b=XIDP0uGtReFPQ7VZAYLK0U9doO3ZA49VsGLP9ne/Fb6sGLAMyF5/ma2+fJUNTQWMRW
         7CU7Eu/r1F0I4nJjEbrkMEFcfVCEpCJTerE0otNM4Xp5+tb/jSbTuRIp7qrV26eUIk9k
         eBETbTyNTy7Bp6Ldw4R/dxNC7EYvyzLNyMM8P7ZfmdMmnX/2KSnsAQAhZmzgmZZOO7n9
         4d7aLyBkbbijY11HWT/uHDvYuWCfVz+QBtZQolhv9OaUtHRpaBIXMur1twux3nY3Oh9X
         GDQtipAauyFCKOBcNMjkb6X6V9OcX7OcvirsA1iQXg5qImMAhrV5LhRUdvkyNSkYLpmA
         dzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118996; x=1784723796;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5g57A5VbRGUC82ryAttIcVIyb54fRoQlQaSUTrU3GWI=;
        b=BQhvsm4ETMtQNtFDT3ruYfMFFD60npDipGL55qiMcmLjZQmRe3vlZXOEvD4tb/TU8O
         Krdz55gi2qNqAwzFccyxvDdXkrXsCaeRiDzYjaxS3gTBQAUEwPOJ9jqEgRdhNja2siVf
         KCfVs4L/t2RehjXV74Ty9TOxjPGHLD0GE+s7XjGu18EwfonLzCjUBynsMPUCtrtqCp93
         +kV7XD8d3IbMcu5WO8sqP6nRY1LSG7e0nT1Y7I8e/LM9Q5fDEqgvjFYOOWUVx63B90i2
         ma9rPCD0vzEwbFe4Gq94yJPhFMyv5b/xl997dg9dud+cmTEOwaPmGgUb16tJkhiNdYLf
         zS9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro5YVC7tuVktlFM39T90vI9FrwQgjwVpG6SB2wuoIui3k9kxeAQfjs2X0XZKih9sMsAEsJw7JltvFsk@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8r7TC/EaLwV5Oy/sjB7+2utLFBZg3Z2w1A4m2YuECvvRwVSU
	Rhg8BzyuEKVQXARnMIdHQUIYECkCL6QPdazRBz4ljS6mfof1WkX9CqvZFkW5oe4yu/Y=
X-Gm-Gg: AfdE7cnFVE00WxDN2NecWabWdo/gSQ/9Ah8yPnzI+9NUP3IzPEUxQmSTZ5as786+MmH
	CcKA9WF2RSUGv1eCszaoJ25kpDLEytUNKm5EYG0R46+03t/v1Vfhm0UJ9inJ66T7MV7TQXp2qrJ
	Af8tp1roKkAjkoAhLtOZ4od1T51U/qIl+/vSuWxL2h+Img0XyalfFfghfzXqj+Xj1Qji6fJKjlV
	F4RvloxtAd7mS/id5HGcguNvPUTYZCKq4OD4rcHfE7FBE95qW43XYAFOciaAjS/ioZOIO629on4
	mHsphlqxUdkrmcBz6dKc0jOT4bK/N1FBUKiriiX+qynfEc2T18RsDENVs8PCPYQ6wSgvK63xsPP
	wjBobPFCTmv7S7QzoMHa3PRNESrY5a9o8zMluPRQDv+8i97rhc4QBYGpkyvt1LyS4Ri+sXjQK4E
	UAVktsH+XBhgJwDg40hOXvCnsqgP2clBB9+DsZFUMfHSxCk3Gx7EgU+sz9vbZbuRCNg+LpbMMOd
	ivF1MLc505T3bR/nVWWrdjA8TbX
X-Received: by 2002:a05:600c:e557:20b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-493f88d2f66mr125124155e9.16.1784118995937;
        Wed, 15 Jul 2026 05:36:35 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c599049sm44497075e9.0.2026.07.15.05.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:36:35 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed-g6: add pcie-lpc and pcie-kcs4
Date: Wed, 15 Jul 2026 12:34:18 +0000
Message-ID: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add pcie_lpc node and pcie_kcs4 child to the ast2600 g6 common dtsi.

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

This can be used by the host for IPMI when the PCIe BMC Device is
activated.

While the datasheet provides interrupt numbers for KCS channels 1, 2,
3 and 4 over PCI, not all 4 are described in the "PCIe to LPC Controller"
section. Since only the KCS channel 4 is described, only this channel is
added.

Ordered next to existing lpc node for address ordering.
Use existing "aspeed,ast2600-lpc-v2" compatible string.
The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
standard KCS interface.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..ac351f01048f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -658,6 +658,21 @@ ibt: ibt@140 {
 				};
 			};

+			pcie_lpc: pcie-lpc@1e789800 {
+				compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
+				reg = <0x1e789800 0x800>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e789800 0x800>;
+
+				pcie_kcs4: pcie-kcs@114 {
+					compatible = "aspeed,ast2600-kcs-bmc";
+					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
+					interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+			};
+
 			sdc: sdc@1e740000 {
 				compatible = "aspeed,ast2600-sd-controller";
 				reg = <0x1e740000 0x100>;

base-commit: 03f906d8f5541e8bb741035981304feceed5993d
--
2.54.0
