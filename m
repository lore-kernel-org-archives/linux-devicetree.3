Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9573E7BCA
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917962; cv=none; b=MaropoZK/017g/MRFPuPxcNMiHYLay9T+bXrlDWvkZtSW7fxhppAQ9ZlKzAXvwwZPNemEfOwYC40/nTdW7EEcTsqLTQRQHTqrlph3+UvzUaLGbcgIJpbTra/IXJGojew/8erKGG+9xfpn7Fm5oWe9OQ5P+GZ840ahLYcfCUvUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917962; c=relaxed/simple;
	bh=nGk9jrc3MYLq2bbjnn6VNP5rcorFJ1J4amam5ohGl2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTgQ3s4/9hEDIedi28FXTtVrjhBfZV+FbRMiIj7JfUrS0yxuLQn3ukXw5jfyvwYXdm9wpYn34wDmtA97L1fL0WdVHht2zuwMZdjb5a1uYjaBIpu9g3464ngHSqScG3mSbV4VBhstE/9yxhapLzysYwLcw4ZKBzaZdk1ux1OkUEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=TOvWZ5Je; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="TOvWZ5Je"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso6427665e9.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785917959; x=1786522759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Ly3YHLnm48uwYiEmyCIsl4iQ3O9RMhr22ExICtid7I=;
        b=TOvWZ5JeYZWh6walq9SV0W7Eh/Ugg6fzFncb0ubm3ot/l5a2UHxhnRtYiVpHU+lYoU
         YoQdoOw8H+gXfChI8BJQtMK7lhVqW077nLYlG/+8jCMLnkceSu8kzb93Cy5NDaguZyRL
         Xq+QHwJQr9ojz3BVCq/0sAqV+ch8z5olMLh9ch8Ew3SgLntqDoxArIkx6YmhmQMBPAev
         3WMxLpzQV5BtvOSOv0xcm8zaoPW8LUANjIrc1rP5OlKdfPCosIzlEgs+cRL+MxzUbAof
         KsR7F2qwXw3gCNzvLzuYxGkfkAC7XI7RNv0dgA9grN//0A6g4ic6I8wyes5La5rdCc7g
         xPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785917959; x=1786522759;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ly3YHLnm48uwYiEmyCIsl4iQ3O9RMhr22ExICtid7I=;
        b=evhOpTHpiChyR21VyAjVXx2hy1cbxLzwwM6zspN9iXvN4fPWgeNymEBkHdOu31K8iB
         NuHi6sVqEC331/ywfZQ7eEagUjWz8hYAiB7kk+MCB6ur37/a1kEJP+CheiVB07C4TsGN
         Uw59BL9H/aMBRpheysOHChBjWxPlPOrsA2EozAphG33in0m1+AGqJBMJSoV6D2V164f7
         bZBN2o5OE6h4U68LQ0ASvtkgF+5kSYWWQK4wiK3ke9MUxraZ+aS7uEib37J4m/RK4Zzd
         mWqZl4zLeCI3w28cXpbYWb/YqJipvqA0uaL69hjaylp2GFb8KE9uOZm6/RTPctH6KqI5
         ha7w==
X-Forwarded-Encrypted: i=1; AHgh+Roi7qPPAHoCIlRPMr6DaibjXpEc3DgERDHzImrTOJBke73sX4DnXuhSUx76w+akIYudceq2syZAA6MZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzTt9d8HdKkFszqChA4IFZNg6BzvB3XW/wfFC8YdBK778CoiYzC
	n/lpT4Nsmzd7rTYs5vj7Hjzn5kxvwlIFqswFtMBV3Ao6aUiakyENA1tl8DBsCvgtRqnIeacuu51
	MJG2N
X-Gm-Gg: AR+sD13AuXXc3/72CFppTWoljB4whtQwqJ7jC62aiQ0J5J66kfsKTMj4KFNMLFtfcHd
	rTvlwpebeM1vDmgxI2ifGttbCaQwo6NNBVE7F0W7bvXCeQtLHsNlMLuXVc3Z7EZkVk+FqWU+14Y
	xc93RfePXuNwiruFIW2Sxnd6eQGUix7yKw+I4gWGvZh5CK2nkV+zYW+bsQeMHLS0NhYwGDQksmz
	cPXlZwqihsWEEXDAG6E4qez5faNgGI8TEA2LbH3PRp+/qtazgFTNmpGYK3na7wsKa60HxijEo1R
	DkRRLIP8hot2Dr+/ub7yC3A/T3c2NHyygYVV1PoOTOSMMerEJdsly17iCie1Ui18hDABcA/ekrZ
	P9HpKKrwEKEJbtkd/tdHopmuQ+r7LPO0aks/8yQW9ed2mPYdsIrWuizlZIp52O45mAVfgCqWT/F
	VL/FcdGyTbi0yyO00wyIJx2Yz2VO3iLTMsXQNQwJucd0PMV7/WVEx5QH50W8dx0f0elZs+anEA0
	ZtsnVQiMZDjDL0cvHwP9HdpRwAgu3pRft3wjXKDQp4cWY5564B6I1oQMKiYGwY0972+YshStYpE
X-Received: by 2002:a05:600c:c4a3:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-4994e71eaf3mr55027305e9.7.1785917958819;
        Wed, 05 Aug 2026 01:19:18 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e0356d4sm74745695e9.10.2026.08.05.01.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:19:18 -0700 (PDT)
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
Subject: [PATCH v3 2/2 RESEND] ARM: dts: aspeed-g6: add pcie-kcs4
Date: Wed,  5 Aug 2026 10:19:01 +0200
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
Message-ID: <20260805081901.sm2P876y9_iKw0oB2VTAT2JVGf-GOiwwKdhzI9ZagIQ@z>

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
