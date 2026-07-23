Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0711E4322E8
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802851; cv=none; b=DoImFk7DOxUyj2tg8fSa7c3c5dVdavXGOXrpRrl3cFFsFVLTMCuJSlQ7vUH1j6BZRiglELW1vCWZFURf4n7ZX9Fjm0+J7UbNbovLGVtualoc3je4owAf11H8TDVwuifk1JiW4CW3ND2qOvNFXu4Tvx1QcIpTof7SA4/jDCI4qDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802851; c=relaxed/simple;
	bh=1Ri/ye33zak73kJL8wNaCv4lkrKYNlp4IjpBnQblexQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjPsF9hK5qFyeKzMGTez7r7Z1mSpInNCQDy9sVQIBKfKw3q6PRHALbTHyUkj/oYUBoQoWXkqIt/yHnxjO57g/g+29CsbSFAcexTZzlD8N+PyomIFHZvWzjkUatTnJTIJ0tFTmwaXTenDqw926AAPuXyBAzFRrwYhd9d1r3ekWX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfRLsKB9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+Udtket; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfRLsKB9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+Udtket"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qdDf3648888
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EYQZ19YP/MzjTpCWPQusQkTA8YmEpj5b8ho6jvLNnmM=; b=SfRLsKB9u8job1LN
	ghzQamlpzP9LLVUjtsGT91FMTyd3yCsA0yREoKMalIDMDcWkZmBq4ov5Rhth80VX
	ITDnD0RnIV/OWcFiguvzkrt94MWLZZBY1Uo1BACzM2QfDAzvsz+C2lfxb4J+ju3P
	s43wIwihSiiYfqizFQeKiESyPAkzPZOD2Ax3UQHA/oZQ+RhYshVrrq/CNTfarwyb
	rmifN8eHmjrtJoZkpzRZil3VdNcEb5vUiQ5104ytlqbvNxXPoLezRQtPfm2h2VF0
	APdRkKpejvTg2T03wj00LLeiVNXGNRzbd4SqaykL8XT39HY9hf9AGrG3eGd2u1JZ
	+woyMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jj4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso11338635ad.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802849; x=1785407649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYQZ19YP/MzjTpCWPQusQkTA8YmEpj5b8ho6jvLNnmM=;
        b=Y+Udtket+C5KZM2OmqOYY2mpB1vTNT04Kg4dNcnA62Ompi7McLFuQyLEOa6o30NKls
         RuuhwI5jVhzgyrvMyciAVUHGVR8iuhljJhCMuMdBwAEKNDqPF3GS9L97ZQyHeg4wsBeQ
         UQLwQqLzjt/0Z2t0SQ+BIingBvKIrwXElEM3LzcJ0lsSQsG/df5BcZ0QUBa5rEWyyP5R
         Pdet24epx5aWD9ob31SgiseU3z0A3aJCBkN867lSNBxaUZri9tSsrTfdlykwRvLlpm+m
         vwtO0S0Pxuh0SHYtCYtg1rPok/PHpXOKrC7LYYW/mJMNgBDJ/WJgE32/0ZSqkHXoxgTD
         KLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802849; x=1785407649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYQZ19YP/MzjTpCWPQusQkTA8YmEpj5b8ho6jvLNnmM=;
        b=FyG2cTdj/8QFxKIQaI7hV7B3jTRd9HOOTyO4BG9c2GomXUBmPdiYyV08ReyYRzPZbE
         P6PIYaalGdmji25asOaHP8T8X3Ac4IyTA0BrqNv8OkDDvKK2UrfzCh+ttNltf1V+3jrn
         GTLqoG1oLI5P8ClnUvn94gY4ZrveUZB4SzQFoPonLGAbjoi2tlVzIL4Lx2yj55pQUMkj
         DPs/ueTFV6r62BuVr2upXf7iVD2DKgGwMdmcp4g6pNAGH0LfY3uZZO464nJmxzIj/1Qw
         yBz5P4fXqG7PHDNaYj3i9/ORfmwOdICJFJIR2zZ0EuQwTGNbs/IF54A7UrBbNe3TWPxC
         oSzw==
X-Forwarded-Encrypted: i=1; AHgh+RoL2QOplJ3EStvKPm8q19kDdSADUMLp5sh+RR1EhzM7uFlmYujq1R6js1q3ddeU2fV989/iL2KERMaN@vger.kernel.org
X-Gm-Message-State: AOJu0Yze4yB4PNG8Kp0pJBf2wO8hJXyaZHG7HpXYzZzB6NQvZ835TXCY
	U4cj4eBkh81fZbn7Nakk3OEavvZlK+IwaRfwtJUrFdkry9lU1Y10f4bqVEbvy6JFn/j88CMHB2N
	vVaSh097bnbIzOyuabMyGeugUhpKTmZdLtCa6mPZofebpLyG9frFpWuXghTA8LChS
X-Gm-Gg: AR+sD11TgcjBVgFqeFbDWXBa/ZxPHDRQSd9MgSiP9FaoFh41xeTdYGyYPHeRHMl1gfi
	SPw9u+k98JqKRWL2jau6yr1WlWCvyX5TMhJ66gBHD/NY615PdaVjzVXiByGNDbDR/XB/2bZIoOM
	3t9hBjEhcIsc05keWDNgyXxN/0n2PqSXU3RmpkxwH2QhVzhql5KKfQ22BQWLa+dVf/7PYsT1sYn
	Q92oPTPdYDeGT4LOyV4tbkjPUuy03UJP57aM05QMVICqXyHO81wv9rCNTIh9MFNXP6JiGcv+Rpe
	kMlXpcTGTZ56l8XpvwcEIz7AYD/bbEkpDiLdu8Q3JfgsJfNWLUPIoBddbVNIDR/HRwQOVsyXb3p
	PTKpYZTB0+BMAzMtNPR/vBo2jZYoqOVc/lTVrmZ2+MOZYUtdxPXfMcLlYSVRgJU/h+tyoeg==
X-Received: by 2002:a17:903:2444:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2cfa71d945bmr29501465ad.16.1784802848720;
        Thu, 23 Jul 2026 03:34:08 -0700 (PDT)
X-Received: by 2002:a17:903:2444:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2cfa71d945bmr29501115ad.16.1784802848179;
        Thu, 23 Jul 2026 03:34:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6203sm32416155ad.44.2026.07.23.03.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:34:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:03:52 +0530
Subject: [PATCH v5 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-usb-shikra-dt-v4-v5-2-5b69d9eb0888@oss.qualcomm.com>
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802836; l=1317;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=1Ri/ye33zak73kJL8wNaCv4lkrKYNlp4IjpBnQblexQ=;
 b=fG+TH6h2mvB4HukJlFicx+4eEe7aGhF6qzc5NIHVqnYgb92xfAKya3m1KxXpMU1RXmzimppA3
 g5oE0h72nYoB4if2FJf44WbH2IdckAV4b8TPIl43B/GvqqDVxqoXL/z
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: e6MhpE4eEzSMysbCxD0-q124ho69OfYP
X-Proofpoint-ORIG-GUID: e6MhpE4eEzSMysbCxD0-q124ho69OfYP
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61ee21 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Nf4tAF-kVs3HMKYhumAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfXxj1ZNHoFz209
 AUkaRMHshJCunkG1y/3UUuaUsH+3lY7jCrfED3JBsodpHq68gXLFGxu+zc1chRFa8PXOd7+OL5u
 +RBh8Id5kbuASZP78HC22h3tb56N4ik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX4RZ0/0X1hS38
 pXEJ22ks5Hy8tY7xluD7oMxwlWjn2Gr+LLMzE5NRcjyr9Skuth9E7jT0s8nLsS0mjdKe1cdL1vt
 8MCiAaW3CMsfgvTFFsrQ5A2HTbP03b1afHUpFd53DYJ+9l3prYhSWbagUO8Nr0Oj4QZugkJ3tJ5
 bfdQdIHmLdet8OFf8coyPNYksb6avYbGRafWqyifshbPZozK6v3D+h/CXiqwSNZBEJGHZZOHy3t
 h14YOTA9yE2tZ77jf+0KWr92omM7QyazC5jMDDC6Lko61FDF2/bfmOK6l8Pa0YQ72vpzjs9BGil
 F/Cew8ctiRIL5f/bGxHZOKj/wYPXKDkS2ZXK2SPtivWRFrg2DwakKhgpMsN7OpRMdj3lQhaAF0p
 kqBBTlcHkvxH09uRuA/+ilh5aZ94NQ2ISx3jDNu2+BDSfkmSSg29OmpUbaYhxXiV1aAggQk0GOm
 ioGiSACgG/O3P3wDkMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230103

On Shikra CQS platform, usb-role-switch is handled by PM4125 on primary
Type-C port and Cypress PD controller CYPD6129 on second Type-C port.

Since those changes are not yet present, enabling both USB controllers
in device mode.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..006e24a62f5c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -38,3 +38,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};

-- 
2.34.1

