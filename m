Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116483A0E8A
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787234488; cv=none; b=detI3x/BWapJZohipdNibxZgsWj5awntc0oKaiZRABjVNb1LebSIDHdRHmnrLx115YRx8Z0026sqfs5cESer2ASkNf9msVhl3jOO+byPb6a0+jBXJT5hBHmnJbmhEUWEwh5UsWrzBEc0bvCXtxmmMtdLiRPiqcdxDft0/b/PAfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787234488; c=relaxed/simple;
	bh=PQU26xP0GCgU75+6oYY/FD7rSTDen5UQ3ddMVoJKHtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTfCx9VhB/5BaivDgSLGTXx906cWDn7JQNe04W9wSdyAnot5C15HSq0aTWFOmxbYDB3lvSwLAK+DDyavkVf85o3FAOeUQpcxw0vBVTAwKBvo6BChZB8QlBFkKiR1Hzt//jKInQi6LNap0FViblX1+XbuHfMx7j4zDu99vjKFOzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMz46ZbS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMz46ZbS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so20043135e9.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234484; x=1787839284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLaEkJkOM/bblPdjJj80Q8FaxdewKpE3ij2aO8k8oV8=;
        b=JMz46ZbS2dqHi0w48CkyUvSj6vXnmluZiU0fTbpLlQpAUrM7aXQBW/mWK3x8q1HgJu
         MPlKrTdRCWafM+A+lg2VZhRgRHR9Uu2NPWhasKoCEFFvsU5dH0iwYHM72Li9UTcD7o/z
         mRImE51b0RqsDQ/uecyhMZutmLWTUXa72QjhU2uR9jXz1azfdSuHdkBaQKfxA6c2YgM8
         8bGQ4FENYAlY54PeuTKL6BT0NmFUj3c6F8BKdacRZ3zuygBGvdi5ubf5zbFp7pg1/cnt
         wxI2rDCjzThlhc5jYTapofx15r/n4W2GqmiEQK66gVwTR2rea8pNutLE67WB8QgPs/wX
         XL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234484; x=1787839284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLaEkJkOM/bblPdjJj80Q8FaxdewKpE3ij2aO8k8oV8=;
        b=cxGLs1CTXWLrM9xiH/r7rMWFxQRlOxvg5DZTdUjKLzJI90RIKUqt+OsW1wuq6CF6Nm
         U4xfhrKvmDv1LBjLq4dFfMpY9Gd1xbcoI+jWMf53ZsLtEoBqivWcbrg19ZQB53yHsqCr
         swt25nJ/uvgd/L+tKCUjoGoB6bE+jY9RFMJvqxHZ9m3nGZUzS2X1dLACR3n/POVaJiQW
         cNKUZiYERfZKz3s987JxNbwyOPP+0TdyiJOYlb8uwFLKKdMSaE9EuvxYm+6xWozUmogg
         mUKHGla3+doGVoIn5hY3HF/jQuKPDQG20s9zkKO4VeEjfEPscLXWWFHXvmldoiWMUO5j
         PR/A==
X-Forwarded-Encrypted: i=1; AHgh+Ro8dsTzq7XMdvyRKgLuN9q0ARBaEnYr4TeE3su5lT6Fnf6Bj8yY+cPXB6RnstE7p2OddoIn8eTHFAPI@vger.kernel.org
X-Gm-Message-State: AOJu0YxKEF1UpC7wpHhOO/t3++jUav92vlr0AzyJdQtYgysvIUbwx7uK
	U1PrwKg8Jip/TdqglpeXjlXiOQD3XZ7FOXNUTvmjc0mMcSaBO3fJTfDX
X-Gm-Gg: AR+sD10blpoTF21zKGWJF2gdc97WDiYA6rv5lzaXIe5UdgPFw0fncnQ9ZNqyUqBpk++
	iagoPxYDo1PKJXM7zRa6IvPH3bkSxkQxBT7ovnmzDQi9ReghuupqxE2CdItV0TIDlcWFcTjjw2y
	3yjGncDTvrLIOBEHdOSl7A/WWCMd656BJUN9yhK74CLx9SVG9pMEo8pjJP0/xiwTCEUD2RJVpib
	8RIVguDa93OQHZ6WbPEQMs3gNEosxm0o4ekA8+KgaMhj/OdwE/SlapAhep1TT10dT0zAaf4qa1Y
	H1WIyI8ohAvJhqj9XTEoGYUeBT9rjzR0C5sCb1nihMbDnOMTqNioTJ9qdyDZ5dRw8pHQrJ6zMVx
	2EC5KbSG69zFcH8MOGcDYk1JlS8Gov9xqmWIPQqpjS/0ntjJZJudIcLD4duayCJp7NKDvl3Q9WN
	61v7zV59M5lF2z6v9EXdFReMFDSupMLl9a3AQDd7OQvyKUmkR413rT0i2nJM/i3oMj+nIeLxu0k
	VngjiH7eOT1gd2gHZoS0/Df0kLbQ7qeCdEqBcC5/Q7CSh86
X-Received: by 2002:a05:600c:1c22:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-499aa1f5589mr213200385e9.15.1787234483988;
        Thu, 20 Aug 2026 07:01:23 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0e473dsm137978275e9.15.2026.08.20.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:01:23 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 20 Aug 2026 16:01:09 +0200
Subject: [PATCH 2/4] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576
 variant
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rk3576-dphy-v1-2-70e25e8d5e78@gmail.com>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
In-Reply-To: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787234481; l=1206;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=PQU26xP0GCgU75+6oYY/FD7rSTDen5UQ3ddMVoJKHtk=;
 b=vVatJWe+TLIe1CZEaI6WT0B5tUQdWfTEoBKH00j37Vospx7fXC+76eafe1vUDln3ztYdagCAm
 IVW7y6akOZjA+GI048Dv150feOuZLDXjs8YFPTR6f8zv8l6/jhXfJoD
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The Rockchip RK3576 features two MIPI CSI-2 DPHYs compatible with this
binding. Unlike the RK3588 variant, each PHY instance only has an APB
reset line, so add the new compatible to the single-reset group as
well.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 03950b3cad08..92d0c961f4c4 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk3326-csi-dphy
       - rockchip,rk3368-csi-dphy
       - rockchip,rk3568-csi-dphy
+      - rockchip,rk3576-csi-dphy
       - rockchip,rk3588-csi-dphy
 
   reg:
@@ -89,6 +90,7 @@ allOf:
               - rockchip,rk3326-csi-dphy
               - rockchip,rk3368-csi-dphy
               - rockchip,rk3568-csi-dphy
+              - rockchip,rk3576-csi-dphy
     then:
       properties:
         resets:

-- 
2.43.0

