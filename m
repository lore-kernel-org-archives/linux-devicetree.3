Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403964D90D2
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026782; cv=none; b=odmIX6tacPWF0K60zaIQYW7b4Rzr3DjVqPcc/dIF5rhImidQvACzjVViJHFtrMJe3ITIMRraMaspmnyXSwhrwEXqgJQ6ZRbZx+cKbli+BnxbGFbTJdKDNCnkr094R4fbsx5ZfIt9gD2ZVTU+58YNB+50ro6gr262Q6vnPF9Wf8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026782; c=relaxed/simple;
	bh=o4lBBDo9eAjT/ZPpvEx+fz0ZaY5RNu9o+ne5xMIM/Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZ+12QEtATz6Qv38zD26Z/8AXMx2XoKNVNaiQODkkz6hYkXhIPEexDwRAb+wPYoVHMkRj9gcPyfQQ1LD1ClfhvxZqJTKwlTWfsI62rOvxWozZ6lOq9gtVebCGqaYIU//JNT2i0Djr/arZJ7bBa6Xk7bXzkZn0HACwKQ4fS9owco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sXrL68Ku; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sXrL68Ku"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so64460055e9.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026779; x=1781631579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=;
        b=sXrL68KugCimECfzeY1S7miTYgupx2dzMsIgGLeK3zZ2Ph+/zL3coz1k95dtE+7YU6
         N9PBg/zYXhx0rwYIaKHgCvCkA5ghHMKHXJlI1Rk8hFvT0zlO79cploXlfNSG2qAwSYaW
         3d6R6opUvC5OKYzOkp1F3njPbgwYFyczYaXm0kSmmWqGo4UTBV4iXk6is54RboKhabmO
         DTm/iqWP4zA3A28w2MOoJ8wVzLgiZ07HTLvomZyPeV5anPadk5Mt1HQZYlGb2WeDliku
         jzzjIMXtJg9NIhDjegOz1Z6G0QW+uycEefCFZyqtt9EfTalIVo9KTgl5mjM1Zfj907pg
         zJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026779; x=1781631579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=;
        b=YYQbmqUBcHu1VyZ1yDQjNEhipCUhJg/PzNILlcJwbBqSzYpX9Rfs6/iU0n1noDx693
         77hT9DLuRFEsGFdVAVs4dzkHOuV1H4xQMTN4WrY6NDwkZlFjufwbkZ/bPFKAjkXU2jtD
         1TjitYO/N7qYl6FUrZU0ELaPhoP+gPiFilzU5lLwSCgmKVu/0qMjzZsqgHVsIrDsJmdm
         1Qk1D3lGbhxgQVflYn8pzwDK34WTHChhpVEUsMHyEjiYP2kN0y14sEMfxj6Mvo3M0qFC
         1PnspANT1qPN+qj0iHJPDCOEuEJeLecAJYSekSvzHIGNulXuPRTUddNmSr4fYYQOrshi
         vEOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PA6soT7CKiHCCf7RkV0NnwTBZDtTBs4PSoDH64W0q4HK6uSKKejIGEs0t1/xmC5uxM1N+eQAvv3/q@vger.kernel.org
X-Gm-Message-State: AOJu0YxVc1xg7UUr85VDj9vR8mbvGLcRtog2vcQtjiQfiJeox0vXmPup
	1+HKoL1k0Dq7pwisOhmxaAxNuyK25+IqsF1oWMQz3+G3jvV8dHasQCWcHWe60jK3d4M=
X-Gm-Gg: Acq92OHvUVs1jcUzEa+uUJlPfNMk3fhGA1KZay30Ss8qNxJqB5X1n4LrA/c4W0XQhCQ
	Ke6a8mLujm5URJA5qPwxrAcS+VufIqy+tXFD4rXiroClrSH9x08kb9fkz3D2phD+s45ZJp+SqPw
	a4YwKSUEE4GWm/nYP8cLQ6ro/BEt2OSMiAS2O6PC7RKF9rzf704KhfTOHy6AHYl7qSUojK3GOsN
	TzxuFvIVMTwTQl1lWVzFsWEurzEnDqdG0Sb1b+ZmMOR18MpjNRxe9rCKxuzteImy75UBFG1arLy
	ygEBx2AAuTbvUjDYMZCEyrK9inouwFcorhelA6askLbSYzhOHL/vqIVtGEFsJLtaptzXZ99PiU/
	hNWJZentr+epAovHuhSBs9a962mYJaDYGW/KqXdnsKeNGf0RdHfsSOVDSMrtHOn8rbtmTkSNUx+
	fHSQHcLHNwew+qkhfi/k6cHYCut3KkhCE/v8rinbdPQ+NbSHMO67Zul2r/jkZvykCI4F6FkIgSN
	i3UxY3/7J9vz/sK3c4zbj6Ydz0=
X-Received: by 2002:a05:600c:a011:b0:490:58ef:cea7 with SMTP id 5b1f17b1804b1-490c25ee058mr358565295e9.22.1781026778657;
        Tue, 09 Jun 2026 10:39:38 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:38 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:28 +0100
Subject: [PATCH v5 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-6-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
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

