Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A40396D2E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438849; cv=none; b=J2rg3AorVZOg0Z4ZivaFeowpT6KDBzUfZt78YMOvvNTajA/LO8J0e8SBLGm2J5aZlVydGS8wbuNxCuV4pa6guHbMlyKqOZIYIx+49MXkya6eIQRbG/8ifpe8BefwKzA5Ge3H0G1M8b7Uh3zmC7uV+QgaUHkCvSxPUQHL57EGTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438849; c=relaxed/simple;
	bh=tDnZXplE3iDQjEdVi5mh8rCE3rI5eA9AbuO90Vkh88Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hR68CyfIsTmBk9QACNiDglZznDtE2pt2nyLMWxO4rG7ySvkDDYFRASCZU2dhRfaiF4PFq3uH9TrH6H0GUILJrudBcW8o9f9tVFz89PunNrgqFvma64VP+7+NZrAOsY4x38FpvYdtYmXoeeq+p9dwBdbZaD47hX6SFvBONlA3s4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtGx3SKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpjqaaMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtGx3SKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VpjqaaMG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGd7x1626559
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lvn2/MLsCdGEHg4sHbrFe+
	u4djRgQ5wPJNB5j5dFaYQ=; b=jtGx3SKbPuJzWTYVToM8Lkkl3zcxp+jQLk03fP
	n1LxJNn4wI2xSpw/+tZ7uvMXq1OdUFoPXZWTOsohvDqueSFbhkq7t+M3VnMs2Y4s
	Od2WuOsAeWJTHGIWzhHUYWvkjtAbJqkCbeUinP0Mt9VLH4/5kaimg+dcEnAnMpPm
	WM5ek28pLgMGsPXVZ3F5UvVtky5diN6Pp5DRA5eJMNCkS0qhDKj85FIVt0ccmqgY
	sZT4YnvbdoMlBnJXaS4uS6uTVu7poC1fcBwGw2EGrXcNfXQ4AN7gFrwd+RdpS0Fk
	09P1rqELm1uzofh+uEK+RoxfDRMJCREnNq2508VgNQ9+NNbA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489whj5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:40:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso65148335ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438846; x=1775043646; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lvn2/MLsCdGEHg4sHbrFe+u4djRgQ5wPJNB5j5dFaYQ=;
        b=VpjqaaMGucZDAxD12AnaMNEL3kXKZO93BmcmPe5S+G9vSR8TTYb2RI5eso/XgTzioC
         0A9WLbu/s9XxMCtGCA1+hfClJXIbsi8ICBx+lLaC6+T/dFXJEmsTnl74gJRkRDMCVF2q
         79Q7Mqunu0Q4G+SHtjSbRzl+EOFe8ZvJDfKs1cQVdZCnu9ZnfpSwzbggcqkBOVlqYs7e
         tS8Wgs1GZPaOPpt3gxmjM7a7y27wcRkugcQ3sVHkV71LvLw5KUCeJ41rdNHPK1HgTzx+
         2cR3dZrYc+4DkzgbZYWNPmnauRt2V43Rgzpa6T1o7Jijz/SSh4k721gc9YrGHn6JCayA
         mKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438846; x=1775043646;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvn2/MLsCdGEHg4sHbrFe+u4djRgQ5wPJNB5j5dFaYQ=;
        b=UZUaa/0toQssJC8oRc7ER/2wlHb4I9VayW+rrBvAHnkFkbnLWhfkHYqhaqlA6SPaqP
         z0MM/aABYtzY0MpEMTa7yg/tmoEOgqJIF4K+0+jd3SOsDGb79TZyPop4ZNW9Tg7WJa6N
         2u571NFF1kuWlT10tZzFA/pPIj9wxFJDgzanWe9+3UPdWTHVkFcXGUaZe8E7jaZSwUP7
         saMaWWDLFj/FB8jn/mGf2vmRymJIyO2U7QTkhM+w42TfZAzyInePzGFxWUoWdJi4/wLs
         H743z+G/ppUB80bcNtGptBSErb3+tho9REgcFlSlO49yHrc9z9yzg+I9Y6DU+r1zS4t7
         t65w==
X-Forwarded-Encrypted: i=1; AJvYcCWK/tOO8dwW3/BiGYBlioYTuYWyWye1pcfM/ecHDLkHvpoI9OUg1icidmWt22x/dFnzCYKUxHP95mfk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6mrmVPSzB1RPGNoqzqhcGr6F+3SKRL3JAsvF01oeu4VsQCTCJ
	37Pr2CJxCULaLP8oUqtMSW2FeXFtd/PNYVjrKjNSrpHuuuAuGAdLtEMt683cDahK54XG7yfHkJM
	9ihLeQ1EVvPvT7Yxjy+CSoh8QIMBuxxGp/Oo9W86WXXJuu5XSr8umOv3qmp0DXlNt
X-Gm-Gg: ATEYQzy1JOKyeqaPzRb0G7wBDzv2sjLa4ffykUgWhQssrNyhHK7YftBf3L6kyS72vNl
	O+a64lA/3dLEYo18/YwEu8tpoY95Pc2p1rVpSz2h2LnsrvZz1e2VoqDh5vUEutJtfPpsFIQsjCb
	CAu2kn8In7wmCCFCnb5GCCgxTik/A+qjyIhhpfoloiD8RT1QhhtBjSpE1JzhJRQCLM3MqfIzj6s
	XUEhqyJemqEybsfX6QN5NO3Ddj3o0pGCCLPlkLYi2eb4UctzIDcI1o8QLNKeFx2ccmGAtjcvMX9
	mXkmYOQ2P1EbgMonmBzbqK4pGadjLPmJ4vj2MNmwGR6Zxxxh/ILQ/x8xxqXAMnCJCGhWK3QXk6w
	+zuVt5gKJPFTLxkYT56/7YvN5C/XzeE74g0TeMlLbmEvwpXbTMQ75xu1JPOlELkcBuaeURSd/fr
	fiW9ZibmtTtzJEpAmMyuuCcd9BsieKODM4D56YGNX0PElDTTe1jhlPphnL
X-Received: by 2002:a17:903:1b10:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b0b0aad881mr36758795ad.28.1774438845758;
        Wed, 25 Mar 2026 04:40:45 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b0b0aad881mr36758365ad.28.1774438845295;
        Wed, 25 Mar 2026 04:40:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083698929sm221714495ad.73.2026.03.25.04.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:40:44 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:10:19 +0530
Subject: [PATCH] dt-bindings: mmc: sdhci-msm: add IPQ9650 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ipq9650_sdhc-v1-1-53cf7ba11087@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKLJw2kC/yXMQQqDMBBG4avIrBtII1HiVUoRTX51XFibUSmId
 2/U5bd4bydBZAhV2U4RGwt/poTnIyM/NFMPxSGZjDaFzo1VPH9dYXUtYfDKtaUFHIL1DaVkjuj
 4d+1e79uytiP8cj7oOP609SgvcAAAAA==
X-Change-ID: 20260325-ipq9650_sdhc-9b75ee9ed5ca
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438841; l=1066;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=tDnZXplE3iDQjEdVi5mh8rCE3rI5eA9AbuO90Vkh88Y=;
 b=qW7QtCLL8S3cYAi27HSR2yzlgCrJOl0a98NzeK3JFxjraPQ4onRS4mMH+TXGrSS7rm06SuHPx
 w7Sxcu4HN3mAj5+IudQkjsEtkHiRPSXx+wV2FWVUOPlNKz/ZDHdAN0y
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: xJW560Jzg56dXRcM0OaPaDcvHwJrSKqi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfX3oMkg1Ow20UO
 oLjf4dYwNp4C812wy8mQ0UkZu/M3jxzzzZ5OTXCBgygXigaXFzHzsADvBMCgTL6zU7je/a0/4BT
 jL6nbv6MO3z4OMfHcuumCx0iTs5BTnFGqRjZwt06+DRQp3at8Hs+guGfc6rxS12b14QtAFMy3yi
 mXrddk320rCeiBKsLQC9qPa9u+5dQ1j2E+H4VxQcsyn77krj2wryZ4WN16oVBRnT97WjyiqXqG/
 d6rdUC3MCLMYfWzOelX3rXpZZ3LFUF8cTn//DwKP49fLTiUuwZu4IKZikfKA7KSh+OQiEnCtj8T
 mljELo3bJRaS3zjS1Uf/PgUJrRJv7qsOQxhOE4Kn4+99VZ7EueHBMUXBTZ4o+n2iB48YsywAGdR
 vAzJyDtQNhud9UY4cZx4vz83/EdYPznp2J9vosdMYQckMI973N5fUO+114MTp0fhVryaxbWrOK6
 N3esDcm9t2yTV2OqIVg==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c3c9be cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NU5nQSpfrVhKxuQ884cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: xJW560Jzg56dXRcM0OaPaDcvHwJrSKqi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250082

The IPQ9650 supports eMMC with an SDHCI controller. Add the appropriate
compatible to the documentation.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index fd1d5b04e755..695a95e8f35d 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -43,6 +43,7 @@ properties:
               - qcom,ipq5424-sdhci
               - qcom,ipq6018-sdhci
               - qcom,ipq9574-sdhci
+              - qcom,ipq9650-sdhci
               - qcom,kaanapali-sdhci
               - qcom,milos-sdhci
               - qcom,qcm2290-sdhci

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-ipq9650_sdhc-9b75ee9ed5ca

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

