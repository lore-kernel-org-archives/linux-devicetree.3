Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A423002CF
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399667; cv=none; b=L+w7zbjwPKcKGwSLRasQ58qRhKWpNP3ct+tRF7WoPpJEgXlfSSzHbpBNWC8IgxImlVDqWgDhENOUVk4VxHnJXYccugfFiybYI2SSUQr8x68HGOIuG1nWsya+GJ+Ao2JRBzaf6Xqp6L+NLfX1wUbq9xvKbfbGt0zK0+9xgDgNh8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399667; c=relaxed/simple;
	bh=D++Wl73hTbYfSyRKuH5nKLaK34f/XYn1VQrydlWt6hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J8KIob78DXI5oHSauTI57SmE2Vo//G81AZmsyTd9AV6hmAaSs3VOJ/H68JZDghgfVi0X9MRUZFWZKAhQmuMdWPuzLIc0l220DqAaAFzpMITKBoJtAlQcC+VVSXcLjyHDKhrN8BpiTaixkWUM7VgCGiILKpNPfoQ4Kh6nJJzvTrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C46ZUBnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enAeRl/Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C46ZUBnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enAeRl/Z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635ATvPD3204592
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 14:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vAMWoWte2Tjn4Jl81QLiLfqRU3eA8YP3AzsfgymsFwM=; b=C46ZUBnV+WbMPMdH
	E3EdMBCY0rKBrdbYYQayBKHjVkXouOZHJcvOY6C6TI3bZzgJR7OdhFDtRO/h1t2c
	zyDMZlNKOf+0eRGY1iIxYxxwX5G5YI6FErDDIX71ygzIrBYlEyAU2mJi14wPBM15
	kMDwfo09Vpq8T5/i2Z+LBT/Sedt3pZ3mRglsioSWm4V8A5dOZ0Gqvf7A7PQ0oeWM
	ykyc10mWXf+SSHa2DtWmgmYXyETE0QoQk/mx+I6EoHAojU46GfA561NJBqxRAiYV
	zIaSCeuHJ/rZm/431rMd6XJBt541VfKJuRYxLS4DM77HtO81S0ZMyQ/SWnw66Yzu
	q688Nw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqsjjmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 14:34:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c192b3fso11437681cf.1
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 07:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399664; x=1776004464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAMWoWte2Tjn4Jl81QLiLfqRU3eA8YP3AzsfgymsFwM=;
        b=enAeRl/ZEuUd3FVYIYmWZLNwbnJSXSSKBhBeZtgYF9g3FAh/f3Y9SrzHrxVKSxhNju
         ubjUidelj9ujsQVi4S9lO0wT0J0GI5jH/SDtQ4OuV3ircUBUtp3wKlQfn/BkhYUkjd9B
         6br6nwJVsHTEAjHa0NcdNfsS3HlsKGoAn7+I1jNlJSRyAf/VxNldiPn8MI+3eNWWnec9
         sVzYJ1tWNWakWBB4uXJNlHh1qcSgsEuMIIQEOicXUCXK7AuFTklFsnyUAxBCwWSBUtHF
         ev1oXGGfNyX0yMzTq4o0Hxj/63uNYCKXET5lXjrgVW82f3ENfC/u1txxuovysNcrfoSy
         cG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399664; x=1776004464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vAMWoWte2Tjn4Jl81QLiLfqRU3eA8YP3AzsfgymsFwM=;
        b=FNxIqB/WeMvf2j6talP6EvCgyZf/pRWCN7la4rWnGBqtgMhTC5gKQAeoVROJJrmhPy
         FyBEvXDz3WwEoaVBYImgv27ONy+Sk4s9jGbW+0E9UReplFkb3CvHFea6BimhPynbYyAr
         rqomFlkQ5BGF/8ds35BFAkNt3+1MNadxncHISLRVnd+nIIgDEq2KzoZcNr6CyWnLHXs0
         iJm93d9JO/bi4ciXPjd4qWi9Ld7Uv5rXmINi8KuTtmR2Gk31NCPDzlWKPhS7xE89M4VY
         PmvEuh4GpTcv3nxGEKNm2jb3VxOZOTepTfAaJLXBsxHYi4fFeYoU9R6HKa1d43KKUPWr
         P9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVNwsBmU5j3KGmVLx9ThwKIcq7HcyTOAy1SCUgE+yOK7S8ZokXFnh9jk3G9mgd6usUckm7vKyIOSq1C@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8BhUAE2dPDIraOVYe8TK7MmykEwc8lSsF01kC+ad5IfgcKC44
	JZnZEuxF97l7EFAd+6qkmdyvJf3/7wYn57gj5WrECSBQR7XDmLboSo1Qew7TsiNufvhbbqcsqEo
	HpXDnYR/ksSjgjFrCGIFXN0YLlcuFRG58MnSAkcFMdu+Rnn1tzFPOuFcbjx7uNYQl
X-Gm-Gg: AeBDieu7rwZjqJunG7xxCs+F6UH4yg4GlDOUzwGnB+//6qVVnA6OJIanugIItJa/j0s
	c01mDeOp3dQLVF9n/ImzZD6DZrzOu85+bSE/G4wKxz3IXU0j1KXPLkWCPOX+YrYdBV6F/qpXAQC
	h0SfjB+V1UbGEznXi2zojEc3MAq+SoIs/XEpVQGvic4Kv8x/oW/gth4JrHSacU6QWgf4L0YBXpI
	Obj+mA9DNPUqmvIhuq6fUyjbDNhaYmxvpuydI8T0jV/aI6tdaYfggLxgVjvESQTpJkhc9XRm2kS
	EAm3vgSLlctgrklKNTKjelvjbLQ7NTr9BN5Scscn9YgkQlzC7sI9TVN9/JYp/B/tGkJcn+cnUUi
	sRnKplmkqnGahFM/NnRqqFYrBF36X6y3lIj34rUIRSqIs
X-Received: by 2002:a05:622a:44d:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-50d6209d94emr162546991cf.0.1775399664561;
        Sun, 05 Apr 2026 07:34:24 -0700 (PDT)
X-Received: by 2002:a05:622a:44d:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-50d6209d94emr162546621cf.0.1775399664148;
        Sun, 05 Apr 2026 07:34:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:34:03 +0200
Subject: [PATCH v2 7/8] arm64: dts: qcom: sm8750: Correct and complete DP
 address spaces
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-7-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D++Wl73hTbYfSyRKuH5nKLaK34f/XYn1VQrydlWt6hM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLd9mCeRR/2R5Hwx+8lfcB+uXg4NX1Li12LS
 GBvIY5NX5KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy3QAKCRDBN2bmhouD
 19LmD/9C/CNpAsJJ6szXCf/YpgJ5fuVnArSTkVVf+5ue8ZCbZHAHBnmF+r2No7DQxXXgQxiiKeA
 FdAto7dL70qr6eubHNtcPR8f+i2tqzAWdbiaEhdXGHSMg0xJCgSseQ5B0lVKSlEFlosYAVdJ9p1
 VHgA6DAAwvu1dwGVXdNWrvUcBzwmATDM3gbnOF0sULgyV7BklXrXlm7ARdzCaa8dZ5ljpuwC6jq
 6nBOijC54/NzscmQ7ezxME8F1L+fwdwgiYYnaM6R2goKQUQQVGHXmLFZgKZKclB2RCYsJhJPXGn
 D0vm3n//0Equ/8UivYmC5PpIReRPEnBifRl0T00Tg0NmnosmGYOTfSXDTRWTps/eVPNQPAMDER2
 ZSUKJodX65nWsgj1Lum1ZTLP3appBWHQtiUs4UcHsUIU3hcljDJnw7Bb8j/l7aog0uyH+94oJUc
 GmLmNxYq1VmHSK0tkExiE7t7sFo7n6IQ1t5wufqUT1EO7iYWv+liII8WUV85a/sSs7jNmQfEJqO
 2xqb2zUzQkkqfuXiioK30Gy1Du0lgtlExdTRrelOgrTW5K07PZPB5CC5dt9tJwak+a3O3QCxCs5
 QfQQiJFco1JUBcM+eG+OMQTZdocamKTh/+hJf/f59UDJdoluJPbRjkVxNpJ41Ilzz3wsawHdMl8
 h+b0hOHzEfDHizA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d272f1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9LIhnIfllzZggS0j5EYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: zSpErWXtIvFsgSgOgtspR-XUszWRaitB
X-Proofpoint-GUID: zSpErWXtIvFsgSgOgtspR-XUszWRaitB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX4hM9X3gCkLoD
 2WlXy9o7SJYBx1umtPrjdurPmwbPmd9qJk3JbvqiC0NnDE5cOkoaA8199sNlIauj2SJj7UDOHJ7
 +RB3b+tjh1Ls6S6kEdJJjakqq37VofAN2viUQIjn5/8nccO3Vj2iRzdKidK5c5UdwdI1MqunR3x
 uKtKT5Cp5l2gzJLlUnRXDcyuAYLgfOSa74jG/gFBzm2Jqxvuo0FbM6OCc9+EvXuYMaKvRPiMF0t
 inPciE/m67/wAoGzFLocOGH4C2us1YtiYL3qxP3/KMwlFHh+xWi1FDJInBSfLHu+OgiRV0GsdUi
 xO5HjmbRAu9t2LSjllJrBh0lHCQgeIjw45VxuEzydvneiQlwMTSUkIzEqx02s1Wi3KcdgIp3lpV
 zTABp7rNrum3KZrrLMpCTxSxorF1Q3tYaMC6nqfd7djy2KFLvc4F4ONR5lSp4xrxzmxAhutPsVp
 srGPXJJGmvVad4I46lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050151

DisplayPort block on Qualcomm SM8750 has few too short address space
ranges and misses four more spaces.  Complete the hardware description,
which in the future might be important for full feature support.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
dtbs_check success depends on the binding change (first commit).
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..aefe517e0669 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3325,11 +3325,15 @@ mdss_dsi1_phy: phy@ae97000 {
 
 			mdss_dp0: displayport-controller@af54000 {
 				compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
-				reg = <0x0 0xaf54000 0x0 0x104>,
-				      <0x0 0xaf54200 0x0 0xc0>,
-				      <0x0 0xaf55000 0x0 0x770>,
-				      <0x0 0xaf56000 0x0 0x9c>,
-				      <0x0 0xaf57000 0x0 0x9c>;
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
 
 				interrupts-extended = <&mdss 12>;
 

-- 
2.51.0

