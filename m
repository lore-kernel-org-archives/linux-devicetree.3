Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D71471406
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711900; cv=none; b=ojLb8RQQ9P0u1jq4TzDeX/kHIuT4/c5xa4DFGGG7fwn4k/AYzntNbgMes59eQ1oFGE6gTxZP+mDQ88Ea46jD/g6Wc9ZNNaLtgppl8aYBqpzWRWzVFqj2iUGjmZ+HvNGMi72nIOJXGBY0/wXM1juHVNGm3kCdMIXlnWp+ANtVvd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711900; c=relaxed/simple;
	bh=+cdB3jlbfOwPvLHC7qFXAtCDuK+tf5d2RCCwL4bvx5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a038XdXndk7tPco5qOd/e9+SjBipDv3g69zdNKhyr/kDJORlYKuVrs5Hvpi4TvMNCAkiTvrm2QB0Zax/fC3HFwMkiajyvajqxG6h9ftQ5X3PH/ViT5qZwSl/f/tqzYl2Fp5Z4GntNBWkDiQnXONekWFwpLKFJHRc1i5zCGZXoBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cX2wSaV6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cX2wSaV6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4994c49f588so7999745e9.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786711894; x=1787316694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxmv/7o/NfVI89rAdTVtRInPWnXbZJb6x6oPXtKGqx4=;
        b=cX2wSaV6B2IcEy3kVNw/bSheHrVxlaAoZdKynyoUz3jg0oo+lhBYKap9dh7zHuaXPC
         JwXj7nVJwDTywIm61FURM33JKNdQe9Wep5Ml8eGwe0EVE26S2n8aBtedE4PNzAfh4azs
         P6p9PhmVkrnGSqg0We+Zfhgg7fmc2B5j40wQr4l48d72JGp772reLKme3z0sUoE/kH3O
         n4ohfiGZEthQhoPVbchm6SOQ9lhcqfXrt4P6UdYYBaFaEjFhnguADFqdsM799pRTmQHX
         wccvbMxR3rn3tl6BKRtVT9p+XyWR0Mi0aAVY1/poC976ahaM63yIzah/dmNwMBrwKf5c
         yaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711894; x=1787316694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jxmv/7o/NfVI89rAdTVtRInPWnXbZJb6x6oPXtKGqx4=;
        b=fYcMsNp5brC0QdF+OSDSwr8gFvWklAOwsO+jm/gaxWfbmQnS20RT1oTwRYBH+REA3T
         y51frDxW5iHUgp7p1tevaA0fzakaguFbr7IVb1XUeRqQ+cmYE962HJkRSox78QwfFu3d
         CYqCa8YljizWpRNVdUjJ6JlziE2t3kTZr2W1n3S4Z1FMdHvgv6sbkAVWsNS1PGZ9DTUv
         2HNlZj0ncteYdJAwqbLc5UKyciQb+ffqICflqhPlshXZZ1IAaSls5XgT3Y3zhgYTNBWo
         l9GAXb5NKwglCxv0M0oOdtAWDxVRDIB69Q4nU8T4hiBHZyR+z+l11tNP0eQYA4uxg9uR
         ldiA==
X-Forwarded-Encrypted: i=1; AHgh+Rpubu1FvwDAdcrWjA+yifH+zarY66DiabC14sLzdTT9wv5dMb2O+FEDT3ZY+J6wDPxgfFokNlKdZLOV@vger.kernel.org
X-Gm-Message-State: AOJu0YwYFSnzMlOdPSNmaheUmr4CaKm1BSONyycFYrTb0EWx8B7XQdQt
	yYSSDsqyngGfxQO/vWsWCE9RYl2QBCARb50V28rNMIKjMlvtlVMzjCXC
X-Gm-Gg: AR+sD13b+Fg9algE4Hj5+4wsQ9MJ+3eKdnejfyRKwYV9UDa8wvvCGJrLuvWsuV8q0GX
	WArQp4YwnG22QhnsmbQOCrc8Qw60eXKu4PH62eIy/YI8O0i7VpoEPiyvzVgm18C8HpaXnaP4JhO
	p9E4wDwtoPnzXpb7eX5GsFNl+2HAv7rTJDV+o3xFoJMCs49/SEC/8RXgLUNtm23ByF1N/5KOpb9
	8cJ35liVdsiuE+hMP0xKSfQ1VrS/r4xTtV9RNZnzmR48taFL4Vs7Objtn2BowbIP4qbq769tbA2
	tRTpmYYGL4y005zEt21/4M0gsG2Hn4fp/IVwu5F+iedo2OW/IttCNb4XVsaObTCYp8xMCGtTgqr
	RX5HHILyjO3CkaxdWSbGLrjFmjhkDT831Vxgyh+xfuAjxKdf8LRpaH4jIX079pJyM8dbOR0z/JE
	s+LVONLDIm4waJan4tty/VsGgYUxNspXA0ZNmn//33xzWnRHvImctLG/cpuJA0jGPsUJ1/h58w2
	I96J8o2dqBYrSe7KryBuMqdVdDbbUFTn5p5bK7jsUQzNxvwRAVXeh0X7n7Zuk3eGA==
X-Received: by 2002:a05:600d:117:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49987ab4e1bmr49051825e9.7.1786711894092;
        Fri, 14 Aug 2026 05:51:34 -0700 (PDT)
Received: from localhost.localdomain ([151.251.241.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988ae8b62sm49727315e9.5.2026.08.14.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:51:33 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH 3/3] wifi: mwifiex: add dt flag to ignore incorrect ROM regulatory hint
Date: Fri, 14 Aug 2026 15:50:25 +0300
Message-ID: <20260814125025.90522-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814125025.90522-1-gvalkov@gmail.com>
References: <anoYr9H4KojJv-aZ@google.com>
 <20260814125025.90522-1-gvalkov@gmail.com>
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
preventing use of 5 GHz and DFS channels. This also affects phy0.

Implement a device-tree flag, which allows affected platforms to ignore
an incorrect regulatory hint from ROM, so userspace can set the correct
platform regulatory domain. This avoids the region conflict and allows
the 5 GHz radios to be used.

The change affects only platforms which explicitly define this flag, and
helps overcome the incorrect behaviour of proprietary radio firmware.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Tested-on: WRT3200ACM, OpenWrt
Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index abc703441c5d..26978158a0ad 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -4899,7 +4899,14 @@ int mwifiex_register_cfg80211(struct mwifiex_adapter *adapter)
 				country_code =
 					mwifiex_11d_code_2_region(
 						adapter->region_code);
+
+				/* Allow platforms to ignore an incorrect
+				 * regulatory hint from ROM, so userspace
+				 * can set the correct regulatory domain.
+				 */
 				if (country_code &&
+				    !device_property_read_bool(adapter->dev,
+							       "marvell,ignore-regulatory-hint") &&
 				    regulatory_hint(wiphy, country_code))
 					mwifiex_dbg(priv->adapter, ERROR,
 						    "regulatory_hint() failed\n");
-- 
2.55.0

