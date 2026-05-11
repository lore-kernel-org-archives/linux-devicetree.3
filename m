Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D5831E83D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497111; cv=none; b=tsDcSyj8Udc/tiCARQ2ehE+U5Q1Hd38KV22SOLR5g+0Ld8Bvo+aTZt2/OQGNtSB8G6lPRaOJ4DAlYhDMtzMyJsl37X5STMMMLlHqollFzQKIWWFXqkX73ovyvliqFBbezpMfWvpm9Aw0rtBwqsFfg7PSCAx8G4zL7WJyWebvpFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497111; c=relaxed/simple;
	bh=JN6/ExK2Rg0UofXLGcXSts/oWytXzJDW+aaPu6IaotE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=udagRqu+5NDzoUZa5wGlloCXS9IIljZUYPX5xpaOLRbx1pmP34vmo1pc1jD4mpUbuYhoyx5TjxlDXEUP68bRvTHubkHqCQpHNHSZY5ifliLGqaJ1f85yO2VOxH2ff7sMR+1nU/PViChGZ7V33Br2aTKtlutpd2FG0i7Qm8fVl5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXui7dDD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLQ2mFPA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXui7dDD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLQ2mFPA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A4AJ1258491
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vXUszgUsTn3BGokN887JAQ
	GEwf4F2sSdahekz0rkWmY=; b=LXui7dDD7UjmVxYVtnKT7ddgc7/E/mTzGKSk0T
	+lMDC9RvJqSqH0zdsHKpSqGKqmxUlmiaiK2p3EOak3XWPAubXmUMd+eFb3WXfhjy
	Pg0mee8xlH4q/SgFG9f5/ESbE0AoUv3D1MEg3ZGT1XO7/Wb30YxMi9PC15lK6LRM
	ENzL3rl8ddmMwaCRNKIy1v4byWJ/VrQ+Eio8dzE3WihEBOEKKg1n6qEvl+DB7wmM
	xCPjlZiVJSf5DfYxfWsUw+d/mPiN0YiKCbWkrMMud5sBdDHvxd/5H2x3ro9ThEb2
	qG3pjC9VWfEzKKmaoS/xwKeKgcZ9UoCaGTbao/utS9+fdF7w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag20tkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:58:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366122e01fcso4689803a91.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497108; x=1779101908; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXUszgUsTn3BGokN887JAQGEwf4F2sSdahekz0rkWmY=;
        b=KLQ2mFPA/OiqAy7c1K7LK8zNuwf4FxN3g8gvEITvjakPLNpNboslZ6MKHUpoaO0YX2
         cf3EwGYWWIwAHPeHf+nPyP8mrFacG+gDQtOc6vldvrtgXHhfcFlcMRDd/d54K84aIshC
         VnYTcce2JQ1JMeLs2bv5fsYfjR43B+LFhyZjO7wosbN1FCbuSPLW+Uf9383kxbinnKkg
         luc3B9wAyFHoJooWglV31uhbx7vxwvyN1wIQ+UcqPcVF0GwWqZY6JkJdVPSZWmf23/9o
         8oxeUe6/fCIEAlqOFNfVpqUitH2QzwDyW6lANT4lAi4lepsEJUokL5gETg21R37+Z1KH
         UYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497108; x=1779101908;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXUszgUsTn3BGokN887JAQGEwf4F2sSdahekz0rkWmY=;
        b=sUm2NVIB+O0i5uNzcAwcsrczkKA2G1Ssu6f55vHJLJlCWOsC46WvujnJyxrcwMtI/5
         zjojHuEH3ajFzN2BlIwW368pgUuH12lKctUgLC6+aufV4erGuTOVZKUddt0FQGsWRy/Z
         lXnrbpeVjJz9j1y41NNlpMsV6FGr/g4+SaVtkH5PwksVF/feDKTr8ItdwhpW82j9a2W5
         A6+xeE+MysTrrG/4dsoY6xpOzyUtpnPBssLON7Qo+Lxj++mwh/GnIKS/JEuXdEYr5rXa
         tTEyvrpMqfvERtkDiRSVWgY+VA8bDgLzCmhcXvSIKXG2dZWG2CPbYezHqNsv+jvb0LfV
         7mhA==
X-Forwarded-Encrypted: i=1; AFNElJ+NA6gtOsg1SuLSkoLKhPmMb2s6gBYudidFxHCsijD+ep237/e68aF7YwczZCxevy29n4yr7OjaPTDG@vger.kernel.org
X-Gm-Message-State: AOJu0YxRojvYFtZ/PdPy3xDl7aQE0cI11AGoLdNamUzbQl+ozOm8aZOL
	Cb7k7slkYiATJyhOzADk4NU/sAiEBJGbUTtpARduVg4KNyZCW3872c0uE5+g0oHeoWNRLf0/bEJ
	crKLqF3eBPapkdqrVJfKV4zfuTtZDFVERIZeviTfoRxYMJwU49dGkJH8iM7ASk79u
X-Gm-Gg: Acq92OHWuZ2Vrf1zYDshXEnDFoXe5YD8seP+Z0UUkuxTXJvd87n10fgghx8ysdWydRU
	CT4X24bxIO654i4t6Dq6sDcI7Irh84/478Wikg/e3BXdW+URSj2MUjfvIoX1WH3wTdsCln45BCh
	YyB8ANmH8VwXLZ1Mfmop8kINCIevn/nUy9ibl76ZwZLTSHNXHGmX6+A2xDsK/4OdsCzReLfKoeN
	z27tn9iQK5C8LBKkr+axXY7SA5PGLoxSl7Vk9go+TOsNzxaePnWjyAkRiYP2y1DyNPN6ildO1mG
	P8ZUOBpEz1q9U+TzWL0ikjRtX3piABONdjbgt5uqb5owvwsbvw8rmdDkAJax507yCQz8GfVHACx
	UfKU47xzHdI2PZ5e9HoqBm8UTI4PsPU/ZF7zy1w2lRFJSMtMeyrdrGMiOBpPXL0rzNwPIrh/ekH
	kSTMz11MWmYJmW+QUi8mENks3Vh/0kVEDHSB5W4wbJ/lyxAOG6riUlJDqkxoKmcMUhquY=
X-Received: by 2002:a17:90b:270c:b0:35e:5723:85e3 with SMTP id 98e67ed59e1d1-365abce2dd2mr26055481a91.9.1778497108529;
        Mon, 11 May 2026 03:58:28 -0700 (PDT)
X-Received: by 2002:a17:90b:270c:b0:35e:5723:85e3 with SMTP id 98e67ed59e1d1-365abce2dd2mr26055461a91.9.1778497108075;
        Mon, 11 May 2026 03:58:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d625f126sm8256025a91.3.2026.05.11.03.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:58:27 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:28:21 +0530
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Document the IPQ5210 TCSR
 block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq5210_tcsr_binding-v1-1-c8d20fed014f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEy2AWoC/yXMQQqDMBBG4avIrBtIAnHhVaRITH51XESbsaUg3
 t2oy2/x3k6CzBBqqp0yfiy8pALzqihMPo1QHIvJaltrZ4zi9eOs0d0WJHc9p8hpVM5j0NHCI3g
 q6Zox8P/etu/H8u1nhO160XGcaaZwO3gAAAA=
X-Change-ID: 20260511-ipq5210_tcsr_binding-5aef0d2eaeca
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497103; l=994;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=JN6/ExK2Rg0UofXLGcXSts/oWytXzJDW+aaPu6IaotE=;
 b=cryJjrmFzhER3d17VRz4wXuMyLqEh7y5B+jD3YZawBKr5NeD+OiAeWnkASQ2K5/b+phrB8Frp
 dHfwUBRvWrwDcFBMg3kVcBd9dgLeqCjehwWYt3GQG9Ce2QKWtenIEbH
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: _gBQLuThuOt-udKmQEKfzpaWxK8uueS3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMSBTYWx0ZWRfX0j2nWin0VX3r
 q7YS/lFoavxo5t6aygAF84WUnj3Gk8z5rLeOp43AhuD682MXzkLNYrdvkeznFZd7HJf+FhiiCV4
 VbxZiNwhMZA4iQOs1fWwkXvtWwI5MGFpMdjkzRiEHOGCzTk1BL9OQ40lo67uIwYc1Nc5ccMSjUY
 L3Y/RsmngrY9mApQpxInm/qL4Sme3KPemJ0qa/U0rqoW+ba/br5jFExhk2fPRTuIw2dyc+6BYrM
 xCQdQpYdAIXD7FR8sSLM02y2qRo0XBTe6vIw+oqS3qDwZtEc4n3ywVYYN3IrysEZRHLwI0f8Y8g
 NhoZTd2kkr7YUwSjkv5hbz0UxGYr32XjYOKDgIJHVJbly3fu/X+MC7Q9xBtMpq6wdBaqDzGbCob
 1ekQ7jDdpOTEZK/sa/gT1/V49idS8JPMLcEa2pg6j/IVuh54wc+zqvNZLvhpFlZqiy3se1OCSoY
 kJXZFRdFu/mQ1yk5UbA==
X-Proofpoint-GUID: _gBQLuThuOt-udKmQEKfzpaWxK8uueS3
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01b655 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UC7JEpr1MBeH69GyZZwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110121

Document the TCSR block found on the Qualcomm's IPQ5210 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..c63e677bd913 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -42,6 +42,7 @@ properties:
           - qcom,tcsr-apq8064
           - qcom,tcsr-apq8084
           - qcom,tcsr-ipq5018
+          - qcom,tcsr-ipq5210
           - qcom,tcsr-ipq5332
           - qcom,tcsr-ipq5424
           - qcom,tcsr-ipq6018

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq5210_tcsr_binding-5aef0d2eaeca

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

