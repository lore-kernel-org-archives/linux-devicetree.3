Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660742;
	b=I1ZRfkrPNZJbxGwOix/aCgJrYqHmLGenVLJ5LlRo8XVurmBVdbF3diNlelrqHKZ/gPK9
	 Yov8eR6PmisAO8XlJLneQrnvHZ/N/4S1yoxxwWXSsWImYvx8JZyTufHC39MSPOhrc3HHh
	 Ju6ChVbKed1Li6UCIK8/naLjuFlDzUSfd20XOPMD7ufcMM0CqEavO2KsVIp07uXwgbs1k
	 b5im5VNDRsrt6XdRAPD/iXCq8CZiSRqOzkDZPamH9WZcryrD1o+IGgRwt9r4ew5eh89qa
	 KRz6DEx0elAbL93zoFE8x7QCC/U3NCdYuc5U0awiZxJy9VUXxbaVoeBYaWWr8kWN5OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P2b3ibZfYLI/rA4iAlhtTumPUKIx/cMHtlCujWDHvss=;
	b=Kzb/EnSQfyLya1nnVAUX1E1J6DoxUrQH3ZSR8q8GTEOrQS0tEOiBRnqDrbdPiy142SC9
	 CB3NdwKDeDgtsmdAvr5SIcLUH87vgHK1ooPOjrxnvKSA/tQVsMC17V5xpjjaQtXeOROnQ
	 ehU5DfIDhp0Vh5tt9ADAW4cs+PdXcP30XWsjuEGPRgObvND3RfNFNqAuPWUMwynX5R35P
	 djzE42F726fA8WNAwCkFiHzBGsoXqqmnwkkhMBgYLcU3xzSofYeKY0PkH2k2hHI3wB+eZ
	 aIrlAoLwiBECATQWup3SyAN5yCDOst7NzYBN4mhDuSEggbG+N37m+iYgI0RLx2zrUpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDgpO3nX;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77448606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77448606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDgpO3nX
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so4555236b3a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660742; x=1796265542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2b3ibZfYLI/rA4iAlhtTumPUKIx/cMHtlCujWDHvss=;
        b=PDgpO3nXslC6kizxJIrIXctk2CcxnmcOFxkd5CbgxGrVD59bNSnq5VlRv+wmmlQKB8
         3CD4vlCWxOwOZh1odSGoIdvkhYmo/mbWvw9xTMks9UN7hso8eAkmJgR8X+ujkq2XYPwU
         1UGNHxlLvJRNEF+HchjMXchWGz4/t0PzUkTyDYt7azKk3SNXNUF3qNZm+s4eiRho+Fko
         vYXmguctTeBg3W0EJA8MqVHtK0U8ZraF5/QxSBlxajst6EJLQki0DHxEASHimPX8hGnW
         B9rjy5HmOE25SLpcSd5ZuCwyvnFyzoU3C4bhdtBP7MBkLvAgryvc5tdkT2KlWy7wVLVo
         iRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660742; x=1796265542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2b3ibZfYLI/rA4iAlhtTumPUKIx/cMHtlCujWDHvss=;
        b=IzKOHgYWGHs/hTybyh6NoeSZZhrQnreDKIAvAAGP1vPi/wJA1z7VYQd4A8+ge4wiSn
         JwCu3j7LtUINm5Vbb2scnoza3sNFYuJhc1v9lBfdu+dcYv8QzA/3yxvwukgT5SZrcnad
         ye+c59klobkw+t1FFNKTWyfc+BRHjUpyx8ih1R8sFblpq6Hbf2blvn2gjptJMcXL/VT1
         zORway2jrF6/cnisxG1o6vGOqzC2UrNFRKy+OxXE5eQcsPn73N9RZ0ijbL7eGjRK5jS3
         gFCYYCcf2Xew4hQbUf9YQJaOzoKcL40hqNt5qN+XQhWScjWO4cIQjOeRr24FCEZCa4dB
         eXZQ==
X-Gm-Message-State: APuU4Z+IykWGD4zL+RiIfygs7vdlVHxmsZqXo0RsjPdPHHjxe+1npN3j
	HBivN6GdmCSxAIudB38AERugRhF4RaJ7LM1+/enBYpmB1jJxixSGybu31GaaAQ==
X-Gm-Gg: AZFdTZcj8R6HcyPUCyDPu9XM5nJ4XeqsxcyErmNea2CtRjY8mGsr+6qsdwZbVjNmtfN
	z4JHqmAT/8V8ahGvWXhqsMKLZ5LaNL39n4TVqLkeaJnk8IntA5mtJPEzmghAj4+1rSBS+pXAtUp
	9uNmDZ0R/oZiWzx6yNTTGby0FVGADvO+WmGkN8VSMykGWbj2EJUSu3g+YcvtXkxW5eAC4s6L1WN
	6Ln2YkLaCaeG/8ymaOXSI10e+/iYgD3w/nWBHj5s7w+scz90zQqMQkhmNigqZrOIGm6B20zu81C
	y4NUGi2FkTJzz22xli/WreNhEFKyvZjZRCf8KXg7MRBIZTlCEYhFw9ke3NSEvwfQjLjfeRO1ACY
	eQKasYD61LAqP1fhZfavqbyRH9Y5hE8Koy1ygCEO1ARUNfHm3DCEUlZva7+J34JR1x73Lh/rhVc
	fsoOROdaxmJc/uTqwK8gmz3Q/TDcyR4WtBVgeGKvcacjKJ0ZGielIyPIFDb7rFpv7HdmnT1vLKx
	9X+ZMiEhyKvVnKmjCSdVEseuDl6r8DelKA9fKSvIF3gtf+CVzTrgeWeYAVrK3LENryzOknn7n0S
	K5wmPgXMnhMtg6ItIZqpKtRWTd5OCRCWXFdwG6XfpvgJxdxIlWfYEoaf9VI1EnKkCMMskawtDE5
	Rl/AiBv08DcIyT3lgt8QRfnO7rXIQ/deb9mj/bivcbusW+Xt8iYBy98RMF5ghRbsNPjJP8LTuN4
	e72g==
X-Received: by 2002:a05:6a20:51a7:b0:40a:5639:4a6b with SMTP id adf61e73a8af0-40a56394b39mr132821637.30.1795660741806;
        Wed, 25 Nov 2026 18:39:01 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 2/7] ARM: dts: helios4: use a level interrupt for the GPIO expander
Date: Wed, 25 Nov 2026 18:38:51 -0800
Message-ID: <20261126023856.767961-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
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

The PCA9655 INT output is open-drain and active low (pulled up by R60
on MPP23). It stays asserted until the input port registers are read,
and stays low as long as any input differs from its last read value.

With a falling-edge trigger, an input that changes while INT is
already asserted produces no new edge. If the handler's read races
with such a change, INT never deasserts and no further interrupts are
delivered from the expander. Use a level-low trigger, as the chip's
INT semantics require.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 965e9972c9d6..b87e3f8fd12d 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -175,7 +175,7 @@ expander0: gpio-expander@20 {
 					pinctrl-names = "default";
 					pinctrl-0 = <&pca0_pins>;
 					interrupt-parent = <&gpio0>;
-					interrupts = <23 IRQ_TYPE_EDGE_FALLING>;
+					interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
 					interrupt-controller;
 					#interrupt-cells = <2>;
 
-- 
2.56.1

