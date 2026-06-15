Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F1410D09
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542633; cv=none; b=uga/RiIjpyJKJXHmVwFkpE53Nd3b8lspO1oiQm2ySR0LDnxDn18714Rs36z5NzwCk/L6XqMau3tFVyggsQoDk+gBSPmRcFCcZ52KV24B93UH72feQgAZP7+1lUV+3x9ZSycrgIMrxMkVIKrZj9UhOtjKCnjHgpu5pQcAnLeaH/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542633; c=relaxed/simple;
	bh=Ynlf+8B2Fa2GRaSP9wn5ZFdvLpA1HXp62fw1akGqkRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nK6S1DRZd9NBmcuagD38uAgBKfB6kxp1gLLIUGt3g6oGjtjEuUr2WFCMdJ6SNlbEGHnWxOD/xYJ9bTU8L0dsB9wt/8gxCHQVTzl2nA+cyRZquegGCDU21I5Q8BEsSZXLIk6j6u8F17dVUuzzkPKEAAaM9A2btdCEQB3FD9nJi1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g7WpVLRx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7WpVLRx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef616daf6so4083348f8f.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542631; x=1782147431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2syVWnLMc/XbSmB1l/iep16wgoUi68kiSPihH4m+92o=;
        b=g7WpVLRxurJP795JiQ1x71+RDp79oBcbUAU/U/0dkdHbeC+yVHdCBZRVABGssGIIDY
         we7niPSluPJogquVwiKwsgh1kVdo+xK+H/dND50zX3F+9/CQ/MIy9+navTPteg3BwgcH
         kse9q25qsOPvNGIA1dDpZHK8V7riD+cDNyfyfAnJNan7eZWY0iJLf3LweZrst+Q3rDHL
         trGhhsIwk97BVuk8i4P7JvHUG1wr39l24rP1kH4G9HDaIgwDHGGXOnme3VrgY6XlKXr8
         wHMhiz7rrbwGF+oMt2uLYuos1P0VbGcgm6250+W+tawdNKsy4lhJAbZCK63A5r6Z7wdy
         IF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542631; x=1782147431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2syVWnLMc/XbSmB1l/iep16wgoUi68kiSPihH4m+92o=;
        b=Q9sfABZ43+iDw5omZnvhS9j8cEbRqr2chAxRpDHuCFwqJPQmm6HyyZk0p3ly2my0fb
         r6V4gWgjiYiHkMNDUuWG1bi4dYvfG1G48IUecZuu5KlTBkKBtPeliU+Us+GWH3z9p26t
         zZbWHCOe+S9RUI5hKMe3G9l7es12ZlF21F0OuXZFXI8Rz6HhHDlQL69RZZ+jwe+A3Iox
         hg39DdvQLj7w/FmHfnwLag9cQi11MTzDCm3KkPb1iDPwet0T3k+l+4j642MbODs02Z9D
         ZOny6WtPDQTHptM/cx2BwIis8lEtb8tD4jPCR1YjhNZuoWatraPhkDg8q9T1Y+qu0bJc
         3N2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8QmLWDipj0wKoKAZXItD549A6WbJ6KglAxiHN8RoRyKvfW9RXVpD7Os5gqcGgig30GJrZkRSciAUcO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+vIMm1Pe9HtRxwbAnz8Wc5N9FfwLrtxyly/zwMPPnawrXBmJ
	hhw3qFt3AQG2n2dPpisF0xVxOOIB1bTydDuKnsxsrjMLo4NZiczaqYXbtuUK00JKkHI1h9t2R67
	SK+W6oe8=
X-Gm-Gg: Acq92OGGq1xDGvj95Q/C9lqlzQV+n/43ayzm/ysSkAwzAM2sJOXMdMA4wCuCyYuspNr
	wWR3+mRZYvVdeY2H9Yq4EhyrY0B9h6LUQ4EgE5urWy+30j4OklE86qgJB5YOmrJmoAjqa/CwH21
	MRKEGwhGUNei0h2su7y7/95ZsTLQ31smoajc6sF6z067p36r7KbkvSh1CeMlrpdo/Xybc8IXZrQ
	QCcFGuKf1isAN9NxRtsOZhrdD6jMPOx7v1XXY2NFTm75ZDlZ9t6YEXFBxz76zYGldSG8KZctImY
	/rRLo3Ad1TugGlHRA0g9rCfAe9AHB+nFNEBD9KXyO0R8dUbqd0y8teOpLZ56XWu1IlfsmJiu48A
	tjuG8Rbmlo7Pb/VF0mJBAih//j3FtVlxkNVaCKinl/OPzSOia2CS5xtfumfHEo9yZWb2e0hlynn
	Qheic+ySgmgtLKwGUaW5QyYWADtb5o+d8fWUdZmUbTIQE5
X-Received: by 2002:a5d:4808:0:b0:45e:ce28:666a with SMTP id ffacd0b85a97d-4619f37eec7mr209346f8f.1.1781542630607;
        Mon, 15 Jun 2026 09:57:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:03 +0200
Subject: [PATCH v2 2/6] dt-bindings: clock: qcom: sm8550-gcc: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-2-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Ynlf+8B2Fa2GRaSP9wn5ZFdvLpA1HXp62fw1akGqkRk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7g6PkeNC/y4Fjn01vvHIaWL+Fm+RJ1Xt62QNnG
 jlFS+0eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4AAKCRB33NvayMhJ0STJEA
 ChokNzF9nQ3JPeeBadKuajC3w1m/9owiuFtwvm3i5wB+k4bIZeU1csCgiARwTANWlZj2tzHgxayVbA
 99hlWKUG+J1B4WvZxk5iZNC6fPeySVLqHwqLU+9j1UGAaAASUMsiOTw6CNeB4AtkCPmvnrX9tEV9FE
 ifqfkFHgHdfP1iwXnFSH0EHPX0z59Sxf4XWrMgPwnxpg5AsgqzsBbrSTkuY7yNrawMopLDE22HpBad
 40JHTY6dWaNC/vqAUs7RIKZdwmtbaUQBVwE1TVZJDQAtaMxwH49PT3DShClqpKR3rk3ST6GzS79JUB
 Xnu2iO3SWOKXpeWZC5W03F47CfAOTOtu0BtMN3jJNi0aYgv8wkF0DzXg0fpM3uK3WetSZDSF7kuu8w
 A4sjXCbhCwxlEu1uch1hohsI1vD9T36w8sA+DW6Hmp0tkHckj2OEMMC+eUdsOeSAR0mw2Ok8uRp4nU
 4QeOvlNO8n531+vMDuDISI3oEZhUk28CL2NtLnd7oAmzogkmLWHn1E+cxqtYKg8Nw2+2I/0Qgrr0nl
 E9lNLqkj7PvObjDrz1Rj4DGjdF6lmy6NKYCqBdI+l68AnUle1X8Uj/PuNRVyFe0fD9KuJx+QjXkkAf
 kDrC+Zl9uEUrIcVQYnVBcE7HATuDYDXvI3/9T0ZFbYJKoda+hsy+ViUHMWeg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 47ba9c50bbeb ("dt-bindings: clock: Add SM8550 GCC clocks")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index c4e9b9bb63f5..19f06d27c7c1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -31,9 +31,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -55,6 +60,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.34.1

