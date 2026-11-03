Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742009;
	b=J9EcNebkSbx5B8dXzkTm59Wh/srKPeAl8QBaLuLZp3SQOQmk38GNzPzK++LirTLXXQDr
	 hjKhTJcxW51DbzXC6KUxXbfV6hHzF+evPpoIsXqPM4e9wVo3XA9KdhXOMNgpjCZ4mrgM1
	 j7P6vtM1dd4apqjsUKB6kSdRlCyV3uF7i44XAgQvISb/svz89+xdCyOMY5kfCZwcH9L5f
	 Di1Jx8DAD5ZsU9agYTsR6/Pj+WZz71niyfIhqUd0nwiXqmAwNa0/DKjKWB5FT7M2J3UDE
	 yzeLHDlovwcMxWUzFIH5/yK4vCjPvQpRgR85XC9ijrL222DQfnWLdcYLQRrj8bhwREg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
	b=WiG95NrMyGuieA9EFTpYRvxE/KWavc60J0SRl3r6RRJLljTcR3Yy0o+AibKCVdHPK0n5
	 Xgg8QAxJR3h/v3yEjK97uiIueiIlwvHTu3CxhEMPYk5RnmwEk8wxjdfVitEV5liiSu1AR
	 4QL6JUhL1tOBtzXFVwoA9ivG2fQCJk1nZLS/lEkJgz58MSurm9t1Cv5df41RftvuRDhW0
	 rSQ00PnAkcEiLONHBGhSycXL0cNJD9RZvVswq1yU8LDWHec4CDcic/ZBQOtvQ3j+9LII1
	 LuIJdVsP9tydR56gnN3oBvNPmz3R25MFl1sw+dLzUHrkbe2J1yCVF6I/iQ3/MoZnhnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJIx0CSX;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F4606A337
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 135F4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJIx0CSX
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-5058b105df7so30620b6e.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742008; x=1794346808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=XJIx0CSX0t05km3oi72zgQp84PQKqw3zLZpOV8xPVOVcJnbKbUM4u2U9SKueHHOck8
         DqB+6Coi+bdr4bQN3i/lJzdONPZZh4Jzwk7IZLd31yQb0yBc3ai0qegUldHBqFvm9ORt
         JBb0Bk5BWeC6Gwpovb1vwzDSpTqPs62FmlUPET6tqTsAolJQBO8kT4IsUn5XxqCoRLdj
         ji7n36UdsxPL6xG/sGkUMjup+f9S14T6p/eYUDGt2a/xJywa1tmQ9DsGkbIo4nUtsYqg
         oP3+NIRN6u0d7K/A5r5BDcmhNXbqVNZfd1WZFL/QpSVdO7fMxNuIOz4PCDs321FtLNlP
         UAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742008; x=1794346808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=HwoQfZW34GHy2OAlP6GdCH59qSz90rXt/tQidSfaEeYcO8X/i1GlQJUIx6O1pbDEJU
         VQdKvtzbehoYOxTBXDd2+2Xtohuxb9h93V+FFQv0Hf8MLvkn0dpjgIWVDRzxeBBO789r
         CagN9IPVYiZKqa5r0mNDdSpeSjWqwYditiwpUy4PH4+FIPLZ8dkhkQJ8Fk+VxSkmyROP
         VVB8dl2/S4OnrC7x3y5ZYOHEpUVCRikMLXwLoe+AA2jIdKTCFk50hPysPtn1iHFJr8mA
         yc7XmMczSkSRwsOPT2WGmEilrqo6ZGkW6PU+UOuRI5ZQFixRnc17M5YhUF4uHpDSAgMc
         f3oA==
X-Forwarded-Encrypted: i=1; AKwUvBxZWK0Oxf/a+DeUH0rpzbowosamQ2HI9zguibbbEJIvrEcMhbPP+o4lvCiaOetPUz4n4jM2RriZv60N@vger.kernel.org
X-Gm-Message-State: APuU4Z9CcyO5uI/Pu3nsp3E2YTYSlNTzI5XYf/k1Vdunri6m6Wsyak1I
	nk+f4WMOaZJg8FFZ9xLkoV4It18cUB2Kt76c6oGBSaTmfRg3Sy6tgZqy
X-Gm-Gg: AYBFou3dXQNRoKNroW6bgCXaq163+rR/gFn+2sNl/1YYCu9LyJXdJ3MsXLxzgIsBEn+
	Bq8q8ZQNckE/GByjXecj+dacvYp3opSLulrwhkDziI3poFDZ06EpPuZTDu+Hr30ecOzYuTWwQeQ
	zzB0aoI5iaIKnMeSOKSkf5cAgckEGEcSD/hAzZf0Ikhsp6cf1csebWTgBTgzDaAKw9TqgT4tZ7u
	wEfmbyEPbglgd0kTKovQ1gT7c6D0S6Y4OpZWNN+12Up6z7IsMBzRvH/qwLIzc95vn3NarHUnVIB
	vjKxZas4/ai4pq5iW+sKUX8StSw2N0SHVnPCJlzZvbF2OAd4Z8+ENAlnDszce2ruFgF3eI7lP2n
	ePRkF4iEeYePSqV/+ImeUE/xr8bJW5VfuZbXS3YqwMjKOsOu3c2KTbl04myLMbeVZ+V+EPc9tT4
	dgykNcSpJQNj4qhCWOqgWeOm0vNDH+aQNsipYbgC28OK/jRIfH7f4K8sdH6WbjkFUg09MEd7RnK
	OwwFETgjtNHCP363TXus5nsJCGd9GFS/gpJ9+w8UMCw2oAbr8LmpH6brCdT+pK0DCa6q4eUhPWX
	/KqIcS+Axuu2l6ESJSb5bRmRGJyS9/oPv7mjYL8Q/04hGIEd29qLfiNu2/PLR5eNS9xUqyV9J1a
	wvCJ5qn0jFo6/KOOrgej7ju8Um4XIS7hyKI52BM4Px/8FsH8rWc3iP2tXFTdAU9WrNSTgiqSeHL
	3RFzLjXkFAIC2sdcT1W8Ae1U5j9TNRzvnvZgvZ3vTc2hmYWLUNzy+8
X-Received: by 2002:a05:6808:4fce:b0:54c:7ce7:33ba with SMTP id 5614622812f47-5640dc9006emr9815263b6e.28.1793742008124;
        Tue, 03 Nov 2026 13:40:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:56 -0700
Subject: [PATCH v7 03/12] serial: 8250: share the RX trigger conversion
 helper
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-3-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Drivers can supply receive-trigger thresholds through the RX trigger
callbacks without adding a legacy port type to uart_config[]. Extract the
threshold search into serial8250_bytes_to_fcr() so those drivers can use
the same conversion as the generic 8250 implementation.

Keep the implementation in 8250_port.c and share it within 8250_base.
Include the unsupported-table check and preserve the existing nearest-lower
selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 14 ++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 939b7d4209f1..8729619160ea 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 452851815ffc..73bc9e7ab703 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,16 +3015,15 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
 	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
 			return (--i) << UART_FCR_R_TRIG_SHIFT;
 	}
@@ -3032,6 +3031,13 @@ static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 	return UART_FCR_R_TRIG_11;
 }
 
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
+
 static int do_get_rxtrig(struct tty_port *port)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);

-- 
2.53.0

