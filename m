Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CBC361651
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 04:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321969; cv=none; b=Y0x0CDUzz52+ITdqmlhBQWb8QnfNAYJdoqAteGGfrl2nc32ny60CIob/S73wvYC/W7YbQg7QN6R3RpTxwx1p/sbyOZMfNEZRIVMKz007ID5VAd15+OjzcA2v3RTnX3p9kP2VgOC2il+DP0MkKjE8XCtSX0ZgrPnJDhDFVWLZCIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321969; c=relaxed/simple;
	bh=XWk08yPlEEYsRaLrZ2NbI+7ePMXfSSERTc515p/viLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJ5tYzgFYGKPixK9U95ouCq8d9C4LWDFFiuMRtrJjSr9P2FT1QzkPlynsDslMm2tKBgKccJmnHbV+KAcUc6fEbu9eWzlCeWfM+yZ/kuGz0WFO/QL/rOZNXPpbrWe/LIS1ex/oyER8ZrY4jhlmLGwrdARZLk52FuKyhcajg4jj5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eeKbaE4o; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eeKbaE4o"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so3808945e9.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 21:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321955; x=1788926755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRKgobMcbQKYFXJECRgYm6MoWXyaDD5+5fNolQe68Bk=;
        b=eeKbaE4oqUVpT00Ihd2g6OUO1WGh5Og6F9yNzdTmTqsOZWNlhcu4moKNTIZ3XAIF4M
         m/C32lNPc05qMt8i9HoZIKG3Qvp7S29+5+LbwN3aVSpksVZD6JbQyWpOhJ+9JFBzXR7l
         aF+ndw9OIKCzgtJgFr/USD70BHMHTNeuIDOEOwQnZC1PNXvT1bnYzvOGcfzzwDyd902u
         vbRqotJW9QF3d56b132U6DakGS9o6URQXhPRxsEuWHWhoEd+oiWpKtyuHlz9GB9Zddrl
         bvf5Lk+OpiOVRAMOAHrXo6kHxY1O5c19yjL5eAwNwZiJakzdRagUiLF+a5jyBrANOgu1
         +C9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321955; x=1788926755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRKgobMcbQKYFXJECRgYm6MoWXyaDD5+5fNolQe68Bk=;
        b=NcWnatQpfXyj6lPbhMAydrftrY6cACMX92TBP8Y0KOwYy1QI3ztT46O2Pua8lDBaUN
         PxRXGn+103jDBiof5tlRRS1f5DfV/irnwIJg6N1qLsmfC8TKTHSaCN2jLRb8j6ye+lU8
         GDPtkwuJVnwNmic1w1I83qEtgL4MJxoNZcdZOF2H0CPnSjHG1W8JeUF4lNmNGvLCyY3N
         TJKsYLYwY0aPmHUZfJyLEf9fBNyOYcHnNdu8VJldwENTdgnefLXZd7WlwVD378z+dSPy
         2Ral2OBesnjQa9UtlszncbCOxoOAEqEcOWkOQkJqql0+bAxG+dGO2A+sf5fMBGc+g8O5
         JlGA==
X-Forwarded-Encrypted: i=1; AHgh+RqsuHdc6rt0l6qERk5cjfjISwYrgHe/iFjquds56c+mPt1M1oL2KMmORn0sJqXvRbt+RHSTKZePz4D4@vger.kernel.org
X-Gm-Message-State: AFuF++nbMe39BYK0tCx9VgSTqYC+Vk5OzH+6gvfLXKa5ub/M1erwHsgn
	ysdAUJmdf/A2VvoeZRsjleG2Tmb4wb9+cbvqyhEUi1K3AL7ttQquF0rpZ3g3g6csqKR/y9gR+3B
	wHJgY
X-Gm-Gg: AR+sD11eWlLUmUODf2wtbFNDGsu8mJVzoLtroVXbGxIstUtOVVLNYIB/arTOxUxlmmf
	Esa1IDAQBHY1ZUCSjIQAGynDtF05D5u8AQ5GEHT/h90l8tMFNlOrgIKFXGq5yPq+yGDaI2EBTES
	+a6OvRinLxFncfyuUjEUpVLmgznei/zKSoR5BRzzJ1bLvVWItL+Wa0bukkjPivcLGngbQbOlj31
	ppZu+5fQDJIFKtfgbJuVlpeClPN3mFb3oZieVUUrAi07Em7LbPXBV2FkEGQ+a942Q3aIO5vtEEr
	qUF5zXhWt3GS1GL4KtJJlZJyZmWv32/RYzbhWJC1jGGocvaG0riIZArFVqUqZ66MzcugHyRMItQ
	VPvW3KNjZxCZs6vfAZE0y+u3f2Nue0EGJFHYdnT9qOE8qxNrudWcSk4ibVJHActogAaUkv6qNv7
	SfQRoqhN3qPi72KkXF/HPIpHVjhysOYdoDKNcguzyHCv4tiuH7UTNev3cA9XI1ScdEwp1grXkx/
	r+yzrHGV90GZNqMkcEx9cuc/JgJbwovt+G7EicvJsYrmhYy3bJ3
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr29047875e9.16.1788321954704;
        Tue, 01 Sep 2026 21:05:54 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:43 +0100
Subject: [PATCH v6 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-6-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
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
index 911643008b9f..62dcfb18f7f9 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -226,6 +226,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -243,6 +244,11 @@ reboot: syscon-reboot {
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

