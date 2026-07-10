Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D938137AA72
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705622; cv=none; b=fLIeZpMaQi8fXqpb+jnWHEeoagd19bn1I9RCwRKlPRk32vtMJZuxxrD4KaZ3ogCzYh5eFQt9aDgRgvLew5YXeyWwSI2fyE0Zo8lkYRRN36XGKWKKRVQbe+pAscciHHELZDlRUh0ACNsu7U77uby5y9hsS5fgkRJO6XdoqMKKJe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705622; c=relaxed/simple;
	bh=1OdkbJ3eL3GbSteCcmsYZGBMIEhFB5HxyOaTSjHW++E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=auz/QY1N03ZgmJKwIlJGAzVhd1OijhH2v81m/C7a99NV71ORoIMkALcJv8PzmGU0UkURuXGw/dmmHg3ob/a1ffD14pNw8ZsnIrDVSo58WeiCR/MrUIYwOfcH1Slq73CLhDXWiH/zLpMlF8/TKN/Zzw7thP/yrGEykO1iZNJZJMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXCdjvBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGeVUCh0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXCdjvBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGeVUCh0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH4CLp1451424
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gCv2zKv+N9qth4QiOXkrhC4viQDxXUkZm3urZ5/gsF0=; b=nXCdjvBkCnreod3L
	xsmwjIznMZdIdz93s9Wa9ZzIDRY5PPK8bFZEK0+6Y8zn5b3mrn++406HiFgw0pID
	+6faqeAh+VORhF5Ve587U0CQtCdZxZW+0qXchNdcIC7QwtKKVFg+sBx8R0d1rf+i
	eN15O9T3ZfbTnDMMO2GVz5iHImIB4CaVj4yDLVLHrYR6Kyn+LDfbeO1usQjy7UcB
	vmDKil4mzcwXTbolAYp6R7jRa8p31crxb7CTt53ISj5rkYDZcHD8NpEeArYEB/qO
	aM1HFXWLXUbWmg8VlfxzX6M9R57Tp6RfzkNyQeaQWP+ZAllcompeJ8kW2cjXahAW
	xcWL6A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n322t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:46:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so443246a91.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783705619; x=1784310419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCv2zKv+N9qth4QiOXkrhC4viQDxXUkZm3urZ5/gsF0=;
        b=VGeVUCh02l4FvRIaPvlCVwls9xNQNZJKT8N4F+s6HU1KobChIidwLkjuKQWknm0j9u
         nZaumdWmT67fHfbcB7C9GZxK6WKSwkMppN5k0nS/OtzZjAYRp9C80M2bUHd/isQ3GaNt
         vazUt3Vmm0xl3WlfXQk0xi+/JHc4uWm7l6YBgzVg4OnkSwPpJhiXdpqXe2qFLr/nv8X2
         xBO0IfuOZwkuPgQI6oKUgk6k8qX40Me9NeD4KAmf+TBh4/pY/cS2MZjSqoogi0bpKBe4
         Ri5+wmp8pWiL96X0BVLeiSU8j9O2Ryxrcj7op6TJYESGi5XPtWd8d19Io4RKzBLBgusA
         7QOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705619; x=1784310419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCv2zKv+N9qth4QiOXkrhC4viQDxXUkZm3urZ5/gsF0=;
        b=WBaP6HFmrZbeHzFRljhKFJMlPPgS9AAVuVZTLecjuFgj18V0HwwVNRnH+ientYycFi
         wabIUcioJDa32Cpy5yPoc+sInJkMTGXxHnkhF6pt4BEohO8mEhybW0ZBsFlA2oFqI0C2
         +nwXEZ8rSAjHQye7ruJ/z+bZfuOQYeFnwDr+8MixCwhlKGysqncO3p7t8Fby6FLdc2p2
         LrFeuSe2BTCTBmVXPSAwApuz3ivWAvEYYVYsvGlzI/FFLmohhcIUgweGzGIxIWFpnuGQ
         gULSVMJxJO82ETIpIMchqj05qWoGziwrpIxbEdoi5RbjmPuC86WY3TsGTdKCn/fa862M
         kkRw==
X-Forwarded-Encrypted: i=1; AHgh+RpKCn5gDKW9dFrj5zPcTfQIKrA/AV5rNYsKgqqc7o/SoYBDGVVU/6WhdaGaqXAGDfco4VrNMfIN83yi@vger.kernel.org
X-Gm-Message-State: AOJu0YwlxjFCqqjopcMqVN5oDFeNsWrH760ARUQPdNq9Mx/kypbOyP/2
	OYkePrK9DeMOwa9A/yv4BOqWEUERZe2jFdwGEOBGf3SBMQjL09ux/ux/tEcLIe6fbe8Th6ejDtX
	9n9A36ctl1R5MnJNeihXdGJhbY3hi4iZVAeFG7x4kjfdf2dNYel4Rcc6RJVaDYKFE
X-Gm-Gg: AfdE7cn+Kq6V2GLfKUE5R5eV3t/+VG8MZ2UoFu3YUBnA1ufG1ImcbAC8pX1hRUhtRRy
	QD+pmjc021GM1TepXopzDT1UGbQwQbaK/Pccu0DRxbjJq+UUTCsFUAyDcGJdiw6MuMdfsB0/DC1
	eZxgqeh6LnL32crYOZkHrIittvoBtL0FtKa7AeVXdgVwDucVGQDNLVYKQtmCReDjSqjaIGL9xuZ
	o0BA64P7yufgRWXj3r+JCk8WTgJ1FLdjL15H6+hVpjR7gNkLr+v6tSCW8dVFmrQ0rL5RxhLZSYL
	r15jXbCYVbEBP3gWudcIzrSb+eb66e8E0UP3pjemnV9TIMfqEQKup1C1O/vyujvUQW4In17VUfb
	CojYuFEPAze84lK/WaXeiK55H/EsPtUlrW+DYSQvtswcEYz81JWavCq6O7iaAEiFiiWvoj+9wKx
	n5/O5w5QqSjoeGjHWNhzTVPTKw/is0mPa7hxj3YE8WXY4+9g==
X-Received: by 2002:a17:90b:3c09:b0:37f:133a:3e01 with SMTP id 98e67ed59e1d1-38dc75d234emr23134a91.4.1783705618689;
        Fri, 10 Jul 2026 10:46:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3c09:b0:37f:133a:3e01 with SMTP id 98e67ed59e1d1-38dc75d234emr23107a91.4.1783705618275;
        Fri, 10 Jul 2026 10:46:58 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm33008273eec.9.2026.07.10.10.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:46:57 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:16:40 +0530
Subject: [PATCH v3 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: document
 IPQ9650 QMP PCIe PHYs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-ipq9650_pcie_phy-v3-1-ef6018818d33@oss.qualcomm.com>
References: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
In-Reply-To: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE3NyBTYWx0ZWRfXwn7bVsIptyrG
 5ea1o0Cyze9A/Y6L8e/7hJy+K6w5/jXGSPDp3NWtn1h7AzgxDIFAOUec1WezH20iKNgzp3/WHMs
 5sK2LfKqrmV/QuW1HfwM7fv8Lu2Kuyc=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a513013 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pO3CVo40WvI9-LPkYfMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: blvuCzXfWAF6RFeNt29hOTatn9Mr_pLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE3NyBTYWx0ZWRfX+Ymc/JJaHr7X
 rLFc+vyTn5yhp2IB4RLGKLPEkNukxND87O9Fem5HhAojLbqzFVf3lt0RFn50zW2c1oo1rfogWQS
 X8W95d1qYlxMSE05RyFEsGuBaTT4cxZlDpX4nNOKYbqeQ5z13q5ux3LWayaf/31lCJt06Kslsbo
 VsxFVmmqeV8zzWQ7RrHWnuHmOcbKxcOdMeshQThGxLy/xdpolvFPtySZ4IMtTgZxZge80dmTGYw
 McaRHE6lBU02ZG7R2p+ZC09nazUs95nGZEZUp1TIT5FewMkdyTkbIDFxePe3v13KpKwf7oIUO9u
 /ZPNx9kEaHzeYg2W73zF4fbvLVPhjdWU+OxB8mKRjA4Ko193dTvH9jZc90Su8mz+oIi3RJuD1zI
 vVdHaWJC83BA7L92XBDBsQdy7gsiaBxVzc3wE5o00XbdFZd7ShzE7cA3+L6CT/fFKm+mRhxdH7R
 UmmKxZxohm+M55TSpMg==
X-Proofpoint-GUID: blvuCzXfWAF6RFeNt29hOTatn9Mr_pLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100177

Document the single-lane and dual-lane QMP PCIe PHYs found on the
IPQ9650 SoC.

Unlike the PHYs in the other supported IPQ SoCs, the IPQ9650 PHYs require
the on-chip refgen supply to power up. Add the refgen-supply property
and require it only for the IPQ9650 compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..048b2e3ff0ef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -22,6 +22,8 @@ properties:
           - qcom,ipq8074-qmp-pcie-phy
           - qcom,ipq9574-qmp-gen3x1-pcie-phy
           - qcom,ipq9574-qmp-gen3x2-pcie-phy
+          - qcom,ipq9650-qmp-gen3x1-pcie-phy
+          - qcom,ipq9650-qmp-gen3x2-pcie-phy
       - items:
           - enum:
               - qcom,ipq5424-qmp-gen3x1-pcie-phy
@@ -61,6 +63,8 @@ properties:
   "#phy-cells":
     const: 0
 
+  refgen-supply: true
+
 required:
   - compatible
   - reg
@@ -72,6 +76,21 @@ required:
   - clock-output-names
   - "#phy-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9650-qmp-gen3x1-pcie-phy
+              - qcom,ipq9650-qmp-gen3x2-pcie-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

