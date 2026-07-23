Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F79830C16F
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771220; cv=none; b=LBRtAQwxcAQMtJ+7q8nKO6O121TXwTengkZwiNhWOLyczhhrR919/FT6ucHFfjZdoRF4FfG6MT/V5LFgm1hfDUBpXpv9s/Ud3TWzWCzQfC7HRT7MAprQ3RURRV9xWWizlmsWFR04sjigjmjJpRIIeH1Sd0idi9kYcJF+D+70vuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771220; c=relaxed/simple;
	bh=bGlwfuxl7Ko0KTHUMFRKzd7hgfPMUkhhLFboxtPnpwY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IHfg6HB8PG6VE0RWI//R4ypsu5xvMLbW8tE2BV9Swgvg6wBEOWRn1h7FxWW72odRydRtc1xZR2LzP1Ef/1cuX5XzYD+1lQJgNcBIkwKBoZe/dpiwE8RWhemknlaDoJm535AanEBngiJauYex+qk8FqiF1wJcRuacUVRqVjDC8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsHj/hdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZ20psqD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsHj/hdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZ20psqD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0Womu2658132
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PAtArUaUjCVwjhnUvEpSOR
	EWwbFp3QpDYdJcjV8SPts=; b=hsHj/hdNFqoliwwuKr2uE7YRIWsym5fb8HDzHt
	PgJ5BT6E7ecdfBn5CwDE0BulSxwB5OFqztmKzT9wnzRsej1kn2NLRnOox8rw+X8g
	tglTR2Y9PdiCzW+XGa9oMpJOQHk1WedpslDwrIoa001bPZAu3ew/1WEcbQiDZ7Dz
	xS0wznE5TWRgQi2D1TmeEbO2S+AG2PCQcAbynF+MyxWfWij4/drEyHU2vo4o0Sy5
	F6DuqmjuzUKZUlFCCWoBGtqkA8YE0VCV/77Zgo709GSCxum48Yk6borHLM2s0OD1
	DdFVmcoXsP2AtqFCjzEu8eZbKWgO2um6PikLN9bkQElKchyw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b50buh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:46:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca3673560so2920485ad.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784771215; x=1785376015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PAtArUaUjCVwjhnUvEpSOREWwbFp3QpDYdJcjV8SPts=;
        b=QZ20psqDYMlzH0y+7u38cCOp+GELtviVgQK+d+y0wrXtRTn/4BIfggif8KK/Z4LXDI
         ulA60JlwvjQqBG8TnP0GEiDG8kOI9+nnyPO2ym9eipPw1ni3mMtf52ala7CFABIjHEJF
         2z8F0cIeuKLWk6wbjxno6UgkADKqal7w/SjFnGllq+wya+l6YDYpzVs73AlGRil1f8aT
         YBdh3qGY2DhM+rOFPfhdoYPJPeqSA2JXggIEv0mJqyvZkrNpxb8q40brsYMC55KaRtdK
         PWp+40rpkzIOKR4l5xYs/Zj0x/DBuuABqSvLxuLtSIiHksa1/jln3+dP0Rd/u3T2Hh0G
         pYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771215; x=1785376015;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PAtArUaUjCVwjhnUvEpSOREWwbFp3QpDYdJcjV8SPts=;
        b=TsKy1Wnx/qWl40+sMdGRY7WfdcbfFJBNKCWBA1GzZHNd1isqTn7Tp1qFBZ//zPQ8FN
         6b8XlJVGub8fiv+OEeOoy0lt2tYUEOkiXJVFfQsFiE5g+XOVwS4c9e49C6DhW+NjuyKy
         wjy3GG6hrmknQqDIDFsAVR7UxpyG2EguY+ilk239RDu60so1UEAGu3JB5VuRksSFwZik
         mhNrrrxT76M+x7g9KGWfYTINJgyvOetGZoPpv3xXsZL+Zu3syXr5VUCSH7BEFeRCvFoM
         bOD6eRwfpa/jmoGFUL6AZFmasqXcPFNzVkNOjTGaWjLjo9RdxY/pao/emvyRwK5qs1xr
         qrOw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0kj9NJLaoAwC17AeLvUv3jziBdj60aUhfMa+mjCyX4wF7Pm3zvEad41gZYjju+Bkh0gEJvY4P+m8A@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Foaid9vAAgZ6/yWOSw6+nT6UnmC305/3qIJ/915cSN4YtQOn
	NiByeqJ+19nTKurQxFLseF1f32kwr+9bLtG6ziNpEar78iflq+sDvu7qClWYKRDAMszRU04ysOI
	L/w94Wt3LhHNdqfUZ7PBbm7Sz2BrEwSdHIGL99lviOwalLiTOVX1n2N4vkHCKw0u/
X-Gm-Gg: AR+sD10FB9CHRqxKq1KVPDGsC9AGSheT20a78DjNQhh/4SEQU7WRy4YQO2ShZ1jpt73
	0sVPdf4sm0jRBZgYxxW4s0o13GGUuz5+7iDQgMiVQMfWug9PjhnzTdy2PVQjaixLTTX9s7LdVJy
	0xUrK6juuF3vwgwRmPQT/9wLuudCOBernSYXnxVJnjuWEC1PsnxEusSzDrx5HfZ4AAVPjg5RPWB
	ZVliRK++dQQ672I4Ab/4gFYT7Sc+Ml/g6C9Dnmf5rXzfrQMCFv+UcZNilZL0jvrWefjULsK749s
	tZrdFCFChePU8hyiqSxfl2pLhek+JWv6bCtyixSiavHvT1z63rOJyaVxOPEGjfu943vy8U534j2
	XGGnsUZNQADpIzqHMjooqSc/5lBPJN8GdACpjcrKRuiShfyupeBqbLpKzXckq6XY=
X-Received: by 2002:a17:903:384f:b0:2cf:9c35:82d9 with SMTP id d9443c01a7336-2cfa6b7cf03mr13371295ad.10.1784771215014;
        Wed, 22 Jul 2026 18:46:55 -0700 (PDT)
X-Received: by 2002:a17:903:384f:b0:2cf:9c35:82d9 with SMTP id d9443c01a7336-2cfa6b7cf03mr13371095ad.10.1784771214591;
        Wed, 22 Jul 2026 18:46:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm23389995ad.10.2026.07.22.18.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:54 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Thu, 23 Jul 2026 09:46:29 +0800
Message-Id: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZyYWoC/x3NwQqDMAyA4VeRnA3UqpvsVWSHalIbhHYkYwzEd
 7d4/C7/f4CxChu8mgOUf2JSckXXNrCmkDdGoWrwzj/c03sMRLgWZZMtfTEXYsNYFC3JrgHHuEx
 hWEbXUwc18lGO8r8H8/s8L/4DGhhwAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784771207; l=2649;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=bGlwfuxl7Ko0KTHUMFRKzd7hgfPMUkhhLFboxtPnpwY=;
 b=lNXsfr6unas8t0WGnGVH6FFRT2E2JrcFsxQ1zu/r4zI8lMZL1jtYqEJZtZ8Cic8zE9L822GMR
 thmFZsMNnodDNh2eN+6j1gPSQbHLC79KlUPQuzhK3MHc9uXMXVY2pvc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX+K9T9x9x6OL6
 a0vQgCpD/yAqIRkkvRLaM0KS+N/WjPV82w2GafZOJq5KVucQoq/oJbhntFD9q7h7dnrfzhZ/y6e
 60Ph/f/ctnp0KUKmltcAC4wZcVPaIYCzHkcxkimNE4Ri4j68AbaD2UUIOCq+d2xBwWktB0Uv9vZ
 NYI1tLqMpqNJpwNlrTI2wQOmnnSuvfZ6cErY9XkKpHMse95Pt0BdwTHzUSGTWTziA49zeIIovg/
 tTd8x1BfyPvFTK/GkW+pxUAI34Pes9Ev4v2WY1DtXPLzkJGr3nMz2rQuxWzFQcDGmk/doY54SyI
 UoTSFm8V58E50QY5R6zPz+ZAwOFCjjFacUHI+6eNbqPeU5Wj8HVJ9lgi3mj2jG+Y801iWzOGdP8
 pdd8SPXo9cFE6ZtkQ50tfsazVZsH4H1ZLVv5R9Vn4H2YOwB7cQWkN9E43I3cWvMtYa60gbxjMnw
 1dJb+3Vjz1VeikAxfCw==
X-Proofpoint-GUID: MGnGmhHUXcLvW-219MCzEWCiOWrm1Kof
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfXzlgfhybrbGYT
 edASWDpKyFclsflD77LTVMOZHBAOabASObO36PvgO2M1qzgioFWi8TxKO2e2ckALi1LLj77SScy
 pVlnk9vhPh7YU9CtuVXAjqw8pLS6uv8=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61728f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=gXtLJ4WPg2CJrXxS_-4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: MGnGmhHUXcLvW-219MCzEWCiOWrm1Kof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230015

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

---
Changes in V4:
- fix the wrong subject for the dt-binding patch
- Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/

Changes in v3:
- add correct subsystem prefix in dt-binding subject.
- Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com

Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

