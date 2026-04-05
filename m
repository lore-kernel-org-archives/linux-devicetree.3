Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF013019AA
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399662; cv=none; b=UnJ2u9gEpImxMJNr34e8ozA9ZmTOyjFPjZsMIslyqgCvZ+lV8EgTS8bygbMa3LVPMcqrU0+x2cZ8yZQxRyn6lNZtjB3JfEbU+Tx6xEzGHjXvBTy/v5XwQE5g/6SITZNevPpmc+RjhwwTfVhAoaxQ1KcgsgiX9SfeGXJlBiaT8t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399662; c=relaxed/simple;
	bh=v/As2lgvj4nEccaPMNbc8+T6AhYK6KjF+ymCj5u1t5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oGlXSNANVhS57z/+QNRAXZ1luzrNK2fLAYn3Pu0aOCTDxvFlFwSFRivaVB2r917gkGnOjPdPcfpDXwdJtwWX+ImcfA6ElIm9PyV17ZpMacyjjSAV1Hwxs6BSO4DiBdU01I6dyzVU6hBtaw5PCiRXewcbBubcmuphTvfbw4nLgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjS2rqiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R11mMnpI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjS2rqiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R11mMnpI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635ATvPB3204592
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 14:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pq0b4D6oDOEBLPSMi+uQ9Ri2dEKyibd7slMRg39VPNI=; b=FjS2rqiMBWsCUGJF
	+Ra/QhRB/mqTnHoiXaIT3c/G0RuITFisnBQOqGKgMSo0PNedMtZP8HJRXlMNlgo+
	v2B/XxrjECUgPjQZWy1Mfn+4wBV+GxsSxcjgngmyfmFNOORzocaMu1qkhI81yjNB
	ynmT75TqyPIScE1e5iW4DdCJOwoTb/XrGCS8ID78BnSe4mQdQUuezHXEHdHmvEqz
	b+cfk/wJHOx9Wfwso4ErZ/cpGK38689lFHkfmZoQrjCKp72YFjhuRm+GzoYbSHcv
	VqJ2hnnxQtNgT9GOMLmRymsU2/mvF0PlvwnTZQg35ymGF6ikw6/Lf9wxmG+HX1lS
	MskhQA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqsjjkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 14:34:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5aa81907so76986071cf.0
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399658; x=1776004458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pq0b4D6oDOEBLPSMi+uQ9Ri2dEKyibd7slMRg39VPNI=;
        b=R11mMnpIDTLKh1WF5s1wpJBSIZ1xDM4xfQub9syq3zyAgdhFEQoYDztMd93N44TomS
         VNS59yYJmK5tr4zSNUXfRoHs5lkpV2BDPl27htoEEQiDQ0nSC5HAndIfMi3g034YniYq
         9QikWCDGK+Pr6XJU9E3JkX23lKJhw/jwIKUmyR6iPskprFFJdTsY/9Ifcso9FRvN1kww
         VkLqrn2jtkxEJZTJZoqyCT0r1spYZRAcf4VIMrRZn+xJ9Y9Y4pTlWcMWIaY248fzRRb2
         wtxeuMiBYVvaCXlqBtVK8cfg806T7bmsJJx/X4JqwCwnxiOKkeE8p9jVNLcARIqRAv7L
         pfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399658; x=1776004458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pq0b4D6oDOEBLPSMi+uQ9Ri2dEKyibd7slMRg39VPNI=;
        b=PodCahtgcUpyLiJvnXFUONLljxCOB+RxFiqG1PP5uLAQLkyJWlEXihjoVK9km3pIIq
         X/8kd0rj3BcYICfNaA5Zhe5iIDZnQ4a8Ieh+YoUDNDFhQrQz9NasKPTimNZoj+f51Y4k
         ZYFMOsk/8ZkFqH/T6TdAaeWn/sBqfR6c0JBA97MFayr7bNhYwBuZne7Ekxgn9vLmAMid
         Z1JUm5+Pb2zjR8EDFVyrcrxn0kmfbJuEoTguwmNjA4RGubEgeLiYjKBLELMW//3Rerux
         eQUhKg4ScyYThndHOdfJMEjd3gwaNu3aoROXEy0Szvbw20imMYt7h070CDijIvyYY0pj
         xSpg==
X-Forwarded-Encrypted: i=1; AJvYcCVu5h0L+MgPx9za1hrxqs1FVrGJP1dH/1jn9lonWbdxvu8n6k896E57p1r/GsocDC2P+PqdkqCcDGUU@vger.kernel.org
X-Gm-Message-State: AOJu0YysogOF8rznibOA07BhjzVCo2tfUSV7CgAvwtboq7N+5JzZrvOc
	zPsPE6JKzaenG1Fn8XbYrnbw0mJcH2OJuKeA4gOv3F74o0Rr3RugeGrCk1bNmFhlH1T9gDXb7TN
	DQqof6mG7TocKorhFIeIJ2oUHzM/0pZ2q+i9e43IimoEm7phTihkL+XiVmIe7CF0/
X-Gm-Gg: AeBDievpZ4RLyVTZgcjpdplW+senJBjsJPwCWJrs5djv47srwbOq9EqFgGk76exGKA3
	Zu4pv0cyacKNVQeplN36eTXUjumwXs1o//xM3f94/Pjjh/9lbV3hZNnMMpa+PrkZr3A+mEskegc
	PX8iQsDLrajK5YkwItJir5W9V+5pyH3uL1h5Pe3F8r7DSNeLsipmhPJyEHj/QQMrEuzeQVoeyq6
	QDLCDwqtbBoUlE4rB0hOXj/ckNCVi6zoCkzUk/Y/8StQaedXRnYIck9GGxEHtWx+yPzxFRD3DoK
	CstWUkS+QSXqJStozT+epwAYbYB9qGwqDt4Zs5xz16MMLyUqlTX9dOieB0yCNikexZwuK51zfDg
	IWcqhNh5zjEI7QL+oPLTKNoMyZKii+4IL0RYyRRaCFUI0
X-Received: by 2002:a05:622a:1249:b0:50d:8d63:3899 with SMTP id d75a77b69052e-50d8d633997mr23573871cf.14.1775399658297;
        Sun, 05 Apr 2026 07:34:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:50d:8d63:3899 with SMTP id d75a77b69052e-50d8d633997mr23573511cf.14.1775399657779;
        Sun, 05 Apr 2026 07:34:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:34:00 +0200
Subject: [PATCH v2 4/8] dt-bindings: display/msm: sm8750-mdss: Correct DPU
 and DP ranges in example
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-4-34f4024c65dc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v/As2lgvj4nEccaPMNbc8+T6AhYK6KjF+ymCj5u1t5c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLaE59TNemyZueMtXcpDVJZPk4CYrSmvb0D0
 vSqzVK9qMGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy2gAKCRDBN2bmhouD
 147GEACP+6i1YTGenGOtQGzfwjBkXETv/BUdW0/x/4jVBv1zNF37wBK7y3UxrXSF3P3B+oOxZ8t
 WpTyJEmTs9hOZ+GR8SRT3qChNN/UxFqX2qwmGetqvOXLker51fWoqecCCKkLxi7kkuBIhtFN+ch
 pIsiQDt5MwFOopTbZ3aUSTe4QnDoNyJcYvTx8RlytLwLeLK95m0FjxfUCZMJdBBrgq7+kebpNYG
 TF9zc4xikzuZ7lrIz680IsE032iEoQC8/F42jmO/bGlzYEFBaBn4Q5WicwyrtlztfHIxi37aNW5
 SFDUQWCXGvrg/mL337Cvazv6sLAlO0NIOEuE5ZzsSHPCWtINPlmUsNYHkReBzaVjX//T7OLTx2X
 j7eDIzCjuh0XATCuMMkM57sN+jEvYF8aKrrh0iO57Vk3nD7Uy/vnxSXhAn7TGnE6G+pGU6+9ZQK
 MlPJ8Dy+N7pKfcAQE9dhv8CISQ8dWvQM9JXn7ahW8GCyq7I55SB/lnw3v+ah4yeb2zWbqz2Hdlm
 h1+hjjKks0gs0BaZ3YWYQ6O+8PSx/vWQgKuzLi7v4svuRCV12f23AiIc2X3xTy4jZW5LKxIXolw
 ro0oa7eb67Zs5y8UZbKZUTELtZVQS+BC9TDQPlbrNzk01k7QOk3uadm8Ml2TE5AD02EscPoIZMi
 LYizeouJKzV7Yxw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d272ea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RlbI4P1zFy3kOpNnRyEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: noeLci2uI8BgJlAEdWW9os_5aRVIMZte
X-Proofpoint-GUID: noeLci2uI8BgJlAEdWW9os_5aRVIMZte
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX3Q4VvrdEkLex
 05IJjwY6IHJnpp8nPRS+Ks7tbGYA0WVRa4m+BlTOYxEERXK1RRGiJZY+DslQM4PmyUu0DFaBPN6
 yMNJGyB+q7QjQL4wKsYlSpxc28V6GFWRlBktGbHvCHvN/yWDFxu8PKzNkMj9Vou68YXmkPo9FzJ
 H0/iq2Lqyftx/QKBU1mqE7KRc3LdZy/ZNG4nnBbjj5/DMoyHE8LsulXlYoFQelcekHXwljXQj1v
 sI8zQcdanXdY4J7oMPmE1PN3odxpujCicF+hdGIFy28D0e9kUpUizBAWfcaqMZJeRI+wdt6YyGV
 XPS0KIF4ZA5e8cqM0K9cBzI3P0mCtNE1C5p4VBSe3S/7DQUR3lU4AKnmhiGaEz1S08hr6Y7epKp
 QinPwntYksh6Q5WVuPm6jCpj/XnS0DdX5V+Yi6SrasNeNcKjVdorTEG3Dt2TUVG2VkRV+J0khsG
 Fp2CDyNM9bqw1oAk1Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050151

VBIF register range is 0x3000 long. DisplayPort block has few too short
ranges and misses four more address spaces.

No practical impact, except when existing code is being re-used in new
contributions.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sm8750-mdss.yaml           | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index a38c2261ef1a..46dc0d28da29 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -117,7 +117,7 @@ examples:
             display-controller@ae01000 {
                 compatible = "qcom,sm8750-dpu";
                 reg = <0x0ae01000 0x93000>,
-                      <0x0aeb0000 0x2008>;
+                      <0x0aeb0000 0x3000>;
                 reg-names = "mdp",
                             "vbif";
 
@@ -389,11 +389,15 @@ examples:
 
             displayport-controller@af54000 {
                 compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
-                reg = <0xaf54000 0x104>,
-                      <0xaf54200 0xc0>,
-                      <0xaf55000 0x770>,
-                      <0xaf56000 0x9c>,
-                      <0xaf57000 0x9c>;
+                reg = <0x0af54000 0x200>,
+                      <0x0af54200 0x200>,
+                      <0x0af55000 0xc00>,
+                      <0x0af56000 0x400>,
+                      <0x0af57000 0x400>,
+                      <0x0af58000 0x400>,
+                      <0x0af59000 0x400>,
+                      <0x0af5a000 0x600>,
+                      <0x0af5b000 0x600>;
 
                 interrupts-extended = <&mdss 12>;
 

-- 
2.51.0

