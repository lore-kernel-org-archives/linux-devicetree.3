Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4E736CE19
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220642; cv=none; b=ggnQLO9L5WnHeDik8YH2BzszLYt+V8d3IonqCdithoDYM1Tg1+0WSU5lTYOZEfS/zR19dbIKuFzftoJRvXXZXZDv9VH5HP63dKuzJBgfRl/RQVHkuro84JMwU71Ub38mdnQs29A8FRm9/G3UowDYH7x6QFHOM9Bh94xsUJOWys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220642; c=relaxed/simple;
	bh=AIrGZagZkSN1KB9Br6ijcPQAShpYrbyfyIl3J+RCHps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFmHahe0vH1Jq7Q/vz9b0/V22aq4cMbw2Wh24NqQJuzUWr1nZfCLT+dLQIQWofJ5w6liBwh6md9Sl2XHsZqnJ5n1S3rAhgTZh6mYtecowsmsmeh1AeMKVJco0xayXXSmPQWG8As9dRgVAJpDBn7+mZxtc0SbnIDXf6ywyyVaM3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqwEmQlz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZD1navKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqwEmQlz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZD1navKZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678Jvp0v746634
	for <devicetree@vger.kernel.org>; Sat, 8 Aug 2026 20:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qktM3bg+Fo2jfrum7AtMzh0cJBEyxVwuka/AHP45cFY=; b=WqwEmQlzgosdyzvA
	Q4hn5jBBp+0bxIn9pARgWUskvzgddlN7UkjQ6RhU5836HaLsbcmJpUbDHAoSOJ6z
	irsOB28GPyVZwEh3kaZEM+K1UUswgCQ9YUZM7l2fve6H0dxUfWJ52Gpf48WA8YMs
	WQ6SJXFl4tNc3oNTSC3qmxN9J0eS4NfMIMpKbx9vWyJd6Q01PCmdi2iaTYS8PFg+
	ZLP8b1niHFCiI4PQiMKPm2CHnzr5EG+PH55zQ/9lKtK8/XWX0Y6LFD6xyWlYrOhV
	Hkl9I0z2IZ0gcLtyo4SoViDTbzDpo3ANeeUnBECjy71Mnl0w9GMdvXL9tHFTKAyu
	Ean+GQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp208d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 20:23:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso472166a12.0
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786220639; x=1786825439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qktM3bg+Fo2jfrum7AtMzh0cJBEyxVwuka/AHP45cFY=;
        b=ZD1navKZDEaS5uTNqFGL5wVu/f+bdcqqrsJpP9f+32T2Dtapi9JyP2hhDVeWrsveRF
         Ya95EWzfU2XRSYxMqUHzaGIxZ7DlVlpDFWKNQspADXxGX8sYrbSgOVAqp/3ujglZYoR8
         aE9qDeG1BCa4Zarmqq8X/+BcWkMcJVCMyYMqi5oBi9AM632bct2j2l7qZ6+nY9ySwK5a
         p4NJKHvKRCjNWOxDWzMjPm56uj93RK7SllAMyskS5nwm76YqEj+RujK5ELCLyHmlVXUa
         DWD6LcKYJm/Tyj1Jx2OjwCO1yROUx7XaF8bmWHUNAVxMaO1DFQczjYqkiTv45e3Q+VNM
         wJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786220639; x=1786825439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qktM3bg+Fo2jfrum7AtMzh0cJBEyxVwuka/AHP45cFY=;
        b=pcbE8ZBu0e9GmEsyUutt0vim0vsFgbZ+XCR/My7uMvFV6KmZTUHMG0RCFGd/9VLLE6
         xVESW0iK//3AG27Nm7fyOE9/o3DEy+QoCjgfGVrXQuCvAmQE93nuI0unKgGzZhtBQ3VW
         gws1A5Xuwd5FCR/FwiKLQsfES5I892twIfBXQWKQnNOU1E6YK1oxolwsbsdIPxtdHL2Y
         dWsKxDkfukCJw2dOKDmEt5QswGoW4nuVNzBZFHxlVZFvBTiIJ4CiuY0qD9/AJ0FVUXu0
         I2tk3EZZAjEOrVuaDnevTU6Z9BBtZbUu2CP0oMzigcGNonFWJmhgEBC+at6ArDw6Ss7y
         uP/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrw+8UFVl+dv9wq/QE8cy3k2DoVLt7FWI8h1XZDwMMiip9UkreyVoyClSMwHSD58sr7UzZGd/4Xw0b4@vger.kernel.org
X-Gm-Message-State: AOJu0YzHvZcPWU8qrpc5QleyTYNncqa6oC0he8jwie6ZKCB9hU/LGE6p
	OdZbMknK37e30gijJFTLb6Pmm9+LvHxz8c3M0odsSUCUW8YP5sTskdS0xxr9VJ5W5QjmmCQeYX6
	GfdG998DIVBguGQsajRszLsTJ7kAqKgUTOCqo3rfyJ4lFCSqOcv1OSDancm1sCWxg
X-Gm-Gg: AR+sD11HEUrEMa/eBjjF0Jz/Oks9iFTptEsR42rq9/EjXuu9Kpb8X2qudbRzWEHmU2D
	NdLjygbJD4toT+7t8F460MEXXuS9KvpIQj18Hp26Z2SwDhK1vSxmCVJHIcL9QmP9R2hZMXlysC4
	wf9KrX594cHskB4Q00xxf5HUAuU7+Noqof2uvrDo/9sF9XCH2tNcgki09C/iXNjU+liy52UEN1/
	1jXK7xA8KeJI/GzTQuk+Hm43wKFz+fnY556P1t1i2Wb1hotxNfh/4bKVoqKB/jAAD7VRbLhJZnv
	uhjCUMgZBdc0biwZcqMx8FRtBqOPEETKK0/JxpNOH1EbvHcidp2WvHhStGzTjigzBDzGIDV9mkR
	dlLyrZPhUvPmaNpnfHTGVJVt9
X-Received: by 2002:a17:90a:d444:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-3909d79f918mr19339674a91.2.1786220638991;
        Sat, 08 Aug 2026 13:23:58 -0700 (PDT)
X-Received: by 2002:a17:90a:d444:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-3909d79f918mr19339634a91.2.1786220638575;
        Sat, 08 Aug 2026 13:23:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm26357417eec.5.2026.08.08.13.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 13:23:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 01:53:12 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: sm8750-mtp: Enable Adreno 830 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-pakala-gpu-v1-5-207ad1fac1c7@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786220595; l=733;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OK0v79oZSQHdaHg/pOomVxs9pgnobkHsr+WBjfo/kZM=;
 b=RjaCXcVM3ar/WnN6FGWeHvktn/E16JNiRWlh9YiXqyKUmSFUXvz/gDUwVD79g8/ThXAqCMbc1
 jR2Bc9hpXDrBu7wn8CbD8DULmGK9qloyCUbIktuOL4wu48LVJQDCD+7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: uRpPRkxCrBHbga_Y-Wbr_SAPM2we998m
X-Proofpoint-ORIG-GUID: uRpPRkxCrBHbga_Y-Wbr_SAPM2we998m
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a77905f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX4ZIXAgeS0JP8
 MFL5g/TCfvRaIA7kywXFSSz8oV7CoH6IoDg7sD9JC9cBnq/r0mEr88Meiml7h4F8zI1FGyx2y4M
 mFRHs3uI2q1d9bGA6NpFQgEmlo6XIltNn+THpv47bbE0OLyL+p8m74Px2wh2hvNK82OXOqNX2et
 /mfIfTsvIFSljHfD8MARFAGK6U0JrcUCrBI9LOpvlwGfR993DRLzgiRwZ29LZb/ctnwZJLWuKrt
 DHFPtkw+9DVEhbkLrq0mkukZn7trCoexKvjLvP6PVi6fa/UEm0xW2Na4fpu2c5s2MPQoGEM9Jh1
 tR0uPcC2VJ2KIO22AHOJImnzSQU3dHCKjEuf8QrHJtcQe8fwX9d5BDdnY7CFQbGZ4omhaNmg4EC
 cVq6uqW0UeW2dozf8ioe2gGN4FWzNIhK6cTeaT1WOnzILzrglPAkCwLZNayYIgxaZe9gbyYi/6t
 mgyijNF+kiGsACabdFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX06PkeAd2E7kZ
 BrlHrhTL4934MozDbRFiNbXAYzBUkPprfxyX3sKFI0on3sMELXlIXE0s2y7AAabXWUyZJfuXW4W
 sa3Ps2xBodcFFiJpq9c/qR/AWXRhY8I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608080176

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Enable GPU for sm8750-mtp platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9b5fbc004df4..b665d7a3af42 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -935,6 +935,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8750/gen80000_zap.mbn";
+};
+
 &i2c3 {
 	status = "okay";
 

-- 
2.54.0

