Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846873;
	b=VQyUOrXxvhEE56TA8+8pljZUISyoXy3aUBGqU/atkmh1QnQK6VrFImMTC8d+9ejuC67C
	 6mpQAl1bm8flrVL7lmmtZPKYd17NEla7ZTXS25qaclm+rkeDUTTARHsxYVH19ALKVInx5
	 4G8IyIBVxYgh+8Lq+sxMb5s1ZrckEpHoakgWx/QcLkSDCFbGpUVG0QT1/+QqM7XG57rJ3
	 0aAEIXhbvnDCLdGSfDe/uj56ol0KXuE+cXZ+U/pJltobFombFAtoAIE9996nkWpQGppW4
	 uLOv1p/7vzULGZDo0H14cZEBPVYYiv5/C3D4qjD7XeIlyTaKtdGRYx/4L/MCdPgF0KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
	b=lgCEMTEKyi6zxBvkvonW6SPq5zYWV53z08kwshB2KkRep65/pVHdr4UE4PIWvO2NT2yz
	 IFAhTdySlphEakE4GBTBSEdDywx4OQbbJ9Bb4Iisgj42WTxMAGEHn1WsjKFXWG9PvyZbH
	 xnXV3Q7S1RFALkfrQriLBTH9UUchaCIE3n81XMOwJpe5tFL6xTGCkYspyo3iOOjsYUDf4
	 06HU7sChRYc0TanqVI6ResyH5BiLhQInblfXFfoZyTG2Owd0noKkS+uAyeKHaJ/EClH9E
	 LNT4b7amguSddSIdIaCbOm2s9y5ikEPo2gp9tVyRSZa+/X/GHtbeS6Euvr/kaNuvfGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcOZjTxo;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354A2606A8A9
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 354A2606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcOZjTxo
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so20889195e9.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846872; x=1795451672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=xcOZjTxorByYizNJGssiaOGwwfyU9b6w4K9GiOMTxB1/FYWzqD31nxLNCMayp8ZYfT
         55WgPoRbpyPST//W3OuMjpvw1KCwPFP/l7e9QeNWRfPBkbtCwnsMq9cHDDG2oXTu1bbL
         sYopDicSNp4FQgXY01YPI9cnvbAckqki0hJLitiUfqpqw4bucvPUoMbcJegxGzUVOuLi
         qTWMTNwL6NlO+ViUHjPlfH9k4QzhxGPSiqE7/eFV/ypUj01YbAnTN+KIf5rKQmXZY26J
         V9aR5aYklwZNW2HT4bPogiXRlWT1d8hyWssoCEynKFbUFsbeJ0RjJoSihLgFY9D27lb7
         EcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846872; x=1795451672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=RtJyin8U2kqKOMlkQYwDvmwbWEUttuFItfwnIcBUr42fpm/j1H4HHscR11hL97R0yz
         s+0Ju2f1Re08r323sFNxVElPQBced/RaIfAUCKrvaX8/tsmzsD+4TOTb13oD5XI0zwkl
         hcrjpnKkslcnrLCuv3qspzWMHgoW90M7xZ0A47xCreEe3gIcyfvMx3Ia8b7sRLPuSvFC
         w1W9WNLgq/aakiXV8jIRvUpLIVwZgk5Khjsp5DAoeP3P2Vi0G+Qu5+ZY74KAben1Te1t
         BMzt4oQ4hXG9gonNFo784aTx2waJ28o73k3CGPEjQL5n06tqkL/A8I3d7tbwTBoiCvHX
         +SQw==
X-Forwarded-Encrypted: i=1; AL+hErGm6wnd33xVKRp/iSsI0TKP2zPrhkPVXQNztptK5Hp/w4SpSrar7hMse9bXf/M8AzLV1X+NK4eDyVK0@vger.kernel.org
X-Gm-Message-State: APuU4Z/kV49Wv2sQ5w437bMt1eam0hB+GEAkxUHtMtaFh9bf8Sk3xcNg
	3Pgi2UgFFQxTpKksmaw6JUm0GZegWjpxVjE53F8ZTBXX5XNibIt4sJvN
X-Gm-Gg: AYBFou2vLxmBZC9mW/fcf8cPnEL7q2JHKGAyorssdICSxG7LVmzq2TWCxtuI3ZypTPo
	ZnF84WEyp7/hquagKHCAihrrZHnFVx/DSnhdU17RUkU1t27DmvNyATxzWdY4Kp1/4XXLjIcd6g7
	3pNuzKFgLk6eKEkq/Lls6NeeLtL8FTaHPi1kbIHMNtnqEPbBV6vDVzBZ6Bvvma/dSL5EMVqfEp6
	dZE+jKwIH6Xf9EqD49apnKk7Ym2pL3Je34ijFPGKWueyljGzzkSxDqrUNTbrx+j2wkr6sDzg7lS
	0QR+nRhk6YyLi5rjysjN5902FsTW/1EiCxLJSozb3zX++DypFhtvuVU7Pm9S+RRbeKnVhiXtDgb
	cq1IIgEufdnOa4ha+4a+0u1bInxJ0u8ykc3teJC63slEz5DqrC+qGC5QZjsNSEozZFmW2sU6yER
	n3NT3ZdErDeAkioscA3d/JieSINQZPcX4aD20hveswA3H0V7pik5tJeOk6+4LxyfwZCoUHBxlZf
	eTrRC95NTVL1SZGYq3YsVnQWYAcVmNjok/Tx6PltcEQwYgAv2o6fHLus0Zm3xh2SbJu+Qloe8N5
	vBASIGWSVXEWA+PLHfVq9ex+17Bq6tzuYVYqrN+0oxAqTK2BWfZMg0lEyT5ppFBFMJfxNW7iyh7
	j5/QmLNPrDWlPfA2zvKfTvcZsV2g/QPijS+unzSQnGAyRVq1D4ud0gBA=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr249777075e9.30.1794846871585;
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Mon, 16 Nov 2026 17:33:48 +0100
Message-ID: <20261116163412.551438-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e8ba906cfba6..091c3a79c120 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

