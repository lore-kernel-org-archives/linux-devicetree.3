Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72431469839
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786103407; cv=none; b=j+Qf/ORkYWCl6mJClfBDNf9ES4flNBFXVGbPMmgLyG5iyzDPkLc0NbWFQB980H0lG6+LkmHYU2CxVgNKE2sVYvHzZbYep0Cn6rt6F45hTrpMJPk/9CV/F58DPMf0QEbzO2xscw9qmH5RMWMuTM1FOsck/B+NelYU0D9RB7UbqH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786103407; c=relaxed/simple;
	bh=0SHo5pqSV4h0r1TDAv6sNTp/MylUBqBc1WBlNhL7i24=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fjHEFT/AmbmTfhrbJE5GBhkYO9bE28wMP3e2jzV03u2bd1Owo0NRPqsWy3CFjCcvKVCImlmCHoax73T1Nu00myydLkFOw1jREthpDGCYwVh9flwz2S4iCUw465md1Iuy/O/nEe68998oAYU6kJnWQDMADcvrcdq4hxWi9nxqSLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTeRmJX+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BY2gjS4X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTeRmJX+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BY2gjS4X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777iQ6p3533333
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 11:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1Q7ltlk6jumptvg0UKNrbfY4uFng06GgeSV
	XcWXNSP0=; b=WTeRmJX+HPUWvay1XVvVOkhqRuEwnKwEKOWALoYhBBbQZjjDVRW
	aUQZ839MEgip+SCyDKLwSDdrefD6vycYowhtCK+/5B6+YWyaXiFIxK8LELoiB4Ri
	3o2ql7Wqt1TKb5hGqMfhbFjbDOEvsMMC8LNoAh0uiwxYDgJ2xQW7lv9aHJolSi8U
	Veozacq9pNnBfXO0K1RV9KxXxjjx5OMBxsfYdhVZ0cSc28tP866Scu0nTFUmxbAw
	yxOQnf4rCVrTpKL+gDAy1fb3Upd7xBI+aYTZoG5c5KzalfFWFiSvjsm+CFtN+fHk
	tLLz7mGqke79Wt8QjC+qF8Jpq2F+cTrd5gQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fuu28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 11:49:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so40958301cf.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 04:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786103397; x=1786708197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Q7ltlk6jumptvg0UKNrbfY4uFng06GgeSVXcWXNSP0=;
        b=BY2gjS4X/9ubSaqhmLBxBjvRDylcrmyP4i7qJUtmhjTQMKe4TMmyYsag7org390Rab
         nGkbrqU8ChIWD2fHM4HCHuD4fN67eEcp3hv7N0eW1klUZoOifMHLBYxbAwAf31JBSaAE
         fSGQY879bJLV/LSnAs/PBSsT3wpUUClivnUfyKQs/9gxypbTwrDy0xHDqE0cgnEyCpkj
         98972+whCP+sQeVLDBueOCNxL/xNWmCbtMY9VuXlLCTS8ofj9QoFevdSy28IYlS7R0+x
         HUWv85ssWC+9QaLkdGjdjxAjykPjLQ820n0Qk5/Nvt7oRwFPXIzYPiN6znp4p/jBN7zI
         i0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786103397; x=1786708197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Q7ltlk6jumptvg0UKNrbfY4uFng06GgeSVXcWXNSP0=;
        b=jBkb4MKksfLxMQWHUyzKhCLZldzGUgnnmXwmMsHkRlcxVLD6pmcqA8aQw3rWrgxydT
         jLmdIPGDDLCdYdUZ8LppeWxJhcapP2STIy2npULM5cVd7nkmQaJCvBCtwlwMRjkaT8UG
         hwpA1HQX6p8fhRrNIgHeOxA+CRcVOFY1qGM6Vc4Aix5Z3aL0QvHftNadnNR85IxBSRs9
         I06VdFWjwP4Nv+CB3uQcQKpwbKkO4zOXGLPzPODjwacDo5eHMUehXvfLhV6FVFylaz2q
         t5WIzG2fMgGaVFkBovp1Kj/0It+C1lT1ipCjeyQ4924wJeMAHD5Zo/HW2DRwMcvHik/k
         5IhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxGHtrHrVbzt0MZOWkOkIOrEhSc7LvmbIWXDtTiqwDkdiNSC9CZAe4+8we0maZouzmyfpjE8rHthBo@vger.kernel.org
X-Gm-Message-State: AOJu0YwJCKAMmBs5ibeDg7/9W9VUAWpYbiPUS74mqc7HurnZpd1MSOAh
	PXhYMFWvxxnl7rUP+Dn3r2WsdVkDOjB2B0QG9xob0s1QU7R3l6kfpXbABbSUKbjeNyell/30DMJ
	st0DUX1FIznCb3NCpkSvyn/sGwaSMkmQb5nn/Oo2qFhrwWMCXN47U9dlyFteJFN+y
X-Gm-Gg: AR+sD11q4HjNxhd+bmAtCdvEoA7wqv+ckKtGe8liEuXG5izmXNbcvCWxsLhxyjrT9NN
	pu9H4hCLuX5XQzqQojTWfezK094TIp8iTMAGXDXk6hp7oPti7fbCfwO53Gq5w07Pz+TwxKM4VWa
	YY3gnivrBMm+3H/LN0ucCGep//rRM7bM75GeFbjrKfA20Ex//2D/LmPijvFn6BEyLO9NGy0y40F
	Q2NLWqxJDXU093HZ1Id4sn2eY6J7k0gGvdaV5vn0ruJ6i6htybQ+URlYb4Z8wVe6emTp0tuzAo+
	a7WNWzhRY41MArIvpQ68yFHZUUS/ev7jaiheojNivFXSD+DSOVLfBBCbh363S+QSgPtxkzt/MfB
	lXlJPxftubXqEwCwjU/LeKbHL
X-Received: by 2002:ac8:5a91:0:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52ce61a411cmr225592211cf.33.1786103397516;
        Fri, 07 Aug 2026 04:49:57 -0700 (PDT)
X-Received: by 2002:ac8:5a91:0:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52ce61a411cmr225591781cf.33.1786103397117;
        Fri, 07 Aug 2026 04:49:57 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c9047esm43046266b.33.2026.08.07.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:49:56 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: djakov@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        odelu.kukatla@oss.qualcomm.com, raviteja.laggyshetty@oss.qualcomm.com,
        vivek.aknurwar@oss.qualcomm.com, quic_afilipov@quicinc.com,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 0/3] Add Qualcomm CAMNOC ICC provider
Date: Fri,  7 Aug 2026 14:49:48 +0300
Message-Id: <20260807114951.4164439-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5MSBTYWx0ZWRfX6NTb9uLghmBq
 wUahcG/06pK+kJkSYMo+QST425Tx89/Pkwkop3eG0kISJJRhi65D4MttT2dDYYe5/cWE711RrJB
 OMclsZkOh/6uH4+D/x9hAmE4Z6JcXPq3kVHAqhGLhz/KgpE5IuCxFLpDNX2GElc7OSz8aNiXs58
 rt7/gl8b4kwGo5hsrkvVzXEJoLcxl7uLKXdJINZjOaYZzs/Sk+TDIyWmV8lZhegPbggov5Wdx7T
 5Aa/G3LJj6vN2x4AISWB5evaIcsZx5WZqOSdpNsVuPEm61akOojV3QikX8CkjADL+7giSUUzPt6
 YTgvk+ZqEgrYOgLDPpqynRxwWSwnf2V8yllIgVborBddhbK8qIdbGPQK/rvq2Qtq9t/u9eWHJOx
 D+H0z40Laz5dyUQkT2qyJtWxG7DRt2zrcDwnOXfvWUFpHAuoTd7o8D1ffHF1CJ+LUaWXuPuO1Ah
 G62J4i+6eKhIzmhn6fA==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a75c666 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=BzkhFthF0TqQFAEqebYA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6NDykGvwBygh_QNA56tSp-9YfL8RwDgH
X-Proofpoint-GUID: 6NDykGvwBygh_QNA56tSp-9YfL8RwDgH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5MSBTYWx0ZWRfX18p7blYY9vZS
 AmgQs++iEKdkYEADlbaB3Q303TkXZ+qJhw/qDuFoYxle3pS/GtsBDwpzrg3+pF24+qhZPFG8u+b
 V8p6eNc7LbK/cMqF6cjJMNw6XB5Ap5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070091

This series adds a device tree binding and driver for a Qualcomm Camera
Network-on-Chip (CAMNOC) interconnect provider.

CAMNOC is the internal AXI interconnect within the camera subsystem
that arbitrates bandwidth between camera sub-devices (IFE, JPEG, BPS,
etc.) and the external memory interconnect. On current SoCs, each
sub-device that shares the CAMNOC AXI clock calls clk_set_rate()
directly on it. This is a last-writer-wins race: whichever consumer
sets the rate last wins, regardless of what other active consumers
actually require.

This series introduces a lightweight ICC provider for CAMNOC that solves
this by leveraging the existing ICC aggregation framework. Each consumer
obtains an ICC path to the CAMNOC AXI slave node and votes for bandwidth
via icc_set_bw(). The ICC core aggregates all active votes (max of
peak_bw across consumers) and the provider's set() callback translates
the aggregated result into a single clk_set_rate() call.

Consumers encode the required clock frequency directly as peak_bw in
kBps (e.g. 400000 for 400 MHz); the provider converts this back to Hz.
This keeps the provider itself free of per-consumer bandwidth tables,
while still allowing a consumer's operating-points-v2 table to select
its CAMNOC bandwidth vote from the same OPP entry that selects its core
clock rate and RPMh performance state, as shown in the binding example.

Supported compatibles:
- qcom,sm8250-cam-virt

Scope of this series:
- dt-bindings: interconnect provider binding, with a generic consumer
  example illustrating the interconnects/interconnect-names wiring and
  the optional OPP-driven bandwidth vote
- driver: CAMNOC ICC provider (drivers/interconnect/qcom)
- DTS: CAMNOC provider node for SM8250

This series intentionally adds the provider only, with no consumer
wiring in this round. Existing camera sub-device drivers on this SoC
will be migrated to vote through this provider in a follow-up series,
once it has settled through review; that migration is what will let
those drivers stop calling clk_set_rate() directly and avoid the shared
clock race described above.

Patch order follows binding -> driver -> DTS so that each patch is
independently bisectable.

Atanas Filipov (3):
  dt-bindings: interconnect: Add Qualcomm CAMNOC ICC binding
  interconnect: qcom: Add CAMNOC interconnect provider driver
  arm64: dts: qcom: sm8250: Add CAMNOC ICC provider node

 .../bindings/interconnect/qcom,camnoc.yaml    |  98 ++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   8 +
 drivers/interconnect/qcom/Kconfig             |  10 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/qcom-camnoc.c       | 184 ++++++++++++++++++
 .../dt-bindings/interconnect/qcom,camnoc.h    |  12 ++
 6 files changed, 314 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,camnoc.yaml
 create mode 100644 drivers/interconnect/qcom/qcom-camnoc.c
 create mode 100644 include/dt-bindings/interconnect/qcom,camnoc.h


base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
-- 
2.34.1

