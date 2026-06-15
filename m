Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6313D25AD
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512560; cv=none; b=ulGYg9Z2H1QB7e4HzjHgTXJgO+iZy8M5IjZKHcgFux+as2smb+ODKl7SlpGEcc7fzhsA2DP0MCKZFQnR9lqx+gs7gmKJqUG6pWrT+bhjOv6lzCoO1OlTR60lLKtnO7mQvqDnYJGEKRsiEmQEp8TzbVR/P4o7Hbb8SiZE/UYcskw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512560; c=relaxed/simple;
	bh=0CbeIfbe5MjOdT9CQPYp9szhighV6UBlYT32HHqksf8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aWdkcY0jghiQwT0Ycc0aScI8xD3kZtjOKXdRjjmyvw3POGpIdVCQX+KfgmB21MM0lRGPypk11lpLtApo1h3PMji9WAyAGBscCQXXJXIy/40jV2dlErGJKXBoH/X7+Y/tJNNRPN/QKncqSLKpIDL5p4VCDqHbnnjlgBnr6/hX/Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLSuJ8HK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hn7aJ8HO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLSuJ8HK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hn7aJ8HO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J3DE3327636
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wV4trMcsPj/JH0c/7ibhAF
	ZjIAm9kEZUKLzZv+e34cA=; b=oLSuJ8HKER9/GeorRd5RvX3TVR3eXutYtJvqa9
	kaKex+OP9syc+slAiw97WhGfs6Vg4yHSPnYIZmoyHqxz2ezbto+KAhPnJoWc53v1
	pOtw/aj/eApjwzvpddAKBpbs51af4EzapK1/JtGv+/8D+A97ommfwmKthS2YFJoV
	nyzt1tbglG4I+Tpd9mGEmy1uuFV43mEEqFHwqm249HfwYfYp8Dn/2Mbp//N3CDuO
	0ctG+R6NwnFjRMRlxv+M28eAQW/yrIEe7p0rfu3ai5lLtzSs14lfa6QFHNwFwBe5
	qUOisnqvd7++h+PXGGXOo6PqFeVZuHU5rp3iSR5N1po4rAWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgpa0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:35:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf004bf8beso40028005ad.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512556; x=1782117356; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wV4trMcsPj/JH0c/7ibhAFZjIAm9kEZUKLzZv+e34cA=;
        b=Hn7aJ8HOd9JCClW9WTSqpJzqtvX3L2LvgCbmPemgOgYrt0qrflPrCFonkYI+RNPFVD
         vLVYV+VnmTM85Ye3wVeH49eCN7WSa826cYTacXtrvLh777K/a5C1GSdPTKxW80VAlLrH
         85IYKY5Ljs+o/exozv/iKMuWF1kBt7gIHlr2/w1euY1VWfGiku0AqcOLnBg8J4spbOMJ
         jKvHQhw1wTNzC7VHhXd86QI0rCNBvQWvYeMhZKlFDPHkPhxNV8xi70I58+0GuzaprmpW
         tG0Z1M81NfqZi4Srgmk4lKU9nbSPPYJq9xO/JIRzS/2yXWH4c2nK+fOLVRigkZGtqG4E
         I84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512556; x=1782117356;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV4trMcsPj/JH0c/7ibhAFZjIAm9kEZUKLzZv+e34cA=;
        b=hNlonKvNVrPxjANVc4vdlJx2RMWiNZeiOeI3BvQPsNSAozy+01zwYTMhs4iOI4OBnv
         xofbJLQp4GNi9Xj7qjyI0N3HXO3x0cCDfoLa6wOQuLXeHIfkvRSsnij6D+Bo5rfpCsWj
         aNUM5NsHdxyHX41H3WlcMNWMbMzivvjgn3IBMJ/mF65EvsizZBWyA8KQFqe9RWl0EsEi
         n37hSbI0gFH9IcQtSuAdgWoTSGaWDUXZcc1JhARJAyORPYEqJMzmSPMDRRHQD3t7y92Z
         3HcLQ6srR46FzAohzMuaIPTezmPwfgYUiaOLyJ5n++xMIsZXU5Odl/fZqH4KxPH5swoc
         z0Sg==
X-Forwarded-Encrypted: i=1; AFNElJ9WKAKjjS3HGXx3o32ukrcknlRpflP1cA5uyowPxxOPsMUTFq1Ev/YanxzJ/4mXVyUSCqsLajCVMrTC@vger.kernel.org
X-Gm-Message-State: AOJu0YxCPBS/1Rub0vNrMjM+nSGe51DiorNFx7Sp/O30xu3icP7temVJ
	Vnm/WcUE/W/TR8NR/Saj7/W+Ha/GkW/m91Z62dMd1gWL2Lon6dzIaaE1tNwpF6t+yWQ7g4n+dfN
	uZU+Wrd8jZG45APy8QMo/JugdjtJkVm5aDcIDRGpWx3+861dkv4wPV37ULe14O7h8
X-Gm-Gg: Acq92OHiVUdpXzJg/+ahmEm+L0ntu6dsG48a7xfNWRyoHAI0UgfIQBmXGEU8GxZF52e
	kR2ks+v9Xbp/9it7GgRyz+4JhF4skgj5lMW6y1ZwGK4HHOpfDfc0xrpVrLSJH3/OKeFGNOiWo/p
	g0tTIz/FCdt3Te0ocYUbBrEwlJx6ZjnBpMqH/7OZpOEEwsYzFIfuBiNhZ0BWauWY3u3YhkNLjbf
	KG9GKzDh8h7HxZZiI/0oKQNQAla85zsARC5DDDHExiTgrFqptycQu4FRGbnK4GGDPtBAXEY/HLc
	42kKqc0jvhCF5MQqh8tMfxWg0xNYNpmK0G+uKcVfYxzSGEryj21D3LbJbu2ToQqLPdk9Z+XHuFq
	X5cYFB1o34VPyEuez6snoxgEY2j3Tfd/RvHojZmBWXYI7BtT1wZEXIHMmXtPV7NxBmVoL/o9j47
	vMmO1JG38W+EXo5a80kALoK5qQdolsxwaCbTi98mKKoRGCuRM7cyTSpLUo
X-Received: by 2002:a17:90b:6c3:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-37c2bd033e6mr9436110a91.12.1781512556286;
        Mon, 15 Jun 2026 01:35:56 -0700 (PDT)
X-Received: by 2002:a17:90b:6c3:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-37c2bd033e6mr9436087a91.12.1781512555895;
        Mon, 15 Jun 2026 01:35:55 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm9558974a91.0.2026.06.15.01.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:35:55 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for the REFGEN in the IPQ9650 SoC
Date: Mon, 15 Jun 2026 14:05:46 +0530
Message-Id: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGK5L2oC/23NQQ6CMBAF0KuYri2ZVlutK+9hjCkwQI1QaIFoC
 He3hY1RN5P8yZ83E/HoDHpy2kzE4Wi8sU0Iu+2GZJVuSqQmD5lw4BIEB2raTkkBN4dFiQ1lSqb
 iAPkxzYCEozbszXMBL9c1+yG9Y9ZHJTYq43vrXsvHkcXeikvg3/jIKFAhkOtCi6KQ+7P1PukG/
 chsXSdhkPhj5B8KYz8KD0qupFYsF6lS+EeZ5/kNpEpKAQsBAAA=
X-Change-ID: 20260520-ipq9650_refgen-196b570d8bc0
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: d2EwBpirDREuZQwVX84V0Ys0zHywSAIm
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2fb96d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=jDu6XcLu4sYahdmiP6UA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: d2EwBpirDREuZQwVX84V0Ys0zHywSAIm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX9qiJiClLhMzB
 bsQpmoJD4WU2m9GGUrdGuCfx39u5kNdmGGYP1FBLH+H5+I7/qwQdvDOHkigPYZbbTc2IqxWY9MX
 x6XOfXRbJZezRSTYtx8LzG9W21HY4ew=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX+z1bu4bMYX2L
 XR8Ad2Pp6nZ2dz72S4/uAxX1oXW+NFC0g3ZgdtaxGsKmJB/Jv+Ts3+PrDCtYTIhoAkB62ee2NnL
 8ATAuXBdnwSGv++qjf4v0z/XJCQLoowaPzSkzadC4vbjIOVPF9BVDgVO5ThHVL3UXesuktPWBrL
 pCvR11VuNuM43oTdKyzsg51Mk0NRbZw1tw5ggFzF4jLaBPoO1/JFALzsWlnOoptNiS9N6TXf6N6
 oHl+2NEJuOXg+YHcGXahAKyIcTXHsm4QgG55b3kXDpdO9RKoHs4Hk4B95IFZbqpeDoMsg6LV2Gl
 wH28VlDzkyMfKhXs+KCFs2i7EMJ8wuaC0Y3Wf/cMFe85OLxuRRJnJ+DEd2CexmeH9oCk7R2nztc
 vju3ZcCGkIGY6PRQIQgOuzz9v7qmgUgi9918tQGKiNGa90GWhPTt3Gbl6miVuw0vFmJI3BWNJJ6
 TVa3FR0OBZR/GZCyajg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to
the PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block
is enabled on power up but that's not the case for IPQ9650 and we have
to explicitly enable those clocks.

Document the same and add support for it.

Correct the regulator type to REGULATOR_CURRENT, as the REFGEN block
supplies the reference current to PHYs in the SoC, per the REFGEN IP
team, aligning it with the hardware behavior.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Pick up the R-b tags
- Use the lower case hex number in patch 2
- Document the IPQ9650 compatible as separate one not as a fallback and
  move the allOf block after the 'required:' section
- Link to v2: https://patch.msgid.link/20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com

Changes in v2:
- New patch 1/3 - change the regulator type to align with HW behavior
- Add the constraints for clock and clock-names property in the binding
- Read the REFGEN_STATUS register to find out the regulator is enabled
- Dropped the unused slab.h
- Link to v1: https://patch.msgid.link/20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      regulator: qcom-refgen: correct the regulator type to CURRENT
      regulator: dt-bindings: qcom,sdm845-refgen-regulator: Document IPQ9650
      regulator: qcom-refgen: add support for the IPQ9650 SoC

 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 31 +++++++-
 drivers/regulator/qcom-refgen-regulator.c          | 93 ++++++++++++++++++++--
 2 files changed, 115 insertions(+), 9 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260520-ipq9650_refgen-196b570d8bc0

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

