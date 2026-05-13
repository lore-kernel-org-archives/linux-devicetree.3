Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EC542883B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675846; cv=none; b=rUrbg3o4uQ2oXSxvbKZyyMGKiwn0k+oOQnMgvazxBRhahXJMKJFWrDN9BRP8L98eRC1km1WdM3p7vW2yJDGD2Rv0T2PEGbSUcxZAcs+bHbDCj9WcxUmpq94RXJInXArtukRGl5lvXcJ5e+lzanafQX/g/JMGleIMQ9J165lQudo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675846; c=relaxed/simple;
	bh=o4lBBDo9eAjT/ZPpvEx+fz0ZaY5RNu9o+ne5xMIM/Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IunZa2Jm9W4GQsLpxkFvvMkw5RN26FsM/Mo9JPWpf9JynnblJZiTAOjviCK6BsWRcMAAlBjlzdDWjaGDijYVM5FvQdwVJ8b4Q9cFz+krdmKtJCQVRIE2RgnFfno111yiXZov7UcAhn3yQUWOmHFqAaOuPMfVXLJctGLjk29xwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TL4Qkhcj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TL4Qkhcj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4585a116a4aso2668872f8f.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675843; x=1779280643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=;
        b=TL4Qkhcj6viuZzD40MbFb+ZFpagp6gVjqZtvHLOYDKmguHnDbSgNNmSBjYtXhd28gf
         6JH7/UNJHVcdiIvB/GrO4RAhr31dVdI7ZTkDohXElSp5KYAvTZuARSWGa/dmH3D7Dul2
         EdXnC4Qd1bQZywsBEmcbQkAcGdWBBjYJs+39r3MEPnkruVtxi7nsOZ19D7BYl5kZaJHF
         FotCWjVdMKBKy6vDY7+DgMZqv7UxgHMJNKH1AN0SB2O31zHnUf7AdQSNcYIwU51YEvGG
         R/GLipBiAywLpwR1ZRtfOCbMaMRpTXPqW/BTIzw4/yofwJIwbm7J8YZ5qojwa7jzChRt
         nv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675843; x=1779280643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=;
        b=cZ/A2N3mEHx2XHB1j9Tq7Eyu00Ou0NR/bGATkPjn3zy8JhoMOXX9wPiUnJh+U8rgsg
         pnFsoQR45nOzNwK6epk3dBf/83ji5dtxE82S3ciqOwU8yRmfCNd2Y3ov+0q1hHL6AZ6w
         9bKAXn9tlqgR6paYY2IeFGNGJs2dgW1JwhAdnHkmm4kxlDuIfGDOa3wiHgTaj5lA5x8+
         RYMtu7Q3H0YbDUCeC3Fc7B221nsuWXcMnEaeXCmE/WTrAlZeO/2va3Xm0IjBv1ZpiMm7
         iqpq7lPvsgv1x5VKI1chpx+cOaUuhmIoUz0PjrJ4956wUHYFtPdNXBubrtke6VC399zC
         Sy8w==
X-Forwarded-Encrypted: i=1; AFNElJ+hS8fNONTJA7dODlYsraTAVK3CJoMGSjdrEZGOG3UZQNRoDcSZC7AT8TPr29+uc+5X63GiDcmDnghP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy379xd8vReV0+KqzVMJ60k+hAdcg2UguoMXz37L3aVjXRcQ5kP
	+2CLZQmf0Ng9n/Bnbi89pjxw4DiMQuvccInwZhUSc35QspYDk6mprfOeRWJDVmtYM0w=
X-Gm-Gg: Acq92OHwNBNOTe2eOLwjgaSMEz6RLaUaBS4WKI3EmbPuf12s4vnQafXLNDGJd/GtTOP
	FXGgxuhDn+JOWX7QdX0NI0s4CpOpDHhMwIrIT9UrySHlWckM1lRiBecSgOsi//b0uwSH+zwlqQz
	AE8t1opuQVECwGNefJMl5hdUY/Ihz5aUiYvZ6p9L/+bdVhsdZw1TFu+xcAI64d9QhkDge9TmaDP
	/ZaMVBoCRfJ4jQXwKyc7LTNwPYUQdOIFWuXTfAB/Y5/yAr9c4X6SgFx0Ud+1t8vrbn53iUVYAYb
	dApBNd088ZcnnDwN6+1gg/JPv1vebri4rqoV8H4TilQJJx6RS06PCe5h7LE3Ix+fWOLYJytPyC1
	m0puNLnV2z75aTl9oFPRlgPByIorVbaVMu8nsBgePyxLQghxhMG2jf7mlZdgMQ54Cf5vF5g+Owy
	ns0Ba0G0DogId78NUIr9R3t+u9gRZE8xn4U2zC1irBiAAyg8N66rUm8Jdiu9R6DaLZnVfuK7CKs
	8qnVoPclVrZzqrHr4da8ckNTC0=
X-Received: by 2002:a05:6000:1787:b0:45b:d891:56bb with SMTP id ffacd0b85a97d-45c7b769981mr4290870f8f.38.1778675843450;
        Wed, 13 May 2026 05:37:23 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:22 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:18 +0100
Subject: [PATCH v4 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-6-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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

