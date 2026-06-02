Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408A43CF698
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391432; cv=none; b=LDOyYgQRKNKpHc8K0ZQFTrmxso8JPCEt2ao9TXOhSBNVy+Njk3j2tb5d/z7zY67pGotSGQr3ZqzmVhR3UQZC0vXHCSr6O74u1TG3rW068RoxCgLxjVFLAdO9YYC8pUfaiiuXBXOpgYHK6EFPWYhmzkeaGcH03tb6CBVzQirHQOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391432; c=relaxed/simple;
	bh=PwHVZpJX9brIN226X+RqpA2VNqM5YOqAh3goSrAbgPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFhvGueDauxbUMrmmE1YaZO8LQH5tDo1JdBwCDlU5UgKQKg4tTbKZeQq8gQ2uDPmp6Km4E7k5sP2qTeKJ5Za98L3Lhpxz667bBqfhI3jR0/ey0oJPjwT1ybLai7LsnUWQIeoQplEITDTLvLIkRq1NiNzPfaVlfcm3En2CMh/tnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCjuozEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fluKrH0X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCjuozEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fluKrH0X"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526MWjs2767181
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 09:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euyWMbjcoM091o/6mEbzxe+zmJHFTJERj9ARUAp9lDc=; b=dCjuozEbeRXzlhDv
	vDPaTXFtWdxWGFkUggSSAoNEfRrvyomIddOk6JBtSDjLI+RykI3vNFt6iPfKBOmL
	P/ps+K+dFNin7rO48asQPUNovLq7sfKpIp5TDrsHv6l6lIBf3UOtnP3J0lFjLk79
	EnBiwBKzeYa/zVQPycKSFobLDMV/qtOFS6yfJsTj/uzQr/DlsFvoVCvNdS42mUYH
	Jppb0pVR5hyHAmkXfkslXzBVQ1suDcILWH9h2CK3zGhDKYUh0p2SDsHAiD90/Hg+
	qT8l+vDm+Sksc/pMcfM/W23fum1jpcnBX5aMKdSbKyjUEmNdvdz21SeAKstsLUp7
	NJUtYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus0pf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:10:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c1e112dfso31324395ad.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391429; x=1780996229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euyWMbjcoM091o/6mEbzxe+zmJHFTJERj9ARUAp9lDc=;
        b=fluKrH0X3E7hUcFggVdPq9J2dvI+2eaSkp4iQG/wnwEeaW8mrtInz1S+GKQiYHNXuR
         g9BCZ1dNVmrKcQDTqLtoAtbEOuJarYOFdGIdnB+aY023WLxMOBvZsQdW392meP51ZKFm
         EnCZs4b/mdeP7/3VoLW/UYLEghgi+uL9iLO2ZomDTdbpZYy6WKgWyc4b//42x5zqIDd3
         CfnHe6Vhew2k+dMIfEAJQ1sIG7EQn95sAtpd803Bj7mr3QrQCmv/mwA8VlYvjC8KlVKy
         4pK08B6fAthH603+CYLWjj9cfmHcW6iaaw6JbMtD8w4LMud5/awI38zlwv4yQU58/yCo
         7HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391429; x=1780996229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=euyWMbjcoM091o/6mEbzxe+zmJHFTJERj9ARUAp9lDc=;
        b=OmHMYGgFU3adz5GwR3F1HUGeo79H7PzLf25BRtgmOksvykbxlrkZCq346F0qs+Y1ko
         kitKUEO5313rFDi7nM5hm1VlvJQxRT19SiujxpqnuF8tkhx6X+2uZubRKJEDWUb2kDAs
         gx/ZNeuAzl8eiHdtxsIX+QpFCh5LWgwrT4u1zpu6L50A4IHZq90KoZztxyDRz71URKeb
         rZM6CnXZGThO4Gd3DaK0skHGMKqHGhFHeMsgy3UgewuIdNfkPebixNKV6soFP78x0FVV
         AKMUzapcFnynThUda477yzvV25U7J/A7peuaxKycdcVgtaQLSz38wDyJd3R/BiJWUxLZ
         yigA==
X-Forwarded-Encrypted: i=1; AFNElJ9j3zvSbgXpATqYI/rmZ1bbj8LuIE+sMwxiGm/oN6vwbqvzphbTA+xpDUpgBB9nn4A8JwtK4110k0aG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy34N5XOXwj7PPnSSiObQshTxC9FMZSPKrzofhyW8K3StQwoVLJ
	q4WMxBdvqKLR2bMpbN3btKd3lH4nqOyj5LCLDOuNtAJo+Z4iU18S5+10YwyXkS/2A4TnJmiqGLT
	N1MlAOl24nRv75Mz9DvpNsL7dAxJ6RjGMEGCc6D6OiAD2B14PnrwYIt4+6j/LnoDm
X-Gm-Gg: Acq92OHZa1rAiRZb48ypwstHwDBC6gNJd+pq7VXB7MSoDnYeWi9vGS/h7ORbEmmgUGX
	mpmtjf7/75AXoD1Ijkwq/PW01sVnWqlLpUWJ8Urr8QD7qXR0/HkqDA/uGaWIz37xkDd6xEryXm2
	8Vf1K95CVtXgyRwyN7hqX28Zr9P8AhbGCSy4lFzTkTeyuSTIPhfP6xS1BQjs0Gc4A0DlANto/jn
	bKH8qPQHUOosTRYQpV+ol8u9okzLihyyadbGcFTLYYAkqHj6BYOpwZMVkA+EfQyMxK+t0M6Gc5g
	ZQSCEGxx/DF80JzKRLZuUB9Epuu4Nfg+OvhwKbTeMRCBjLHA2ovwYxzY2xfG1H3qbAGW3+GIfRg
	TjIty8PqTM211EERfnWnijbDvqDhXh/WrwHIMSgS+Rbwxe7wRs2ZeLqkzJrT8CjWQ7xbScY/N5D
	15+ZJSPUe1y1yL/Ep0r6t4UTd9X+VZMdAFvFGetOmyoIXe3ql0ypIuN9xXHhN3eOe6ml8=
X-Received: by 2002:a17:902:e5d0:b0:2c0:ccdb:e029 with SMTP id d9443c01a7336-2c0ccdbe566mr106706855ad.18.1780391428777;
        Tue, 02 Jun 2026 02:10:28 -0700 (PDT)
X-Received: by 2002:a17:902:e5d0:b0:2c0:ccdb:e029 with SMTP id d9443c01a7336-2c0ccdbe566mr106706425ad.18.1780391428195;
        Tue, 02 Jun 2026 02:10:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm173007765ad.7.2026.06.02.02.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:10:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:40:17 +0530
Subject: [PATCH 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: document
 IPQ9650 QMP PCIe PHYs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq9650_pcie_phy-v1-1-d8c32a36dbd9@oss.qualcomm.com>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
In-Reply-To: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: dCJdKaVbxrQE5dnp78WgHKyRI-xydsK4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NSBTYWx0ZWRfX5kjW+vFjC7v9
 JQjNtndb4Uw5uEPfx5SCyz1wF1QxIGgQJqzvd8+CvcNS35T6suPdUDXa8fpG+J2o1xSzlM+np3h
 UD676Kkx80gup3p2eb7GI5KZvusa+iBNjxlluOjdIPPfXWfnvYUGycC8BQIpklfK9hb1hnZom5j
 nRPu9RGMNR9fBeaAlLuERZSK7AuHjiHxzJPunXg0xqA/K8DckNbv6fAMth9/SB1xgYzPviBwFkE
 vodv2TqPU84/6P696KowehPJzSbXzu+9ivFIIQovj+8BUNor5GL+V2F/g2MlthTnyfOJtC3lURb
 ohjGLRXlYS0hPfHqO1BCS2YjWkvRJofI7YZiWc6ahz2S4YLCyWF5RCRWegJ+cRuKvuOFdx7qEyM
 hecrWFKZYvA5e7jDdPkBs3DmoGlkTzB/UVWO3xz+GeZ73zzk88JL/gR9ul6JxLaTI29E2+icLjm
 kJEQ5fe56OrdBdtUcYA==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1e9e05 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pO3CVo40WvI9-LPkYfMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: dCJdKaVbxrQE5dnp78WgHKyRI-xydsK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020085

Document the single-lane and dual-lane QMP PCIe PHYs found on the
IPQ9650 SoC.

Unlike the PHYs in the other supported IPQ SoCs, the IPQ9650 PHYs require
the on-chip refgen supply to power up. Add the refgen-supply property
and require it only for the IPQ9650 compatibles.

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

