Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721118;
	b=Oyu0BJ9m+BmssPLCx064MgAfZv9FQaCmTHEt03y1ljJo5f9zXJwYuaZWUJEppRCdnhPA
	 NvN7FX3moLO6Z9VXqPMe9V4BNtj4zmYxLKyDIosvYmbnDQ5BO1Vla2ihNXHAdH1S2zGMo
	 JXD8kvsoGOvJPu3VwnzUExL/9a/k8HYLVPu+zP6Bs31R9WS09X1BFdXJGHGDRfjn+UwJ/
	 N9dUyEz0l8wcfhBdyLms5JvMFQv4r5Hwj4eLPH92JCsKSzhLPNR+M+dKr6rEMSY2UkQis
	 n7FS9fnpctJh8Vvec30xCd1ZB8MFABIcC1TsItWISw9ynYGXSHepe96vGJ28srBet/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=H71gfqYcryivhuQjqCzDbHCn1oc9iWNIE78g3IqBiAE=;
	b=UBaQh6111M1dvcF8VBEKyOfrHADy15RciP3f+6PbQ6iUMRBTK0DL1QlXLSqD7AP4DlBz
	 1152+WoOe8uEWeWXV9Usite+vAVkVebrO/0Aj3cf7SU7jRGli4c4YE3+saj7EA98xD6AW
	 5lVKVb7BeOYfoW26VxfS5VzKVhR0v+sSy+1GAfOAR28Tk/O0ton5doT9EWymsLQ10RF9M
	 lSGLzYPu5xP2TqXqmG87xb7V/zhDEkuAww7uy0d36YTu9U9vmHzXoUIBiT8dlQOb1yJiw
	 9lhM2wjd9XL501Dm6q0BxMH0HAmQamgMDXtvaXNgbsKyOD9AHRJH2OmPzs4ZBtYReXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ey4MhMEh;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA8E606D806
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA8E606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ey4MhMEh
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df54150dfso2214470f8f.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721117; x=1794325917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H71gfqYcryivhuQjqCzDbHCn1oc9iWNIE78g3IqBiAE=;
        b=ey4MhMEhJLG/7pgDAb5MNxYJcWkTt1QNfCLrq0lK2KbFrJtWdKv/V8mEbZF3qp3VOd
         NPMpv84Eg3N8AkZtgIQlP0j9Q8pfs73XXnrEfl6ZrwPBJxS1LsjEID/65NeTfbD4Pqon
         T1t1B6gZZZWEjrwuX+kdPRBUzo2q6uNaTBQrHkTB6ElumWDrcc9hnXCRksOsRAk4AfPk
         A46w/8qmvUnZ2eGBYwxZYOhpkeuaElMkA9ravstpAz4qayu3hzxE/xf/7kr0sIKwLkG5
         bqQEuKAHPKI1xx7cWbzbXMDL79fwhGMV9yKnXGM32Lrt1YzE622UJiKSBh8PAaetVksZ
         mRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721117; x=1794325917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H71gfqYcryivhuQjqCzDbHCn1oc9iWNIE78g3IqBiAE=;
        b=b9phzFjo/Wg/uhcM0CY6KtNnBvf7kNT0OOZLzCbvwM/LrepaNmLs7hjfDqH5P8ZOwU
         qF5GwwHbLJqqAtBQpuHmHcS4iz+sIBU/nKu+gpcSXN2FezhIIqD/AqQitAL87lfeRyAx
         cZH4Z4V3reB4eTcdYHO88jHlMSj9GxTE/DcC1kHJ0czO/JNdkf3SubUt07/lxgdxXmSb
         N6b6K5zNNZgJKKsmiqXmnrEyXnUeg3Alm2Lo/f2U6uPC3zGabBU7bOqHL6JwTZNASTon
         5omoWe9wvji7dh3sZWw9QX0xypyn4/Vu2x3R5yaIlFyX3MkhPciqWOnr4zU9fxIP0k/t
         LpUA==
X-Forwarded-Encrypted: i=1; AKwUvBxMgLQcc0MqrLi6HlRLh3ry1wcYZa1cAT5FmDzPeAmSG2zqerJjZRpSmcP258OsSNRyaUyLG2xC+axm@vger.kernel.org
X-Gm-Message-State: APuU4Z+k035H715bvb2ziymTokhoLCVAxMB0uJFtbE5wc2KkSW2kKGyk
	j42OMSbZo2Zh5HzB7mr67z/hW34G95tfGLQ1PaCp7yTC4eIx9+jTNcED
X-Gm-Gg: AYBFou3XlYuPEKb2htP4z6Ao6RiSQXwO+hqHpBFnLQjVqXxMxpqT2Iq1q2Wt4x8sqXj
	oAGwkXizva6tRf1bnmxBKaj9c7y1r6LeoOOMiHqbdxgyjb0smcgrD4UsranWJ+nxMnjKKld9PHh
	in1TXZuP5uosmNRRLsyJ2dWsz4wi1qexrR2NBt5qCYvzDsh5z+2TPlCKNe1p7aEMKA7vvFSg14M
	0wSUwmVT69QoyESy6j+Infh23kVdssN+z29mwPA+BsWbSYP/2z5BFSakbssp4AawEdu9sxgFukM
	1kyuX3WCMZ18etCCECg0+vz47VNj78AqjFE/7zft8UYEWXH6VJ/T7TGHQvumGRlhv1QBmxDvY/J
	OSmV66FD5ndATOfwPZAQ+BJN5A9fjRcrSHVcdKCoUkq27TtonC2MywB536GcOLD5FIAzZX5Nr01
	V/DDd7C+VARbU71EIeTEQDXIJyOB43I74w4Sv4HaR6BlfbcTmnbT798dLqCiKqbHy8OOPzppkUV
	xDhqjf47S+ml03vbN0ayJzRobJyPeOs3Tm3VXugB9sFfBa/hfSQLjmPk6r0DABq32O29506cTbA
	bMfZ/xJT90lLLjq/IINJ45EPjln1RLeaw7dqwyz4Pu5b1c3mQx7NxKXV+zmYlaZJ6Du7lMdDk6E
	bZtmG1nykFo2zUCA4Q8al6lTKexRW1wV2DAoNKewEWG6N1EKK0Ezz
X-Received: by 2002:a5d:4d82:0:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-48e6e4f4ff5mr23255855f8f.44.1793721116508;
        Tue, 03 Nov 2026 07:51:56 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm25680750f8f.46.2026.11.03.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:51:55 -0800 (PST)
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
Subject: [PATCH v1 2/3] serial: core: Allow drivers to enable TTY wakeup at registration
Date: Tue,  3 Nov 2026 16:51:26 +0100
Message-ID: <b73bdbabd8d8fba2a2ff5d8576261bda6d8b0b5c.1793719239.git.stefano.r@variscite.com>
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

The serial core marks registered TTY devices as wakeup capable but leaves
wakeup disabled. Drivers whose suspend path checks the TTY wakeup policy
cannot enable that policy by initializing wakeup on the physical parent.

Add tty_wakeup_default to struct uart_port so a driver can request that
the core enable wakeup when registering its TTY device. The field only
sets the initial policy; userspace can still change power/wakeup.

Apply the setting only to the matching TTY device, leaving serdev wakeup
policy unchanged. Drivers that do not set the field retain the existing
default. Warn if enabling wakeup fails without preventing port use.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 drivers/tty/serial/serial_core.c | 8 ++++++++
 include/linux/serial_core.h      | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index c0deec0e6af4..aa18d0820060 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3121,9 +3121,11 @@ static const struct attribute_group tty_dev_attr_group = {
  */
 static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *uport)
 {
+	struct uart_match match = { uport, drv };
 	struct uart_state *state;
 	struct tty_port *port;
 	struct device *tty_dev;
+	int ret;
 
 	if (uport->line >= drv->nr)
 		return -EINVAL;
@@ -3196,6 +3198,12 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 			uport->tty_groups);
 	if (!IS_ERR(tty_dev)) {
 		device_set_wakeup_capable(tty_dev, 1);
+		/* Serdev clients manage their own wakeup policy. */
+		if (uport->tty_wakeup_default && serial_match_port(tty_dev, &match)) {
+			ret = device_set_wakeup_enable(tty_dev, true);
+			if (ret)
+				dev_warn(tty_dev, "Failed to enable wakeup: %d\n", ret);
+		}
 	} else {
 		uport->flags |= UPF_DEAD;
 		dev_err(uport->dev, "Cannot register tty device on line %u\n",
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..d5a0666d782f 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -573,6 +573,7 @@ struct uart_port {
 
 	bool			hw_stopped;		/* sw-assisted CTS flow state */
 	bool			cons_flow;		/* user specified console flow control */
+	bool			tty_wakeup_default;	/* Enable TTY wakeup at registration */
 	unsigned int		mctrl;			/* current modem ctrl settings */
 	unsigned int		frame_time;		/* frame timing in ns */
 	unsigned int		type;			/* port type */
-- 
2.47.3

