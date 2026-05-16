Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01F5380FE7
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778922543; cv=none; b=qbuz4yi4UOSPz33JL+A3EivTlLcsFf+TF/n01nwO1/tjHebTKQ0jSGoyi9PyE/l2hh1J70vvyDKPmwUp6gucQWKBGRzYcesTQfIqri+qDrAuYQXPFKFqfZ20Z1vIAQ1ZedA/CSv77HurG00/FIaqH4MYdWuWN9bBz7bx5V4GCUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778922543; c=relaxed/simple;
	bh=FXboCykBhLUIndsG+vtr5MSXMPsvpSXgEuMQWktwGzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRTEIVoKKGLAmk4lM5zendzjVZbUdBW27dXi2+/9+9I/upftAwLlM8qFfzxY+uPzP94VmUiIuG3pSdCxE3EOiOekbPVnwyIGpMenL2SDJlKpbbrcE396jJr1yvm9qov8R8Lc6xMnKA0TKir4/8Wfc0EdKvjECe3oF5M4N5S1Z8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2ttFYYo; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2ttFYYo"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso1788136a12.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778922540; x=1779527340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNCsYy3NStJov2wLEidrFREbUcyjTnV5T0teBfOEPaE=;
        b=n2ttFYYorYlZFvfWHUXGtglGnQs9nPQIkN320VGIgkiym5EOLhp51aGlMK+WEfvF36
         wZYmUBY87tGu5N+NQiVMhXbirhd2WSfLJBZ0aLnD0UThfwDyvR79yAToY6XM301lRfRk
         9hrGziuIprMp0G4Be2Y4G4mM96iNfJt/v1P0L3fa8djAPy+bgOFegWTmvNQwQXxc18dp
         86sU4JuXnxMxaFdzNLtBh3qaK0sClhmXi4UfXRV/GlsGIrhG2+e6KJSijb7Evyc8ehxb
         QOM7siVrMBJb6au73h4pMT4+aLaAZdrGYAVRV4IEb/TKTrpVO/L0OI0OXRAMQ2T6PW8v
         0DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778922540; x=1779527340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNCsYy3NStJov2wLEidrFREbUcyjTnV5T0teBfOEPaE=;
        b=BZW5j1QcHi8l6hGPxnmnTzZiiJAsWBHqH/XsTYwg8F1AjW4Zuh+fNsMRrOLA4WesDD
         2/cK9JOUizaHIPloshMTeHpya8e+yLMgckVgymyzx7xR+7NvZZMZ1AkErGYCqrh8k6Ct
         OPRIk1YmMYz1axTZusC627lTKK1PRsqjtCB/PTD/Osd2IeMh7K16pMVS+fzcy0DfpJog
         rXVwGj0YQ6vXrANTNOHXCNVu+0AFNypT3xvnn7s//i+A4JaVjx4oC7HDvWAAwOzN3TYL
         uBMaIg639oINhkW8BR2H8jjaYCtKJ3T5Tkt1dKo7ppTN+YQV4Xe6yccbRq571mAiAQ8W
         /c4Q==
X-Gm-Message-State: AOJu0YzrKYkXYqZdfZUB69nKOPxd0P4DyIlLAW/I7asCxroZ3KohBX1I
	uWnFC8uhVt1RVDZ6mai+szPrwb804NRtOyiyG2FL+Sel3Pmi599nhtJGja4Dztuj
X-Gm-Gg: Acq92OFF8H3PMfrSsrSwOePGiq/2fYbPrX64u0vlXNmuvZ5eW858VIvVGegAY4qu0tK
	juTEncFnSO66eJ6ruOdK+XBDGrQiExNKWW8jFYhmK4FiX6FLvIyIsAJcik9fr7k7s5Zi+aj/A3l
	m7CCZVYiW40PfwhhX04cuvdO4+AhhAI6mnsY5+4S49nrXjrGudUqHq0rDtJiGOd6x5gvJOhMlG0
	urEXvgm3DagtEq7exTKlO75FbCKIqA9edDEZhKGpdYuy122ViPOiTETUZHdmepieZNdGFMB+Zdd
	05TvybFLW7l3Zub4KY1F/Zygy6tU7kwmoh+89v+qEtbK0X5VrBHlb1INwXy156sEyZkBzJ0nUnm
	3GwXnZJRBwPa9v/M9nowMNUwig3EAVGpQS5rDYBdUNpeDrFw4bUYkFj0//xLoqJDSRaB/AFU7nc
	LBN6PiEZD5lGXyDL7+3vDv2DQDKVs2CZ9yzamwmekUCWNu+oyncGJWMz/O73NO
X-Received: by 2002:a05:6402:43cb:b0:681:2472:76c2 with SMTP id 4fb4d7f45d1cf-683bc1b047amr3375494a12.4.1778922540001;
        Sat, 16 May 2026 02:09:00 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-684744d13aesm525848a12.18.2026.05.16.02.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:08:58 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Sat, 16 May 2026 11:08:51 +0200
Message-ID: <20260516090853.2873223-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260516090853.2873223-1-zstaseg@gmail.com>
References: <20260516090853.2873223-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
SoC.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..575ca67c940a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1041,6 +1041,7 @@ properties:
       - items:
           - enum:
               - nothing,spacewar
+              - xiaomi,taoyao
           - const: qcom,sm7325
 
       - items:
-- 
2.51.0

