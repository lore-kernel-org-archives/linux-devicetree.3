Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963CC35B137
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 19:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777403438; cv=none; b=XXmSeRmOFh4uIwb3wUkBX7/HCWSj/rSk3J59zuOy7g6UZv8BECltFAHwNT/hJPjh2WjiqEHf+pcdr2CACVqEVuM7YKFRAt5TYpz3K4i8o16S2LPbCPR7FnaNeEGhpLycxO6jNsn7LE/Ehh5rFWRS5yZfVraxMzERzCzwicyGZtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777403438; c=relaxed/simple;
	bh=3yivhaXpZFhAUPcuvj/SAML1xctAzsjBXlipV8NKkws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B57iPMtWFxYPl7YWHgF8svYxfyMLSGxxD79xW8a/NAV050ogxVLJzvNvv/FzznoGO/CbCCI1laRRzTrVXIOIItQbBqCBIL7yloAK+xTT5v4EF2ItbxGY10CMMZvbUQ75mmv6cWZp4MQ2tl/WqqvrXh7jXcgAMd8WIcZTGCidD14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAxOZWRE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAxOZWRE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso98469425e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777403436; x=1778008236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JT9zssUDGV6CpUI0MvgzBquflB1UwL+gHIgjI41RUjM=;
        b=EAxOZWRE/uA5WAmorY4xFyS8+Xlhuuosxaqyv1g8kChS80qHSLcUwCOjeDjCECiAZb
         3DdXKHKq31E30BvGPBC+s5yP2pQJ3LeFzNn1DaP1QPUEG12lnbR86rGLYYUa7nzntpxv
         Qi0OqyNDEsY+H5QbsZ2NuJORzYQAZ0AdJmW5CYVU1Tn7wIRB3MgRs7qJlxI5gxIs22mQ
         Ykjiwqz+6e7N2puM0Ts9vmIL3HTcr9alDkjReHB2xoFZN2OEsn7l05s+EogR55sKCI7q
         rmaPMEBYGD+zz9p5OZsag5ELbYkJZqtivdl5HSrlrOnDA9jyvT6qdoejEoaO4d2Uwmjm
         1Y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777403436; x=1778008236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JT9zssUDGV6CpUI0MvgzBquflB1UwL+gHIgjI41RUjM=;
        b=ipuU3PK2aSeB0A6S6+T6yL9wHDDeKjKS04FJ4STEXqRJId21p+6Gu5bH7S0EPlDEqY
         TMGZiho6r/Eu9tvXNKPN88iHPjZzb3aONuvuomb9hn8fCEs/wkACmB5Zi5Gea7fWeMGk
         dBnWxHXIclOx6Bf/sp4r7GY907vWLIZLkU4oI2NXci16YB7xT40zbTIbyiqrsGWgB3xA
         IUURem816RiRHG2cKfjJQhTqKtMpTRJKSHUnFJH4LfEWDSovtAmj6kJ1gNzmBy+vxNTA
         tJvzlerszcM4RKYiW65Auf7iYWtPKU1w63cTWHQLWF8IJnJjQlaFW22sQ8Oe1W3X9eRN
         rUeg==
X-Forwarded-Encrypted: i=1; AFNElJ/Yl2MTyisZkXXeItQeGTIMuqJMkrFmbab7HLwqoaWd/hJTbU+qlUS9L0jf/UjAHxgm/o5tTYJyzoSl@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGVfNPCn3IPMKydqxAYsUMt3zEwcPlzjwiSkv7yWQIbaQShP1
	lqDfCts0fuDUmElK+hYsEiVVlN2CX1tKQHloEliqNy0KTPTw9651130l
X-Gm-Gg: AeBDieu/SuY2wXnawyesHq95+NjuwFQgGpu40RVO6IalopusgAYEikQ9dyBv13v5Vli
	lFlb7Zt+tx6mv5mkJ4jsam74EvKAku0h7JeQDZvSvB91K9RzYMu9FyiJqVTe3i+QnQnxPbNnq63
	dGslTAROX6LGjUAAfcHRbIXfPkWQ0G7kyvyzq9al0aDUXIZGCO6z7eqeD+z8v2zNA44PLYWT4Ap
	lJ5h8LEjYHjOPIN5LLeWDv2AEdgAWMvFlaltTj7Szg4c1VX3D2PuNOJg2dVbqYI4YkOq9WFPfmL
	hUHW0R+RDFxJowmIC16Bhl6RH5mC03MTihBWtxd3z/8gBR9Rt/2chdk7hDXqGgkfFRGHecqk5pI
	oIcrDPU6h41tv1tZE7RGgTmNVkkTnA6ahB+jFpK2X/7uDGcGhU3u+3yIPNtKW/wcgdsAicTJPPL
	xhPzUXtPlBbQjzdPBvTktT7hth4HnqPHBFaiqDDJFgjhy3hvOILYxEoDbs7I53AVqHFLZpIIIeI
	kLtmVJtxzo=
X-Received: by 2002:a05:600c:c109:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48a77b179ebmr53953095e9.19.1777403435793;
        Tue, 28 Apr 2026 12:10:35 -0700 (PDT)
Received: from ST.. ([102.187.193.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc23f4asm6218615e9.7.2026.04.28.12.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 12:10:35 -0700 (PDT)
From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr
Date: Tue, 28 Apr 2026 22:10:28 +0300
Message-Id: <20260428191029.809462-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert remaining legacy integer GPIO specifiers to phandle-based
descriptors in intel-ixp42x-actiontec-mi424wr.dtsi.

All other GPIOs in this file already use &gpio0/&gpio1. These are the
last remaining legacy users in the IXP4xx DTS files.

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 .../boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
index 9b54e3c01a34..3043ae7232dd 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi
@@ -195,19 +195,19 @@ gpio1: gpio@1,0 {
 
 				pci-reset-hog {
 					gpio-hog;
-					gpios = <7 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
 					output-high;
 					line-name = "PCI reset";
 				};
 				pstn-relay-hog-1 {
 					gpio-hog;
-					gpios = <11 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
 					output-low;
 					line-name = "PSTN relay control 1";
 				};
 				pstn-relay-hog-2 {
 					gpio-hog;
-					gpios = <12 GPIO_ACTIVE_HIGH>;
+					gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
 					output-low;
 					line-name = "PSTN relay control 2";
 				};
-- 
2.34.1

