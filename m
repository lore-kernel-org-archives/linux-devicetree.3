Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687075;
	b=iBrbmRxKjir83F1OkCSwDPCLdflxL7hiratYUarr4HErk+TIno3eN/Jwd3PPcZ4hRj+5
	 uRE+U43blBuJ9BVPCX441I2dya7AL/YKX/E+Zv+tsTznV1U0RYTDkARV4l176JqASe+L2
	 RG3ltJTm/QN+Sz4h/gqoWAnSvJSgbebXDl2N8JMfiRdXhr1rOUu5TA3zmLYJ+rq58VAtF
	 T7QES6gWyR9+KquE2xJR8mqCliajCuCQ1u8HbSZDR+3nLxe/PVCiTYwy6I1CzWPKNRav8
	 20E4kfwrd3cfqBhSNfNHcWGzurqgYHCvH7rYbBLF37ZjgiwtCIZsr6YHdv0GBCCZDew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V5bOdURA8FVOA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=;
	b=pZfLD/IyA2Kz/J4JviQ1wHcLATp70UE2lZqBE81zPGL35x12B7aKbcGvHUtZ9ZD5EcOs
	 aND2V8ZgXq6s6S1hD2nxjroWkHT9jnh7qVBzCWtVkv8wiJbZvGYgbTE2s7FstxDLAegqJ
	 SjbQ96HGYM+4zVqgyQmAB/93y1vbn06JProBU92mivXH8rf6pzbxxD37KpZld9md3ChhL
	 aiA9Jm/YZJm4j1TFNO+1xsgsGP6wyUkEXUu+K7RVnn6B973DAVW01h4+ApWerHYTcmHne
	 lYylc1ZUqgnZUMZZbaZutiaNeDg1XqllPugmJJp1h5s6aRYTMipltJ61ie6S3AMaVnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fYchbVi6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B69B63vZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF689606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF689606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fYchbVi6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B69B63vZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AvcI2594845
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V5bOdURA8FV
	OA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=; b=fYchbVi6CTlUVo/KWqt222aUOmj
	UIZL198acvWlJ6kMbJkrCvQDUtc405cnb/zRUtd1/VGM/Q4G8g3pdGeAFAdwzeLK
	E7y1drA7aOONrzRSAsDZrk3XLFJYg1YERgJp1Jrzy8H8dlbRBo/w0tve1ibl3EGk
	LdUmYu/rckMwlq3u7ID8P5E4d8HkuTowOggACQHmQ5nzBosJl9/tXlUyZGpG5yua
	jDyT083H+rjbxQ4t+DWTmuN2+huX4hYxM+/paL3sf3oi2B9epezozOFlZNyGbgW2
	NYYDDxV0DwHYbP4a1U1P4LmtDP77X1nMW0bJ9/7ukTHYAciTM8d1Yk+Q+KA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662saka8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f04561ee04so39182825ad.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687073; x=1796291873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5bOdURA8FVOA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=;
        b=B69B63vZushI4xB4yLPerkG13f2ZWmzRrfkjB8zk9HdBT5J2AE463HLeOk4wgssyRi
         57bUVby4Zrx4funZBm7M+JQI/do9oHnvO15G7vI170i0qHGBHbspfYjx0ueLbkvpDRI7
         M8FVrKIR6HAEFTfm1FrzCQVjRpad2lNLKeCxvGfEmdZRCkFvDF1Q/hMzZ204OewRq/Fm
         yMhxnc4/n5PkZeS2app4XqZ5l9khPjGnCOKLz6eKb4jr4ZFWZqSM4owUo/I8AGeLkDNa
         u38fxKV7DPfx2bBsVUHTx3jadCJpqowG6TeFIYeiTbFaj7hdbGDRHSmBrHDC4v4CgORw
         iYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687073; x=1796291873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V5bOdURA8FVOA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=;
        b=DZvvjZg26sQrEix8mNPsH7xLgTTeAsbLqM5AuVqb9IBeoQQl1tt/QHG3dvDZBa/HUx
         y8KqcGduj5fP/2epqAxLckHpJqXAkk2euapmG5wPe6jDdOzHYum8BJOpLvFumo2OAQnE
         Y5nTnJ+pZlXBLZ73GuVltEetr4KoCYbPbnUnyMZ82bz+SEv6aEhfBoAXOMfIhp650q9y
         LY04ImOgQr56/di/ywwTF3leKBjYobNK1S0icr452o225LgoDlZiWf5cYMt9DC6A9Yj4
         PhkI8JC/KusKubUo/MvzEId2YWu/pt0rjCB7JQO95IcGa4tWAqy+ux+y20w5rq6289Dr
         fz6Q==
X-Forwarded-Encrypted: i=1; AL+hErHUo06d9qrgDh1R+xByJU8rhelYvxQ65vfZrqupdvC4KIzvie2TwRJOyDwbVti9dPMxXY6K7/kgxkbH@vger.kernel.org
X-Gm-Message-State: APuU4Z9KrjZWfRlFS7gFXoIMf5NijGX+8P57RJrjpJiaRD6DzkKHERux
	sM627ALAtzG5yXlWIzgJg4+ajAWAIOJqokahluj8fYPAIvoZNBoO8H4fUZX59SFwdbWiB0MoFgg
	M+a8fCuqTYYC2mLhnP9hGZUQmtnUJMaDMLScKeYh6wHPYVJjIhoS5X4nn7LiPUAF9
X-Gm-Gg: AZFdTZfjM+AToBinS1F2Yw4GOb0Qu7mlj6WDrHpWAR9oNyFTDHDGM1ZnkBW3gvEKmx9
	Uvww/CVnX9aORauyAMEc2OAdKd/8o20sGro0BMbBAuNY+BD/vx+WfMDNHis8ZpwHlX3w4HZYxue
	n5FXxj0pqB4RzdlB4oRLSaE+u49zTzSG/KXgzuQ9E1mK7Yq84PwIcAs2R9agZKlChsCns/gcIEb
	6jVAkrGiZfvXUehiDJy7Ivt5ocrSxXaEvr+PuILfc9kTuFTuj4qRS379hRi88ner//RQbdk5LQT
	3jjNRKlQdq7Du0rBqEw+Rus2pZ8I6dk5ixh2tJg8dIgr3/kCi733blGY8kHeyrnUR7HEawdHDPn
	zhbd+QKL+24QsugwVSJPx7UvNZ/s93zqW1sqiO/JqZv4MnRl5ihO+3/1jJrtWzprh2pEo1+zNOx
	nHmyXL54071yU9VjVeJdL3tNx29Pe+SMM+SHIwBMVcvPJWTIbfBqpm07bWLc9tv5KbZ89zdY1/T
	Q==
X-Received: by 2002:a17:90b:2b4c:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b41c7b6145mr19812386a91.1.1795687073461;
        Thu, 26 Nov 2026 01:57:53 -0800 (PST)
X-Received: by 2002:a17:90b:2b4c:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b41c7b6145mr19812358a91.1.1795687072994;
        Thu, 26 Nov 2026 01:57:52 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:52 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 14/14] MAINTAINERS: Add entry for RISC-V trace framework
Date: Thu, 26 Nov 2026 15:25:35 +0530
Message-ID: <d5087c1c7ce28317339739df2fbbfcaa5838243d.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b0802a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=W-_n0kkjAAAA:8 a=JfrnYn6hAAAA:8 a=UgJECxHJAAAA:8
 a=hzgbeqSfhi83Ps7mpaYA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=qeNa2pbTr82C0GpJEZFS:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-GUID: YAwsen6_XZgJpf1c_j-1aO_alji4Y3Zr
X-Proofpoint-ORIG-GUID: YAwsen6_XZgJpf1c_j-1aO_alji4Y3Zr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX6QK1mybYz8KT
 oFxcdaTwkFdXFN7YxO2Ysi7V8YZ9SvyqvBOUTE5UifXoiB7ubprJv4F7eGmPD/9fg49NGu60hOh
 nz9F+Ry0mp2IrDtvadSR8fktvBf7A1nfspkGfgAyGCn6Ljz2YRzBA1tpdr7x24765wbNurBXzzA
 msQF2/zLESZP0FtGgwjYHXIwDp89aRTimUY/GwqpwNM6D5yGWOAG0hRpNOtiMHsX5zZpbYvhtvV
 LQQtzyJ5c7oGTJBIgk75C2uOPqtCEYA2CQo12NgDLIC2OaUyqRNVvLTroRXI0eSC+y/kZ0vvb6i
 P5VIV11hih1rgh0r2MQ4yFam2TByjcWpwv/YAgvU3LOr3sz6co/1LFg/DVvBNaXLUvdWXQy4xdz
 LLR8KO3nLHBt/HW0P1DwCcdTJxjdLYRVtJRl/aVq1uFoipxYpGoCgBrKFX0PfWCuQsFGRp3eb+S
 wJ8Eycrs7CZPxikI36A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX9tig163/5Y5M
 d+t1ljrFzEsd041CORVh3gecQzEs5kROqvdC3o2riuGpPPWSvrg3npb2StBUt1wg0/Q0pSHD5hu
 etJZr61Gvbf02NkMwIz9ILKr0rrcEs8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

From: Anup Patel <anup.patel@oss.qualcomm.com>

Add Mayuresh and myself as maintainers for the gtrace framework and
its RISC-V trace drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 742c4e6b291f..e582686ab218 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24318,6 +24318,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+GTRACE FRAMEWORK AND RISC-V TRACE DRIVERS
+M:	Mayuresh Chitale <mchitale@gmail.com>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+F:	drivers/hwtracing/gtrace/*
+F:	include/linux/gtrace*
+F:	tools/perf/arch/riscv/util/auxtrace.c
+F:	tools/perf/util/gtrace*
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.43.0

