Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20993EB809
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150862; cv=none; b=OBBd18z4/I0jLmamXRVoLO1sS48ZmWJg18gfrX1oEP03nCsttYNxzbWlCLCPVbSLDrtIKVuEHcSXUQtJREdMujq/0DcQV93gaxZiRUWf++/GpZwuTcY+VD13Lo7Ue42pHyQ6Ob22ALvEscggPfr7+/8uozA4eczi3NVhlthiN+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150862; c=relaxed/simple;
	bh=g1dqMkM9FRqcISzpWaPgbTkXATG4HTONa0v3S7F2LNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdNhjWp8XcgUYpYFY/ZdGlnk0gQE5W0hsgaXd9wgrzF3cWEiqAkX95Chtx9z2CPsFHBlZS4mmKjQCBRRq0sG7d6uxCTfAVMSj/tD8SozuQ3tx7LB0KgaKM9uzjUzGvrDRwgcY1V/XxgfllKPbbQaYFYGrNpTSR2vHuUBfqopS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=BoqWa86M; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="BoqWa86M"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-130c9dcbd25so1569920c88.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 03:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1778150860; x=1778755660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlFEH9FI6VHpMC6EQEPKMetpez97tZuXzygZrJOEYRA=;
        b=BoqWa86Mn3L8HNuz6fhkKPviuUMgu70Z3ra/nlKsmqVXigVYczqeQKLzSSeSUfJs4t
         k6akYX3cuMeagxA4PmwmvICjVa7JybWpLFhWkYMoMJz/j55ZB6JtKLQXnlQmO2rkQ0dG
         858wcumaOxRgGvSTUVqtFjvS3IGBYHC99rdV2OBI0C6wVsri7oz15bMik6Z9LPJUpjW5
         Arugwd9g8LHLUz/KlsYhONNv3txaa3SMcD8z4v51F/p/5BYhKElme5Roz6AjZeVqKj2S
         JpRc+d4sR2wX64G8CuRb4mQinDb3V7IZl8tJigpNnHNTnkNdPy+QPkfMIroNIVaPncsK
         4J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150860; x=1778755660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qlFEH9FI6VHpMC6EQEPKMetpez97tZuXzygZrJOEYRA=;
        b=jkDccBT5N5AslUEBJBtrHxB3XJ614BbFxzpi+vtOF65TRPO6c5OSQf/1f8wnRccXjD
         MSilhS9puLQkIyA+N8Kn5J86z1VAXvdUSmK5/V9u2SdDrPt1XvcRJjUw43UPmRtY/Q3y
         HI5hkxsfEijBFhIVHbF6ygRrz/+NLhPjMBM0CAyk/0jiveiK70th3EPkIuBZXE5/eGQg
         jHH8dub59+/EJ7GShth13juJ/Vg9Nd1fwt7ndzkB70W936+j609LTWEsALE2mol1IQMe
         vN/xCAI3rfxM1NqqjKgVXQ1R1Nb6tuohoeZsSjaYv9ZbSb0ub8eLDUrBhFS5+A2c5AP+
         PdIA==
X-Forwarded-Encrypted: i=1; AFNElJ+154nBc06JNexL6/zc1LPOONdj4nMnYSu/hJTXkqXALvS0hJERVeLxIfaqfKVptLxZfeXc/Im3q5kd@vger.kernel.org
X-Gm-Message-State: AOJu0YwciLE+txzq6Wx8FfgNgC+jw8Ut8r1QpY/IcuccC6ul+gYH/Psk
	Qxk6d4ZS6qISWD9R0Sv1PQhAmA5I2gYjg52QrHrTmdrrdji2PAo6ItCRY5/vh7qw8BI=
X-Gm-Gg: AeBDietrSHPV9oZKDvkaRHesFzGN8jGGPBxkc7mgbDwo8J+bqY+F6AJuuKhqQwfeQId
	mH/P+ZdpZye7aPgoRv/emj49zy63GxA7x6cF5R+o4pTIEXq1/PE2QoFiDWD+1Cv2jCTCVhZZKmz
	9O3VjEGpXvsl0HDVwTxjsx7G4KA6DCyx97CWHDLq5cvY6bh89SvGfLt8OvoiWLsHDsP31qzXoD7
	7oF1AoA2oc6dxzKHNlZsLMr1qf9Aog3F5WCXqWd7vnOMEruonYBSxNk6KnJEHZMBSrmtwaycVJy
	Vkq6LmCr0OfR1iEap2B1keUszoRqPNQtylQHLgnY3Fsz23V0D897B6hc6JrEoPOKl7/wK+tMJ6M
	fb/Bhhn4hkjTHcJRZVdDRpyZvOebKZ4BYArgW+MrnhhPeQSbZJprZBB5CdcVXnqgNjCBvdoqM30
	1UMDgmj35ibnZ3ux4lw/LomZBmXlPVej4CpUhOuZq+kFmeiURx5grIwacuLD/Kgqm2/pysryJnc
	poEuAuYYakW5PgWmgv8Zj1g9eU4mjj1aFZO2kTiep6kPddBlMUSfH2vZ7pU7w==
X-Received: by 2002:a05:7300:cc1b:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2f6e1e316edmr1167138eec.4.1778150859870;
        Thu, 07 May 2026 03:47:39 -0700 (PDT)
Received: from fedora (cpe-109-60-83-79.zg3.cable.xnet.hr. [109.60.83.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec5d8asm7040271eec.3.2026.05.07.03.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:47:39 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: o.rempel@pengutronix.de,
	kory.maincent@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next 2/2] net: pse-pd: pd692x0: support disabling disable ports GPIO
Date: Thu,  7 May 2026 12:46:55 +0200
Message-ID: <20260507104720.262641-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507104720.262641-1-robert.marko@sartura.hr>
References: <20260507104720.262641-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip PSE controllers have a dedicated disable ports input that like it
name says disables PoE on all ports.

So lets support parsing that GPIO and using the GPIO flags to set it to
output high by default and enable PoE on all ports during probe.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/net/pse-pd/pd692x0.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
index 44cf9f97be67..670656abd16f 100644
--- a/drivers/net/pse-pd/pd692x0.c
+++ b/drivers/net/pse-pd/pd692x0.c
@@ -7,6 +7,7 @@
 
 #include <linux/delay.h>
 #include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1781,6 +1782,7 @@ static int pd692x0_i2c_probe(struct i2c_client *client)
 	static const char * const regulators[] = { "vdd", "vdda" };
 	struct pd692x0_msg msg, buf = {0}, zero = {0};
 	struct device *dev = &client->dev;
+	struct gpio_desc *disable_ports;
 	struct pd692x0_msg_ver ver;
 	struct pd692x0_priv *priv;
 	struct fw_upload *fwl;
@@ -1808,6 +1810,11 @@ static int pd692x0_i2c_probe(struct i2c_client *client)
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
 
+	disable_ports = devm_gpiod_get_optional(dev, "disable-ports", GPIOD_OUT_HIGH);
+	if (IS_ERR(disable_ports))
+		return dev_err_probe(&client->dev, PTR_ERR(disable_ports),
+				     "Failed to get disable ports GPIO\n");
+
 	ret = i2c_master_recv(client, (u8 *)&buf, sizeof(buf));
 	if (ret != sizeof(buf)) {
 		dev_err(dev, "Failed to get device status\n");
-- 
2.54.0

