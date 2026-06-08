Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7535379C48
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921391; cv=none; b=RPB8S42Zp5myVbAFFhx46BMSrPwY8sj+Fm2b+Ki/wUxek/e0+dlq3AXAGGdg/mi84hyVBtrHtpoEsDwLOiOQBtcE32pHMl6PZSh1YnV1QfTJMgzqbqYEXYmd6ID5COLh4QNzieG9QCbvIkuPTxidxlI8ek70sOcT7Xm2iik27Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921391; c=relaxed/simple;
	bh=KgWAs6uln74wF6T86ce7PoBVL8SE2Q+p9u3v+P4rhfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sM1o3vp+iQbNebsCJzAzD/jERRoaqTGYJIMVfLfb5XoQ4xBg/wtGfk6olnfM045iN8DGIpAY+wlDsrO4Jmy/EzHpMtDdkFjgEvp+35PFQ1jJztY+Qv4uiYwSMRm/pa0wthRZwjD6gEE+ZLvvqMfmqahaCxQtLBrcw00PpQOFQAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m78D9bQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YltPyVfN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m78D9bQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YltPyVfN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9Rsb2965398
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 12:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUXqryqbAOjs6yJOJea9Ql6DVReDUNpP/P68DHSxwuc=; b=m78D9bQeing/TbET
	5It2VbK2o6oenwmmceGxgcxEsKqJQE1uubWkm3CsLCnhM+0B16LkBZodK82ywIrS
	oLU1h/N/sGNBpalMO2NlMKl9yWlCU8gkZFMbo5pwptwKjYZk//VrBcNGX6aXm25f
	Qj30gMicKwcNldX4vcoMok0f33D8pb+dfONUcaTthsaTcO4+9pcCuMRd789wRMKj
	1utS10vR/yyuNPWX5pj5MaGvsjjdALy5ref/LiN+DcUZG2an5/Bkwsd3vcwD/sRp
	X8DAp0HnOhwskYUSboSN94ut/oXBY/CIMglVNFeTQ0Tvpt3MyjICOmiE1I07lZkb
	1LlPZA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkruct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 12:23:09 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7df25ce3000so18446877b3.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780921388; x=1781526188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUXqryqbAOjs6yJOJea9Ql6DVReDUNpP/P68DHSxwuc=;
        b=YltPyVfNrS7ctz/GL8sC9Kp41eNO7AhY1brUEOf0/NIsVnUiTkIvtrZxkY71SThq+1
         y+e4EVzjrWbTwPxTLqmnNNSsWWQW9TJzsfHtOjYrZOhFjDRcvs0URVsba8ULJi0+RKdR
         QLDOoWgT0OTBNYUXnwms+Cw8r87e0DArpLFn3Zpt0wFqs1jFh7WCK0aYpNFMMUi5kqI/
         ZMb74SflTkis35d8yU9LE3WxX+ZpAC8pFSZVopim78tOB+vlubnOBDvwI1F5tkt3XQ0q
         UrzUZL9mSzSlEcxqoH1TtIrz12ASdV+69zVHllw78i2AOW+jDPWLVh8TegYZasPJ/Oby
         bEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921388; x=1781526188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nUXqryqbAOjs6yJOJea9Ql6DVReDUNpP/P68DHSxwuc=;
        b=OyE8HcxiGfm6sHRYCTdNPv+yvYvlgJ9nNu/y+buTjhmPV6DMlqCaLGJ8k1G/lwLgkQ
         CpmkN+Hl40V7e7n3YcUxjrbQaQXwGYWmwmMuGhuvEip4flIJYqRShnMphRLYvWKDSKSE
         OIgDrazfzHAavCKAGxQBUaxY5VdF9KiwERDzx9j8dUS4zeb5mama1dTBe34mDATKcMbT
         z9ACHsqeVYtkE9mj3eHIWmB5bxe+2fpjpZ84toGDn700uIbWae4l5x8jQz2TGl5wWQKF
         QZcxXlaegcOcJdJ3lNYnhv9+yUwcJ6mmzA6I4onhBRab7IKFtHsjumSguUZDiU8PTT2O
         vRcw==
X-Forwarded-Encrypted: i=1; AFNElJ/8FzscflPU+W3oj7cEyW+r6bu9EDm32Cgxoo9ZrOsc8w/scBRmszqzBM1n30fsXsi8gOrJA+Lk7WxB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3mImLFcNpGAtZZckQirchZ4o6fp1hE+L5nSRFT6FJIW8llasB
	zujnb4PE6oPz1nWE2jXjuGB/XLQ3QkDuRks0AsBSbzmSdaSJWS0biwcQETjS0dILf7RBpcZTfh9
	0kwAmjBLlx+O82/AQdUC6ngia8jcRP9Wl5QqFVpZZv1y/1PYXREFD2tOGpZhyhqBW
X-Gm-Gg: Acq92OFgXlvc+FpZjDMmw9Yv43Fpg+0KN61ceC56IqdSKTlP1YHgehIrENZ5mZTnhLW
	leJrDSk0RfA3HqXOANmfe6QI443JAOCQ13sWKIr7cnk+CMlK1K1YsG8dvK539aSR+enu/0TmGkf
	8zvY+CsATWdGUrPuiR6+z0XYFjAIh96Wnq+w9BOSFwpOfRFF+7g7AkJdrvzZoQtqLf+ID7eaC1/
	ICTAkGfxm9+32bXX3gmRmyNIhPgFP0xYrOd1x9Rx16cofymsemF8evgjMRoLrqetYbxrKVaX4z2
	LKPNNa//MTK1PtNgttAaUoNJNwZZzCQTmTNgSJT0xf1VWYsfiQb8s8r/GuKoIeTd3t/eB7fhN2i
	JWumJW8AidAyab1uj+jLTRsji3cmvwzQPPNy2y/aXkcVpaHwTbIcfs90IOz4J44w=
X-Received: by 2002:a05:690c:6e04:b0:7dc:1609:53ae with SMTP id 00721157ae682-7ed0ea5d4e1mr128120297b3.25.1780921388220;
        Mon, 08 Jun 2026 05:23:08 -0700 (PDT)
X-Received: by 2002:a05:690c:6e04:b0:7dc:1609:53ae with SMTP id 00721157ae682-7ed0ea5d4e1mr128119877b3.25.1780921387682;
        Mon, 08 Jun 2026 05:23:07 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8186sm84076257b3.4.2026.06.08.05.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:23:07 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 17:51:49 +0530
Subject: [PATCH v5 1/4] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-gcc-rpmcc-clks-v5-1-94cefe092ee3@oss.qualcomm.com>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: TZuc2B59Th3VJwv8KGR9CktJ-7yHi1cd
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26b42d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=59sZcjbcK_zmYAmOVRMA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: TZuc2B59Th3VJwv8KGR9CktJ-7yHi1cd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNyBTYWx0ZWRfX81gIwHQMrIpg
 13gPOenrz0BYESRX1v+aVyk+YfoS/rewPlAWq8uN4Yevp2FqzAnLS9lPFvL2IVfKsbnZTy1NjnO
 lgXhJZl7i+Jn70LU8c4zETno14aJBzvyyj4LMWdQ392QeR6bcGWvzgZyCSVqhJEOQrolMB2ytyg
 ZKvxuzXRx0dH0dEHoI8PCoQkXXJxbhHehfTfBizgE2RWyeeRE4sc8A/Ygy4R76UBkPnqyFYcPpe
 /JD/3D+DYGqp0D25H/Vec3D5EqDKSb4e+4/Tqvt5LYs47v6OtE3nk4eZDFwSz6vaZsfgRKdr0PW
 bE8nhrvv2DxnqYl+x+IoNJPQ2QPk8m2dCX69Fwus4g5+ZL38cVmXi3vw2LsM/BSCSHUIXAny/SC
 9jbU0qc49cBw+jTBcccByMFgvc11iYgyEPaQX2dA12E1A2ILpppI+u5JpoQDGt7zMpPDJ67d2B+
 EkTMQx7qlKoOHjYnuEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080117

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.
The Qualcomm Shikra RPMCC has the clocks same as Agatti (QCM2290) RPMCC.
Hence, add support to use the QCM2290 RPMCC compatible as fallback for
Shikra RPMCC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      | 65 ++++++++++++----------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..af9fc5b14a8102073f24a2ec4f5c8e79d492a14e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -21,35 +21,41 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,rpmcc-apq8060
-          - qcom,rpmcc-apq8064
-          - qcom,rpmcc-ipq806x
-          - qcom,rpmcc-mdm9607
-          - qcom,rpmcc-msm8226
-          - qcom,rpmcc-msm8660
-          - qcom,rpmcc-msm8909
-          - qcom,rpmcc-msm8916
-          - qcom,rpmcc-msm8917
-          - qcom,rpmcc-msm8936
-          - qcom,rpmcc-msm8937
-          - qcom,rpmcc-msm8940
-          - qcom,rpmcc-msm8953
-          - qcom,rpmcc-msm8974
-          - qcom,rpmcc-msm8976
-          - qcom,rpmcc-msm8992
-          - qcom,rpmcc-msm8994
-          - qcom,rpmcc-msm8996
-          - qcom,rpmcc-msm8998
-          - qcom,rpmcc-qcm2290
-          - qcom,rpmcc-qcs404
-          - qcom,rpmcc-sdm429
-          - qcom,rpmcc-sdm660
-          - qcom,rpmcc-sm6115
-          - qcom,rpmcc-sm6125
-          - qcom,rpmcc-sm6375
-      - const: qcom,rpmcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,rpmcc-apq8060
+              - qcom,rpmcc-apq8064
+              - qcom,rpmcc-ipq806x
+              - qcom,rpmcc-mdm9607
+              - qcom,rpmcc-msm8226
+              - qcom,rpmcc-msm8660
+              - qcom,rpmcc-msm8909
+              - qcom,rpmcc-msm8916
+              - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8936
+              - qcom,rpmcc-msm8937
+              - qcom,rpmcc-msm8940
+              - qcom,rpmcc-msm8953
+              - qcom,rpmcc-msm8974
+              - qcom,rpmcc-msm8976
+              - qcom,rpmcc-msm8992
+              - qcom,rpmcc-msm8994
+              - qcom,rpmcc-msm8996
+              - qcom,rpmcc-msm8998
+              - qcom,rpmcc-qcm2290
+              - qcom,rpmcc-qcs404
+              - qcom,rpmcc-sdm429
+              - qcom,rpmcc-sdm660
+              - qcom,rpmcc-sm6115
+              - qcom,rpmcc-sm6125
+              - qcom,rpmcc-sm6375
+          - const: qcom,rpmcc
+      - items:
+          - enum:
+              - qcom,rpmcc-shikra
+          - const: qcom,rpmcc-qcm2290
+          - const: qcom,rpmcc
 
   '#clock-cells':
     const: 1
@@ -126,6 +132,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1

