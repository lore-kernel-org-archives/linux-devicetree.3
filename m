Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835039;
	b=DgQBENpeW0Dg4ILT1iQuM3PVUDvROtymT+HvIIJ2QSgO31h1HdM/w1zRmPdwE5F4FqQC
	 yVWH9D+7zq3de4xmMfnwhuPts6WTY4Afzrm+Yfrcwvjs1QzOIvQ5bx2H3n6miSn5BVztm
	 dQ96sNbEhQSTIhZ6TtwxVAh1FDUdrAYtgx11f1fyNIDJpWJA2gBQdX43J6NRkdT6t1x44
	 kAZyjSiWyPydm+Q10MyiGvshXP4cPJgJJPD8zXTgnxCiVy34Ol43n5Svx5uP3Dv+9Zdbh
	 6B72Tyo/qs5ChXG0FXPf5UHNFB2rjBe0Ga/znlqO/UYt1Aa7vfxkuT58rIDbqF1pxbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=;
	b=uaEJpz78Vc+I9MZGBkyRkfcvCn3AZzfXEXjSyLVuBkwm4wbsb0FeLpbXcZY3k7w+bMQk
	 afABBWgkhbGKDw2Sy+sK2zSIVFG/WaWvCGvq73k2IKyHZh5qQs2+0QiX/1NUlEzwEg9G2
	 4IW2AC6qNgVhtku7dI1LSkBSIH97bAcRHugI6m97BW3zJuk/+Rwxo6lrrJ+w17muPVa00
	 7/zed/cX/gXQslyMVKKhWnCSv5fD9VaOwKI2aTEgxoDBbMXNmkahVi+eWvZNEcJKFY7+T
	 shB3rp4BHkI2TfejDS5tpSu6YmXYKDedi1MRqb7+3TwldFTbRWD+I9GnU5mxbtt7lvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEBaEYpH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYNnN985;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D16606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D16606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEBaEYpH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYNnN985
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0nmB1482579
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=; b=SEBaEYpHc8jEl+Tz
	VTfNtRbaEmPc2jrwl93W0jgyzhiVnqxEyy96KKDGqfOIzzOoHdfTo/FNCousA585
	/BZk5zDyNUvjk5C+02CzTQPKyiP+khk5F6dMJqDC2Kequ5/sj2vLzxy8og8KPiRB
	xBzT+cMUhTZleyuOIsvg4lxeVgKA3sgdYefq3el6EKI9Sot5Mx7o6TUqcxyXmr5x
	g4b7gpwffP4tJmzx7FuPNZkqcxJwBqKpvrNp36qMEbS/QaAFD9/aXAmCEPr34R6o
	YwiAj8P4FvJlbrH+SrnDVseHGi06M8XW+rylW90SxbLciHpljZILQ1YmFebMGCbm
	pO05uA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgnhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960131befso389325685a.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835037; x=1795439837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=;
        b=RYNnN985P1rf0m6y1kwIFq6QYhfQVl2DB643gped1WQtSKIGEP0AXQQWc8bhZkE4XK
         3Q3LkWc1q14FDP5mDKXSXi60nBWKv9Z92hBCp1ZDnLRWKPZxYEbx7QRaSlY1L5dLYPf8
         LVTLfMcXLVGWgfe6XQevMYE99Hac+dIdRutaixIh/rATYy8AxhMwGCf1pbiK0SM/W6Q3
         WsGs35AH0Mv5wFOQPHLdV3J1CLfI7obUQR2N+M4Mdr6qQafgzV5bHALewcWlBYogjCmf
         ExVGPXWmBkvmEW4DXWPqlP+3zTQR6h1GI//q3wNhfCYs/Wp+lKbF+OLpOqLz0sX/o7Y5
         bhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835037; x=1795439837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=;
        b=dRUazucnVzc4Se6V36SNAqok5Og3B3O1WkBdqp5deJ/YvMTu9Hq9/Rld22vH/IN/DR
         vfDQfUy2iEwMbMGYFrtF84Lqgzlmmx1RCG+pdwKVXhXjum+GERnljqF6ePWFstx4VYc3
         VSMfGLZbHCAbsm4VXLkpDEDOK0gK1XgzHPhB87QI1PjfLouiVGjEG8V8Q//xZ5jjQopn
         uUg/Vhe4n5cGHidl4qxIAgAUJ6b2D2jUv20ZnN5zZ6FQp+8KKEcCDacYmAWrjQnkIZIx
         ZsAlK3ql8zZCdIVMeMk2BL56lfKqD5RI08F9g7RDrv67dhFnGR7tH6dfnA5TftelmGyv
         4e4Q==
X-Forwarded-Encrypted: i=1; AL+hErHNBHvAsaQUiL57upib7ELCZhsh2BwCegiF2Q+ez4AajfB2xKEnu1SBdBfibXtvtb80jY9thsOhfwxh@vger.kernel.org
X-Gm-Message-State: APuU4Z/fUrMUF9LucKmuyXGvPTenMeLE5HswNL0SFqMAA8EGksuR7a+Q
	r+rSVQpUxQmSWf0norP2TkZn6/r/VWL5LgmaFgpxOLfr4W4bHCfDB7s+mxSAseG2fbJMSxZa91o
	KSDS2O2nolMYOzykCVB2qnhE7dFUGWarmySfJvWazyWGk+PZFq7muhR8FqA8s69ZU
X-Gm-Gg: AYBFou216n1kbFDWfDDz3bk5cHPb3F7k+zIQiGekA16mqiaPcL9uyOKN4avIv0rPC4E
	q/mnFgsUVaoBmVM69exshNhxaDfaX1qJT0qxbNfYWtvtrjZM86rKoYB2N5lGxVjfWdILEdDoTM2
	Wto0yC+E+ZVEYqC58Hek7i0WELkchrgk74cfymD6cOX3x9EyDFN8pC8nKjTl0uQDn9jf+hWRW+1
	EcnVDmAU1irvmJG6/RtkV50591vfYaHXuY0Ey1OLTV2TAfg89AklF4YZiNEnCf6vshC+60bgAvo
	sPRx5dRSCYSoWkQ8hUVoiaxUIsHxtDU3NG9kxPRImPygpwBa9KKDRlzqROtvQ0KrhOMiiTKvC85
	lZj+YJDlWAqvMjItj6rGE2rlerk1kd6PXLTmYlOeqzpH+KBVblmzYyQuLUqjzl+bevGrtYRM63u
	EF
X-Received: by 2002:a05:620a:8002:b0:945:c4b9:3de2 with SMTP id af79cd13be357-9494bcb0e9dmr1652191185a.73.1794835036668;
        Mon, 16 Nov 2026 05:17:16 -0800 (PST)
X-Received: by 2002:a05:620a:8002:b0:945:c4b9:3de2 with SMTP id af79cd13be357-9494bcb0e9dmr1652185885a.73.1794835036121;
        Mon, 16 Nov 2026 05:17:16 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:17:15 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:40 +0530
Subject: [PATCH v3 01/11] dt-bindings: phy: qcom,edp-phy: Add DP PHY
 compatible for Nord
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-nord-drv-dt-v3-1-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=1366;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=htFubjaJPIibVGGK/b3gnFKqJhVT4tGAGnQz5T8JsPY=;
 b=qUoDsXThlUNNuRFU0T+sympFDVYGr9xmnyLWpJ06LdBycStF71umIvFt9uuV+rBK3WP3Y1cwM
 cbD7HwGrAdrDCzrbDAebYAipwZgM7ip3HF7Gf1tso2kcQQ8PgEacPWq
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb025d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kfPMoZk3nD7OVdbVor8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: MurdVrT9Bdbl7lkkDDAvOb75vokBAwPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX60Ao71eRLs+H
 T7vWZZmiiSxM43vn4f4ilGx5AL+410fmpr5HN/Q2+bs3UBvvgdMrP2gT9s/3WV4GSVq+IsvkEcl
 +2VLhdGkgUIb6O4Ell1KlR8iSA/7XRrmWrl5+x0X1GEaBIKCNGVCG8ZqrHF4oAWfyt4ttZjyXFm
 YuqZKgEO13SYIXlHkKx6wt0JzQTJnLpNl5GRpMEEV5xhrQ7lnJBoW4rm2Oq8uo/7ohbrcay0Skr
 6NjIcxqUf/rdp76mam2uhOz5IzFL2RT5xghmtj0KUZiOhUc20oOo2/HoUhCaDtsqxz1p6wpZ8tJ
 zUw6kverHYUju1iiWKNKfNXRBW0SykfGLnwQ7cT6o9coKHRctJ8sIf4ynfkTMpdxHYlriWt7asx
 oYxYW8+bXsN9uIkKa8ZG9/FYftloGpAviZ2VizWWsz53hbkMiQvwMz97cxgGsZJ2NO+EAmPymne
 ZPF7upmAD2mFARl3Pkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX/i/eBOqZbt0Z
 /9/bIVTF7SYAHBcuFrwfDs9MTZhC3Z54bwEbcTBtrwa1nfRL1X//QJgJSyn3+Qx5kWhZMWMuLzC
 XuxVp1Zvkf4AaJmbS6hm2/g7TR/iqYw=
X-Proofpoint-GUID: MurdVrT9Bdbl7lkkDDAvOb75vokBAwPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord relocates several PHY/QSERDES registers relative to existing
SoCs, so it cannot reuse an existing compatible. Add qcom,nord-dp-phy
to the compatible list. Nord also needs a dedicated ref clock besides
aux and cfg_ahb, so add it to the allOf condition that requires
three clocks (aux, cfg_ahb, ref).

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 0bf8bf4f66ac..0ff07ddcb76f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp-phy
+          - qcom,nord-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy
@@ -74,6 +75,7 @@ allOf:
         compatible:
           enum:
             - qcom,glymur-dp-phy
+            - qcom,nord-dp-phy
             - qcom,sa8775p-edp-phy
             - qcom,x1e80100-dp-phy
     then:

-- 
2.34.1

