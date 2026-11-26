Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687042;
	b=T4hJu2rPGdYWY/7FZNmCgADPbtVKgcCytVVVFSHSpXZ6SMqC+7UpPYA8rNsHqGmfl1J4
	 CxR0ocGmh2TveXFKXbk4DQqw3LjHIBNZZhG+Q1G5upC6V/C/P4VB36/1A2yum0SY2SamW
	 1OSZIVY39qlRhuY7hNsqelSbapZATslVZeyURaCG8nEHpieVQri1wdkNdLoIPhvKIwqEz
	 zENhsVmw12kCYXO3ozW1vGzKkVvUVYTUfcV5bt7NBrZhFhLIromRHCH67bOa2xKpiBMPm
	 3vu245SPLahvLTLsCS4RNQZ3W5xbB8HZekm8Oq42PSu50Y1cLfteQ2ZRUp7sPkAG4tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=obgiFy1H0lI5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=;
	b=4CIUkhYxi1M1K2BSsgOQGcltbyLdwu9olF87S77jz0qCs6gRXdG8vapOJD2dSXOn3F+N
	 hrARgYnv/mV1dc682xLf5GZU7m7CHsu67ys8/UGr3KgPIc/HLAaBXl857SKXcDPxfadUP
	 85xfe9EvpVpnFmh5oVF4r0Vz1MpJDVdUfJkzE67iuE8Qlv8kr/MJlUPBhkebHSU74tQFC
	 M+IdyyoRVGHQVHtDOEfySIem1cvSMjnvYEcWSRVOLSTMJaIUNbT0kgL1uJFnTutX4G1cp
	 25yZi/dx/JZc4GK0G5H1ZgTwAtQ7sLQkOfo8yFWZYgEwlKNs/MgjUiFW9Y+oQtd3kbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bDMNli9R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5x6WCcI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA4E606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA4E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bDMNli9R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5x6WCcI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B7TJ919515
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=obgiFy1H0lI
	5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=; b=bDMNli9RA8rApI9q5re75anXk5a
	A8vVmy5/Ry1dOvVyWwbltvqRODvnqBZKTcWEZDM0WSAWl7xb+x22KyBpuQRYEGKY
	NnoFpJWWznUEtYd/5daXt8S5ZINtuz0cbbEXU+/uEaSJqZvG3FPEFB8QWRPDyrZd
	Ktu7IfFN4nguumWel4scsmk5VFkuSKpJhNRlWJKNQBG3Nu2Bk8S4HOh19Gy/fyZx
	gUm4A0htHAXGpe9klBd3AKCARiZljm7Fo4Nlhmz/OCucfaeLW4OJtwfN8t+3ySfd
	5ijlP2wDjA1mg3F5Wvym6mgdVu3amfIEkKq/5EL9+05DxTlUvIOIcmJ+gKw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2hnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b42ebf632cso4930149a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687040; x=1796291840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obgiFy1H0lI5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=;
        b=L5x6WCcIWNBTRXrmwCp0TEltj++q8Odv2eIGad4pz73xdcaMt1JpsfZDmJicL3Av6j
         Fxf6Sh5n++aV2vIOrB9Z33EB6g1FK8cCfAXmqklc64ppVOhqb+J1p7u9O7a9JuzsDM5l
         QiYJffhE6zLW6u8wzq6IdfYs2fy/mhqgNE1kvJhhbYFe5nzlOhyJB6sVTjg0xH+8nS32
         0r0MGI3ktR/yOsv9PtKKv+B6xE2TlsJfbNl87TQJPwK4fwNbolvqfsic2ktcKw5p1xH5
         +M2hihkIqtQve66+mTY6YTgRcBzwAVgfcV0o4Knyac6kslXCzU4tLDIgKDAS6GMx57ug
         GXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687040; x=1796291840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=obgiFy1H0lI5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=;
        b=VD7i8DQA1/3Cf14kb8+eo3zKHXulwbrH8wcWX5TRi3slvjlnEauVqWKmQFNUMPiJ/n
         93kdWw0TmqQNQTFvTEQspw9zw7cO0WBrzvwrT/eW15XNH9dG115yw/lfR/2mBdV/F3tC
         ZUsOxw8o3M6YBr3XfMKIL461XShzO47o1Ay2G5VGys6E7K3+jXgip/bv2YGIBSJnSIFn
         p4OFLp3fS/SxH1/Y0xW9YGWqxxxYqeXIVT7PVhhsoAE7gTWmpMANw6OOLVhkqJKfsM/U
         mriy6o91rgR5VyOawMZqfGRSyflLojt1O/zf2UOetQJhZPRVmA8RfxHRId1jr7ZXdXTm
         FLTw==
X-Forwarded-Encrypted: i=1; AL+hErEpKocqdxZrmXEzlIB5Hd5HBNkTO0Ts1/AthFgd8Eo2zKZuMlizdTYYSl9rQh7CsaySCvUNbGKfAtg3@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uqm6YEVY6KRTup/eGQOOMKWWb3jqVm+rlKsRfcQaVlnkmq2tA
	mOhIMwnGPt/X4WzGqC+qs8zAG5ZXEfSF4imHt5B1zbGOhJD8qg9d4a3d24x4yw/kf4wQC1LG9eC
	G/L/oTgvS6Ma87bMCGMmYXOtaEsGSLQpPaFi74iJelxczM86tglcPWZS/YU/Tr+gw
X-Gm-Gg: AZFdTZcCGob5ArpDqD+0wQeh1CWoGoSDMtm1tKBcRyGoj5Ya2aHB7+IhJx7dNl8LqTo
	+Lib0wfX7axgyfTvwH2ScRRLD1nQBbfjWWXBb8rF9s7r3HozQh+uv4/2YD/Eonz7LVThwh27kWc
	xJVc5wV/ZxOwlILq/i9Fhv1bq3QywxtltYFf5gZVIJ66BsXjND/8A+eJiItoVrnkEOswEQCXpQ/
	w+B0Pz3YwMVOBqqO4qOeMnXc+8tIxPJlySSSR7F0FMVIqoH4FplPmKYXe8dhYaSdOE4FdxhXocE
	K+8Aj6yP3wUDlobqBjiulkc6aoTBciW7o61lxG+f+GlBWs9enbTKrZGJqL929cu/44KKXOsLvzo
	jXedhrwsSZyuUVrxLH57EnasP2SLvS1oMk20svTkcx30cLkyoiV7jqw1zoolKQbCK5dtl2WLS7r
	Jbao+efrBO1fi4P/ToklQtD0GkkYjqR2cYVxKMT4k3625T2LrTlT7d8qTnrbmh1GpEhFbeUrK+n
	Q==
X-Received: by 2002:a17:90b:3bc5:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b41cb3e213mr18167392a91.60.1795687040417;
        Thu, 26 Nov 2026 01:57:20 -0800 (PST)
X-Received: by 2002:a17:90b:3bc5:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b41cb3e213mr18167372a91.60.1795687039952;
        Thu, 26 Nov 2026 01:57:19 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:19 -0800 (PST)
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
Subject: [PATCH v7 10/14] riscv: Enable DMA_RESTRICTED_POOL in defconfig
Date: Thu, 26 Nov 2026 15:25:31 +0530
Message-ID: <25bc9b86281e3bee6ed8140e56779d38ca36b1d0.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX8ngNFOOrcj7K
 m41q/ZS+Dj9TGCxWhFI/r4CwQZBI+9Dt2xkrjighQnJC8bFD6bBVWH7QeX77Q5b8fMGDN//Zjon
 2TyL8XSOJFOltvSJvIFcJGPjglZuHd4IsRZ3aEIt6QDvQrvXKydCMhQ50PbPZY4x3xq/KlkN+Ln
 3vQY5tJQyDOtl9QfQNVLtokqX2b690eu+yIHmVqY80pTuTak7W+zjE8uxHVGIN+qiU78ESzsI3m
 fVqS67FRp0o4jXfzmJiShJ3rPBLYbsN655/GaXoMmjnENU5ykOBQ/3d2/S2ufgkeQjeneHLfrH/
 pLfKG/FL89MjX7DMmNLmgpk4QxUkSHw7FawUk0R3PTLnmVgs+YUDYMDX4+lBc45M8lJaAf735MK
 tBmbE5+c8eglrfNPgBdDJMRAa/SzEGWJIp6+dD+5N0cwuuTKTmqcP4Nw0CcQM/JNAv6JuEb7uPA
 RM9zImR7c/9oU9M3OTg==
X-Proofpoint-GUID: xRc7smkYOQhoEaW91zod2Pw28PcJY9vQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX5pu0Yee8cSJq
 UTesgywcTanVd8y0S0O6qljVMj8oKmsDi9a0TAdIVHbLTBSFj+4CIKUZ3NduGGrrxPFdjNUbodD
 02rkWtrbT9x1WpTcnDKDF2N+hT9dwHg=
X-Proofpoint-ORIG-GUID: xRc7smkYOQhoEaW91zod2Pw28PcJY9vQ
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b080281 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=GbvFXuxacV0FzgsEJgAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V ramsink trace component may have implementation specific
restrictions such that the component can only write trace data in
particular parts of DRAM.

Enable DMA_RESTRICTED_POOL in the defconfig so that dma_alloc_*()
and dma_free_*() APIs work for devices with DMA address restrictions.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 383fdd07a99f..af2852687dcc 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -308,6 +308,7 @@ CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-- 
2.43.0

