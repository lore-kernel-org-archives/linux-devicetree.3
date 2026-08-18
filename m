Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F393E4582F9
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049114; cv=none; b=ZDUi8VPbL9L6KK/XYBmqRJcVSWUOyksn0zV9esQM1J/4P08ZUpsiflfOc2bKY3YVhV8Dzpg4RyPVJPxV9vdC8RP/WuM8dYmbwygXlMMo9AT2X2LyAlmweA6mx2K1zdBY++k+7UG3KOAsTwXR0RCkbaImzafuMu4RGH3h8cauKlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049114; c=relaxed/simple;
	bh=vfIcMF/D8wcsUdtVGgWk0Xhn25+5CnrW+64Wkzh62KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OepXOcN55LBwNJ0DdgDPmAobLcV+FD+wLhnQaQVLGhARTblTuX3XNXY76lIvuCy7vinowS/G0gkuCNu4onlK9oYoAnBhDjNuuqSQDRJT3H3b+yY4JOC5SM9vFY+IJ80NExLPsc7BE7YXZ8uf47fDwjEt3CFCeRgqXcuYE+Tag0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=EtUXPzjt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="EtUXPzjt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so3752655e9.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049111; x=1787653911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0US0ozN7L3SAjOKyepRf84tawF861oB4+zMdDmmleEw=;
        b=EtUXPzjtwE1VDazadATcDYmnLRL4zgYOA6wqGR5ckhuJCyJXTnK2/vQvImgK80j5OQ
         ZGUfohTyrfFGeApzUYgc1npPihJzjBdq9jKQgkgG1Kqofw7aqnjhOO+iu+19vbegIhSN
         I+ujT0lOKH0uU2A/BscDieZrKB4FLeruhWUbjLrh4K24jJ5BbMnAtRZeDyYaNQ1WClWU
         g4IFyF+wF5it/RgcPc0HmNV1ELRclikKOIcgV4TODpAL0Drt7HneeThA79qLDdRQiCcd
         p/Eno0UEblQsw9VQ1iCswDs7qKIAcZWNu/TRw1R1GZKcoLtSihZ4lrTzwNhfrc2AmcsL
         Z3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049111; x=1787653911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0US0ozN7L3SAjOKyepRf84tawF861oB4+zMdDmmleEw=;
        b=rOOkonoEnG73oWr4UvF0a7G8aj33aeYeGYOTgDoFzAwZoJIc8Hxsje+lA39SJ4/FgU
         cUHdjRN/9v+tt/vWWItqG0x6glJSyoxnVq3c4WYDLIQDY+4hLFtgG3NgX/ccPzV8+hE6
         WEg5HBq4bbtWjuF7xyfmI11rdgG6HgB2s5iDzNOcyrJRP/fi2jbny8S+wxldcfRsajkW
         L6bOzoQzU3I7rPQaakqQ+3c118KNjegJs1sbqdRKkLvXsrSGXiiMiNr1DfqE22qdLcT7
         qLiE1jVC+vI/Z0JjX/f4w3nZNLkMQmNeY3joCJzeNJ+NqQDoyNOmKLJNwle5UUTxv3en
         LTtA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3ony2ag/jjlpXNBiUQO12dB9fHLgEXdfhe/JVGL87DU7YqjuaCrCLhw+Yeg0XOZva/pIhWrj/cV7w@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHBLMptNOJj+aweRv4MV1a0QT4Nli0vK2L6bpRlO0Jg7Kqr/Q
	4FiW+/ReX38Pojtiqrbj8Ij1pXeQi/t8DGtLo3f3igjRw5jTSnxSxRPL7/H+E5cug8A=
X-Gm-Gg: AR+sD11Wk3W9rFGoZONUAJse2Zs9wEQ7F32wJDC3GfiZm0GHf+yglVKk8pD51FLrEaE
	pdDNsBNq33qk6Z+bxGhJhkkZm3pYLZzgZXh3/BBq+lNKsBnSmD4tg6mKJWG1N0I08tct9L8rLIU
	JbLrWf9LBFRVoG0FqhUI9NNeTfFzoS1zM/wVHEqhIUo4oUIFDKwTjX9KqpBdlR4Zgu1aU2o8DxJ
	IqLnqyXDZGgcZcC3GFL5o4nwXsSM2naDzbWBR59V8byxRqSskqQIPtylKQeqlYhmqLqBkMCFcZv
	sGtkVM70AnDze67ZLgNScd4sk6oXTrqdBUBmUHBZ1EN4COkMqT8BzEYQCKyUp93OnQTZaGYPHyL
	YWL2zO14JMKlyiCF6Fk5qTwghxkSCsCh34l4gJb42Is5tvfr8KKP9QPU4wsy+zw1AdFMf4JIiEU
	70KMfDkMRbfexVDRIkO7uZ8aFz1zR2j7O7XXlOs8iprf8ypa2Lhi7zuJ8N/cVsXJSGxSTXQCYCN
	EWSzic2rpV5A8q6WKtrgJyihNNOguQG2xnpG1ByT3DFsK8bPn8cW5zmykPC
X-Received: by 2002:a05:600c:1d27:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-4999fae4e89mr107830385e9.2.1787049110979;
        Tue, 18 Aug 2026 03:31:50 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:50 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:18 +0000
Subject: [PATCH v6 5/6] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-5-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2

Use the ast2600 compatible string.
Make it more precise and enable specific ast2600 properties.
Still use the ast2500 compatible string as a fallback.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index edf4b74f5aba..c952e2075b4c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
 			};
 
 			vuart1: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -717,7 +717,7 @@ vuart1: serial@1e787000 {
 			};
 
 			vuart3: serial@1e787800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
@@ -727,7 +727,7 @@ vuart3: serial@1e787800 {
 			};
 
 			vuart2: serial@1e788000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
@@ -737,7 +737,7 @@ vuart2: serial@1e788000 {
 			};
 
 			vuart4: serial@1e788800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.54.0

