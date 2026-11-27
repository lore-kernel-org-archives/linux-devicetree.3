Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795806;
	b=sLK7P/vvSx+FfRhQTKmBX6DTg3ujg1hLTM7QTKigW4gBzICD48CDGAcvT7+gPJy2Q/3r
	 WGaitFDYhvDcXNlg34Y3QcJZgJoeDl0mpicf8wsrUZmvpRYMF+DRYFABSveD1fRgGiDDf
	 zSkbfrrCH1AFWT2MUS45TuS73wlwB8ZAinowBVZSo5aax6hN5v+m9Y2TWmLmMxa4Xn37d
	 5DZlmwwI9PsNtqY0V0J1T4la+AxIPY2ARmQW1ggMyi53TpHwQmK1Y+RmSZpmw2LCuMlaa
	 1lu3PuR2wlKcdSbw6TDqx7/BT6miK+Rez1qjN3B6PF2oKP17ic2dFTl/LK2O9UYinBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795806;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=E5HE6QdriOjfRYPhHQNXELIzDoO+4VVClycyA66PLDU=;
	b=Tz1tpY1d7mM1dgsbUZrvuTBmHxzOJnYtjCk+lNcllfME0wTGlt/rUo3kpgCi+UsNn1kB
	 LrFcusPXmoxKQ8T8OLM5zlZBeWDiKVMD/KNzseh01uxU+PVVrMkTXLjxUlbUHl89kdw95
	 OR7ctGQXQO/wI33terd4LoN8XM5xKToOmBPuJUd4/nmUiqdkoUZ8oiWRtDYh8ArvIpFFG
	 Bnntlzzbxvf5CDqkB2XScqTDOEM3TBPo6zOvk4GRXw/kWX0AaBuCGmcPIfvOBBMTu+XBc
	 OEUqLnMhZNL+G8TR+iJ5rXcXsk9NCvBMNAUDIQHs/eSkSRWi8d5It1MgBC0p9+hRX5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AQyVPrBB;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13C606A32D;
	Fri, 27 Nov 2026 16:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F13C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AQyVPrBB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CD7801A183F;
	Fri, 27 Nov 2026 16:10:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A10186049C;
	Fri, 27 Nov 2026 16:10:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D16D11E90CFA;
	Fri, 27 Nov 2026 17:10:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795795803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E5HE6QdriOjfRYPhHQNXELIzDoO+4VVClycyA66PLDU=;
	b=AQyVPrBBPU+BeOdcRTeCSwnO3kaL25XDTVWKEH2SxP8Z6LmWOvXGZ/uyu1q4mP0vSDrSIH
	zSB+3B7WmKQvoDhRLKGY84TIWX4sJ0we2fK4wVkDvO75KP+WqRxiCZkVNoJ0cZ1WwDCVQx
	PVHnHMD64EknzSD35Ryw26ZM+v8IFJuMXWOzCQSxh7Jv72RhHui2qNVP810wJGPLYylXaM
	3VSElc4fTfULOkbjrRVnNOblNzBjwxP9cYNLJbIg1RqZ4SSMr1sdAqqh3nVVTEfh886NRn
	3dNH5TcJL8ASn5V/C+pyhbF+ldHmwhgBgavzr2Y7UmAZpaHUA4RVSuBLoO0vcg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 27 Nov 2026 17:09:50 +0100
Subject: [PATCH 2/4] dt-bindings: clock: add Mobileye EyeQ6H I2C clock
 indexes
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
Message-Id: <20261127-b4-eyeq6h-i2c-v1-2-d3232984fe83@bootlin.com>
References: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
In-Reply-To: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add #defines for the EyeQ6H I2C clocks. The I2C controllers need
these clocks.

Constant prefixes are:
 - EQ6HC_WEST_I2C_SER: west I2C serial clock
 - EQ6HC_EAST_PER_OCC: east peripheral clock
 - EQ6HC_EAST_I2C_SER: east I2C serial clock

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 include/dt-bindings/clock/mobileye,eyeq5-clk.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
index f353c2988035f..d37f52bdeea74 100644
--- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
+++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
@@ -45,6 +45,11 @@
 #define EQ6HC_WEST_PLL_PER	0
 #define EQ6HC_WEST_PER_OCC	1
 #define EQ6HC_WEST_PER_UART	2
+#define EQ6HC_WEST_I2C_SER	3
+
+#define EQ6HC_EAST_PLL		0
+#define EQ6HC_EAST_PER_OCC	1
+#define EQ6HC_EAST_I2C_SER	2
 
 #define EQ6HC_SOUTH_PLL_VDI		0
 #define EQ6HC_SOUTH_PLL_PCIE		1

-- 
2.53.0

