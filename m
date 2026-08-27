Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90EA499F0C
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851200; cv=none; b=olxsuPyBFHiPDBPD4TPfNL9jAC2LIG7GhXwH+3xgoIcgTioCP/DGm5SYWBuiZalfQi+V70yTn49G1g3NL4bgTn2BVG3C5Xd92rT40gRSsyWaNs31nD8yEII+8EiUwJeiXPXfuhgqrmTTsdAHLPT50JUgWZWIsIFdOp8qwZJ9wgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851200; c=relaxed/simple;
	bh=Ps1FBD8oCCdztHPPWLN090lnS6KRUI6aLV+WAZWyKec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PinRCQ48M6m7jFsnGC/z5vvrh+usUkE/MWiD6j1X3bmoB23KHX1QeRJtLoxsbyS2Occ8URJP8Yj6kAVTcRkuioVy29Wv0B8JTR8nJl4GcbmZ7qE2Z11D+t91mNVbHfKvRyzrVB8yLQ3u27YRH/D8gmDgoo9YBZp93wKolyzL57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkDQU2r4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkDQU2r4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482dd6ee390so60134f8f.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 10:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851195; x=1788455995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAIY2PGMFfnt3WY5m1saKTe9r2TNIGK2InPmdbG9HB4=;
        b=VkDQU2r4GPhLwryHrlldeCIzIjSZcMpMuSHSEtMl8PoHUcRQYFuOVFZbl/3wegK1zd
         E7dJ6XHF/cQle1MaxQsP3WESsoAZn6rnPwtR5kSLi2iGTX5pyuNdddzwLJF2wtDWUOHw
         iSIWyH9mzYZ24Ch+7/5h44Kc3BrJZFy6afNCliu7lS92TiD+6eQz2wuFSvu8kYtrs4w+
         1+L/FnaeF0HjsgreQTgU39pQTasz4O4FerQ2NZqNL+UugdGzjE/8U19fEZhO2W/pkauq
         VmwQXtzbO4s6FPGTzntqlcNZ0hdeqjgMLEprOSTe+iTXckYrlKC18BL8cs5dZ4r7EQ+K
         w4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851195; x=1788455995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAIY2PGMFfnt3WY5m1saKTe9r2TNIGK2InPmdbG9HB4=;
        b=FaysFwsCkzwVX2s/QGJL/72KFJAbJryCTRffRZT/LlaWV5yC5rMu6VuWZsremU/9ks
         kDXmGR0lEQ7EVAu9VNWYVlzXH+zs1CPrOUtIrka+GPKiJIw8OSl4Dx89/YvT5nrRQTlc
         pIk3MjOBkkZXcgiyteFzF6Ms5NxcPjR/KnT/6cFxjRkGmMT7paboFzJOj6xpm5dm7mZL
         Y6a1mwjk93jtArdl5vkO+91bOv8fyRqumCWn5UkY6jk2y3XaeKkgHVCVpHMzPsf3CYys
         5eXQUIqW9TuRDETHqstm2+fvfUpa5C0FidbTwSMzaX9H6xnw8Pn1CNECnyTdLA8Pnrzl
         QlFw==
X-Forwarded-Encrypted: i=1; AHgh+RqN8womvd/vOWh+1Ef90MdvpHK+fYYKceqxe8Y9yGmwJ3nWzjNb6rIH0Kzcn+pif1j9T6MhjXsviqMn@vger.kernel.org
X-Gm-Message-State: AFuF++n2xY5ZivVuUch+SNHxn4Qf908XV3TBdf5qrjxANVi5V4KIPrzC
	vBVqkxh/WInCZyc9CjMFD3EFtneBQL3KnFSyRTydLG36zRHUqAbBST72
X-Gm-Gg: AR+sD12n4LXhCIzJpgJVKa/OzQDF/zZUAUtBp9BCtYwrh3eD+BMqNLV/9fLFZilwn+b
	9ILw0HphhLUkHiKWeIY7ee5LkudFLY1OkmEuOqeTSEyzsB7onIu5A94/GaYDl/SiZn4u5Y1OQsl
	mJovOYd35DLQsUNLGVA3Q36rTH9lnwpWmBeqp4GdeQTgiHB1Sy4UVvNCqiT71vsCjUQrWgH4WAh
	ebloHMseGf4Y3FxWb2GzvnGpJz1x9UV91nSA6L23mpwHthsdS4D0J5a2xIcizZ9xsmsMRU3oWXo
	nd4rQ34RPU0YHl9qp0b2ooUuNFc2sSy7cyyj7CSz60ixj9NPv/t4CG7DZAMuDv//co2fjYIvR0e
	OWQB6fQPVpVBlKjvnL4JNM0LcXdndtCKR0DTbYx7ocDFHuJlNHyarsR7WHRzL/al7iHpbtg6hXf
	EYKH3EfyjgDtZ6wLkfmREvVam4SC0MhkDfAAdfeFWekKncuNejbcOeZP5XzogO5PUhbdOYIneJJ
	50M4+HHCu6B4TDel6HAngEtpAoexghfvSXOIIi9Ur+cPQtvL4NbwDhLk0SNEX6v
X-Received: by 2002:a05:600c:8b86:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-49b91c5446emr7604325e9.15.1787851194667;
        Thu, 27 Aug 2026 10:19:54 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4ad16262sm54259995e9.11.2026.08.27.10.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:19:54 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	rongqianfeng@vivo.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v8 2/3] wifi: mwifiex: add dt flag to avoid conflict with platform reg domain
Date: Thu, 27 Aug 2026 20:19:36 +0300
Message-ID: <20260827171937.28878-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827171937.28878-1-gvalkov@gmail.com>
References: <20260827171937.28878-1-gvalkov@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing phy0 from starting on any DFS channel. phy2 works.

Add a device-tree flag, which allows affected devices, where the radio
conflicts with the platform to ignore the incorrect regulatory hint in
the ROM of the radio, so the platform regulatory domain can be used.
This does not allow the user to change the regulatory configuration of
any radio. It only allows phy0 to start and operate according to its
certified configuration.

The change affects only platforms which explicitly define this flag, and
helps overcome the incorrect behaviour of proprietary radio firmware.

The change has been tested on OpenWrt and fixes the issue where
phy0 does not start on WRT3200ACM-EU when a DFS channel is used

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index 7a1ba32f1fb3..293876397b67 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -4897,7 +4897,14 @@ int mwifiex_register_cfg80211(struct mwifiex_adapter *adapter)
 				country_code =
 					mwifiex_11d_code_2_region(
 						adapter->region_code);
+
+				/* If the reg hint in ROM conflicts with platform
+				 * configuration, it should be ignored, so the
+				 * platform regulatory domain can be used.
+				 */
 				if (country_code &&
+				    !device_property_read_bool(adapter->dev,
+							       "marvell,invalid-reg-hint-in-rom") &&
 				    regulatory_hint(wiphy, country_code))
 					mwifiex_dbg(priv->adapter, ERROR,
 						    "regulatory_hint() failed\n");
-- 
2.55.0

