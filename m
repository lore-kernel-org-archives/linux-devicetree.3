Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA1F3DAAD4
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 19:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956864; cv=none; b=kGetl2mBGHr6b20eEnVjCxfoPLUBq/Vp76vzd+ZRCkgg7PHqAjMDeCgOFIyjQsmeRXnDU61VN9z2cyes73HPHyJG+eNm5zxBRZI+iIXeVthfupTB7OCjw3lRRLQHWwx0nuhqOBX9Lxly9tg8m+M92wyVlsMscvpvumm1V0DqJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956864; c=relaxed/simple;
	bh=JtI4XaxDSrHGib6D9WSvrm9w1KJNqKNYSjWwwSwbMlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wbai6UeLFyRDuZ00ERFaTpxEXyvWNxV6wCadd8tyX9yH3OgVMhqOuoySL9PzdHXPq2e5b0nL5+s7llIHbSmzlE/VCMJu3u/T521ZVJ82Eho+kLNeAh35bdprrJUeLRATElE/pa5IEo6P1PG/B4pAHGoqNmFelahaZ6y0e3tAalo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRZ5WpXZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRZ5WpXZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce98cb8165so2465795ad.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 12:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956863; x=1786561663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5fOQxawDkoim8FshIMHFVqdsTrAaOqiHpnGvVYNAqY=;
        b=IRZ5WpXZjRC/G+nCaub1U/QAGTKOCXyosyxrKxxf4+bpFKjUVOf95f5mu3mPkLsYjS
         Q4PzYkU/GtkpmKCG9aEso8BbavUHd8+ThLvtsEJovty5x+MFVyS3BoWrL0H1Ui1HEabY
         Vice0ceq/BPoXSpWxzT1iZuK454rhRUUOX6X2MuhmFBdpGjx647TpgdreHIcEr75szUM
         kmi+aVP6DFOVS7qA+9wT+K33KC02gmATSCfieqRXLlz9ggjd33TXwkPjyk/CRbXDguBu
         HYe4EDnJFL5BzlgU3GQuXvPAFhzFu63gOUXNUuYUlXw1F/eSIjBqAggs8e91CpvXdgKL
         ioSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956863; x=1786561663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5fOQxawDkoim8FshIMHFVqdsTrAaOqiHpnGvVYNAqY=;
        b=Q9f57IFWCqcksj/N77H6AGV7qaw2uXNaJEnmAiSaxRHtUinHsyF8DGgAJynjsVndD9
         aIhkww6k3dGRgLnIAOL98id+OGccXt5dRNqFUlcoyi8zQ+MjrCGyo3Ae8d7+wUhnZIra
         OBK7RY693xiJXVPuTD5b3GFGkejUynn5/t+N3dYjd4sEq+IndvcjelbXhbYUA0U3Nazg
         MqvPk0EGftsffUTU9IP14FIJcls5gUVOIBlABL7fSbEZrplFlh14lntyJnzO7H0g8Xzl
         RWpmKbu084ursn7+Hcrr9hi8KeakwC+ztyIUw+hdTUJ/rrMZ7k41B5iQCp6Zp+dAaqFx
         H/og==
X-Gm-Message-State: AOJu0YxMkpsh5q8ALG5fauhthLv+5L91qIG7fmxO2NW7Hwhok0hXwzwD
	tGJLNmTEbOwK3DAM9lpnckwhO7QTX0Q/MgAUvJFbH/bq/BGH66qlFTah2EHupA==
X-Gm-Gg: AR+sD12+5T+mMfV+O7+NNV/mJm83MCbyofonPRglLRTD0t+0e/neSIHCy7/yrDuLWTV
	6O/p6jUcMQAk4s31YbblO+kwtHxaien/I7xvuc4MoR9spnuB7Fyz7/vj3dMR6sgtAhFme7aOmUk
	BuspHi/iCzbtA9WzDjfuNlwFMpC6YIbJy3IHJE1b7J33hJb0LHMO+q57KRstUbXKJL+R+gIW8xQ
	msFYxaaHTkEBet9R8Xqtgn0c/+Iyz5Ap+D/S6+S0Y8e3dY/Q1c6cb5Rp2YecXSJcgMJw0j3VEMK
	eL4kGmNmCMMtdTF4SlsMMik/8iEziY1pD4VfWGnHexpvk6EGfHttLt6R/XiFNOVFVmgiR7O5N1O
	sOXTlaVM8CCcFRQK/zFT9hELf2i6qMuMwU/KxNRG1WKQb3OTRoST5W/xI3vCPePqxy0XqWWAl1F
	KJbdcxsLlTo1siYSEHZfPZXhW8ONb0oq8riMh/gWk3etJTKVAGcYj92jyrj72xf8C33gup5Jy65
	zqSsuLVkj5VcodKjYBa6Xt6Odm9VSYT07hz+0OcBmd03XSNS2sR9ZA/bnx6JqauxNf0HeZ8cDt9
	Ze/8UUZd8Phtw2KJ0jJgy8SPssohSwh5BB8Z/g==
X-Received: by 2002:a17:903:2a88:b0:2cc:db7a:251 with SMTP id d9443c01a7336-2d0f185d64dmr17653165ad.2.1785956862798;
        Wed, 05 Aug 2026 12:07:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa491747sm20026995ad.39.2026.08.05.12.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:07:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM53573 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM53573: add phy-mode and fixed-link
Date: Wed,  5 Aug 2026 12:07:40 -0700
Message-ID: <20260805190740.8152-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are needed for CPU ethernet links for switches.

Fixes dtbs_check warnings:

switch@1e (brcm,bcm53125): ports:port@5: 'phy-mode' is a required property
switch@1e (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
switch@1e (brcm,bcm53125): ports:port@8: 'oneOf' conditional failed, one must be fixed:

'fixed-link' is a required property
'phy-handle' is a required property
'managed' is a required property
from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm53573.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm53573.dtsi b/arch/arm/boot/dts/broadcom/bcm53573.dtsi
index 2c43be98090b..1dd2e984b1e9 100644
--- a/arch/arm/boot/dts/broadcom/bcm53573.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm53573.dtsi
@@ -226,6 +226,7 @@ port@4 {
 
 						port@5 {
 							reg = <5>;
+							phy-mode = "internal";
 							ethernet = <&gmac1>;
 
 							fixed-link {
@@ -236,7 +237,13 @@ fixed-link {
 
 						port@8 {
 							reg = <8>;
+							phy-mode = "internal";
 							ethernet = <&gmac0>;
+
+							fixed-link {
+								speed = <1000>;
+								full-duplex;
+							};
 						};
 					};
 				};
-- 
2.55.0

