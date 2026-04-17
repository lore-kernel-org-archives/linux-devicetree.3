Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFEF148850
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 02:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776392358; cv=none; b=oQhgiKB9WocDSaebfg24/Jh7l/umyR2EHNOtUomazevVu2Qgk6EwsLVqkwR3W6XjCGUaX+t2OM1ZALvmFxGicPqAVbqd11fSOPuAJ7l12QTO4yCNJHCW5wbg5SG5nu/bAIX4gki0UctHdetSrPbLdQV7ySKJiaQtuXxfBIqv9z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776392358; c=relaxed/simple;
	bh=BO2i1/v+gTWrIcLiVciQV3wUwpKBs4fxw7jV5qK2atc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pLbuqIZQN5liVdqesyMDYdIZUB3e8MxVwoNtDeMo4/W1CNmDonDF+PYIiynCgSlp99gLiDwmaXHdLhQQnU54BqRslH61dXZkEgctsmwg9T/DhwmNxe7m4gNILT2NlhP3KmeOoUuK/5rg1DsXtE9mTwPlm8708FOzQAOFOipVFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1wXakc9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1wXakc9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab46931cf1so9670555ad.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 19:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776392357; x=1776997157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UG8pXz+YVfOJAlLhN292spUHd5vpocuDHEllV74RzpA=;
        b=J1wXakc9nowN9rQu/XyKbQemkmtz+NmL6BxgMjFC3Eq0/GTnFicO01cMReBfL4fVEK
         zVsB5Gc59QBSu4TOuZzSrUgitzcIS8IsbLUQAENU0cwImck/pX1X70/DUMkBeaR6qDLw
         fyHbmkc46RensyacCpopXoy5mokxepy6ihcJ/FAFzpjPO99kmMNA9x9rvi/PA27aqdOn
         nGhvGSSWUaAOMmGU2O3bdhMA0swW21AdGsoy4FsQfVXH/7eAFUG8vcTvcvgWdd/Tbq+O
         akztTWmhSNiN5+bCdd2sjbSbcRL+5GbpmWOvsk0uuj0d6/W8SSIZhHVPMs979m7MwzYw
         vS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776392357; x=1776997157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UG8pXz+YVfOJAlLhN292spUHd5vpocuDHEllV74RzpA=;
        b=MYuxk74K100etAqEjy4E2SIBLIdVEzx4ATQ59HrQwVdpokImFqZbPXTZwdx9xntQGC
         CdWRIGkfYZp5OqSXgE3jXK7h/U97/zLMmWtrnFMttbGdvKe2DdFUzcwNOWZNsxXbFKAz
         BSUYSQV4MS+WQFIwFreLO+iDq3K7iR9iHCadX5GY6t8vor17rhUBOrS+5lBipqtAkWEz
         vUl8DDVtdKjcRWcpnwAU/f6mJ5KWLs2KNGEJF63XXC5IjQ4BbdwzVwODV7TQQrKEd1dp
         A2v0mnfA4w39ZSQKp2+gvPe3IN/vcSrxrI7nkABBJbusyY8x4gYgXeKYeU40LEIqehGc
         NnMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/laKP7n7YKFi3rdhQx+UFF9Fagr8pvABgGiBXjvvasRAjcT0GadQD8It1hl54KHm8QfpWLptI8ejpB@vger.kernel.org
X-Gm-Message-State: AOJu0YzbIAClKmvdLBM7GjJVUrz7bC2OS77kusXFyRpisbW8az9HC748
	CNZjBjMjKcQ1iZrIeakrtglvI0qvF+0s1wPF152k1WWYBZKKsn11pJvy
X-Gm-Gg: AeBDiet1zBWXiHk1zP5hfjPLIr1UUY0cAC0JkB53A76w8VNscbK6ChUGGCOuLWfWXHS
	nW36KJ8DgY2kgw3ot/hV8KMdDAq7zGRgBdT2qK7HPDOUtvobN1FQlXw/tGlK1AY4gpYcc5Qo5QO
	567xpa4RHHXPSsyK8Az15FzLOnXeRMU4J4Vs88pzkLpstZyt+scCLqPw5jvsT71+gvdnexBLndr
	ieqXlHqAZxylQvdAQSwgR9rBtPgSuE2maGXT5cYIgnbTdZmbhUR5L6fnV3y3TK4nv5Fjw4zDi0G
	jRM9NUplnaXvOdfrdkbxyv4Avwo9CbhHEVqPGKXCy+NlY4PtQOH7z78lc6bvjti65h+ctItNpji
	y343UsoYEYCM6dH0R605N7tMseeLpO+sMax0adUBQiEKU6a7QHclWUvuYfoCxUNjXUc/1ZhYmIi
	Fkw2z+C735fgGBBREgGtXkZbjkXIL4rZAjNse2SdC3EjU+o6WUj+q0Hob6upXlfKqn6nYV
X-Received: by 2002:a17:902:bb96:b0:2b2:5168:2f82 with SMTP id d9443c01a7336-2b5f9ed4d0cmr4664685ad.24.1776392356836;
        Thu, 16 Apr 2026 19:19:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm2755845ad.36.2026.04.16.19.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 19:19:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: nick@shmanahar.org,
	dmitry.torokhov@gmail.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	lee@kernel.org,
	heiko@sntech.de,
	gregkh@linuxfoundation.org,
	linusw@kernel.org,
	zyw@rock-chips.com,
	zhangqing@rock-chips.com,
	gene_chen@richtek.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] dt-bindings: Remove the redundant 'type: boolean'
Date: Fri, 17 Apr 2026 09:18:58 +0700
Message-ID: <20260417021858.6582-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The 'wakeup-source' property already has its type defined in the core
schema. Remove the redundant 'type: boolean' from the binding file to
clean up the binding files.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml | 3 +--
 Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml   | 3 +--
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml  | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
index 9bf07acea599..26ea78df27c4 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -88,8 +88,7 @@ properties:
       - 2 # ATMEL_MXT_WAKEUP_GPIO
     default: 0
 
-  wakeup-source:
-    type: boolean
+  wakeup-source: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index 0676890f101e..a58d9455a1a5 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -44,8 +44,7 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  wakeup-source:
-    type: boolean
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index ae611f7e57ca..ec0d83220527 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -33,8 +33,7 @@ properties:
   vbus-supply:
     description: VBUS power supply
 
-  wakeup-source:
-    type: boolean
+  wakeup-source: true
 
   connector:
     type: object
-- 
2.43.0

