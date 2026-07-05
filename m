Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB12F36897E
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239278; cv=none; b=oFB4lgmOnBg8epovSG/o1aC/H84152jZVxtBERX+Iw47MWn6bysLB5l7Ky4kNZAef+lYQfmS1BElgjzjgi2DSXQ7WaVPFfBJsxLPgxHGkv6tLi7h0UkxW4H3/UV0xNcM2w8jzsOjq97cxy+AxtRTYKPv4yo4NKxk9V0TMS8cFjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239278; c=relaxed/simple;
	bh=ze1VllbOqZnKEAM3Tp176IzqqLnZ/N83LBmJnq4dOkM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PRbG5+2f0A/NZPskBBxAcx29OSb0rQuFt95+Vg+P9+QNAwa5JcJakNFm6GeTVsFI/3mWFKNpXoJP8zD9mvtIZsGWaFqLWCgdXOeBJxj5PzpgDp+HdIBjoRbfyUPojYQtEzbAZIPFlk4XhWJfk7Y9N17Wf7l8grSF5oFBYpEjahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsFB6ywt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aljOA60z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsFB6ywt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aljOA60z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655H4jJ679559
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mmu9NS1f13WBdz/LPDqPCJ
	b63FFDMcYOR5yWaGxSv4I=; b=KsFB6ywt4epudRYYTWTMSQw8+mpUkjXrF+Lfvw
	QpVQMQhh7zKPQ+GD7fcYQF4MdsQGJwDBrZx0zZ96jaj/PvF2/hQov+NVHrybgudb
	th7LHRztP7xVnZ56IiCLaDuXkYDjDAUK9Afij97RvN+E2MF49DV2ENABIUHX7JBl
	tgK3JBHvr7RAc36R+Cs20MQH1ZV8MdvoRabm0JPmnBP+6Wc4xjnlaTf/oXJ5TD8f
	0wxIw6Jbgr7in4Mm7QWFdry8lwhmC9bI2iUlUEwFhFFStbtPP57hSrAUwa2pavhm
	UG+yFV0hVUEJCk4wMr/Xa0H7Pp/oC3xRtR5C6+PWlxM6rDsA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf826en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:14:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c354050c34so19938295ad.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239275; x=1783844075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mmu9NS1f13WBdz/LPDqPCJb63FFDMcYOR5yWaGxSv4I=;
        b=aljOA60zNUCOuYNdMqhbiUyNgk5p4l5Gu0eCEi+729Owq9esBTEjRmr5Sh34hWpMqB
         rojtisfPKQMbiEOLlN7r3NRgWpyuF7rsQ0iCaFHVWHQzky/ok4vGvx0pfmNnuLCXzkjP
         ayLbr4qobx+JlIQheC1r7aEM3BI60YK0m0gX55VCU02xWM14W84Pu/R1YxoYskCkkxTH
         XD9/X0oVg8ReyFS10SHPbdLapV87PlW+vGld0wwMvNRRBCBH5x8fPoN0jPL+etCwdyRH
         z774drCn11CDP0BvjlZaEn3efxOSzi6SqJBaym2frK+7EcRqwWc1nC+vQfutZbwRsLbC
         Exqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239275; x=1783844075;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mmu9NS1f13WBdz/LPDqPCJb63FFDMcYOR5yWaGxSv4I=;
        b=Y4bbJ/W3B2hzPJaqE5F5l7qjG9DmAu6/PqhBMcxj5WausP7OAuiMB40+VmQ+a1shDM
         3YaaJDuMPEi5mFdeaz/5I1O6jG1+FmBDxn8438opfPr7P5LjZKZlLeTH/OJvzTrG0GiZ
         AZPhYTJwGfmwHSzQe8ByKsviture033Ciq6+X/YHZWmc1gRsHfeGjtzORBh65IijRu2z
         nULkWzqYf86+8ICFvA0gjw0rb4SfUHRtr9r/92jhUeEn32giElAWzdhvmtM33dTR/49j
         ZVTgwpxjluEEQrP/WLKiRWLDkX4wtsSYQ29LjXwq2LqI9gY9oY3KAFDuGF/aMxxvFMAc
         7wnw==
X-Forwarded-Encrypted: i=1; AHgh+RoNWAB3340h5gUNf+fIINR2Wo4dDMhrz5Rk0133c/09PmChSNjA6i8osoW5891tT9px37aGcNOI/jXC@vger.kernel.org
X-Gm-Message-State: AOJu0YziAXWYv9wnOyS6mW66YoBfkCWtZmsDbFzAW13kwugQSNP8Xr66
	FModahjFjAx2BIRh1p8GQ9IOeV8V4cWWZs4dzT0UjwfVepnGi6fSC7NB9iusgVamc7vnR2yQ/rx
	s9Rtx06SySvlt9yFqNNc1fBeujy2UsWu9j/mdEWAs4MNbmJ79sXAekcauXFvfbnPY
X-Gm-Gg: AfdE7ck+9JP4Q7BTzbkldfOHrQdisXxw1qlVx3FPd0VlsGhXnQd7ePCrg289wI8KMqs
	uaUth+at9NOYhBgxGamv1tojL2P4Ept4Rv3F6Sz/B9emO5fn8QNfTH+WAkSIns6yesDVTTRvDRE
	xMwV69zrH08GMjOQx33xQE9K6Lmri56cV/5zDmbNVbP7VO0EMtDrMRcWntHIThEhzZccrJO7f/u
	kQKe6eJQiKvhSoNckfZmap3eD3ufg/p+iuJPreyYQ5mzCp7EmZ0iv4c0Xv85Ds+h/4jidrjwIxz
	Qs5VeNvBBZ6s1f4PzJxpYAoh8UaGzwHPBIvMg8GWwoLMb46cunFJ4iEa56QIp4DI3F7F80YM2RQ
	g+P7f5THsXJAyK+vLOlf8U/cSgzChBes1LI0=
X-Received: by 2002:a17:903:2cd:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2cbb9eeb474mr55795845ad.42.1783239275127;
        Sun, 05 Jul 2026 01:14:35 -0700 (PDT)
X-Received: by 2002:a17:903:2cd:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2cbb9eeb474mr55795445ad.42.1783239274618;
        Sun, 05 Jul 2026 01:14:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:14:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/8] drm/msm: Support for Eliza GPU
Date: Sun, 05 Jul 2026 13:44:15 +0530
Message-Id: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgSSmoC/y2NaQqDMBBGryL53ZFobUQppfcoInEcbcC4JCpS8
 e6NCwwDb5b3rcySUWRZ6q3M0Kys6loHwc1j+JVtTaBKxyzkoeAxj4Aa9ZNQ9xMQYhUkkcDijsz
 d94YqtRyuT3ayoWFyyvEcskJaAuy0VmPqtbSMcGnD/V+TtfIITL3nsRA8geKKzLXOEfNZgCsOQ
 VxWPKFHEnF8d9b6wySbXe279mLZtv0BUyuNi9sAAAA=
X-Change-ID: 20260704-eliza-gpu-eccf1946cb3c
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=2808;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ze1VllbOqZnKEAM3Tp176IzqqLnZ/N83LBmJnq4dOkM=;
 b=9a9GOk9tVX4B1OGU6WAqIUkEf1RpZhendeSNrLU98rnIfNAxFU45RsIYy6SGBU1u/wg9t8oic
 STHhe5reKfWAdXRtit78WKmncVmmgtFAsoHhpnTcMDyGfm8Scoe32zi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: kZPiOC0BPZyKIIh6IqpNUDm8TIP-7WTL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX/CcobFlZ9YNn
 vbmkNAOTLmJosXRmW/mO3G/TmPrrFm+Sd2D+AVXl5WrVGVOJ71UPOBJr/vjpLMpcPcgYdnKgEBw
 lVvl27YQgUxq4C2Fok5ZXP2tvN1ipYQ=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4a126b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bIsOEyWjDz43KqZfDzYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: kZPiOC0BPZyKIIh6IqpNUDm8TIP-7WTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX1gdVRlsDyOJi
 07El/31fGo725XuCFO1sfR+wYxZiEM3DFxX3+e+SukLE/VdnLbh3JVO/YbMoW4XDJpKUiWo803O
 qHWDXOvXpYwzn9ZO+H9Xkfj4j0b+yD2qbX+ea3lk/Rul5RnciMDEIsDmZD3Y3bAX2LGRnquLI/W
 Mw85GIlB2lNOzySP6+JcU3qvTWLxB3fqY7XdcuSgX4mwU/fu8G7SM17eXUjraDFSK3yN9mfyDlL
 AIcW8cGZeLxtYj5FtUGh7ejo66NcAVzMQDZHBGxobBc3rJY5XvTVwKNbc8FO3ZB07/Pp5j2Ir6X
 j7A3utZzAlScfSKVCD3Qb6g2TBFeH2yeoQpfT6gAQGubmQmkAMFZ5bQmtJGXm5lagViugsOpbrl
 WNkwm7IWus3jb5Q2wAH8d1SXhYGdu5s06zfzRSjfCLy8B9gcnjNW0n6l+9NoStmW9uYdRemSEvu
 fsHzs67TMRVtMGLD5RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082

Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include smaller cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

The first few patches that updates driver and dt binding docs are for
Rob Clark and the remaining devicetree bits are for Bjorn to pick up.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Abel Vesa (1):
      arm64: dts: qcom: eliza: Add GPU SMMU node

Akhil P Oommen (2):
      drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX- variant register
      dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC

Puranam V G Tejaswi (5):
      drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in a730_hwcg
      drm/msm/a6xx: Add Adreno 722 support
      dt-bindings: display/msm: Document Adreno 722 GPU and GMU
      arm64: dts: qcom: eliza: Add GPU nodes
      arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   2 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |   8 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 190 +++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  38 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  81 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   5 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   2 +-
 .../gpu/drm/msm/adreno/adreno_gen7_17_0_snapshot.h | 428 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   2 +-
 14 files changed, 756 insertions(+), 28 deletions(-)
---
base-commit: a9498e40e3e314ade387d3ab0d5cb14f0f3aa1ad
change-id: 20260704-eliza-gpu-eccf1946cb3c
prerequisite-message-id: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
prerequisite-patch-id: ecae5e45a33a79ec3f500e3f318e3a0129fddfb7
prerequisite-patch-id: 19fe32e5af810250eef42dab488c982ef70c055c
prerequisite-patch-id: 60dde5421adbc86f355b4899bedd0d7a1a0c4e5e
prerequisite-patch-id: 58c9dbb18795c662ea22c3a82b07d6465f604e08
prerequisite-patch-id: 0c6e220ecf2b42776f990ea5b98ba4ee97d229ee
prerequisite-patch-id: 0e0bed1091d12c102e2542b1c2931f61a543f2b0
prerequisite-patch-id: c0f22b4ff0bb79935848dde50c524f6063011ebb

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

