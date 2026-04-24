Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CACE388E68
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021690; cv=none; b=ghUV+2+gKK/p5ZHVc5tglFHf+gEkF95PhqJ97cG95+U17nVVUDLgtEtLa7kZp3CvEYY4rfRtRbo61wUPQj5zdMwvEZ5btcf113z1gVZKvM9IGgPVUnUkpRnt0tcVPGdOM2/Hh+atuo/z68SmibTVVnsn+mwPS4+lVW8z3pPW1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021690; c=relaxed/simple;
	bh=cjheP4H0PwmMUZGzXHCF/PwWHjhyTfpHFF0F+eUTSpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5PSewyI93VpVmHArxy8jUcf5HDtEFPbk/yP60xirIdvGBz9W3ks/nS9hA5WX+VNGy3ajxW9U+HyWWm9Bfqogq7d1zCfxO5GZHQYOPRIkQdwPIa6LflVDvH/p+odOdzx2NhFR6V0ReJnYfLePqRwsRGP8+eod2XQTEg3jr0U3vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uIQY71HE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uIQY71HE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4890098abbaso56983825e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021687; x=1777626487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cvEvBA/4PYjw500G7t1DTztuhJdzXFRKOSaHuj0ipo=;
        b=uIQY71HEAKnzyqB1bupYFuwpHp+IqHEkPpacj1sNrGcEW7R7g1KsYKh7i1zaW/v4y/
         aRKZK+zdku/v2ysF8tS+mOgE+m8ZwJpdNVEDW/hpJ31W0x0ardyytJXXvgPXIJ0pHkRI
         y9WbgGJ5zrt5Iv4xeLrMxfnBBlLAQSSCTcKNFbpTEFUR5ECSyjfJ+IRJtr1P5B5q2uIk
         ygJ6CRI8PvCZBYNViWWjXoWcT34bzhGJWzHuMt+1uegNEX9dRKhG6aR9DRh2xnSnYL8x
         IS0pijxyX88rwikCXmnY3KYNktBR1Sm/BLiva/YH9HULOt5xgOSAsZvQU6y/tooStyvR
         xl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021687; x=1777626487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1cvEvBA/4PYjw500G7t1DTztuhJdzXFRKOSaHuj0ipo=;
        b=LwiFz67gmZPBPqhrvLoVo1Yo2Xv6UYpnesJFCuKxbH6v5AC8dc3QEIm1m+3rOITyxm
         aTuOm08GHy23UPLy+Rg1NI3D5hWVoqxk7Q5KKe8ptdOmohmkoVumlZlE1TfCeR/MBU7n
         KG5Iwofnhhm4dOUvMbgzHrHnOnMNtLRVFz2G8OiXxVQLbPmZngGwASoor3pfvqrJUy7v
         j5TsyWgLX4/unhoOPqZYs7Wb4ro00pVIk2cjilQB2G2Y2JoR5T5OpzDfoKu5AO7zTlQb
         MxVj0IHD2DRJlx8XeNoZ5KYLXr9lOTh/doHxsUpWcByAlkJtboU44vNagK4WJ8n95YKS
         IjMw==
X-Forwarded-Encrypted: i=1; AFNElJ+SdOLx4uZdKpyICviaTYdd+7dEa40AxmaOYkrsqjAb1wiyKN+CSWphOyvBM4kH5Gja2RurUUcuZUjx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3Ixq+qXPIXDmKB6tONeUZMxHOsK+7TNo7xWf/3S/51k87F2i
	3d5p934J4zgsun4WXQ+OHs+8F2wz/3/FBFiDf9AvZALMONZ88V0HOA/V5kNJ1D8F5Jo=
X-Gm-Gg: AeBDieuUZdsXSOMWf0+qHZ3ExMN+DlgHbt7PEm69+1jZm62rhpi5bv9gL5+S9lYRwa9
	RIINU47YeFgNSuewFBN0gWS57RxqW6oTnPxacBbIjf1JxeaNB+4vbPXgwpzz/E5XndfutQKTyiS
	QLGM+qFzJgFpTxj3fjNpk+BdlS8UiMIubPx8VL81yvtNSQhZVEGepRsjY407ksdfEFI8e+coLU7
	k810qFqhWvIxy1zL4qGcY8OJ/KsvNAUI3h4PpQEi1nuthdbIW28GlbqqeuFZrO4njWZ04PvPOkf
	RgNoTMjZyStcHiAdW7SRsCWiPKZXvSLjLu+5D+GZnvRS9MAcN718BOMtjgasrhf1FJsdBlCGNkV
	/phaTIkklKYC15diynV2dpHN9O5PjbktgS7kynDSTehjVOBMTsc5RNTlP6r4gGawKYMDPgMILkT
	faIP0gyBhTHupheY2jPsY5WmgpBn1CWi/K11+AqPLL1sbICxOK4ExuTEE=
X-Received: by 2002:a05:600d:8447:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-4891ff5efe1mr218788105e9.6.1777021686901;
        Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:08:00 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: sm8650: Add missing CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cjheP4H0PwmMUZGzXHCF/PwWHjhyTfpHFF0F+eUTSpI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLvNnJdZU5ZlYNnUi0u1g2pFQCN62UQfj6XSqYM
 Id9mGZOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7wAKCRB33NvayMhJ0Rj7EA
 CAcsyGSldN2J0xl88Vcgleo/lbKWR1Es8VCnpI7KMVoLb6cdNgLmyqsB7NXnbIZ/Z93aLcAd+sNDgC
 2Crd0I7zxhjdI16bbLlfBGI0aiqhoXIu97na2H3zgKZzyCv2p7t/RWQfNKBw/Lx/pScpFPJPTX4NJx
 eiSbwl5fFzNAY3At+RXuKX1G+IN2/M04537m6gGjdWwEs13OmzZRwd2E5wDzp5Ay22Ew9v+PbudBV3
 rx8BFyIQakWkCqy5lASkv/RotXy5nS1Zh/RNf2yfNe8Fs8q7Eh6hS43n4/+WbyCxxb5za9YasNPAg8
 1ZHd5WZkn2Q7t8OMqFo/vvpY/yCLXBLj0BhmOoCM0d5vW/AaU/b0GycPjZMtQoYb+RR4p9E72eB1YH
 BQIN9+gs7KYGN652Eewy3APavYyMgwk5oYcv2QKF9CKfm1ELgbqOuqyasrtErxZE2mpoobKabR8e+g
 kVGbwaNQPwv8BHtvQq7QHaHRsBFhfKXcz1Bcb03yv3pq5gx/Ylh2mfB9n9hRmke151L/15Eh5szKUb
 igW/TcyhPCi8IkzUFlSp0zxMg6iv2fX73Ea4Ex0gveJ1SkzdIQiW7Yz3WgXA6kdHdjb38sHeFSjjpF
 8WTjyT1O+p4q37fUv7NQEJx2+nzvtCoVIs3U5EfGAGnB2MFXNxqer23hWb7w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..adfb737afefe 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1963,6 +1963,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

