Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BAA3D6CDF
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 23:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061295; cv=none; b=IWnlE26n4xV5okwb0m6ALSbQ512yI601M2FwkQaMMVYzIN/uT+kLfGvmGsmMWdkK5owQYJ3DE/DFb3pwd6ltVl0fyTiobs90Na1+E6BKcMZZXnMRhcFSDkXpVG7rh5sYHUBK+SRTPfEIYzRbItynPIs8RVYO4DGV3WnhbED1Fj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061295; c=relaxed/simple;
	bh=Z7KAxCj3Lt9T/h+NNaZYTzw8OR6eKC18xCSnWTFm75c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adJqaIFXa4cTsWoJUvlCzi30fMb+nQuBeTKDzDkKgedpUglpLYhjjJaYgWZ00DCWLC47Zf4p329GpMjMalcFcSQ1PD0RgCjIg84DUyyuQbwgT2rXAZlJALzY15JZZ/dkaj4mxulO9EAzuiG8zbm/o4EubVsPQDFVfvuQlKDKY+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0QXhDy/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0QXhDy/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43fe62837baso801048f8f.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 16:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061284; x=1779666084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNnGNYWRDSiTCSAPERc5W07fZmdBUCZXZbGfR7wRvek=;
        b=D0QXhDy/scjd1/Q8Qgb/Ey+CmQhGAMyeh44NDceh62onNmzWPNu/MplI/PMcmPJteL
         Iaa/ZGqVMkx1qrxFldeI/Idmco13wUmv6o52f9Wpyt8I11Ua41cuhbXHAzR7Eko8YPhi
         vyn8wQJWWRmNe649ww05JxaDKkTOcMxJ3XgC7ibi3y77Ve2+V6p5wisdWzY+1jKWfy4f
         XSJPL6B7N4ZhfspZznu7mkciG5PjURG2loUDynAioSkyCohiKM/FDKH7D8S1wC1liK/d
         A7OilDF8TLwhb21eGwMGm2ocYeYX1Y9v+MoTPZgopCgJ+0SwBwyh5/FTJSersBzj6ZLs
         3I3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061284; x=1779666084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNnGNYWRDSiTCSAPERc5W07fZmdBUCZXZbGfR7wRvek=;
        b=RWtv8bHyIeuWtKe0Tpf+uohVuNprQQqx+MeR2+5gUQTreuxc0VEESl/LayfpGiqzfg
         PTeG1OdsCK0AM3d+Uwb5EwOWNnzMg3NENCXaug8eaGhO8BHI7YP1R7Gpgc8pLxVS7wbu
         jdcDUSlZx5G+CUuLwDGDGOHcgklx6ywzBpype9dIagicJjQq9GskzDO/5yuF5+r8WXWA
         VbSklt7mgjLMXMBwglqLMFycoeZHoODcwWMbXmxs+HciE3EAKtzcRqPjpQSsmd601F2X
         S/Ny/byE/5aYO8DZCYD1UDh++qAsnOZNUD4FLW7fyFQlXvwS+QF2wu/D4zMOFMGeeIvo
         FRCg==
X-Forwarded-Encrypted: i=1; AFNElJ/gCdYeAkY2vmY7ouyOtIH/0rV3DUxaYSGTpliW44nwA6RRxkX2cp4sSiRy4A+R5bb9PQWmuz5bNPR9@vger.kernel.org
X-Gm-Message-State: AOJu0YzfFuG8UYyMqLrkYX1S+JlkPsuJucodIRUjcsjZZDwq0P/pRDa7
	PwuzOODzZFVMqOzDy8Vh+7VGJhB6jAImB5jlAGxli+FPbrItDgN4ojF9
X-Gm-Gg: Acq92OF0z2di+pjVEjd3oFM3mFKnzTwvoqi9qJ3UjuI2gNYV4tYKcY280BretftZqwf
	RYO3e3dT3wIFGtYtcqrJx/m2uyD2SzjZbApiWOwn7I57f1vXOCsdBNQh+CbUWCyCE0hWRm2u77a
	kvyzIS5woogqa+lHWgc1+O5VjyZ7EWVmv+z6mdyX56++/JfT98dxnJMl4xrhXFVmpcaxgpPZe01
	cPCXuRwqVZDdnOQhZOPyuebRmQ/VB57a2n7Ynbb6cambO9z5SrAjJpiFutSojtUqizc2Pf8RrTY
	8HnKo5pzPknVLGXig/r3JHfBvPbA+Aj2NahUjBQWSHHoVA0un0zWPEf6mwdrRrIcghyYU9WC0l2
	oepW3X/g4WNM8MvpMUjgTWuIenIjMfNGdEl4mDhM2oJLnFaniQi9EyJis7yTtY1oP4rc+ZbrHkd
	N0tVaHI88IbffcvGjJfORPZ3UWA8AxeD2xrfVVnMWAPTCuWvSHebX/RvG8iSxQyDeU+hWaHh7xz
	iJvKi5Bbqs=
X-Received: by 2002:a05:6000:230d:b0:446:96b1:f5f with SMTP id ffacd0b85a97d-45e5c35da70mr17323837f8f.8.1779061284317;
        Sun, 17 May 2026 16:41:24 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:23 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/5] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Mon, 18 May 2026 01:41:28 +0200
Message-ID: <20260517234134.2737320-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
- no separate section for "core" .dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..f65bf1a549d4 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,12 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie Helper A133
+        items:
+          - const: baijie,helper-a133
+          - const: baijie,helper-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0

