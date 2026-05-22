Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB603C8182
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444753; cv=none; b=A+bcBQCYOXxANgsGLdpovTrmaL1hP7RKe81Q20FaK2v1+wQI9in15seTvQ2JMK3HB7nKC+xmB/XvNkcAYYWrnuNPeXNsQL2jV6t9bbQb3E/UU+4TtimtTqZ0hBsFg6NgacQ/Olp+nQJHezdLEHwC1lxuY3hdbw8VQVwlLTnoHYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444753; c=relaxed/simple;
	bh=kTZkqQMBsGBq0RgXdzBTEek0U9w6bkU5wpcpKO9PBwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ao5rhTVuLfqWNHreg7ihxhGNL8BrhyMrS+M7H1CCCCFyMaVz2miDfy4glbeIkqFigZDkg+AYQDGwDKmBRfXRPNpvq10ioAtN0Ry0B69FPD7ZqrPQDIGZ5odSxbJp/ECLIXjXmTyjeYfWErd6cVAs0Ial4HvHbw+ESlEJeOG6YjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeyoKsJL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIe4zzLB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeyoKsJL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIe4zzLB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8VGl43532135
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ygzXnRmnIfi9PfYTeE5iFb
	e27GiW5AXsmvzhwk2ysvQ=; b=GeyoKsJL9AsFkrxFikRPNe3HPwuc2BB+UxDYAU
	VnsEI2Pni8YvCbejT4sOZr3ukWkukbsi2Y87g7L9O0qXX4F2QbpAzxS+rKpAWo5m
	sjr/D6EP4yB/+G9x5/FqLbn0w6f2h8lOVcFvFejj8kFp4VnnNSIm97we2HRFFv8s
	Y12dlxs8RnEjZF8dmNQXVG/lnZOFKvGstQKsY49NAo5Tt6FKZD4ogJx6q0XQEW6F
	3iJKsgka3W4y3C7nKJNOmV6z6uUFPIn9gNGBShys1OMBFCfWdCqp5cZ0c+Cj6MGQ
	XbhyMWnzwU41gPfOpKyEjCuk/m/CQMVCVwUfYxNwiCrMTPLQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvjj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so7900515a12.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444751; x=1780049551; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ygzXnRmnIfi9PfYTeE5iFbe27GiW5AXsmvzhwk2ysvQ=;
        b=iIe4zzLBGPssgP/Q0LSttfa8az9XjgRPYMak+HwlVee8UBhwg5gqeMJ4So+j9nZ+H3
         acBgeZcoHrKzGD+85VWbUK1kyPyCx/Wx8J+URxpejZf+JpSldrdZ23IvO9YXkrou8xxT
         cCvFWuALVEreTuCeXnTK1eOIn9FIb4XRvfqXgR+oY/Rkgc5KGq91AwSwLUtl2zMykVIO
         oNABIVKPsCorOux81Oz6gKD8xkw28axWF/GtSS4w6J2kue9uuDpvU4SSFM742DTaGjX+
         +pQtzQOIHbobZpsJStKaE7vAqNVJeOueWMhhORB6K1mZiSCf0/Uw8j4427zLW6ofn0or
         1/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444751; x=1780049551;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygzXnRmnIfi9PfYTeE5iFbe27GiW5AXsmvzhwk2ysvQ=;
        b=BEi49Z0reK5Ldv/J33pAWaP87XiOJdavvaWK0sJGOwpjkLEBJpZM0DPpS5IawzLjDV
         MkStsy8a+lodq1ILOoF1yxokCWkqZVTEK79e7fXIBOkxWBLzGXQxeZwNM4kDw1pM0fIK
         tue+UdfYN5F//W9tCuTufwM0ImiMjMapwF2LGXQnLoSoY0GETr6kVoqRpqFqsMEKkYRE
         QzgeD27nlxbK4ll3j6i7YEYEk8cPuirktOGGip+2liuVXvbCWCsRv/j9Rdwbw9aGvx4F
         RfdMntDWK07wI13zPqP4tin3iUlKKu/oLUL9qicztIlvE4CSAMoDItLoXZhNDpC8pTjt
         qRSA==
X-Forwarded-Encrypted: i=1; AFNElJ+CLFqhYtVfOPqkBUE1j9SMBhogg+xFHhVNgQjlwNLCS7JHwraVkaq82qqTV5YGjIP2MWT1F1AfNR2J@vger.kernel.org
X-Gm-Message-State: AOJu0Yyymf8uHMGiyPsHWMLbCQCe3ikzG1nRVMboju9OUPvuL6rOUkLn
	/SObWvCW4rZj1YgeIxNWuP3nwk34xC+uYR4ANvwwOJeKlJHxem8/jgY0ox7NpxEL3dGkLD5LGYv
	ldEICTh6Qz+xTlzHzEBoLrp361rt2wiS2d2sDZI8xaUBrPFwPiG27moKaSK6fnccS
X-Gm-Gg: Acq92OFYIQXOjJIby0NHVcgHPlVSCj03yipMy5kU2alO7UC6aBx4rCR4Y0C5IwefW6h
	UKSyFvTDmXqyKvGvhlt/xmezPiXRxyFBcNda5OuIerunxMMqiGdkXs1yGZVyxT6YHNsH8JDPw9G
	RuGf+KEX6CL6KShNzHRrljTTmGAE5AQKExyuk2IGFK/ijhR7bJ1JYZniQMf7beG2HyvGN6CVoGV
	Yp2wHFc9KmswpJsGvqLNcU2Ca6zBb2wQ7mDX12ChenqI33dosb6BNRRO/mX2UnXAD0o6ld6a5hz
	nNyUXUWX5sVocB7ZsKMFJwWhBQVoFfbXW+rY3I6At87QB4xag5XX040/c/acti5qWQB/yAEHCtW
	l1FS/e4G7aDYG2LTWSz6aNjyL/pqeWX84iSS2VDt+2ug/EFcre+4eHYMA
X-Received: by 2002:a05:6a20:d709:b0:3b3:c28:45b3 with SMTP id adf61e73a8af0-3b328e4f8d7mr3008448637.26.1779444750735;
        Fri, 22 May 2026 03:12:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:d709:b0:3b3:c28:45b3 with SMTP id adf61e73a8af0-3b328e4f8d7mr3008398637.26.1779444750288;
        Fri, 22 May 2026 03:12:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Devicetree support for Glymur GPU
Date: Fri, 22 May 2026 15:41:56 +0530
Message-Id: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwrEGoC/3XP4WqDMBAH8FeRfF5KcjFOZYy9xxiSxNMGGm2Nh
 pbiuy/qYMWtXwL/HPe7uzvxOFj0pEzuZMBgve27GORLQsxRdS1SW8dMgEHGADLanm5uGmh7nmg
 9UiEKlKyItUyT2HMesLHX1fv82vKAlymy4/ZJtPJITe+cHcukw+tIVzoVbOl36L1ah5bJ21bg7
 Gdm5ZwxVT1Wpu8a21YBaBCUUWUMFjVnGb7CR+/94TKp0zLhEJ93sqxxtH7sh9t6ZeDrHhvO5O6
 gwKMIXEjUnBuZ/RVXMMAvIhnfI7AgDYdcS1lkWj9BxAPCYY8st+UpCKgNcMPEEyR9RMQeSSPS5
 CIXYIQ2hfoHmef5G/eD6xwHAgAA
X-Change-ID: 20260226-glymur-gpu-dt-339e5092606b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=3476;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=kTZkqQMBsGBq0RgXdzBTEek0U9w6bkU5wpcpKO9PBwQ=;
 b=CHtXeQDP4hxrxwaBHy1GmF0IPY/324K7voescovnfbeHnVyH79TDAQ2nGYRnw6OvjvF6xeUS6
 9+M9+HCmwDFDj10U5kVChHguRZKqP5hOlDjVnNs+DcPMbLlLdR2EKjX
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a102c0f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-08r9DDlpfC4vgu8VQ8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: KkNkxyXb62i83YxcBaeCnVa8VPfKgkRo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfX+7zIa3R5AxOm
 IIYt8z3kE2DpIQCRdkraHI7X79FRoawMpQJMzF3Q2Ubep4Ts9DmM6AFMOBh+GqistFA4sBQnFjh
 3JXwBIEDQJB0QLxr9a9PC5bVWJOU7RnVyXQ4TyiY86T22rS/Ngg7/v8x7r91R+/CNQJdrmxrmxh
 0BHXc9d+6qLXPKwKgjfcCMdewNfQHXJ6ffNpa9qTnH7X0/DhW+DjzfVOv53C8u/C/nuyBUZkft8
 BkEdCW7bnWBpSvUTn4+92TYhtRv628ogD5GylSAQ5rTS054m7Y1t7xcwdThH3J3XmiWs0RzJaWC
 Tx6M4H0jzGYpK4c/NybL2Pnxb5fRuK6rQu+E7oDwJWaEn/UACcF/xHwRdit89NdVmJKpd9Texsk
 m2/vm8EcTXE1CrMRttXqPiHBj4W9lM/SNXDME6ayCGWDKHbAKchRM42l9VjcKz09jwtMVoGM2wc
 jlWAeoCa8NxJJ6J5Png==
X-Proofpoint-GUID: KkNkxyXb62i83YxcBaeCnVa8VPfKgkRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220101

This series adds the necessary Device Tree bits to enable GPU support
on the Glymur-based CRD devices. The Adreno X2-85 GPU present in Glymur
chipsets is based on the new Adreno A8x family of GPUs. It features a new
slice architecture with 4 slices, significantly higher bandwidth
throughput compared to mobile counterparts, raytracing support, and the
highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among other
improvements.

This series includes patches that updates DT schema, add GPU SMMU &
GPU/GMU support. Keen-eyed readers may notice that the zap shader node
is missing. This is intentional: The Glymur-based laptop platforms
generally allow booting Linux at EL2 (yay!), which means the zap firmware
is not required here.

There is an update to the gxclkctl/drm drivers to properly support the IFPC
feature across all A8x GPUs. That series [1] is necessary to properly
support Glymur GPU:
[1] https://lore.kernel.org/lkml/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com/

Just FYI, on top of the linux-next, I had to pick below series [2] to boot
the device properly. But it is unrelated to GPU or this series:
[2] https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v5:
- Relax contraints for reg-names property (Krzysztof)
- Drop the smmu binding doc patch as it got picked up
- Link to v4: https://lore.kernel.org/r/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com

Changes in v4:
- Add a new patch for passive cooling support
- Link to v3: https://lore.kernel.org/r/20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com

Changes in v3:
- Add a new patch to fix RSCC base vaddr in drm-msm
- Remove interconnect property from adreno smmu dt and the binding doc
- Add a contrait in GPU binding doc to limit the reg entries for Glymur
  (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com

Changes in v2:
- Keep GPU/GMU enabled by default and drop the enablement patch (Konrad)
- Drop zap shader node from DT
- A new patch to update GPU SMMU dt schema.
- Adjust reg range in dt nodes to avoid overlap. 
- Removed cx_dbgc range as it is already stable across chipsets. This
  region is now part of kgsl_3d0_reg_memory range.
- Link to v1: https://lore.kernel.org/r/20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com

---
Akhil P Oommen (3):
      drm/msm/a8xx: Fix RSCC offset
      dt-bindings: display/msm: gpu: Document Adreno X2-185
      arm64: dts: qcom: Add GPU support for Glymur

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: glymur: Add GPU cooling

Rajendra Nayak (1):
      arm64: dts: qcom: glymur: Add GPU smmu node

 .../devicetree/bindings/display/msm/gpu.yaml       |  16 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 461 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   7 +-
 3 files changed, 427 insertions(+), 57 deletions(-)
---
base-commit: c9bd03db3e792a99e9789fde20e91898e3a29e8a
change-id: 20260226-glymur-gpu-dt-339e5092606b
prerequisite-message-id: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
prerequisite-patch-id: f7ab29f2f0241b6536d3b0c0593f0baa0e435221
prerequisite-patch-id: 56c830b7718129323b006e492aed9822d7c30079

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

