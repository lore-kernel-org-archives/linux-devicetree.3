Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78FF3612EC
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379394; cv=none; b=KsiEhKhq6FGUcfIMoEoxdb7voJvRR8MJa6BoUh7n0M1zBhvLRsIE9GwVgT2kwLcUBko/QGbBODsjfh8+fSbjMns+ill4C+YyvC3ftJ3X2GJU7KrgOkxQItL1iPYENTkz7jbL6zf10xgag9BoprsuPgP8d+nQkGR0sa43YudwzNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379394; c=relaxed/simple;
	bh=g0E4F8674D2m6OtmzWH25tEnm3jJCsC0/R8WR+XNFKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsCZIc2ZDtpO0M5dIBVAKEFBBE9WD93SlehRXi1XU3DFLaf0l4aejerAj8q4f01lJlELXZTrlu+v+wnc35wKACQpw4Ty65y3X/qCsx3bPHXOS9+usSES1bUgQqEGLM/BDZtd3HUpE+ouy2O7qfyhVZ1KFk1cM+u2GfXufpIn4vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzDwSa62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffqxt1Ne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzDwSa62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffqxt1Ne"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IBliRw524174
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxFIKcsRQTXS8HxFCAZb+qVsqo4wG4SsyGlor4rl0rY=; b=AzDwSa62HnHSNjBa
	ttJLsu9binLSHD9L75vOud7QS797BdPVkaQtBNUMBUuBli+nLy1r61qGNKrWWtnU
	/6BKApcUA51NQOJxBElUwi1MtbRQzg3qS8oVale53chtjjUU8FZ6E/C218vewURR
	BoFR82Pj/ewot03TGahXtkVnjMDlqPFzQfBmp0FlROZ631xtzQJ7YQj/L+u6oRse
	Im/2n5Y9DRjhVRk+cdgrsOrpil7IMZPJAt1O/rlLWMkU9+er/BODFVKUBQp0P+qY
	ZOsbnRLPt5FxhGCmb0N9nEJRxUWjDHQFAwzWPGNlukOfqX0IAKfpPAuMVZMwKmQ1
	cYi25g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bngrv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:56:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so13172012a91.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379390; x=1784984190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxFIKcsRQTXS8HxFCAZb+qVsqo4wG4SsyGlor4rl0rY=;
        b=ffqxt1NeONI4IPoS9nlbqhekQRr67S0mBjfSpBr+QVHXoFu62sDwhYCfd6vOrr9mLy
         N3pEjZhrCqbX38z684LZ6gf8F2f+o9we4EvQN8jHYVnmj7+22lG1SpcUJEL4PWIxyrEa
         FsAjachkAVO/FhiocFSIzI9Q+But/Zilj6sUkV5qjdyfuUJWpWG8u1hBtBO1C9A2p+Ds
         3P3BqMQ2jmco9LwBU+2PNsvRLUwGcFMWTj+FYuZQtoy5IDyfda6sssEg9e8/kJ0oC9/6
         cPFc92uiwZ0cCIHGJ8gjDQdQE8LLEO1mTjy64c9DLzft0v7N8bkiixZ9Yvl9lyqwLKQz
         /Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379390; x=1784984190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxFIKcsRQTXS8HxFCAZb+qVsqo4wG4SsyGlor4rl0rY=;
        b=g9A/CyRpgzqGT+SmpYeolrwGxwN2eg4fkEgxttip3fc2wSyH0/4oeIikJHtbOaPsDl
         AMc3ZRYP74ufnUA+ZzIG2e7xrQZtLWIl586RevRLslZtZSpAEmw/PCjL6ggd6fSLCKiA
         WpBOQqBc09s25eXvH0EY5Rh23FBEvA5G9MBLIWaxlqsQG9LR2L+/XQxHHuNrk0OTuV1V
         sjOHWFK1A3W6BbJVoFLcJwlPidae7XwE1IuVJoJ4HE/3WelW1aOc/0jJxcAM/FgPSkA2
         Q2VS5iFVbqrcr89Kk9O8TQWrWoGHZ6MdXwCNPWCpQ5nlkjyDvR5jDYlNo/mOMRYa+cFt
         ogww==
X-Forwarded-Encrypted: i=1; AHgh+RpgboFtVhxCsFg2rWLhz+Ll1VaqFVkdwDBIF9Ny+0vTXyG1sdCxJhMCCtCRaWJ+tdcgFTHmONfov2Lt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8JetSs6WsGw3y6DmHgVYRF+QwEhrJUISzfpfiafoQsEDxMoTM
	5TK0L0cybvPHZrraZNVBJoRdZ8jqkMn1HoS6KImXq8kcqBHo6hLvVvSyC79mBq4vDIm9gnjCtJe
	qbY3WVqx/aD1RX1wNT425dv69ru0o10aROCG6zG8zZox+JtScTF5bpaLN/UmgXLN9
X-Gm-Gg: AfdE7cm6aoai0+G48xcuRYT20YCwt85VGvlSsQ3LyJUTgZ63yxCcvYIKWV8jF4N7kQZ
	TLy3s+WkFBymBs5/+v8qpGa2Eeoco5IJ4WU7UXStS+NWXT2o4h10iFJWWCvJTK8CGaMNawxVOVP
	h+YOFt7XdP+X4r20ZPHUjATyERKnEzo7HcMO7tBqTygPzpscqcSSI7dNhmUqkTCho4VrRUZGN1K
	X05Lud9kB4gPPhZqHNQVKDH8YnLSoqEirjTGd0L039Gl9jxPg1A+f3wXr8OuF2PZpELqmt+E9fC
	WDcYdgEPBeSiQ+9RNh8ixBOdSMcBFkDQXdyKApTIqj3dYkAWINiGzApA1hyqMOmObcfYrLHIEM9
	hTr71dfMzetwylHVP+JPTAnr0lnGbeKc=
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b21 with SMTP id 98e67ed59e1d1-38e679f4c4amr949658a91.23.1784379390449;
        Sat, 18 Jul 2026 05:56:30 -0700 (PDT)
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b21 with SMTP id 98e67ed59e1d1-38e679f4c4amr949619a91.23.1784379389982;
        Sat, 18 Jul 2026 05:56:29 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:29 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:08 +0530
Subject: [PATCH v6 01/16] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 missing power-domains property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-1-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: XVshJj8liSVXcs5HScBxZZHKdPdgWbFq
X-Proofpoint-ORIG-GUID: XVshJj8liSVXcs5HScBxZZHKdPdgWbFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX/DxRboUWv3oH
 vQKDrOLfFNiWJGotrMemNAdFFK/0cFU2aX3dBEC9lqg4mhOIz68bT6i/6Vgn3U4wp1h7RITqJiu
 FatMTTYigQ4mgzvjCWE1KNChdIvOVr5pmNGmkKz14tQdOuLLzRRHZRinAL8BYKe0tGyh940DkDm
 QMml7pFdOAJ2XriE61S88sbLQsosHymuQ0SEhQGdf3/jxWRHEup0ChiFHC/iCazJTj0YiDu/CW7
 Zh3O7mbdgSIQyb7CXZX2i8BFi4+XjYavJNr8cZ8rkRHpwrVOW2EI/Minf34PDYIcdA1bph5o4Hf
 gBwXrLsRTfwonvlDAV/vGln6rL9lGCqN8x7gj9CoRKhEb1he4JySjW4BHyIzD9iO4kS+M+BtQ0C
 ZPAXirL4+zqyonya2lh7yD9DPqZ+7WuCmf/xKvYSsTbqMWmVv/GzKHEfRhki5Q3k0mXlS/33I2f
 N3/DUMt/181ZTX++5hQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX8YbMlC3VXNF4
 qMGXnCZKCI9D7hq4j2mO4BPUCEAaIzaS8z1DOWyoArTxIVxTYwxZjzP0D5MUHZ8xkyVYMcDoVVc
 dyBAUp9HKWRpJah9ibTZ7O9imee9X+o=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5b77ff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=v1ZIPYeosOrn89kA6pEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

Add the missing power-domains property to associate DISPCC with RPMPD_CX.
This is to ensure the genpd performance state votes on the GDSC to get
propagated to the CX rail and to avoid the rail under-voltage conditions.
This change breaks ABI, as the power-domains property is marked as
required.

Fixes: 85cedb4e0c9d ("dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..e9c2326adfd285444257b96f5adc68e27213281f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -37,10 +37,15 @@ properties:
       - const: dsi0_phy_pll_out_byteclk
       - const: dsi0_phy_pll_out_dsiclk
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -53,6 +58,7 @@ examples:
     #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@5f00000 {
             compatible = "qcom,qcm2290-dispcc";
             reg = <0x5f00000 0x20000>;
@@ -68,6 +74,7 @@ examples:
                           "gcc_disp_gpll0_div_clk_src",
                           "dsi0_phy_pll_out_byteclk",
                           "dsi0_phy_pll_out_dsiclk";
+            power-domains = <&rpmpd RPMPD_VDDCX>;
             #clock-cells = <1>;
             #reset-cells = <1>;
             #power-domain-cells = <1>;

-- 
2.34.1

