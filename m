Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB22332610
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007244; cv=none; b=I+XLeT9Yv48MENIJAGBiW+T/aDhziyzJM65ETRDc/WwzFmJEqllmX0n7BJwjs6ek2RPThotORJerZZ1O9Q2MhH400X0zZKZH9BxEsa5CUqOuPsW6BiHT0RzYp9LZvz0Im7nr68f3bLn8+FOgGYbSUc6h2I13uCag50Bgj0u7Tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007244; c=relaxed/simple;
	bh=5dbkXu45HFOosDTiM2+ssNvYenj08n9zSxrcchmpq8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kfR8d9TrPSgT7eR9AY4jCFJgeh7RLPty3IXes5kmiSRY6Q1wyay2UtXnzYiReZLTFFLr7A9TEpLQZFSKSi/9UQ4vX3123CQQBQ/0P4QpGzA6wnq2cFiRPKbeqIZaZJMvNNm1w94IZdafKEa43+ozhh9ZaciKB4GrcMBHSDqpQBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdTDPyS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bts2Altn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdTDPyS/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bts2Altn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38d8F3303476
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZmX0wPL5IDlQiB7+koGxyF
	G+YiOFbTzb7mQPIUkyql4=; b=OdTDPyS/NRLLsjxXIKx8tSAL4CoLO1rzH9bxNB
	wh5MjUH1UXL+S9j15t1bJenTdvmlRiXsMhe1+yM3Conbw77Zcq5OiId5z/IDksby
	/wyQA2n6WqXAqiCpkstjsJsdJ4gOU5HGv8CQqILiOCgmJfEiACkqwevw8qC2MGEl
	BSoGcw3GjSnhDzdRT7XXKJ7806Tc+SnKdeCh63zi5AQKZRttFGfQVkpE8XvZk7g7
	bQPmUjtGZ0COSqc4kJRiZWRjQYG3jHOVKC9LBHvCfuyj8km8xmxbTzbPb/j/qOnd
	E7IcgioRy7qGEPy0lASkh3glY/lophhRnXXqnbW5gxibbWKQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p22rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:34:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8482b95574dso4948206b3a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784007242; x=1784612042; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZmX0wPL5IDlQiB7+koGxyFG+YiOFbTzb7mQPIUkyql4=;
        b=Bts2AltnfOgA9IaAjuJ/SPhSPb2cuRGV7dRUkgIxOJd5Nt4p1qjWic2VEWL06sel0P
         g3vxel29W6q6df4Q7ay8/I3lciu0OztxjwGkqKTpsgH84cb0GjMXKtTIQFJXgin1Zhct
         UILhINS4HiMMlX5LqEVUgU/W1H3Ohbn5UDprYRq7gDuXcdkSPaF+6Qoc7SsuDe4u21fn
         AdTNohYYSwfcEvMdHncUwQTC/VlwjoSN0ox2SH9CsT7OlEPlycNHkAiUbNTJm6sriyh6
         mk0rBrK6xbrx+MVNkRKchMCuQfaEVXNr3boVxoNT821xCqI5NtNWb5Jo8QlcV5UQsl4P
         z5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007242; x=1784612042;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZmX0wPL5IDlQiB7+koGxyFG+YiOFbTzb7mQPIUkyql4=;
        b=Ky9H8mPiZ2pTmcZL6MI/vnqsaLOKHk32K6xMmFB/Ay4bJqmoSpA9nQG0dko+/bGPK8
         Div+Edr4OgPJlbt0GSsf/SmJV2xVf8Xwl8wYWak0fvL19z89hOH++3s4J7moo5vEe3mu
         FiaL+LBTr7pmhogWLJ+LbuJS4ot0Jh/fwl1drmNuHGUsSjYEebkyPJfXBHYbcdDBiuaO
         2UOhX4yHcfHR6ZJ7eD5QWe5syD8LuO14SSZb6YGCOr5bGnK6OuEkwzjHASa+m+kTsqDy
         StFBX/DtUGgSA5heErh4t2aCrxu1ncifV3lEKv0SzKbFvCOiFlW/1Ae8dMYGGs/x3Ust
         G/AA==
X-Forwarded-Encrypted: i=1; AHgh+RoQFRhEicdKMalpA8kiknvn3Nzyy46ZhYGP1hUSPP+93lHk9FZw1yz/iV01JI2DheRMotSgpnMp2233@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOFPUg5vJROzanisuUlhbohKS1NCo3e4XHOti7QvD6QE+x1vq
	1IISHz7alxS4bhtsjajtxp0GHepcL9adCC1/OdgILg9GhJ83QXnXtosPlLMpn75LPAJKB74U/yL
	b0wc3N0Na678ijlfw8KTB8udj4DRQmZaBXt3rBHYQIqQ820GWhO+wE3V6hVDXFeI/
X-Gm-Gg: AfdE7cnApGGhlS/G8ydAWlB5zxqrXZZpQe5qgrSXazLSrgh9Qm2PVRhQmzuqrCMi8IC
	Q/K+n+VDZ+RWfGkk+njxe7+KI+Oez6UKt5kkI58uKJ5dbJno0DqctqUd9PCV4Dj0CsoPABjjgcg
	bQuVLCt3iiCINLXaq+Ufg2KvdFxL+BWBosT3p9FmzFhFRKxoa643ElKX2vrboiUshRdTYAQ7uho
	A0LWLJqDbvk7eoRxlj8rN1eILqsxpQtH/kY9e1eIfTPEl6MQnU5fH6pBPhi0lpoLrQXLvR01FKo
	sZTdlMDUSP0lUcuLjChXGCglmJaoN6gUyeIebJ4/fhiPmyJK8aQxoLnTXUJnRgSApVnv897iigE
	BEvpcDS/u9YPCqjTJyCyS++w520BMJwbVohnsnLCouZ6ADXE=
X-Received: by 2002:a05:6a00:1ca3:b0:845:d286:1fbe with SMTP id d2e1a72fcca58-848897aa414mr9625271b3a.60.1784007241584;
        Mon, 13 Jul 2026 22:34:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca3:b0:845:d286:1fbe with SMTP id d2e1a72fcca58-848897aa414mr9625243b3a.60.1784007241156;
        Mon, 13 Jul 2026 22:34:01 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bebcesm846227b3a.32.2026.07.13.22.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:00 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH 0/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a single
 coherent block
Date: Tue, 14 Jul 2026 11:02:30 +0530
Message-Id: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7JVWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3cLk/FzdpMRc3ZTc0grdstzMFN3UihLdFEsjC8uUJGNDg2RDJaD
 mgqLUtMwKsMHRsbW1ABRA82loAAAA
X-Change-ID: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784007235; l=1539;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=5dbkXu45HFOosDTiM2+ssNvYenj08n9zSxrcchmpq8M=;
 b=RhV4Zoi98yplbi+t1A2tNsWzjPpf7bfkl3oqD8x2pcfeF87vrmtyI7bliNxAwO12o9ap8GCZd
 n91wu0dpSt9Cj3acCZjnjnJTdsjF1SJ2iMgj7SVLu0+/DJeb3meFh6P
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1NSBTYWx0ZWRfX2hv+AH4TeTfD
 iGKGxT+bmMcRZVgrdFhHzSmo677HnMnh9gee2hUXHecqv84Un0qV8UeLLgSiMSjZm0IWDS9BbdI
 fgUU6nt55O9TwwxHbvgp0S7PGpTbg9Q=
X-Proofpoint-GUID: LtU4jktjib2BXg-JQF2wGqdOGbVHoYz3
X-Proofpoint-ORIG-GUID: LtU4jktjib2BXg-JQF2wGqdOGbVHoYz3
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55ca4a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ByYuNnzN2TCMuokQ2IwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1NSBTYWx0ZWRfX6c+2/bWK93LU
 qYoB0BPPBB3kBiSG4u6/m37OijaImIZt+dXZ2sTPqPPmn75relzG7FCrmUXV3TmNYiBm4pNeEJU
 QZb1cNL1SqGUw7TfJL7WpVPaFlrrf+SG6mQmcoDl9K7YlwQtGuzAYFFjF4gUnKCswlQIW4v20Cu
 HhGF2bIMRjjIMi1FF9ekifiSNvnImVs5M0/laenV9x75m5MwsxC4UyErPg6Jcz6GZMHkJg18A5G
 YbdGPJ951QpRjxq9x9PWM8wwkD+gpbvdtG1YhFkd5pZnfKfkmbgMDPQvmWPTLgwVFoSz4p9+Od9
 GV8oVtCh4sqdz7JgGqJpO3W9aN+UrQRvOhtM6/b26kEVzXXTuZ1Ou39/tyrhG/kM657CEm+H/Ee
 cBmTPJhGlYtyJgYBnnlDk4/XSUfy1bWp2ChT+yMZ9oMS4Ywq5eriYQ29h7hendVMo5GNugEbZc/
 hsH5RDLLNqDBTJre9bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140055

On platforms where the modem DMAs into the BAM-DMUX RX data buffers and
the XPU (eXternal Protection Unit) enforces per-region access control,
each individually DMA-mapped RX buffer consumes an XPU resource group.
With only ~16 groups available on Shikra (mDSP, VMID 43 / NAV), the
per-buffer mappings exhaust the table and inbound transfers fault.

This series adds a qcom,shikra-bam-dmux compatible and have the driver
select QCOM_SCM_VMID_NAV internally via that compatible's match data.
When matched, the driver allocates all RX buffers as a single
contiguous coherent block and SCM-assigns it to HLOS plus the VMID
once at probe, consuming one XPU resource group instead of many.

Platforms that do not use the qcom,shikra-bam-dmux compatible are
unaffected: the existing per-buffer dma_map_single() path is
unchanged.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Vishnu Santhosh (2):
      dt-bindings: net: qcom,bam-dmux: Add qcom,shikra-bam-dmux compatible
      net: wwan: qcom_bam_dmux: Alloc RX buffers as a single coherent block

 .../devicetree/bindings/net/qcom,bam-dmux.yaml     |   8 +-
 drivers/net/wwan/Kconfig                           |   1 +
 drivers/net/wwan/qcom_bam_dmux.c                   | 134 +++++++++++++++++++--
 3 files changed, 132 insertions(+), 11 deletions(-)
---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

