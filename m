Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2222D7D3A
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514227; cv=none; b=avt6KPzggDewgSnvB9cP5RBQ8iZjGXDRgVAjFonInwD2drWIYskh5R+32Qet2kXyujhfdWO9ZX9H6B+YqEWfMmKWlUzDzzRDx6kX2BnLh/Bpu+sQLw6zZQNddckDjnsUbnXZP/a2hJQnZqxmwphjLWA2HmatEGMMRFGpOIhhke8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514227; c=relaxed/simple;
	bh=zpefvb4+CzckyglM0e1evuxQAiU+BTEuiEUChrJ0Hg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YdOb2V22AHULY1xyhZkwRlObr555Qla/YQkx76b6yLT8SoqXZk6gHYEDcdcrrl1TfCyofTUWQDR6dtv+yZxH+v1cjH96TUaNkSmMKRbwzB8BCO/lZ6fVaNAaJox9Y4VYCOK3v+NZUWYGgwm/Nf8eBT/E96vcZ/VOs6H2tWPVs4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yMs8ACwy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yMs8ACwy"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43eb012ac4fso217178f8f.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 18:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514225; x=1778119025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kr2cTDfHGDksP3jgY+WcfLwMoeO5l4D3sr8mkWZf5zI=;
        b=yMs8ACwyp2LLHMBbzJg0FaMiK/rwhfZxjfs4SmvfWa1FKfRbWIzE7ZUjCJ8dkj53Wr
         tRJ0eW7RBDi+D8UPN/59+kaWFYyGOXQpwc7yztC07ck83VxRbtxCfWu3JgYD6lMdDukR
         /E/5SdPtGFUh9KmgcjWsvwCBHMZvDYT+wf4z1aqE2eA/cZMY0veqHDp9MsBBKmxGbPTj
         SuPBUJBvxZKDgQDlDYrKfFjGgQ/+fpQt88A4q9onDSK0G8FXgsjD/AWYtAizAPtLOVLJ
         nswH1VR/K8p18eYws2LP+QS/aJPMzG9tCKRKnfIz7AUsHjcnI+PZgY0N/WfaZA0hAszg
         zveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514225; x=1778119025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kr2cTDfHGDksP3jgY+WcfLwMoeO5l4D3sr8mkWZf5zI=;
        b=GI7DDgq5rcB6ORq1mOUY/cItngevBcgmOh0RDXTcjmyTaYwt8K+zoZLCPcHjHhKZNB
         zRaRMqORkhRUW4tuMI8a7sk4Uxl6WQSw0OKphwrAjjFT2LRakupkl11SgoQo7Yoh9Lhy
         9fk5C2riXK83mw8WskZ355w2a/y4fSew4osVFXdLsEMS2KFU+2AKOUDNzF5z1n77vfg3
         +mbRt8p/FMixQBwTWuL+hFyrjXlIYmIbqhwCFq1oMDftQ/65BmVq8RlqtnrRfdoyDe66
         wAUC5ItjPfOHcZAjeexb/9lY5qj9TgjNbHg0VtiQwPr9R4KW1PHg4hPHlHMiADlqkj1x
         0r5g==
X-Forwarded-Encrypted: i=1; AFNElJ8Ou8V8IV+8dq0JstZf+WezBsSTP89lcKU/mo470qjiHn05TOGrHSQB1ZvsKGhH0TiCFuwJSQ0KcyAC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5GZ2ktBh8PvMRRTZzBryhU+6QmWeKCnGZMR+MlCpd/KUV2lBB
	lkANL0rXe5aB1D3bxLOL1k8LH3O9TYgjBCissFgp0kUDRbCaXAZUvWbx3xt4sjOCAy8=
X-Gm-Gg: AeBDietNK63hL8NA3G9LP1YjWkLPtCWZD/Krw1837wW6iUoZojBr+1TTGYbkvordlP9
	BJ/RZpiRuKnSdiK0oR6szCNB+mlbaA9pwENr3PNsucGm3vHfK5CSckij0UKavj5QAY3m7rYZxDp
	sF9QFNVePeyMNv+Ok4MbKAu84wrrsItDb8tGn8NRABQpJ8x/kxQx680rH5Zmbmu/KovZdSB3veU
	ESjX0UG6y8iLPqpqEFuXFCJvwyxfLPyEAqzTD8by+MQEjEc9x2hEJN8QBqwN1OITdHu6/ekqQSE
	IGUdbgjmg+0O1pSeG1Rya4ZEXf2+4rheS7OJj/BLqPhw/0NcNXp9U422NBgA0SwxAqyQRP/r/A3
	Ic9bn0OjlnSBE6RH2hjvjmljEsUnTq7ml5N/BbSxqtl9VAPoplptsSSjcrO7PC547A9fwijNBHu
	PYYpTklcx/F0BzkXB0dVAzkA5HXwwuSK0tgSfZy7Vg74o0hV88jT5AI4ErdjnYLm6Vfz4u70bHr
	CXWRt1+pccwBZGGe0YZCzRn+5E=
X-Received: by 2002:a05:6000:1867:b0:43e:a9ba:b194 with SMTP id ffacd0b85a97d-4493f1307b6mr1254377f8f.34.1777514224614;
        Wed, 29 Apr 2026 18:57:04 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:57:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:56 +0100
Subject: [PATCH v3 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-6-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..04662b1c5458 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -231,6 +232,11 @@ reboot: syscon-reboot {
 			};
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		watchdog_cl0: watchdog@10050000 {
 			compatible = "samsung,exynos850-wdt";
 			reg = <0x10050000 0x100>;

-- 
2.51.0

