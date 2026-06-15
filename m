Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC0D410D36
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542146; cv=none; b=B9Rt0Rl57hVKa+YaSc8FC89pCWmTd3CAzVd/zaNcGPdhJXj3jwi5Qg2ntRlmOxEmdgtc7FZy1rbUDNpF3p6/1OXp4WzmiITZ1XIIijeuljnKP6STRZxyz93/WIILAZLacf5pOhzneTSM+tiaHoxq6U9d1iWN6ZNKKROCigTMCXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542146; c=relaxed/simple;
	bh=zC3uKh9sdRHJTxAOHcXYp/beJzS1u9SHJ+etYo1UF2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYkdnG2Vex/7iWBa04ekD8yIW1h754De5pJGprUxleNhDB7AP3esLj6UzR/EayDKnfqm5oA1kL75Hd320fsrYq8XfzquK8syEJN24iLEsgkU7a73fnhiLLlRdnZMzOI+/VgUh6Ygz7VTC5sz6gy/IUO/54A5D8c279bjdPYDH8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZWOzEhY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZWOzEhY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1924000f8f.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542143; x=1782146943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+tfRyHBl06u8IzGN59oh320y0djuJhvUWRaCZZ6NlI=;
        b=YZWOzEhYtzKjbjqsTloMXMGsPHS2evjZKvrJkYq8oAbpi4g6lzgU9KE3f28kueWrgT
         aE1r7VW1YUhAYrf8vWyLSAkqrhHmVZUrBUK1kegEUnO6yXaHzlzIS4gZrjWtkqXN2/5F
         1EO5DcGbsub7euvAbCYcJKw2lXzmWV3wi9/9qFBnBsq0IkkoMdUy5z0gnvipd+oZgO1n
         0Q2v9Uw659vo973vuOcGpcHi+uLxAEmYu3i/KFEqkqn2xZCPYLUoy/lfHFkOCcw2Xtxq
         LarJSM+/MUqt6s41V7OpQjMImTOFuRYJ7jlP8mGc1ZVlsxXYuXOr4Id2ES+DhZhWPW3K
         qvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542143; x=1782146943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X+tfRyHBl06u8IzGN59oh320y0djuJhvUWRaCZZ6NlI=;
        b=CjCeP9vjvZXFFGvC8Avsty3nRchNIH4duMpFZxI/1vVD4+KLLDHaojA5jTr3BHlxIQ
         x7VIsV3DDMtTU1c/akU7ENs6VGwgGSYLO97hHKCEDwNAm2nxnopQZb7zGDGmTUBC/GZo
         c8xlW+h33yGZWoL0a9HJPiIVoq7R9z5/vO5MCp0z73dzI9QZJhETbm4YLIN+CpL9s+xC
         HxGT6YvIizJU7FydEIKD1blGqhaxgsaeRHgYVzixlI9c1TC1lG+xTE6CrCIEc/p1rAI4
         p8gpfs1nUxX58Q4Ai5H81jLvOyzdnc/RSIqlwx+FtNGo0RcEDicgJknLFptqmS38dZzS
         lDWg==
X-Forwarded-Encrypted: i=1; AFNElJ/izO5OSKETn7Xn8x/VOR2ZUKB+spaLgKh/KSsF0GCdpxcMah5kV5lCFzy2wpeOJqm3EZtCP/uDWVRj@vger.kernel.org
X-Gm-Message-State: AOJu0YxfbRAbM1fPbl7yUPLHK17avjUbAN8R/mKCC/Qlwe+nHd0/SGaw
	2YNiB+23p3b/owovpwXsjqYSbX+c7TrvubckhGCAI9xLxOPi4kn/Q3qx6Fx7yQi1izc=
X-Gm-Gg: Acq92OGKS/WDeTVOhUFoE/do//3yGirgOgKbucWEj8NuanAt1bfhcZCCYyzk6+zPxw4
	Zo4sB0PGyrlKzDqD5ak24Hp6t6bIK7kVddC9NzWrRxknREDyrXTMwgZPBG1Yj/6R038sSUBWVu7
	q1izlHiRxqLwUF+f5G+GgWx0CiT5JBU5+EyV8KUIa+4NB9WVmlitJGKwMyj73QdfvDLtlH0Lhgx
	X2wS7ddJBXPC/bWQ1MnGhrmUjA52hX5yyKwIW8Dbe6j1ZDjZyJaC4I/uLAjSW5U1mjY6znS3WJD
	r+kkza3rjuIM7YURulnARSq8oxGZfUsG+4xjOmiXzra2fls6s0GchPCSEftbzgtOgc+wR2Ppdtw
	ovLIHaLVt3doPzRaC4EWJtLh7/CILEFcAA4tJgBHlqJhWFKNFHzjamQByKHMup+xcDgkddq1rAZ
	fSPhiIqio/gMxcC+u+Qxx4s5wxpMqAKk31l0VxApsduv8s
X-Received: by 2002:a05:600c:c04d:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-492201439a1mr97518985e9.26.1781542142844;
        Mon, 15 Jun 2026 09:49:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa58f80sm5670735e9.11.2026.06.15.09.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:49:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:48:58 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8650: fix soundwire ports
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8650-upstream-cpu-props-v3-3-eeb6e9fa7581@linaro.org>
References: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
In-Reply-To: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4333;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zC3uKh9sdRHJTxAOHcXYp/beJzS1u9SHJ+etYo1UF2k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMCz7HBSsyv4RFfrN5QxvOPyTB0818pCSmgeTDmcp
 FI+UgPyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAs+wAKCRB33NvayMhJ0b97EA
 Ck/jTFd2vZGagvSWNB2AX/C30Y2EIZa0a47TFBclmvyMWfEL4Z8DrknPAdQ0jeEhOPlDqYpUlRMzjm
 0gad6384AJ2GpssyqccIokDPHzRCL9viHLOD8Q/lM4a8OnQ6opoe/XTHvW55g+luka0MNLffsPfraN
 5GLyTbSE5qMDPBmJoqCvtefRAD6jntFTQsmAe3iTWrfEdUxJVZZ6tFz/epWp/KAPi9Q8yJL01IihbS
 8aZsG6U/T4ORtZMHq8KA/B3viIKqFdiJl3jw4KV3gDNX87zr10a5f/EtVcz69uhs9ZzulGqaG7aaRk
 nCUORetKHCE1czuzvQX43K/z06G5rbYCSSiVgXfLToO6DuOrbj1I0PKiLv1LRNVm980rPvM/pItGQk
 Cr3wfIHtBP1y8vdddbi7lApq7yppPXoMHJTrooRyiXewkVHpBQQhhwdVp1TOo7aTALWp3rpgceKVdi
 l4XBeRsWnw1ycVe8kohlGMqdw3wmsF7iTqLmh/asfjS7N2123AMRW92wrY5NxivGCc0Fs5Mh2v3CeC
 Z0pZyz4pjX77wA1/m+a6KIG7KZLeHf8DFY8EaRNrB5cnlFZSsL2W6mMmy1PisMTkQKIWl4Rcs/+UVQ
 COAFLKFYAUTdrLRym8DfXJ4/yTa1fxbVt6ENPxdlFWWW+lZ63KVNGyQP9IBw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Since commit 9e53a66a2f2f ("soundwire: qcom: deprecate qcom,din/out-ports"),
the ports are checked against the actul hardware configuration, leading to:
qcom-soundwire 6ad0000.soundwire: din-ports (0) mismatch with controller (1)
qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controller (1)

Fix the ports count and properties of the corresponding soundwire
controllers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 42 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 090a4739ebc1..b1293fdb1481 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4734,18 +4734,18 @@ swr1: soundwire@6ad0000 {
 			pinctrl-0 = <&rx_swr_active>;
 			pinctrl-names = "default";
 
-			qcom,din-ports = <0>;
+			qcom,din-ports = <1>;
 			qcom,dout-ports = <11>;
 
-			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff>;
-			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff>;
-			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff>;
-			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff>;
-			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff 0xff>;
 
 			#address-cells = <2>;
 			#size-cells = <0>;
@@ -4831,17 +4831,17 @@ swr2: soundwire@6d30000 {
 			pinctrl-names = "default";
 
 			qcom,din-ports = <4>;
-			qcom,dout-ports = <0>;
-
-			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
-			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
-			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
-			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
+			qcom,dout-ports = <1>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x00 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x02 0x00 0x00>;
 
 			#address-cells = <2>;
 			#size-cells = <0>;

-- 
2.34.1

