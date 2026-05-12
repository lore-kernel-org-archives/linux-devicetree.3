Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1434372046
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 19:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613721; cv=none; b=W78RMtH481JFYv+DuQbl0JYVR9evOyNp0RXqe8ySMxtSGzzpWisWBdUs+96rXCxSjC4TkS3bvzr0niwkJHurcb+JCILCNkeF1bn67RdTJrhWio5RcykodSWSI38smTKw8YXbZXS3BAQEvlIQPLwWp9c2YpzHd0KEWvbFc/PVsi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613721; c=relaxed/simple;
	bh=obY0yd9A9w1nKiCc00V/sWC5PfbbK/PzpgmtQExUcNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnOkTm+yJBjq/kQwgpMzVhQMjuxeVGre2CW4sb4rDdg3NrDFAv4C34ywNrxENCYOjBYAZnBl3wucyhlnHcG19IFgYgPnvRTtFYJU3D/3IQYDKNkebt6cbb4B2OgWeqPczeVWnAtpADuAYtQflGosnphmOp2vzGLvYz5Z+ijAmN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQ1PfBqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKeq/u3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQ1PfBqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKeq/u3M"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CIsJgq1059711
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 19:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=; b=fQ1PfBqWK4vDsgBm
	ASJFjwaLyIafukD8fECkcArllj+7wqOucIOdTZ9SaHXQVZhlxRgPKS3VZPkjdY13
	TieageF+GcI+pm7PH9pyulrrEyjtlzGB8hR9kb2lFK/WT0cvDoL4oi+zFvfXI6x1
	nr9HF9FtBP/q2pS8EMRbRCY8n2mqRj7FspPVyu8CdA9ONWKr+C2VBYTAxA9VCAvm
	hKNfIx5wS5SM2nqdpXQYGxviuDrsq8DNd/szkUj7vF/YgFavfaiPn/YVswi6vS/f
	e2kIR3rbu675gKQ4zKSwNp4NuRItafeSs4id9H9HXWoskC7B+BOKE4vitb9rWyWx
	0JTlKA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vx82ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 19:21:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8294d8c48eso1502443a12.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613717; x=1779218517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=MKeq/u3MGrSIb28sFqDk2MWHsfsPRIeQazW4RtZRnheK7IfWSM/uxShtWaTn2pJahG
         iKe1p1T23EMMJhCMPUqczglf7Mu26O6/bIvnmqgT2XvGFQpbqlsFFAkOyZE2f15tfTwZ
         5q1c5qD0rbdLBOV+RHjgV64ymVJVeW3DfQxnBgJ4gqOD/WemZ/UyPpJ3poIgMYoXv2Q1
         iO1IBPHrb/g3/bne7U77J0A4KmOowfjSWpzLrnOb5HvZnOTr4cnHtsfWWUdTyBjvwnug
         FbmfUiMLXrg9rNujWkf1tlraBAtCv4C7nGs55iX8PX9MyOVFADzQ/IBZT53VIUA+dwI5
         Gwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613717; x=1779218517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=BDnUcGAgvVH8mbNVo4MDZKU8EzS4Gn389lkH6Xcxv8rqh/zq3bddd/PlyKp/IWCguA
         E5Bo85mLnw9GqMgbHdMNQTs4PnwaUHYJL4B+jGYDKzyZEgSYcx8feFxWu1kKr9TFzBMa
         H1whbj/xbxJPMVvj76XRBFsIwYps+IeMUVBNK1jIQ0TDberRmhQnxm3vJ46tIgMRXcGA
         ornuvZxPIkv47jaWrHy64lXkYShfVWg53yIu1QHUsMoBd98tJVfTOQRA66O133K+wmox
         +tyC8h9AgJR1dJYEuvtpf72CpG58lLwj6JpSenruhhsLPH/RjwkH1s3XyF86w+VGgV3H
         pWNA==
X-Forwarded-Encrypted: i=1; AFNElJ/CIh/IMx1dCTbuBwS4viPMk2+YlH3LgIGOH2SwM0+TgvAGbJ7JTjvxWLL+lnemaje58vgSJB0PTYIC@vger.kernel.org
X-Gm-Message-State: AOJu0YwdkK/W/ARW0wzOBvg1Guuu3LGsJKI9DOfCoNyoASCOtLgiNtHU
	ba0GT935XrtsnHnmuRuhRS+tYqorEhk4DfGSzAKIeZO4BWowS8Ox3Wl8hnx2HBfHKx2Xz9a63UQ
	q3XdCD3tBW4GRmTncvj6F7v57+oSTUv4ift/ZE+TkBlIIvapk/fvy9z1o7IrTv7Ka
X-Gm-Gg: Acq92OGUW2CXoE+llMxZFoiROtjNO/zEHrlebRNHVBNud9u3/7uLcmGHZPGKuGaeU6q
	bDEXy09Ai8i5uHA+rqSn7Ddn24460NnkvNSVXHc+ish6faCLJu/rzsXTx6n63GGdvU5K07wj0Pj
	9d8nvPytK6xQSV1qXnRDt+21MWQ8WaFLeGUJZ9ipu7c9s4uh0Jt/EWVwjsetiiyWHJQOZFLKisk
	NGU9Ey96g6a8amIFNpmigaOjpvzLe8BsDqULR/rd0V8a1bGgKT5KovXNNqZYdubwSV8/K+LH4l7
	OsHpFvCs4bHf0BI8rPQzr4zIb7Iqo2Swt3Wi7+jabHXjZgGI2iOnsZBY8euKY1vm+MRw0mH42RA
	KA7PcNVifhq2Dx2CjgIGkKKyzRstvKQVinmsOfFSyPP4Gzw==
X-Received: by 2002:a17:902:768c:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2bd27133a91mr2513885ad.8.1778613717163;
        Tue, 12 May 2026 12:21:57 -0700 (PDT)
X-Received: by 2002:a17:902:768c:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2bd27133a91mr2513465ad.8.1778613716644;
        Tue, 12 May 2026 12:21:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:21:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:18 +0530
Subject: [PATCH v4 1/6] drm/msm/a8xx: Fix RSCC offset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-glymur-gpu-dt-v4-1-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=1052;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=obY0yd9A9w1nKiCc00V/sWC5PfbbK/PzpgmtQExUcNY=;
 b=WFrdXoJxRMyXFTXXynT+vDwKDHONIdU5yJw6WcZBGk2wkEkuw18xTJtD0Ah268ZR+tV/3Pzjv
 W3m23loJVEvBmUzKN29QDTNc5Dv9Uv0e4liGaVXV1DuPDjaagm7KW4i
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: -8iqFdVsHN_N_xz4tDzFBHrlYKWnPvYB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfX8FyKNssT87kW
 9s2bWnDoajDMoaEwNWmMrSGBWSQcvEi/P2+wHhKsmjsgLP93uItR/bN55RZcYapBjqLbS8Wa2hO
 zsZvmzgE+6ySTuVmDX9ZlU2i0yH9Yf402fzfSks3Qw8ekfqc8+98l71bePOX1wVo4nRHGOtVX3c
 gpdpcIl3iB1fvbHHrnPKeGMms+QKg0q/L3gihBuaeZ+zCAfgQdczvW4Hr9e4LjHZVGemwB6QOYY
 APBYJtaxSaR8MjlKCxP9RkQ+1CaWZr02XXNH4pCDPvn2L10wbBfkQ1DYuMJYRyxXSKJ3EaICOWE
 NUGbHLiQr/CZM4tJkZjltBFtd5TOq3oqr2P8U06q0kGDtr9AFQsum63gDVF4eOJYtDd0t8bZFrD
 Sq5FaNay+vslZf+5jZyONdB+ww6hl/FIr+0Rz6nULbxy/bOqwyy5h4Fl61llKUzuwSVSjV9d4HN
 scw1sL8zlgAfAAFy3Vg==
X-Proofpoint-GUID: -8iqFdVsHN_N_xz4tDzFBHrlYKWnPvYB
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a037dd6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4MPhRinBehVJTi7DQIkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200

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

