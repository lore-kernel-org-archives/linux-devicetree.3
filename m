Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26E13A4267
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320993; cv=none; b=rKLaHTGu+LirVQ7fL7xmfN2h49rohD+sg3RUAE3P7osdnY1yQX4YgyV1jmKNBUCO4IlUSTtfO7QyzYBK7IusLAgfCpqWn+thLi7KAkppHqFhfpKtmdYsJya5rW668StbNv4onxEPODrf57SBCuqumWV8bK9LOp5gD13juIUZV+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320993; c=relaxed/simple;
	bh=5F/4LhMRQgSwHx4+A7bz1FbfbCxCgdAfchrXjYiRToU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwE4iYmQGxeaaMK0A9ro41HQv4u59dMq1y99ISRVaESnjj9M+xVpf/ZqDBkPxpRhrOg0+ZOsgq2V3WmLNdRsWwVNeRhfalZ+K8taYR0OVe9kt0Hn6IE1z3Xm9ir+WL8RqIQn6WA/7DlZJxjov00IUqjYp97qwg7ibTZJdFNBBL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjPVSzfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKOL6OAy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjPVSzfU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKOL6OAy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtijH2824128
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6+db1P5RhSgKDmUAmXoiZyavEFVSigUv3Np7w9qQeMU=; b=pjPVSzfULLlVIqYC
	KHI/PHlLgb+u7+xOpdqVecyBd6IinheCrfAlxjs8juOuAZhmn8PhDTF8i9ugZw+X
	BRPfy6/PSJhwhGZ+zfTBRWW8WlMQum9U0u5lYfcZ49UkRf+JvTSKs8Cna6kG6ZZC
	EMIW5Yd7nYCnutt2+odxbkgiJaWEsPGjv0IpbjGCIh0gtSFLPfpYRw8ieNAoGKhu
	+cCnT8Bv6cf0JiZ9k3GM6nFxD+WkMyJm+6ZTbZk/8Hb4q3Yovv/a8zeFbwM1M8go
	Os4bxaLk3C2xqaLBfHgjGtfTIlFSs/m4aarMT6+FyEpnNMrjJ3GFqmAHIfp03Voy
	s5xNRw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff81390t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:43:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38869800848so12364654a91.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320989; x=1784925789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+db1P5RhSgKDmUAmXoiZyavEFVSigUv3Np7w9qQeMU=;
        b=cKOL6OAytFf+BYzPwTeQIiEYo4WyZUwAMmSeLFP8bjhy4Law+ZUPFU8BOAWocXigpX
         xI6+eMJmKK6AziicSfehxV3qAlTidCYa+EFbQ4VTSNPEyCPAPR3Av9BCUopwvPS7JKc1
         ss6JCuDRSKZhz5XU+6pRQAgXSg5XuZKFTtGw81V7ZVpigOk/0YfTYoY5Whikpcl2idxC
         jBtrOKcuN9f/xQ2y0kGror4uUZeLv08AR/0ikJdMDsBknnTzSXuG6+ykKq3REKbPfiFp
         lcs4KGNI6ECIfgS8/w+6URwTEP71TPiP17FWh9A2+SGy2wUh7efWhrh2Rc1k1cGUp+ZE
         k3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320989; x=1784925789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+db1P5RhSgKDmUAmXoiZyavEFVSigUv3Np7w9qQeMU=;
        b=bavSGk0IYC/L+BbXb/l0DO6eH1rw2BJVERS92kt3P4AzC//5//Gxww+ouaJRdjV73N
         fqnidPh+LewcxeA30rkiZyv5q/lWvdSXUuVn7yy5c+ZyUTielByilVe4wxTqL9+YodFp
         pacRcv85+Q9SU+Fq9fBI+bTaXZQuUcRksvMotshAmujwRJ94/0uNBGpuew5A6BEgpG9d
         obtCJR6JKGaADvt0yfDe4kPSyyt3X1zDVLAXUjhReVTuW9E+q4mcvnMZ/BmKTdzUm4Ck
         0sXqu6LwbEKsb7y6YoQmt5fbGnElye03sFdnTuv0+kldx3282CCCK7dnt/xUx2bJsSjf
         IIMA==
X-Forwarded-Encrypted: i=1; AHgh+Roav9100bTCbwFaBKcPtDQkmrY6FJsv8rkBnh/QRF1rUS2OH52cNO29GkhNN4hHE71Y4w2uorgTzLtx@vger.kernel.org
X-Gm-Message-State: AOJu0YztlMTqyqfD/NP8TS/5gDzwFpB1n76w+MQRSEFRHreWXLbvYY4C
	i8Ct8SweXdSh64urr7RqVm+A+q7x81LKDx0bQNZwCHpRMMG6rlnX4ViUtmJKYsGJFsR/4v8g0E5
	FioB1TbAoEI+R7l+BhkmAHrEG0ZFjqhbrfLaRfZlt+0C3jNPnAfdahlNqYgpVgfm9
X-Gm-Gg: AfdE7cmUuukdI+4UOJQAqA/o6bu5JPlQtIXpWi9hX2dsOV8rYxSGZdtv5LREnh0MCbv
	JJV5qwxhXPommoUCU8xDwe63ij5ZSVjqXdMd2p4dM4e4mSyBD9F43AOSkTLY3fsGbik5WhKhSUn
	k/i2r3E/CqqVWm4C0pQcKZ1ipxjDZUDvHHDao5a+OM5QHVx9pFL3DiisVO/7ao4Hesd0vPZJ6dr
	7iugn+obPpI3mk5eXq7MS1Qq1x+RkKiskmhv6X/ssOxf8As21dydtxGa96ZaWybQ0KaLjXuMwmv
	kiKZWAIQ3WRH6Ky5osQSvvhzfBJtv2PGdopnMQJ4mAK5KGfQRgouU1B8a/Vu3O4qiNDYGOF+Luv
	Xuegjz0K4QVjdHX1sOi6QLGMa
X-Received: by 2002:a17:90b:4ccb:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38e4b57c2edmr4367635a91.38.1784320989050;
        Fri, 17 Jul 2026 13:43:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccb:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38e4b57c2edmr4367589a91.38.1784320988324;
        Fri, 17 Jul 2026 13:43:08 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:43:07 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:34 +0530
Subject: [PATCH v2 9/9] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-9-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=826;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=X8RDXfBHklja5EB34gmFlxaH7HzFaYeX4Z1IBHMoit8=;
 b=9Q8iDnAw0MhJOK5ZVzp6qxDBJ1QRxddOheLScWmDbidXJrIMQnonMmlM6v+PtlCEEzK/dtESK
 DatlP1RAZO2COPGL6D6h9BFfbWY7fTmJpoXiY4tftEFy1+oli76Z++j
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a5a93de cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 4PHkNcWXMNV3CXUSFEnTmhZmUMj3hYuT
X-Proofpoint-ORIG-GUID: 4PHkNcWXMNV3CXUSFEnTmhZmUMj3hYuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX4a7ymqgmsegV
 +eKE0dyI3vjPFQoqxz3U6V3NXWanEG/iJQdSOg3I8IiuO8go9w1Px+ouiubS5CT147R9NfkG0N6
 L2e6YV6ig0QzsCdm+ROCxkEcE1rIQfkFh/abrUy3Iolb5V6+QI8C8fsyzsj0KGGFssPgOZTb1Ji
 SdtCG2FtUVSpxL630r/SgQEpdQ1DlSXhnXtC4CGaHBqhNIGu8Kup1rmpxJ3/XMPUDPHTAPUZGn1
 J2A/2OQ6/vUzAe+ZVJiBPRGRxmvaGG03teBMjOU9gEneVajxKRqCf80m/4nF375MsTqHhRPM3ui
 HvBLg1m6ypEMubYZsS7ZdWo6LPFCacGOw5/pmq6mQbO0v8UBPJ/+rt/6oqLPn02JWqUHG3EYyJG
 5rZ0JpvHB4/4+/9X2+TiCV9RBiwjSQ5Q11odRSbN+by9NRtyo0YXcrSWHCaiqBE2JsIxM9TzT1m
 7U/oLVSTpqTGky8NV2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfXyWBdeM5B2a3+
 AEtAlQ4TXD1BPWBU122b78jH1Gr238NT/SMK1Bb0cEJ6g9t3hKp04ayFxjI0HibGNv4ciqUW8qF
 udsRBqJkJoEB6ujMaJMuxqJkWBA7VoI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170213

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
shader firmware path.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..a6e24d2e3b42 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen71700_zap.mbn";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.54.0

