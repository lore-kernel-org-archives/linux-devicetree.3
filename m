Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85024F797A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057160; cv=none; b=caIAZ/wtkcKhEWsUierHV/fJdEzArZSl+UeSNjcSaLXWtXyKmGA3VFeqNAp9ZFILNlDvx/N/a4nFNubQAE1Xrik+9Y5lAl7FZl02SsR3ecdmRkHXU/Fu10rFS2GvcmE+7ZBweDKS55U6ni6cgYwAp5W7MoHvF9/hbFzfEQevEps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057160; c=relaxed/simple;
	bh=ibcVXYLtVU7xGTbwp2n2UIwijtwTrZ8HpiRiIhPxTaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HTkOvqjH8yrpv/Dr6zUefqsf4yXUZhiVJz83K0mPQIWGRb32s18ghkk+9NbSHBXfhmO8Chb2xDbvKHNvnuGtgCBF+DovsGVvhNGJtsHZfPmOs/yZ2bzHHbLBkihZQDZlZclpqpOKl++M7XL0+mO6Xu2DlptTNS5RjWXBwsrVFo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jff1q7Gp; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jff1q7Gp"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-455ee8f529dso399029fac.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057154; x=1784661954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QETVa7/EiIqTvvn2j77guxH/5vJlcjsNxn4OMO5PoXE=;
        b=jff1q7GpPWpxae0j5yhbPgOlfTHT1S3vdbMz1R0bumCLiOOswpiYMZHfuD2eQ8vOjU
         wueuVpZJgOxi13z8YSi2fo4ppWSvsF7antqhz7KOr/M9AnMtxkP+n6Fyw1InL4koC8I1
         /iHCTSvjuCNh6KPrgn5lZPKwsEegSV/XPWGsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057154; x=1784661954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QETVa7/EiIqTvvn2j77guxH/5vJlcjsNxn4OMO5PoXE=;
        b=DZxMv6TqvFIL1mZ+Y4wWP1ttqE1AJTZ7qu72FE2NXKq370bXkaJlCznOO/Q1xdOJCt
         Rum9pcY8SDSJrJ22LVNENldl9SEXKn/jCDHTeca1ycTB/ATrIUbrduDFiFV2HrGMHs1Y
         gofqhid0WGHnfXzsY6nSxjAaFA3n/ZSWWkoNQvQmY6PU0fqs1Du7BEYJDJCb5FQulHqY
         TL47EPrtr0mZDMbgShCpwMpmwGbJ2KskzSHDYp7hxTuA7c8qVsM3/HjfhEYiax4KEP1k
         FeAFK+iYVJFxyEiVPyremtS81Odrep2HF94+cCXx7W3WGEQ4VWrT2AT1a2dmdTGZNmBr
         2JyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnQUMKIUVk4o4Tutw1LxBHtOn7zJZWfd9sS4SjBL3rtczPhGbwoUIqfbp319FsHmDafSF9KB8fUnFV@vger.kernel.org
X-Gm-Message-State: AOJu0YycrO0lBxg27v+RM86AphDOtxnb0t7HfNGiP0QR/lWucvcQ/+hL
	2RdXR1ZtbMAofoXXpi4WH1OO00X9jWZtYaESPd9PEQ6OZxShMibPgS+oe5DoC+Nx4A==
X-Gm-Gg: AfdE7ckFUfs0U1hfY7ulzUaqd2GqsN39ewhV1clLtn9belk102KsN1My30sSf8mk6HM
	5Pi+hMa2s0QYr6N4hLZITC8ySsaPqsffIXgCYzQIOVgqW/531AGI1hPZdPNilvyetoalz6ICwXt
	Dqys8igsYFYL2aIiC3suFUXW5qWnpp1QVgSRUEd16L5mt/i7beBQafPPmitf+uA6aRBNGkSaxj+
	khWPPFrAYQQ6WJKzTisrFacNb4Gz+qz1k9FHPe01mmjpjLqP8QcpnZ1GHCjH3Mc6ztii47j8Kph
	urUDKhwuzXAOrB1x7iHDBwyvavl2aFr7qIrf4J722K45u+ZKittGWUj/2Eu+tqYfh+FOpstmtQ0
	R/XV/MdOtcqFOpNl/HsG74TIIc1P+LcPjGOCasYM6b8xniOypeHLWdy011aOuAoBcF+u8V6LGNN
	YczzxDSyQ=
X-Received: by 2002:a05:6870:171c:b0:456:550:95b1 with SMTP id 586e51a60fabf-4562b891d4dmr44356fac.28.1784057154639;
        Tue, 14 Jul 2026 12:25:54 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:53 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
Date: Tue, 14 Jul 2026 13:25:29 -0600
Message-ID: <20260714132531.v2.1.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714192535.2082729-1-sjg@chromium.org>
References: <20260714192535.2082729-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
IO control (IOC) register block rather than grouping the registers of
all banks into a shared GRF region. Add an optional rockchip,grf
property to the gpio-bank binding so that each bank node can reference
the syscon for its own IOC block.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch for the per-bank IOC reference

 .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index bdd83f42615c..774e9c7de606 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -44,6 +44,13 @@ properties:
   power-domains:
     maxItems: 1
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node managing the IO control registers
+      of this bank, on SoCs such as the RV1106 where each GPIO bank has
+      its own IOC block.
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-- 
2.43.0

