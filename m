Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260FF4183A1
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542637; cv=none; b=MFDRA81vfryDo4giKiLd62Py9IsvZVzlAG/o5r3VO78wcCWvtmclaGv1N0/Oqwj5MclpniCUf1v94H+NM9l2bPRFp13JGWAyTrDTlGQcnHiBv5++eGRDghd/LPUoQC1WtEO1bbE599+SJntNgXoqSg13Sgy5HLjE1APvibtbwOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542637; c=relaxed/simple;
	bh=Q++Lf186tcvSnhNbpXMGHHXwihp6Nj2/MYlU3xEci64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGPSfANdoOAYvsShBERicK3ny3ujuVPLFovLmue32ZFiOdb6HL2DCi7CMe5TmsG6QGmzDvAsm2EwcA3GV+n4gs9YiEqKD/MAt0JVZ9irY0BwXamFcg8zVFWnUpgX+7rS1+ld0Vg5lRp3cNPZ77RDYB/6P/dEM7WYxxYWOS9gMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7y/vxpm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n7y/vxpm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b7866869so37321655e9.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542634; x=1782147434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjyMVm4fYYqVPsgeWiKX2v7WFAJCpVCyaRGSZIumw3A=;
        b=n7y/vxpmE0zsY2wMuUR+SfyWEUlbOeFm1Ekn9BChRC9EmctRzTMINuuwH2CRE3Vrfr
         nSUXY8I3GGAd3e1H2VvX/t9GALp/qgQ2L4GVeiIEmijkpc4YAfQcVDIYuqMdScYvaMM9
         ck4GWexKkcmugdV8/NlpvuD4d3C7rLSH1g4sm6Qy/nLXPcOt2QIGkSjsnVSFkvQKCI1E
         KdMT7nFzrSRB6+G7WymYtu/ZpmQfWKppceplu3lY0s4MLd46TEjp7pZ3VpOAhq1se90m
         JcopVEgVEZ3Io6/Qm251ARwjVjQyAso6tTNXl6fbnia+Z4DtxZ1ElChVI+z4U0xTPnUF
         c7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542634; x=1782147434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjyMVm4fYYqVPsgeWiKX2v7WFAJCpVCyaRGSZIumw3A=;
        b=DCY5SHgP7xXkZIJY5goUlTGqFGhEX/sq7uWu6200PwlvbpIaR7/3tDldZWbW4V9yKx
         fTwOVDfev3R/rpOR/ECDQEu3zzJbksaB6BcZzh1GN+A3cB9KGHtFJY53JousFNdCkuKa
         wt9B/7YhkOsSk/5vuWXlm8rcMqvrkUA0DoTuEs4E2dnWFBU/rmgZ+uSHlF8q/RdjXSGv
         KJsh2WisN5qt3G7FGYOcxBqwvOXCsgHV+lit6DUZPwbg5u2QqJpWP/X97Af4RQ6iIUKy
         shksRLhGtv+0yMkXGKBuwph9x5EEmwM6duWZPyLENzEsZzaNUJbOYRfSneSIosqR1+No
         8esA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZGiNSFa/W3E6PiiHBdQhT24cp+nFi41rVGP9Eiy0GwZbyo53ICrQd3QKj08IwysbWTsH9/iQKKpOk@vger.kernel.org
X-Gm-Message-State: AOJu0YyArDYZyibzE/ESloELoru0KTZWTz+YQbwEICGi6juh94mbUNKh
	Po7KAbf8S0kKBM2/Xpao0MO/y7SUFtpQVRkjUUA/jkHbc5idFBrVMOrZGdxkwhy9HY8=
X-Gm-Gg: Acq92OG6mqOz9wV0v9WJayP7I9HwseJQNkZtx0eYQqX3rA8sxEYVg1LPP6vbL42yW8j
	Fq4ff74MuZnRUVh9Rz2KfQLcX/MmnWFXPS9zE0sSqSpUrHm+z1oJqqQVVmjrp9zbo3siDj+/PDN
	FoBbx8ej6F9nd0KPsSjRr4BTkB1fTA9Npy+mN/xkiauPhD/3cHvff6AjzvtwW86/V9iSAasNzfJ
	Q6PX+i3UFyXUJAgU9F2A/hVCcICCxdFijcNvXmcrENxen209DRbqUL6lLkO5vHuMuIrMehknPZh
	foGFlmIL+aRFnhZCxrLHrYYerH2/B0R7EAPwoBjGDK07aOl/ZCkzzQzTugAOQ7/n8oydbJmnknD
	DeQAk/wl3ffC10fnz77zT4jUHhOBo+WXnVeloVNVAQpoUhAcftfGrxlqPIz4tVju4BIkIK4Ym2n
	Gq/tT33hlDfVLTCLeEIGRZRfSCIE+LcQbjihtOtLvROSfo
X-Received: by 2002:a05:600c:3f07:b0:492:1e36:bafc with SMTP id 5b1f17b1804b1-4921e36bb41mr153680045e9.36.1781542634466;
        Mon, 15 Jun 2026 09:57:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:07 +0200
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8650: Add missing CX power
 domain to GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-6-6b5752dd4747@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Q++Lf186tcvSnhNbpXMGHHXwihp6Nj2/MYlU3xEci64=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7jZAiJqW5AmB1lC7UlqNt0vIWrJRHtTC326me0
 PmXRnEiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4wAKCRB33NvayMhJ0S34D/
 4wC9TFzb6OByWn6XRk30aSwG1MOO6TDGE/O8Zy/RyeNfPPs4cZUoUxa1Eg4qAVm6ut2RlvzxTReou0
 b7Lg/kHLVRGnN5mUOw/ebWHNwtxi3RwiINm1PAV42JmYueR/g/IVKAodgxcb5ojsRFOmqifs3Qzcdu
 BlbOzm8Hr/KaUYQV5JbDiaSJDkuMBeUjtXbH4ZWQYUYYnwrcD6j0uR9GlsEmIEyYx6Bo+su3j3HGGA
 a7yQAT/KaqQyzND2fqPYy3SF4hxUNWUiJbpKEqXelYVABd+KRW2c5fYCmhpF1cBlQ/2yr/aTI/L5Az
 inpmUVKLEWqWgZ+GfPDFUfluY1F+NkeMCbBgWEEYDhjMdR98tW2fe0AXhQMp6XkpZGlW0n58andf8/
 VozIOiApMLpUGlBWqUnNbzeb+TbhW2iA7UsumTuisIbG1mxHE+Wr4nFErwQnhRdz9eOlzDnajk3sPn
 cRfPqaadeGMVht5+vF4C5VOkBnwB18MXktAVrQQpTKcKsHRZZNnxrMsFWqhlb/5IPxdtOOtxPbeOXS
 sdA+rwlfITleBcmVmtHErPBzvIBXupBjwuhmlicGQFMOGvCzognf/ayoIEi3f5OPXrw/nCO8382tks
 cErQXKVTpGgKGvRKh1n8sv1K7eHjSK/3I5/LWxaIdJ9iuW5oigJ9u05DViTw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 160ead25ecf7..8365e97436d6 100644
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

