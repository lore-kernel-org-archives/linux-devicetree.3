Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE79A3C81AA
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444761; cv=none; b=EGTVBF7X2lRDI9lZ9gAcl0FyoLIDWG3V6CYstmZSax3HSncpboUgPS7tPJbaEgUSc5ouqMMgbGRYcVdtAebbnEldB/KX5ERcoQMoV217M7m6Z80kE8FXsAve6pDRVje9CpKEaj7FytiYI9jPnWwI6vi8aW0hMkCYfCkHGhcQX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444761; c=relaxed/simple;
	bh=obY0yd9A9w1nKiCc00V/sWC5PfbbK/PzpgmtQExUcNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sScCYcf8GiY4ZRw/etF/gPwzzyE4RBnMNSN+OpfC3gyzZlb1AEbuGL1kx2dX8ghGgTgBeOK3qwtogMMcBtM6F6j6D/efETQj07Q5xLhxdbs+5Vvl1J3ap/uzs8SgsquQA15gaivqekSyGLhcJqNz8wTUSrwjX6sQWvwIhtH7Z3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVtlyU7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMR40jmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVtlyU7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMR40jmR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8gdmX399382
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=; b=aVtlyU7mQF+q/O1S
	1s04tHwI4DI6ylk6EAp4BO2qHva42VLz1V/Ejlq087p3/nTCbuE92byMZnA9fylV
	nu1j9+YacCsHELOvlfxUb03c44tZe4gRbhK+3oN7aTXp4hZ7itJXKvJPUWmhj3pi
	1U5QEDSzgCsWndExIMmkqkguioaXwwVJIBEvTxO5SvnUIJQJ7qKNSh2OQhYKmyNA
	24LvgUwTqVlOsGEHoLrk/dBU30/GH2XF4QHYcjE0RpgA3I6gM59AIEPo8ZglKWF5
	RaT2uikmyaW+TKHiNjBdbXS1IoyewaMCSuPar7om/Zn3fZ6fhIGyW6cptlQv3Igk
	0ZuU/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9utnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bdaf8567f3so50953565ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444758; x=1780049558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=MMR40jmRce7Zqq7WG9AyYq2Z9ZjkjyH0qi40ixhLXEI+gk01Of5SMbhxYyXO94hhv6
         zKszjARy/pD4P0mfSiLPhThM0Am2qi44CNcI92ndcp92p7WrUWowvKHCZo8Teypi3xko
         NxC2wMPMFYKxOhA9yb0/LJf/ZhlOjH2jP+GJTl2785m43OJhbLn9tvJbz+Ucxwdy2aTU
         pUgqG4X/loIkxPbOkWDGjPAOJUMtAStBrgiY0S6cbxKeTWtLqaoIpy5AMLo/hlCyDZjv
         i/uwhNvvePgNBlucKi6NtZTolyOBzE4sTgnyHM2pH3JwijMJFEpAmW/Ya/SLgST7IK5u
         inMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444758; x=1780049558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=KlYlStnu3VYcSs5LQyv3nmJdyE+4Dxwr+WVj+yHP57/gTqkOqpegWMO4Nvsx5t7ttj
         fjnlKpT3rMWD32U/xIKXYIZKE0fG3SU8DOLA6VLjVMI1+iYsSAxf77BjZBkSK9KA5aUA
         QGxrUguN6iAdrQ6KymY87wGTpIkr38IoB7qyTDS1dH5fukOMMDoFL/icR9654hMF+mYF
         NpIh1I7tCUr7ZejxUBJBrm0t/awvrLH61TWCLVOAzs5Q8yaxXTyXkqy/EqkRdbANOZrM
         P9k5H47TtrMhN1J3f7iHQtK3kG4gdJz68dp37ocmbJmZRLa1OZ3eWwozRmobtp1F071V
         IKpw==
X-Forwarded-Encrypted: i=1; AFNElJ+SVEdXkTvdjd/pG7eOTW+gb9jRqxdEB3O0hfE9mtEVVj0Me/FWE1WIZqkDtDLhZ8YOFKAGhiinOABU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5obymq9SUkeDhMd1S33dhelsg0ZGt2k/CXgjITBkoq0s29m3S
	btqCfahJNoR0sxOSlYqkUKGj6BEXG1bE4em9WFqHMSAotEne4DFGLV4p9vKdhwHVOfO69z7Srnd
	zJI1rL7gW9y4Tr2h9BuINUst1LumRLhCtvmlKJtjmGxMd8mF8fmS2Faf01xT0xgAu
X-Gm-Gg: Acq92OGcwcoYc7cc2HDtJSPkjQQaiq+VaJ1JrgqDyidItbOJgkzwIbPIV/s5MbtMyoC
	PXdA8Y2zG3YQnlUaJ7WuOU/KPDFfll5Bx4po+zkKLqynCk5e+twTTOEvublfJF2c/PPXB+PF+DR
	ijeZ7iSAidK4oM2cdp+pgDY4GJ2gbIQgUxYNFzZ1TyCKLjNjbw5cOspDOibJgsVOfrl7qJA+DdX
	vdwqp2vRxNacLa2ZlB9IylrwODT2iReNo/iXq3SnC3Kml7E5FN5p8lrbBxfs48jVL2hMbqjuY4i
	jVAaiIR2nN4I54PmUIG8BEQKlKqzGUlqLqQN4dBZ4mR9NjcopXSTXc3MUlqotGUCCYzVgRadkU9
	9B1PphQn3dgLuCyh1mDz4l7PBfs50oD0G64i4Sw3woEgeBQ==
X-Received: by 2002:a17:902:da48:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2bea22b759amr66987695ad.20.1779444758363;
        Fri, 22 May 2026 03:12:38 -0700 (PDT)
X-Received: by 2002:a17:902:da48:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2bea22b759amr66987095ad.20.1779444757875;
        Fri, 22 May 2026 03:12:37 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:41:57 +0530
Subject: [PATCH v5 1/5] drm/msm/a8xx: Fix RSCC offset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-1-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
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
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=1052;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=obY0yd9A9w1nKiCc00V/sWC5PfbbK/PzpgmtQExUcNY=;
 b=pdp64ebXg5HPwlKwhpGKdCt4wHbjegnmKMSMu4DM25HTq8+oXTKxhTVqzHseUN+lTBUiptQH4
 KmSKIH80NuvCyqgY5lRGeS7K/Ol9xitlYW+htTssbvNc4sWExXaTNX2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a102c17 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4MPhRinBehVJTi7DQIkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: pHTEgBf8RoT8hE0rvkiSEsBz_9bsaIvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfX3vNvDdau7qri
 gIZvaQWy8PhaxQaQ+kuJMFp24nsW9aqw27ou6FRyKiRjXLDsZyoaa21CP378qlconGcu305Zv+G
 d7oxyeqkEQT7MA8gpLpuVdMe4ZLjzC4YKj5Ke4vB8ZEA6ty3RnrCvN1XN0tW2CQQRCdGCALdaI7
 DmK9AVfga+TG+LSYrA+og84+S8ZgLoU85JT7E38tOQQ8GQiDnXWi6SHfOWHr5T/8Wq2/TEuVlaS
 43yDqULi3iAv/qIOR+sjClWLEMgfWtfnytV4ylZ/JsXy79mH8dv2Tfv9kA1Ot4Pu3I0CjgGz2GP
 +xOZs0ihJxLT+VrDSIjsMIdLfLMagIItBPsdtrCiuMMsunjQpGyvD/zMJ9dQa+81zXjE+2qSDz8
 3Rht7JF9EbVG9z8j320fQFOnZrtC9qK575sQMPDJrA3QECxYojkT+WQ4sBwbRrTEFEQXofntIr1
 +f0usZQPR8x8ZVbMy2Q==
X-Proofpoint-ORIG-GUID: pHTEgBf8RoT8hE0rvkiSEsBz_9bsaIvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220101

In A8xx, the RSCC block is part of GPU's register space. Update the
virtual base address of rscc to point to the correct address.

Fixes: 50e8a557d8d3 ("drm/msm/a8xx: Add support for A8x GMU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad8..cab4c46c6cf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2357,7 +2357,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			goto err_mmio;
 		}
 	} else if (adreno_is_a8xx(adreno_gpu)) {
-		gmu->rscc = gmu->mmio + 0x19000;
+		/*
+		 * On a8xx , RSCC lives at GPU base + 0x50000, which falls
+		 * inside the GPU's kgsl_3d0_reg_memory range rather than the
+		 * GMU's.
+		 */
+		gmu->rscc = gpu->mmio + 0x50000;
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
 	}

-- 
2.51.0

