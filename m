Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B2E3ACA49
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731123; cv=none; b=ODwhKF3vd8fJoFAA8DA87FJ7pfF5XuLpeYYM5yCqc5eKHYmqvgA6X/0BcAXXDi8DN5N+GceenvGDP8R5/FBtqwXvXYvxI+4BAI1ciuEJmb08wRRkudzI8zgqc/w35jhGzI41YvXVAarjlI8q5LfAC6fre3BlOiccswYwu3h3vIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731123; c=relaxed/simple;
	bh=5mGI/C1XCwPCgCpPLbLr14Z+oFs1VIpMUnI/MAsiqSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MEepPzQFBco6rMXGcKxPNmkid0i4ZIg3QxKJLnzKgHry9ko83J1jbI1QlzSjwAYpQf3xpf/ceY9qeisYDtZIDzV6bkiTYi5itzSCjiehX88CxnBqG8FTRve2t7DtHn7/jvXV9HQd48akQiBvw6MmXbqRx8sZ8d9MYKw/1qTNViM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeNdQYfH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TP88H/Yg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeNdQYfH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TP88H/Yg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0dNNc4161718
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2Dj87Y4whUJaBzEehE1Tqbo9ydbz/EdWzB0LJkcrAA=; b=jeNdQYfH0Dr6aosI
	w+8eq5kvhizZMj6dBuALXQFIVHUgfB25O4pZfwLuEUHxBKLQAdPGUvUnvxOT9scd
	y91vUhcpPvKBwA7fNd9ryfmEIoi0ADH2kL4fLzSkUKFZduH+vKOdwIR235DbElMr
	53AY0zCHEfWyQjz3tR50Tb0L3dbVPIRNGJfVZP5YNT065kJ9D86fugKJG7HQr6XY
	Wei4AZmrt/hfEf9trg8FWX3VdSET0c76JHhwe04ILCQONC1KVIpLnCaf1X8K0yIi
	E5DObtuM1SCa+oTcfM4aAPHJMo3Od9dYluNa0cEvKvGrgkmav0OKkum3jzNyb5TF
	5DpE8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91uyda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:58:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba718173d1so130335125ad.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731119; x=1779335919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2Dj87Y4whUJaBzEehE1Tqbo9ydbz/EdWzB0LJkcrAA=;
        b=TP88H/YgQ4W6PQlSrVq97iZJgUG4/0Ql9/UQzliMtAeZv9EhNPm1tjzaQRBx+YedIA
         UO/XI5G8gL4MnelAXsOD5U/M1lk88hsfN3RWjz/0yn42+c1ycqSUYZbt+3e7GuXFPn8H
         mkADyMaxkxgHkC4MgJKPzNZWeKAtJ66AJQ9d9zkK8vCtzwO4pH+VyVS6F09hyB7G8Nug
         LnJA4eSVOYmQRY7F6OV+L5VD1PSF0xrmmvrwV67M7BFCcp2/0rSKmFZT9SFs1lsyvkwb
         XILayk7uNdo8JS5mg/8eqnG6L32Bc4kv7Hsb1r4/zMQuGlsCEx+DXN3LDOKySPgerP02
         gYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731119; x=1779335919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P2Dj87Y4whUJaBzEehE1Tqbo9ydbz/EdWzB0LJkcrAA=;
        b=ZRT2WDt1nXJB4DvJsb78v21N2qmCj3/GW99YkQeLtf9cp+9qNDbectaW+LEdwq65dV
         vrdxOEHadlOF3z3Aty4fuLdcjEjrOFuwp3qXktKx9S1eK9xf6ZkDdKSI2S3XxhSo9Wg5
         9b9wSsWte+LdB3Ye9ZU8RFZXhFWPEKwv+t5GK8EaC1O8bUC7y6+7wRaCg+Efc76Bc4RP
         ClTljIRNaBcjUjr4ozkh/YOywLpmi1A6l+S0aE9oAvfO3vguxqZVjkLxvtuK9cgOpz1G
         aRfYEY4z9Ib6YBQzWYWtWhnMywPrT8Lq/uhTs6KcbIwoBlOSSNhDK3nX+YL57yfO2lyq
         ylvw==
X-Forwarded-Encrypted: i=1; AFNElJ8iSqjOGwrlWHn+AiCXYjveFimwp9yF1yxT5+3D4JYvtQxYtV5NWdTguHSTvBeHU9HYyLshBU+JsAbD@vger.kernel.org
X-Gm-Message-State: AOJu0YzREA4ZdagvrRwgkyW1mbAIO3TvJIP70HSUCZ4lM82jroKOaHeB
	wz8FxudhHwXaZ2XCu7iSJJNKiKGh57YMFqdZAjzwiItlSnWDYd2E7IkwHAE5OPvSxwTcs8vXLkA
	p6f78cKNeWkWunv+u6b1Jb2GhzAgiYffrHXNVP3xKnKyCvX5WkF/yRH2sBpomJvvnBCKfV5AG
X-Gm-Gg: Acq92OGCxwCFC1BcRSZwnXKY/CCdqYpgWwbefTJUW1bCHoA+kFnv/8MqbCsCszBtddx
	FEp3LyPyGEMC9FRQu/4YEsMvKtnnxvb9vq695tffdsnDtNYvuZmcEj7DNsyw7mT1xX4suQjo3Cl
	P6e3Jwk9RPZfUscZ06g2DIAHEbzhot6gkQGxHvWYsSD5qBg5fZKM7UQDA1Xu8eVoxyN6Zz2d8zZ
	3K7b2In3AdcVBFsiJRwcXKKea2kNVehTeivW5EJt8w2HoiKTZ0tZq9xkZwyIztDuKxVrACP+XoU
	CKVbQ191f+JQmDvSr7mcPLfk4i+lVppDFsGcB5OImQ8G/Zwocqd7Hpg8HQNX45V0c9soMhuVdNn
	WQVtMfb2/S3mzJvgvyq9/M2ueqQwCJ0qoFzKu5zsIiUsWw9nN9Vu1vN3vDjxPbGoMRAW5THXG6H
	INEtNNVty5r5xipItsb6bKvmOGXsiLZl4Nf79HIbc55wLCqz84RIhmmEdFIo8BNw==
X-Received: by 2002:a17:903:2284:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2bd2f4f700amr59619835ad.1.1778731119183;
        Wed, 13 May 2026 20:58:39 -0700 (PDT)
X-Received: by 2002:a17:903:2284:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2bd2f4f700amr59619695ad.1.1778731118741;
        Wed, 13 May 2026 20:58:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe44sm8313965ad.11.2026.05.13.20.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:58:38 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:28:28 +0530
Subject: [PATCH 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the
 ipq5210 QMP PCIe PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-pci-phy-v1-1-482429192746@oss.qualcomm.com>
References: <20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com>
In-Reply-To: <20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: BQ0-7iBG2pjya4SwUQKIbhowbNvee60T
X-Proofpoint-GUID: BQ0-7iBG2pjya4SwUQKIbhowbNvee60T
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a05486f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WUYZBL7PiKyslTlvAlEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNiBTYWx0ZWRfX1uAUGtZfTL7w
 ygT+PFI8boO5bkwXlAETXlGAl94Q+cqZHzyrhVK0W+XmnJoUWPGk3nPR8W18CvMeqZLCKzoUBVA
 n2SF8ubO5xzxk9i541h7q/f+8Caw/3CNPwNvXLKiMTnMqGqz2HLxW45jvGhbh6+WwbUoM14zmMH
 8N0LGc+FeSI3sAg4Ny5wuS6BhLXv9TtWUexEP1Si5J0SFuinx+8bXqxGo252pD7pdAsi+mvYsJ+
 CljElTQpOeF1JFFZtDtahC2edaghOIXVQX0zl7gMaCJIu1dPOvnzr14Bv6kLDcwVlPuRgogZCpq
 +98AGpi/0r9G6nAtS0YcfEz05C95wfgkVUGuGBSZxNwIpPiq3Rx19D+k7oXkEKZnEYji4GZXDbp
 1j+FZUnDzRdbmHDSQJm31mS11+hA79GF5xHpWfKPv9qAASsmtBmhYjGEXauTak7E3zxlFpN9q9Q
 tHW/4WnXMtDEMifooQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140036

Document the PCIe phy on the ipq5210 platform using the ipq9574 bindings
as a fallback, since the PCIe phy on the ipq5210 is similar to ipq9574.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..1ac31439c20a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,ipq5210-qmp-gen3x1-pcie-phy
           - qcom,ipq6018-qmp-pcie-phy
           - qcom,ipq8074-qmp-gen3-pcie-phy
           - qcom,ipq8074-qmp-pcie-phy
@@ -24,10 +25,12 @@ properties:
           - qcom,ipq9574-qmp-gen3x2-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x1-pcie-phy
               - qcom,ipq5424-qmp-gen3x1-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x2-pcie-phy
               - qcom,ipq5424-qmp-gen3x2-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x2-pcie-phy
 

-- 
2.34.1

