Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3D316189
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100423; cv=none; b=rRTl026Jgwd+/EY1X+p5N6n8+6MSzD3Hhm3gzi2hyz2XgQjtZFm6P0oE0LTP/83iE10Ge1hy1kKkqKqUbVvfkVjmPrLhz8S/2dXzu/IHSTLJaVBR9qNm/nMBEF6s4XLz3ssL9bXpyfi7tdw5AtEVsEpTauykBm1cvzTyVueld6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100423; c=relaxed/simple;
	bh=VhEbUk1qn4YDvonKrVyzLLile8oLTXo5Zt+QFXASqso=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o0ajlzSELDKQdFEA4ybU3UaZFzm5iCuddGg4zAsishMmk+brK6uOZKZdk3++/TC3aenG4ZjlIO2KfbZIEluBIWc0BLoljtFNvM3uZZw6hGrto0EQ1MylLM9q8yOnR3wTV9PwglnnEuVFvtoBJqWdaHzVXv2hXaxNwbpwBsXuP8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6/Tg3KP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffrbRsgY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6/Tg3KP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffrbRsgY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3JQeK1727122
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 07:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uwC5mL1xfh1
	AHGE2caBgkXGnAkeW6s6MztU7SU+1oKE=; b=K6/Tg3KPq68RgCj77DQeBvg8LTk
	msfFsI/az+anqAs3FcDle+P9aOX12+UqxonBvoCdZugzhGPxHwNUDr2N1A83+WXB
	INAW7jkJI7zsUzCfArQKZLTkpF4GRSrX2EQA/N3zWL5DU1x0QO1g/d9UcyF63jZx
	MmZtvPE0q3Xa79Oc8s0f5UOAewaZ8TEcsGiyhl4FJp4ioVyjFi+rKfoujkQDATRk
	Asu62rHjwcz6QJILTZBmjneaoJe12azmSxj0icc484Qn09xrbdU1HdYWFOfQ995u
	quzNWi28WH2+NqTBVaZejixG7WUf0YB58z3RtKVVSKz5T58YAjlgBrCGbpQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx8c70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 07:00:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c726f4055so8675473c88.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 00:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777100416; x=1777705216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwC5mL1xfh1AHGE2caBgkXGnAkeW6s6MztU7SU+1oKE=;
        b=ffrbRsgY5Q94vdpzZtzBn5a5Up3VSRgcUM1gcIdJXbCZjVNbGgK38jpt3SMEnTg60d
         o7djYSTvyo77CUcTZoxFtlVp5MuGLHc2V7mX+MpmCIHzx0g7DhvwgG38HuMrDHlNT4ZZ
         Eg0Iu/GcZ7QsdcPO4nQUKgtpVQSQS24Y3Qq9zS3we4P0++r7ciwFVpe2Uzkn22mCu6nA
         lGuyzroneoFwuVu4M4Bgjbir0a9rSqOFO7BhTDtKHeBwbhK24PsgcUdiFtEsHktDp3Mk
         WV2SdWC5THGsefBWVvmo+AEklILVNnM+BfOiRSW8YUuioeluiII4+CgJicvfDZ63neT3
         mpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100416; x=1777705216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwC5mL1xfh1AHGE2caBgkXGnAkeW6s6MztU7SU+1oKE=;
        b=S9cCQFVGPbIAKCjdqf3THttrIpLEOGu0F7UIZe0AZiSRUQUH4UAzDSRUJoz+akPLAL
         fDxN2SJNYfclkItbXLgP4UQtGpFfWhQAJ6n9bHKROUlqrSON14Lwq87UXLAkr6h/2NZ1
         xDWoIHpt4OV2COY0W3dO2gtXxureTOcHVmzU+JW81pgfNnrnMT74ywRN0GLHiSE3u1UN
         7PKJDHDniKk4ho0qN2xwuxeOaosLnS5mrLfKqDDIc1U+BUGT6spBb1NgU8tLLZ5tY+69
         Z7f/eMoKD91Mw7Wl4W3XTjkXG8KUmwqQ9olohham3xHtLKxb0ZcHMOig3HJ94doDiScd
         YyCA==
X-Forwarded-Encrypted: i=1; AFNElJ+iuVUOZFKO/lixNp6SW4HWoF1jexvNhmEQEc4dCGUb7gr8labHpnYp7r5VVGinMYtEA432kzRovfst@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgFjdaLoWUcOpm55g3Gus4mfyLuBfAyZRbJubEKIibdHYPJPQ
	S2+QyZlWirsoji5CH68yn/9ofZGTA7u3moD+KOChOpI9sDwrgyr5eTrFXV434HK0v1hMokn7/xq
	hOd9j95vevoxFLPRa4Dib9jMQ8BVMh5py6lvdudBSiKoDPLOBy0rkOd8d4iTAzBk2
X-Gm-Gg: AeBDiev+ofMv6xdkQKidlGKH+f5LyoSgKEB9059PfxEYSjtksbmCfwWRnJk79rGTvWu
	FAxpdcujz61RqmsaknOY2RybbUue5AUm8KFfA05I0FYozQtJDovkSfVzwmUN5KuwDl7YFYw3GNt
	v9+/uzLziADWSyJIyeSiIl2DCdaSheV4yLxMZKjZLfJ0z1rS5i1TTHfycThyZWrdlHw5ag6Y7FY
	yUKm13hEWsLLnZ1Q8X0usgnlB6/FcL9fjm03hRDwuItwObISosyGvslUBb4f6zRehIaR5QA/swX
	vCAXERUtz+Ui3p7z/4Mso44OeZhBVaCXo77rPWTy2U2YdL3bM6msIun6Z3UwRV0lqHRI+ILk+dS
	zQW3oRIQPivZ5HFukXx5A6h2KEjxUdQQSmKs2909eMtxE7/0RjFmxEe5KXUHUEll4tc2yG2MSKa
	BF+U52BNRyXQ==
X-Received: by 2002:a05:7022:1282:b0:122:33e:6d41 with SMTP id a92af1059eb24-12c73f975e0mr15319074c88.23.1777100415259;
        Sat, 25 Apr 2026 00:00:15 -0700 (PDT)
X-Received: by 2002:a05:7022:1282:b0:122:33e:6d41 with SMTP id a92af1059eb24-12c73f975e0mr15319055c88.23.1777100414748;
        Sat, 25 Apr 2026 00:00:14 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc2dfad8csm9430630c88.3.2026.04.25.00.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 00:00:14 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Sat, 25 Apr 2026 00:00:01 -0700
Message-Id: <20260425070002.348733-4-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JbswFa-_XZnCwfTZx_Vh2sZBe6HbWZiw
X-Proofpoint-ORIG-GUID: JbswFa-_XZnCwfTZx_Vh2sZBe6HbWZiw
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ec6680 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6lSwUGAo5LeF7p0M46YA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA2NSBTYWx0ZWRfX6qDkoNLzI400
 mp4lnawuokasY9T7zS4Sqmt9zsM95XOzAs860V0x4FgMbu6aoYe7LTd+GirN5pMhWD+zB/Durxk
 CO4pC9VMdtBPiO4AL1grj3XOTfF3YzfU9F40f/nGAy0qLe81vYVgX9gIuX67Zsuydu8b+ek3zbi
 +HcDwnrdkqHoXnNrgaJL9awC0/7of2/8VEL3mMH5qsppOJxjTrsT8p+cFdorhAUruNxDoMbQbyP
 lsZW39CVk/KgyxxfVOVvJicSIU3pF44L3x5Zp8JgZ1hui+fTf/nvU2xVEVqSnK4hS3MXV4EKC24
 rqUi0m1qblPBKg7Ws+9SCzGMYyGDwXsn/GgPyBtRtYQCwi2CF3CJpAE0RiSMSm1vMfJV7qumg91
 n6ex6OSTJwFPdK/KLMnL3SRxIIY/MTbUL+ZszfuBHzb+pkX9pB7e+UXwYS6rXv6yb1bixss00D9
 Kx/wEtwBz6N0dWxvLbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250065

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..2d10994f7b44 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -540,6 +542,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.34.1

