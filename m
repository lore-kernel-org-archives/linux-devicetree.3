Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649501;
	b=zOVHKD7zsCOdHlxbYN4RZZZUBHrj/aCgSeiHWQpfA2PN+kl+6DzB7oy92DuoYNJIb6al
	 S9lKgTpf9nvmg8IN7p9NK+HFZ/iWhzlBEOwkuQlnvi4/s2z3Hx9ae415apC/zvZCzAR0L
	 EjivtdeTpaKK7XI1eOkwJZBiljA70LZavSnL2zts0pYKvdxgcx+KRwOqjQPTln2aIVOxo
	 11MxaSsHeooDnrmRu8qtEdwik688glywNbVp1iHDO3gLRLtYEWwBoIzgrMzRcL49KuUZq
	 VmpO26CdQwIXLTOEe4yi3EUpnOuyVrROFbbGcAbXzWFWiLtEVJiESui42jKgfCrfDgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JKnAC/v/PE5Id4vZjvScRbgOEIeYezkg5HQc5ebkHqc=;
	b=Kk4a16GxfDYkD+RjXONIi9CLMGAz+UTF6cPHj4zr3MYsZwKUex1tT3FPIt8Q50db1url
	 kwMnPlVzTAg3SgxkmUfk6rh9uWWmJ9cxwhe1QGdPKDKzpoIGM6srbUyTFSWUQCEkgyvQv
	 vDVhUrySltzBVMcZ+GHcvJD7o3++hrRM8+2mpVep2teVilY6rLdl8njvN11vy6s+zm737
	 zAb3kUNdnjU+LPnz7t0c9lbZ1wjrRwkCSZic3K8tEYTMxFtYzMZO9jtf78t1W0IyqGMgw
	 QggAc/bLle0lqNPV5HiqjfFYjQvpLXgEiQqZULyfJnzFZ7mHsl0l2ygaAP2KM9XcFPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uic/IL3O";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167F8606A339
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 167F8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uic/IL3O
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491846221ffso5492027f8f.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649499; x=1796254299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKnAC/v/PE5Id4vZjvScRbgOEIeYezkg5HQc5ebkHqc=;
        b=Uic/IL3OYcJCF3ErHoq9kSyVfw0xGqQq4NuKPNIwtz/iisnqLAP3ebjNiV28ib1PKd
         Bt8MGWRBB2uNTXeWS6SPxuf7DHhqhaQ8hZZI+Kg/uuzkDC2UTDY6kX108rnGBf1Omiyx
         frhK5ZRCDQ64QeccyxSsIKs5GTFR1czynldvh1KTaKhtLG5k1DZCrSlBg6vAAD5XgaUG
         0bOGXc89zHMjs+T88OWCek/1k+AkleTCYELY3GY0KNcOnSCl+e5CuDsmBAhQ2DKY81th
         SKy3tfKICuqIbkSFODfgYs4B5gnpw/Jbpm07Ee9r/VpoazYXfXV5vF2AB4ohauK7nN5w
         029A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649499; x=1796254299;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKnAC/v/PE5Id4vZjvScRbgOEIeYezkg5HQc5ebkHqc=;
        b=OjjKpvHVPgJzS/LvWAGZB/MMb84wyp94kOaK9dF7h4D1IaAjuGMzNhU/RjUq4b0nkF
         ZBsXdDdQQn79juQ7B9GPTXouhSKRj5HL8oehb+/LnaVPrIoX6EDmuot+rJTXE5zZBus7
         KgWByLbZB8bUIG/Qps8ISpfVXBlgI78v6j3e37krjaICJ3EsJTWBJPqOqGjA8MISuojl
         r4CWTjY1DAaULshHg/+hW53aIDgqhau0DZqAp9ntjmLoJ/5vr4zkyctapyeD2Ol0rOdE
         sBO8LVmt4JKBmnhEo3LKHE3D6yx4VcIWo6ygAQgHME1gj85Oxjc2vgiDh9rPsaji/coG
         Eh5A==
X-Gm-Message-State: APuU4Z/LQ+MA6J8jdZUwPprBN3X89lw1TO5vSBuYADrCaH+QNAB0SGtp
	Jf1YtT1c2qUFmtYlBLT+0EzS6NdOfghWKBcdV3Qcy0TCXUxesWWUdZl9
X-Gm-Gg: AZFdTZcTc6Ejj+FmfDJnL6e1+XfsCEtulg3k9CbS9dermVCmSF/FkEqHsb9MMjxkl6T
	r+uKR8E7yyxA+QD1Ymrz5ruZF15IQfXeqS8O9dxLRxZaFuCezPQz+g8qjy074u+Rh+tbfzJcETL
	vCcIHKLkIlCQMsw+xe6Nijb++OZ27FONKR7TAozD7TGX3dWOdtwvgFG1LuIFO0m1YjTGUFlPNfJ
	Na27bTI8sWMeu7XnA7+Fpe+VNIVm3x95hkn+Nih77viL//rK9SWvEQzE+VpGZ8xyGMSCeoig4ZB
	tTuLhu4VG3/VsduyXmIIkD0HgGH667BIpGBBJqZNQEoyncFAt6Nky2SKLu9G+Cesv7L9Soh3F0y
	HoTZmNW4wAoosp9SrgnwyBEYrvVb2wX/2+zsTx8GakC+ywg8K51oO0ZCGi3c4OmN1J3d7r7qNUL
	Gt3FX5I/l0vD1VMgf3uTo9hyMvKx154XbMzhgd16W3upMR74bDqqt8xqsKy81+SWdbp/kC3m3k7
	Mj00Y3KZiQpsn1aEdMhUNW5Q82KcIL2Qv01E3/ZzCkwhKOcRFAvZ/TsUOw/AQeOXwrak+Efpc5E
	q2FSXq79XLmBlH3qSssJaZhH9+bPXTLtlAvsuifB2EjK/I2hOOfe6/oocGKVbtFKFhWtNXsfOyt
	qdRTlmA7Ykw==
X-Received: by 2002:a5d:6f07:0:b0:4af:7577:65c0 with SMTP id ffacd0b85a97d-4af75776767mr27523078f8f.5.1795649499471;
        Wed, 25 Nov 2026 15:31:39 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm38590936f8f.8.2026.11.25.15.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:39 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Subject: [PATCH RFC 12/19] serial: esp32: Rearm TX interrupts when the FIFO is full
Date: Wed, 25 Nov 2026 23:30:13 +0000
Message-ID: <20261125233020.1380594-13-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When transmission starts with a full FIFO, the driver can leave
queued data waiting with the TX interrupt disabled. Rearm the
interrupt whenever there is data ready to send, including a pending
high-priority character.

Hold the port lock in the TX interrupt handler as required by
uart_port_tx_limited().

Tested on a Waveshare ESP32-P4-Module-DEV-KIT. Verified that serial
output completed during SDMMC reads.

AI assisted with driver development.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/tty/serial/esp32_uart.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
index 304e1345518b..002d6fdbd875 100644
--- a/drivers/tty/serial/esp32_uart.c
+++ b/drivers/tty/serial/esp32_uart.c
@@ -354,14 +354,14 @@ static void esp32_uart_transmit_buffer(struct uart_port *port)
 	unsigned int pending;
 	u8 ch;
 
-	if (tx_fifo_used >= ESP32_UART_TX_FIFO_SIZE)
-		return;
-
+	tx_fifo_used = min_t(u32, tx_fifo_used, ESP32_UART_TX_FIFO_SIZE);
 	pending = uart_port_tx_limited(port, ch,
 				       ESP32_UART_TX_FIFO_SIZE - tx_fifo_used,
 				       true, esp32_uart_put_char(port, ch),
 				       ({}));
-	if (pending) {
+
+	/* Rearm TX even if the FIFO had no room for queued data. */
+	if (port->x_char || (pending && !uart_tx_stopped(port))) {
 		u32 int_ena;
 
 		int_ena = esp32_uart_read(port, UART_INT_ENA_REG);
@@ -372,7 +372,11 @@ static void esp32_uart_transmit_buffer(struct uart_port *port)
 
 static void esp32_uart_txint(struct uart_port *port)
 {
+	unsigned long flags;
+
+	uart_port_lock_irqsave(port, &flags);
 	esp32_uart_transmit_buffer(port);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static irqreturn_t esp32_uart_int(int irq, void *dev_id)
-- 
2.56.1

