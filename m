Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531426;
	b=ppJC1WHrXoS/APz+lBMxhnZdjA0hrJoKF4ujHCJy0C6bX1G6vZYcz53w8M82KMqo9LAY
	 ylcXnuz5UswCas5Bzmx75nekRxdE3doXl+7KwcmjIa1d3qIJv+/Zf9aZN6bAOzvjL1UVZ
	 sCZ/IMZMfCNNfaFOMOvHSdiJ38UMTS1QS7qsgveZu0wwUyvIQDuDgFRwQdEZJYPS5hhVz
	 1paOpzljATAA2URQTaqFKyc2o5ucplq4gOhtufvQWATZrPcw0Jf0goK5G1gCUYQtISEPl
	 NcfWBvC3Bi3V3evdPAPlJSbVG640ZY/2CXj+E5pjz+vYGW2rHnKfFaFYIW/a+N0G3hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531426;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=j3UMb6Tq8TxZ/5efwis1lZEKc4crhPUm96cd/FT1lQc=;
	b=jWzhevM+BYqL1EUG6c63DnnpcGGTDN3A4ozyTEGatbPt0eGj/+jFyeqyCpQvaA7QfBOp
	 dsgke+t1Qi0q1PMHh8VF18bbsDwm2i5rh1fsBtXo1eZuP5xLIxkcDZ8zYBPN0o+PbhXL3
	 hWUKCUTNjT5m+7emmP7/5o15aInQ7+cqErU5Q1/f3cMCIQtK3Ey8ZRK8kg+1opnsIPzOm
	 QCPfFjGv3GmQ6twh5WnCBUIbYNcputT0S02WXC7ayrTJ34I3Q8ZbznH4rU4zoRhPbuGxd
	 laxKv5JSZSCfzx8h+bsaQaTpBOoZN1ucXrL1jxkurAjapOjSaEL6zPiZzxhtcFlew9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TXs9AF5g;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8940B606A32E;
	Tue, 24 Nov 2026 14:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8940B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TXs9AF5g
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 40A404E41768;
	Tue, 24 Nov 2026 14:43:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15C16601E1;
	Tue, 24 Nov 2026 14:43:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 879ED11E6997A;
	Tue, 24 Nov 2026 15:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531422; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j3UMb6Tq8TxZ/5efwis1lZEKc4crhPUm96cd/FT1lQc=;
	b=TXs9AF5gBNTAshSzYH+Eh1PEKvaUaoZtVIzkUqNZ+gIOdByWoBs9wV9t7TPYRFEnoD/QyJ
	uxOHMjm69h+QnXEHDKgd41sCPJmAGeBchnfPsMEdGucwIsaouE2Ys80QKM46HVlbiCM5Z2
	AR5/NKMKXoSGXc8fAl+FQc7imB+mVdOobuJzT6jIw4XeE9Qr4HjfE+HdUmaJ6x6OZGuPuV
	z4DQ5/6GpAWUeBX+f2NqoeqbVkqBJRv+z5Ub9V7qw5qZWY8CzLu1YPwuIxsdazXXHR762Q
	3KXGHFT48Qip4qGSWehi1TK/+YKuwkBfHANRZv6Py+D/TRl42HnZszyfXhvcGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 15:43:06 +0100
Subject: [PATCH v5 5/6] spi: spi-mem: Take the controller DQS support into
 account
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-5-261e0e712857@bootlin.com>
References: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
In-Reply-To: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Require the controller to advertise DQS support through the new
mem_caps.dqs capability. A controller that cannot use the strobe would
otherwise leave the memory driving a signal that is ignored, which costs
power and EMC pollution.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 8 ++++++--
 include/linux/spi/spi-mem.h | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 9537756e5afc..f6aa46d37f5c 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -570,11 +570,15 @@ EXPORT_SYMBOL_GPL(spi_mem_set_dqs_pin_available);
  * @mem: the SPI memory
  *
  * Return: a boolean indicating whether the DQS signal is usable or not. DQS is
- * usable when the memory supports it and the line is wired.
+ * usable when the memory supports it, the line is wired and the controller is
+ * capable of using it.
  */
 bool spi_mem_dqs_is_usable(struct spi_mem *mem)
 {
-	return mem->dqs_pin && mem->dqs_wired;
+	struct spi_controller *ctlr = mem->spi->controller;
+
+	return mem->dqs_pin && mem->dqs_wired &&
+	       spi_mem_controller_is_capable(ctlr, dqs);
 }
 EXPORT_SYMBOL_GPL(spi_mem_dqs_is_usable);
 
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index ed581a4d4e9a..d524b2862e11 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -394,6 +394,7 @@ struct spi_controller_mem_ops {
  *                   is a pause in the transfer (eg. internal bus contention or
  *                   DMA arbitration on an interconnect). Features such as NAND
  *                   continuous reads shall not be leveraged.
+ * @dqs: The controller can use the DQS signal provided by the memory
  */
 struct spi_controller_mem_caps {
 	bool dtr;
@@ -402,6 +403,7 @@ struct spi_controller_mem_caps {
 	bool per_op_freq;
 	bool secondary_op_tmpl;
 	bool no_cs_assertion;
+	bool dqs;
 };
 
 #define spi_mem_controller_is_capable(ctlr, cap)	\

-- 
2.56.0

