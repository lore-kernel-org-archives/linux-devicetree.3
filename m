Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09E142BE96
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 22:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785365649; cv=none; b=f1t6A62FHKSqA/Hh7wZmSCFHXLUaH/r+gXU6X5gYMb4NNr9MYlxjzzG/Rqx7wcrPm6FgSEdlt3uA9Pja9T9abzdiaO/5HxuLQT/nAsUo6FjEbD13xF3pXMdkKA76UeGhjGAAd3XJco5rQmLS+8f1JAbDS5pYQPKBzjYd8eYQBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785365649; c=relaxed/simple;
	bh=J2fCw50SvCzhguPj5fGHSIoQb+HJ+ce8kj7E4yCqpJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u9UmwmCv9Lkht7Gfit5tF/QNjI1zoDMrXtFMovdEfbudT1W7xbDm7Bir6vz3PwijuZHjlyRgnZ6Y932NoqEPet/Ml+5hJ/kEf78Dz9Iq7RsiWyMjgXkziDbEF8ufpAlM6QFO3ApOSACJMcaqmLrm8LfemAOz6nVVobVJ4B80HFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bavSfNb1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bavSfNb1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cea3004256so17927365ad.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785365645; x=1785970445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrGwNQ0lfGtW2fG8p0q+5yN5AF4lKFQId8OOzJuDO6k=;
        b=bavSfNb1NBzUkuyTzckQeHrWRNLQbLmJawYBBSSi1NNSqa6PMq4L+808pNfYgYj6Z4
         AINBCNfLoz18sIhSY6A1RksJDBPYhbf0hIHm7MykMlUrybm7/fz5IY5H23L/ziCv8lO7
         V+3SXIhAU6acGd89dGa8Hl96H5rHL0BldPnJJLNtHu3A5Uf/rP6/c0ZjlTk889YMf6ba
         tfy4JZBKCM5Wl2dv8UI0lCmfRNBjuXka+lwhjNU7tiNf1SQWGi6s6TMzLkIF+M0MbMcR
         mCSe/tAdRPwMjR/hIDz28KYZ8nmok9PoXR4txO1+/r8ZN5c+m7cMRs0TlqLWQLewhelb
         vVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785365645; x=1785970445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrGwNQ0lfGtW2fG8p0q+5yN5AF4lKFQId8OOzJuDO6k=;
        b=fVgAQXEr3QbKP8RVr5299T2weC7xlb13J8qGsQD2Y2BmKtnUg5iWQP5SKOee+VPTHA
         C8EWZDndVtz9zXbrBibPtBDtUPiejHq9Zr1LT2/ZfyhkRkbk/8lLWgzWvBffTXIcnEhH
         HnA0HCRsZuvjUvt5TSBkBs3MVwCt2TK2Ix3DrepUbDzV69hA32ibnw5WBAZHxNs7zZAm
         vyuuYRjCHx9Hhhcv0V7RzJB0CPTUL28ldw7f/79ilbUsBGXDG4k3KferwIKJyAUgtr97
         nCxLC+SsG1nVCRHVFEaG6ThBDyy2konNbRyIhZ+zGmu0vmBE3fAWLWHjGnYgKxayiRHp
         wzfw==
X-Gm-Message-State: AOJu0Yxh7sCBX4gMdw1jrcQkbHbFojZdw3jKYpmaMGZXf3sJqw6mP6s2
	U6kVHJqtw6GLkKvGKDxDVtoPqAPNz5y8MHRGjspPtZiSgZP9936oCLdsiM+st6dV
X-Gm-Gg: AR+sD13bJ0tUFKy0120K6xJLBIlTpQTydClGDOq8MeAA9wTg2SNT5lBZhssAmfRZjz6
	9RKxOL6axledD//CFMmAVJR/dyfYnrr2uk/1YJOg5hL5pAeq/u9o48jk7B1WvH0xK1y5UPDyN5c
	mPIGPj6YJoJLVbAfbVaOwyQU5fdo+YXHJQCccp8WTvGb0+BgMXI9uJO2kDQIVjaqE4e2WjNPjg2
	OPQh2AYtqrUwU9la+nHRcXZ1WivtfFskI21w99aVQ8gm+bH/fkIBQRpEnh66BzHkjhX9Ob96zcd
	f/QXoNb6iz0LFosdqOqE8VaKBdud+OlK/PmYNmW4QuIvOaQ9ikp6DxepMcVgZUA0Z8+iNUFL59C
	+8ROZjYx1QhaH5QcltkL5cNIAhbxIHHmpyM4hXhShVaaqIgQ/n/r3V32l3ctg/St+0I5sNyCES9
	G0L5LFbVXYuDM59Of+knIyjPmQBtyvpPF1DlBOnT1ZbQth/NIMSGFVuhO7mtQhipIM8EKO87Iq6
	NPEiaBQvjFUlHwc5P/ONRjHwQaMrxuSjdGZecJRLUfIhOBQr7Jn4P1/7zbABOeDot8ao7mi05G2
	c8DmZwF3b2fu9ydPZo5dpMK8Br0cw8gDQDtUyg==
X-Received: by 2002:a17:903:3c24:b0:2ce:b7b7:30e3 with SMTP id d9443c01a7336-2d035be663fmr2561125ad.17.1785365644825;
        Wed, 29 Jul 2026 15:54:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a16088sm17373155ad.9.2026.07.29.15.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 15:54:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: BCM5301X: panamera: add phy-mode to switch
Date: Wed, 29 Jul 2026 15:54:02 -0700
Message-ID: <20260729225402.775442-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy-mode is needed for CPU ports based on the documentation.

Fixes dtbs_checks warning:

switch@0 (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rgmii, not internal
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index e02a7a902f72..610316be475d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -183,6 +183,7 @@ port@4 {
 					sw1_p8: port@8 {
 						reg = <8>;
 						ethernet = <&sw0_p0>;
+						phy-mode = "rgmii";
 						label = "cpu";
 
 						fixed-link {
-- 
2.55.0

