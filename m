Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721120;
	b=TMzi1OX2yMEje7E2Lsce+ueT3Ne2JsKsxZQSVBdzqdlNqqurVl1bYOEbYtLf4RRkGxvI
	 Sg92LalnMjR+WWVPwxuE71AvMpMzlnVhMVrVa0GOV26bpLrJyZxFr3lyLki8XZfvMKL1g
	 60hWqreLS0NvNnTi3boiFJeVrbqbb8JAvY+UnPkFTQO9J9aCgb5awEQYGyR7c5TOpeD/h
	 aeIN0tAiASSnXkOsAGvUVgMSEIJxTveeMhbKYH8C6e0GvEPbULzYdLgHB0TlM+zCQWSBF
	 Msy1sX6qX+sXOZp1eS3be3ASVzZakP4nBcmXU+HhxOdB9/E/MgHKWFZs/QF5f5QzmJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oxH63X4dAorJkZztMsnQ7q2lWTpXKUKEQkHtJyrOa4s=;
	b=ELKr2pZmRtmXqsXrdYyhH3Wb+N9WNmGaNreiXEVBsaCs/r6YkvundnyMgfbeojmnq18I
	 3kWv7cGcxCU4Qv+bGGVSIBx4egUgDR6JVWv5pSmf7ejl4oIBme7QIU0rx1qlSwH4CGx5n
	 mM0vdZQzCunB5C4voatd2Qkj82izRf5g84Lx1WU3UPpDLqcoo5JA/aEr3v+veoe8zOqkJ
	 6vcJrGD7Y+MEd143PxlDRuRhHhk7JUJdd1x3rcAuW4VOZ/VJo5cPS+6GYm9DPEFlJGOXw
	 0jX7LEB8LypvX0sPntEmFMJVo/1mEdqOheIADKPuc7i2FGM6AIaW+sxMHy7AG1ouiBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UQbTpRt;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01936606D819
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01936606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UQbTpRt
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso43699565e9.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721118; x=1794325918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxH63X4dAorJkZztMsnQ7q2lWTpXKUKEQkHtJyrOa4s=;
        b=0UQbTpRt5x4bFKA10POaXWgH7o2SI4d1Ye/f1CT+wpxWVp2oFRjQXbm1r+VxoUpzL+
         dctptXzSSZXP8mZmQjwCmrPtv09cKw6ekn5h1gLKabZpAbI0+SX/3+lktdnjEj4IAtyM
         Hg5BnLmXUuXMt5oiL5KOAMcPK3MPMTztSWnbriOe2R3iYtr5qTf9iu2SdG9P3l3uY6zQ
         FybEjfEKMnYetiIUeFltwHyzgdM7aGyw73b1OZsT3bHcXUNGO7bAaELgZGd71KaYoi5x
         lNHacUUFUMH7gRdtMya0yVhDHvw571QfrkAmorD+cdwFBL+tbEFxeIWpubcPt9/g2ALC
         9E5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721118; x=1794325918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxH63X4dAorJkZztMsnQ7q2lWTpXKUKEQkHtJyrOa4s=;
        b=K/CK8VdyOPtx1DvygGF8Y5v3GL6Qs4uqTIpiWESnQDZdHVe8VGKY504BqiIOB7K1/n
         jmdl6FYdXvm5eeZ85YxsiKCCDqwq21LmGwnO+Ij5XDo8dKXzNni6bpvXxujkqjrOHBqq
         CYeBydBquqBXEknwGHM4N+tFY2ZlfyhKnPqUGxE7vO7CIRTok17gY8TR3cqduB0nMFI6
         5YInoYNv9FBFf7F/K9F9kW/f33s4j9cpMeaUGExZPT31Ko3I60p71cy7t7gT1VyiKXlO
         66G3G1jzzGCrX2+ujrxJjuhysskohcxq9u9i5o848s4Fpo2VAIaHTbx9SPai5HCGTTtK
         GS+g==
X-Forwarded-Encrypted: i=1; AKwUvByQk1/owuxXcKya/sIZSCRGnnpb1p1dsbWufnt88l4P5EG1rXDxHjy6o7U0CMcOAWPyjZMa1PU4Z0lR@vger.kernel.org
X-Gm-Message-State: APuU4Z+t/tqFX+k5yOvoJNkS2X5r5K0z2mr2z9Nunao0jArV/kG52L8i
	AFFmohrUYteurYd1PxAtm/I6xX3+RTI2UlwnXA640yOpWqaTTqeRkyuQ
X-Gm-Gg: AYBFou1dDL5XuBqu5Ee0dRrnD3VLYkHTPJZGsDTpSXGCV3Hp1bfHX/kw90CzvDUOXCz
	BN4pZTzRvQMo/j2eZaTBf+rImHgVUy8m9XsG0kqZeDgnpM9Tzix8BUDMaI2A/PyL581o+HxztzI
	sSJ9wjOnwchaZukM7UmjoD+wh/LLG8tuLz9NnJSPsBLDBeUGxoNgH6LZ2Mrc0syV+3gpMYP/2gT
	IIIPnzASNj/0QTKPO+L7Xa02uU4xtVXnHflB996MqZCySDIBvQS5GEbi0t/KPU8HmVXhwwptwjO
	UvuPDIn5OGgVZeqlcU3zDCk6lHxll3Lbw7+6x4gEJ+aQaRRySjgtzJ28+AO85CnlzGUYz+VYcKi
	acpJQooMcZ25GVfItv3/GP5J7MNHfWQIk4RKLAqP6/ECeu+/R4CKe/f5irUG9ro/u7fXrHJYVna
	LV0doTZSJ/OAe7DWBIRYOlz07pQUag01+lhplD9IKwUbktQ1GqxdpuUHrvIaJhuT/UFi/fZTjXy
	l0P7UmZT/tOWi45qQhZhvXMcnL5UEl+P5Z4zp6mLBkTwKOOVRxiE3sAl/+ifWNlZPRLP6sAO9tY
	9Uv9agzXAWEu+lm1QLEWwKSN2WhlXptVshckbsbFY1iq5UuJkIYy7ekmbIXr3AafYGSSjAScdem
	L4dre4iWaYOKDEt1mm0dOEhsoA45/wzaY/Y/0C1utfhV1MyqfKeQC
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr310741055e9.29.1793721118269;
        Tue, 03 Nov 2026 07:51:58 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm25680750f8f.46.2026.11.03.07.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:51:57 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luan.r@variscite.com,
	alifer.m@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Johan Hovold <johan@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Fugang Duan <fugang.duan@nxp.com>
Subject: [PATCH v1 3/3] serial: fsl_lpuart: Enable TTY wakeup for wakeup-source ports
Date: Tue,  3 Nov 2026 16:51:27 +0100
Message-ID: <58d65b44ca054ea83eb835bf5decebd688cad04d.1793719239.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793719239.git.stefano.r@variscite.com>
References: <cover.1793719239.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

LPUART checks the TTY wakeup policy when preparing a port for system
suspend, but does not currently use the wakeup-source DT property.
Consequently, userspace must enable TTY wakeup even for ports marked as
wakeup sources.

Set tty_wakeup_default from wakeup-source before registering the port.
For TTY ports with the property, the serial core then enables wakeup at
registration. Ports without it keep the existing default, and userspace
can still disable wakeup through power/wakeup. The port must still be
open and initialized for receive activity to wake the system.

Tested on a Variscite VAR-SOM-MX93 with a Symphony carrier board using
LPUART1 (ttyLP0) as the console. With wakeup-source present, power/wakeup
was enabled after boot without a userspace write. After requesting deep
suspend, the board stayed suspended until Enter was pressed on the serial
console, then resumed.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 drivers/tty/serial/fsl_lpuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index c8575c965203..35397152a39b 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -2905,6 +2905,7 @@ static int lpuart_probe(struct platform_device *pdev)
 		sport->port.ops = &lpuart_pops;
 	sport->port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_FSL_LPUART_CONSOLE);
 	sport->port.flags = UPF_BOOT_AUTOCONF;
+	sport->port.tty_wakeup_default = of_property_read_bool(np, "wakeup-source");
 
 	if (lpuart_is_32(sport))
 		sport->port.rs485_config = lpuart32_config_rs485;
-- 
2.47.3

