Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48353AFD00
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908505; cv=none; b=kmh2Hf8T/7AO5UWNBfUWaDBdE+icPx72E9ae053ogxGzoza+tOu0OGRzvBqKUy1jz+fS06j+4hk3xorsuoX7LlV5qaboh5EnNC5pKfHl7aTbu1GOJg7Ma5O5betcObtuSRei5RP8mboxAfc2QL31nMzrNkYdsEcIcAIiQdKTZtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908505; c=relaxed/simple;
	bh=cdsPMqfeWD35Ac1rhIkKLbMsGtZjV2Cq7h7n1rY1KCQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bD9dJVs+JHmfeRPouAKZ+rDJr3gul19fNdAAGQiQLC3pzuCyCuv5ryC00J5FLMEmaoJ3QY3MJ7P8FxYOMnAEnlv+PGVw7/WRWqwXWbwnp82wDlo5HbDUYtGyYKroxmE1/gOiilq+O/O0Rg8PGdP4ntl5y3Ov3O4rYuJ+lLQhUm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aideAHVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbBgFDwy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aideAHVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbBgFDwy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PWPJ2808320
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 08:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2aTHTubIziKVG4zlKxyz0c
	AXqTiwuCicZ1yd32rnqXk=; b=aideAHVEgxtRLrcoemMiLwDOXftCri25RqAneU
	cXk9HkPN8NW+I+qqha55fmAv4ebCTJk/Uqk9udgFdQYUYsodKnGfuFCxLUCJp9v4
	tIZG8yb+TnJYuYSMBktwyLXzuiSp/gi2+BbtynZFr+IjG6wWCl0Rd/5wMq2uv8lf
	snvrbkFbg+i3mpQU0oPMDoZORf+17i+3ZT4QnHHmj6CgRR3ySpGnq9OlodjObvct
	nj9Jweo/h0FyqFF5vepo0wLzaNiFEFH05NbYzZNFTiu7ngvgKF5YjMJX+mWqjONS
	gj5K79eWV96wcNhhm3iYbHtXXu5JKBhDY8SVfstAR23vjiQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w6xkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 08:48:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bc5e97950so4727153a91.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908503; x=1781513303; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2aTHTubIziKVG4zlKxyz0cAXqTiwuCicZ1yd32rnqXk=;
        b=ZbBgFDwyhYspPF2ipxWOgrdLFqpa1MxivIXRA5zgN+LVzjC4yngYlbmrM03N9RbSYI
         eqfcxiconHCl5HYi3eq34GnB1TPTArNe8KwluI64ZodcVRX8FkzApmkK1CxlMrFpKmui
         na//EUUh1dyp1LEZBt2BmmjPrV/qX+VNaMNB8JRo6N5GF7Z4lhPRuMs4AZWn0V9SBENT
         DTM/wHzzY7iNcRloQwtEMyiDWk9LT60Afvfr5zfMPzsZTtMqsJSBTzepoA6/5Tsy1RfC
         KlnC8Pf1zlO2mKnsR5wK05j7oVf3SKy+5wK+xqp9yAFOxfXj6LEMxR1wW8WJEYjzABkg
         0wGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908503; x=1781513303;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aTHTubIziKVG4zlKxyz0cAXqTiwuCicZ1yd32rnqXk=;
        b=WXMqZsTZ0LB4iWzUT1a/f39rt72MicBWuHl4ALc9esHTM6xA4nNEA+/B5qKJWUT69N
         GefjRsSy5c+XMLnwUriHMXu5kolwcYcRZV3olMtvqbkFkTmTWZYF3iOpoF0UTRzG3L3+
         Jg55knKdSFUJPewI5Ta+Foa5l7uZTkVUYPyxFbYss4y52ff4Kit59GvJyxdd58OQoJ11
         6dAvDCsUGoXlCLMpH+83X+sFePsu1cgY8q7iB2CwTNF3ockSDZgUBc2Wm/iBaL95GN/g
         DB/2aSo88RiUvAMDklUt3CRmxw0sAm9JSZY/YMHV9LifQm8o8v/Nxh+S+RD7svINYEY8
         qVSA==
X-Forwarded-Encrypted: i=1; AFNElJ/pqwJNXK7YNlWD6UO5vT9H4ehJqpP5vnWECXvWVm8/XJVN64XeSOcy61QK0q1JAUJtlvX2gjdm6HI5@vger.kernel.org
X-Gm-Message-State: AOJu0YzIv9uHa0PhFkhCPrQ3AASfud2oFd75ytFGaH0yEJihIQZ33RwI
	WPFgmerXfWN83WU8Vc/bOKmFkhuNC85a2J2YHI3Uw+0etXe95iE3jt2+IXzSkABFEiOyffhT2h0
	58TIR1TMzuUMh4uZkyUwP3UWu0qRQsvIYQ7vQgxO0/uFQg2UzSRP12Vh+FQMOBhqh
X-Gm-Gg: Acq92OFuK/AvfIUyX5BbcOQNzy0v1WR56ZdCbIAMlA3YAX3rfDLvP9ctx+0KcnUzcNX
	NEhdQYyo32zNIhT707fXKAIzv1EaCO/KR3YR7CFaiurdXR5xYuzQpWvEFx8f02fErtL4lQvm6G9
	7r6ppPHDIDN6uPXRtBnW93kSt7CWfJb2rMezcOYSmgnSC91LaiOwHoGRE87Insjz5k7L/Ydtmc2
	g4ZXVhxtiCHnhO0uhL9BLT3mvnnceGfTVmEE+pf7JLeqpnOivyFBBnAw68bAv2fD+xHr2s2+qTu
	C74T3fQ07uv9Fw/R7on2AUKUuaCfiPqQbIf10YWrhRaX5uN9IbrxEJb7csIgcYk/Ya7TtRyipL+
	o7KV1e/JmZqT29zqn0pnZqsDmhaxHvkC02mx89uWJv4VzNojneFnC9Hl3voQwoL2lO4Q=
X-Received: by 2002:a17:90b:1d89:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-370ee82fe25mr15451766a91.6.1780908502800;
        Mon, 08 Jun 2026 01:48:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1d89:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-370ee82fe25mr15451729a91.6.1780908502386;
        Mon, 08 Jun 2026 01:48:22 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f712de91asm15070198a91.16.2026.06.08.01.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:48:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/3] PCI: qcom: Add support for Eliza
Date: Mon, 08 Jun 2026 14:18:12 +0530
Message-Id: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMyBJmoC/22NzQ6CMBAGX4X0bAltKT+efA/jobSr1ADVFhqV8
 O62YPTiZZNJvpmdkQOrwaF9MiMLXjtthgBslyDZiuECWKvAiGa0yHJaYuj0S2DgjHAuoKooQWF
 7s3DWj7VzPG3spuYKcoxyXLTajcY+10eexN3W5JR8mp7gDNelVE3IsqpWB+Ncep9EJ03fp+Ggm
 Pb0JxfZV6ZBLpo8l7WkTHH4Iy/L8gYx+WBt8AAAAA==
X-Change-ID: 20260427-eliza-e53155ae8821
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780908496; l=1742;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=cdsPMqfeWD35Ac1rhIkKLbMsGtZjV2Cq7h7n1rY1KCQ=;
 b=ecrik45mYwX77ErSUKzG8xA3oHBydDoNjh+Dyt1/LxNH8+i5JjlSkyEgZfViU7d5S6sgMQMf6
 Ju9syZl1cUwCc4e1Wh/vrygWyWiYrecOUYAYVTouvVPE0NX9TjeN5J9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: c1znM2GFs3GcQfqPfvD6i0nwM33uFBtx
X-Proofpoint-GUID: c1znM2GFs3GcQfqPfvD6i0nwM33uFBtx
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a2681d7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=RZHP3SvTWnTKgiXxB68A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MSBTYWx0ZWRfX+DdxoeN1FlU5
 7XhCw0PdEr1Rpw+J/foAqmm2s0XbtMooKyXhxyKX6hv8QJ4nK/U2Ii2Wwh5ox2Zrna6VKdaEXq+
 bkm8Y9wMfHGQ1FhCGgAmTzkBsbfudcaEOTc1oBei3b/ryS+FRhE6FQ4GSeaWHUsCRU931X/o/fu
 8sV7Je4GD9wwQiGFYzualdoNVGpqObo3MAzKpWD9dXq451w+zCwRjYjgQP0qrBYoAq49gXpgZQ6
 WprYxQTRruaT35sjk3atlgZAoHmJ+5bayvtpAq3MQqt68Ty1NOleO+32zA3Aobm0sP8ZOv5wlmr
 yshSIK6lUjCKdfON077Uw8jTY1vaJx46gMmzwnhW2ZDMKBF9AXt54rVx7cXlcLpj5t1KIWDkuhV
 enXd5zvy4OeUfg+47D1zBSY5rE5KfvIE+Z5p2swONAF1xi/hRAemMAg1zcUPWlD/gppeoUSmtgd
 EXCofnHDQub4LsHMtKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080081

This series adds PCIe support for the Qualcomm Eliza SoC. Eliza includes
two PCIe root complex controllers capable of 8GT/s x1 and 8GT/s x2.

The QMP PCIe PHY support adds a new Gen3x1 PHY configuration with
Eliza-specific initialization tables, and reuses the existing SM8550
Gen3x2 configuration for the x2 PHY instance.

The series consists of:
- dt-bindings for the Eliza PCIe QMP PHY
- dt-bindings schema for the Eliza PCIe controller
- QMP PCIe PHY initialization tables and configuration for Eliza

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Add allOf constraints for eliza (Krzysztof)
- Link to v2: https://patch.msgid.link/20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com

Changes in v2:
- Remove the driver patch and instead use compatible of sm8550 just like
  kaanapali (Krzysztof)
- Move all the phy settings to lowercase (Dimitry).
- Link to v1: https://patch.msgid.link/20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza PCIe phy
      dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza compatible
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Eliza

 .../devicetree/bindings/pci/qcom,pcie-sm8550.yaml  |  50 ++++++++
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 139 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h    |   1 +
 4 files changed, 196 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-eliza-e53155ae8821

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

