Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7E23AFB03
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484320; cv=none; b=R2jmFlf7IOH8zogfBm+O5dqll7QjQbEBlDH1Cj52oZysCl5gVvy+6xBOm7XCN0nAe4USlqV5K+014RDlFd6KjyuKr7Gfy2I1yqTkXr/WmhGm8yCe8y7cUWRemgBmTJbrq7oSDvcJaejrjwAg8Kyi2W2o+rhCccrO+/qKkIYhUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484320; c=relaxed/simple;
	bh=MmDU6SBM1cxkuGMuxXd26/xdmRkaBvlel84fJ3SdDHc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J+GOvdwP3sW5u2/L46Du8CwEGaa1okhC0Vb/xQrqJwvj3AzC9qUce9XFyh7BQ8rTPW+RwEB0B6JtmMRs00MzE7OkMLclVJ2TYnjvh3pFCz4oyzxCICeszwsUcnjbbuKZD3MUMpe2OR2tCc7lDj5Eix5EUXllGr8H9zozyydN6Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fg6naEgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCPiEueu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fg6naEgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCPiEueu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JHI7Lr4184684
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y4UXr/4v0gm3ivl/dUJ8uN
	v553fe++rQ1qsr3MyIOcY=; b=fg6naEgkYBk6zSZdDvPLDwPALHUQuDqqe+LroO
	f2n8DGl2XWNhrr9jUOQFz3yHB07ale6Kmj658F9dRvQz1CbpvF8JBViPc3pHzZrO
	Qk83Ftn7wN3ZR31c9BU1T0AVtziQxkJjrEaSqHfZCnekItt2f5OUbXgyMs4Qxpwc
	YiOKKZpmKozfGGBQRCV7NWu34FhPWMmzf2Vg+Vm7v/7/juRQTbPMblr55gT6cH0O
	t0UvIUamBEifO5uLh2UpWd7nUX/a/UTBNqQOIUWaiiycOOWu8bP8p5d+2Y9o7GUX
	XuF1TjSv4cDk788zfEY/DUb6RPcmoITX6pxOOcq4Qwn5awog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04t6e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:05:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-384cb1637c2so2730488a91.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 11:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784484313; x=1785089113; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y4UXr/4v0gm3ivl/dUJ8uNv553fe++rQ1qsr3MyIOcY=;
        b=DCPiEueugVw+1WClpA0c3Facqc26QsYRjAO+Vkw7vUerTZY9ZdsRTbPwYbzcZoE68c
         Ct02gs3X7V0g2aYDAgcbURz2SYFn1kBrRZZlUYRK4eY6U6mhhfL+s3Nqt88/c3syUoKT
         dMdQxUsdU5CpCdttj/vv/HPNeJ0misoqXMD+9l/EhOhBS01+LXMyAb6beq529CCJO5tv
         PfxiccyySCAIcvRbF3Evd1SbOobHXl898cT+4nFMrua9HcBVx4SF8Uev27PYmZD1KAGD
         idJmYpujHUyff4MJK3WGKzOlxJ5nKdMR0GdZ83dDS0Dc+PJ5mLqHGA9EWS8Tkz2bxylq
         kA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484313; x=1785089113;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y4UXr/4v0gm3ivl/dUJ8uNv553fe++rQ1qsr3MyIOcY=;
        b=YhVVGH2t+LfgeQ1GgxJx1fP1onmvRACp21BM1KuzmscaNRdLnjyeTZDtBSWOonvAdd
         +KO58V/qOZ9A0Uz+MTLkhH4IQ5LiGjsLLsSiF5NExhV4vN5IBTi1lPDReqTwGLZff6PV
         JVEjwe2Y/qeK9JUw70RwvpvMZPfrAr9AYBdFjX1tf0CRSaGGstSQaVdVTc2S+ATS20K2
         pGL5qDe0gnRyKaKrpagYg2qsBascwfstdygh7yv4OpIuAj22E+1EWoPubmxNkSAfe7Nr
         UQn29mXsBHS3EoYvXjy3SIxgkxS69clzoSgtLkLlv5Ps0D9lySzugdGTbYW8Spybzzce
         h9ow==
X-Forwarded-Encrypted: i=1; AHgh+RrPwvCqyljSf/HPZ8SXtOkKmyVBjtNBrXneo8tzyz6MBYysiEfBlk/LCBcDA6uTls+FFAlMuXW+GOt/@vger.kernel.org
X-Gm-Message-State: AOJu0YwNKEPQVASJ4c4vpGevAK4jo1XonxhiFn77eDEoe8hfzC8DJh2t
	d3NcBWjGP+QRt4UUJoZ5JTG3D15XlykWuuTuUkBSDcW9L68/8FJPUu48dYf4Pyn/SHHWlZl/QL5
	EbMqT6Mz62omiff9vacl9yroesVHyzKvEtaP+daWM0ZMTZjT1cKFgPdNxJYkPyIGW
X-Gm-Gg: AfdE7ckxKY2aQpkoBQUdtPwCH66a7Egik3TQ1Ub40kaFqcUYUPz+ANXwo/jCCXoMmTY
	GrNLio2Q0mzViM7JOgmbK/5aZ7ygD9IlRmWWbzCqWdi2hUYlSbvcKvG1IVLwObQuI/KC42huJBn
	Q6lehOyZqGhnIkuPDqVGOpYg2gWVwL0pBRQcLEfBMx8N3Ekrvzni5nUhEhUEEjXRSHtvOrgTSod
	3FtRG4WStnnql2MeZNe6tmVhts1uLih/xL5Sd0WVGDUX6MuUkz7w29fyD39FavVh+6qt3tn+rOR
	6NvHnN928uSNiHgwm7jG+htEjZrwpXUFkhKMYPfSBengKsfmObQTAnA1zFMgbMehK+P14UHvblA
	ePr7CG13PswUeIi1J7/lxfrW9kzVuo3jVduSixIheEJlHN/gaqKQiCBEK9WjhVW48Ba6Fng7AFQ
	Eozfd8+fpghdAWtE7VFRXX
X-Received: by 2002:a17:90b:28c3:b0:37f:eda5:516f with SMTP id 98e67ed59e1d1-38e4b2be9aamr8323689a91.0.1784484313494;
        Sun, 19 Jul 2026 11:05:13 -0700 (PDT)
X-Received: by 2002:a17:90b:28c3:b0:37f:eda5:516f with SMTP id 98e67ed59e1d1-38e4b2be9aamr8323653a91.0.1784484312889;
        Sun, 19 Jul 2026 11:05:12 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm28037681eec.26.2026.07.19.11.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:05:12 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: Add LVDS display overlays for
 lemans, monaco and rb3gen2
Date: Sun, 19 Jul 2026 23:35:05 +0530
Message-Id: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANERXWoC/3WP3WrDMAxGXyX4eiqWEztOKGPvUXrhWMpmyF/tJ
 BRK331uc7vdCI6Qjj49ROIYOIm2eIjIe0hhnjLgRyH8j5u+GQJlFkoqI2tpYdgpQdqWZY4rKKo
 kGWl01aPIK0vkPtzfusv14Mi3LVvXoyk6lxj8PI5hbYveGl2XbCxr42rqa9IVd9qiROcrLDtXl
 9g05qUeOSX3jtMW5yMNNuCIYFgbheihi4HywG5AQhaSUqiVtuZrTul029zwOnvK5fN/X1cdDy5
 u4gFo9rAjIBiH1issver/0l2fz1+36HuUSQEAAA==
X-Change-ID: 20260708-lvds-support-2d40d60654f1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784484308; l=2562;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=MmDU6SBM1cxkuGMuxXd26/xdmRkaBvlel84fJ3SdDHc=;
 b=9g3MXRxIv4AUybHQrRDVAgXKOatkw57p91uL2u5B9Alg3bJxlrZ1iBCa8Hnw68c3aikpa/e/D
 59gkINFXqgMBIZ2EWPUErn2w5Hr2juo67aiSkofdq/ljr7AlHgZLzxD
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5d11da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7Z2I1jc64i5zuNuQ5A4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDIwMSBTYWx0ZWRfX8N5f//7Dmo91
 5DesxodXgqxUN55PFk2D6XWdUuQAtNEnH10vLx9MCaiXIyRuVFgTPxS8NozVbbJkGK8ywUpvYmX
 NCth5STpBMj++CBj9tZ7FFlbRUUWp+3QS/GTnSmp6QS7BpjhmR4LpCuxGjpb3h6rErH6PwiUdwE
 oIIxJDv7wC0KuaKdJYCXAmiik4LtLKigVs1lmZFoGw7HbDJRDXfEoMrH+IzrbluJsO+9jA0QYRy
 nIbXOPeZa+5AW0UT2JHzlJHLRwL3kpuNA7eBB1NW9kTmUBI2uCV4Bo5eINVUwSq5TkKWXUC/lb2
 WLbNt8aAxjhDvMQ+41Z/I+3gxB/O+tLJi16vAd9qsV6oonaxsyf9HdZtt4YLLSpHyuJN2GSIH+F
 dM+GOtekQSC6xl4jmF0QjjcZc1Bcoi9FUetb+Y7uSJ2VR/07lFl1qJ1ga1CEcG8pGd+JaZLxgIo
 Idv2pWNFdNMcV25092A==
X-Proofpoint-ORIG-GUID: PIIHdKEJd7y0hWudgsOTEIUifLAFx6XJ
X-Proofpoint-GUID: PIIHdKEJd7y0hWudgsOTEIUifLAFx6XJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDIwMSBTYWx0ZWRfX6diBDK60vEbn
 QdTyKnbCP3DF6ejvACQY38QrUDn8RWj5nJFHbIcBWG84M8XMXdu2jHRN/5nVpgp1yUsR7rWkNXB
 wwiy2Lqlc0ExWUOg1cAPpKcFhEPlbmU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190201

This series adds LVDS display support via device tree overlays for three
Qualcomm platforms: SA8775P Lemans EVK, SA8295P/QCS8300 Monaco EVK, and
QCS6490 RB3 Gen2 industrial mezzanine.

All three platforms use the Lontium LT9211C DSI-to-LVDS bridge chip, which
converts DSI output to dual-channel LVDS for driving 1920x1080 panels.
The overlays follow the established composite-DTB pattern already in use
on these platforms (IFP mezzanine, camera, el2) and are structured to be
applied on top of the existing IFP mezzanine overlay.

Each overlay:
  - Wires the LT9211C bridge to the DSI output via an I2C node
  - Defines a generic dual-channel panel-lvds node with VESA-24 mapping
    targeting a 1920x1080 (476x268mm) panel at 148.5 MHz pixel clock
  - Provides an LCD bias regulator through the GPIO expander

This series depends on:
  [PATCH v6 0/2] This series adds LT9211C bridge driver by extending LT9211
  https://lore.kernel.org/all/20260719-add-lt9211c-bridge-v6-0-e56d22152586@oss.qualcomm.com/

which adds lontium,lt9211c compatible support to the lontium-lt9211 driver
and extends the binding YAML accordingly, and:

  [PATCH] dt-bindings: display: panel-lvds: Add boe,dv215fhm-r01
  https://lore.kernel.org/all/20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com/

which documents the boe,dv215fhm-r01 panel compatible used by these overlays.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Vishnu Saini (3):
      arm64: dts: qcom: lemans-evk: Add LVDS display overlay
      arm64: dts: qcom: monaco-evk: Add LVDS display overlay
      arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  12 ++
 .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 127 ++++++++++++++++++++
 .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 131 +++++++++++++++++++++
 ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 110 +++++++++++++++++
 4 files changed, 380 insertions(+)
---
base-commit: f86573e68e56a7df7d54eb58101ac413ba731996
change-id: 20260708-lvds-support-2d40d60654f1
prerequisite-message-id: <20260719-add-lt9211c-bridge-v6-0-e56d22152586@oss.qualcomm.com>
prerequisite-patch-id: dbba64d1ace696df388c5df3d1cb05a0701df194
prerequisite-patch-id: 7729b9c67a7c274b25fea08635dfede3fc604ae9
prerequisite-message-id: <20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com>
prerequisite-patch-id: 4e67c4a837c7fe490e7c5d34a243543c76685eb5

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

