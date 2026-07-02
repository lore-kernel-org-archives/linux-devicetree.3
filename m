Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD0D1D7E41
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 20:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783025204; cv=none; b=HD5igHu4RGSGoX8ItQtN1vPb7Y0BqcGSsU/fiSjnldlM21xbD2GExgEbkgSGETkN+VIQUm2EHcQcX4v8YZqrKcM0QlNfRZN56zbkwtfHF5xmdcl2YzcWYdhvkHkCPay3IWVle5nsXANXBQY7L8OVvDH5b76wrY4BDGJjg//UzVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783025204; c=relaxed/simple;
	bh=PNIwIfBhbdh2OIQU3531ZDCnaAMcFbOSPVAMZ4YexeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gBTg2tVVPJUmvPT15ktVRNg6xZMqIiY+ph9ks9iTg695N65h0p8YDWBCUH4SPNhXpadPj31YFqknnMDcHdlBuWQflxWIETHHWGKayHWP3HT4sCFP0xgXry1ostiuS3RvhBrhmNaO4hx5CZJrBXFaFi9ISfABU3qHMQK8ZdtPuv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZ5qCRHt; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZ5qCRHt"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2c9a234aff2so9831605ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 13:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783025203; x=1783630003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFYk67kGMBIa4rE++VISe9W7bx9jplGS28C7isZgneA=;
        b=GZ5qCRHtuLlhy66rHcKtXYu9mULWbve9RbqvvfFU85QWFVz1Qe7uARLiupMC+IVSuY
         SFZmbUnS7ZBbJhmGZy7jMR9BmPUPkm8CgYTtR7fZaRjBMNRd3bkWpjBmBmBjUqCXcFoO
         ByNgsAySvjo5AFk5WLr0dlPMBZttpSK//w0q99e73rSDaBI792BooS4iOAcklnPiVpO/
         rJ4K7T7CUwbdZS/66TO1XJKv9Tl/+63/ze/ZTCSAAZIWlfnL7bKbQLgachfKGwtnFEgb
         kiPrDcPazdFJ8NLQc3ltxjL08psbnuKw2joOnsMJ65xMPIsStzvmFBHF/2mi7/VvCPg8
         uYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025203; x=1783630003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFYk67kGMBIa4rE++VISe9W7bx9jplGS28C7isZgneA=;
        b=nNgxSeZ9RGqC8tDB6+A/obK86ZlnGfRXrGd8VDS4feqz46IYltf3cYl81sJf9eC1Fj
         WTIz5Axr8eQqpcvNPzw/t0tS08vPO6iC3IXoloc+cuGhDP3FxxQmOdUf99uPdD/ZWFqf
         +V4B2QjQEAbqum23HgJ/KTkXKm3Y0+Fh4PntH4RFhd2DqraQwsiZ0LPGvrL7Aa0l3M70
         3kflfEoq5l6R2eYwR4mt+f8lDtvwemiD8VzCeyiMtTPFCZVjvBNDwFwnFxKWfhydKGR7
         VpWO4RgdpKNBiv+wX87dmQSKh0ebH3K69imwnH60eNrQRiExm08hTs5UGxTuKZZvSiux
         J8cg==
X-Gm-Message-State: AOJu0YynfOGhugaS0Id5fILagJdWtQfe80l7dlYv+yd4ocwLY0JWVkr/
	w0E0aBtvtKclt7iXGhAqpXMBn2JENt3WQFTUOCP4SEtL1vyemNoFNVcV
X-Gm-Gg: AfdE7cmDIO8kgVmhJxl65lQW8opV4sNyoTn9ApWlVcVG+F++qNYWSmR4lzeimeFwQct
	1qv/gYQBVV2Zq6kjJJJ9nzwnBvcrtCuYHGzDLeTB83VhPDLiVm2uw16WoBXTiYfw0Xx2S2Ag9Bo
	hai+7UoTEzFX1/t/99tvwuimo/Z8yNRgwcOgC9AKdYcgQB5mXgMq5WXlKf4YB/L0yhJXtuDSfYv
	hOE2v3Mv4PDjyWN2L1GchqLEUjO3af2/+/rbQP0wgp1WzcUfJD+UA8SyVr/h0HL2jWikln6KgcR
	VajwTsyr1AKilObeYxdQ+g62AatdrI7RQkEG6OaUQ9yZWMhnRdFU4rSzc1ndeWVwVfDXxWmk24K
	qHQ3f3DAU+5CcE/JQztgATlNpY0NBjNyy9FO9GZiSI3qR4ZDUaL9yYlPFI4Da0iZCrjgAkuBT2R
	kSV4bVZAAqPSc=
X-Received: by 2002:a17:902:ce02:b0:2ca:62e:cc4f with SMTP id d9443c01a7336-2ca7e7645d1mr85023165ad.23.1783025202765;
        Thu, 02 Jul 2026 13:46:42 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9004c1sm18654065ad.21.2026.07.02.13.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:46:42 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v5 0/3] Add devicetree for the Graperain G3568 v2
Date: Fri,  3 Jul 2026 04:46:26 +0800
Message-ID: <20260702204628.2407308-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
- Fix trailing whitespaces and other formatting issues.

Changes in v3:
- Picked up Acked-by tag for patch 1.
- Fixed text wrapping in the commit message of patch 2.
- Replace the legacy 'gpio' label with 'gpios'.
- Add the basic WiFi child node.
- Add the Bluetooth UART child node.

Changes in v4:
- Fix incorrect pinctrl bluetooth node name.
- Disable bluetooth sound since rk3568-codec-digital unavailable.
- Add WiFi fallback compatible string.
- Add WiFi host wake interrupt.

Changes in v5:
- Fix incorrect WiFi interrupts.

Notes/Unchanged from v1:
- ADC keys have been verified with evtest and works fine; kept unchanged.
- The 'regulator-off-in-suspend' property for vqmmc-supply is retained.
  This is a known issue shared by most similar boards and should be
  addressed globally later.
---
Coia Prant (3):
  dt-bindings: vendor-prefixes: Add graperain
  dt-bindings: arm: rockchip: Add Graperain G3568 series
  arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3568-graperain-g3568-v2.dts    | 943 ++++++++++++++++++
 4 files changed, 952 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts

-- 
2.47.3

