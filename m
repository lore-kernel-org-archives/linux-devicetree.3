Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440439;
	b=xnFMq7O2QjR3Q5yPuojbAmqH77PQQIXeY/iWABl1V2JmsfqtcA1I53/bXFEw17HkkSQD
	 h3fJoVad0FiAL7CKHYS2L4TqvICNB67Y2vOU2tlF6hz3CufO/7du1HcbHZiYyfvswVN8a
	 tRoMe5y9KCXF67dStgvTJJ/7ZLPWCP0wJfdwGZHtvuxLoZZV+8DwxfzSwMAd9MQfH5a6Y
	 jIOHz0Ondz/n0tovBRDuwFsMkLUuLt0MvmR4s5g+CFlczg7rPore0azdriPHj7WwCXFNg
	 yITtOwt2HvJe4YLe+UhKNVs/d7ATfT9sYkgOyRgvDj7gxtjuxaETVVQcN/msIH3BAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YPV1ND+Y5cr1ZRV7QTF9T5CIKQmib3RaWdAMyy6frHc=;
	b=k+D2abE8c8DjwED6kPkDiEVw4Zyf2Dhuz1jZtqZackAswBwwUSDyAqKYryeTqBG2HgKe
	 eydBaXrjqCetSyOQpchiACxQ/o40C9/fL+R+HmAs7bhQoftjBmkvdlw494Tk4RkuP5SUC
	 psWHZGNNJJ2PBlbTkR/cKVCA9SbwkfVzlZzu74n81LDe//u4vjikqUvrfAQiuaojV4VUk
	 goL9MocJHC2R8G3Xw5v5C9ibaXvLaVFCZrnWnLcKqLgR6wpSws8rF25Cc/sfUOP5Aee0o
	 MQ+v9maE6zwdCx2X4zhGbnUxNakVuuqqT+sBsfj9u1mo4lpQJGo39BY0T1C+ByETHwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l69kuM9n;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532D7606A31B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 20:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 532D7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l69kuM9n
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so524886e0c.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440438; x=1793045238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPV1ND+Y5cr1ZRV7QTF9T5CIKQmib3RaWdAMyy6frHc=;
        b=l69kuM9nBsR+l0ZfD1qjwGocl2TfXqkwPRTz9QKrnRXYHyEZEaUQB9/V81hETBJtTy
         qELQXTDhgpHVOiISHZ2PVXDIQRTw81JGSlXOIVsuMspQX00wJKUe+YOL0slnZdSnuInZ
         m4dUeryDiyUV5vu5zV83G79vFU3kAG9iMq0gpiQdXinEf+gV0T1zL1Xthi4IZ8wWH9G+
         ZHGcU3TQFPp0rkjpcKCUiNeSwMjTzG0uSbVVFM91nSVbuX/2wmK9L296XET3BfitHEGx
         INGY13UsZ1Zo6h2wy2kqU3D4axkdLslMai/yZ1G4bYuxDyYZm7Wn6C6wnEW5ZUAc0bV5
         8Ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440438; x=1793045238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPV1ND+Y5cr1ZRV7QTF9T5CIKQmib3RaWdAMyy6frHc=;
        b=siHmJWekK9QamwioeUoHPw5rEQftH6cIe/RV18yt4lVIeWtfaTB0MzOx5zpPVYkgNS
         GpWXTD03HGpBdwKQHPZLV/7ZYk1IoCf9A528wufBVgVtmpJj7mWO0MD6AKUQYIPtCvPz
         QddGaB7iFMzLk6rHHkh45zAQFouG9YgncRWxDqJEyPEGBxw4G6SZ415iqIKJTusfyKbR
         obZ74qubH01Ypq8oW2Va3YXqquU11zZom8BRq/ubkOpGMKSOvLS5nkjbY+2j4O2bcra6
         3IQ/QrpfpSGfacoTHuh5D+0YIABHFGDAqFZYwfdhNc5ee//lGdHQFQk0BlEsJDt5nvVN
         L3gg==
X-Forwarded-Encrypted: i=1; AKwUvByvXCsOciceEXY3XSx8pc7X16opR39XeJcZF9Ref/8ogqNpXv57D4iHSxuAkeV2XV09keXGpiSuV/3f@vger.kernel.org
X-Gm-Message-State: AFq9FYKUNvFApOnFgoeaJcm0WyavhSTIa5I01qM88XLg653RbvjU3Ei6
	Fj4TFDT584TqYmbnY4GJ+5fZ7Qlb9Y8kGjLHPU1JuTfctuQAsRx5XOy5
X-Gm-Gg: AYBFou02sR+gijGH7rTHpuBCBvaj+PTstPtLvnRHXFxkScqhxwbUh0QcVoKBSeMtkcu
	jykfBXe3MFEtEvxTnPE5eKCp4aai5I1ACMbOowHrTwi6Cw6jpKlrJVq86mXugOH/qp6tTgvCcA/
	HCjNUusfMxUAcKVYz/w/Ky+RJOnJw4NKGTEyzR320gTsl0nMwBvJt/bsj2R2EMtS+cnxyWb6cL2
	8HpvYqDr5K3iSf5wTkVADImJ+GNC4k6b/Zn69tpDGJzIAbzkSsIQsTwLvvhqhgAGjx9GZW5eYBI
	4cFRRVc0DO5vkgMnh5eMJUOUaOyv15VCcluWHWFK/M/ctzRzCHSPQ7mhj56YH8kKUghJONjjLzd
	CfEBPg3N4mXgh7PyXgQ9voeCh6CKB4MuEx1j4s2xRBINGsU97nsXg/H5OnDUkoI6ZqRQe4tG0oi
	473Wy5K4tUl6OmCyAlnrxUbMrjo00+5RAfCA5IOc7/mpdB3tSMzNx+0k7LzrXqJVEetdvbFMpBz
	mHxyZs/x7nFT/E9xdVp3AZte2wtttnqCuSRpCrRy8+Kjrupp4FArbP6MgHENLJJSuj0grOUgBxQ
	HvFpOJBcc7UbNM4H0g==
X-Received: by 2002:a05:6123:12d:b0:5ea:c214:b5cf with SMTP id 71dfb90a1353d-5eac214b927mr1447944e0c.1.1792440438123;
        Mon, 19 Oct 2026 13:07:18 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:07:16 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH v2 4/4] serial: 8250_dw: Add Allwinner A733 UART
Date: Mon, 19 Oct 2026 17:06:13 -0300
Message-ID: <a3505ad8e74a08faa270881f0efbfe0d0d82d6e0.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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

On the A733, dw8250_set_termios() stops the UART clock around
clk_set_rate() on every termios change that reaches the driver. If TX is
active at that moment, the character being shifted out is corrupted.

No baud rate change is required to trigger the problem. Toggling only
CLOCAL or CSTOPB 300 times during continuous console output corrupted
bytes in every run without the quirk and in none with it.

Use the existing SKIP_SET_RATE quirk, as the JH7100 and SG2044 UARTs do.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 4c86aaf9c121..718ec44135e4 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -906,6 +906,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun60i-a733-uart", .data = &dw8250_skip_set_rate_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
