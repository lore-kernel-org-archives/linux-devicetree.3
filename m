Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60D3E0230
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835847; cv=none; b=E12OkMCY1Plls5A5/RgEaegGPoKh3HhxI0bfgXsJ+zYroB/AKRScNGQAU8jLHAsuYmFIXl0SjaXxD3fSSjr6+B2X27HxdrmNhlk1/dQlY0Vepwgbj0Xe2KlRewBEopZaF+NkK6pqskit5in5xW6r2Y2NRUiyQoMMOKl9fh+37oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835847; c=relaxed/simple;
	bh=MKz6TKDh/MzR6/ujqUMWkSFnSi9qZEpM9ovgfX/AxUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPcnyXLHZV1cabYnXDPYkims9AIoY3tCVLf9+R6hoVsilj7ZL0liR/OXMFHtinQ6UbaPUMXDnjJu5nYvo6xnlI7ng8RUumE+QYXu8MCMOSv8trtMBte8OJDFPN9ZaMXuArwvQ7OlIb//CWy4fkriXAYgTgqQKP23FcWqEh8sQ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZJeuNoC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZJeuNoC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so17957515e9.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 06:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787835835; x=1788440635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxPA/ygF05pMbAMW0vsuxfL/xhlpJsyjpYIxaZ1WIpc=;
        b=UZJeuNoC+bcEdra5Vus8a67yvyDUbIjhStmx7xfxz8VOY+WWW5VCVvF+SBnW70gcG7
         60i/Jn6sgyNPpyz9qG5KZvCG8lDHWwd/67QgdMnxY7MI+pbYrkjNsV53iZ1BkZpoqM99
         A0PkCnQ1gDT5k4JhjLg8/2I8IaGI9+/xPlcHhX6sPYVcBV07H5o4v+j8269NXE3j/K8c
         hNdTUN2YOQZZrkSbO07u6J+19dv2Pn4fJHupXH0lf8ddX1rm/z6lUevXH6T9jvOxKUvf
         CCDWF3af7dc320pXKRk3QA9HLKMpMmB9wDxbnIu0HLkv8px2G4OUPPVKjQcHMXUOiM+a
         a1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835835; x=1788440635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxPA/ygF05pMbAMW0vsuxfL/xhlpJsyjpYIxaZ1WIpc=;
        b=gXlujYAmZXaFq75hFqwrhUHBvjU2ZzOZDWO2Hyp/YGF+eCfwXgCTT/j0oqvzmmXNSe
         9oWtzBl6F9zBrD0UYs/IUmKfn+lQXplaZPQNE8tX2p81AFc5hvwMv6aDL4sGHjx2sV6y
         DBrbbu8W/x7OxS1aQ/fnO+E6p8s6iKNpQ5bDyObRdeRTJZZBZ7KWmb91Le1v1jD7JOj0
         wMn5rcZZFwVOfAqTfHbGcc8rxNdVqHWdWuKwhYQ6D36Th9oKC7u18wVHifG2PCFmkX3/
         FWlytMOsKSnyqpbjK/lIRM3seovYm+0TOfSqhusKSlkUKuwDocuu+Aau3zZYwm4wFklB
         EWSA==
X-Forwarded-Encrypted: i=1; AHgh+RrGG6EsqAso9FZTNW0lJULYyXefTrGGO6Gp+bLsTto9k3fsyrfoaTwRvBBYGjdw1/2RvP8TzmhSEBD6@vger.kernel.org
X-Gm-Message-State: AFuF++lQ4x5woj/hp9nfRAWf2AfFX3twpyGJnee/UOr50HhES3r8vcOf
	LoZZflI+7RX2GZYJ1OD65VJAKB5Ikq/v2BiKmcCHJVvLxpYcPBR6es/B
X-Gm-Gg: AR+sD10Pa3PBhpSNim7DsSWAkqNgD9zVKnx+GQ3NUM0HO3w15GRZUVVi3AvE1ZOIwgU
	Z8bGLZi3i/LEZMh4jentBIbljdcdgjm399GoJAgW6LOkF9FL2TO2rlOUqKau0PqLpeDlw3/IxP+
	whOtvPHqmSoI5vpBA71YClsyx0AugstlvCbcHjOCwYHB+iP2WMYTp2b6prjjyrfDLlFVYjzUJrG
	LnGq8l21jWgKpbpa7x1r5PD3MusR4kbSYCHC0Dp8owGoBggFjPfxny723VsbMLEKM4MlX0l1fJY
	JbA7rH71uVKn4rF5lvpt7uStcMN+LEpG2rf20xP1l7rutDP09kcIrCsOcUJTG5k25xFnEMFF3Jj
	ZNjFYrl1H65tEAWNdAwiRFDBxeIDMzgLnlWNRYVajzm4i/OcS1Ugi/Le1tBq0/Sujer+g5y1PxQ
	S5qm5PaRm104WPTkwIxKP1Maos64tpu7vnAPs+FGH1jQSuKy80cPQF+wko5oE4LO0/64YfdER45
	hbRX6iz/JRzMjJ7aVNS4/sDGOPooE9Rkpo8HGA82AP6DFackyzgmnVewW2wBSvyX6JdRXSp7y0=
X-Received: by 2002:a05:600c:a418:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49a2c4b41dfmr127644185e9.13.1787835834813;
        Thu, 27 Aug 2026 06:03:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:5a8:737:d4a7:e53b:30a6:3c0f:1dad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49610170sm116081285e9.6.2026.08.27.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:03:54 -0700 (PDT)
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
Subject: [PATCH v7 2/3] wifi: mwifiex: add dt flag to avoid conflict with platform reg domain
Date: Thu, 27 Aug 2026 16:03:34 +0300
Message-ID: <20260827130335.6606-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827130335.6606-1-gvalkov@gmail.com>
References: <20260827130335.6606-1-gvalkov@gmail.com>
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

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Tested-on: WRT3200ACM, OpenWrt
iw reg get: no longer reports region for phy2

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

