Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9043EDAC8
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619064; cv=none; b=sxZQjsjJUVvg5vtfhm/h52nvdqsx41UQh8Tng1l5mQLbiM1DGXWXFcuGPk8LmOM1zvvMvf7J0e+ZDLmGWB4T4kD6nN4JIvX250MI6is6f1a9K6wPdrVJOlGVI3bk9vGlU3ayRUV+hZlTq4Ul+muMCCcdJ+R0h22xG9rGQbGv+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619064; c=relaxed/simple;
	bh=WLp44NdrpQY5+ihIZi9+jneYN8QyP36uwtuXwEh/J9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LtDxCgycw1n/WstkecS1CrSEQIxQT1BPcCPc43E5486wtc7TxPazwEBPHe2maDUMQzFIre4SXCf/KVYi0aDS2bmokPc+ds5V6Ewep4YFK+/BsquN8g1TktLkXtpdzE+2lYvermKjPV0qf0N/F5QMRR+/XNZ57VmRiwferWSO6JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2KeNApi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvad4PQV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2KeNApi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvad4PQV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhHlr2769230
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0d2lK/B8DebECRChn9a1f4
	dUpqpCsR5VR9s0KzTLjM8=; b=O2KeNApif279fUGPbqjr8vhlBSbWIWOZQ9aled
	myONguTM2XdeqJtX3O0UWsK8SMFFKb+evVCfda4qDoLWHBokpqaoJBNg+bp7xTvq
	PNNi1ZEQ4hsFqLs5Uzlqo3zVa/DywCY4M/yr80o2mmpmSUrYsqP5xJTu+IU3aD+p
	oPA/v0c4hNDFmB8oj7kSPsFrvrv1Xag3M3KEEY8OQsA20QjHounXouw6T6uORoeM
	fSx8brBa4Df79RnI3VtpiDeUkHnKuIP9DX8xIFdZrQawmQLGZHzSKCyh6GxcxRNl
	5mMlwzknoar1xfslIBo5gwkK8hI1WRYUSTocAeo56gkuOOEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv38bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:44:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b317c40acso7814901cf.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774619062; x=1775223862; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0d2lK/B8DebECRChn9a1f4dUpqpCsR5VR9s0KzTLjM8=;
        b=gvad4PQVEii6ItadTCpei2tsJw2NdW/O3XdKTubQXYMHsIRLOX6q8y2kXLsX4rxl2Q
         doWOCp6Yo3wagjrBBDeCKVSiWk454Ha7Wq0ifAiHSck9CA+NgIYfMjv4af/BcFDYr4iI
         fTKtzs8C5o06kDefrlI1iHdU+9gsCib0z5e/kUdMmJIUEW4QigAMt7r54kh158IhvD3H
         WgL6kgpmOSnynMIIQrOW9SOo8+7DL5RacQPB5YAqnYLGb8sXb6+2pS8dB2HvMnx3pKw2
         LXBAtuSlElYlp+FyunaTvTSvl+j1l60VVI2kBM0tW9134a/3qfmPC6uNcP4PMCUBK+tP
         bvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619062; x=1775223862;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0d2lK/B8DebECRChn9a1f4dUpqpCsR5VR9s0KzTLjM8=;
        b=gVW3oz4HqscLGzInPWbzuMwl6v0ORy47LrDDOfoioRXOVkxwhSEzmB7UuvjqTZznT1
         2gVYP/VgjZ/t0ccy+5OYxS1YG6scq8L3mjHy1mmr0xNMTuv2soiGfUdaZSH+02vc+0gH
         O50utNue9AR2csJBmdkapeJPnogUEHjVJmraaO4B9dQE/C0p/muRWiZ6YvjRFefv9wWS
         VeGpBrxbIjgqysVh8rJUE+0yKzhQ9AP2WZqLKkGqPT9nKWyUti6s/W97GxBaWKT/5IpQ
         ologoCzwLgvBx97v3uf5Peq2qKlkxxXHAqSE9sbDKUbnWyFD2P6In66GFm/ayAHfVaME
         1T3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVp1nietNl5eHfg6OFrXV6X5WlHbEgixhHxxp7kxNjuU0+g1rIgw4V1f7mEWr/Usgd7cc1ZGXbkgtdW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Ebq1cOllHtRxquyGlNJTBkEVty+n/fRkp67dHMsZ7MrWt4Qr
	mQusDuRd84V2BcasJtM1c3T7NOJGNaV2UVMR+Cxe1E6qEr2jFFhxlJSCZjvU58eiW0QriHX3ntA
	eLU1Km6+u8rwW0RpblAHYBDb6Zr7d9EJ0Ft19it04y7x4BKn418tHh7scQbO5A7bO
X-Gm-Gg: ATEYQzw/ShUeaeCi0NQEfz2TvQfTz2uJ4mD8hrtQf7GTc//nSZ0olQJIx7huoUvfg8B
	OsdQ+0z0m+Dm96xLSnsonxSe5ArtaKOI1CU1QIvPlPi4p2MXO/FA27fUdq0kjx7ed/R2DLVUX/7
	WWIvryYnYvXCi1rOrbUG311lzmp4ARfH33uctba64EXW6cIX7yVfnYCKGBPVZ2UZ38l8ob+6SjT
	CdAo2qwH1EHgQcAH3Ink+qNK9Cs8bVEoXvtgEG3luwzB3H1+1AujVlZ0OyY5Zc2TWVAiuH3h5J6
	LjM3ryavPiLMty4dlMGmH/5ZYwGnjfHd67bqUtiUCYA8BSQpZ0ILc/rj7o4Z+86WgH/nbK14kgO
	akEbMHSpfaVfvIueB4BOdXPa/dOI=
X-Received: by 2002:a05:622a:11c1:b0:509:2d79:f884 with SMTP id d75a77b69052e-50ba37d1d87mr32933341cf.12.1774619061245;
        Fri, 27 Mar 2026 06:44:21 -0700 (PDT)
X-Received: by 2002:a05:622a:11c1:b0:509:2d79:f884 with SMTP id d75a77b69052e-50ba37d1d87mr32932731cf.12.1774619060510;
        Fri, 27 Mar 2026 06:44:20 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270dd790sm35668815e9.5.2026.03.27.06.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:44:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:44:13 +0200
Subject: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Document Eliza
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-bindings-pmic-glink-v1-1-f9a65495f599@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKyJxmkC/yXMQQ6CQAxA0auQrm2Co4HoVYwL2iljFSuZqiEQ7
 u6oy7f4fwGXrOJwrBbI8lbXhxVsNxXwpbMkqLEYQh2aehdalEHnDkktqiXH8a6MaVC7IYe+bQ6
 0Z6IIpR+z9Dr93qfz3/6iq/DzO4R1/QA3VST+fQAAAA==
X-Change-ID: 20260327-eliza-bindings-pmic-glink-c2f769b4cbbd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=WLp44NdrpQY5+ihIZi9+jneYN8QyP36uwtuXwEh/J9A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxomxiDG9Z9Y6+NrOjxLMqcZN0FpsHORr26YpD
 1rLgNK430yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacaJsQAKCRAbX0TJAJUV
 Vv1fD/kBpPyMuyI4eziP2PlhfGQFvffC4v6QiFookjC0KqThBjOJ/w77/oecqsVhK/2hpFpsFuz
 dyDYUNFuJQPt8G+8kMiEOpAJx6mOYWtSKee7bJpVS4OWNZxwSPgxBzNP6XO7ea78/DjcYX9j+63
 0ZwGbhAnaj4ahryQXJ1139Q4MFyC6rz/qgvS8Ar8UNvvLkx7t65qK728Yat6xtrtRyP3ipXHAS9
 dQucpAynRtnf0CM4pmzbFp/hZHfU5r9YtceTKiyN4hiRfS8XDYfLXDD6e1D4tOliSL9BfOzXP2k
 53R9L+UwTAvWqzEWVcBkQFxdfxDTIGwGDc1DFdO/bNN1a2iXImG0Mti7uWCIdAC3GcHqHUm8AaJ
 oJ8/vBVZZFcZbm7/el2D2kMgp5KKRQaAZePuF+DivwbGBSs6zDDABiJMYN6HDP4F94R0q5cHp0Z
 5yK3WNiVmtwgQMfxe9l97wPF8rLPuT6AMudKQDr32qWck0M/ZXLAhuH9h8stvOvzwurOD9h17ln
 r37Aqj1xQiFA+K2DC+39nJY42qJ8bbBhYf//gzdMsXPYbbSFveO2hya1fnEpFCpoA2Kmk+yqHND
 4JkUh+6rvCd4plktZdAom1Sd7vywoD0abWcxdL96/w/JKSkXkGo9iOpHiiJF5BJnd8jfjL1hNsp
 PY3bSNonenLFc1g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c689b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rFgtliq726l97mATxKoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: SqUuaDPuL23xGNLItOZzDEWBRlg-jkR3
X-Proofpoint-GUID: SqUuaDPuL23xGNLItOZzDEWBRlg-jkR3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5NCBTYWx0ZWRfX6bWBihjTlEvr
 Owi5SKdu7yIFAkslv0qltOhmGnIqOBoXwxSUgWHRolGbzqFf35IrJo5Ot6e9KRbDJaTfv4xMBBQ
 OZ8viejcAo5f5e8vVFMdwkXzZ6TVkAsfrelcFH0svHZumXIIwUs6FJ5HxcKa+XQIjoaR5i6qCpJ
 /CpZ9LZKOLJHu205g4AbPKx4SIST99ukVVsXDJWho4UKbE3nQzJZh/StMDvci4F8G4tQ5f7AZne
 Wg6ilsydH7JsgDoQfjZNiCW8TNoC5OTTGlc3uaI4aKq3Tg9hwLm3a655E8/D4540VvDafoB7CzJ
 Fqmog7ex0MuVwqhEUY9eUM2Gju7EwoWK4E4TaxmAdZFbxqSkgsnGbuUzc1SLS4Td5w/LW2PxCJi
 azcOC4jVwTDhJklub35CB5KW16fQUCbtgUJstgZdv2TOgl+BgfqPY89MCWfS1ZDNuah9oHg9Pxs
 xZXipAfwRXHJsKv9X5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270094

Document the compatible for the PMIC GLINK interface found on the
Qualcomm Eliza SoC.

It is fully compatible with the one found on SM8550, so use that as
fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index ff01d2f3ee5b..411932f6b282 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -39,6 +39,7 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,eliza-pmic-glink
               - qcom,milos-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-bindings-pmic-glink-c2f769b4cbbd

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

