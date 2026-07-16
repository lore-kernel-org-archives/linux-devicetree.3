Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697932D47F1
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784165333; cv=none; b=hZvckSw00PmaIUoUM/0mhpzn6/S8J/362xa5aV1cDTmzE+zhMsFkOiwTLDH3QBkTdkDTzfxKkix/wfLLlydei/ucVll1OCe3C16D6V/F9g8peXQu6T/Tva6HeQJtubT6ickQF4ton+Dgt+5jIK4ElExzEeMlpwXAKvfjgesqaXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784165333; c=relaxed/simple;
	bh=mfRGFBTEsChF24lW+vUWEtFFffdatuYei+vQ8NiJtPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+aTh61dymZIDsLsH9lxkcjuffyA03Wiu4kOvhWcrNulVCshg2XGxjr8dTp9mzka6C0VPt/QK+MNU17UVNaOAm6+BlWPCS4hVGzlJq3HQT02QH3PxR0Dd8r3UZEpBLg2etMYu2Ay8Pip6smZKUzC6aOCaSeyIRjg7/MbBHabgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxdJBCeG; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxdJBCeG"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8486ac3f347so71309b3a.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 18:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784165332; x=1784770132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWs04zmRhwhbYBG2seCp4kn9pc7wv+8tpSxzop/N42g=;
        b=UxdJBCeGUvPH05lrRfpW3l5VzQAnqPSydgiMzlsXTydSBwTcH5v5Qe+DHjJgqp/cmk
         sIqMp+cwMRthUVRsd1eXqgYkjrDcw3FbvHYhgFbbAAlUigwK16jGAQ03r9apAXd0ZZds
         lAyUELrTLkEHUotx4asSM9oF7gEPbnqdyNIufS2uQa4rEoqd4lYC/iUmm8yhv0YhEQIn
         VdzLrK0CViEF5ICYm7lm0qRbn3ga4WZzHkx/fs3jkKDJIQvBMwiL3k5+YdW6UW250UOB
         +I3ONv7R1McUDdPyD47ZSE5Tuk2RDViFUEslmbobIGhCBesqDwsRFz2TytVj+gz3BuIG
         QulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784165332; x=1784770132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWs04zmRhwhbYBG2seCp4kn9pc7wv+8tpSxzop/N42g=;
        b=jHdrDjuV0Ow6cB0CeFD5v5ZOsh1FIPisSW9RR9WsGfINMqezicKsgBCQwR5wwN2iGr
         YoevAm6qWafR6wX0tACC5NM1e43qZ23n1W1GoMH2sJ7O1VFnySOfOvPtXdpbmqKbH4ze
         EP2z1FD+gLCBLtlEXt24SDHeC8CmIw+cKDJZNm3i9vDCIpzdMfIvTt+xJVsj41ezplbg
         +C/eBfgQc+KcS4GUtguAloWy6EJX5iJRGg/SEr/ix4reQ+u7Y3nafU8LeUmtZnX1xLrZ
         3na38zVMOCEmNau4y6aTEa2TxVGj60PvgqGMMPcz3pkNx23kZBxyGVCNSs4ov470eQyG
         d3gw==
X-Forwarded-Encrypted: i=1; AHgh+Rrlca+uf895w4c9fJSFTfkO7fB3cEZ/YJafJ5CYBWRRwX93qBQMWbeoWYqTRna5MB/t+r4F25Vf+q/F@vger.kernel.org
X-Gm-Message-State: AOJu0YykIiAi+5cLSVWz3LXLSs4ExKO2q08ZHmxBZf6KGjZT02kct/sM
	z6vs+yG8VPdNlQ4WbQ2FuRLuxiVnMfVK0NIFMoILNRHZiX2L75FnB2Pu
X-Gm-Gg: AfdE7cmVlU2JG4rbPhCA7GAa6AcqO/RP6eWtL13eZfgVDQ9zULZN8rbGZ0FqndMOW1M
	brmUB3daids52AhYzrJBghKWDka0KmeF8R5oTs7eLWI0SCyNb/FPZrQKctiBEU+FW1wWmbyGzVw
	4H7Qr4BFanhxiDkLpFnMA+8iMbkmbfmP0jHJTBHRlFctPZ6rLKzMuRClhf1DKaH1KR+LLcb+uhO
	BBoE8+rEdJR3OJBqbyRcLIA6SCfyMKQYdAhoow0zTMrk8GdoHopQw+Xssk0QPdynssM/bw04kaH
	vlyzrkCRGc5hinrAUaMTD8PZ843Ait6+IXxEBE/W85yDE2JpipNP/8+MQIycwETFZoHz2PZwZKo
	DNanulu1iXuBuibOFOzck3XQFSpnYbZZNKCOm50vVGnV6yZ06iY6sFVOzQe6XMjdPvranNA3T4m
	RTFXUmgwNNWDh1//sZ6/6sW7IUXUdLtdcbOIxXGjduHV1I/ySfzZlT8rY3KTM=
X-Received: by 2002:a05:6a00:1a93:b0:848:2f58:e1ec with SMTP id d2e1a72fcca58-84beb57d6e0mr419869b3a.39.1784165331660;
        Wed, 15 Jul 2026 18:28:51 -0700 (PDT)
Received: from ubuntu-gnu-linux-24-04-3.hub ([2407:7000:af23:3e00:3ca8:26ce:2345:363])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4ff2ea4csm3901362b3a.23.2026.07.15.18.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:28:51 -0700 (PDT)
From: Jiaxing Hu <huhuvmb88@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 13:28:37 +1200
Message-ID: <20260716012838.2353939-2-huhuvmb88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716012838.2353939-1-huhuvmb88@gmail.com>
References: <20260716012838.2353939-1-huhuvmb88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibles for the ArmSoM CM5, an RK3576 compute module, and its
CM5-IO carrier board.

Signed-off-by: Jiaxing Hu <huhuvmb88@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde186..5c7697f4d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -71,6 +71,13 @@ properties:
           - const: ariaboard,photonicat
           - const: rockchip,rk3568
 
+      - description: ArmSoM CM5 Module based boards
+        items:
+          - enum:
+              - armsom,cm5-io
+          - const: armsom,cm5
+          - const: rockchip,rk3576
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
-- 
2.43.0

