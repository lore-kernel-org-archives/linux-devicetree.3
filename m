Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46753101B2
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902119; cv=none; b=Wiyq6TA79eu4kaymhMyXTTfGOleljdHBK/U29JSs3JQpG1ZV4OJ+ZmUanXOlNw0xsh4SWEn45FvF+VVYUjJPXGm3SUuuMzRvOO6qWLzOuAF/o+XRk6QwqHAqavXrgu+pTqtyIXuOnV6Shfo9DXPByO/SGk0KnbJ+PTYGyJOSmzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902119; c=relaxed/simple;
	bh=qoPjmohCj+qt+VnuKdYhqh4uHy1Ot3eveLLAi8iChK8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GptfjEp3vsp9f7vivjhor3kGKjUNOupXzgp6IYc4t/EXEbDBGOwuA5A7OZXyt+xB5KPLVtcKHwKg1rrX6bX7dHbhfIh+zpyjdJVjHcMj7DZ4AcVqT42IWSP2a3gkE88Qoe8ysucte4nym3T2JTR/D9y0hxyguHmV0Ofrrtb/QVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dq1qXWvz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8m4WycE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dq1qXWvz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8m4WycE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Qrh42771589
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 07:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GQJ43BCxRXT3sj0FEby1LK
	Vsqp3NgRy9qYHkeoXHJ+Q=; b=dq1qXWvzVvalAJasL/vbP2x5I769P5VN64Yb6G
	R9SCxURObCDupJhqTu9kS1BN+F6oqm0jOtLrGAQ/edcecX6v0q3EYKsMZoMcwCcT
	o5w/ttOlT1hQq6RwUWTeGQrEGY+JtYnKFlpr8bw7GX8Mvs6a3jQtN08QxggxQbum
	qRG8C85BDtIKMEj/vh/mdTz6H27vgGuu5iHwLKT6JASWtbyVYDQThDw2ftgGazjm
	z/Xe5M7I6OgKbXzytR0zR1xY4HLawoqsEy1OI3kelQv0XOl4PIVWfrszgq9+E4Kb
	OW5Imw+NvANpY8vtugmqUGIer8iB64ABptv6gSh1MSi7LzqA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6easy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:01:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2747479a12.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 00:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780902116; x=1781506916; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQJ43BCxRXT3sj0FEby1LKVsqp3NgRy9qYHkeoXHJ+Q=;
        b=C8m4WycEEmUdkjVAv6ggUKD1n1/XQ91ZQLI3tApIV8sf2BxcNHzze+0CegK7uvJJvO
         kjzSiKKrdfi/oEy4WCc8AensPgIg/l/+6MnM2u/jI2XGFWh+ylAr4Jhew22bDmJG4pKm
         QSJOH8FAg8akyBjVx/Srnllc7VfHyRSRhG6LCuwRzYdCtx/VkEFtoo3ne6qoDEXNeYgA
         360gACXez+YwbwomQuq+q4849yQoV9+kkUvEQWBb7Np2miKdonGN8XZyoHNg/LelTaD+
         PQFZORSCyBjS2MD6RAMNg3BqSFUlqEdDQuM+9H8DcfNmZi92RUWKx3e7pthfVIU8agkq
         1x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902116; x=1781506916;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQJ43BCxRXT3sj0FEby1LKVsqp3NgRy9qYHkeoXHJ+Q=;
        b=dGRUeb7OjjTHgcu5jge3uF4JHQi+G/FcklRPjUkmheHpAL3FWQFWt0MTMKe9KX7qI/
         andJNs7F28b6tbJxWWyv+e5PnZ4dsdBpdXeyCMRAYViWKxHvrJ18r1co9LlB3RVQ/0F7
         QMaUkikfQT9RqlbOEXlB5wUcm0kPjAmhWP8OcGFG0aNDitVBtogiQyrhRjxQz9QmkG6X
         SiTIxEOjIOl81HE++PF8TMTfN2SGu/HVPoQjLXhvrbdZBgSmat8cNP51z7LbFPkfv2tI
         cHn4yk3TLpFOH37A2ie3HsC23yHwtVpUSXXmEDUFtCMtHxWWeCEeNM9roek+cg+MBJNt
         1tKw==
X-Forwarded-Encrypted: i=1; AFNElJ8mtkOdUyQ5QgX0NUFg5Qg3iimOxh5pzE2Xt/Fq1hYTVSlvn6UZp+gC4QicaAizn7dEKVIg1tG873RT@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPvE+QMqNiPIZF1dLhqFnlFgi6CzQkOwuW8D0uAOKC05tFPvj
	reHhuBzJs+BhUxs2krxm/12TulGWQu/r1KOq4gvIjTZBWpJ09RwLxAXiNFjnRHNic/XG5taQMs2
	baMr7OdEHjePgIUQ3C2qqs/uokomkYoY5Tt3J1kTSmFIcfwvAroxwStlfF6lzkHo3
X-Gm-Gg: Acq92OFb9vKMf40OTIYilCoyaEszhHPeG71W8S6Fma/wYe30ctMrkGtlnIXpivWjuYd
	+bjX4WtVpTZjpFuqWrqIOhFpwF219Rmt3WAXKH+8xrKyi0p1UrvFKmGiG/hHlKG0vnseqoS618S
	HOkvr3Di7mC7pjapZbOMLEVtdggJeI7FqwKreEV43p4X5B2QM2PRVa05NfEy+WtsFPLweWtkSLP
	xmcuL86ERXgmvvaayX2zS2INGo7xl5jaC8QIE47DePn65wfbI9k/aAG/8rS2cb/V4laRbRQwskl
	aw+ubvBHgMqGI5JzO1qHiBaq8Car/3NKLvkTGlVj9ghx0UlLK5MajqnxvlM2L3FStuhq5NfdMts
	QDVHUdZ39vHHMlO9p69aHUpxzIwKsvfUuUKg7qRkoaJ9aJBQylJs/PGhKalo=
X-Received: by 2002:a05:6a20:be86:b0:3b4:b24e:27a2 with SMTP id adf61e73a8af0-3b4ccf7fefamr15902138637.31.1780902115586;
        Mon, 08 Jun 2026 00:01:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:be86:b0:3b4:b24e:27a2 with SMTP id adf61e73a8af0-3b4ccf7fefamr15902049637.31.1780902114854;
        Mon, 08 Jun 2026 00:01:54 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86151154a8sm6267723a12.22.2026.06.08.00.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:01:54 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add Shikra (QCM2390) display support
Date: Mon, 08 Jun 2026 12:31:41 +0530
Message-Id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANVoJmoC/3XNTQ6CMBAF4KuQrq0pLbTgynsYF9MySP1DO0Ikh
 rtbcEOibiZ5yZvvvRhh8Ehsk7xYwN6Tb68xZKuEuQauB+S+iplJIbXQQnFq/CkArzzdzjBwYYw
 2UhQ1lILFp1vA2j9ncLf/ZOrsEd1jUqZG4+nRhmFe7NOp9xfvUy44ILjUllkNYLYt0frewdm1l
 8s6HjZt9HKpZF+KjIpVEZFWG6zcH0UtlfxLUVEpi0xbyGvUKv+hjOP4BvJD/NZRAQAA
X-Change-ID: 20260603-shikra-display-07767208fa90
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780902106; l=3551;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=qoPjmohCj+qt+VnuKdYhqh4uHy1Ot3eveLLAi8iChK8=;
 b=GggoWg0wf8qT155TttrTaciEjH77CjKueLHxsW41Jlb4McBcfrIRBKW+Rytru5kPA/RgJ83qb
 BUv/XSFcBNWDOtsjCayphHwV6JyhMvY5Cu1GGuaKEUk+Xkdannknxzg
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a2668e4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_X6I45OPZ5LLD3mXDKYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX4ifPueLapBQC
 qi0Oj0h1GPstVMwdUNNk4erQKRi6rjvK4wJTJEBEqk7sRqdvfTk00JDpJ/ThivscKvlFVhWhYD5
 DSFaJx9wH1fb6UGk2mRzyahkQJqVWQUSiNnTfnl6IdjH5lVqSok9u+k/ofSodHTqjufu1MhrV8o
 FNhTRsMh8+g+EMM3vq9wNsP8Gxww5XD8aBkZ6jzxa+NiH62BuDdfYupQE1E0IiOkNks4Q96bZ4R
 whKVZCYqcqoEy6YWxYf5VgxgUk0MbJSMbiMom06ALfVwmPmQ9yxNSXn5uNHHFvZr5FwCStqJpmK
 8ssuq5l7QAP9KDPOcLUNL3r/7Xp2nTr9Zw7/yB6FuiMT3ZWln2Qzn/s/eYoJ9K1i2272H7yXoXe
 aqCx0eAynqyeWE8PWk4J2QlzZwBH30+Gt7UQd21XgZSVwi54PLy4/9mQpETeZkMeinx327AqXXG
 Jfc+Qx9Bz6+jBIKnknQ==
X-Proofpoint-GUID: p3jS7n6PN1EQmwdCBIcXiWip6-iKuueS
X-Proofpoint-ORIG-GUID: p3jS7n6PN1EQmwdCBIcXiWip6-iKuueS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062

Shikra (QCM2390) is a Qualcomm SoC based on the QCM2290 family that
reuses the same MDSS/DPU 6.5 hardware as QCM2290. This series enables
the display subsystem for Shikra by adding DT binding updates for MDSS,
DSI controller and DPU and UBWC configuration mapping Shikra to
qcm2290_data.

Driver and SMMU support are covered by the existing qcom,qcm2290-mdss
fallback compatible string — no separate drm/msm or IOMMU patches are
required.

Tested on Shikra CQM EVK board with ILI7807S DSI panel. Display
pipeline probes cleanly and panel renders correctly.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Nabige Aala (2):
  dt-bindings: display: msm: qcm2290: Add Shikra MDSS
  soc: qcom: ubwc: Add Shikra UBWC config 

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml		|  4 ++++
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  6 +++++-
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 19 ++++++++++++-------
 drivers/soc/qcom/ubwc_config.c							|  1 +
 4 files changed, 22 insertions(+), 8 deletions(-)
  ---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Changes in v4:
- Fix sort order of qcom,shikra-dsi-ctrl entry in
  dsi-controller-main.yaml
- Replace oneOf in qcm2290-mdss patternProperties DPU compatible with
  contains: qcom,qcm2290-dpu, consistent with DSI child node pattern
- Drop arm64: defconfig: Enable ILI7807S DSI panel driver from this
  series; will be sent separately alongside device tree changes
- Link to v3: https://patch.msgid.link/20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com

Changes in v3:
- Use a fallback compatible chain for qcom,shikra-dsi-ctrl
  in dsi-controller-main.yaml instead of a standalone enum entry, with
  qcom,qcm2290-dsi-ctrl and qcom,mdss-dsi-ctrl as fallbacks
- Replace oneOf in qcm2290-mdss patternProperties DSI compatible with
  contains: qcom,qcm2290-dsi-ctrl to avoid duplicating full chain
  validation already handled by dsi-controller-main.yaml
- Drop unnecessary select: block from qcom,qcm2290-mdss.yaml; default
  dt-validate compatible matching is sufficient
- Remove self from qcom,qcm2290-mdss.yaml maintainers list
- Link to v2: https://patch.msgid.link/20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com

Changes in v2:
- Drop drm/msm/mdss: Shikra support patch; driver reuse is handled via
  the qcom,qcm2290-mdss fallback compatible string (per Dmitry's review)
- Drop iommu/arm-smmu: Shikra SMMU client table patch; not required with
  fallback compatible approach
- Fix UBWC config to map qcom,shikra to qcm2290_data instead of
  no_ubwc_data; Shikra shares UBWC support with QCM2290
- Refactor series from 5 patches to 3 patches
- Link to v1: https://patch.msgid.link/20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com

---
Nabige Aala (2):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS
      soc: qcom: ubwc: Add Shikra UBWC config

 .../bindings/display/msm/dsi-controller-main.yaml     |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml        |  6 +++++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml       | 19 ++++++++++++-------
 drivers/soc/qcom/ubwc_config.c                        |  1 +
 4 files changed, 22 insertions(+), 8 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

