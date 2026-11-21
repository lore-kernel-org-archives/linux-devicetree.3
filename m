Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795242823;
	b=s1toRoZdPenwsF1+VHkF5+PTfEo3pRiTrBTzUSKIGttUJLC4BSVYPauSEvURQGRvroY1
	 wOZhjkgLfVZF3t+29fLMDlzpnha+TrK1QLLVwdCRC4CqplT4DOFmLXTPq7idv9AfvDOqK
	 taP9zPXbzKbc96JZwYlBPby5XcPFVQay8a+XKZJIxzNkCqfGNwuvU9dDAxsnNLaGm6CID
	 HTmWUo9V8oQi85CyuSRL81PUGyKy9ZWs+/S4BGEzVsHkTRytP8Rpdn4eD5B1ff6I5Qjxh
	 J9t0MqGoV6Bvm8FvzRQUAqc9eWcV3o96aWpBuaMmZIrAvZbFZvqYuKufZOsruUKX9Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795242823;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vrWn0Ixp2M1jrHpRUCkv+bLIfyIujqapxXCKCxU/7AE=;
	b=SxTpyzvBe9BKw4QCQdZT+3I9KFzGwQjtUqWy3+qVTuO1wiiLSUq8Wy52s0u4ayedV2u+
	 0RmOk5SP1LIHfex1boaPE5KbqfhRJY0M0xkMdADBGAEvg2UG3qYATDzzYk3wrfItoIDLL
	 E09fmjgZh9E649T39R+9Kx80pK0AsJCLEXnDF5zQSCOLsfWLAlBu1jcOwl2VnNIYxZClV
	 NkvFtlrYI++Dd8k2jgxWbXRv3PvBVJ/uzUF2aX4IBZfk2Pg3o2fGbkwviCWgdBgVHnpyF
	 /XUI3cSvx3GBHPE9a2QzOgq9Dx+wUbWz+VbAAPeV5yGEBU4DZ8o3O62EX5PRYqlgkig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=WQSqMnwi;
	arc=none smtp.remote-ip=203.205.221.240
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF89606A337;
	Sat, 21 Nov 2026 06:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF89606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=WQSqMnwi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795242820; bh=vrWn0Ixp2M1jrHpRUCkv+bLIfyIujqapxXCKCxU/7AE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WQSqMnwiam/ueGtzWs3rSyy5JGCtzGCbTL2peHaLgFNwoG1+rmCbS04luCp+xT7U8
	 Y+LpbEB6eWBPqSPXfq0pFBHWHat0wyNJtyrMXb8Z8tIPjME9OcqNUjkL0CxBCVAuJp
	 UaB+gbItilDWzYirrXi+70JpQU9N/WZheMO3RHCc=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 86136C4F; Sat, 21 Nov 2026 14:33:33 +0800
X-QQ-mid: xmsmtpt1795242815t7b4l3f5q
Message-ID: <tencent_362D76566799132999F95C09AC34775D0D0A@qq.com>
X-QQ-XMAILINFO: Mb8jOXBTO9mFtvXd4x42BWdNJrJAhWsAQ4eNSsIFjy94jB3IpWBPVnsOUyULK3
	 Y9l6y3PnpRvdHjyuKGo5oQNzTvOGxC0zdJ1kxLM8DrxohF+DndfSO0PG/phjqkkzakieirK/+pmH
	 Cr+gi9qNtGxkxHMEcSDlUvMx8w8TE0ryP6Y4wlZyrmqin1Lg5b7dCrToDzS3gUxfoT11GFxlveTQ
	 fQzya8V3pKdolnFI1f+1SFdMF4101oEvjs5FhkeYu149PyhUKhQRpJr4LA2bVBIUNDoJ1r+aP0EY
	 m+bkZS3g3tXqpmzwmh+PeQ927jv38fKchWzIEVB0tAM5+4gVB/kUbgTchdtt5x+NFSkIvq/t67BM
	 cbSnSfZIQ6us+PZGkGsoUL6BH8jFXpq9Axrmc9LiGyr7PMmwg82O4LAQlHEczTL+cRZngAhWmanS
	 2yqp3TO5nZ7V/UFTe7yOSgtypkGWX6R+NDlEUKRfl8rPhKAe3xJIHA75F6DIlhx/Fcct/PEEF1RB
	 9MErmFeYi9SEQ/vEVkVtRl9Hs8kLsIBfvG9Asv6WtAu/KBA1yv/zNCzYs8jdfcmsH/5F/LHgzo5V
	 /PTxl9IFmORTonfG+cOcwN+RLXcC/POHTQV5c2mtiZ2LhQXoPn4tueV3Unv55glPkpgte1X1wNl/
	 SlOx3+afQcy8e7BtSld5gVlWK0WSMgTgaXq0FWs+FzkIzjkbDzDuvh37WYAL/0bt0+LYFKSYo6Gb
	 EM89vpGfkkCrqTI1hUUi/h3eFwNJY80j+fyzGxpcEsVCapUmTrMyMeX4JrdBHWBP0NrpHbDLKBD+
	 udShGJ8S4SBfWr+JL3OnQ0WVKeO4q+ScnPMp8LlJO3nhl1IvuXO14ItC0Aq9KkqT+HO7p8i6Kg/D
	 pvyKfkbsGzcoeNgix3gid9DffsMfR/wSNo5/Bv04bCNqFF5dk0qguIZUma+AB4rd/aV5r4OdapjA
	 1+UhqcMGu5G6yMEpwqgCnPi2Y1bQfg/h7oojbhbe4b/tfVIyHyZVRsxC2CSGZYBfA5KeOFVCFd1b
	 NiEPKEHkCZfUmbAKZCcmmaUpLim7Frl9v52xhNacYLQLUZiiADEI8hlu1+Xcf3BCLNNF2azWywFI
	 ShUVyul4mKG1UbMeWW1gcEVcckRTvJD1yaLr2a3k1E27e4PJIUFJl1ZosVcMG6TvPifleYAZyCFx
	 UgL8q5G4TsRzFVE76Uzey+ZSvf
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: ZhuXiangyu <1194781887@qq.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 2/2] dt-bindings: thermal: rockchip: add RK3506 TSADC
Date: Sat, 21 Nov 2026 14:33:30 +0800
X-OQ-MSGID: <20261121063330.1094548-2-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121063330.1094548-1-1194781887@qq.com>
References: <20261121063330.1094548-1-1194781887@qq.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RK3506 TSADC, which uses the TSADCV13 register layout
and requires the TSEN clock in addition to the controller and APB
clocks. Like the other newer Rockchip TSADCs it needs the GRF to
enable the sensor analog front-end.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 .../bindings/thermal/rockchip-thermal.yaml    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index 9fa5c4c4..f7fa4b60 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -20,6 +20,7 @@ properties:
       - rockchip,rk3328-tsadc
       - rockchip,rk3368-tsadc
       - rockchip,rk3399-tsadc
+      - rockchip,rk3506-tsadc
       - rockchip,rk3568-tsadc
       - rockchip,rk3576-tsadc
       - rockchip,rk3588-tsadc
@@ -33,12 +34,14 @@ properties:
 
   clocks:
     minItems: 2
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
+    minItems: 2
     items:
       - const: tsadc
       - const: apb_pclk
+      - const: tsen
 
   nvmem-cells:
     items:
@@ -127,6 +130,7 @@ allOf:
               - rockchip,px30-tsadc
               - rockchip,rk3366-tsadc
               - rockchip,rk3399-tsadc
+              - rockchip,rk3506-tsadc
               - rockchip,rk3568-tsadc
     then:
       required:
@@ -155,6 +159,23 @@ allOf:
     then:
       patternProperties:
         "@[0-9a-f]+$": false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3506-tsadc
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
 
 unevaluatedProperties: false
 
-- 
2.47.3

