Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAA63D8902
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003731; cv=none; b=cf1rOrM/3YCrJvaYKpMjgnw0u0u/QPSILOKIjvSc+06ErCshiwhuRE21goK+So8v4kQEg9wxBKTbo5G/yL6Znz6BBrQegQuXJ0w1ffBdIy2z61aGLIEQAz+byjEh5/fxBXpJtbgGPh1QHhkrKl4OII/ABhIYcu+Dr4B1v5cuUsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003731; c=relaxed/simple;
	bh=TJY3hex+l5/Tl/ivjiuYNGr3PPDEzX3hWulbnq7k2rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpBbG4nJw/ElpLx+3o+BYqQHxc44tBmceTnfwhQA3aPbsaLBbxAIBuQMrPKxI8aNCtLymA5nyaNNuGdhIo0kN5Ft1qSI6wqvjjvIm4FLEfFxT1ACDYWpG+ieuifjmYLFop51Pf1FIpxg+jxd8St6+68INbA8pCHwK2GEUlSfEt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieU7D1gJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieU7D1gJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4980dc26022so39690855e9.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003724; x=1787608524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDO6GjJPOwWJ3cCExfgafVeJUpNRoE4Oa0/Ds8leCk8=;
        b=ieU7D1gJHgWghdtS1WlsXGjaAOqxQ5SQ2/hN+drKbAQtYkxtV66KiOgghg8ALCAyDU
         TVghmz4mpuA0qRktYeRjHsaoMG3bxd83ixQI0AF9FaCrkltuTIvGXqfBaJka4ouFWZGE
         f1DDptgZHEvkFdTjKFDhQkRAZXrNnyxqW0DCiwJ/B/sS/DVJBYKHBbGOFGDnJLx9R5Yf
         iaf+OJAD2oD4U08PBBP+hBrv4SxwIId1sKnuwsjYM6zHNxT/CgvowSPXlX7q7Yim/mct
         ofKe2P75b2lHOI82F7SRifwhILmiTQiuNUok4y07HTdh3XHPf1FDGpeois31hBe7bkCE
         zd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003724; x=1787608524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDO6GjJPOwWJ3cCExfgafVeJUpNRoE4Oa0/Ds8leCk8=;
        b=nRmfz5RTPtkbsncqde2ezf8pu4xr7t6TJUP+Eo/djU/SmXEiN3fY4pshvOMhkpP4dn
         /l72ynS62Y6579yWwK9uA1MVLHQUJIwCZJCaZvP+QQJE+tXuXnjD6n5Kr8DoT3mlQnPw
         hHYWx4LpvLfXeF2Zsbimfa9+TVL22J59jIuIgQuZBQozGK1SWa+m5Qv6cKX9xkjsCOQT
         CVw/r008Lj1YlOb4VAstTRq8sEdrV9JPzMAedqoOdaYPm7eiw5WCJjUKu/2VaT0rH710
         rEKUxSsS/WQYPfb3YNKsHE7rUyBV8DjF0W6Xw96c52eD+CuWnSavIWxVM7sn2ju8ZFCk
         GlKA==
X-Forwarded-Encrypted: i=1; AHgh+RoJeYOCW+WYQbdlK6UQgfiYjlqUtcdJHg1q77b9+K4Ef61m9N74jMHT+qoW3tB9z3LRBENbrSbtplvR@vger.kernel.org
X-Gm-Message-State: AOJu0YxbIDTv143yFpbv5yi4l74zM08V2qEEC+ZfOKKATTm0nZ+lv8zc
	BkjtWKinaeSWNnQcqfuYAF/NoUmz4R7dWAbOFLOxuY7O6gsf7l11TrBV
X-Gm-Gg: AR+sD11cRuiYIttPuCnu6GUR0g4SdnbC8DqljP0OHbQWPDhlWILXGJQheyT2wr8KsOp
	JFrdrbIgdv/TT7eyIeicqLajQS8iG/bRTqjPCz/BzyYnUKjswrX8yKHXPfjfVdWG7CDABRVAO+Z
	IFDASFaJw/G9WPxEqrCEhknPmRHKBOmZBM5H4nbiLB+uXLvf6Q/2zDiSW0YnzYausJBVEANXdgQ
	odyvD9ohvid46VhxwNrr5AcKi2FqBUKfzFs5xV05SUjQfFKVD0hVzgkVPP2whd/h7oceGBuTJdp
	pKTpQtZWEwzqe63BLRvk+fZmqPkw/GUCHtT6FNAF3msKBXbjiVeYjGt9D8Oc2qmhnRYZw0g4rsk
	M4SqCyXoykK6w2RdyTDW6kBuXU14eyP2tihCQ3pSti2PdmIlJm0xIt6H6vcFKprHu8ncs6Obr5d
	+vL3+6ybPyBbbbHCnoHN1eVgYiX2vJgJLOUbg6YkMaBCZqQ08Lyfb9GhMfIarfaCy8iygfnJff7
	Jg25zDFCvHnhcauFI+03JahoeVj8PxSXtbDWUz3lwoELOSFR/HJpIWlmmuAbdMSkitl+jxVnHaM
	+9Xm9A74wQ==
X-Received: by 2002:a05:600c:3485:b0:499:8758:8cb4 with SMTP id 5b1f17b1804b1-49987935eecmr451205815e9.5.1787003723726;
        Mon, 17 Aug 2026 14:55:23 -0700 (PDT)
Received: from localhost.localdomain (85-118-76-205.mtel.net. [85.118.76.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b2a176sm309622525e9.4.2026.08.17.14.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:55:23 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
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
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v5 3/3] wifi: mwifiex: add dt flag to ignore incorrect ROM regulatory hint
Date: Tue, 18 Aug 2026 00:54:28 +0300
Message-ID: <20260817215428.84740-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817215428.84740-1-gvalkov@gmail.com>
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com>
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

Tested-on WRT3200ACM, OpenWrt
iw reg get: no longer reports region for phy2

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

