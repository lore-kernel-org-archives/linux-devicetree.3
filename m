Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BB7364E93
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775458190; cv=none; b=GJoS0Wr5Pp7mDFkRM1HtNrv6qa8ScDsBKD4NAtUeJaOLl937kvkx6Hmui4sNIAVvATQ/Vz73amHmJ1RgJa4zR3nPYg7bqXWvMcjE2O4SwxcnVkMEtg8/1cvswye74ZjONxXCf9OXc02Bo4vDNhv3i0BrSglSq7IckKk89jb4QzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775458190; c=relaxed/simple;
	bh=667NQRhMGe5QZ07dEAVje+oTMyUEgodF0NM+DUxJ7mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3IUHZ9gFRFArft3qD9InA2w6va1uWmLHL0HGFaQglC9A+4oBF/hCmkhMEmF/GzZB787juUsnNh4cgWEBqrl7PQCqxzIUf2/fS/9TeVhYuZpdOZ8VdRMhRkY0zMrqNzohmmEOxt/IwkEiHkGu5WqEC9oa7Ff32UYm2Sa2Ay6ies=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUg7Uh7D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4nxQ8zh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUg7Uh7D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4nxQ8zh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Lo1pP3716392
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 06:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7FKUqa0/eV8
	0ZcUlR/9DW5KuTSyrO47sCBBB0zKhyVY=; b=JUg7Uh7DjSWIm2m71DvDqq824fd
	phWpeBaYcoitzBlmTaN9jzn1FPkTLSrzxmJD97VvuWVcwGg+vw0VH8WPjdxnF3IE
	LVJ51OKX2Xy5bq9C1SBU/FgjiDeVI2FuCYvofdXVO77oWwBYuKzQq9f/Z/0/pHxg
	60jywbKKs2FNUM16gN1aShvGFPerZPAUFHHBj+ebCHRQDxe4LRkUVcc7VMi97Ll0
	LPSiGLLfF+YHqBCUof0UWaBMuKubK/ckNkQuVXhznkRYNDTrvLqw9fHxDd2UaZ9F
	rO/O1/JZ9toJI3OPnK/jDVt7evf/dh/gXhVjRvGRkg7nWBlTED51kPrpD9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14v65s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 06:49:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso43776301cf.1
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 23:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775458187; x=1776062987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FKUqa0/eV80ZcUlR/9DW5KuTSyrO47sCBBB0zKhyVY=;
        b=S4nxQ8zhespjPGmK7lLGAr5jSJ26+uQwrgRScB/Tyj237WYmjDxj75EdRTFNQR83Gm
         74PrbQGDtUBE3Nom8m+9AIWF8wm5dSy4N1wx51D5JZYEzkoZ1C4miuyP7NGwHTikqoyJ
         ABlwM7NYURZ56cXci7yWn0AnQ6VbU4WWuDpcIEH6/Qe4xvIh5a1/WOFtU0FkLpfKV+ob
         2QSAXNTiSVGfqSoJkoE9wZHl76eHpYcPWz4W5Kh9z7IZZM8CJQMnG/NDU+Z2UTF2P+8/
         /+TSN2RLvd4mPSF0ntYB6yacAeh6a0jPFWo4fxol6vQixy432QUZfWffLP5h8whJ/cm4
         NcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775458187; x=1776062987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7FKUqa0/eV80ZcUlR/9DW5KuTSyrO47sCBBB0zKhyVY=;
        b=OZNkc/c70LI+M8c3IJCx4hYN8ALcIDeLgA/8hNOIWI2x1LsEMT+IFjC73rklAXUcu8
         3OFLS1aUbH4NBgae2lBLbyMCFKhsFDTuzbtD35vQE4xNqwpeg+dxWN6BGTQKZC2MVG/S
         BW/JogiK82H6Sv6kywknXAwjP38MkZYQ9PGFkCHdaOGl+Av+J1EFgvUT69BJB4vFx56Q
         XlNZG2xDqJLE6rYOFNcfemY/F3SAplRY3HZFkFyKXDHO4gy0jm2FCkGb8rmgR/hLNZW+
         4tUcleK/Y4Bilbbdh6z51imImKfNYj/TaK2YMCqWrbNm971uHTWQ5nFukm2zKhmZgGpv
         n4CA==
X-Forwarded-Encrypted: i=1; AJvYcCWoCH0+Vo1OYhRKklQz+zmvra2dlEJK4tLPOHEm0XbHYSC/L+0eHzxuXK7MQcnqLHg0l88BS6ybt02g@vger.kernel.org
X-Gm-Message-State: AOJu0YxDLxIjrrhv5lpryW9djhkJzTbt+3eEhPo4oIkvjV/peRsfFzs0
	I9YwbZ7pAlxFcQ/Gi9HoDi2x9ouoRBkIHwa3DZ44u1jjkjRC4hmQvRexoihcCI3quzN9wGcEBjS
	t7jaOxJ6QjlwHuvU5/gB6L5Ac1kdgS4oWLfsjqiUaotGkrweFBOXclXoi/bbMQDTf
X-Gm-Gg: AeBDiesIW4newNAhSGAEzVXWwbyvu+oaVimyY7oxJQhwa4rRl5Zp0yl82mXMge0ugsZ
	EsqGfnQEySWi1hlWKgYV49XdLgGnsXUf4qCXqyoldgX74KAVG7fexoVN6HlpsvtMsCTI9MxV3fJ
	WBvq7eDIuDrro0yJLHsEyvPovbxUFX2nBve7i2pmamIIByA6gJxOGD6BhNc4GuYBvgOttiRYJYt
	imBECqUFyzYCIPmhf2eJ71OnvcYqmXJRcJtMsRz4DDdPXj3+rWMV+SLtzE7k/+lCwgo6y6/TDhc
	ALG9j9kPXJ4O7rzeKgM0ZmeLy23dbG+gycZ2IjhoaBwlNEHfsmzriwYU9nNkNENLj0LED1NMyRJ
	LtJGOPJ7qfFfbNUVO9MMIlvD+0NPUjr98Zsg0
X-Received: by 2002:a05:622a:256:b0:50d:84a7:72d0 with SMTP id d75a77b69052e-50d84a77971mr81301631cf.36.1775458187171;
        Sun, 05 Apr 2026 23:49:47 -0700 (PDT)
X-Received: by 2002:a05:622a:256:b0:50d:84a7:72d0 with SMTP id d75a77b69052e-50d84a77971mr81301211cf.36.1775458186249;
        Sun, 05 Apr 2026 23:49:46 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2738sm38990714f8f.24.2026.04.05.23.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:49:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: tegra: Correct Tegra234 p3740 interrupt flags
Date: Mon,  6 Apr 2026 08:49:38 +0200
Message-ID: <20260406064935.27968-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406064935.27968-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406064935.27968-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=667NQRhMGe5QZ07dEAVje+oTMyUEgodF0NM+DUxJ7mU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp01eByquHPkagS1bYatYCm6SgpAPhiCVyUBnnb
 PHWgFrLDC+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadNXgQAKCRDBN2bmhouD
 1+uLD/9BRfbs8ekHOFJcYXSjhLCsQA13iGrTTUvABL00NWF+4YG/WagQvdiSWF8h4V06oPo2TMq
 faXn6PDkO0mWrouXtDP3d1d7ydIhNwTE2jlKBpnlM4jVvuGS1AfBhxicH8XLks3iId+YqGe3GER
 EOuQm5aBdC8BTgH0MHUFL6zZy4zvto5b0kqbwrD+E3ktpwubpZQ1muCOna03njKAU2VMvGsrRwU
 Jk/6f7ShdgO+ZC7Tilopu22Flz6EzebQ+VLJra5cKhUWoDPvFG23eiyIVotREFNj8UL/zj1S5zm
 u/C6zGIwd6WzDtuTqW3imeXugVaLT5VM6N9DajrQ09i+NyxnYzgw/VGtwcqsaTOTroYUaf8MRHb
 qunGplCZTjUNEoM7H2aKn2qQlFhXQTwaKwbI+fKpB5QtjxiBbz76A9qqgVMuMBhV/j25oIAvRPF
 oqTbwkG9F2fZmcBrK4/YeBGImRzjJyTeMtitq2AW84sfm+7CwBNOCnwRDKs4OBpeaSV8Q5+5zOO
 0X+JiEZOizapBO/iPFYT437dABwMpApEvA8T+fnVlZqy5QtHHRlHX0OukP4NTftK6zZ6Fr7rem+
 lMVbri8RSsuVJ6K67POMkAwsQBf7JM2Dpixy2W1YH/Cxoa/obDLpTTxfYSYJMDcmZz5BIorntMB fPFbb6lkGdwXIfg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MSBTYWx0ZWRfX6gsrblW6vxvn
 T4LLyhgSRkxPYqlvntGK9TfK3xq4iduv33WU6peC3AOsoU6GvS9tKMG0JY+II7yHJJaCSCe7KEY
 1qnbvCEAF4vXQMKeyt67/HZDdQvonwziPSrLr192t5zsCCPYqicsOQDaQ0BVnN+/EXOu2oKyiA/
 unOZW+WVcT8LURggncivQ7NIoMMHfgSalMP9301x4CopqY/iEfLHLIfWRG0OjnMwaiymFsEnZMs
 7NRK4wq4D9V9qB1f74xa82XKxASqIYWbkzw2XJdnuaHez7pg1wqzgiLKIMooxZo61N6JIh8rJmr
 hUKm5dIB2+ALf7woY1fZOok4bfP1wn1d1iqrXGtX+JDQ3mptQJSHHAUZpK72Fhyk8JV3DRuFmXu
 2xAOT1uIAsPA+38yvGc2rk2I7GGLRYLUwjU7VHhZ3S4s0Zcv5ejaislEl0JVGJzPWu0nJlIrDJj
 yCQvGLSqqyY5YhjNnTA==
X-Proofpoint-ORIG-GUID: KdjfwI-IYfbx7Jl39y2tRfEnfrKNgM31
X-Proofpoint-GUID: KdjfwI-IYfbx7Jl39y2tRfEnfrKNgM31
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d3578b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060061

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Realtek RT5540 codec driver requests interrupt on rising edge, so correct
the interrupt flags, assuming the author of the code wanted the similar
logical behavior behind the name "ACTIVE_xxx", this is:

  ACTIVE_HIGH  => IRQ_TYPE_EDGE_RISING

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index 9ce55b4d2de8..97cede1fcb70 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -75,7 +75,7 @@ rt5640: audio-codec@1c {
 				compatible = "realtek,rt5640";
 				reg = <0x1c>;
 				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA234_MAIN_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
+				interrupts = <TEGRA234_MAIN_GPIO(F, 3) IRQ_TYPE_EDGE_RISING>;
 				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
 				clock-names = "mclk";
 
-- 
2.51.0

