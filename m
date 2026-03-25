Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DAB1DE3B7
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398400; cv=none; b=aKLj9vciqWdMq9YI5NNp3+8ymiAyWDPac5i2VOrUKBu/F8mq32aZVa60YWYYLn97nTkOjroVrt64hba9DV4zfMwAF8d/DU1rnlAuDFWgd7TnWeSIKdn7sZAK5MOWQgq8eJjjCZKCH/ITLUrT1NkM+sNmvAkbDPXoYxwmfZKbOWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398400; c=relaxed/simple;
	bh=HFIgrWvt4+PejNB2udAhjDCQWsy3aJQEKvjmdaokDjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W8P9FtQcUh1Brta71m4mhYGDK0dfbn2/DVKYyAA9+2C6zWv5OjoJCm1MlxTT8KpRqmuLDkyCNATDCKOmZZWDCMAwQQscX/tU0itlj8tZGSRQK+yiJRVyfpg47F203JBVpwd3XKeFNjpioxynHHgCLGmVlwAxcqbzNZ4xp180ISU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SvRatgyi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SvRatgyi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486507134e4so22716265e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774398397; x=1775003197; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OR5AmQ5C+PwxUk96HWSvSEr+oIE5VPNLRZ7Lt5xbH4o=;
        b=SvRatgyiY5Vytqe0Ci+W6WExQoC1iwmXH4vfVLnVnhPlSXRC61XCnWoi+ZVTmhiPi6
         H5oHvHSsEJYNbHNQhIMSNQ0tZl7h46gqk/Na+9+cenL04TbG50PZ5HtEBDJQ0MWyYAYO
         5qhIZ3IfZCsXz562/9hcxgMn/DYZ+P9/KtFAHF89I9J4+m2VJboJeGlYZzwNxjDvVkx4
         TK3S2+ZQOLpmkDxEXehxh/o3IUKnHCXLITKCXYzUqP0dYfqWnL7aiN4T3bISSy/q5FIx
         mDjcQFS2upOKxNItMjR+IQRHGI/ZHt9tY7Zn/7liBQpLyMb/YeRhwUIyLVP+B0wppuTV
         KG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398397; x=1775003197;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR5AmQ5C+PwxUk96HWSvSEr+oIE5VPNLRZ7Lt5xbH4o=;
        b=ej+LwfeoDFPBiYUDPCxXdV68F9ISE2JJ8mDrw6o/loEfTsDTefaeQMOQ4otdyu6ree
         3ue9vaRu2J+/AGhi91FABmgEhc8OAlFBP2Gk87V/Rc9/GiG765qjSshVrTIDT80alit2
         HEcsNtWu4/bSiwIN47g6iAMRTBPfzOArK3MujynsoswieTb5+7xzAfSBpREPYiq/I7dy
         Nm6tva7dsaR4dmG5Knft7SZVP+nZO1McZCH+sKvEPJe69E6aJ+GczvC7P29s6SP0hFDO
         eAOp6T3AWIkjatSga3X1FBJ6Tf7xk0IvZx8PVH4QMdiU01DDojdwa3EGToL993NO0RXb
         6A3w==
X-Forwarded-Encrypted: i=1; AJvYcCUwJNcnhwVDq4Tc/Gm+5TDZqBexCcmyUcO4Vj68wZp5yIPHdQwR5pvY/kKw+WyMtwNFg0cTOdBBB2Y9@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ8kyRGKHVuhGc/Q2bsKhVDaA65LXekIRB+OADAohCvZ/8b9Wy
	aDR4u2rP0RpBCcg1hGkU8iryAPZut+Q/Dc93KQhUom2Ux+LQxnynMtjdTaN8yLC/ZCM=
X-Gm-Gg: ATEYQzyUerm04H9kVTeabPyLc+vCpq+0rTtyihJXiP92GJsufHmKd/7UM0Fd5i11HVw
	KORyKxwM5RCKvZx79M7Le6mvSi8L8R5YwxALxyCyRFxc2dEhLOY+qWsJZExuamulP5gOMRCKVR1
	OU2AeZqWfFy2lgKkLgmxRgMhKKMClS56Z6485QY/l7T1tUs8JnYPEYSC0riE1CAbmfswIg8Q693
	Pmgy0FmxN4Atd477QA+r3Ig+v3Jj1DPi7KPQD16NGrbwJO6f6+TW6ZMvT22h4d1m5nqTNm8JkGF
	RVKddE1x+KqTO/+Vb+7e/xovQlFcJKG1ix7emZlZhf+PgfgiJAXbv18esz4OU492Abd3cyhnl6p
	BMvrGf1FSXCsAbjI8jlkyj54SHeV2vucZPSrj8Qcfj3XwOu0N8GMQVflE+DNSpQ10RlkkxG5Gmk
	vWyWDmhWS/zq0TTxT5FwK4KvtkLLNYq+Wk6WqPtOvvzyjknDuVB+IDZ8Ap+f5A2AI5WcoTny9Js
	Uy/ZelWsETtVRQ=
X-Received: by 2002:a05:600c:190e:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-4871604c856mr22473085e9.20.1774398397416;
        Tue, 24 Mar 2026 17:26:37 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b85082842sm7233704f8f.20.2026.03.24.17.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:26:36 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Mar 2026 00:26:32 +0000
Subject: [PATCH] arm64: dts: exynos850: Add syscon-poweroff node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
X-B4-Tracking: v=1; b=H4sIALcrw2kC/x3MQQqAIBBA0avIrBNMM6SrRAupsWbjhEIZ0t2Tl
 m/xf4WMiTDDJCokvCgTx4a+E7AePu4oaWsGrfSojLYSyxM5O6vkyTcmDkH60fbWmME556GFZ8J
 A5Z/Oy/t+INkMlGQAAAA=
X-Change-ID: 20260325-exynos850-poweroff-a6515334888a
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Without poweroff node Exynos850-based board continue to draw current
(around ~60 mA with my test setup) after poweroff. Kernel also reports
different lockup problems and RCU stalls warnings continuosly after
last kernel messages about hardware being switched off.
Turns out we missed a write to PMU's PS_HOLD_CONTROL (PMU + 0x30c)
register that actually switches the SoC off.

Add poweroff node that implements this.

With this change the current draw after power off is in range of few
milliampers and lockup messages are no more.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..3881f573ec08 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -215,6 +215,13 @@ pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
 
+			poweroff: syscon-poweroff {
+				compatible = "syscon-poweroff";
+				offset = <0x30c>; /* PS_HOLD_CONTROL */
+				mask = <0x00000100>;
+				value = <0x0>;
+			};
+
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
 				regmap = <&pmu_system_controller>;

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-exynos850-poweroff-a6515334888a

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

