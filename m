Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273699;
	b=EUb7LwgzUGZ3I7awXKjRrzLj0DrJ7/ZzE44wRBbbnj06we+BKJ/j/MPXz0WvKIfjcNPz
	 WsZ9McyQBw8wqd4mPKZ2bEQ6oR5KEy6/w366C+ua6tpR4A9kPZphlc/QbRxSSlsl1jZqC
	 z6tb5OyCcmlZ7mmKQB3ID16RxuCWl56B2S7ndW4K52uNVCtuMZhX9m7FIKsxbs0Mk0HJH
	 2GgnyLG8XJ/7fK6CVFo836z8A9uzTIXWWLqJsRQBpXB3o0Ap18bO9VWkebUgW0Vfo8zMI
	 cBCwyHvC86YgfqUSXQjEYXO/01JkbesNTRgcC9773tdUwbWtfEzA3sgw500haORF6xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WsXub+WlSLzh9eajH+799I+X8NB1SZ3h94BczQMtqlE=;
	b=ggL0+YrGfkmQ8+FbR3KtmEnOMFM5B4sFMisGnf/G6v++Fh7l3EBiGOGo9HkhTEm/xeuf
	 q87sZQbE7L+eKp0riYgefeCv9oxXPsFSs1vEmbsF6odooKj2xy0t7jraqpgnFCPW0slfM
	 JPupFceB1LoA5CRzXNwfqUPFE7EultnTV39EQXE4797Za2HY2aKDKmdrq+ErktmATyi0l
	 wQZuMN9xZT4GRZ/lrBmgQAbKXploLTZGvG+AdWyE883waJ/nEf6MOwtqi9wDF01963ArE
	 Vn0aHvRC2VKn1k3M3gJtCvC02llxsrN7ZmprTYYfpt5emZgZ5jiOmpr2sY8stxbQ9MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQg3oT0a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGTlrQrs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CE1606A336
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7CE1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQg3oT0a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGTlrQrs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jLhd888686
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WsXub+WlSLzh9eajH+799I
	+X8NB1SZ3h94BczQMtqlE=; b=KQg3oT0a237529l/KSeXFiB/0ugmLHzFwHZ1Ju
	qVZLwMUPmpnOAAN9ueAb4MUiXrtCjGSsdXlR5giKsn827sKLl0WTOzcq411B4jgG
	phtu2rdlMgbejbw33+Mh0/xSnoyuSdj58qLnXdySjYjjbV7ecvdR0gjPZ/SPsX3k
	sBpnxS8kdaRFq8ApucDwHSe69JPMAj6m1QVEHPUd0vofgsMrpzv9Rh1JkmZ8kJWV
	OxbjoD6t/oGPVhmdYD2ncJRDP46Nhr+kwPslxjuAxx3T9p+NKJ5Pv7pMTTU593vt
	RLdBFaPO0htqHJuCUKFvgd2Z1FhZ+6qzj/LwCxJeGFajp5Pw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjasaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:21:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so21239425ad.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 17:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273697; x=1794878497; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsXub+WlSLzh9eajH+799I+X8NB1SZ3h94BczQMtqlE=;
        b=AGTlrQrsY/i8k104Ffh1k8XLudDromMrMsqdydQFQNbv6+VfmaMzst2bz5znrVYkdQ
         +trHKHI1nYI4HSEgexRlxw/JWEg57oekymDhfVhbHgjRdvKUwKCudX6gY/ve3DItklyI
         fkn7aZIp8I5ZhRGu7kArYwniq2rlJJtjZr+3XYF6XE+KfevU6ieqE9hE5j7D2HisoxUY
         t8BWlz65I0JiGzUpIUlzDq6MCvOWE7H6XCnD0yjwWRfyqX4IyEWN7tINp5s7qOwJ1clj
         7ien7KrQg9q3hUqwQlF7vpHz96zJNKvXDH0XjppvXVL9+L9OoLWO00nC5t0nN/1B8cgu
         7sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273697; x=1794878497;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsXub+WlSLzh9eajH+799I+X8NB1SZ3h94BczQMtqlE=;
        b=qHS9d0trQHrwEPm+1IElVVKGOn0zm7Sm21zaOw701GMeG0K39fob0fQNA9i+WoGtlw
         xuIiEyveaGjfHWyslXQuiGgrAZoSMXZGWqOaVw4RXUZbji2yNJN8dd9TU3O9eVtW5ylX
         CiUl2EcXWXK96rjw3JwxK17KRqNpssb+r9U7y24Tztis9Ct6liaMVSvGM9Erzt/qpgML
         O3ia9dT+Wy8vprnuzSA07N9eCPrlaKZDJCqIpR2jsBTwxxhEzz415Q3PqMq3fCx7+QRG
         w5mvpJJBgEG/XwZtcv6XFiKOYQqqxkw2PoI5eERFCGXanu0Qb1HmWRJMUyHWlBCXhFLq
         Fhog==
X-Forwarded-Encrypted: i=1; AL+hErHbgrFeXJLTXAnjYs0lWhVsmamUaGJdd6NDDbzzdQBmQtYiW2K3ww2ZYAQCdjLy+DWJnSlEFMkuDY1q@vger.kernel.org
X-Gm-Message-State: APuU4Z+q7RDXtRBOCugpcrxFggSRmPeTZWphOVaO/iEr/tvNN1zYkxqv
	6Z79x4cBF98bt7R0YUjBqh0EC572JLm8dipBGhvFybjzWX3wIAiPUceqLvBwrMw3c/nc4uwxRVG
	TOK5SzWFFMBIqpz0XxwRcIHHogx5CkqQaU8sLF9EsXoC2e9pxoLqcRxe0iUwKptYy
X-Gm-Gg: AYBFou0pYhwWqdkkFYeSbpxH3QJyQKe15W5u+ww70NMJHQQkMrGG86UzWhJzDVFESoH
	RMUVn/lNm+TwtJ8UzaabtVPYOh31isr9cQhXZO+1fSxICe+gIa33J4VGuM6eJmWt+kicMGUWqvC
	SeYXZyjGKfpYxvk96W9X31WniwWGxmi4rULXgywguhuSPBNR7M1SPNkyf3medaZxIzCRxEvWLiG
	BkB/wSKyO76JA9vGoNw50Njib6XjDJd0bXiQwaw7FICH55yvJGCWslxRvQiXgz+eEUYf4366Br5
	/kWk4HwyOz1yEZi3zGwbEZkJy+esyTKwc3L4GUdn1i3yvqHAdLPtqdrigQuuiBs4htb22ZUg13Z
	ZEnXELTsGuykEOAnoI6R9+0Mbmd+DuK+Yn/W/3q3RRsc9efAuwelg7wAPq1pAHOBxyVEulZUdrG
	41T1i5bGHbKIb+f/z9lBdsDDlYWwNkJeGSKlY=
X-Received: by 2002:a17:903:4683:b0:2e9:61bf:6587 with SMTP id d9443c01a7336-2edb91a0968mr8672025ad.49.1794273697124;
        Mon, 09 Nov 2026 17:21:37 -0800 (PST)
X-Received: by 2002:a17:903:4683:b0:2e9:61bf:6587 with SMTP id d9443c01a7336-2edb91a0968mr8671685ad.49.1794273696555;
        Mon, 09 Nov 2026 17:21:36 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:21:35 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Tue, 10 Nov 2026 09:21:13 +0800
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIpx8moC/x2MSQqAMAwAvyI5G7Dign5FPNQaNZdWEhVB/LvB4
 8DMPKAkTAp99oDQxcopGrR5BmHzcSXk2RjKomyccwUufOMhPhDGFHCXNJmiehJSW4faN1W3zB1
 YvwuZ/L+H8X0/JnUaSGsAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273689; l=5633;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=6v++39XOGbbFAzkRVgS0Vg42OeSuvf8hqOA834NOJaA=;
 b=8KzmvVv32p/bODyI1wHWJH2fgG9qri841UmrOE9Lj28HLl/jU2M/Oo9wuLlpu0XO2YRbLQGk4
 GwKTCFBKKSVB2amfcLn0CMUtI44xdBbOTcRbvldF2M9VCrVhL2aQiGB
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: eOPHk_rZrFYCoPG8pIYTqj4e-r0yZ5l2
X-Proofpoint-ORIG-GUID: eOPHk_rZrFYCoPG8pIYTqj4e-r0yZ5l2
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af271a1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=DBu9zyGB671Pxo6hLEAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX6Nen8LyNoVSv
 ehTgv2zmOaSC3BOc/AQuX0e0Hep62rIfXyQyJ6aTBTr90DbqDpMGzDhQXj5zaNfjEh8H5SElnMX
 Z7JKpPWgbbkM2G1KTn8FGdbZ8ncY/cc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX2nGef8U6Hvaa
 +dmMaondzlikGOz77LyonJVkZ8EpDj/ySmLcZPo8k8fTOlfuedOIdgdWeD3ORS3gF+NSyNLV/PV
 TU9l2yvQRu480dGuWaYPYCcrRc04MLDJ3k8QElNPomOhwKa40yU40RMi5LJtYRgFzq0TG568Rz4
 hSK7jmbbY4TsxIDx0J9igZwTXRgm2c8yWHDVmvLUYNAYUtW2lhy4e00ItDec68GNE23LQLMptyG
 27r8Q5ZJuJzcq+RwuOh9eVRT53Q9wb74wF/kOKpKXjS2O/VdajHGaYtjlxkO+KMI7AMo8Fszr+Q
 K4vS8ZlPNFJLnDKIBLq6gFiVKowyLBzR2fMTiTmrdEUA18BGsxxDJQ5k4Ev8xu3mbKaMgi1mAtq
 rjmUkf4go7LLWNbJ8PD/76Bz+MUAcDkeB629E3l+lNLd2uaO0gECpcjkzup+ZfKNTmEQO1k6WlD
 91eKHnkpmvZhkvqiH1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100005

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
Changes in v7:
- rebased on next-20261109 
- collect reviewed-by tags.
- Link to v6: https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com/

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

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

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
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261110-fix-trace-noc-probe-issue-e75c5a649fd9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

