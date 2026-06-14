Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777F223C4E9
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781472794; cv=none; b=JyQFNzJ5bGlwjLuExFKLa464pt5zS0iehvyfLuzMWFMZKJqESrdeGLX+/zqDO/owb2W+yMa6tu2w/AgAoKyQ0FLg5uWu917KsxMtnDzhNC3FYdBGXGNpW7nDiXlkbTzvEUUVkhCrRMG1lg1vugNaBAB1y48UxhCh6VHDU33cWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781472794; c=relaxed/simple;
	bh=XhaeUKD8ec4SllC82vt0xlcd0hBy+SDeLmBke9XzXRk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GbtGi0vZWXJ15Fl/bOuTvfDg9YtBXCD2DljGD3nQqPAbERyRlYvw+NjrxfsiU8ftg+ha+w3Axn++255xTC24EMLA3nthxKUNQGYNMg5K6MPGtkaBg3w+8kCQs5Wek3ouWkZNpwJb+RT9XBv3/sJJliKRGK5QBTw2ZJ/w2gMDt6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+RhBxCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aV+Pl9Vr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+RhBxCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aV+Pl9Vr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELEamI2694677
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bur06zKcsSYkJsUBV4uhT7
	g5E5SB6XYFrjgclNHkfuY=; b=Z+RhBxCFxckpOJbV1njc6mIp0E4/+fGHcovYc+
	K3FPG6MVBZxPsFHAwB8EJ/NY/Ky1PbWuQPNQXJiqU/+DOZZnV/knvzJrJdiECK2s
	OUg4rE3GQEtwVizx9/w7UrQo7TzfY2R6atbIbTwrnsarPn7Pa5Ovi04FM76NhdIF
	6PbAkPSYB/xYJZXVfCgoyWiEpyzVmn6tYzgjXZPdZlOH0jhFr6q1xdxDMe43hNet
	dUZyflkZ7YjuvkPU4rK5dsqRb18g3RvSo2FRvV7UdMubLiX465/Dn4Eu1WyW8Rmq
	XEMnGonf1qNYv2kkBLgiHhhp737uIvntI/Ipqy6R/UHrobZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gvme7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:33:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso72836025ad.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472790; x=1782077590; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bur06zKcsSYkJsUBV4uhT7g5E5SB6XYFrjgclNHkfuY=;
        b=aV+Pl9Vr1h3Yn+uhdeyKdt9w8CvpAjUpnq16bHC1h0BbBY4LxMQIZP9RPGjxmRfOgG
         letck6hRHkQyERfI0WrmFuYggXWU2WoA7bZVB/CEr2EQGMZwFMlIRV0XuUzNx+vRErZd
         EF7dTfxLK0FSuVwNbE0M4QDnXw2rkq1YV4F9/NWHb4WuKi1fQGvey6T7Ks6HkPxrddwu
         R2sws9EjmqFicSZ/AE0O1A2gIYiOPtqCRVRGMpF/rYzSS9PwqyXsAQf2y7+GhSOphCN5
         93c9RNH6uEAzyGpxUQZqYbKByGtEbzmGBSFQj4AbTPqQqvilPEB0/7smQ1L3xEhE3bvq
         JDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472790; x=1782077590;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bur06zKcsSYkJsUBV4uhT7g5E5SB6XYFrjgclNHkfuY=;
        b=P/xNj+FPVxaCcQeN4dVkS1niwESkTt0WyJ1UKcPnfqEZlhG7tXO+37moPghAmAH0UW
         DiBTTybnbKrJ5iM5keEqLD00Zx88xV9eFTUcal8GbglJX/C3hoMZNEI/DZ3usOaPAveU
         7BU/p/I0hgugJcxyjCy6vvJcpSnb5Dlf/negcAt2+3oSWyqdyZn+BEfopSgK2M7i2+qO
         879AS2aFFohsiMWpbWkF/qnB51swvt5MjfupIdlYhZqT9kA7l1stiasc8BXICA+RjDzn
         SmmrV+Ech2/qa4wmh1tiz2RiyGgNy+kU/37QbsXeUsyUp+OBCQI3mpxt9rCvudiO4q8M
         QrWA==
X-Forwarded-Encrypted: i=1; AFNElJ+q5ntCqqXhV5BfMj000zr2SgS1kVDFDxn3TGwYWF2ZG4bWMxP0NXTeyqtmLCsuiAqCx8ncbM8FIMWb@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwVxlpz/n9jy/pDI7nzm7zo9czFns2jh5S9GIxKTF1RAFgysD
	T2VmyIp4nXAv0l97U9xyHAqJr2ECNmYPxKNQwc1fjeLYAtmkgQt97ReIRusBIColNyxglDqh3O3
	B5PgljFYMJJB63jpM2j9SVqvohAik8wP1CfHAV0Nk3DLd7vUCgfJH5C+vji08gw2/
X-Gm-Gg: Acq92OHc7jVrqDKnAoYiTYRP/KIGNb6QF6WoWPkrKHRB9KLG3Ppng33idHegD4DMRK9
	rJPwrL7QPqLMv8Of3oLV6iGwdOfznFdSbLY9qwurhizoSWhrEv1rRIhPP4fQY9QEmOBsI9uGycd
	O8Ihq34czgOgS1MIslOHJxJ8Bh2noHOVGPKa9exJMH+Vq3TxHhSSBufaXGEtMDtSU0VcKJeS9x8
	UqfPvTmRrxitCeOAG0QWjv3VHd2ze0/biReqmO9Hfyv4zSjNw58BjnyFSrUUWJHscbQT1YVqLeR
	GC/e63ht+X7u9+tDZ3RKLovrAasYU08PqSha54iPSf5/6o0QnwfK+fyfXvfuggvfDKppziHa2+e
	TpFne+94q0vn9fPAmpDj6fWJqxT7fZAf/0Hj25C202vkNkg==
X-Received: by 2002:a17:902:c941:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c4109ecfbamr130763575ad.7.1781472790201;
        Sun, 14 Jun 2026 14:33:10 -0700 (PDT)
X-Received: by 2002:a17:902:c941:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c4109ecfbamr130763165ad.7.1781472789777;
        Sun, 14 Jun 2026 14:33:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm78385815ad.21.2026.06.14.14.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:33:08 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm: Add support for Shikra GPU (A704)
Date: Mon, 15 Jun 2026 03:02:56 +0530
Message-Id: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgeL2oC/22OMQ6DMAxFr4I81yhJCxWdeo+KIYCBqIVAHBAV4
 u4NsHax9Cz/578CkzPE8IhWcDQbNrYPoC4RlK3uG0JTBQYlVCpSkSG35u00NsOEye2qiop0Leo
 7hMDgqDbLIXvlgVvD3rrv4Z7lvv2rmSUKzCpBIit1IWXytMzxOOlPabsuDgPy7dQ7GqdQ0Z8/o
 NBMuB8Z/4h6WjyefqlCYvsBCVDfttwAAAA=
X-Change-ID: 20260609-shikra-gpu-5432bdeaf0f7
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781472781; l=1310;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XhaeUKD8ec4SllC82vt0xlcd0hBy+SDeLmBke9XzXRk=;
 b=ivyhD3XZRXduZdfDnTiKOjDQ59HNYEZ7GA0ltWYmT+EzWj6f47wF+hZ4wLfkRqiJC/Tx6fMpp
 zKINriZeE9UAw4pN32kSFUX/mmaWRexd0I7ddS8cJ00O4Hv2Zb9G2a6
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX/q1rx5Z59Q3f
 HH4Uhy1oRtKDx80rmdSOUfJob57JiaAuHCeQI6xcRW8J3yYlzwonuD1zehaqHQPp2IIYymK5o5D
 zW+UI5SgVBG3pdj1Tv5T3ngB+mfgL5U=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2f1e17 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vtaXLjJ3spEbOLdMN1IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX4KDXdFJLA4C3
 U5NzSJDuCKXklW20xWDvYcsh4j0bz6SrmjbdZp7VHE7uJmy3rEMEsjJmKYHfn6mJ3QzT39rJ6YA
 iV3JCSjiP8E7rnum8I64of66Doi2RAeEATyAmU59/kL7o1da+a828U0PFGE0ZFtyyJaERR0wR0T
 KJDYk+0atEyesgFTcoA6kFXbYbWqq024Gzt+RxSDFifUFJ8noGIC9rYp4SF9fAubDcl0pb4i8B9
 QETAUtkZX0kcpvVaovjGfyk4dUV3tF/2zji3F2rBAPcPkP5r3QnXbhMVlcGB4Ud22l3462QXvWH
 h5dkwLGzA6MLu9w3wtjsj/P+hK+Wn5H2i8SIVSvfZiHTtN5uL5kYgE7qtD0JziQSOjGKGY5/AHH
 iVVIdFFH0uQIMqWaZAyFUBiD95NuiQgHLDktavSeUplULyNY2YuHz/0y9FnLlWlUCnaWReh2Rkn
 tMYnF7wJo45zG7YopFA==
X-Proofpoint-GUID: 7K8W_IvWpPy-i4n10xQRHnXTKO7Fw50J
X-Proofpoint-ORIG-GUID: 7K8W_IvWpPy-i4n10xQRHnXTKO7Fw50J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140229

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very 
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Mesa side support is already merged:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41762

The dependencies for the devicetree patches are still on the mailing
lists. So I will send that separately.

-Akhil.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Add a new patch to document the GPU SMMU bindings
- Capture trailers
- Link to v1: https://lore.kernel.org/r/20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com

---
Aditya Sherawat (2):
      dt-bindings: display/msm/gpu: Add support for A704 GPU
      drm/msm/adreno: Add support for A704 GPU

Bibek Kumar Patro (1):
      dt-bindings: arm-smmu: Document GPU SMMU for Shikra SoC

 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml  | 2 ++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c              | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 61087e3a8490908a65da4e2d33fb5de6eb888982
change-id: 20260609-shikra-gpu-5432bdeaf0f7

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

