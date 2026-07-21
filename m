Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF023B7779
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784608843; cv=none; b=hyMsJazSWusR2H1442KUDqBFxoJCri/7X9KSdqjyRUBNvNEqhQCTNrpQdVTcKvF3hYL5x7fbOq3jRvi5f1D550+juoV7NKpU8aSDeEe/9fnqjFn9DQPHoI1bgCh76EBV+pveuNlwl3ErEbkTFR0Wt8nXhJ2mxlLPpOXlGIXHIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784608843; c=relaxed/simple;
	bh=89MURYEr+rjQOUrSPrvPE6p9isjbYE8qiPEEvCJb9d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATw4uIlBSgnt1PUD4Z2S84T1OulGjELxteigWJI5rtkP2dALURo4b7V+a9tMleT6O7cH7k/j/1Ww5G11ymxsbdNwVB6NXect3Gx1840GlijoTyfHUBF1emzglrPl1lf/27bVuGI/JhOGXhEw3Vkio7ZLgBsnb01RjHj7l/gwISQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fpbi0Zkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGlm3gq5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fpbi0Zkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGlm3gq5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KND1vi3884920
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TPMz4PQcpHy
	Ih2SKXWYLcSA+B3wGjtZCyAVfAhIprWI=; b=Fpbi0Zkl1pYufvn9BUKgo88hrAq
	zpe03Sg+YpwlJDbwHjJjmNJ5qOD6IK86KGjdrMYif+v2r72SjPsczoUBvID6f2Uf
	tsuUZqoqU3L6WRr2ry5A1gXpOOFza6yCxhexpiHV2Pruxo0XSnAKVsYo7k+3aspW
	LhdF7HsrsqtuzO8GaMp0qQrR7eRV11XvP59ai4ul8H38jv1UpJ65G8bU0lYAfcRq
	JkONDboks03vbmO7QTDWIWP8j7IMNkHSbj8CTxfnfUxbk55X3lOEDmonkOKRjAL0
	zJ5ISd2qwrOqHJGguc4KuXAtTOjuRZs7ucmZ30NVvUPcQ2E3fvbDPikr4Kg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcab59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:40:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so3780751a12.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784608839; x=1785213639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPMz4PQcpHyIh2SKXWYLcSA+B3wGjtZCyAVfAhIprWI=;
        b=CGlm3gq5hmXpb5k+iVfBBr0Vs7A/p7ieQEPypuY96durNy3t1NIx7W+k1iYyPGloQU
         FbPJaXxt7jL9Sk72gS6KAGcvpGMGRSaLvu/Tnk5OOJStZHDYqEX4qIanFPgJp/NFlpN+
         /OA7wUEnyWzkMEjMOU+h+tswqOVGBlPOTrrnj6S/pNIhpWVz+WYHysLCtbW/0PQeJR0y
         /ARaPCJTVoePWNnm1s6OKqAgFsjViE41qCgqTx5GctrFFXNW/Bpbr0lrfYsALaaYLjWJ
         Nuq2jClk2yeRPS3iX+S5eGl1xkW95hZmSzKbnbQ1B+hAzEx0NZ6I1AyxHALC2TRD4N5B
         I8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784608839; x=1785213639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TPMz4PQcpHyIh2SKXWYLcSA+B3wGjtZCyAVfAhIprWI=;
        b=jiE6ROwsBNF7s9sgfKFk3EiMUCQgYcLOo5kDXQojD32YLIDTAYCJrBRbm8wy1fCcDg
         hoS4XyHbhr1Pdr7B1Be0xKG/GMZza8ywDRhZgraicGfOYgzLshnmJmmjtlav88IHlsBA
         zWh5KorH1ZtcHcvDSxfkGcVo71d7lfdXxLe+RZ3S7x6+2pINN4f0OeYKl16TEliQbOww
         GH23HXdCVqJpMSYv+yggKmc8mU8b8laWZ+oeUmWtjV4Nv7GYAOuLgsCyYr5dSWx5pwYH
         6ksiCPr6IAPrmTx9WDV3KKrD88xm9L9OtuN4JbLgwHthblKd+iG5lKlsL7xNB3XdKc4Z
         bBkg==
X-Forwarded-Encrypted: i=1; AHgh+RpvkM7mSEVpum9FQdrA1Ospuwvcyekb3YY1VaRY8M665Oyp5wSPDzyBzSkZU1Ef+jTDF6aEiAca++Sn@vger.kernel.org
X-Gm-Message-State: AOJu0YwuPLMFD5HBZr+tyHWC8eVjNVvlGaCdy3M2/KLxXISbAkokngQv
	SVKBK4HTCHReKkZzpaZyaWhLBZL1XWtZkgWxP822rQbY9cRnirwqn2xrZ8e9FF0f60wvUHIxMAO
	h/9gA0lJ8PKHSSoQv78omMI3j+K+NSetHPLsbR5zb0CbreNFgpFs+fTtTud8hvulW
X-Gm-Gg: AfdE7cmBuWRiX866w3AHEapH3cpILtzdRweiWMCPpWEleZphE7Ie01XaV4Jrkh2WCkQ
	jkBlbVNhFeVEY4Hez0g7GNoi2MbJwcXCFuuxUpy8t6iPfS9vVLllyIgHI6PtSasVnnEgau8PnxA
	uKYg7ioe8cpO67lrJvugoWjGzytSXDZYyD7h1/wULVEKb0F30b8PefO0gvlty7ZSngJ0l0q5Ypi
	QPMm3iQ56b07la/YMAOz6iCM/RgZOYl8bwmBcaejrNCyT7h1vyY2O01N8DIIowwdo0nbxqKU2CA
	OFlI8F7opQxbC/ZODK3KsVfMITWEtTUlorbtaVFrHWJpqWcoIrULvbcSaM1Vvp72t+IwHZ5XXdY
	H5RVBNmJigi8omHKm3D2bZtFTkfP1YXjtmbEdhzExtkV8scwb53c1o6PAX5dB
X-Received: by 2002:a05:6a20:d81b:b0:3c0:9c19:6591 with SMTP id adf61e73a8af0-3c3ada1f4c9mr15227514637.75.1784608838963;
        Mon, 20 Jul 2026 21:40:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:d81b:b0:3c0:9c19:6591 with SMTP id adf61e73a8af0-3c3ada1f4c9mr15227496637.75.1784608838525;
        Mon, 20 Jul 2026 21:40:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29ffb13sm36532895c88.6.2026.07.20.21.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:40:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Tue, 21 Jul 2026 12:40:03 +0800
Message-ID: <20260721044005.2882803-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NSBTYWx0ZWRfX/jDpAy6MvvKi
 XpydvRkh5O4Mi6UbXRG4xPCNcRV8t9NGTG7TEmr9iQQecN5bT+eEf5x9xmCMMpJfcP7EbKFkyLD
 FHFJfbfEMXrfFEKk0jSj7eImHTriQR0=
X-Proofpoint-GUID: Vlnhiqf7BnvO0fwzYNbUE68b6vOwWBu5
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5ef847 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Vlnhiqf7BnvO0fwzYNbUE68b6vOwWBu5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NSBTYWx0ZWRfX8uBl4xN85IOZ
 d/Qc/ueT3qrXrYgktzqR9jG7APeIRsw4PKnhYWOKEdYJSFqzs07A+5YQJ3BrJ/Ta8sgNblPJ5rl
 c7oZJ+6Xk3yD6wBT/Z8PF5/mmvewYVnumujFSoYYhnNhexMkld60666BMiz8MbP9rXPjOWQQLe0
 M8bl/DdUyJKpoSLhusotujdK4kiO3ahm+MD43lR0NH02xFrKGtuwjSkl+/ScLiSBi/qHB155L5C
 PmpjM+V5nRWbYwrSxnn/1vU4NdFFJLqQ7B6KwxrroTc3+yRySL2QdkJJr5zO3UTpJwQSyINSy1q
 APQOhSUqq5cXLx04hLSloy7jIUEEgeEQ5RSPLWMs7PTVLyMi0x2D20+j+O57WX0n/CgEQEHrwDf
 SQIcpfJdowTglR7UAfbI0o/wP8F+JVnyVRETjl3sR3ve7nZXElAbnpo9ZTR9+MEDf8MYrcwIflK
 bWUqL7nKZoCyuOJWUrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210045

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index bd184f062ec0..7ca4e75ea09f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -396,6 +396,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

