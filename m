Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7BA341ACA
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336630; cv=none; b=H+lyvsRbF07RvSw/lUBpnQ0hsW3WOUb3ZvRxI35susqs/0pVZd2k+GQYQJ1Mz/HXU7/pLoARKiEgeBnUp4MmkHqIJtJo0K5xlMehwFitCbkutZKjFiA8iCvmris2jfdKjADffUzWyczte8hXzJPyrTwMrp8xdqe/tg81misFH9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336630; c=relaxed/simple;
	bh=+J4aWf5YojiTxQdOvfgMJtW8OPo2YRqorfMBEiErPAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=avI5eHKk503l0tFpYrGEkuR+LG+64CEKt9FYECWntTwFzkXXC6bJewROVR7kmSgRWPXW2axdbaTbFtfb7ogiWyISWLUXIDxg5x0K7sKerFnVmQTQQhvC5uOxvugMtTi+Blg3JBWj60kLp/C/qNGJaY+CdY2Ysm7ZsAHqXXzt5os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nok5AUPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krko3hBC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nok5AUPz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krko3hBC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342CP1V4115652
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O8qW0bRHK9VtZRzpUZbVBD
	nyfCKTCiQkwr+gwij95pU=; b=Nok5AUPzJ1p62JfHrbx3zWpzWZL0PlFvlHijbQ
	EV+ex01GKdiQgce+h22lj4A0ZUov9KeBI/g89wW+U8QmrjgMdjiF2XcSQ9xj18gp
	yAPZKHKSDnuasfZWuvUvNGPDzZMT6C6+PMX0o2CIu3g3QuxCTA7tLZjQmNMdrl9B
	cJpt5hbTytmegE4Ay/h48N4xFiQhncGgt7E7JflKo0o1Qpl71VQddoMpLYs0Ctka
	AFZtLO5g9azAa5qOcXxaQZirMEXb5IpGE8RKiwLWRIGOAL9czXP/X7sr878XGktQ
	NWV0wKizz4qWQZCxNXItfXHUNvm3xW2a+wDKgTd0tRAF66dw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5sm66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:03:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9010602bso2798300a91.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336625; x=1775941425; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8qW0bRHK9VtZRzpUZbVBDnyfCKTCiQkwr+gwij95pU=;
        b=krko3hBCn28muPTrkltIqKgrXZ1U0ggkNUR0iY9ojHobPfZQfamnpoR+EnICyBweaj
         DL0fp9JNO/+R/ZT0d93kcT7+ABxJfB1SvKKRtJALTgRMOMt69rZzQc7amBqZ5ojL9mja
         f65FACv4d5G5CPBNKzul+wS9m+oBWqgm6DnFbrbKSQNbI1kVYqi5GfrsigMBkmjXaHqR
         RsDaomahbyZj/amBUEgCNiEh3bKsEl6FtmaRyvIjUk1MWw3jSRpDWHh5XzOMVM0rOvrM
         tujB2uYZPS/lsUpTd8Gd7DF4b+Z8dNzAJTNTagahUsjo5dN8ITrbmm0OmBLNUJtx524+
         EfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336625; x=1775941425;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8qW0bRHK9VtZRzpUZbVBDnyfCKTCiQkwr+gwij95pU=;
        b=GVHOkIfqzvDBehpHwkpwIGXW7NMI5t7f7PthhTAoqxaBchKloG49d57Wae73ceCMS9
         vu8JGErkNWrT9vXfpa7MOtCZ/vgHSfsrdRPsYwUNpNs2H2KoNY6q9GXjrrYEubV9R5SJ
         4DuotssOpb1Z14vMHFjJOe+HuFV2L9FFYlDu/GbRBjJ7/TXnPvLaxpp7DYmgJv3OI75H
         F6hdYAp8QQnNVYJO8Gmm67WgGwQIraY/IBlUZPejI5LqfSF2HKJMY4+yibfcYWryN89M
         d5rALI7r9611x/cXl+QdkKxLCGriCzXOsWgj5u86ZYIVdxBUoIzEA/SSox9/SrSSf4Z7
         MYlw==
X-Forwarded-Encrypted: i=1; AJvYcCUWlDuqBxNmavAleGMD9uIeEK7Df2Gut+MlWC2DNO/Ei03955rKhn0Q4oHIxjiipmDVDS/TS8Yzm5ua@vger.kernel.org
X-Gm-Message-State: AOJu0YxNaX6sC2npmbrB8DojFTWJGH4iBEu4FGqnWRMOOQJ0z94BR2vH
	RG75i9UvftaUJqk5apJdA62iJ500kAUHjEHLzMWdG/qurSRZ5zQoBiCYbfaHQuFNyD8okD6V6/9
	AGlfKNJm+PWNwUkjiP0s7h9NQFU7WDQD0qIvau4xiVf+9j1TA2aN/WKXhvaepiioZ
X-Gm-Gg: AeBDietSCd3FDa3ubzRd7+yCtMCzhQgl/xIOYKcqt7hFq2ap3blkJLLn7tBcnscXHC3
	KjPdNZsgbhJE7ombfPkN4Cd/IsE5uN2GI2nlGGvfDZqRTZ3elN9jPeKrOf1eYtsjA8zreA+59Xc
	N/eSgrWCNGMUdwQlCo8HR+gSlB7okCv4T6WWH8KIUaH8wPRKVmSxrOn34FV4BuK1lUx/0U4e/aX
	A78r0l2dEcEiXL94zNPz/pq2/5W+Ko1FVIl7VdrkHLUHltUG2r9Lf/IrHLteP2+nKI7fnx7Lhwi
	wO8MUPbjzyBpsd/i+Vk63o1WK0y0lKeyuBNmGKrU6TvSvvbTFpWoXc2D6qv+qLbHObiBg1T9BbM
	mX5foI2quFzEKv8pXTT3wlBeUjp19Zu7NmPYZpGO8F7zn8w==
X-Received: by 2002:a17:90b:4cd2:b0:35d:ab26:5786 with SMTP id 98e67ed59e1d1-35de68f8971mr7183161a91.19.1775336625164;
        Sat, 04 Apr 2026 14:03:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd2:b0:35d:ab26:5786 with SMTP id 98e67ed59e1d1-35de68f8971mr7183137a91.19.1775336624631;
        Sat, 04 Apr 2026 14:03:44 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de677e2dbsm2675545a91.4.2026.04.04.14.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:03:44 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH RFC 0/4] Devicetree support for Glymur GPU
Date: Sun, 05 Apr 2026 02:33:13 +0530
Message-Id: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJF80WkC/y2N3QrCMAxGX2Xk2khtdbghIgg+gLcyRm2zWbCb6
 8+YiO9unUIIfDnkfC/w5Ax5KLMXOBqNN32XwmqRgbrJriU0OmXgjOeM8xzb+9NGh+0jog4oREE
 bViSWXyH9PBw1Zpp9FzifjlD9jo6GmNzhT67SE6reWhPKrKMp4OxfM/6VWPJezs1ltpuBYOJfX
 FurVK1DrfquMW09ckzDUMtCk2ZbxfPm0Hu/HKK8fxuWae2her8/Yo4aLesAAAA=
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775336617; l=2365;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+J4aWf5YojiTxQdOvfgMJtW8OPo2YRqorfMBEiErPAE=;
 b=jPzJNMWb3g7JXstolt1bgI0t3NvHo96BiE9bZ+CxlIAgn7WvnAAg9ofOsPmhTBqrDY6/6+elH
 NvOAdVhX+qJDRwb6GfPTvXphNmC6cz4gI54LDlTzQe/EnzTZOmLwUVH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX74DU1nqCLrw8
 4hJsdr3q/WGbdNDLFd91HRfBdAM7FLz22O469GR4jOcqK+yNAnyVu/YfnRH77nQDI+d603YL44x
 EGQIY3VW5irvIUr3bI/tIk8xiMVNg30hco7iaUpfcExPxNtm1tDpgHWVMHaXNFQKOLujh9gQa1t
 w+zMkr/IaPsxNkxCOsCPCTJaW5KzdspFCClvvkqz5MHIG1XrkzVMiu1/7q/jzbb8P+0CfxCjJKw
 ESjEasdqVgxR25K25WfP2RHre4OsOgBojVLWJ3NuEg4VFWkF+JlmfiuUMvTuo53htSDnR44y5sh
 4vngTuQCeGt06Kc6+QJ9QgX4OE6XH8XeiBhEl67kwSDVl0PhKNLFNnMheGJUhubjBnAgRw0QSDx
 yRCpONiB8PRHtIk10xqnb9aZI5tj400ZtQ0YE8iEFPyNwU2wk59xUogk58QUwqfVAJAf8AuXiOb
 zqhBhWAdETITJIK4mgg==
X-Proofpoint-ORIG-GUID: k-ofM7SpyAYi2GHjqePJAvAt7ePJQ3hB
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d17cb2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Q5AOMzfNme0c0ULdHeUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: k-ofM7SpyAYi2GHjqePJAvAt7ePJQ3hB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

This series adds the necessary Device Tree bits to enable GPU support
on the Glymur-based CRD devices. The Adreno X2-85 GPU present in Glymur
chipsets is based on the new Adreno A8x family of GPUs. It features a new
slice architecture with 4 slices, significantly higher bandwidth
throughput compared to mobile counterparts, raytracing support, and the
highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among other
improvements.

This series includes patches that add GPU SMMU, GPU/GMU support, and a
patch to enable the GPU/GMU nodes on the CRD. Keen-eyed readers may
notice that the secure firmware property is missing. This is
intentional: The Glymur-based laptop platforms generally allow booting
Linux at EL2 (yay!), which means the zap firmware not required here.

The series is marked as RFC because an update is required in the
gxclkctl/drm drivers to properly support the IFPC feature across all A8x
GPUs. We plan to post a separate series shortly to address this. I prefer
to merge the DT series after that series is acked, so that we retain the
flexibility adjust the DT bindings if needed.

This series is only compile tested on linux-next. But I have cherry-picked
and verified the functionality on a downstream tree which is pretty close
to upstream. Also, there is a dtb-check error for the adreno smmu node. I
will fix that in the next revision.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (3):
      dt-bindings: display/msm: gpu: Document Adreno X2-185
      arm64: dts: qcom: Add GPU support for Glymur
      arm64: dts: qcom: Enable GPU & GMU on Glymur CRD

Rajendra Nayak (1):
      arm64: dts: qcom: glymur: Add GPU smmu node

 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |   8 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 234 +++++++++++++++++++++
 3 files changed, 243 insertions(+)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260226-glymur-gpu-dt-339e5092606b
prerequisite-message-id: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
prerequisite-patch-id: a1fb5b7ee94995a24f6e96d1d2524e710d3a7e60
prerequisite-patch-id: 56c830b7718129323b006e492aed9822d7c30079

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

