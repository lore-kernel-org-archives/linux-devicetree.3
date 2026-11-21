Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795247283;
	b=cWhVOF7EVyNTbMfc8RkmLTxSwbHfy9m4WyxhxutAtG5Gzcv0OwtPNiK2N3KYPapF+NWu
	 bRBrQl9W2e+hNkebaKSmaeK1agJwO/T/PlxHWWlmk6Fv9LzqeI4FqVifA10I0Mqg+fi0P
	 /rKl61WDmN2WYY3eE/rL6oQIagN4KvwE3XTob7zhId3EuUmMp8hIvyMCSGaHuoIPLoeXG
	 G3tKa48r5JMEuU3TkSwjmqyFIEUfQ+L/4HzSeggcx6TeD63I59BQptCSSrmhtox/4KHCV
	 vuzzVXs/cfy/EmYnlTOkD1kXBgMHVy5JLn2ZQY+LAfN0MuWqZFHZb6XDPCZP4khPHeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795247283;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IFNwACmidFToCCNfb4iFqu5ciyIQ6dqGvleob7ligsI=;
	b=2l5WRHENOVxfaOL0lAwLBu9Ygw/NatvV5Bq4helRg3ihE1xiVx+56vZrtcHk/024Chmg
	 oQfc/3DyxaJs1qtTHKv8tQB7GxtJkT0bXdAPNs5USPprSw/g5bgT7/pIvB6swli6JdzOA
	 FiTRfp4/SmLXLjvZkkPNU7mhYtBRMh05GtfE4G6fvFy74R9e0M5CJiKkx4n0MOeMWmURj
	 FhG2nx719ebtggewpxRr77r/HxCrpaO6sTZwLdNESWVI7Iyr0oq24+CmimF+LaO571iz8
	 vSDtFEKLHOHmAc3DM9tMat80+x6u9/Densr6RqEC0yhMYHPHcSZ9eg/Mm0ElGIN3P4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=BChlDjPI;
	arc=none smtp.remote-ip=203.205.221.205
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443C0606A325;
	Sat, 21 Nov 2026 07:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 443C0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=BChlDjPI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795247280; bh=IFNwACmidFToCCNfb4iFqu5ciyIQ6dqGvleob7ligsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BChlDjPICHvQ7eX+vhw742v3dwnqhTvARFG8hLTEIYm0oe9A+3oDRVfvbxB7Uebbw
	 4YldIZ4x3RGar2oWelfsY5m4u1fER/iEn2JwIEVuA6u31cJqijxNRzpiGS95r75fQz
	 9tMWzBx9SDY1qy4J+1CghBZlVB1VyvXL81KeIdL0=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id BF71E40F; Sat, 21 Nov 2026 15:47:55 +0800
X-QQ-mid: xmsmtpt1795247276tfzuxhlqb
Message-ID: <tencent_1A5C41E9DE4754C0A639FE4A64B1B23AC305@qq.com>
X-QQ-XMAILINFO: Npv5yIQT4nxMRdjQGHBeq7pCwcd+N+ut+TRiHESwHMHR/AwGJruwixJZN6B1hQ
	 HsYmbIkFeXJkbH+ZBRWJz5CIqGFjPMKa7ToIALun3QXaDQqxhi8pCTzI1KppAz/DuVb064gXeU5u
	 W25Z5AardHizFC4ky5XICCBysV1gVO2gdSrYSQJVfR8QDWL1ihKwjMXei/u9N6SS5Iy+bcAWTi6D
	 uZYJMbjkc553ODhbMV/SZYE1VrugUXbF2YsjuRKGqsmIm2E9pHFIrSyNPHYgIxWV6o+dAiU3tf5P
	 o8B3bK62rSBryKY+tnpy+ke4K9sXb/b6DcTpPXsMnT+7bvlOLBJoMa4dLr3HNcxqTCY5Te4bPfjY
	 jHsWr3ciBmTWBuRS+xg80O4urq8gtwCS1L0IxA+W6KFHNjkPygc6cMBrXha8dFdalDukjsaBmnUY
	 FFewkPAB8y/q+5F65I9pA8dMsGP1e+5pVqjfKOqIZ1/NgMKVRKfFIRYn5/FItIs4wa8XkV4KIt94
	 ZABj8XyJR03yUnaaF8Cdj9AJRkjn6VWin74ratKY1DWuE54p1+Dsb2drl4S5s5/aj+pMkQb9XOKO
	 A+qGGI/Bf97P9TIrS0MrK4zJz9wG0Yu+JVTSgotAAahUzk9HYQ251Aq9w84az8vri7Q1F98FpbZC
	 S5hK3WN9E7yzOltWk+0We5r+8uYoASui1gTKfHkJwlI7hjaNZwEjoybjfErT7f4mFBQuddSjn8cT
	 uvEZxBBDBmp3R4YjFbkXtemEZoYdoUMlO6iXTPt6Ds8JZD3i7ijTQRocj/PkbUh7rW39MZ0BZZ+c
	 WtB0hW3gebJWuqKBFs9RFuOiEgu8GP6mS987IvjlRHOvGPxilU5PTVYa6pdFqq7boBaSULPSW+8A
	 aOSzgWXjiXJ9NyymmWt/TbQGprYyfiOc1IfKxsTo4aelY1aIKUguC5NPUpNWQIUqB+lQfpeV5lRz
	 Yvk2XRFSZIepR+aDe7PuB4ALYCStGkOadzRS8l7X2dwQjQHOioENoFjc1h8iDZAEjnVy4eqN4QgG
	 WSAPL4SCEvWhgeEg4wnB6nFaV+Fq7LPMa9WtF7EG5/DzSrcVco3EEjJwh5vpqjnsKJ6TdImNgNvH
	 PEF1gppF0UAmlwUpB9xI8lSY2nmeHF1tSfXkzk
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: ZhuXiangyu <1194781887@qq.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 2/2] dt-bindings: phy: rockchip: add RK3506 USB2 PHY
Date: Sat, 21 Nov 2026 15:47:53 +0800
X-OQ-MSGID: <20261121074753.1262819-2-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121074753.1262819-1-1194781887@qq.com>
References: <20261121074753.1262819-1-1194781887@qq.com>
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

Document the RK3506 USB2 PHY, which uses the phyclk and apb_pclk
clocks and requires the PMU GRF phandle.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 .../bindings/phy/rockchip,inno-usb2phy.yaml     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index f50fc69f..956a82cc 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -20,6 +20,7 @@ properties:
       - rockchip,rk3328-usb2phy
       - rockchip,rk3366-usb2phy
       - rockchip,rk3399-usb2phy
+      - rockchip,rk3506-usb2phy
       - rockchip,rk3528-usb2phy
       - rockchip,rk3562-usb2phy
       - rockchip,rk3568-usb2phy
@@ -47,6 +48,9 @@ properties:
       - items:
           - const: phyclk
           - const: pclk
+      - items:
+          - const: phyclk
+          - const: apb_pclk
       - items:
           - const: phyclk
           - const: aclk
@@ -158,6 +162,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3506-usb2phy
               - rockchip,rk3528-usb2phy
               - rockchip,rk3568-usb2phy
               - rockchip,rv1108-usb2phy
@@ -240,6 +245,18 @@ allOf:
         clock-names:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3506-usb2phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
   - if:
       properties:
         compatible:
-- 
2.47.3

