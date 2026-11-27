Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785911;
	b=JAEmH0lnEWskREjW4J63de4dKFbeo1XxRwCPl3P/Gfm56YqDS020iEerDskOhqkglcrg
	 EG0KVamFFoRkW7ndGoLkS6SMY2c7lnMrmlGYTYUq/DLS8ChTF1TWVjRHu7ZQLACogKZyg
	 /IMNcBhHiyLkwDt3D4AvN1kgkjB/oqqrAmhHR+dBR0Q028RsK54Jz+D8dlWAIB3t30kFg
	 X88z3jMd9J7xAb5IbcwTAh39Z6yD+m7JAA91HPDpxmuC/yCeJU/VtoqDNj5zZdc6YRQRL
	 QbwahFAP0ShoixOAkZFWwKZdEYlRNFAs5wxwtxqcFXCtmU7GGwRE4SUwOgDjHAeY1Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZD8zIs47GHv3bIeOyhb3lpgrupfkTqj2lYrONuaJviQ=;
	b=H4et9TCU39gstufY0+O0WdepWNAcoQxgPBOct1hLSrXfC1vbuhQubLUgzRfFOOH/+/NT
	 PSwbl6rkID0hfl7l00YZWrAyZNUrPWLgjJuXcCh4/6QTsMGtB7K+zn1E+LTxuus0bdTxh
	 SznK3k++pPOPUaoIiAFJ4crL3hbwcdKqe+klVz0CTurQV/SjiCGD1aM/hgbqjomDZnvWm
	 SXKj5lz8+I1MjPIEeOExwKkDgA8cnsopuN/9IFkoJFo4WvmgF8dKwOs/U1UzItEQUcVCD
	 DEKdQB/Jhj/jUIpbB6OtuZ8IqjQyHCnvnoiGI6uf5qZI8SFV7EWyaDjyP+pYzy9T4tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OsuN1urR;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D91606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D91606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OsuN1urR
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38692f62b22so10936925eec.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785910; x=1796390710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD8zIs47GHv3bIeOyhb3lpgrupfkTqj2lYrONuaJviQ=;
        b=OsuN1urRmo0kR1oHgU7OSDiuTrpvYprEnAqbC53vh0S9GRcpbZix4DHD14KGu+yj0P
         EvdUGt6l7eID1sRP4m7nfCrNW+X06Ce03uwAfopY3cN6ObMfoO9jOodZz37MZeTQOiJl
         +5zcjQMrTHMNSHREWsamTWZiOtTqQA/XkFSaivQ2k6cQerZ+d334/m/JN83lA25lcgTR
         Yfekk2VhajRBpltFovPVRyKa10EG6jQszfmdwP7l0uUIkneEOBQtOvd+FcE7A3Ag8RIN
         Tevkh+WyVz70YrqVuOo0c/EGqxMoHV+OG1mg8to+wiHx4+4AJ8LvcFMGy91iQDpxQ2n5
         3aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785910; x=1796390710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZD8zIs47GHv3bIeOyhb3lpgrupfkTqj2lYrONuaJviQ=;
        b=MgnrLy4Qhq37wpNPipo5FOdL5wbnkKZt8WNLjHhs8B16NX/JEhKuTstsJlzerqR2vZ
         vNykY9tbf8oxI5+6e43qswt0YOaqfp6YqLEw0gDqq5Eu7Ukx6g9iXnmEYcTNqLgxe/jj
         X0YhvINQwWFVlqL6GWhbT9lxFtPnsP4/7bkW8GWw3K8Oe+pBJsP6XErGnCZl/t95TILQ
         XVI+F102TizBOtDMtW5lnQo9KIHYYMBmcgPqBp2UqgEt2Xc8TZOrxx859ebCBi2TvQtl
         F0H367PV0XtOmWvLe7CJQGVBCoeUx47RdPMsQCey9ZtG/r9skZ1+Z0KANB9NfonBDZC9
         lTmw==
X-Forwarded-Encrypted: i=1; AL+hErEa786RDqr5W5HPJ1NjT0bBN5uPc4PylhPHrPVsqBaW3WJW6HJ5f1kD2o2dJtsdgIXhUgIdjq2G/nhj@vger.kernel.org
X-Gm-Message-State: APuU4Z81aCCc3BxOfuHivCfoLgSrQmUFaHvXWFON6xyv3cDGyc4ebRRr
	yUFmOKwmVkicErJIwjWBC2zMsykLUq7lqtr2l32SoEknakQYnUhhjenD
X-Gm-Gg: AZFdTZdIVbYkyi76pw5K1npv4gwtAnfFNSHljJKVL/YJCib1L2OPahwta/CbWli+HLy
	gkdfofzRyLx47iNPpxjEGY5i3yaFvW1m7kP47kM6cPGpuFvAFLB3S4fUfb9dgpylVRFD7j0QHtg
	628v33RyJLq5s1+1oBjqwRBO7SO/8hfOFv5uq/8equt9RwTCgbIQWIRKdlzDj0bYCk9wZsiTNkU
	1c+vLYTLhm0b4PLZ0Bp4bMY03VUmfX1nUZD2z8hmBZ1zFKN8Wsa0NQ6vkBaQUGvT+CVEWiwMN7w
	xOwRH9o5TWCZyNmgSVEZejLHM/feXSiJ08FilZW/P99C8hOYBMD3YWQaPeOtP+gPOjcAnAwmgN1
	M6E3glthCRrKiOkIeVEAFfhn5YQS7nzTOxjVoj1lZIlsidzOI2gS0zQKIJNkZ4pRHyZucKxRk/H
	PpERGebRUdOxZDWIkIlOmnONWgJYvvFT3sOK02AvipzQWCefYovErTON85QnW6SOQ0EIrDBZiL3
	lnjgxLqcuswET1vmNMUM7eWBngtAEysqovkS7gQ2reVj+Kh8fPFXeyuCP8lqLHhfZQt48bKhoZL
	sx1xB5OLt/zzQbzbBdu+KpfktWQ6PkQt0THpyRl8XdGYbPl/QjL2
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id 5a478bee46e88-386a1ae6d5fmr21349026eec.36.1795785909724;
        Fri, 27 Nov 2026 05:25:09 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:b15c:e4fe:6de1:494a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm59082431eec.1.2026.11.27.05.25.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 05:25:09 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v3 2/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Fri, 27 Nov 2026 18:54:49 +0530
Message-ID: <20261127132449.89081-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261127132449.89081-1-blfizzyy@gmail.com>
References: <20261127132449.89081-1-blfizzyy@gmail.com>
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

When HPD_IN has no usable hardware signal, set HPDIN_OVERRIDE over
I2C in DisplayPort Alt Mode so the device treats HPD_IN as asserted.
Clear the override when leaving DisplayPort mode, and preserve the
existing register value on boards without no-hpd.

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 drivers/usb/typec/mux/tusb1046.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
index 34ef81f75693..50a856c8245d 100644
--- a/drivers/usb/typec/mux/tusb1046.c
+++ b/drivers/usb/typec/mux/tusb1046.c
@@ -21,6 +21,7 @@
 /* General register bits */
 #define TUSB1046_GENERAL_FLIPSEL BIT(2)
 #define TUSB1046_GENERAL_CTLSEL  GENMASK(1, 0)
+#define TUSB1046_GENERAL_HPDIN_OVERRIDE BIT(3)
 
 /* Mux modes */
 #define TUSB1046_CTLSEL_DISABLED          0x0
@@ -32,6 +33,7 @@ struct tusb1046_priv {
 	struct i2c_client *client;
 	struct typec_switch_dev *sw;
 	struct typec_mux_dev *mux;
+	bool no_hpd;
 
 	/* Lock General register during accesses */
 	struct mutex general_reg_lock;
@@ -44,6 +46,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	struct i2c_client *client = priv->client;
 	struct device *dev = &client->dev;
 	int mode, val, ret = 0;
+	bool dp_active = false;
 
 	if (state->mode >= TYPEC_STATE_MODAL &&
 	    state->alt->svid != USB_TYPEC_DP_SID)
@@ -67,9 +70,11 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	case TYPEC_DP_STATE_C:
 	case TYPEC_DP_STATE_E:
 		mode = TUSB1046_CTLSEL_4LANE_DP;
+		dp_active = true;
 		break;
 	case TYPEC_DP_STATE_D:
 		mode = TUSB1046_CTLSEL_USB3_AND_2LANE_DP;
+		dp_active = true;
 		break;
 	case TYPEC_STATE_SAFE:
 	default:
@@ -80,6 +85,13 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	val &= ~TUSB1046_GENERAL_CTLSEL;
 	val |= mode;
 
+	if (priv->no_hpd) {
+		if (dp_active)
+			val |= TUSB1046_GENERAL_HPDIN_OVERRIDE;
+		else
+			val &= ~TUSB1046_GENERAL_HPDIN_OVERRIDE;
+	}
+
 	ret = i2c_smbus_write_byte_data(client, TUSB1046_REG_GENERAL, val);
 
 out_unlock:
@@ -131,6 +143,7 @@ static int tusb1046_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	priv->client = client;
+	priv->no_hpd = device_property_read_bool(dev, "no-hpd");
 
 	mutex_init(&priv->general_reg_lock);
 
-- 
2.50.1 (Apple Git-155)

