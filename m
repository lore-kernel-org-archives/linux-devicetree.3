Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983E72FDC30
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399659; cv=none; b=pToulyQrMFXmdWsVim6CRDVBc5jcBuyJW24McklhCYwsJGxzLYqMrfs9ohY+ZE4ivw4dVT0ty0kl4nBv/qqHfzMfirkoGrFKlGr9aQQg3Hi2Jvrr9aawxCwh4Y2uIs6Zt9zzjpgzQjMQqNC428lc38zqW3+ZAokr/nwEga0B814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399659; c=relaxed/simple;
	bh=/AwuQ3slvX7u+zXvSCxYc/1viX2dd/v8iApXYini06Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaHdm7H1RtoqkOkBCmYWkTtRLsm/4iEh4dURG3x3mNz9hy0bW3NQW/mqYejLsGYl/ennhM2F4ntOoMxXlDTR0DtRB0FzOBJNS6doVBJiQ9sWEQ0I22Uzf18j54HHGi/cQUN9abyJAv2evSzt9Ew/ltVcscnNJ73BLdDJSnXnfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/o5H1L6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avenTjJI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/o5H1L6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avenTjJI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635E06jU037216
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 14:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bjX6VMKyzRBT25xOykCqLKOuijJg+tPjmnlmSr8nHJo=; b=S/o5H1L69bXR6c2e
	UPkgC0eXKB2QLbMxCi04URc7urTKLNMLW6rD9pldZCWx/C7ikkzoDg2DHD2JGbCF
	S/GUMR2ebwaMdNz3AKVRSugMD7XVXhrc3eo7Tj5pxU5erNkf4xQ9navxz38aimYn
	2KhsLqbcvmQdgHpo0XTFyoE9O8Ra4hZDtCAX70jkF5oh/ks8HFAFsHkieQPcUn5E
	bLCAgj/L//vNNHiNZB2LfA989QGFALod8HiD5VNZ7nwnolqNfJK4YdWfmbYyzfX1
	VisKx8zsp4L22zNxjaiYN0jZ6lPqRRLvytLEh7A1gt8XaXvbvjQR0KzQr6i97Hks
	r3Y6bg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5tr0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 14:34:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a275472d89so51404886d6.1
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399656; x=1776004456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjX6VMKyzRBT25xOykCqLKOuijJg+tPjmnlmSr8nHJo=;
        b=avenTjJI5ERbP+z6YpQgUM50j2pV6rDF6IklBylGwfDkJ/6e+o/T/8I3IS+Hu19Sqd
         AMbKEdqsLEKjc6L68hBNbTHAAdxviUtT31oMKMdWRT1vo9Ey9Jn+k/bmwUrWy2Pm/SR2
         xhxGKv/NZOqdkBIKpIRo3X8wASEKu/qY0Fp/RBTdt2IfCENPvNp3XcQKuBEMOD2ctsRP
         s9O6mANEwyPL1Hp/ZGmt1YGGsHDBOMvMYj3/dQrSv0JKNglfcxSMcLcqYdU+9FHSu/MY
         g1RVUNoHmdDIYkMtV08yN/tXEmHvtDC4tA4xgpF1jDEGX4GLvBvpf++F8/n+PziaDFvT
         mbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399656; x=1776004456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bjX6VMKyzRBT25xOykCqLKOuijJg+tPjmnlmSr8nHJo=;
        b=hGpAdLqwIBoGnIqDKA+4GSm5ayMWZOm7F0FOO0ABapIrr3sbPlQCVAVdq4DUSX7UY1
         KV9Nl6dZCcF+mxIOm+QpGxbt4iEWJpTuvrGkhf88Lih85Y9yYQQwp2XeF3Dyh1wuvhIJ
         flphEpCjVOSFFKsTZcCMl8F/aLKixBqBjhE3nlxmtsS7fEY5nsUDdoy9wNXlyjlXgTd5
         MmdqEzqcGCWLih0UCRaEJrzMDk/XjWDcAd5vop8OpGU8q6j6x3FZWG1+nFbmQjwzn2uK
         nv5e38u+DauJRk850HDWB77tvymq7fS9C7uYRK91BdWRjV79u0T4WvURly7U+OLc1O0o
         7ztw==
X-Forwarded-Encrypted: i=1; AJvYcCXjjyD4kMMXIbxbvO35xwBs5QCcgYgMiE5Xcit9Ks/k/zAjiK5hYhpu8W5f/6gIkAzzGLLnKG6d3jPi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv++ROAtFw9QmnOhTWDEpp75/03ZF5SmbK1HsXYobGZ0Hq1c5T
	X6J0nFeDgF4n257aFCPLbxx6VJER8fEx+D9qONhxc+BmEtwuhj/LHorbGQ6Bqbzj813vZbZ1SRK
	z1d3VSXxNrW9wC0OF/ThbAa6HJj6fyp3m0SBv2LnKKuNNv9/NLq+338qUD4ZcvTAU
X-Gm-Gg: AeBDiev22dlZfHl/ckP0Rcfk7+00E66EmU6esim+5W7GHZ46/98vd37lk8FFgIMUfIF
	+TZmky/XqUP+/hBxFvx8g+ZE1Qa6goWITqi2VrEwvD8AXql4qAlqdopaYllH8Xg33FCaCNJstR9
	XsnB87HshVPEC8TEhTEaimoJl1DiZjv2jHLtJXzsZl3WjFJN8osB7QKSZaOopGdroOsTqmO2pRv
	e1lVUWNT/Jj8xYMXd6778apkV6R/JMQtj08zZoogRW6bNWFkeFzNRal54S20c6s3lxNVsECGEBy
	FIjNi3qoehS/jpLalLvsKxh47/NIdpf6enRFVPY7M34KxofBCDZf0sfINqlK4XIPQe/Hmu5R2HS
	9jlie2YGqMnNBCI0KUd/qHzrdtgXqOPT4WvPVvfeoPaqE
X-Received: by 2002:a05:6214:5c84:b0:8a1:c536:57de with SMTP id 6a1803df08f44-8a70548708emr136141076d6.48.1775399656100;
        Sun, 05 Apr 2026 07:34:16 -0700 (PDT)
X-Received: by 2002:a05:6214:5c84:b0:8a1:c536:57de with SMTP id 6a1803df08f44-8a70548708emr136140576d6.48.1775399655622;
        Sun, 05 Apr 2026 07:34:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:33:59 +0200
Subject: [PATCH v2 3/8] dt-bindings: display/msm: sm8650: Correct VBIF
 range in example
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-3-34f4024c65dc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/AwuQ3slvX7u+zXvSCxYc/1viX2dd/v8iApXYini06Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLZ3SSBPm/uvtqMOn+RfGOk38qJUNHMZ36LR
 WPRavBcjZCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy2QAKCRDBN2bmhouD
 11NlEACarsGeDw7b1py/JLt8UVRxvS/VgAMCCZYD6oc57Wf4mzv+hCbwSDXjX6zmGav5RC2jwir
 awYxCN3CG+irUPy4UNGXFU46rqIvgLto9f6nxMYBjEAWnsjuumrTUcaNcMnUUQew0NhVK1DQ4pv
 9WbdQLdvCzhPyAzi9uGzTD+HF9Yp9zTzTCk9YMOXjMourdhugsdChVoBKgl++DWCtrbPUUZPE8X
 Ax3U5JeZ4frUg2ZHGQ4ZK4HqEiceR6gId5fG6Pue4Y4Ql2anQ5HtZztDX0XZyvv5RT+MsgbOGlh
 IMlPBOdTsM5LRovKo+M9U+rtXjOF3pSIuf47NxL7QQR4gdjIwP0dlC8M+KwFtX8Abe+C+Mn6Bqs
 9LD/rTM7YTU7JQasvNVbvw6awiWD6xH3B0/nkd1R2kjTJYbOdJ2LjSGSHVBm36Uv41LQp6tfLon
 f6V018d8AXbLr7EoS8TBAMY0f4pHQ4UBeQJDy7jzrkJMO6tVlh+lCeEW0X8HQb2MkM3OUSXEPu1
 Er4to4aVmyJXIDqjwIm3JQQjcYuYB/aCwGZWGyFv5fll5pkpY2YdzVUVFMaNQRjL0/PI10+xzlC
 VJur9JDMKA66LO5dIYKOTurjnuVer81hUbQXx6ftePmx4zMh6pT2mPdgFq45QsSqP0r9L/qje/J
 MAFD2xpfJmOm1qg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfXyEgp/P3M/Hbs
 8iEEUv/2DS9Kb7dPgC717xzDawPD5It4S+ktF42qiqUdqLvLZTnsnd5kjkVv4m/3aHQ+T5w07KG
 deB8Tjsxoktv7l/cGHDeTjondWn3B7ujuKxqP2R2IdzorcFmh4cbrwf2XQf7ls0FY3y57Br41Pu
 xYBBKpgnXbm9nOehhpL+0yS/XX5X0YihivzTrcVFTzkXyHyYwRMsVg260Y343umuLI8CA79mwyj
 gnZAsremTNtJt6iVBtVSLMACRQrSDpmwXBLE3jHuMm0a3XvcIZFBlJOGL2mTeIkKAD3eDdzQdyt
 T5wELmftfc5U+2fVGBlyF8NSz3/pIS86DY0GQ5x1YNXZoeeYmiaSAzv7VWfX2tjaNA+vrAU6NU7
 7MGkFCz2ZZ8FmvFiEHSRxqDGco4XEqgh9frMYb6dk+Ir6txQBhwvJ9IEQLf/5hBTVHjYNdFc6jh
 LaWJyYgIoz+h3knk/Ug==
X-Proofpoint-ORIG-GUID: wvt7fGCMmgJga-x1TQTnWc7Y7M5GOQTS
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d272e8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HWmKLdpjvklgZKno_vkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: wvt7fGCMmgJga-x1TQTnWc7Y7M5GOQTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050151

VBIF register range is 0x3000 long, so correct the example.  No
practical impact, except when existing code is being re-used in new
contributions.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 2 +-
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index dccac525d202..134321b50897 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -70,7 +70,7 @@ examples:
     display-controller@ae01000 {
         compatible = "qcom,sm8650-dpu";
         reg = <0x0ae01000 0x8f000>,
-              <0x0aeb0000 0x2008>;
+              <0x0aeb0000 0x3000>;
         reg-names = "mdp", "vbif";
 
         clocks = <&gcc_axi_clk>,
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index a1c53e191033..0f7f79527748 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -112,7 +112,7 @@ examples:
         display-controller@ae01000 {
             compatible = "qcom,sm8650-dpu";
             reg = <0x0ae01000 0x8f000>,
-                  <0x0aeb0000 0x2008>;
+                  <0x0aeb0000 0x3000>;
             reg-names = "mdp", "vbif";
 
             clocks = <&gcc_axi_clk>,

-- 
2.51.0

