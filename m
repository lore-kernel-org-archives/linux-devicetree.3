Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69EA426EA1
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976082; cv=none; b=lUSlQluC5uc4UzGTuQUgB6k3+qCpkQhrAZLJtZpV2KOOw9YCU0mYic/Ap+Uu6AsjwhDema/0Dgw0KN8sOFUUugzN1347MBflAfNSRJdOHpsCuGjxqN/7P0N2HU5ySdZJtISroU+qgRUtZpTlEWvGw52Rt7FBWNRIA1FxXY93+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976082; c=relaxed/simple;
	bh=lGZrUXuflBOqHCFyvr0PB1/T7c/t+SObD8XkwOt47Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ht/aZ5jjcV6lraNngjQJIt3IlZpteYwDbCFOfTuLfPN0jcmDzWJSAyoW2HTawZNHyFSLIcqnp9tYyH9pkt4W3m0NvzSk5CUiYx2XYz6tR7zIvLsnAz9fimrStQMERW4LHP6GgRo6oeufzqy8sCyfmNbFX3JCANqzixv/msQw7yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e2tn7U7e; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e2tn7U7e"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8383fb7143aso807556b3a.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976080; x=1778580880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1yF58yQBbcHl4r1i7GF6fw/efnf7TJKaSEphSpwRag=;
        b=e2tn7U7e0yAQmgLZT8aWd1XDPevA8dsYTdKGOV7HArUZaonLORoBClMTZgUpNNcCBB
         mJew/ecQZds2Vj0TLGyERagogAGtFBmUf+I8N6hGwxOco3ac6r0onZSwkThzRz5ET3JP
         t2OM7L3pB1tnu5vwcJKx7syRRRFvZLcCimN6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976080; x=1778580880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1yF58yQBbcHl4r1i7GF6fw/efnf7TJKaSEphSpwRag=;
        b=drYBu8V6r/OCH9hGFrts/Gqb8yIA4uT7QUJn2lr2fvkGBxjN7PghfGhOzI68cwCoCa
         WWPIe/1MmL7Bz+nqNaBAoGIlRPTIS0Mbl3GF6BTVtWiU8RbWX7QkAHI+LJfhyz898IWn
         rInROktIGmv/hT0pse8ifKBI/KvV37+VA9KsC22J0RnQVEBrwaQNzf8bXF5EofBKjj+x
         jEF5RfNijs+ZDKqYJT7h3eIkIuUrJkJQbBjKn87LqkZPahF1048VoYi0Fo5UxKRtg5SW
         ZvyKqTk6/kMMgWpMjYbMNYmroZDpYaHUQzE5tP4WOxhU/362370gPs10S3aEsoDADaA7
         /HQg==
X-Forwarded-Encrypted: i=1; AFNElJ+E6nmyUXsvIrYTwtPECnCv3EDLZQc/kiHO5WZtsM72K4cO4O9Bm8ruSLtd+BuUNG1oFdypjdWcjUTN@vger.kernel.org
X-Gm-Message-State: AOJu0YzjRk4A1zyGacmFsJzeJrno4vdj9exMR8Gaf5dB+2xxYx/TcGeP
	HnLqEV9RnFyTTWH+i5CsHp4AjD+r75eLWiSdMxDtQPjvB45LQv6mKzdTKX5ffcZHyQ==
X-Gm-Gg: AeBDiev0/bAjAcmv77ZQ41NVQfqJb1aWzYTiv/GZrQGIMfb//KVkw/PgWLxlYd5N1/U
	IDroUknkMXQUMo360p1KxfVR+Js80qY3yA2wvwMdCuMVpYD4UMRzuU1Z1YQ8Szsi5EY/m8ir0Dl
	z3bcNfEpIxioG4k3fuL3CXE6FCWvqOsowfbbDPK0OYTksffqa6cme25zxcdzMisJYRtg/PJ1yX6
	iVqmTT+dmO/I/vaxPUayuGDFQwqHlwb6arwKNO+gMJPiHJWU5gpIwdpn+Xq0P+GrYWxGeuNwx9M
	nWnmaHiVZMehfDggDBr0/ov7z3w8/7osd5FZaBrp6q3R7wp18S8ODzF/VvN2FSOlSc0yDIGsJ4J
	jMrkw/wzEwNUUkq3WXBYW7pXAao7C5JvgtZsgnOKFHptpipUZ7+u94YUUQdzD5cbzjXb9s7ctfQ
	K2o08fMNe5gxVc5Da5Zaa9ZSwA4qMyGuZO9bLriH4NUwulC11siViXNzmYrv3sCgtrZO+8nKLKj
	Q4y+G+oI+Rcddvc67U=
X-Received: by 2002:a05:6a00:a14:b0:82a:780f:a187 with SMTP id d2e1a72fcca58-8352d2b5436mr13440114b3a.36.1777976080065;
        Tue, 05 May 2026 03:14:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/16] arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
Date: Tue,  5 May 2026 18:13:58 +0800
Message-ID: <20260505101408.1796563-9-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WiFi supply regulator is a current-limiting switch. It does not have
voltage regulation capabilities. The description is also missing a power
input.

Drop the voltage constraints, and add a supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index aae9d5ccca13..da819f36718b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -167,12 +167,11 @@ pp3300_wlan: regulator-3v3-wlan {
 		regulator-name = "pp3300_wlan";
 		regulator-always-on;
 		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pp3300_wlan_pins>;
 		enable-active-high;
 		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_g>;
 	};
 
 	/* system wide switching 4.2V power rail */
-- 
2.54.0.545.g6539524ca2-goog

