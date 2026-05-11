Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C8383318
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538281; cv=none; b=ijqZCaMJtXmmy9G1lMDTcTGA0OfqZda+cuBLVbS9tP5g47xIAzrHWdAiI84nNLXUF1sQl/7BJ8G8uJFrsoswxFs6ItpnuVCRL3ntBBEQrB4D9xFwDr3SFU6HtP1j5IKvz07rgnIR21H5vv2YkwdN0fTtbaXsFo48w421w179LhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538281; c=relaxed/simple;
	bh=4TwFG6GQ2rWfxHvno6AGnLKMEMKg94Z6yrhbxek//KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dupiqi/a8w3J7ib+q03J6ggabrbPv2DH1gSGCH/vZaXgPo04ArAx5xY39XC2MpgxBye+Ym9BeOQBZZ1J4wfSHOMyWaTMYQY7Cl7XfqnTez4EVmwO1GTPeh0iRSMFaX6mgkD7d2Ee/OOV4o1+pUEGKXGUqV1Gxca25DqXVCqsHZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qp3AwBmV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HO0dnCbs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qp3AwBmV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HO0dnCbs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6joT2186435
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VT84PwNDUBR/tJKsjUUmdrL7bPcbqpDnJjYc8wbzdjM=; b=Qp3AwBmVkx0EsjJ2
	vKcMSKGExBHgHr1iDbkp2A1IpUs6nUz3FfiGTOBgmHtNM1Tg1F8DP7XEM8p0a/gU
	YRhzibqnFtWGsjOJqAtnanVpzrnyxkGZvCmg8M1vkklyPRA9IQSEKD/MdzUxi9ml
	VWHRLWOaoWSn5wcNZ0ppHQKTBGxBsahdmIB86v/Da/wcCb/1KvaR5upWM7fdx0Pf
	ztgsWUm66qf/OhiCol8ldCwGILEHa5T4gMP9UsZc3j/KSb42PO5UU0GHTrA9IjTG
	7/wupGretjc/9D2mJbyzGEXn+ai/+nDFamh1+NXbt9CJZ4uc36XP7EPzQRiU388r
	Nq6cEA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28fw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so5966570b3a.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538279; x=1779143079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VT84PwNDUBR/tJKsjUUmdrL7bPcbqpDnJjYc8wbzdjM=;
        b=HO0dnCbstXUhownO1Okl1Bdy4YmZgpRP/MWj0hSyqcO+QSux+WLdDyLOba06VdDAek
         viBmHqPRTubesvWJ/bdR0kqb8uECCk/5tGZ1lQqQSHM8qd+lfEmnyOq/dQ7EXC/oCpjx
         gHafbfMXUr04aipulOE0ck5f1Gsbh3HNHM4NM16Z9DFKDDkRrpH8oYFnD8t1V2hGnLgI
         +xFx0oT5waD/sm5bdMnMFnMWNtr6f26d9NWWIXa2UnfXC87j9zUiP3b5USXHkXPL23Nq
         8BZxXndyTEBJx0cKgRvIGoH429GboxOc7I1IbUHJSjvHdW5SjQtcGT/8+HPG6bbXDprL
         1OCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538279; x=1779143079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VT84PwNDUBR/tJKsjUUmdrL7bPcbqpDnJjYc8wbzdjM=;
        b=nTOIEvTkw3xTzItPHVOFHyGWfehnQWyTbYoImPrEnyCCyfx1Rs2HIP//VVDEax6Bid
         eFmRFRnv5KHj/pN9N42jYRkwC+QlrwVRYscqNbzQJHYm4SCKFvjeEDl142U3yXPcoeYK
         WhMwxum5d9xGElXJLQ0Mko2EZ7pjBZj3HwWhMeA9h6O4mxuO9H10KvEKuzbFPJj/tkgo
         c9HaLUmx25EvoGNy2JfQi3HEGPMhU5T3LnaqtmPjCH90WhKQMRW0TO5Fgj+5eq3iTqsa
         bfF26GoDNGRiacULK+uNw7Ytxe4vXYEVaEIkGfsY3KTD6YxKpomB0/qqMFGgFpuGlmtZ
         /Dvg==
X-Forwarded-Encrypted: i=1; AFNElJ+bfjQWa5NpxZozwBKot4D6AAOhtjlsvTERhgWSYC5SiY0liQvU8q0iX8lUH+28VDsVhUvUF56tIYgA@vger.kernel.org
X-Gm-Message-State: AOJu0YyiO17tA1t5VMBIlFHgRl9HhRK1HbEu9+CrI6AlCDtDNhTCtqnZ
	uPQPWorOvkF4v/K0MjUp3KabxKU8YHPGjlO1m8zgsR/Mqz2SZ6LFJ/B6eZ4WKf8ark36mRHThw5
	NVK5/NlCov44vWdIZDM10ndm9P2D1zGEyE1LCSUPBEb/k4HkoU6rkk+hlbc7xOxfL
X-Gm-Gg: Acq92OFxYTeXeruz4kxLibLxMmx+6BRdgFUUe6Q6N0U5U+Tsaf1CmT020BuRi/EF5in
	MOoMSm+Ovc63kiQO0AEufUnuqieQXi0FcqJMEG2/d927F2/UxxC2H7ufYuvPHnatbc/gcpA69Hg
	2hYHJ67kyOGhHDhYmg7iAEL0JnTzbhUORzmSzPHUD1De/vaa03Cr98iaDmJWxqchz9EJ/VFLZWW
	MhSPgi+bnTwHGgH+qnSSn/DNp9sjjzdbKRejTJQVP54bzK6SchUcmhxdbDyXUxqDrceb4yw04rF
	XTYrRhJp6lPxOWW8ryGTclj5jdP0DSxGimVNcXaZgimHRxV9iQzfHoZi01S3zPpYijlN4O0bERo
	rAWXc8kXewDQuI0u9pRSb/gRXbQDkrANsATaVTracUoTUZQ==
X-Received: by 2002:a05:6a00:2c86:b0:83e:c8fb:54df with SMTP id d2e1a72fcca58-83eeba03dafmr336284b3a.2.1778538278587;
        Mon, 11 May 2026 15:24:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2c86:b0:83e:c8fb:54df with SMTP id d2e1a72fcca58-83eeba03dafmr336251b3a.2.1778538278121;
        Mon, 11 May 2026 15:24:38 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:22 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=723;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4TwFG6GQ2rWfxHvno6AGnLKMEMKg94Z6yrhbxek//KE=;
 b=waPfCkFYB6eDvZNGEFJsUZ4feqP4qBVshCQMu58SBRIUoShOVQKU1ivqUXVi57+d8FACeeVYb
 q0ZLr2DHU5jAOh82UtRnGExYjXfoo+hpAyQ8b0CbMm6Im6ysoGaandY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: QwiLtuawvkHhtDsPQ0SUcu1yAsyGlQ0t
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a025727 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tTGeZ2WnJxbZjfYJna4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX/Afhl3RXEbMl
 abbE+64dA9fxNXZG8t6xcRnHbQSQac/XD7TQJaWKvxcIjls8LmO4Gaw+tgu2xXBoXEyiZBPSWwE
 QcFtC/KYyFmMdvfTFqEd3E2/6r2HEZ56swcgZQK8JFFzNsOLy5NylQ7ayoYbDBTAkCqUgiUkv8i
 vTywSNult1Wu3qEXY1qT67MSE27iQ+9Zz7aLHulB/vuc/pwfRAodCS/EtSlABvK/4jPnRhleAcF
 HVHRxQ0MaKtuAActfcDSOOXBf37sUdVRCkeJkY6HbDrQVoRUkHYSw4stEoDq6dkZwskunFIjftO
 BQ80vcTSG7p4vjdWJtjlBoz/0Xd5jQ22Xgzhdgn6KqKNtoGJ8H0gAhRsOi8pHx0FEA9O0AJU34F
 k0TPr/stNyUkJe4eddk6/mJGST8SmOC4Tupwfvj0sqWPeEqJIOWjkk9Ds5Wc/s/efckP2UHMTKN
 algfSIY1yMfpA7PA9+w==
X-Proofpoint-GUID: QwiLtuawvkHhtDsPQ0SUcu1yAsyGlQ0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236

Add the secure firmware name property and enable GPU support on
Kaanapali QRD device.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..6bef8ec151f8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -693,6 +693,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &pmh0101_flash {
 	status = "okay";
 

-- 
2.51.0

