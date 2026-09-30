Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97C157A5A
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727201; cv=none; b=btvlIbbEHRcb45oq0m4Lul5UN3imr3TjVtJZcV7vlW0rYx+SX5IGuIHmcgixCIIg4vQ+k+ZTpkYu9fDrqq9buVjx84wMp/wQf5BsXapOZ1NAOLwfj1eowp2yLU6Fgn6xITwaGalcXG2Q1wpBAVN8Z1K0LvvDn7FaeMzev7X7Qtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727201; c=relaxed/simple;
	bh=03oIVo7Mwx5/dyCToWlLUM6KJ0gWVtj9L4EMotVyIgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBO8maCP1BNufS3uouq3+DfddR/bjm2ToA9B/f454vR1NTKI+0Tok6Ri3B8RNoRizCPCHJtPOFjMFv4ISSVLI5Kh+LwXBM6slnMGBzCoykhBsSI8eABEf46SSgwfMTsauHplIagOMgvbhFHU9QJzMcZ6ocXQGpmqS3Ud5EBPrpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pEhg/oFx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pEhg/oFx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so26016715e9.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727197; x=1791331997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxnJMxigiIcSjCIhGGC3UJY5HM/ObSeIMc3ufp0EpQs=;
        b=pEhg/oFxkX+a0WR3vjlI3rea4s8gT30QGTwYAgwTPbc0/48MMlIrTmMjpp2YoJrXJY
         /h57zAgqkaH+Nt4fssR+1BrItXJ3gsIA447lVseKujY/oUrR4ItXw7qgZDd5bLXX39sH
         C3hxlPUeAJ6fG/R31GZWm9h3CEcbJUN+sbACfoxz3c1vI3SAIcxpvX9g8NAYH3NYTEOq
         aGKZjNa2HHdzyXyk9P6yK117z4/qLqSg7W8QujHOgQvOG4A/lJ0YFK8dOJWDKR6bxo/q
         mRHNWoSQpvNLw5oUd1n9mqPiWwmmBpzVBCw2Lh6jbuAD2vd6HzKT52mU5eFTO7/eLzYH
         agpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727197; x=1791331997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxnJMxigiIcSjCIhGGC3UJY5HM/ObSeIMc3ufp0EpQs=;
        b=sCrRV5VSBaFs8LbvezVmYopJ7VtvN1wb/yGVGr/ha8+ZCpRpNKSjhW7YiYAHfv/RiK
         i/HuB8UTOLlNgyfUNgiEDYnWdbVEc44UgtKhT2apisXySx2UbLEmouxBx/0HkvD7uAwC
         OthjwHkWSkWrgVamKRteoF87ApIQBnvYwZHXPFd5FAmcunX/XpsewegUTGL9u1jTj0rn
         UY6sbwCMRvB9QLHRanjVuxYnd6gcL35c+pKofdGBWR3PUEpeMb9rxp4Tjwi3UMZFxTwI
         IcLLltOkpBGS/3SIJJ9Yn4YiXBAaOnPkLoViFg15ADIKXQzvIxMnFoFcVrA57GR0/v8A
         pjzg==
X-Forwarded-Encrypted: i=1; AKwUvBx4lBpFqdDct2RSW6eTR4pysJw0VgouP9IdZs1R5W4kQL/QNdDamgyMf98RH6K8EqkWztKNfOo9GVcw@vger.kernel.org
X-Gm-Message-State: AFuF++n/AcR1zJCmsRgAJS6RX/3pdFBC89iSkZq1KsHTs0qK0qKgz8Qq
	DN9+QEmEt7no4kLKWuGKL6Kbfs+lGDTCSph3sBJUpxBGIrYoQbWEepnJAUFb/9UAn6c=
X-Gm-Gg: AYBFou1Y2dIj24t+CDsnvbYUw82AfdhDB5SB4rVmk4hmWE2/H//9yc6tGQR7EEw/4sK
	ZgaCfIhutlhGWzGQ5sG74l1ZgTsNWWUqcHgVjXCOY1e/qz73o08ZwncK89rgWcskTmbeOPD8zcN
	O36SvWUkHg1mFmCljN4lY/3x7r42A4fhsBNg1JJ6AMFgIknMVjF8Ph1HNmpIZ15kByYeZBeIii7
	PyAS0HDOQnArErUewU3gmmV0IqAv7uTFDA1SYkr59kvQuwbxIwQ+kcBORgDw0qGfaZTGFYifoJF
	c3AlLgxlhmY533GcrmhNklqkatZDH7UEmxxjCdpXPOexvltupJh2FHGIbbNu9BBgM5dEA9jeUtk
	iAAqKWDewizISPLj4WDCwB0Gm1ljIj4s6qwFIdi8ZFuNoL+I23yT8PXeb9ii4AKBckmihxOoCdw
	L8ipBVxH/Z+/yIe0FEVH4KpXSVQd774Cy5IsssoZ26QCzJdGWTv7MiQvcUKIjvjp+0vKRLkOzt1
	7ECbbeKZpZjXc5QKORGsTe2NUUYTENauqwOl/PvZQpTc4lGGgQzag/ar0oUCg==
X-Received: by 2002:a05:600c:8b4c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a01502b7b2mr11612155e9.19.1790727196898;
        Tue, 29 Sep 2026 17:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:13:01 +0100
Subject: [PATCH v7 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
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
index 8a4771899a8e..803fc127d895 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -231,6 +231,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -248,6 +249,11 @@ reboot: syscon-reboot {
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

