Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB993F39C7
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421193; cv=none; b=AHIXeCjKiXtweY7q1B25E5Ay3sE5T9ExslOnKNq2Glyj8Bf2XreXD3/MDnwXnJ+VCnWLxvMl2R6NTL9oK1TMgLlLPL1X5/+6eu2we1SWCy1RIyyCCaB1gxa8kURMT3EIb5Z++Do+0UpgXiXP1PJpp2YQldzI2WJB3UtTcMzVlQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421193; c=relaxed/simple;
	bh=dJGZm6xgrWNtliSU9OgWPi2p5VsIjPkNDtyZPFEpkRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B8FhzG2OA4660tsNWw5KhAldxKvCeaXshal8GjdHypIuzFIawb5iySIsMByRymsZ3ERsIPF0dflENWuk6C6hWCOJ/7pDYyTO1TjMtMPqVX1k/iA1fnywhnduqtCN5A69P3qHUXlPpdXUNeEUSp0oVvdVfJ3NA2vOr12DoGDN15s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHfO6r/J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K73B1P9W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHfO6r/J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K73B1P9W"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DjHh3050549
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TCbdthLbsJdhdDNxeC6UmL
	z4Tj//MHtLYfViflFsHgM=; b=EHfO6r/J6gr3azxlAc+sUdUsold6wc4ilO26Ep
	bzeYC2qFPeAALOFzbe4FeQOi53aenaZhlZMVn5e2RUdgAj8o8FeycuYbPagb/YWE
	rFb5qkSm+ubdfTriUNm3l+/Qx9VvLaxhvkjbM4LNuxh45qrKs0T6r/YOk2RUlU3v
	wUr1CNwHmP4F71/7UDblbS/nnGk4VZRcSVZDd9HkAhlNuwob6e6rm+z8Ma4LCd3d
	ynJtCuqdi9Qx1wHMNBFaCBLv9LEel+0UVc0FdIAZNJIzcRUO8sohkkL4aPdqorcg
	nkxiJIk1B6MTJuQVyJAks2cLkG/CvNxGLN4LSXfJqDut9nyQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u8syf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:46:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccafc5e82cso22268315ad.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783421188; x=1784025988; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TCbdthLbsJdhdDNxeC6UmLz4Tj//MHtLYfViflFsHgM=;
        b=K73B1P9W+Zkt6jClEiW8VhiMh1ayN9D78Al3NPFEj9dZQjxA7L/CjagY1nCx1V7hdI
         2eLOHL4ueZfiZVvGv7LeIKV+5XPze6NwyZJ2Vr5qb4mnbBFanV2Tz3a5v6WArjKX14cY
         x58hvX4bktGSjkpIe/NWR3puYzFAK3/j/TAhsfSPs8A0CIgLlvvPi8EaOkH9CBJnzfT1
         nE1KXvfsGkUdB+6FB8imzB3HAz6PcKE6ldsbgekUH8Lb7pDFW/KFm917AaZXKsJlduL7
         +Jatmyp6STDTj+42lCdh9j1FIEMsCcpFsQzBNoqbdSu8qGYcEF+J+uL4rtyug2xk6aJZ
         7yxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783421188; x=1784025988;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TCbdthLbsJdhdDNxeC6UmLz4Tj//MHtLYfViflFsHgM=;
        b=QGXerZafmL+yV49qHDp5f2NP0MG9CIwwJJLz2cn3veVBVqAyaHFq+cv2ocID3tMbqo
         2+WR0ErIHgG8ICIczw5W+P7ytEGH2mEwvmq3htiBrmJjDEV2fal1KJzdCU1wB5WoEOfv
         F2iEGNp4GldS8d+Qpv6Khy01/ceLD/9Ek0CheqFhZtf/BQfSboMlYiAQGV64NGthyWWA
         5my8eEm9a4wHCM7mTj9KP3v5S5ceQ9o0hneIRhsq0fpZvWJmMDb7pLWvICj8gYjAGVrh
         DiV6jes1T4kt6Q9cKSmG5PjvKY/I1xnZ5iTVXjT9C5650srZ+eQje0zg6jDoAwhmzyBk
         j8Zg==
X-Forwarded-Encrypted: i=1; AHgh+Ro961tj8l1Xe/5WfPATmPCz2ZZ2r5j/Ax5xkaaQRacmbIzirzGMkNidzVsDi20XfQiyzMsz8O77ijah@vger.kernel.org
X-Gm-Message-State: AOJu0YxUHZuRdSoxDoG36J14taKASefynJo9pKz0z/UzQeslh39XIm/9
	jAJMmiVRcfayID9Z3G04MMn42sy0iHuFy6UWaIOu1cUfmQBnYm/0zuHmNFJDdmtq6UJSMkBMKWK
	Ge7tTlPjA7VWNBfQO2OqGis3vm8JtS3s/iPabQr7MHh5E6YkkVGuueKL1UpAVLBkh
X-Gm-Gg: AfdE7clxan8SRh8wBNVrchctO6L9YupbjkELdjo6TdU5+E0vOAys6OkJwBElkN23Ugf
	CmFr934+uKeT+H/FW9fNFqS1TizgOv2VXELy4qzL9OCLCqU1a0CDjFaGOW39YhThYYRHtB614NN
	HBH5fOJFLCV5GYucKkTvnZjrUBbPSPURnGuclu/SlAlLvgxJir1lQ3ysQRemFjxUo2gZUoUB+Hk
	rnL0HKTwZw6ZSIWA+7LXlxTLgveUGjKT1KOk0O4RjBSUnqgGfddNIOoV0aPf9M8pxbj46IJ29go
	BeNgrcQrR3eOTZHUN0acQM3nv3k5fi41loaTogrNVjaGkucrMsepccT0Uv9wfmPt+F6PUYnRgyK
	rt039GOhpRwBx+E/H2Hx1EIm95f/FZ3QNNk0F1kti
X-Received: by 2002:a17:902:e845:b0:2ca:ddbd:a19b with SMTP id d9443c01a7336-2ccbed26577mr45888525ad.28.1783421188099;
        Tue, 07 Jul 2026 03:46:28 -0700 (PDT)
X-Received: by 2002:a17:902:e845:b0:2ca:ddbd:a19b with SMTP id d9443c01a7336-2ccbed26577mr45888295ad.28.1783421187635;
        Tue, 07 Jul 2026 03:46:27 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c100adsm9388115ad.32.2026.07.07.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:46:27 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 16:16:16 +0530
Subject: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal
 zone
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-purwa_high_tj-v2-1-b66f10ebf1cb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPfYTGoC/3WMQQ6CMBQFr0L+2hJagRZX3sMQUmih3wjFFlBDe
 ncrezcvmZfM7OC1Q+3hkuzg9IYe7RSBnRLojJwGTVBFBpaxMstpSebVvWRjcDDNcidFL3jLtSp
 4V0F0Zqd7fB+9Wx3ZoF+s+xz5jf7ef6WNEkra4iz6SqicKXm13qfPVT46O45pHKhDCF/vOUNts
 QAAAA==
X-Change-ID: 20260416-purwa_high_tj-5f87b7ed57c9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783421184; l=1556;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=dJGZm6xgrWNtliSU9OgWPi2p5VsIjPkNDtyZPFEpkRI=;
 b=dOjlVisINVRWXIbg5c3/Hs5y/8WUmIKpoJr8SXLeLtjeWGMob0pks6WVuLQGy7jfeZ/T2xxns
 ZiCnjtA+t/yAzcUe4tAW8UkaoLHSirPFVl+h1EzrvQhN3NxGdvUScYs
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwNCBTYWx0ZWRfXxnpvfjjoDDv8
 5/UUPg1k8r3/N6q2DIFXdOLPhwHNHZdwewr1TQkWHBOd6Thr04tW4DA7si4dm7+h17P+pTDpZu9
 2ym+Ynv0D7oDjcI2zvbPgjqDEDLQLR4=
X-Proofpoint-GUID: 1aRQYnnfzz7DIkLwvXgLiiQun6q5DlwB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwNCBTYWx0ZWRfXwd2xHGvUtBAT
 7K2p5BNZZchzNXS5h3YTkzrw07ahUehmxYcaCP1ZCPQ3AaKyFeg0JR2N4eZGXBDuMd/27swpttZ
 TxCha1YSnp8SeliPJ4+jzELhpKPiRNaw5BbaTqKuZFkhwuWaQCdUM/4OnA6Ul3rJBKnU4Kko3lR
 rAjvUDBLp0BXtqIIYFppPueWEeZnTVItQJKP0433Jxah6gEl8MFacMSBxSlffBYEQjFwns9Pd6o
 q4qLlClUxnjG3ymkEZBQqLWukVp20Fn9ugrGdLlvVq6hMGcjLcNZctHwDkguaIapvU70Xf2d0Kn
 yhm3U5fIUnWolS6n6UdawdEUOM3MIMAI5dVVcmrDMzRMYEVM7rPDbDuN2siPmoOZ1bp8j4x0Ovd
 6SkEiHtdNiwOay0ysZKBKF0rdIR6o+Av/fbLa1ga0dOlIN3fcpvesUjKnjT6ttqL8xWBwnIU0QX
 EUNI145A1wiQkbpKYdA==
X-Proofpoint-ORIG-GUID: 1aRQYnnfzz7DIkLwvXgLiiQun6q5DlwB
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cd905 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rnUGh-oqUXyQQgXjzFoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070104

Purwa IOT boards support a different thermal junction temperature
specification compared to the base Purwa platform due to package
level differences.

Update the passive trip thresholds to 105°C to align with the higher
temperature specification.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
Changes in v2:
- Rebased patch to latest linux-next tip.
- Link to v1: https://lore.kernel.org/r/20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..261d1e85651d 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1325,6 +1325,38 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&thermal_gpuss_0 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_1 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_2 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
+&thermal_gpuss_3 {
+	trips {
+		trip-point0 {
+			temperature = <105000>;
+		};
+	};
+};
+
 &tlmm {
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";

---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260416-purwa_high_tj-5f87b7ed57c9

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

