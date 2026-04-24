Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D68A386573
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021689; cv=none; b=jPHSMbKeuHbsJERXvMXewNiCep3h/Um98BY/6NZMfL3CJl8LsstAoh4XUUtLPIVO2mH+hrEX5Qar2kLwnhAL5QTkpNzrKxa4D8Ia97VYsJq/443savJzveYMHYMTkL2jZIC9LWY4QnzBkL+/A6K2xDjrD1rSOmDllJWhv8MghbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021689; c=relaxed/simple;
	bh=j7NtleaVCinXTUAFMP0whiJzDqo6TZ1ijhgG+B3VZaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjELrPpNigwMFYmi9eS3ocNiREim0IERVexXVeyet0TQ5HlwtB+XhFY+tDjwu5ZtNY+28xJbhAfLC7eqsqGAeEhaq1YjVg/pvypdOHfcBTb67TuB6dEjMHmD//j7eBajohlID4JMWUPwj68MeeCdWX1yuw9+uNMfmpTQm4ulonI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UEVnzJFA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UEVnzJFA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so41033615e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021685; x=1777626485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxcapfBloQ4ir8+1izZgHg1QyEWnEacJaQHdUFb2iyE=;
        b=UEVnzJFAuBE22m1+MaZvxctJ7px/SGESUc0djs4LPAM9AGcJ5brXUkRQoMxiYL6Bqb
         nvQO9xjKWc2jlodet58b4AcIACu3LzWPpaPUyccdnd/BkiDmv0h7InQuVKfyZxX7qqgS
         V4BSBR42gSOd2rJV2DQPGq26mU0DkCwzjBtDMQK1H2IvCZW3GqioHLVWpqDetEibJj1e
         TZDZqojALtO7Gy2CD+vCmN8RqQ4FZ8Sa5/V9kmlZcT6nzP37+BfBPUJdtRD4HMAfvu77
         x0OB4IlJFX/AMuDq9uAudBfjjHeSRZzuMD8OWL7IWsPMM7sHrNRBnKsXV51i0i+oY7/t
         ZD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021685; x=1777626485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JxcapfBloQ4ir8+1izZgHg1QyEWnEacJaQHdUFb2iyE=;
        b=GwuBj0ywIIh9a/WPjhTVFkR5b8zPQ55bsxa/bD3mhWiS7dZ3LE8VO5shvM1PCcgnC6
         HvrEMC57M6wlyZqwfQV4S14sFnVoLNVIqsZj7ho94qq9rmZKrCeACWeLYKnzx/Iya9Y0
         rYriy2R2WdQmbfWc6b88n3rtgSnbSb7umuOlHFFv5lob8+Z6ddLFzyfQTnPhM4jBB0cO
         JXc8qmS9XIpmpd4T1/EEbvakNoCw4UDM7oIqp7RWUlvapTqnKaLGJmZRCO9Rfn48Vw2X
         RePSqJEHWB680iM9DoeXuRoCd8e+0lSomTK0MQGCLvs/+g9XKxf5DfylrvGDT/OKfxK4
         h+BA==
X-Forwarded-Encrypted: i=1; AFNElJ+aoxxmlaHHezJI9Negj+TgOp+1oUj42ZHh4Pqdptt3rLNe7w7fGKw92tiR75kCzvA4uJ9KhQgKJiDm@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJyYVjlJA0lQjs0UtD5fZiykgJcCF7pAHzSbmudxpa4S1AN6l
	2bHAAa4zdJMIlQsMOrv2akLE0wIfYLEhsN7v94t7mbmmues5mvNoyB8lYZ3ARoyLPBU=
X-Gm-Gg: AeBDieuVt0PPttLkKhQzPusxHd4/ayN357dm6PjC42O/NZeH63JjMPVeexkKV7qtYdf
	GmULozX7nAZNWy0tOa92p89B9Q34W0cYRwtBkzaJyDS2Z/8UhfAGNCV7GsgxkQrsp27op82OUeu
	VAJSBReOuBajWgxHES1HS0N7zHZ5ZIb/qFa9euohrLWWt6+B0rWH+5C1gj+SOJEqVNMTXS5ZN66
	e6cAIkYiSznq2dPhcrFtLV/DRALOT7KPrIxxTiVlDwRPboXe0iKHDeoWwts4Lpu5WnvnoeVrCeQ
	ghkVxJ7P9fZhMMbNe/1vmWhBEzJ8+a5sOTpPPj8scw8/dWnY0HOrqDE5INVGCUBhpeDzynR7/0o
	esIWj68IkD7lCUN0KBd7U2p5IkdpM0UN9ETiei1R3BH8fbzTxDB3t58svvFayIs4uENzzxRS5ZL
	vd9OlLUJR0htYRYQfeq2vdX7ac/UL1xE6kw3E5irHAwlAjvhjw0zSDp5Y=
X-Received: by 2002:a05:600d:8496:10b0:489:a4:e555 with SMTP id 5b1f17b1804b1-48900a4e79fmr247019705e9.21.1777021685000;
        Fri, 24 Apr 2026 02:08:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:58 +0200
Subject: [PATCH 4/6] arm64: dts: qcom: sm8450: Add missing CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-4-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=j7NtleaVCinXTUAFMP0whiJzDqo6TZ1ijhgG+B3VZaA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLu88GwdHdU6Rx/b82G2QLgZcyRA+ipeisjqhiI
 LzTjAjOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7gAKCRB33NvayMhJ0UYMEA
 Cr1HK+dZ2IF7zakbgXlZZYJkKJHSoPi66+EWmMrTyHt+UfXJKxPLxdm4nY1cTftGw995xqhe5RVUz9
 8yiTRy1Kr2o1XeZMwu7UxwvO5UzN0W7bprmr/NuTKpFGIGw29TeYGKaPFoyO74jLvOHkrtHkw1aP3H
 nuC5hSBhQ/oba7RQScgvhbmpPL1hX3yn8BE+PEG5rM8k69XtU2M8dLsHLmx4DZOerjuGO/v+SEj7zT
 uiU8VO652cCmyGbuFUO0dmhF7kXaE8qopn2pNcB1c9AJF8cftGZR5TWn33sJ2aMXFd3wpt78sdDeHz
 gqkb4U19IIuvTKMI35ndpPS5oVkFyR2g0TIyhzSEWOj+ANRHBBv5Pmt3ryhiNlCwoeL+IsxQ0jX2Hr
 VZvRPafqJ+jHX2tl23Vt22humMsj6V8SlNV9RZAc5DrFO0i7KTeznfCQm1QcgqGi4jr1Oyj1KLJf8M
 TLG1qEq74DrZwEQrV0Hm0MY2+U7tJjdCoXTowSLKuRbx/yezhfabIHR69LCwN9YHwxCRHM/gtzZjhr
 ulZySR6JZU/yxBdyrphmx7R0OgdJU1hTwgQPyHefBY5S3SyTwG9v4NbcbujdIvQuoyOYv6A5aF9PQz
 wrvVyZ1i6bAK0KSkpKeVBYk1i88yGgkDo2T7BqkxXmmQwEPojc70tM/oI3Pw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f28..5aba162a952e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -935,6 +935,7 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sm8450";
 			reg = <0x0 0x00100000 0x0 0x1f4200>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

