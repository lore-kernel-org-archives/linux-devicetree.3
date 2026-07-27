Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0003DDAF1
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137411; cv=none; b=LebyeIududSSlh6qL4NwiERQhffWHCpL1FiYsxWpILLeOAu8izwNgL+jBlG3A31hwB+2/8J6yHGbcdLAil73Zp66RDYuYOsNT32iuN6DeHOP3M837NUJ+Egvi6KYTYfUqF4AgpHrx5dNyyWupdPu/4VlKlVq1l5tR0PeRHLWFuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137411; c=relaxed/simple;
	bh=nGk9jrc3MYLq2bbjnn6VNP5rcorFJ1J4amam5ohGl2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HDKkEvXBPEtTsTGjcSWOdeVKEEs+F+W/kNScU4sm3046XZUrS0f5p34VLjjOsKd7JM/OG3zFJ5EKzCBZivmOz3FBnCNcuGBpHtfUYszmBt6m4qSiaa+MalQ5tH4zLLOBj6bOxSGbL7aceMlj1IaNXlA7zHP16VYeHkZwTgmpRx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=E8wLxGLs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="E8wLxGLs"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so21844855e9.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785137407; x=1785742207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Ly3YHLnm48uwYiEmyCIsl4iQ3O9RMhr22ExICtid7I=;
        b=E8wLxGLsy9d/sgXD50V5gBUnxa++Pt1MbEVFgoG0KnjiC5bXWsaS6z1ziMd+V4x7ey
         uX06N0tVeZ7KuSlBG2JD+mzWfOEXgZTEsTRVJUMDiJMPDDZpDT8aecdHhWIvRFXE0N9B
         oCFvdYpAQfGTpadDtH9hQedVx/Oj4CJm1rp6ztgpdh4FlcXq8ddKoqpcOvO6iYw+jyJi
         dmnmvMA4mLOF3LXbOQEsgtVNalGjtzWw5a622YKYVbJ4g/RwPaZ9UVw4TkCUPNffiP1K
         VVMUraAGIurF8R0qm+Jyy1CtUy7Qd1og2Tz34KJ/6iNnnTBxogu2RD1Fpn0gNPY4MjmD
         Ck6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785137407; x=1785742207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ly3YHLnm48uwYiEmyCIsl4iQ3O9RMhr22ExICtid7I=;
        b=c+kq0LH7X6wLwDsA1NCkMjCc1Xl7y5eKUssj+8EB8MOOzW6MNQYVJFGCvxaEo0wkcR
         9JKssIkOV5YFcKfy3NzsD4fxxIRIAGLilTPuT2K9cl2x2nSV3qEDS1mf3FEQ4HUvTfhg
         cNgCAV6BJlC5FfZQF8WeNQRSOEGoeP3CrKq7Ban7lnTsRSnL/TuFz4gvnQjGOd/HDfns
         Syhxzjnl/zsvyH/E6RcA4d/lgASe5eLsWUVKUCuFi5B0e7cZ8SnDUuP/ChGZiOgPjpE9
         vwvNEy1dAsYUJfUp7evf8hvKRm3a8GwGonCHXT/YWgs94ZRV1l3zsPBn2Vgd6LEVCc2Q
         GBuw==
X-Forwarded-Encrypted: i=1; AHgh+RrJsq7R+dEJawIYXuu+x6Mk30Ym8ARW5DGhIlPQFd0alBfl+s9YDhMYojavH26EHhKt5VZvShkItpjc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf2s3jHiH3kFUed30WZH+UnpX32lUI6f+QBYS35zYBPtOfN3Np
	ohXGErnR+WnkoUIlNROQ+Tzj7mbbEBZsipVKxdEfjAB313poFV51kSW2fP57fxlHODs=
X-Gm-Gg: AR+sD134EcPretrh1KfwWYuARSK0Dw4ME0o+ja1ImlbZ34DP+2A+96JPO2JrhbMug5v
	oV09OILcNguObxBL/JcpU8dFFkltwzknSvHFq6kbXVPmlockJqTsuVNHlvRhPJyZKe4HlPynOmz
	shnWPNecmfmnFoeL74YpI4kCsyWzySMfLXU7a9VKaBRkzfh5hR/VUurItnrdbTxHDQZKOgb+p9F
	S9mwIxUf85hopSNvpbB0WdMvhS09JPQTqkjyR2obXp/PgHtTE/qcQdQ/nhKe3LNX4C/OQ2QrRuN
	q6SyrzpqqGoTlSdnFdQrDCe0PX0bTP7wOccguzQJ1AvGGsKK8wPM1hkkaiX+gek3fojl2pNn9BR
	e93M8JSzDIWISmr1UA2wfrbADTjq0jkc8Wcm3Hw++6nDS/L7YidshKC5WMs9h538y9g/3l6tFop
	3r38hzOIjzlwnHnMj1/KBtVcq0refDP+ZD6PQ13WKIQGjLgQxY1kN85/bu5zaywOHXD3XemxuOo
	gZwkmM/CwwFYLnjmw==
X-Received: by 2002:a05:600c:35d0:b0:493:e79e:da63 with SMTP id 5b1f17b1804b1-496b5708bacmr90013815e9.34.1785137406643;
        Mon, 27 Jul 2026 00:30:06 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm201823685e9.6.2026.07.27.00.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:30:06 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: jammy_huang@aspeedtech.com,
	yc_hsieh@aspeedtech.com,
	openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
Date: Mon, 27 Jul 2026 09:27:41 +0200
Message-ID: <1dac6b9ae1565a2265e87537141e46c988d16de3.1785135437.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785135437.git.gregoire.layet@9elements.com>
References: <cover.1785135437.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add pcie_kcs4 node to the LPC bus in the ast2600 g6 common dtsi.

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

This can be used by the host for IPMI when the PCIe BMC Device is
activated.

While the PCIe to LPC Controller provides KCS channels 1, 2,
3 and 4 over PCI, this patch only adds channel 4.
This needs little adjustment to the driver and provides PCIe BMC Devices,
like the Asus IPMI Expansion Card, the IPMI over PCIe feature.

The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
standard KCS interface.

Node placed according to the ascending address ordering.
'dt-check-style --mode strict' reports no issues on added lines, except
'line-length' issues.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..c9d94c25d1ad 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -656,6 +656,14 @@ ibt: ibt@140 {
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					status = "disabled";
 				};
+
+				pcie_kcs4: kcs@914 {
+					compatible = "aspeed,ast2600-kcs-bmc";
+					reg = <0x914 0x1>, <0x918 0x1>, <0x91c 0x1>;
+					interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+
+					status = "disabled";
+				};
 			};

 			sdc: sdc@1e740000 {
--
2.54.0
