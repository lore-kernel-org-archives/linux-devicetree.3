Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662103;
	b=q4zGlVoIzQWPXzj7pyxOCd7/0tVJLfoqsgjBfyNEi9YG3PTBL8TiNryVAjZJLTyxLHBr
	 b1G4/JcXE1Pr304f6ZAYgxz8d64ELY4x2fxYTyOGVNdgC6w2qGhNZMhoxOvD26u+NAn/3
	 8Y1Ha4/DwEDWIf7JF62dK0uJh6E/nX2dtG+9sRHDajH4uJJL/wHLKfYQ2ExAZNyS4d3Jt
	 75/uSM8fmK+cqU3q5yHCAUs2q0iuPdzG5lDwTSM5autsHFiAtnbgVztfE4W+/8TUnLzc+
	 TMpMWxbqoCExecWwicxyGedqjAj+ywFLNvMKvy5YizdT0ycXdeghZMbgEm7t/LZc1iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
	b=Gp37JE/c5sDFzCYBnDLbb9rQfNeRPavevImfw+ZeDgUDEiWDkOpAcE2YNHrOCZGa0WFt
	 o8T4dp176EU9FpUgrgfVLtXBJ/Qjyu+hukCAGyXdIHGOhNFwz/T4NEfReA+uZAWEZ8c12
	 sdZ3GZEqBFYszQtcp6S5DXsWp4SwYCGno6hfG5stZHPHV0S5k586QevJbSeZ+5jW60fJ0
	 832LVSyHSvyS3GdUodWc5OnCcaKIUeiMW/SlfuLBs0M4MZOy8bnAfmi/h78NfrfWNgxSF
	 rJn2dbmCkcfuL158Trz8SxlWa9uG+zTI2Zg1I/6+xLJdTEudVRiHpnLjKf++Cft3gbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft85iyEp;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320E1606A31E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 320E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft85iyEp
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ea1e7fad99so8099845ad.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662102; x=1793266902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
        b=Ft85iyEp/12SfLEwAij9mE92Qr0ZiQXzSmTKtFfmLaSrmJxg1uOe4AbPE77e1Efbza
         WlbgZCwprEcvIugCo3kFPmDksaKpGt05pcesVs+k5n2Qarm/yYZkLa+R1KhJXOlFsQMW
         2pZYasxHMnAIPQsFFEQ7SxM5pU39s8R8rEw3PAPDt80ATC+3qvJHWeov/M0NBoGUAgMn
         9OjDc8Dbd5x1jP3dkG61kmki85Vrn3IfBSKbHNghQVJD6ZM7tOISdEKQcgI3UyC09lLP
         X36CYvLY2uTLdDnutUqm7V9mvt+FSIWsf2nVyk8i5Lh/sxNiPn81hIdU5SuAmalUX/cY
         S2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662102; x=1793266902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
        b=aUjSGw/ei6NL3xKltA4pplPs6D3tkRm51G2KE/EbDktb5hAEFuko0o6dpNhlVc5lQY
         34X7aN6E8BZWrNe0Yuid2CxGMs4mLCVuSlIoqxR8CpaLSxrM/ttiNh8T7n2L2rACNAzS
         R3f5IVmZphyJPS90cfCCa/A8QpsGr6hZ90bXmTFnkMix3n+M61sjUSzgYlgdVzflOxef
         PEa6OMjMUi/xuFAwvgNwL8KCLZjDtE93d8ki78sS0nk5QpL3hN89beLq5aXWnvzjUXW8
         KW+wGYGqkPF3iKU8y5L4CpUTlCH51wt+lPO/Lm+kdeJJPViENGZeZKIWlMLanrbu3Hox
         PKfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzM6rvYeUwA1n8RhJ5PcjmiAUXvhhRfY/37KmSWhmgRdXJ6D+EQQMOLESkkTIMXjJl3PhMnOqu/YGNm@vger.kernel.org
X-Gm-Message-State: AFq9FYJv+ihuireX9Vuv5kjwfl711p/d09SoVUiU8AhGBj7Rm5g8ANeC
	elOlbNrk1c1G6MbWxaia8gPTGo9nVRO5+TaklcX+aINQWu+Xq3c/sZry
X-Gm-Gg: AYBFou2ipXzL9mF8ywYmbJ+9wnJhtoZIBI1wzZbDPjDjEhRu6u/drfoFDRyq2NO+EiD
	uFzhsfq6AdX5dErenh8wDksnlZIBzETQkI+sF7NAWt+YXK5BQ9QwVgrkp3KviNUIgqes42PtFwG
	agkdQ/frPttrMFio4Gb8Fq0gh2OQdNw0/Q31uElhMSFyoS5tPlRqdh3f8wTQUPL2fpruKiJm0Rj
	TlyOqInBxm3rj/d+QIB/ab5vCuaj+dEhAilG1IvVVQwzo5c0j0pCnXIfpebc4/f/K/joAj/1s09
	zL6lwvCNAAaVkLlezQZ0mddc4sfnnHq5hdUIgRnErrYu3iDixFl0LI4x6oAzqfbnJh6nustX3Az
	nLyr0wb9bWqoituKEnZJCUPFeacU5nwAky82hV2UI2lgovFeFbTFzuUTj6Wr1Rj25i9S+aGmZ7Y
	wqzacaLwLZyFogdeJo+mtgJFB1ryU+5GPFRYLgX2V2YNFgC1rNdMjp+2lFHBI8fF8WfeqoRyQhI
	hfZ19vWdoypO6idZxhX8LI4ZhuRW0gA5HRNMsPrEs6SDqhk
X-Received: by 2002:a17:902:da8a:b0:2e9:660b:35a with SMTP id d9443c01a7336-2ea437b199fmr37175735ad.3.1792662102554;
        Thu, 22 Oct 2026 02:41:42 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:42 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:10 +0000
Subject: [PATCH v3 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
call is rejected with NOT_SUPPORTED.

PSCI provides no call to read back the current suspend mode, so the OS
cannot tell which mode the firmware is operating in or why the switch
is rejected.

Add an optional flag that tells the OS not to issue
PSCI_SET_SUSPEND_MODE on such firmware.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, rewrote the property description,
 renamed the property]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81..2eee38d155 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,19 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  skip-suspend-mode-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Do not issue PSCI_SET_SUSPEND_MODE.
+
+      Some firmware advertises support for OS-initiated mode but rejects
+      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot report
+      the current mode, the OS cannot verify the state the firmware is in.
+
+      This property is an assertion that the firmware works correctly without
+      a mode switch. This is a workaround for non-compliant firmware, only set
+      it for devices that ship with firmware known to behave this way.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#

-- 
2.56.0

