Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778147;
	b=gl8e2OYI1M82P/8wpABF1Hxpe2CMDIKYwfiT8b8gBPfhOklVMYh6iqesOod6CvaESiSY
	 FpiY9NWtwdOHlCkgrlhlzj+qRBcqiPxjX0lCij1WVNM6s+uxo/EqKj67Grf5/La2WEXZ3
	 5xwmvGDhuMZ2SxxbxR6Ixyd273+wb2jwYbmzjipBBKU4NpgMYH4yykE7ezLpH2AV5zjwI
	 fUh4MTLt/hTK7KLMa3s126czO2gqs5/hNA3xN/PPH5i5wNftusrQzUs0cRDZx8+ZBXtwo
	 0dBN88EimMF3F8VYyIaz50Sut38CamX3J9qBjejLf7GTtDrD1tZIZpFiEHVZIFB2KaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ywH8oMKlX3jURbfZOh+Ks/EFVKolkyAyAwEMCJeFd2Q=;
	b=CNKyqRa4bU7XYgs4f2xWWm5ZpQeLqRrHHjfT0CuHhs0yABTYzSdbm7A+SAmtt4yyFgys
	 vJYHPg1CPTz2SGb/VStp2sApam09yjYdXPU8g1G+TueQRd6ipGOGm0N11aFPbVQhmwQyy
	 j9j672cl7lwVjObaCFrqWXyxUjBm0LwOjp+nGDDPDm8xB+XcoDH2Dq2tU5RbOqz4hZgbu
	 6cUPTcEsE6dU78X/OdmsBuFTQpJQz8+2fRR2a4Fo3yeJ1LugRA28azBBHu1AbPQ9RUSI6
	 C3g5vfNxeeXtD5L8hn05GdPthAAiWEJ31uDP/HjxK8JG4M28Jj82LsS8snWBeV3W66A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DpKyaGe;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB8F606D804
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB8F606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DpKyaGe
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a8cc11ac42so545538c88.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778146; x=1794382946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywH8oMKlX3jURbfZOh+Ks/EFVKolkyAyAwEMCJeFd2Q=;
        b=0DpKyaGeelhqhK2VnYs46HrdUzesWLRZfRJMpxsYlXLJfFzF8EcddpY8RtqVyvHT+f
         tfiH3hjXHQbDJ9x82BGbO/9IbqSX8HiA3bzRD8cZUzlzp7rjNXhO7EPV4mF2RCW+OIKI
         H+XkeaqccD2kbJ1tj36g/VyOiv/0mlRaBt5jSlAUzEvCakkK4z/+lYc6CTncQktehuWA
         /+GSGNTZO38C4wbB8KcKw9o++AU30XfMdPElbWPWpOdY8ISO9fBxv23Az1OE1ul8hDIi
         3lhVrJuLFddh4/1sLboE136iaqVLBMWNi7c/dr9kPrnqoWtiErXslU41gTOjQaorcBI8
         U1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778146; x=1794382946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywH8oMKlX3jURbfZOh+Ks/EFVKolkyAyAwEMCJeFd2Q=;
        b=1t92sTmFOCBMp1ttgkowV4G3BSNQdd9uuRp+H/10489+xXjOoBV1cq867nVu5zP/V8
         SuuJACjfnItdCpgUBvJsDIPLFNtplP31HK/84A8OTleKq1xbsrG3eHS8B3/5k42V+0XO
         pztU+4ba0+p/0aqajucooAyLdvj/3JrBVYt4igqs7nmkQo/qV/yPQDpfo3VvryTdpO4L
         VRe/GdW8FGglw9hHqabPNJXfhB3HtZ31vNrKW9tSsqhxZIRYycuGfOPAb99nzldLkly9
         y5me22sELBMJKHUPev/Yq7jIZc8WQSPnGlZ1fkZWIs3X7cesrtTGdLqx7REoOlj+gWSF
         KqbA==
X-Gm-Message-State: APuU4Z/OYIZZpJ3VvCQoEY8SoZAaGlkClVYHY6pbzHK0A00/SvgdTA3/
	Cb5vztU9d3ZGTCJgzBIi9oZWopr3k1zWuA692X1Ko/Uoofv+f4iGgiNh
X-Gm-Gg: AYBFou3NGzYXx0matJptlNemDcB7fV7/Ct/CvDGC9erreOFeP2kh2ARJcabgtqyRvI3
	R6fpQmXcOWdTABVNBqYlBITnWggwBlDDaU+V4AhYfuj9mI3gTEwpCrVWhFB5FLG6woj7nie8YmY
	oAcFlvwuQt6ydUSbaR9jCQQ4BhzBzpmMlTb/yCJQYohRe/vzeeznZ+e7J4iAgX/1bjj6yQBuLtJ
	1Q8hxwfw9G1TDvah0RyCVMndaMRgf87ynErS61+inmpB/vuSxLaO+41Bdq3phq/S+DlW4vYiUqd
	rnb5nyRJDuUYsq7saCuirCcII9FGsSe94ZDuQZZUgrQAf7yfKFycOOUl2cqMJfpbd2+QDPlE+nP
	M+TMAt5aCwaEQRi/kuL0qDp9Cg/pikgKCzxYQhX8+4ZuqyorOGLAAdOmnCKGeAirFjma/IUIa/q
	FsJ8zxW0YtVs4WFeOWQhoFhj8vMB0umlGwOwLnR1LhZxymHWpmmq+nX0gE+xK8wgpnp+az+/9D/
	vGey3hY40M/imqZHDhtYTd1bT1x0LtulUBrZXqJomI2oLlgSXhcZObFG3HvNOKZK1q9AQoSuE+H
	HeUG7r16Fxxv4LzARWbUBlDyFHYxMSwkp06AHB+ap1KZE3+na96P
X-Received: by 2002:a05:7022:f507:b0:190:d9bb:281f with SMTP id a92af1059eb24-1ac5e3225aamr22064013c88.18.1793778144624;
        Tue, 03 Nov 2026 23:42:24 -0800 (PST)
Received: from 192.168.1.71 ([2402:a00:163:2ce9:c926:5826:36de:3b37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm5318385c88.5.2026.11.03.23.42.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:42:23 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	romain.gantois@bootlin.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 2/2] usb: typec: mux: tusb1046: support HPD_IN override
Date: Wed,  4 Nov 2026 13:12:02 +0530
Message-ID: <20261104074202.76712-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261104074202.76712-1-blfizzyy@gmail.com>
References: <20261104074202.76712-1-blfizzyy@gmail.com>
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

For boards where HPD_IN is not asserted by hardware, software can
force it high over I2C using the HPDIN_OVERRIDE bit in the General
register (0x0A).

Add support for the optional ti,hpd-in-override property to force
HPD_IN high when DisplayPort mode is selected. Clear the override
when switching to USB or Safe mode, and preserve the existing
bit value when the property is absent.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 drivers/usb/typec/mux/tusb1046.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
index 34ef81f75693..c21b1f8b9786 100644
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
+	bool hpdin_override;
 
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
 
+	if (priv->hpdin_override) {
+		if (dp_active)
+			val |= TUSB1046_GENERAL_HPDIN_OVERRIDE;
+		else
+			val &= ~TUSB1046_GENERAL_HPDIN_OVERRIDE;
+	}
+
 	ret = i2c_smbus_write_byte_data(client, TUSB1046_REG_GENERAL, val);
 
 out_unlock:
@@ -131,6 +143,8 @@ static int tusb1046_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	priv->client = client;
+	priv->hpdin_override =
+		device_property_read_bool(dev, "ti,hpd-in-override");
 
 	mutex_init(&priv->general_reg_lock);
 
-- 
2.50.1 (Apple Git-155)

