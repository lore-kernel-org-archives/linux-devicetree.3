Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47F52FE066
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651197; cv=none; b=gkW8qETXwsKQooVGtbUEXe8czKa8ea+7qmTBnesNXHVkow3+F0uJwHLtpvodYVnVNvv76QIAQYPiXKvp+0oICqbGfzqk4yv3DxEfQO2xFDjmbeEP8gGG6bgBv4EVyuyIMmVgTfvflcNie4IERAjInjK6jnfw00F3PD16QW93Fc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651197; c=relaxed/simple;
	bh=xvKnn8xG6ZPfwD57jd8SONQvv7hlfRpKuIOQb0FuU0w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pF7zDToYzEbxyoOYQEgE14NWla5r6FkwqVSB0+kFfuskQmX0++9D3Q0HSQtyfzKFBv+44hAy9SBwZf2Kipc1C4iiE2Prb2pVvbb/rDOJRm/4qojG8iKWCxad9Y1mJlsagwxFePpkX9+Zz1NoZphw70F1FYPyjRa8JFu2hUyUTe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/Jq9D2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3S9OUR4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/Jq9D2H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3S9OUR4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXS7E2330204
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ogfiyANGIl+cZdRVADkVZg
	m+LDhUR6VYbG3snsLbxtY=; b=m/Jq9D2HjYUNwkTHpnxE0nhPb5Nf6kSiAv+dum
	834OR7J9tZ7z7eODykntCWZsUfokm6PG6VCAG7IawYTfV7sDkAxtWG9ia+rqHauD
	hp4dxxUICfyzAVieqNt8pb4yA3BlmmcnfOHuIgzWcsdt17WR0fM9VAQ0bIEsn9IM
	AcIKG13s3ll229RQrDGavco6SD3NbWZ5uQPnoquhOWQSgX3hRPEb2c+WiaLU1wmu
	x+GxBkLRzwHuLm4iulC1nyjCvBnCZf9QgJuLVq+jb6dQfx9+ofGdUOZh+QOa7edp
	srmGkzGNwXyeiwMGKxrv/X9EOC6LDEuhLdGSIeGy6/vFsZqw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24t527-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:39:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so185054a91.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 19:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651194; x=1784255994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ogfiyANGIl+cZdRVADkVZgm+LDhUR6VYbG3snsLbxtY=;
        b=O3S9OUR4FR6Kmnyn0QtmvGH77Bbca9RfeBdUQkFaXI9j4QWHlVL8impoSv/cDf3O/P
         2MM3MPg7+rfhyW+NUSaH66dtAz6N15zpYBocJ1Evtc18XSUJ8vRM9AW0trAiwphYkACE
         F+oO46RAt9f1VYg1ltrzD623jj3VScV0NUGloZfM2BfTmH7DzO957gYzxcKjTPTyvxg3
         ECiP2aO3Sp103mxk3qsGVG5eUnm/E7mY4WGjaGxpLhxbABvRDHE8xuY+UiqqjwSC6buN
         pfbdqdA523F7hyquzAV0xdOkunncEIpQMaF3oi8272jjyGfjIfbQn8rwiKkO9WKVVpnW
         JHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651194; x=1784255994;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ogfiyANGIl+cZdRVADkVZgm+LDhUR6VYbG3snsLbxtY=;
        b=b7SydpVTd6pLjPW235Svh+erbluKV+j0py3L9SWbZ/h5S1s7YvsLlDqY960ao7OOir
         dSY0WnxVOU2JkpVVlBRU+PerPt9h/oPKEGb31alIRA2zhjY7KiU4BR6++Q3Ke5G8XNlR
         ylNR28V+y6zKSHWRznzHVwcDX2SWUd+GORQA6lLv0E/0sb38XFjiUC8w9Q5K/wWwRa8g
         po4Nh7lUeeHZVYghj7I0rNmqmPTyI3k7oitjL5jmnvEfGneeXifIak/1Vs/RHHXr8z4M
         Wz3P0UM/fUchC5u2bLsPJh0vqs/ZqVTc0oUJboo/uk3suRFhm0LCBGgDfb4NArNGWIB0
         +AcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5a3llSXmTLPfacFqTx5od18V/mzgTAieDcqOdSf5l3TVeTdJbXv6i0qwIM1cb913e8pywe2sMgeXJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyAAFAIY8lEEZxzOjvQwJc7wwu4jLZw613BI5hzAZiBFU+fXaX1
	NwcYVtMLgNE/VSf5p+YDDEUrmuxjR1v9MBMW5UcnTXUGxoMSz/8UP9YcfJrggtPfHjSTv2kDWsy
	pItXmktSNDwCSOF+oRXA7qTubMeijDFOSROm2xF6AX8Oj5Ib6ohsEfS7V5itM1e4X
X-Gm-Gg: AfdE7clvfGiv0ZhDM7QGiuerc/x0GQWakdcDz5axiBRoC4Z6qNsamYrT3TOJKs5kuOj
	7XrD+5XAzm6konAH8MQeTdAs/ZvtYEdZa3aublNiqutf/beXYul0eSnP5D6rEEKQ8iocDrUq2fo
	k0SINnlA/uwmtB7Onauns0Dko6XMipVo7hjSd3t8VOcKOhMhraZq6O9B4ic69e5zXwdPkINcIkr
	/1RL3ASHPZP3+epwGOeiy9C37DUrhU39LpZtbnqakRDve0f16AnZLJWAYlgtShrfvQmp+9HviZb
	w4lgT3G6Z344Q6Gs47HEx3WHtM5Jcdxq7aX0HI3y14N728GumVlEFekkKg73qd0N1n2/+uJakTI
	COiFMAa5PnCO3ICf1Kb7Nyr/vi8/Jzogb6/O32OZ5FE2AhdoTJvJrJ5q6GklnZv0oJRwEDQBUfg
	==
X-Received: by 2002:a05:6a20:43a7:b0:3c0:9c18:d5a9 with SMTP id adf61e73a8af0-3c0bd1cbb17mr12737956637.70.1783651193821;
        Thu, 09 Jul 2026 19:39:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a7:b0:3c0:9c18:d5a9 with SMTP id adf61e73a8af0-3c0bd1cbb17mr12737914637.70.1783651193328;
        Thu, 09 Jul 2026 19:39:53 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:39:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Fri, 10 Jul 2026 10:38:59 +0800
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVbUGoC/43NTW7DIBAF4KtErEsEw39WvUfVBeChQWpMConVK
 vLdi7NpFrWVzUhv9OabG2lYMzZy2N1IxSm3XMYe9MuOxKMfP5DmoWcCDDTTIGnK3/RSfcSxRHq
 uJfRGa1ekUUtwgwc7JEn6+bli797pt/eej7ldSv25f5r4sn0CnTjlNMRorOLOpqheS2v7r6v/j
 OV02vdBFnuCZz2gjBqrFbCkIQFf8cSDJ9iGJxYPGEduJUcnVzz55xnGNzzZPY/JBymdl4ateOr
 RMxue6l5IRggcHIbhP2+e519yVrroBwIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651185; l=4545;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xvKnn8xG6ZPfwD57jd8SONQvv7hlfRpKuIOQb0FuU0w=;
 b=0z5kUo8p3xEnhRrNursWnU9U4wwJwwg8oa11GCuH2tzEXwMqm1AzrKUKv5EkbA/XO6EcA6Y00
 204f2jXiTrBC03u6tpMQHI+a8N+/1qGiO3hEQU5DPNyYIJesO6Y4161
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: eHqZpo5KU4aBI0JfyLj8qVDdx6z_Z96q
X-Proofpoint-ORIG-GUID: eHqZpo5KU4aBI0JfyLj8qVDdx6z_Z96q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX5TBCg73nbNV7
 3Hr2l142KbGu67boi9ZD1uc/L1Dugs1YIf9IVEm/DZKQ5z86VlACg9uCf8ckjXlkDAY/VCSMWbf
 TAGSaGphQenGd+xIwELMInVxiPeeQYg=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a505b7a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eJfGDJWfQcjy8rMVS6kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX04R0Z6W6Huly
 IdjJ1WZkBhMo1/bpmN6+++WLeiz+QXM0/skZ/CU08Z3bUhQp8v5x6lSyNfYoP03nY2/HATtvnXO
 5JOZCfZvkGMRRLF5pzOrrWB8b2adM2cdQKya0+Ks4SYXhhkgwtzk9+yfrku47dl8XpUQ181Nra/
 NE3gU1xbCNOdEbUjMvZWsNhEIBUUOrY+HIixLPCK8C+oJq3auhAAHhlaakv5q/bIX3J+O9nZ4pa
 PQkRr9joNNzXY4DPxYM4XhYHiWNVc99ekgxsKXVl/bcWHhSuQxX4YDxmxsu3zI+VUP/0ZrHg1Se
 TRNrt4vOKmYEK/36Toc+gfbKPr8HKYNk/JWpxU6qs6uqSnoBhejlj5UwQXtJJGnIgGqmBlzsDVs
 SxCpDbnVo4eVnrWYxdW4y3TCV+pZf8mJwuQj0hsLH9bjOtotvbRHoyQWLjaA2UjMyEfODVW+ewU
 zWYY84GWIUi9koxckrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023

The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
forces the device onto the AMBA bus, where the driver must read the
peripheral ID from the device registers during probe. On several QCOM
platforms this AMBA peripheral-ID probing fails, so the traceNoC device
never probes and its trace path is unavailable.

This series drops the "arm,primecell" entry and turns "qcom,coresight-tnoc"
into a standalone platform compatible. Without "arm,primecell" the device
is created on the platform bus and probes through the platform driver by
compatible string, bypassing the AMBA peripheral-ID read while remaining a
fully functional Aggregator TNOC that allocates a system trace ID (ATID).

The series is organized as: binding first, then the driver support for the
platform-bus compatible, followed by the per-platform DT fixes that switch
the affected nodes over to it.

- Patch 1 (dt-bindings) drops "arm,primecell" and makes
"qcom,coresight-tnoc" a single standalone compatible, and updates the
example node accordingly.
- Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
match table and renames the itnoc-specific names to generic tnoc names,
since the platform driver now serves both the Interconnect and Aggregator
TNOC. It also restricts the ATID-unsupported handling to
"qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform bus is
no longer wrongly covered and correctly allocates a trace ID.
- Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
fixing the probe failure on those platforms.
- Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
"qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
tn_ag_* endpoints show aggregation), so it should expose a system trace
ID rather than being treated as an Interconnect TNOC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v6:
- update commit message for all commits to focus on describe the
  hardware itself and the hardware issue we are facing on.
- Link to v5: https://lore.kernel.org/r/20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com

Changes in v5:
- Drop the separate "qcom,coresight-agtnoc" compatible. Instead drop the
  "arm,primecell" entry and reuse the existing "qcom,coresight-tnoc" as a
  standalone platform compatible.
- Update the binding, driver match table, and per-platform DT nodes to the
  standalone "qcom,coresight-tnoc" compatible accordingly.
- Rewrite the commit messages to describe dropping "arm,primecell" and
  binding on the platform bus.
- Link to v4: https://lore.kernel.org/r/20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com

Changes in v4:
- rewrite the commit message for the patch 3 - patch 5.
- free the allocated ATID in remove path.
- Link to v3: https://lore.kernel.org/r/20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com

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
      dt-bindings: arm: coresight-tnoc: Bind on platform bus instead of AMBA
      coresight: tnoc: Bind Aggregator TNOC on the platform bus
      arm64: dts: qcom: kaanapali: bind traceNoC on the platform bus
      arm64: dts: qcom: sm8750: bind traceNoC on the platform bus
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 16 ++--------
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 37 ++++++++++++----------
 5 files changed, 27 insertions(+), 36 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

