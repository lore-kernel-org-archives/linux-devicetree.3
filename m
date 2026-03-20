Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD66371072
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041327; cv=none; b=oSN8oO5z7pS3OU95ZPzJQPHzqFHm58OzaF+QrwFZY6RaZHcE0eJkP89ya8+FgFqG5XrCok3FXUApiBTqlLDDLh0yJhNTadMjIJCtNgRN+4U2dHZP9Q+9iaLrE+63qicPCnIPMb8qls+Jrc8UrHqh+Cq2JtiL2lIUJC9L9ySojk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041327; c=relaxed/simple;
	bh=3crEO+O89xHnAa9Qv2tmtZDwzd9lKKYN3FD110HX30o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHOyjN1MfH/Fq8zir7nOa2+4FYkhU3NMBSGSyeupn0MA9QGD6/NaisXsLPOl6rB7S1a8/4Mk9TJ5iD2sQwfpqJAr1/cDaUPucxUcLzEB2oIArJmtXiiRu+d6tYeSxcxbGexlWn5n+eVXgf3ZSBL8ZDI2drDR5pzgSuDaAEAkOSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZgOF4B5F; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZgOF4B5F"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b2965d4bso731950f8f.2
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 14:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041324; x=1774646124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=ZgOF4B5FaSPz1Yzvyzuc7Ux5dMGXo05DfMNTRmd0+mi3YN1CJL678AfyCH4KEZto8Q
         X8jeRwqTlQgu3FQPyItEEXlhhjKg29s2hGp5dUvetzuNyjSVwVs2rG/ash16cZooWLTE
         WlJ4Z0ifpMSo39N7N5qJKEjJ7KR0DnE4WvgElluk/vg0nIEjFPtV5+PsnxlhvHPtae5n
         cVBOZQfwaXlkjBmVvrT/Z4rWj+mijI2COFGiVkdw34dITMx8McAqq18CQWFmYZjlrwOC
         9rn9xNP7toW2ITMdkK6bVR5+sTo36mBAWcn/h2Wnfx6Bpz0CAiAuXs6NIRwdfScmuFu4
         yu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041324; x=1774646124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=h8/9Q9uJ7mX7ThArd0DLTSZyj4jsUbfK9cfx4XBc6fLSMRAxm9NA9F7sRnjXyZMtW5
         nOFnDqEaQjRxK1ojZB2s8DehpMnHSLmc54K2ae//JOFpGLCdsOAa9S/niiymJkxE/8le
         9xRIFkxUaWwZJBYPRtiWZyz4kZpmeV3VF33X0qHdpUCJJMOKXY90qhyuVifCR5FhYffC
         mkVWfE12XgLKMaQXqczJ/NVw5TU8GdCCfPSMWjPA9ML6Pyg525R2pvve4GZLCtY5MM13
         97gXUFboT0jbVEXRnmGItf6dCSDFB0lnwd5yU0XEm3+tCXycOvRU7F++ISAm6ufq8/TC
         UYEA==
X-Forwarded-Encrypted: i=1; AJvYcCXkv56X2LEkNlO/KhpvDx2GQS3b2kBxgRG3vEZeSBGQc2uzlYYnLw23vNZ/mbXj9lgt77CvO8T1pppF@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/xIymoI+8gITYonbFuhw/3FpNB6/p87pRwc8+3TtyTpCFDtz
	lBxpCwMBuhixczSBdVwui/keU3eC7VVz9xxsgRDFZQXidW/EelcoFqa/UTk+AzuBJUk=
X-Gm-Gg: ATEYQzzYCl/dQZfKWTOvDi4J0rPlGK/grbyeMfn8dqQY+DdkDzBhkvKfpQSNVGkrgtu
	WCHGpY1e0uX63NS3HggSLx9EIqeUvpJ0kCDo3RI1Zysy28Ia/eWZF6poPY8R5TCSikVSqFe6zzW
	CYjvx60pp8u1cpuWpeNSdio3P/ZzSh8+9BgY17mtagYmQ0G0LxubY1P1sLdMuzFJayrc2DBLCBj
	jOFt/mQd5ytykddms+pjNN8Rk96ONC15aO36oQ420TdcbM3kSZYbr5lCRyGohMbXI/puuk0mW8A
	FNILSGxjlpB+79/xdpmDRFwlRZG4frlpFFQrfElDHPLbQoirxNBzRVVOz8hIdClwOJtKpejgx6/
	z+mc6KVTaLul1Iehe9V+qjbBSJwcTQ3FYBpjmrvPpVVcoGJ5fKM4UI91cIwI53ejeuueWzjUe6v
	rGrfupA3+31OG+OlIhWgEo3x0Cc0FLUGLdz/tiXwMAq+SpzhPHMLgMnT2hjWLPS7VyNKUgNH0h9
	SoYmtkv4Au/+48=
X-Received: by 2002:a05:6000:2dc7:b0:439:b811:11de with SMTP id ffacd0b85a97d-43b6424312cmr7695087f8f.7.1774041323743;
        Fri, 20 Mar 2026 14:15:23 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:17 +0000
Subject: [PATCH 5/5] arm64: dts: exynos850: Add ap2apm mailbox
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-5-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..fcb665ccc7ae 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -298,6 +298,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

-- 
2.51.0

