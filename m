Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B119E379EFE
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530049; cv=none; b=jLZoD99nQTr01C5Llztamm7NLOoHEVQJp8KFcuwrKeaZm51wzf8HjwO4yDQABbgaWf4qY2nvBG34O/H+kCyQXpX7WVrul7G03MokR2Ua1ovyV/X8TcC60Hf9mipVPMEB2tPsOxKFOi4Po6lGbkshqTBMbn+eI+3u8Obgk22EAUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530049; c=relaxed/simple;
	bh=qNkWrZGsSDaD6GrYCTVs1LnnBLeedST67BI1LcY7DLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Umd9gmR2XX/Vlw/5kSL30Ix+HckA0csUWHoGsuv3AlbYbPkrBZ9zCtbHRXfzHB07ATzYsFuNmkmzEIi9GW+ErLaLP+Vo+aE9QczT3BAUOxHJCHBTJPyNUnhBzYJ/+U1dQfl46m8tJbOJkFtgltONkq1gsgDrwKXZeGKzNLvErFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEU1xxLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NG/u8aRH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEU1xxLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NG/u8aRH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6NUZ1183918
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zt0Wfud40//59YvB4eTabQ
	hvDuaqsHejQA1eTNLDMFA=; b=GEU1xxLyPdyiwXcFM3xamwzoVietPWRBRZL20+
	rJujlGDYZYpfhkLAtMPeDFiKX6DDIBRrfP105FgzBKwyHcEBggnC8FkbZeEnUqYk
	tR0Pb6/aWMzpUn4Ut2OqlsUoCFT8eB10uIjtY+OhxrDWwhvj4DanQ2MIwaaRReRz
	mpbveFghUbcn9QWcwW+cLP5XQqpDt9aIuHxPB3Jv/STo8Ot6bmRucju4Cw3tpcUK
	aDd4gLCLIZqV2vnB3UI46NRCxMEagQqJpwklflf/x6UqhBmAPGZEiGqXt3axbGCQ
	bpXC6nGeBRYuYBy0BOPtYqMe7KjpFHml2DB6+qqpcQrRMHzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuy803p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso5551340a91.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778530045; x=1779134845; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt0Wfud40//59YvB4eTabQhvDuaqsHejQA1eTNLDMFA=;
        b=NG/u8aRHN8IoWCfcII4g28NBUO74d67vkZGpW1jKozyBc/4DxbJb6Sf/RHyACM0SfW
         NNGgxpbbYBuoCS93NDme/uerfKUbTotqUEw3EVWs14t+2uRP7g4TWS/AqQaxXKwIYvZa
         uCrQkNlTfznrwdjWWQJZKynU5t4A7onNoGhAjB8YbMOi4eJNxEjFDVfacWWsGy63IzSg
         M9mYvz4hMBVqN3hw0ObI58vcWusEKfSNb87lHMbAqd5TUj3SRBTQ/Kce/1n0DxRy9mYu
         VF1A0x2WNk3FDxpN/l/UnlwDF9XrCIzLaSW/t0dcVAIMDsQeEIGwcifVAO61ah0FrgI8
         oMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530045; x=1779134845;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zt0Wfud40//59YvB4eTabQhvDuaqsHejQA1eTNLDMFA=;
        b=MaEhrqWvydHd/TiG8xMqQSYB9QKG8uFdgE6fnQx6oQFUbc0DJgdDHCTCv2A5rKmJb7
         9DT/NMI9nbirI1gwuEfTEJ2C/+xUXsNYb4tzxXwWUnirrs65Q76qroAKGxj5gsAnIwKZ
         n/wYG722tte3pOXyGpOU86x7DVfqBoGuIKYG9xqZMHsEhrxaLVhJHlhlKD3hj++6v5zg
         CRzHDCB1jeymtCRHEqkcmm2jwFjqCX905KEUdVA+FxDUsDO1mIuwqo4cR43R01jlscPi
         ryGUTgknDM/p723awfm1kUr6XerJU/acNe1GsuJkgtkFB4lUZ9hWVrclUHKZuANCR0/s
         bXbA==
X-Forwarded-Encrypted: i=1; AFNElJ+y1cGUGEaDDt99WpJMm/kiRGVlz+MnFG7gOkyPUFs/UDMHcPHOhK9EwsiQB08DVY/zEh4LQnIp8fn3@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPfh9rw8ZFjslSShgSLL7pn3ti8r6W0WgI8Q0b3dpeCOQV1hb
	d/PVjB151uu88lSYOd0B1em2WRvDfLEtuyV5RWVcYULXyKIHxnzsYwHOaJMOxiRoW1Q/dZ9MMFX
	Y9PupNbJ80gRmTQDhRH3rQ6UrZJaOijZgpLQsIXWrFZqSjpnXBkhJHSiFTfXKsgc3
X-Gm-Gg: Acq92OE3Zv9ZltuZBV+ifDwSPHwI/3htw62L8gVoNzMgzRuMaZsn6SpgmEnx/PYCz1U
	JN0LQR8aotTYkdyPGDMUUJSmexKmuNn+ITBil5AxV44O6t4FOowu8MDRez1xa1M7enLhvc/CNqk
	srWtnkQbhf6166rL9ffwy/OE3U4qdRsy6gtaC5c4Qs0mNJ0XSleeMKbsK46j8I6xz8E3Qu44Y46
	A8VrZ20NKzntr4jW5CLZKes+0bYPZdo5zB8IVM0zjgteUVys8COLxdDthk+GcTVERx5Xcl4WiX/
	D8+G7uQDZFwCkrsg8lDF+CsMFSz0hrLLcBTeESK+PFtSszV2jlVXdunAhm2FQ88zcx4adT443n+
	3+R6oySrFQVa8uy2ApCTO/f3WofyyP0c5a0AdFnyVbycheA==
X-Received: by 2002:a17:90b:3c06:b0:368:4a6f:28f8 with SMTP id 98e67ed59e1d1-368ab827fabmr720613a91.1.1778530045130;
        Mon, 11 May 2026 13:07:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3c06:b0:368:4a6f:28f8 with SMTP id 98e67ed59e1d1-368ab827fabmr720574a91.1.1778530044585;
        Mon, 11 May 2026 13:07:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b01ef884sm64911a91.5.2026.05.11.13.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:07:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Devicetree support for Glymur GPU
Date: Tue, 12 May 2026 01:36:58 +0530
Message-Id: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOI2AmoC/23PbWvDIBAH8K8SfD2LD9MtYYx9jzGCmksq1Niqk
 ZaS7z5jBoNub4S/x/3u7o4iBAsRdc0dBcg2Wj+XwJ8aZI5qngDboWTECJOEMYmn080tAU/nBQ8
 Jc96CIG2pSY1KzznAaK/V+/zac4DLUti0fyKtImDjnbOpa2a4JlzpZ062fgcxqjq0a972AiU/M
 3vnjOmH1Bs/j3bqM8OZY4KVMdAOlEh4YR8+xsNlUadtwqE872hb42hj8uFWr8y07rHjRDwclGk
 RGeUCNKVGyL9iBTP7RQShjwjbkJGyVy1EK7X+B1nX9RtvkDAifQEAAA==
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778530037; l=3130;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qNkWrZGsSDaD6GrYCTVs1LnnBLeedST67BI1LcY7DLg=;
 b=Qb1B/FRS3gBmWvmRgLXggX/mx3UROYPBmpSOSybuI+G+3XRieCnKXv1FpLxhqCiPAnmGZmPGs
 76O2dUM75BVDdsCuSLX2q56jfX33hxmdZw8AMf+H3g+6x4wBUWVzGiO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: neusFp-4FYXo9k42B9XWUc6m02RGFag2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIxMyBTYWx0ZWRfX+I2a8ZNrt96L
 B9LM2lqcj36fc4DN9HJxwT8wplPFBgu6Q6mNAt+b7dqzPTfYBmDy2jHF9/IDiJK+lOOdITUxymN
 7Re8cetARZasFHmyQpXpuveiZ1ABl9JK8hUFfp8A+zqZ9ac25FFdbOEYJSSPSfRG9HcKLg+GffP
 i+e996s/a0AmFBNdMXQeI+oSDWbduTCIJsKeg4eFFAUPRKczZRyppwPhTAcLcAMjLpAF29lY9Qz
 Twmmh8hS0zXun6dfIRs2fLV4pv/YOCOdO8e0L2P/G5fKTXTd3TZF8wHlaaiqh7VFPyHsywurP7j
 qdXs/se04qku15875ikSBif1HHNMV+UDkENzOlbzx9rVUNciZAZoqLjmUVPfUon7MZtzRevpZLk
 w8/suYDdnPZHu6fmGTcBXC3iqrsvrbMo45vHluaKTegYOjxCbcK+MZy9ZhmowAbFnUZ9zWEHA9D
 An0YOSqKRnfDIpMzzfQ==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a0236fe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-08r9DDlpfC4vgu8VQ8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: neusFp-4FYXo9k42B9XWUc6m02RGFag2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110213

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
Akhil P Oommen (4):
      drm/msm/a8xx: Fix RSCC offset
      dt-bindings: display/msm: gpu: Document Adreno X2-185
      dt-bindings: arm-smmu: Update the description for Glymur GPU SMMU
      arm64: dts: qcom: Add GPU support for Glymur

Rajendra Nayak (1):
      arm64: dts: qcom: glymur: Add GPU smmu node

 .../devicetree/bindings/display/msm/gpu.yaml       |  17 ++
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   4 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 221 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   7 +-
 4 files changed, 247 insertions(+), 2 deletions(-)
---
base-commit: c9bd03db3e792a99e9789fde20e91898e3a29e8a
change-id: 20260226-glymur-gpu-dt-339e5092606b
prerequisite-message-id: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
prerequisite-patch-id: f7ab29f2f0241b6536d3b0c0593f0baa0e435221
prerequisite-patch-id: 56c830b7718129323b006e492aed9822d7c30079

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

