Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1721377EC5
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127241; cv=none; b=g7hgC+1W1rRcD0I+RoIx38ct3Jbjw8mAM5iTYs1tzSAI83EtB9nhqy0/VL3j3vym0kKg8+OSGYDGKD5cnTl/RekOgtmKVQiJfe+cJZ7UYPSwsnuvqKE5iMN+AEbFHDuEPdTqqHJHSP2LIpNd+zRzrwXvNE49q22pUV9JflOCv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127241; c=relaxed/simple;
	bh=Lq0W8nhhM/dmqAoJmcprYy12UcQSA3eVsCOZb3bCX7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3Z/r/naZA1cpLGAvl3evf0WSgvMIZnI5xU9HOhJYMiKnk4cK+Sd3qTD6Yi/UVDfDR4SSTSC8CMdNh4CxFzUxD3E/tMri0YBYIAjnNZNk88UkdS0JIEAtGRu6dOYxJ5rpHEcSFt8t5hc0z5kMC001rPmfHa9MCtVkv5UhI9sDco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+BqbUi9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+BqbUi9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fd4531020so2435619f8f.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 11:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127238; x=1786732038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orOcx+0zIDpiRcc2SkmZHxzgzqfO3PwPkgxvWwLlRMg=;
        b=e+BqbUi9h/vc6s9cj+u1yb+kaZc0f0PTUoiHfMz7LuIS0kK480a0Ye36XOxq8yLd1F
         9YpuP2PirTBRessaJ55FJDISsN+UvePbUji4HbUdTUQU/uVAqVchRAHro8U2kSsmB7bT
         N9tNWiC9S1sx0L6hXSBLqsDS9zkLZZmgbmTB4gb38Fr0Ks901EDQPJ3rAbnybnzB7OFd
         jOW0KXBbp3oUTYLXDmP+yTjwHj6zNNs0LmJBnCpNS1aktXNsOs0c5LGg3ZjTFUiaFF6N
         BXKum2Ea7dp15BGaATSRqnQ91sZaiClKGlCDgO6RjqR1lFixuSVX9HnqgGmj3jMoXd8R
         yY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127238; x=1786732038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=orOcx+0zIDpiRcc2SkmZHxzgzqfO3PwPkgxvWwLlRMg=;
        b=HQaOVRcIEd7TCoIQFdBT5zcMtypcX0fiOfr44k+vLQ0ExhVKuLxr9SMBewYpD79TJz
         Bm7xbpUqboKlbfUxQ0S9Y9swjMsAP2FEJJmRhQdHRroECL+gNOmjPVXyPKsk0wpXc38Z
         S2kbWcKD8TObA1kAMeoY2/HUYp+udIxAAxT41qrIeqMqZRoJnz0cSBrh5LGhSFeFQGz+
         2dN3g5pZbCVKGHuhhV7a2JcvVvSU0mC+XJ0GK87aexeZyuIu8YwQ9KOqLS2I7ZEfqQnL
         vfXfAz1y5ZVyH4wFlRW48Mrdy5mbJ4G7TuN/L64p5OgKzfNSfYeFRLPcXSUsrzWYR+1l
         FsEA==
X-Forwarded-Encrypted: i=1; AHgh+RpWW4XSkSUDSB68OgkgSw89B+53i6P51aZAb+DJ4pL5cv2QhgFOWnctx0uhl/g3rF7lAbVWIj+aHBp8@vger.kernel.org
X-Gm-Message-State: AOJu0YyVL3JUwm/4/qOOPwBzJbnqFThg3zUKrqowi2Rr8Uww7NFD/mIX
	qqlUONUvKspWdjpT4n7MfLlzzhEsddkQgtENzKylN94WgpZ39SGJZttV
X-Gm-Gg: AR+sD11B39xwQDMLqK4biY0175yqUfwlSFZEq0QW7O7eW8GpRATSwmjjLyVutotIP9l
	xwyh9zcRTknhjMjPM2rMijpU4L4iuTvh4veep1NeujIuMjSNqfCWTlsn+PaZaKunZXFOCzQRR/7
	acfpQhs/dEieJqD4uklMHs8fTMOezDfHfYtKlPBqTjByLNn17Yp4T0cbMnNy+FWCEVM/jxsrIft
	K6ow1CJzu30ewqhZre6Yje3ob6OeEukJCEj+K+932YMu04KpDZOhTav4AdAf77fIsXr3lVSBboX
	Q7F7X7b6M/cwo9ATuQtRDlBpAJkgUaUAnPVBrrxYDV101ehPzdT/ZwvN7W/6Jsd/dXzK0n82Uaz
	22sXaRtOnJI+wnpDU+DFNYwBHUTbTLp5OoOqks9lz/TWkZNe6Zwc1o25ts9iaLSsMFjPbpPvNMT
	VyFBIcKlE0AeMmLA4i230Tn+1gasm+sM/aEWxnjQYV52auuVxPQ32dEvcIWWxcRo2eRkfVZlg9x
	+bZG7E0zGQEANICVGbm9yoQF8miyvvV8tUch04PsCcB/FUS5FH53XaX3jQ/rHqiVeZCuRtW3WPu
X-Received: by 2002:a05:6000:29d8:b0:47f:95e8:2ebf with SMTP id ffacd0b85a97d-47fec51b693mr28900997f8f.12.1786127237757;
        Fri, 07 Aug 2026 11:27:17 -0700 (PDT)
Received: from localhost.localdomain ([176.222.12.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b3fsm8543886f8f.20.2026.08.07.11.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:27:17 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	andrew@lunn.ch,
	chunfan.chen@gmail.com
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	peddolla.reddy@oss.qualcomm.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v3 1/2] wifi: mwifiex: ignore ROM regulatory hint on WRT3200ACM/WRT32x
Date: Fri,  7 Aug 2026 21:21:23 +0300
Message-ID: <20260807182124.41572-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
References: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
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
an incorrect regulatory hint in the ROM, so userspace can set the correct
platform regulatory domain. The radios in WRT3200ACM/WRT32x are locked to
the hard-coded configuration for which they are certified, so the only
impact is that the region conflict is avoided and the 5 GHz radios can
be used.

The change affects only platforms which explicitly define this flag, and
helps overcome the incorrect behaviour of proprietary radio firmware.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Tested-on: WRT3200ACM, OpenWrt
Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
Hi Jeff,
I did not consider the idea suggested by openwrt-ai, because I do not
understand it and I do not know how to implement it.
Any help is welcome!

v3:
I implemented and tested a better approach with no board specific code:
1. check for a device-tree flag in mwifiex_register_cfg80211in()
  !of_property_read_bool(of_root, "marvell,ignore-regulatory-hint")
2. add this flag to the root device tree of each affected board
Currently this affects only armada-385-linksys-rango.dts,
because Linux has no dts for venom. OpenWrt will take care of that.
This approach is more flexible and scalable, because the flag can
also be used in other drivers, e.g. mwlwifi (not part of Linux).

v2:
Replace the compatible device names, which are currently only available on
OpenWrt with board names which are available on both Linux and OpenWrt.

 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index abc703441c5d..0239b1c9214b 100644
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
+				    !of_property_read_bool(of_root,
+							   "marvell,ignore-regulatory-hint") &&
 				    regulatory_hint(wiphy, country_code))
 					mwifiex_dbg(priv->adapter, ERROR,
 						    "regulatory_hint() failed\n");
-- 
2.55.0

