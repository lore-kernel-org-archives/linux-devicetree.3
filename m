Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22763F54C6
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066040; cv=none; b=uFXW4b6Z7Wj939KZT/GVYNxgxSUTPghqb88+uqEwrkxWe9QNsJXXVws4bQf3uQIGSOZcim7oKS7+J96tyPNhLNsbFfOBZH8P8ZPVu5n+x+D5c3/qDCKemcWbl5/hf1IOwTNQkJHm9uA7uYOF8X4DRzzUfV3ZYzl4O9dXEVeZmo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066040; c=relaxed/simple;
	bh=seKV80WQqADp6X9IQxzN5j/LZjqS4BqMVBegZTWphjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmfffRVyJhKim+a4B9qy7pbot3FlvZ95yiEbRFjuAatEPtZgCSLhsUxWcUi0rK7W4fazzYtM/nwLCHax9TxDjcPMgU4oXBgvqICRF/Xsti5vr3WT7j2RVfdk+09elutlbrDHgudgT+BBWrPSGccDCpALcy40mnLu9LKXDN9qMPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=pO57rrV+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pO57rrV+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4908b92904fso26118185e9.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066037; x=1780670837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQLACCGBPsrjgAEDYt5m8Cd843XaHx+Afo6vUVfkCjA=;
        b=pO57rrV+C0/MO66UnGs4M9Lf/5sFxt9dBehcU4lW7c3duEjvcR1Dww9REANd68qinU
         e9or50XUd2AClrw3wkmLnKi868LxGecSsTymAw+ji8BmSAnbCRkqGMEP613OTlwqDZ3q
         u6jz+24u1Scw0sbvOVhABnAUojxc/DyONURKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066037; x=1780670837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PQLACCGBPsrjgAEDYt5m8Cd843XaHx+Afo6vUVfkCjA=;
        b=JMxi0VRcLAm1ZTbjEzmRwlhEPhiQjpjt9HUKaLeLWDQxhl146KBbAatMQx0hdTWdBq
         WDtYswVNysyQKCyjAhykp72o3mze4ltfNSVZCytIou9aj5TQL1c18Xa7f0SLrFm8/IAK
         DPay0q2/Lbruzu6P/Hzl0SrzpNMoVaQ3zNION5lmzdraBGQrObLfpLOgeqwccCJI66VW
         Gc43FdYR5FJGpgU36NCvhr0fJPMHr1MOeRSudflZKq8SwRDaPJ+FKGTdA6kEmHOjHtim
         I3WkUO/9KpFN8kxoSA6fz2bCkkQjapFoBZNY5E5gIpCV1LqNQk71oC8qw/iCOC9tkdaH
         c40Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ri8kZlhvrmoWcquMgx7pm/SpO0tCnfJ2Y9ijuLhXrA4tOgqbeX0XtUMuuv81Pv4J7JsqSpTsvmur7@vger.kernel.org
X-Gm-Message-State: AOJu0YzNoReBovXyM6R0QEJZZ0NtjlLtDDJqB66az3mScT3C5KEjIKcj
	jpunhnOOb81MdrMIU2IZ+6obf7aaYP0//ARMXAYF/MmXArOGikJm1pXMGwh+K9z8a9M=
X-Gm-Gg: Acq92OGp9lG6St0ShMUrbXkGKr3QhuD2s/PS4z6yTCkuxshVZi/sUf8lhIq1HKc3unW
	Lc2V1iDSesgPOpkFiYWX/9UgpRqIDP8D+68YHNSlYGcMux8t6M/wxMhCH2lXzHppr4rN7/min16
	CtGmqyedU9NTF83IqGWn5BJhV/ga7AZ0H5SUINZO/V1as+ODa1EqEqMRVNAi/t0iJkDHYgstwP5
	XhSOfTbiIPMO7oSv8laICfNl+IQ/+HLLDXbSgZyt45XRSTaU/v4fzd/wkGAcisfVyN/2PkCeKGq
	dWvixKYH6mrQ0QJz0QArlMTWHsRs29d3TKmMDFr8pFlNEUbC/m0Z8VXX9cnymGOuvlJlj/r+c6C
	38pLXz9tEC84XAho8QUwOEr6uzGQgHGSr8+MiCMcSHqq27d/ijZJ3qZtKR36WI82UrvJvr7eGFt
	T3aYr40CLIibo4J+F421OzTHiAPWHewZ7DRInu6euaPnvmEM4E2zZz7LGfi36zKaHyb2aRDyOsa
	CAE5x/NXsNQBrAopWuQZVRmvM0FqSmVk6n/XtDjS9GlQjuBw+S7oAmfzmBx/Mz5i9lxBA==
X-Received: by 2002:a05:600c:6995:b0:490:8a16:fd49 with SMTP id 5b1f17b1804b1-4909c070100mr60190665e9.6.1780066037303;
        Fri, 29 May 2026 07:47:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 01/15] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri, 29 May 2026 16:46:15 +0200
Message-ID: <20260529144707.3931919-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Engicam MicroGEA-STM32MP257-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..c5ce81e3ce45 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0

