Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673491;
	b=t0Y7cuBlT00wOytVjUY2vksiJKgtlARqYmdg2skeQRHXEJWLzFUEAhngVtBXgOEJdLR6
	 dRA3WpKB9kN7gm8ZJYo7rJLK99572snoy0TvS8gNme28Zrw4E6hG0MY3ZwcagqJrKnVi9
	 RAH86g3nHwsNyCuee4jHTv5qzTKSdGzONeiAbCErgeCKYe5+NIYCSNqq/wD9wQEwILQNQ
	 qXwBBL5CniUyK8ipMjIqpe3NiajaFLMnPkC7B/p/7YLCirwmcJCK9ohglTSojt9z93lJS
	 GB5SsTtwXc27eRFM0rmSVcHzdm1zKNPQbpqqIe1kTWeED/hb7jFbcPcZvUzX4u+lo8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
	b=JNvYza56t8VokSbJC6GskeEWcQZxJkCAAawkR3YZi1LpA17Tem1H35O8xY0zpDh3CMpZ
	 9zbdrAPGC34PzEOb31e673oCGqqik7D6n+Xy9AukAZubIcWHyGTpdgbUg0YOfncpYbmDM
	 d1+xp/s9c69AtANCvqw2QAxRnGQaPiYF3hYcSsDsobm9cO1JBhcBXyelF0xjzSvix4umc
	 dD0nWQYE6fc6Bojqm3LeihpTtFubEsAh4h7wN18J4+ZZdhQ27my0SLjdT/oBvyqeNcwrp
	 9J+3uUwLQa2OQiDwIJnTljVDBYO8sjf1A1lPRkKtlLh/mo0pNN74BouyiOLvFX2TJZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fili5sVI;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B33606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B33606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fili5sVI
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so11855155e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673489; x=1793278289; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
        b=fili5sVIP1r3gAqZl861bvY6WLGDKWF2AK/wry4jhK5MORWWPuQxgx4q7NA8Z2ODYB
         dbxM7oUzPnnK8XCQkES7W3CI1Yv7EvM011qtfeAkh/sL0fLxARGwZxKIAPi7mCuM4Xqj
         tSKO8KYWMzTuHEbZtEblWBvq8w59KkBglYgdwd0OY3zpGo3RlzJ+cBuxbF8VPYH7jmVc
         t8t6PNTqARH7eXoX1nviTckze/fVjB4N7tztH9ArnN7QzW7Y3NJtQN0ivDOd6r1oaeUn
         2yV7ghIS5pCoSz2zWSQ6dsMlUSH/8pBFjFwOMdFDiOln/7P9/WUCzZXmOROrSjVZB3Uh
         s1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673489; x=1793278289;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
        b=i3V27R8NhsX/thmJj/zWq9ndnVeTmiYoGb1FbQK/YtdhZvClwurdrfhaus3D3wkWdw
         nM41qsvx425v4FRvE9aepUVWdaytCjF50exa7at7FTC02+O8l2HMHfdkNE/U/Kdc60sM
         FgT2TpvNQl8nDiJJ289rR/fUMMYOQZ/wbn/4ooZDMqwupDn2E6LRri28jDZ4dPgIhtsi
         bMi8iC1W2laoe0ZbsjRsaVOubKHLuVUeC+XTsr8dpuQkqnucaVU7GHc4869jwvRNtP8E
         z+v5HWIldo5/7SRxDV35mqLDXXIJlEGmMF3knaqwtS8h/99e35e9FCSiXReUKhSUuVyI
         dSKw==
X-Forwarded-Encrypted: i=1; AKwUvBygRqekz76k0nurPfJqndxYKYmVZ7KYSzPZf3UprjB1z8YcTMsbgENb8OMOBjV0ysbc48T0B3TyZdw4@vger.kernel.org
X-Gm-Message-State: AFq9FYL3Ech6VYTZfhnL1zqwNWpyAMI6LN6v0BMO4gxtaFtido24YKLU
	W08BQPfXOrFEMDyx0ffjvlF1AYi/XxeIELguETJ/OpVr/rMq627k0wnr
X-Gm-Gg: AYBFou1xdB70MCV13ZaIaCpo2y6EoBNpybdBNMkYeg7LKASTFjCACJ69okabM8clk8z
	gPke1UH1UFhvblRZJqviI0rCvPGuKrfXoNv2YnOcpygrghro9t17Me2O4m15uh8Kxa1hBe1tNKo
	bMDIB/0NijUt5+9UStEdP2wkbnUeg89lkePYvrrL5onRhs81oe1y72O7hAin4TP8z2U4u6bYjaf
	E8+IrgYldld+nzx1n9LPJq5Xb3Z/vRC8rb0sYC/VqlMYwlG8eVRSb9aumVzHb9o0eAndK/wue7A
	RVR8i2DHkxxTzziycALiRfiAYuDxLoPKaZkWYk1rxvpT6OCZ13R6rRgNnb9X5ew/GD2F/ZaiIXW
	sEJVL5mlcQDbGZbsXKEk3DUOfXbjo0RYCoLtZ0TPnbys4nJqEyMUP+T8hJrH55R9nVZ+5SRCXqr
	HrgjS44XUQwEJyrI1CaOQcGhkbtuyPbr4qpsdEQh561zbJahF7YLhurPRS1ODM6Lkdp8XEQ/Yhj
	duDCm6wB2qEug8JGLviCk5tVUxyswtkNKccuAmMgXBsfeji3iZM8Q1xI5xoLKG1ULSL24t3Evhs
	FZFRNObHrTBmdF7iT+OctWfdpvYfnNcmdZKQDiUw9V891k/UFmuIBmI=
X-Received: by 2002:a05:600c:3ba0:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4a1fdb078ebmr127894895e9.5.1792673488922;
        Thu, 22 Oct 2026 05:51:28 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:28 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Share the Toradex NAU8822
 BTL overlay
Date: Thu, 22 Oct 2026 14:51:04 +0200
Message-Id: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgG2moC/x2NQQ6DIBREr9Kw7m/g2yh01Xs0LhC+lUTBgCUa4
 92LLt9M5s3OEkVHib1uO4uUXXLBF8D7jZlB+y+Bs4UZcqwFRwFuWsHrn5SI0C0jWFJYYyW6vpG
 srOZIvVsv46ctPLi0hLhdB1mc6eXiijeQKVrnT6WcZvDBg9ETRQ2hNKPeEkTSdoMsgJeKm7oyq
 NSzfxeltrQ+TJhYexzHH0xT9a3IAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

The NAU8822 audio codec on the Toradex Verdin Development Board and
Apalis Evaluation Board V1.2 can combine its two loudspeaker outputs
into a Bridge Tied Load (BTL) output. The overlay selecting this mode
only sets a property on the codec node, which both boards label
nau8822_1a independent of the module.

Instead of adding identical overlays for every module, rename the
merged Verdin iMX8M Mini overlay to imx-tdx-nau8822-btl.dtso and combine it
with the Verdin iMX8M Plus, Verdin iMX95, Lino iMX91, Lino iMX93 and
Apalis iMX8 device trees. The combined Verdin iMX8M Mini DTB keeps its
name.

To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Changes in v2:
- Split the BTL patch out of the Verdin iMX8M Plus overlay series, whose
  display overlays are deferred
- Share one overlay instead of adding an iMX8M Plus copy (Frank)
- Also replace the Verdin iMX95 and Apalis iMX8 BTL overlays posted in
  https://lore.kernel.org/r/20260922-v1-imx95-overlays-v1-1-694100afb4bc@toradex.com
  https://lore.kernel.org/r/20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com
- Add Lino iMX91/iMX93 combinations
- Link to v1: https://lore.kernel.org/r/20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com

---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mm-verdin: Share the NAU8822 BTL overlay
      arm64: dts: freescale: imx8mp-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx9{1,3}-lino: Add NAU8822 Bridge Tied Load

 arch/arm64/boot/dts/freescale/Makefile                 | 18 ++++++++++++++++--
 ...n-dev-nau8822-btl.dtso => imx-tdx-nau8822-btl.dtso} |  5 +++--
 2 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261021-imx-nau8822-btl-de926231bf78

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

