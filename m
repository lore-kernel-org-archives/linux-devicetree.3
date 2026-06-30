Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723E3F1AA3
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815815; cv=none; b=RTRhABQLpYRjYatMyHTDEZbYSvIsZQJgRriq5O/UiPw8fi8XS6O10GLiUEA1k6I+oPV04zphildmV3vdob0n867WlVD3QlzQTe3DA8McyFD5kwcFjQ7iK96s3qQu9mg51k36Sp6CP4Jg3eEzCTprm+8vooKNrZN/4eIvbvmjzhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815815; c=relaxed/simple;
	bh=eA7ljmvwdyz4++w7TMf5zNrwXiZ0ZeNDR79ORRuve74=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dBuIIvmHSOKbmTIWN5g+4Du7ui9+abHrD/QqYmRF5qmyS1an9NQGtdkO+bgC6L8/1sEEYOgnieS0pz+bR23mVU4JBkqCCXzp4ekCZsgog504RTTfSQtHUBVhbRkGKihG52Dt94xcTNz0g8+yKlRxqwd5jWtYuwHAYBfhRl92iqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMVYcIWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kx+z4UkO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMVYcIWL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kx+z4UkO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nCla1606446
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CD+wYim3g5KeRGOfpKB9Yr
	JnjeM2lOg0wutreaHc8xg=; b=GMVYcIWLCR3rdirlMcgJrMG6ou2pg/CyIzMmeo
	/lxhkYXZYl+IFYRvw3Mq6Efj36evd296lUtkB7QrfUC+oOLFJXRg1beXlFYCw2wV
	tRXPadzziJLltEuUjY4AP+cpnVW+N24xXpcmqdbd48mxsklaaqpSbBTvmX3gwDHl
	ED/BSqkpkyrgUgAcTqtOMYYFv59pvxg7zIV1fVqj2uiGxoXqoE6ZhURvmaUIrDoT
	9aSsL+qlhrzN4ysqouNW7xCf7TndNMZKIKLcsyI6Dszvf7U57oeyZTjXOI//8IBu
	1nUDVNmRBV7/pDj26IgWt4Dn1JcP5aH+Tefp9eFscYGKF1DA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5suq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:36:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478947e047so1288788b3a.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815812; x=1783420612; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CD+wYim3g5KeRGOfpKB9YrJnjeM2lOg0wutreaHc8xg=;
        b=Kx+z4UkOiqnMBhuyIx+FyN68o6TYyhVxY6AmwdzhQwIO3hQesVzxbTB5+b+L+xRR0R
         jvTVuRRnghLMb1Q/X0tpk9zJ+LBGx4oKRXGJDUnOq/DYO5KSWH7NX29WTahx7e9VAFQT
         JRFzQ2+k9O4D8SctnbjCPhUELksridk2zYlKoLYSbMjNzMisikjOD3LBh+4cnpWOo+0S
         K+Bm2nICCvBzMb6Eqe2P11gybiSnBU1HwCndUEceSUgardfGTNVUSmCDb6no/PeYDVdj
         iKYu+nPPYGZSkAkzTiKepS64b5d+SoaiV9q6ZQ6NKlN+HFUDyyKdD0223Zx1I5UrLW+K
         SS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815812; x=1783420612;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CD+wYim3g5KeRGOfpKB9YrJnjeM2lOg0wutreaHc8xg=;
        b=e/4FWllSiE4WwdPeYJqGjuXbgVGWe/35TuCNyl7GKZ0h5q2Jq6IRyGgLY7RwKUS7H8
         8BF+ewnlbRYoQNRLFRDPXWr+okAo7yBR/Cu98cqP0RLH0U0GXGlsNOtJhMn/1M1Mh4PI
         l43OgnpK6IX32s6ceUL8H+uLSU5kOgoSTcIJPZg8H6vkyy6ryYf79Yt9lZAKnMd9Z4DG
         Y0TfFrAAIOGJTo3gAihqBJJHP8eLyMO5nqfOZEaF5+y+o2vYdPJT6IpxDhyexIeaDXby
         5O/Dyfmqqvmf3bZzOVvFYcm2Br0oGPNf2d2lLYgH5C8AOBUgGE3QvnKHd+TH0uvzWR5m
         tdvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiDry0yPQjKg1Lq0E4NhoEUh9oXKPEy7dnDRnOLbXMKRU/be9dKQQz92zIF45tsekNIrGl1ig3HKh9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CmitkIQmb+1egfYdkSeGBoqkZxOsJjQzVKCOa5AYxuXAFudr
	mQUExRQaC0hTfviRc5zZk/R44mfWF53sYSC9qZIbxISn9nDw6CfUe0PZb1YQ/8UzQjOIJ4exv/L
	mtjWgrH2JoWQf+fcJ1qs3fa388ky0XgwXMyLVrKdIbO+xh1H455R2I4HqDKY0iyq3
X-Gm-Gg: AfdE7ckgQ+ukfwhEhklVKCpdklaFDdGJZJvRShv0gQNI0p1lkvHB28ELT+3jytYLi7Z
	UJpb8dPCc/FiDslguQyBmDgubSlPA6a7GSBz/mfuNss4ORzh+vJG7ozUKbRNr9r0Vq+O/Sr6CSM
	yI9TNHB7RliodRh44jjE4vR5NNGpEBywckoRxa5pl3dzQiEZErCeRwpvCYaZA61LT9tUFKJVxDM
	o5ZcOBEuLR0bUoVtaxsRdblG3+s1Rf++3To8DIlxvuR94CEUCnbB7jB/mYOtPsXUz1ejBzck+08
	sY5bgXqcaIXnxpk+vIuyp/eT3OVXp7x1Wtdx6AiKLHkDjtRxWn3wRrr0Re60iG3bHRaUNcG9hH6
	WTaGVrJ+JReliphDAjI1XH/wqeYKFjwB4pyn7JQQ4aJc2wqZRWZaiR9zjuc4aTcPpcnRj6Jo9LQ
	==
X-Received: by 2002:a05:6a00:22d6:b0:846:7fb0:4ca2 with SMTP id d2e1a72fcca58-847adf3995cmr102332b3a.61.1782815811714;
        Tue, 30 Jun 2026 03:36:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d6:b0:846:7fb0:4ca2 with SMTP id d2e1a72fcca58-847adf3995cmr102297b3a.61.1782815811149;
        Tue, 30 Jun 2026 03:36:51 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:36:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Tue, 30 Jun 2026 18:36:02 +0800
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOcQ2oC/42NQQ6CMBBFr2K6dkg7QgFX3sO4KKWVJkKxA42Gc
 HcLaxdsJnk//79ZGJngDLHraWHBREfODwku5xPTnRqeBlybmCFHySXmYN0HpqC0GbyGMfgmNYh
 mA1rmWLcKq9bmLM3HYFJ3V98fiTtHkw/f/VMUW3pAGgUIaLQuq0LUldXFzRNl71m9tO/7LB22u
 SMe9SFwKCtZILcSLYo/vnVdf9y9rGsXAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=3537;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=eA7ljmvwdyz4++w7TMf5zNrwXiZ0ZeNDR79ORRuve74=;
 b=us708JDKd989MRvdEFhDMwSypM9Smnu4pAnvSPNooABmIn3xgUDdkDPtxaAm2FeORLtRDlx8T
 iypniJuVSYsB7VsZl8fxdqq3dU5I8DFI5B+GrlgljCg6mcVRzxUygUP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a439c44 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CPxOtKTflHPnepyb4PMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: pmKFEtmi1ECOPOqNQ9jFUieRu5vt_Eh_
X-Proofpoint-ORIG-GUID: pmKFEtmi1ECOPOqNQ9jFUieRu5vt_Eh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX8GDvuU2y65LV
 DL6YYZo2AwdtqCxcEJJXKVcfHwnwSfL/K9GXqp0qH2/fJfNkoy5QxN/JzEybCwbvD6pNF+YgZB/
 pQx7RfRLK/36hO4UzfjBDjeQNY387EwZLHfYaKi4iGgDz+OwoKySf3ZnC5zWGYgQvYBg2u4gvHa
 KUcX5iR+njqFHan5Uxg9HZhetwvbZC3+ceN3sexz3K7w/NE8NC/MFUqrDjIkopLTzS9sMVrnGpp
 nXJYl6MiKUYNiXiq69ZVXweppmBPDGW673vnsmFLe7ixNKuU94Xm5MnvQWQNcXcpzrtVkBfwVIi
 d1+Pt3wE6FxTH1soe20qKkmyhv4BhFmS4mRLVmuJIyiPu3wwRO6puVYUbbjoOzxyYjY4HXny0ZD
 WUZJClW1BMSpFFvL9yT8KddYX7PTbJipsdPwL2YwOEz6r78j1arJJNBpAylnvlswmSnP/IkC6iN
 dxejHUKfvBUvV3rVeOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfXwaPJbJEW5Klv
 VC1kFBOwHAdizUH/i6TpvcZVkWV8cWkNYHUqeND4elde6XSDSrvm3otaHWOj8m7NrnKyc++F8P0
 j4lKUph8D26Ujnfd4Oh3azX65GMkWcA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095

The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
forces the device onto the AMBA bus, where the driver must read the
peripheral ID from the device registers during probe. On several QCOM
platforms this AMBA peripheral-ID probing fails, so the traceNoC device
never probes and its trace path is unavailable.

This series introduces a standalone "qcom,coresight-agtnoc" compatible
that describes the Aggregator TNOC as a plain platform device. Without
"arm,primecell" the device is created on the platform bus and probes
through the platform driver, bypassing the AMBA peripheral-ID read while
remaining a fully functional Aggregator TNOC that allocates a system
trace ID (ATID).

The series is organized as: binding first, then the driver support for the
new compatible, followed by the per-platform DT fixes that switch the
affected nodes over to it.

- Patch 1 (dt-bindings) converts the compatible to a oneOf and adds the
standalone qcom,coresight-agtnoc form alongside the existing AMBA form,
updates the select block, and adds an example node.
- Patch 2 (driver) adds qcom,coresight-agtnoc to the platform driver's
match table and renames the itnoc-specific names to generic tnoc names,
since the platform driver now serves both the Interconnect and Aggregator
TNOC. It also restricts the ATID-unsupported handling to
qcom,coresight-itnoc only, so the standalone Aggregator TNOC is no longer
wrongly covered and correctly allocates a trace ID.
- Patches 3-4 (kaanapali, sm8750) switch the traceNoC nodes from the AMBA
form to the standalone qcom,coresight-agtnoc compatible, fixing the probe
failure on those platforms.
- Patch 5 (glymur) switches the node from qcom,coresight-itnoc to
qcom,coresight-agtnoc. This node is actually an Aggregator TNOC (its
tn_ag_* endpoints show aggregation), so it should expose a system trace
ID rather than being treated as an Interconnect TNOC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v3:
- add standalone compatible for AG traceNoC device, allow it to be
  probed with platform driver.
- add fix patches for sm8750 and Glymur platforms
- Link to v2: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com

Changes in v2:
- address the ATID issue reported by Sashiko.
- update binding to accept arm,primecell-periphid property.
- Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com

---
Jie Gan (5):
      dt-bindings: arm: coresight-tnoc: Add standalone qcom,coresight-agtnoc compatible
      coresight: tnoc: Add AG tnoc standalone compatible to the platform driver
      arm64: dts: qcom: kaanapali: fix traceNoC probe issue
      arm64: dts: qcom: sm8750: fix traceNoC probe issue
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 39 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 35 +++++++++----------
 5 files changed, 59 insertions(+), 25 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

