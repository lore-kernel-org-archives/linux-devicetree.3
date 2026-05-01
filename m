Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7843EFD19
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655460; cv=none; b=IG2pVndxLljXvlgIsjdFz+QlhxvawabSCjue2+BDE+iA0o2319egti/oC2SQd8n4uQM4j+HgOd3A7Ncp9zjOchvWWRuZ0VlATrXuH3gQ+hqQhyXQ6ilOVMqVbo2cy3UhZQt2+Vhop3FBPFlZPVxXzm+9DL30MekSDs5cG+6/9vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655460; c=relaxed/simple;
	bh=AOjeov0yUTMFQ1Ma3m1LBG72eiFPSxq8IrvyTOV5Jik=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pVP2hgjHE/FEqZa5PahcQL8FUoT8UPrjynk0ZooAJbRNjRTXRIWIF/nUhQfgMbwMl+rpkkCP41EKgy5w+zxzglKCgZhoLgr7tomW7okt5YXCoL3LVlK3NlHfFEZW0IeGbeVKnk2AzACI0o3UKC7OL/PJZwiEsQTahJkS8w6M9cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZ6GRazp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBct4uw0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZ6GRazp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBct4uw0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLQJV3938594
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xmgf9SSOqwqEz1frKQANVZ
	eXXRXnvjk87BN/wRkyWus=; b=eZ6GRazpna0LN1A3kFSSnlvhvSwgfR4ME8vZz8
	5dfwo1oXkEDrD/ClIyuRpaFrxTlJ0EywMvltO175mHzUPUfTd9Akjd+VRi/yOLS1
	9gOjc3oWETy1F1V0lu3ACeuQMWyPPT2ev4SWe1pLuNZOYNg2LKoSECLe+UULUnFV
	AaSrulkOebl48zq4EHXS17yzRhtug9i5F04McyXDoWZpZk898IZclTV4IQqljftY
	mYwCA8VlVnR7PEFSw8AT7RYbD020aKqCyuIObpkIC1KXwwxfNyGcpDEk5iEn25A0
	CHGiq29m46Fxc339hjI47IPJdKVkDQ7GzEbdLHBxUH3J1XZw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvtrn138r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:10:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso1303250b3a.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655455; x=1778260255; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xmgf9SSOqwqEz1frKQANVZeXXRXnvjk87BN/wRkyWus=;
        b=TBct4uw0GRDpAVp0xd3NEk8ZB5szGns77zdN6qIUNWBEb3wj15otOasyZPOZyctONh
         nLKempF2biTw+Q9AThjaGVkUdL+z8NtAEoVcENAPPpXqVpt7ogUcBiCtBfXRXyeNp+pA
         AXRaj640d4brGLKaWlfCtXCh+f3tynbZp6xocVZB7NTq+nee1nnFgVljwO8Ub4/OMEbO
         wS3tP2eyqiyv7dB7tQB5dlXNLXOsQptV+y0y/ryXJ9tL0zHLI/QJsCtVdH2t4jsLhRGA
         C3ab+tXhtzniPLOz10Vw7BU9bge7jV/UvnCN0FwxvNdqR9Fz6EIu1p17io76KXfZsC+Z
         i7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655455; x=1778260255;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xmgf9SSOqwqEz1frKQANVZeXXRXnvjk87BN/wRkyWus=;
        b=DD4E6MBHJF1Tcqttrmcs+JmMNnPpeFl1Nkw57TVwItW26I+/ZZ5dATqx7sQhLRU3x8
         pL9c0bgBPNL7aaqIK4ZZEge4hrLLb/FIm/tRFnjRXL2Tf2IVp0yi2JN8Phgd7BA8wZIm
         k+b6yjVilEM4WWaIoNthJpflIwYY6E2RTyjgdXecDOm1I92Dwsv7JtYNww6ivCg0XcBV
         7T69iXefCrsCPZvu9mYVFMt5DrXtd9NVuJ9L+Dfmugj8b9iZoGk/+x7Em3unzTglKU8e
         3MKP8My34UNxWQz5Yw28zd0Kl/qmLbv4LoKg9Qw/faj37OyI+RlAuz0+ei6MAwzwXBvE
         1VFg==
X-Forwarded-Encrypted: i=1; AFNElJ9DrXaRAT9bXPN7q/zG1poOul1Uxh3RIT6HKSD2EDiMoI9CHVntK3UGOk1XbrGHxgPuKqj/7lVcFGaa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7mZMjoDbzOefOXHfnALL+rprOUtPwlI/izgTY+0HMtTF5ziYT
	1tYjXpdKxEnhOqxTRm6dFmwSvKWmYUhkZ1CCaj2zRHofVJz1OEgsH/WFged/EX6ThZT5zOMIrVu
	FDY3CuC+uZkKjYDdg/VGkhaMaEkrZM6REs3at91HrqmmTIBS5biWgZis57gUDw3O9
X-Gm-Gg: AeBDieueT+kP7ByesTrQPsRN+M7FFKYmgMCFdInv1Vwru6+mtAQmVR3ut7wjZiFJRc4
	cv4MLOmSej2K4lIYTrwRzl41k/gXx3Nvvw1fYwxjc51INW7N2VLZKWX5lKYWM2Vn4+mrUKqaJr+
	44Rx7hAcMcnZcg/0NQl04qeRTixFGKMaCxGMtxWYSHauAFBv6g66BDgHWz1RRK1GRz5EkQhU5Vt
	SRrV/BlsYB09MludfXb3hm1a9slmmfEheWq8BFasnH6aXGAX0wavCQzrTOgd3bHrCn1T1CB0HHV
	bY7EQGx439Cugu8+c2WIJm0cxB7mZ7ENI+w0OWMgSuoHT4eaxnlhEKjxOeghHORDx7uab+rhgq/
	kxNGR6WqaKuLcAuxkR9VlauXQ5BIqg1JcO/e4HwFDXrhVG7bqWCXksNXX
X-Received: by 2002:a05:6a00:1ca8:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-8352d1495d3mr96929b3a.11.1777655455368;
        Fri, 01 May 2026 10:10:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca8:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-8352d1495d3mr96874b3a.11.1777655454844;
        Fri, 01 May 2026 10:10:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351587db67sm3099323b3a.13.2026.05.01.10.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:10:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Devicetree support for Glymur GPU
Date: Fri, 01 May 2026 22:40:36 +0530
Message-Id: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIze9GkC/2WP3YrCMBCFX6Xk2pH8bCMtIr7HIiVNxxowjSZpU
 KTvvmm6V7s3A2eG+c45HxLQGwykrT7EYzLBuCkLvquIvqlpRDBD1oRTLinnEsb7284exscMQwQ
 hGqxpk2+yJ/nn4fFqXoX3fdm0x+ecsXFbkl4FBO2sNbGtJnxFKOgvQdd/iyGoYtpWx+3A6K9nZ
 63W3RA77aarGbvEIQmgoLTGZmBU4oGfXQj756zuq8M+jxNZY9xMiM6/S8vESo4NTus/hRLLRM5
 EjT1jupb/ieSyLMsPWkrKKDgBAAA=
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
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777655447; l=2699;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AOjeov0yUTMFQ1Ma3m1LBG72eiFPSxq8IrvyTOV5Jik=;
 b=GQvofMkE8YRm1WWEZcaDkd5inbdSBP4TBVUF5vcztYq43pzVVAe9dOkuCO1qbiumFbzerGX5u
 cB0A3XTLGGvBD9kEnQYkJySG33kK5x0FGLH/kdcNLIzIK2yC8bpbBCz
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: KoOlh-DCZ_Typ4FEmtZT1zzenEkc-owu
X-Proofpoint-GUID: KoOlh-DCZ_Typ4FEmtZT1zzenEkc-owu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OSBTYWx0ZWRfXxKjcN6sfl2cS
 u1J0ONARt1Xsh37ukHzNP1FjVR/iQjlcxJGmGYaICm1KkLFGASAUrLet7uBldqE8m0eEkbO32k4
 JJbWCp+LXMQhIKp5T83ngqTUIcKXq3CMytlxvfaC1PxaZQ1bnpRYFlijFaiC9ZKyx8NyAcbikF4
 R4XCgLAtabhAic/Dd4XQPlfWd50ItPzDin/5/MrRD1XcWLZjZdkZxKXIAUY6NTSMM8FY7NVwl3G
 BzCQ+BTUPfRazlHxKidDb9Q1HLjn5I5c+Itsb3fAy8U5UjP6hJ6RTHZd6KixRP7K4Tdc3or12II
 WYxJYHQDIPxlkaP4ACaKzKGbBLpaVPOnPqAVox4CzLx90vQx68JVkC6oMDTzlZ9q4e0g/pZzHU6
 XMPsQdZiVuGjOptiDHNIHq1BX1JK+StI1aJCF8Zh3WvccC0VNHFh++fCKLY19NKtl36rgEpE2yO
 bjaufbghArLJdpDevvA==
X-Authority-Analysis: v=2.4 cv=KrZ9H2WN c=1 sm=1 tr=0 ts=69f4dea1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q5AOMzfNme0c0ULdHeUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010169

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
      dt-bindings: display/msm: gpu: Document Adreno X2-185
      dt-bindings: arm-smmu: Update the description for Glymur GPU SMMU
      arm64: dts: qcom: Add GPU support for Glymur

Rajendra Nayak (1):
      arm64: dts: qcom: glymur: Add GPU smmu node

 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   7 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 223 +++++++++++++++++++++
 3 files changed, 230 insertions(+), 1 deletion(-)
---
base-commit: c9bd03db3e792a99e9789fde20e91898e3a29e8a
change-id: 20260226-glymur-gpu-dt-339e5092606b
prerequisite-message-id: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
prerequisite-patch-id: f7ab29f2f0241b6536d3b0c0593f0baa0e435221
prerequisite-patch-id: 56c830b7718129323b006e492aed9822d7c30079

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

