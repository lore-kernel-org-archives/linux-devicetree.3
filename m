Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B970B3CCA02
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 11:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130346; cv=none; b=OoTa9B4RNDekauMfJHWKV7QWbDfgjE0ckFuWkMD7RxtKIM19H/G5FjaI6ahKKFbHzniQyana5W/h6/b9DzW3M8nduTvtHkgHBsjTE/mekxkz8sBmRATYKl2iUNJfjQTnANMiE5nqcgit3xgcAckhtD6gA0oycF8x2asIcQz+Gb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130346; c=relaxed/simple;
	bh=QE38gDZK+HUt7WqeCx4YYalPwAyNS5l9JXKzbJf+I2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MIpp9elAD87reGsMmWG9SJyVIh7/2WxgdJfp5nAXwSEk/6+OVO2qJVdUS3em5ZF9ChA1swrfa7UDppGb00Oyy7sec7eEhUo5FLEn0kyPxCzHGiIZZ4IJV+lyjy1NrXw8Ioj8OFXiWKkX/IvT8RB40fgf5s10sLPbmoljaEciQwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=amDYh5Vp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsdCVjyx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="amDYh5Vp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsdCVjyx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63270xf41425465
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 11:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjwC/vhaUDCLhEP3xKrjmpFxosYiBAU20RYUklLbtgs=; b=amDYh5Vp3V8Lt4bq
	2nvUq32hgCxNtxzLDU86mdAnFQvkijQdNcos4CDGKGJZ32TNwf0CMjFtnHUI8sV3
	MYFsEFbe6S5v8JmEnwuCBtdSvnQ2ZwSnJjdc7mWB9ISSBOprCCSq2+XLsokG3HMs
	D/5OwxGv2VjFK5OTTkPFPVr32z8lnDfmYgERgD08WQj3g+x+miifhjgLuf9Wnst2
	OdqFyDECbxKMmJB1OGRR9JBN2HfvIYaXY8Yk4eApByvTvVS9OJU6eX5+PnT0lFdq
	oTlxvShpBbtCSRRHfkIpnhq8OrhnTq/QO/ndgUqIyCeFwdeCqg1zHbpd10AueQJH
	9p6ADg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511chrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 11:45:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8950562d351so35937696d6.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130332; x=1775735132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjwC/vhaUDCLhEP3xKrjmpFxosYiBAU20RYUklLbtgs=;
        b=HsdCVjyxvinvR7bFdiBRpRM8SiHupbMtQjYWXxU5+Jsr0gbN3auwPk5AO1LVjn47B+
         7dUejXVk9EFz4y6AYlG8YUGP/KcOvELU0h+a3k/75v+KPDfTDlwKq0SSvef6Ih6A6FXo
         KQj/COjLF0QVeC1uvpEgXnKQeoFHr1ZWrbjNRdUKXM5yEgZX8RvdCF7EdUUxQ+SPVA/5
         CTI3gyBDdv5LHaote2hBcJdqCrZ52xzOrE9NKbjNwqn1KulfelgsZqPdZYd1mk9aS2D6
         cK3s6UhkpdnBAjMNc6VjPIueYP65pS0zHivONvvDSSMs1JOonqJeSGdt6Omq4YFM74XG
         p90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130332; x=1775735132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DjwC/vhaUDCLhEP3xKrjmpFxosYiBAU20RYUklLbtgs=;
        b=Mj7cQ77Htq5uB3Gk4Jt0YCODcsDIgUWKG0Okf8xDgyIWTaOc4jodANGaHTfoKPaQiA
         4fbBcJw9iHH7+iJEIkZ8eDBkI95lBQ0xdHkwukqM2s0b2eDUZRT/H4zZtuUUBNcNDpqA
         gE7toxMHHf4Blk8RDh1gZ/zNSrXMWK5JATm0n9s3X3G+jLjYdYBYmihjQB/KUqsJgepp
         GpF4e2oJmhb6tiG2xj62LTPF3VpeBVbDQA/GIBYLfcNHG+ZbOVa6UNbWFVZHvnrEhKUU
         JriEM3+vsUPaausvHPGqOPNyEvhLAfcC+ysF3sUST8DjfaNLgOy9W3gt8fuvsI3eFMLk
         d7/A==
X-Forwarded-Encrypted: i=1; AJvYcCVDHFIq9mgOX7f71e9wi1AvnXfjYUWXJX0moUbpq+hVba7wg6fhhLXG7SeT0bOnDr/GlGYuTgHa7ocT@vger.kernel.org
X-Gm-Message-State: AOJu0YxMa3qXxRa+eBSWfI1kF7jV1vY+cRRKzjwIpvoXHA1m+50In1V1
	qbXC45A9WFP6PPWUct5I0MhzKJWkQxDOXB6aYtddMsp1jUBDCHw3f7zkZXDTIJVQwCM3BRkewU+
	A3tOkwa5ldx6OaievMSbH99u1/zC1g+u4dEDERlXoOvoUVW7Mx8C+fd1GrcLCEo5F
X-Gm-Gg: ATEYQzypcGCwTmSb2bUDmXNXMQkG9RjKlBCdqwFN/Dt/+lQ7AfWnFJnHX8gm43SQf/o
	2/ZCuHAKDRezVqJ1P0fOq4w60LOiypt6mlqcWkHCXMkjKP1ArN4OZD2eZpygCGFiBJbon7AEI9S
	Qd77hELvcIkFDTrXBRoeinCqrEYO4jy0jTzxnLH5nwoov4ba7h5ICi0MpvMyeGCgOBtV/1ihlST
	ZNWwIi5xbhmGXlMHnDGXY7Mjt2xFQRDLv2YbC5LLlrMEMw+zkqjNtBWybeo6oVhfvGCfrL8Q53O
	H/V/33n0bFqko1MJm80SV8V4iDFpRVZc0ZdcIPBBswUKlJ/tdNXcDoKOXNn0wlxcePmpcNEjQaz
	e2smg93G2Xc1bIuaoQfou0mGNv181puC0ELfqObXtFrQk
X-Received: by 2002:a05:622a:2294:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50d3bc8d625mr95626031cf.41.1775130332035;
        Thu, 02 Apr 2026 04:45:32 -0700 (PDT)
X-Received: by 2002:a05:622a:2294:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50d3bc8d625mr95625591cf.41.1775130331630;
        Thu, 02 Apr 2026 04:45:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:14 +0200
Subject: [PATCH 3/7] dt-bindings: display/msm: sm8650: Correct VBIF range
 in example
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-3-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1752;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QE38gDZK+HUt7WqeCx4YYalPwAyNS5l9JXKzbJf+I2E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbOLSQAFWp8Gr8PlfUDlPv2N2JIbBreG4suU
 r1DrEbDCzKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WzgAKCRDBN2bmhouD
 1ybUD/9dwNBOTsmtrmq33APJ8aDMQgbCwksTIvbY6DI6oY7e0sLHWp/u5gov+jxraVUXbTPcuLz
 dzmsG97gUWM+XDuThzHaLByHAq6WzRloR4WMbrxv7R+vHSKDO5fjB2HqqZnKNve3Gao3lhDIIWY
 cjBDh+pWx/gZ7T11rZO90kIvwLsyd/7RyxI4VwyYhZCC5hpsPx+mkg+NgJp5gylhTg/Lofs2tER
 f+AWIe+qm5dcaSovTqisKz2n5Yyc9f1F9+iXbFjL3iPBJBmojQtHEoXDwVNNh4USNuujCq2pl0T
 eHwjTxUwa6Gtl4vtmtgaaIwP8r2kzl2rfF0u32rlPojCR2t7YD8REgjU2gpcoO81xysVtM61FFz
 RURkwsoRIcGz2FknedRWm6WlOEp1qU6NTB/ZROiHbVx8Cg0OuIVBtLZk3EAMLwlQEA/esROeBTo
 raTv/eA2DQhEMufhJ/29qklDgFC1+IYJH6HXrkFCfg0Q5ZNmA5PuEV73IOMrdKS+8QZebJzwh7k
 qV2ZHrNT0Afvx1T3fRZGJO1gUt75thTZcnsbmR9D22aHpBhTlgBhxkLc0LXe2Y9bThfPA54wP0S
 QTDZhwMgUC3W2wgeHUkZjnCuLn+FglrpN1UNIzPIx+eF7/tTzfRXfRpX0pupqdFdHMM5SmaZpV9
 G1Kgj+AsY4syAXw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfX4/Qxhuh5D8Kd
 vOkKqFuuPjHNhfbo6CHjZT416UzQ/xKfdKQNNKJRL/Lv4dTJxtbafFXjFP8TMSc+aiTnRvdLYcr
 8XPh1BeS00hthz8+puhMvuKAjbc5AgoELy5kq89ObMjtydHNGZzfCKQbTiVvNHa1FNoQNxKqhtz
 Mv56Q9xj9sbFFvBlDhnE15+lqQCw/q8peYrjWLK5Sz06pv6Uh1fqQw0jridMRtVruUVn2sAiuR3
 ZPh3Jm19iNm6UdlYgoJ7t0BxJGJFrUg1MYmbj7C+WWvngWPiqX73ylQBbx8nFCPjrBdd5JkJjXs
 92oZVifUm2WX5hE3k1tJ7qCHaIBayjA5RzXdvxgdghvqoW8ty8bZ/nvTSCg2za9dNhn53opZfFB
 y5/Axm0hNtxlZatBMRfXji8QwuNe7SsgrqTleNuuw9jpOVuPHRrvZqFvxbKqZfgX2HDOLGBlUYi
 0st8V4N3m4KI7I8rhDA==
X-Proofpoint-GUID: 2GFu2Y93_ekjnjjTrLaZvWoJoejm5AfJ
X-Proofpoint-ORIG-GUID: 2GFu2Y93_ekjnjjTrLaZvWoJoejm5AfJ
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69ce56dc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HWmKLdpjvklgZKno_vkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020105

VBIF register range is 0x3000 long, so correct the example.  No
practical impact, except when existing code is being re-used in new
contributions.

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

