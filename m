Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685920;
	b=1t5RH3JSv2gHbx+69U6c6RUMPEbp164RkQQBkMUWtol98Fo8iy47A0MudocIlrhMWHLI
	 cgYPeLQHk1BHkLTOCL3UbgpHi9oRkCoumJUdSZzxTd2ne6Cxxeb7TB6AZKhXT4uTcXYiD
	 1gx9+9FAOezHDsD0f61KawL9ixWc3mC6dOcbLVXkuu/EoEAsKMfQ/nTz03PddZHduXzMK
	 CDCvpZDjAOili2rIxGsVqIWe5M0ujalGr9O/AnoLW0nhOwk2wUcU0xL0dsndYu2r0AHlq
	 Vwg0ng73igL/IPCtQ8XwoDoQHErQ90Rzm5Y3tiQUlNijiRHXuZ5uUEuKoYyJp7LuuoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3dcSItid+640QQ6B4SJ+u9MysfBoiq2+UtuyGaK2ZU8=;
	b=KLHykDChh+XyAyImkOdWfi6yIWvdZnFORlUOipLBIce6zhpTmn+3FZ39zI7IWbLt8iCC
	 t8SoLUmue2QQKGKGQ0cPry7zrRWflAiDiYzJv80xGBDykZ0Fwg4Z7EnOV/W4tgaxfB+nN
	 jj/gybfAX55rFHBHTjRrtBQkkltffN+KYkyiz3q/gBanMJ2Ou7YTmH3b0fTHQm08TWIM/
	 DRhcjSQ/cRcc9Q2x8uSa6vLoLw6Fgn77yMceQU2kPjQz+MX830qRAk/KhyU6Z9/Ui74iL
	 /CrmuPM51K//RKrgAB00w9MROHp4exRCCpGoQYRbgvVf+dVchMuH/kkd/OWyRKO0xGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQuHJbEk;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985A0606A687
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985A0606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQuHJbEk
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386ab9ab619so8886151eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685920; x=1796290720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dcSItid+640QQ6B4SJ+u9MysfBoiq2+UtuyGaK2ZU8=;
        b=OQuHJbEkv6SkaSz8rAnRV8NWVYuVN7xnPksPb3UOji7J3c3KM2kl5kXJYeNDMIcpEM
         6veLsMMf5XFsrLFwsGyMnbmJERHNkWXWNFNTDNafv7tLD07NP2tQS+5IjP2iwD1OpBFZ
         HR0XXn9okyg6nHI1vo9IsF1v77NxsXpHWzdOSDTpZ4dX2Pfdn5KnHwGEDMWIQcUZSpUf
         adMztKfwPR1SaqH1mHgmKiTAQ1BBdd0vUV8ntvZd8i6gCWiW2nq3h9ftP/o0kw60Q9Ft
         ErK9z93Tt+JMQ27lnMZRPAiNwvHwO/DGVvRqpcNt21+o8Dn5NBTek6X5dsXnYk7FsFL1
         altA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685920; x=1796290720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3dcSItid+640QQ6B4SJ+u9MysfBoiq2+UtuyGaK2ZU8=;
        b=c6eK/HjVWX9NC0Vhx173T4dSLJ/ldYC9hGx5hCOK21LroUbs4SiXirjiT7PGkwW+8x
         fGb6MEEuZ6/8wH0anqp7IuwOTira38NPB3Rcgs5jwZ9o+GaoCuLQUtZyF7vhPyB/Pg2y
         4Zr4LCdLBJHOmcBymeqe5kG72PWsxJa3l0ArpaCyZdQPfs45GU966CGpo1k/GZZF/7Ie
         e/6gFHiBBBk8ZeR7Cf0/BIRM0kB8Zs9EmRe9hREnfqh7VTaX3LAqvBvkJaYaBV227xVg
         zqqmJwRpLJDNsL0wIoaR//KF0GSCWKEBPltt/WCC1rgPBEKomYr+dTyWRo9hK3SoRgFu
         Dnkg==
X-Forwarded-Encrypted: i=1; AL+hErGIIVsilz76DC2g923lqUmXr+JDuzDI+tBKc3Zqyy98Gtn4mrtBFwr9P8awFczmsj45roQtMpNiunwu@vger.kernel.org
X-Gm-Message-State: APuU4Z/QM+6xRH1IMkLTJt19EmZjT9+gZ1kWWMWrHP3TiPmLNZu7inek
	a01pahvnTZTBqS0fZAME36b15PJTx2rfwN0airniQjaK5SXFfFoUVJqP
X-Gm-Gg: AZFdTZeXbkaAYGkEdujkqKwF7Jg0tPpqL1NW/a7wz/+lsm0xcKxtAYlTmA1I9rVnT4R
	cgCuRBE8JpeI8P4vzRq0dboRDAMbQqj6soNFdV8u7isGFO608LtYsUrUJId7nXkb6uoao86EBdk
	TNYntlPYMFJLut4d7ahMavYs2BWDGPFw7fK+XwL4QDnNCDVVZ9Px+ZzNaWW+qVU3tfKU25tskdd
	WE2G5BV7HXfEbrRqB+o6HLeM7/VlZx+3Cah9mqzg49HkB2T9LxoBraCtY1BM5Z/h+6Oq3JmH3xN
	SiN69rgYo/iaI7aPlq6d+VkmQ+lClpJEnwWvq8QuUMkYwtyKQEQdJ7IqRKRf+NQd8nwto6huJx7
	1lt3l1B4o5ooFL9BQJfG1jxseuVs3c6V4NloaeYXnPdt0UAog+gOmhED9qgShhg30UDv/d5zUkt
	k8QG5z+T8mgmWNwjzNPu89GoCgqPnQBgy+9qTEMhHFMipG5llP83VDwo2vqZetiWCyUQICLe4vU
	B6Ah4x9J8Sb9WWNkUiFV41nAKLvOuazY/4896Pw92rB1deX0tezzW/nRrCspeUuD10hF4Seq7jH
	Pac45ZW0mMdiBZ0NxE/l80mBL6QqgVG5cQR8d+hfDblMd3flgalknA==
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id 5a478bee46e88-3857111f203mr25335643eec.35.1795685919741;
        Thu, 26 Nov 2026 01:38:39 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm32600571eec.0.2026.11.26.01.38.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:39 -0800 (PST)
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
Subject: [PATCH v2 2/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Thu, 26 Nov 2026 15:08:19 +0530
Message-ID: <20261126093819.76480-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126093819.76480-1-blfizzyy@gmail.com>
References: <20261126093819.76480-1-blfizzyy@gmail.com>
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

