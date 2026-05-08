Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EBD283C83
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 18:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266004; cv=none; b=Dn0Y9CcG0Tsw/UGPsg7+xZ+I0sBD/dWO9dMk7a5l8aqROOZNgtSLHclyPtqQbi9pTjaO2BJFlwve01/buQ5+c086hh20mYzBzfcYHUl9LcPMOPaBsz3hzbLyy/QQj/1sY6AM6Jd+kr/lFb4o/8mn3BA8IrM7NpH1G9580sCgssA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266004; c=relaxed/simple;
	bh=dgL1CIuswNSdc4LrmMhh0E3H607UoGQppq1RIGzbSWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iUcVop48Sj7BeJEl1SFhHt2WKjaX1T/tzT/U+3bOVmgLGyJvnM43oV8MJvpDbivitxCnKLCBPPK/iAdiQBx8Fw67hYNAW4O7cyHoKE3NPL9xseM4J4rDpHVm1fsINE9hYj4Bcwpo+pT97PpnposkHWsxmDmoI3HUyX/+F7ngmCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpqEHIwi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpqEHIwi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b9ea536877so16124645ad.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 11:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778266003; x=1778870803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8T4V1KOUS/zQQGD3wOEYFO7WBlAjbkL/PMKx62SumA=;
        b=ZpqEHIwipDBeRa+sVoaMMA9f5SOglXglel/ZgPHfuf7MR5C0p25OTX0Byu4kUWGaSV
         wTjm/AHoz7w7q83XwZGaoTPHBNDISzT3EQjunp12QlekYCvzIbhfuxejlQg53jcVBErC
         W2lM4nPU2mWuo+ZcmZSFquXmvzVxCWQBAxGaNUl4DYahaJSas06hd+5dnyOYsnczDfd3
         8RbwB+0zrlvO73t2DbEQOYX+mwJiNRoKgYjuLvS27Ms0LGyK4iugOXY9kYDt12Yzzz0l
         qoxZCr2puQC8jrPL7SQPOUrLKlNUxuksENvIdv3WkbI5zp0tT+4MBf5y6ZhsykWLK42w
         VLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266003; x=1778870803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8T4V1KOUS/zQQGD3wOEYFO7WBlAjbkL/PMKx62SumA=;
        b=U8ZjHsLlCzBHe2uufh3jkC3Y6VpN6hcoUBQ33XoloObG8zj0F8JalL5n3HNZlKwP+/
         aDJ6w7Ip5ug6eiugCds2o/eE7iQKfBran99umo2jnd+lsweHEDNoQ2K+I7pXGPQtuXgX
         hMQJPN3BAhCewWK8kwtuBRYWTTOlwVtjSa42+p8KMecQDm9LJGnAD0orIL3CZerHoUV3
         /eXGrv/IvuZUOr0wZb6z6ALrL0EksitLaLWXldp5e7rEqelp6FRlOc+US9kmyweqKgVP
         t/GXeBll3HgJ0kfiLGf3m6tERqJbKCSizb/Ol+d8GmkT7G4GvlEc5y4e/xAwS+KEFAL0
         oVVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FOP9n2XArPK/rW6MwZX2ZzMO+5iz4InrpOvZQYf8kjKEIqBv273/G/spvgHcKmXGxe62cIBPo1ykq@vger.kernel.org
X-Gm-Message-State: AOJu0YwRcg7inyjzVmkYQB1XwWx9qAtjoP48SlYd4bdnhZYcAZ7ekerd
	DjIKddSGdKCTu7D30f6AV6sAWKb/b0QIz/zVWYONUPrw1U/9/xbf4glW
X-Gm-Gg: Acq92OEFH9k7uBbTPktDlJSf9/NIRPVNRQ8tRQUY04GjEllm5ufjVJT1Ggu6PHhAhyP
	J4Vz3r8ozT73gjRfJ9i39I3APDeHgiEQeChKaf7kUHpuny6090qE23i44ozsbcwJADBHwVBLOuL
	LrXc8/r9Itvx8JMECnQnuzhetkHWuuuF3HwDMYKFw27mxrLMAEunVi44GcPMVMf6nZxAMQtJ+o1
	kWp1Imd6agYSFOYAIcAkno00naVxbWLPL1HJuODdsT3mVr8n2EY91+RKUah9c/OzhRNxgUbfmFT
	P2qk28zDxZPNl/xacBA0P3jcfwgZBmf766iVwV4ibHdzmtcG5vSVImit7nnMVOgjynRceBpsQfW
	v6ssBPWd9msEYde58fJPukLFie+W69l3PAo9iaRxr1tvvyZxiJEkWwMbszoMmrxjDFKDLtM+Kd2
	Mrx/1xCErIzKphpyguZbhL6LnzSFGlyYABW2J+evqqRGaCTQInHTkYQaDActejAVi1DPs=
X-Received: by 2002:a17:903:2f46:b0:2b9:6cde:c345 with SMTP id d9443c01a7336-2babd4a4742mr76227935ad.18.1778266003085;
        Fri, 08 May 2026 11:46:43 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e89d43sm30926035ad.63.2026.05.08.11.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:46:42 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: ukleinek@kernel.org,
	thierry.reding@gmail.com,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH v2] dt-bindings: pwm: stmpe: drop legacy binding
Date: Fri,  8 May 2026 18:46:26 +0000
Message-ID: <20260508184626.15938-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The st,stmpe-pwm binding is already covered by the MFD schema
Documentation/devicetree/bindings/mfd/st,stmpe.yaml. Remove the
obsolete and redundant text binding file.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
Changes in v2:
- Drop the TXT file instead of converting to YAML, as the
  functionality is already covered by st,stmpe.yaml.
- Update the commit subject and description to reflect the drop.

 .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt

diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
deleted file mode 100644
index f401316e0248..000000000000
--- a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-== ST STMPE PWM controller ==
-
-This is a PWM block embedded in the ST Microelectronics STMPE
-(ST Multi-Purpose Expander) chips. The PWM is registered as a
-subdevices of the STMPE MFD device.
-
-Required properties:
-- compatible: should be:
-  - "st,stmpe-pwm"
-- #pwm-cells: should be 2. See pwm.yaml in this directory for a description of
-  the cells format.
-
-Example:
-
-pwm0: pwm {
-	compatible = "st,stmpe-pwm";
-	#pwm-cells = <2>;
-};
-- 
2.43.0

