Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D0518DB01
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 04:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775189262; cv=none; b=rAPHlasyRX79PPkx2V6oy2dSdmlGhl/YDMTUQ72W8ZZm2HsOpqqBx4lU34cevbZCwsTLjgUMJsMeYNbbbvU2v0cMUPQ5BD/W8xB+AylBnKEDveUZVgUHRdtYkaTOdF3RckTDME3caZxKpXRnuGYSS0rl5jlK1vb0a3PjGWfxwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775189262; c=relaxed/simple;
	bh=Pid7hTafOZC+LLrMLIawjf+RXr0bKIf4ja36qYzJILw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgBarEFma5SD+qpy2vuKUszgSndj29lehJpPccMruLPYw5PNxHbX7vOcQuzdF56GyHlCUS4VE15yZg8SrYvPA25eOHEJLI9RhWsHrcc9bSbVYJrNCwlQXaO1gbgpqfvtNIysS1Im/VgBsI9Y5fMj28ToCESkks05yC3XRMhh4B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q538iIiJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q538iIiJ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so645155a91.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 21:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775189260; x=1775794060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEYIJvEIn0om0NJGkMkijlcVIHQGMYf7Ieidykk7GMQ=;
        b=Q538iIiJ2tRsFhidb9CGbVK2HmPi2OxOEZx7kirEqbVcjdWqhXucZMVYUwEACN2cMD
         voEJjzJhCal2W7VySnNXdUKE5DcQD1PT1L+eday+AOAmRWY1KOrFGiDCQ/BCUT00KEWs
         tQM4mRb7/40pIc3wUMGKH3os5ZTV0bB5kTvXfP+AEUz17zHgw37THlVD7h+ud598IPD8
         NEUO5ef3zscsUA5mRFQKdlVKTKAsTcQJQj+j98QPQNIl8iEDOOXevFPr3yXhP5OTpDZE
         ddmftGZbt8Qy+JFJDnG8E98FX1F0Twu3kyulXYSIgbGLRwF2Ac8W/q8k81AwQFW584F0
         U0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775189260; x=1775794060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEYIJvEIn0om0NJGkMkijlcVIHQGMYf7Ieidykk7GMQ=;
        b=f17CH6crnTeNF4dfsxlPtxxrR7rrvoB1bk2GS/AEKX7YzdZosMS5iLWXgy8/jiCMSg
         tSWh7T395tRe6+8BT00aEhV3JBQU4IptR4vBV3DPdndupmq3Dq2AWoeD+3loeYydZaAC
         ivfnQqXBtaf8YnUs5gv+Q85gCgJ844RAvVJWk7zKJ8DHAOYkAWw1fCRdQ8MUON1324RF
         B0pxN7SUoiuQbyDglF8pzvrjaRursKGlrelJaCIgt+qXMQOpfK7KDVDKUncHEvR5Zdlw
         +N1+KsmPzcwlor1fg11mLtPe5nTPJfQpDyL6Req6yJB3rV02sZ3z8lmrIAPps//f0ih3
         NJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCViY0IrLycWR1ErEjf+hnFm+NnNNBTQf+yKfTBC3y8ZW9ozqd+jNMPD9FnYAIcZV1y79lgG2+qtBJMU@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPk/kh/CVS5ehKcMCZHA0u/ZR3pb4bITu55+/kl92YMXVgdnJ
	K17UtkNGP0MF8VaObYtbzuEQGntdWFbDE6/BFeVLzzgJtynw8PRkwC4z
X-Gm-Gg: AeBDieuRl/idSWBehB/EIdqw+NObJvuG9s1ZTrkaCrnWhviJdkm2S4lRcgCkCxfnplR
	9b64Oc8uN7u85K++UJGbxonrKzF+L1VVCrnny87YXXTAgL+HQrpXvExLS6Efog8m5Z4/3cyroj4
	5xQlZl2etdSLceZFWmi9osxDzkbkJ7Sj2/E1lpdFEnq1VvUogclO8AU8My8OoVkzr8zqyU8FAJk
	g8iMIev6MOvDatWU+W5FNgxlXLntWhY5BM7Mhv3Pso5brKBfqbN34Rcbxe3lwXUXN9TWJZ7Knat
	8FD72zGshT2eFJrC2YlBHx95gv3TjIppIu3rp5nqRt8E2AoJdxc8Glc0F52A78dApfil5dsRfZo
	dXilDAWY6fPyXP8cVFjFqDcUYs6HCJNzGDF1rIHAgGGmKeOYGrRnsWY5nBfLOjNd7CH03CVS+z+
	EOpO/WPmVOxO21Ie3reSUHnq+mTMEfvDojnWZLhWI5xfG1OTZgHnIcW+UKoQ==
X-Received: by 2002:a17:90b:47:b0:35a:24f3:2c8e with SMTP id 98e67ed59e1d1-35de6894809mr1218653a91.9.1775189260493;
        Thu, 02 Apr 2026 21:07:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe977031sm9483779a91.17.2026.04.02.21.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 21:07:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: robh@kernel.org
Cc: conor+dt@kernel.org,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marex@denx.de,
	mingo@kernel.org,
	phucduc.bui@gmail.com,
	tglx@kernel.org
Subject: [PATCH v4] dt-bindings: input: touchscreen: ti,tsc2005: Add wakeup-source
Date: Fri,  3 Apr 2026 11:07:14 +0700
Message-ID: <20260403040714.106093-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Document the "wakeup-source" property for the ti,tsc2005 touchscreen
controllers to allow the device to wake the system from suspend.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

changes:
v4: Drop redundant "type: boolean" for wakeup-source to use the core 
    definition from dt-schema (as suggested by Rob Herring).
v3: Remove blank lines (suggested by Conor).
v2: Revise the commit content and remove patch1 related to I2C and SPI 
wakeup handling
 .../devicetree/bindings/input/touchscreen/ti,tsc2005.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
index 7187c390b2f5..c06a85b74533 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
@@ -55,6 +55,8 @@ properties:
   touchscreen-size-x: true
   touchscreen-size-y: true
 
+  wakeup-source: true
+
 allOf:
   - $ref: touchscreen.yaml#
   - if:
@@ -97,6 +99,7 @@ examples:
 
             ti,x-plate-ohms = <280>;
             ti,esd-recovery-timeout-ms = <8000>;
+            wakeup-source;
         };
     };
   - |
@@ -124,5 +127,6 @@ examples:
 
             ti,x-plate-ohms = <280>;
             ti,esd-recovery-timeout-ms = <8000>;
+            wakeup-source;
         };
     };
-- 
2.43.0

