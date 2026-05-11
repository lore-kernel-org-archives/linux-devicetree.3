Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE97383307
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538219; cv=none; b=Zod/nHIF//LQofgwKLDCbv6cMTEmjFucECmi9Z6wzOpAQAK8J/d5VaTa29hlTuJf6f9mf1lZAnsB3iOrQg/Wz/yjn4cbIo0KCrfTqRaHhH0dD5AyuaqDPQrgw/PI5zpWinVuDl3d9mEzM0r45JQLyJ8/87GTHAd7DUgXPLZspDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538219; c=relaxed/simple;
	bh=oZ+yt/RXidFRbw7KkVC6QwWQB7cStOb9OIQ+8ARPiNA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lRjVZMsE1CBfajijNFsvoRldhtE6bPmjXKVCfk63GD21qjHwmdeC5O9tWBW2V0NFOCUIVfVx7nKxxY09boO3PQV3zud0tS7nWeb2yDHPZz6oV/eu9IKng46Ykd9nb0+c491n6uqd/1aFUq2c4mpF0OOjjjefrJhYfg9nUbrhBkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evefXYKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQitJO/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evefXYKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQitJO/i"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK81qn2172875
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vmbVJwi4WaTGTVT0i5299u
	LCIqKpaUV1SdNvk7Z+siM=; b=evefXYKDR58EE9T3OunshXF5Ag+pvmQjvcM4kQ
	/C2aQdBk4x4t4yp0Y9EvNxSWgefhejdByw0vrsLyZHHW31twNC1yTVo2FNmJI+3T
	1n0zWuAhS0srW0llm+bufiJpv3YLW+NZJtyUl5lc+Y4GOm/4zPTTfe25RtmJCLyg
	Oie6jsmKMjWuCLoiZ2GhbDJE7sU83vxxDb9YM+q/2aBCkpFIDAyZEc1Ei2m5SamM
	S6yHKLWU0r+KVpWWOFYwZoAvCbe1jbpJ+60mdXuIXcIS/GpzVcGBYuFc8hrUnZ/c
	eWFnkEyDH5hbBE1fnwcI8LWMTqEKXbUZq/Ty24gV5U/JUUSg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvj8ggf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so2469536b3a.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538214; x=1779143014; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmbVJwi4WaTGTVT0i5299uLCIqKpaUV1SdNvk7Z+siM=;
        b=dQitJO/ig4yO5PpxEw2upt5Vi3sRdafeYd+PQJGM3ItipXBcwqMgFDyowcSjQch6sS
         5qxNKvS8xP7q7anFFMaRr7NR7m4XPCPtGpPSH6xDqzuLqDq9KlahyDDkJ1D99cKuGUZw
         duI+5vjEIYe8N1LSFw5aiht7GoX2w/Upecd3wH368OVcvqauseRFqgeAVf+UL7DU8ZoW
         mO5ITE9HWH+BaXIPla+ew+XZHKpDwT5GywdkQ0d9zV/yaTXArFjiv4H6gf+svHsjfzZm
         VPUcT91RGOGi3PnconkNHdEHk51A3jKyuUMT86wzjFSlzMrj+Rzqnx+ix319P+FGoKe1
         BvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538214; x=1779143014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmbVJwi4WaTGTVT0i5299uLCIqKpaUV1SdNvk7Z+siM=;
        b=EWJiNMmSHI3pkqLf0eM82H/K5XojJCahDGQbuVC+jsoYrRnoOwflDYjEHpP5CAmnGD
         gzN4T6LZyggIQEn1CtnGqnvTRMkyXxD+pjK63A4QnJRczOOvTAsXBzbmVPzn+WPXyaDV
         qzzxnofRBTZygfyXiEpQvgVRRfTvwqdxnUBKiDy1hqFelGssewxSQZClFAjxwBgjMFAE
         9o6ETdMKxb5LahUQnWbKkGogbclrzQv/7Nk6+lvpUHvZB2HrGUvGcgPYYjF/K4yjuRtm
         x50CNDKglB8jVNtYJQd+yvkcW2LIoqJ7REoxePtP2Y7Oi2kIjcRvUOjlDqapYj/QSGRB
         IVJw==
X-Forwarded-Encrypted: i=1; AFNElJ9u7/B+5Y+cI4RoV06koi5HFq1qaGJ1A/xzG09RGGbdBsUOeN+CcPuEUf5XtN8j0VcXJCTdjv543HBX@vger.kernel.org
X-Gm-Message-State: AOJu0YwLGtZ56FTtuv7e1TPDEkWspQFLj6Ik0fRZb2YbJ6C1Kvs0HlQZ
	s047TfFb1HY30RrD4QLcKfzUA/EFZ6t1e+PTuQM5y/fYhR0ZbobgGCLd7bLDXavY4NsV4eCGsMU
	0qEYMgHlBP40nfJ41mRuFotM1mhY5oew5icLzg6uUvd03d+vxcitT92kyMNBz+eBX
X-Gm-Gg: Acq92OHRdSyrpPbr3mTE08BvajNJhn9h3NpCBAoqd3rBhaSYxCsW9G8JoDSF/GfzpOy
	eD3zM98CF5wrf+u20qXPmZ1ji4JFo/hdbejHgHewW8W8Mq4uP1RpX1QPsnDNCqJF8cz7GygW5V7
	kM/YPkB6d6L+0iQp1TFJGIU3i0tswpGsjUPNY6fw5noLCckx3Xwvyn4JnQYPb3EmMPQti3w29yB
	2WxkZUrkHPl2H+8sMn2Vc+5jR82BIGTM2wxeWV4T4poySZhhTKnByripMe4REeCMQetCw1awYOi
	1aV7wVgkc/Y7YmCWKFBg20MM8kEIJQn+p2sEJ+cSU2ttvdhWyKfdJlTBtBoXgG2ROSZnyb0Owk8
	re3jErUElQ0gS0VOvvfrTsIRP1tPIFPkFHhFxWJN030FlIw==
X-Received: by 2002:a05:6a00:4f96:b0:834:efcb:12b4 with SMTP id d2e1a72fcca58-83eebc25edcmr287593b3a.28.1778538214363;
        Mon, 11 May 2026 15:23:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f96:b0:834:efcb:12b4 with SMTP id d2e1a72fcca58-83eebc25edcmr287547b3a.28.1778538213840;
        Mon, 11 May 2026 15:23:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/8] arm64: dts: qcom: Devicetree support for Kaanapali GPU
Date: Tue, 12 May 2026 03:53:14 +0530
Message-Id: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJWAmoC/22OywrCMBBFf6Vk7ZRkkj4sIv6HuIjpWIN9mbSlU
 vx3Y4s7NwNn4J57F+bJWfKsiBbmaLLedm0AsYuYueu2IrBlYIYcU64EwkPrVkPVj1AOsE9znXE
 hlUFkIdI7utl51Z0vGzt6jsE6bE921Z7AdE1jhyJqaR5gNSc8/+Yb8l6vnUV02Coxg+o2g6kfs
 KphQuCQ7TNK1FWWKlWnzvv4Oer6q43DOf5XJWF9Vb+a0f3mTxIE5AollgaF4fKP6vJ+fwDNRLh
 fJQEAAA==
X-Change-ID: 20260412-kaana-gpu-dt-968a70134c22
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=2499;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oZ+yt/RXidFRbw7KkVC6QwWQB7cStOb9OIQ+8ARPiNA=;
 b=z4wkKaTXNXkeDYdY4GxGX/+MroUPOcH6t63HZ1+4kb1hAZt+BGI/ky1jTgoA18Fcdd3BMaoDx
 M+k9TYb3CyQCVJ+t9jflHnoB2osAaht0heuWefIRDO4XXuijct4UNzY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 1mVhebhCCXQ_uk3rm_Motx5AzZ9ah-ep
X-Proofpoint-GUID: 1mVhebhCCXQ_uk3rm_Motx5AzZ9ah-ep
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a0256e7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RSuC8zd2ZDaJPqFJxW4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX9moIKeE2ZSQ/
 TZd+OT9otTWGjjTfuH00ANsiBivFD/P0/Ep5s2QHX7Te2B6jNGK3/NEIOyuZkgzVIrCXgEbfq6m
 thUL2zVDTjkocyzXV1dcgQltCN4+RVyTSpby9P97sUsYzFVwi/iElQ1pM1of7oo/ErfJXyl1f9k
 snWypObQ/sP2Z0SFjXaZHmQIEzOm0pGUqW3q7YkxIUGiM+EDR5YTkZsvGWt/aojfobtHVHdJ8tQ
 06cAiAFHISt+dZvHnZdY+5yfzfCIoZxR1kllT/cficljCkKe2TLYBGvb2x2MuS/YD2jCNRugeFV
 dUfrUhtAlxGbcw00/n/IJJclH1GMKdyJAjYfCyTuyJy3K/3ei4S73Xr3HhSgQqXhrEFC6qR+80t
 Cj7+marb4uhQY9n77YdcWb+AJd0P06ovabjAWJoSCu1CsIjViB61n3Xd0JW97pvHpk/Xhp59XB0
 Ud/hmBgRvi99QMWvcAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236

This series adds the necessary Device Tree bits to enable GPU support
on the Kaanapali-based devices. The Adreno 840 GPU present in Kaanapali
chipsets is based on the new Adreno A8x family of GPUs. It features a
new slice architecture with 3 slices, raytracing support and other
improvements.

This series includes patches that updates DT schema, add GPU SMMU,
GPU/GMU support, GPU cooling, and enables the GPU on Kaanapali MTP and
QRD platforms.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (5):
      dt-bindings: arm-smmu: Update the description for Kaanapali GPU SMMU
      dt-bindings: display/msm: gpu: Document Adreno 840
      arm64: dts: qcom: Add GPU support for Kaanapali
      arm64: dts: qcom: kaanapali-mtp: Enable GPU
      arm64: dts: qcom: kaanapali-qrd: Enable GPU

Gaurav Kohli (1):
      arm64: dts: qcom: kaanapali: Add GPU cooling

Jingyi Wang (1):
      arm64: dts: qcom: kaanapali: Add qfprom node

Qingqing Zhou (1):
      arm64: dts: qcom: kaanapali: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   5 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   1 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 450 +++++++++++++++++++--
 5 files changed, 441 insertions(+), 31 deletions(-)
---
base-commit: b462608de92a7cac450781f9d8d4c7cf3ccf82db
change-id: 20260412-kaana-gpu-dt-968a70134c22
prerequisite-message-id: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
prerequisite-patch-id: 82e142b3d904e746db0e288fb7ea6812661c3537
prerequisite-patch-id: d141a83ef741d26b03d931cf120b8b541ec51b9c
prerequisite-patch-id: 5bdaf78fd75be779d4aa73b85a185a10d8458366
prerequisite-patch-id: 0263b47f4e1aeb61fc96c6dbd9f7168ffe0eb04e
prerequisite-patch-id: bed1e449dca0167ed99e8c4f1e544ed60ae17014
prerequisite-patch-id: feda87721f22e443f38165787b2b28fe1a40aa18
prerequisite-message-id: <20260512-glymur-gpu-dt-v3-1-84232dc21c03@oss.qualcomm.com>
prerequisite-patch-id: 9175e9ae77ac032c2f0502e2c63bb7b7d1ae4ead
prerequisite-patch-id: a29ab9cea24f74a76a69f144f76f9860e014ad19
prerequisite-patch-id: 6243ab821a3d9cd641a8dca8cdab167fe9da8735
prerequisite-patch-id: 36f4bb7740fd65d808fa6685bce4b03798a547ff
prerequisite-patch-id: 054631082c45d3ab3117f541f0d4d90b660dac73

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

