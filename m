Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AC643932A
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832287; cv=none; b=NdwzRgsdO2Sb2DWTs/HzOMBEFtPHZ4rBuyTc5tIVJH9FiOlaHFAaPPwt/9RBua8IjPeC5RuEyNqfJx3EoeQwAa+NMTdih9lha1QAqtZO3xCP0cZHMd/OMN7B+dgMvze3SQCWiY+S+6gs9QDX3sorIwkr5mKF5UqzpFLHvbQrHBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832287; c=relaxed/simple;
	bh=OTllQdlKmTDotnvLB5YmAFIeXWpUlALuhilhiCpYNtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGQ26lkNbWd3RlReQmPja+QJ0OLE/Tc8TPvrGkMuiVuBs5DOSdXy/xTf2oH2ikyNqxbuIsj4HKdETKR4IJVaI43GiK2L1YX1pS4AbuMQErN1IzTZupu4ggQAolYhqq/IghdyuhDzcg3h2Xn2NTyGbF8xaRqyujojOa/YCCwfd5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C517Vw//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8a9/16P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C517Vw//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8a9/16P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gHP31511035
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 05:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eQud+U/q09O
	AASYMtL9YGK0XbZ48azGL/U9AiPA1ENM=; b=C517Vw//3riY1HrZ2Rru42Br8sQ
	RQQoeSylAikEg3qBU2BpkMk/GMw8nGIAlDBAnh+P7dXbSsQW7il1LGBMC3tK9+gO
	lbxnKz8xzvK5hzR4/F07EcZAGR4423qEx6G8bLCjNAVs8FIiyF1bM/7RZi+vRPUr
	Boh+bVgxEAbUEfmOmAWV6sy9EWfKiof7JDoDXXtWdfjmJhdjUDe2aKoIGA7Sd/Tw
	DEZQimNyJzOnsYWjm1pADydyyekgxOOYdMOWdBd+ae84jQ6PpKJDyF92MPWBQRZ6
	HqrYq7RnNTMGauMZo9xGi5iSmxncLw94lMKaVnKfIMRrhVX2T1gJ3ecxpLg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bkca51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:24:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2d3a3ff86so28619585ad.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 22:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832284; x=1791437084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQud+U/q09OAASYMtL9YGK0XbZ48azGL/U9AiPA1ENM=;
        b=S8a9/16PeNbRoiLfqxvlr0cu8ucsPQqIVO+GJGFwt47/OE61FdpjR4sgaw4I4RtWUb
         sIptO34pCsWZnA7zbcp2rY+sToss9VkFy1JXtIHO13FZo2c2K+tmq5gwRsT9oUJPNIxK
         HG1zmzvKT2sjd+zeQk9ahfAkeR7sFJ1YALI4T0c1TPo2jzIK3NLtBqIMYr4WPfKirYyy
         ekeTwH34CFLj5jxQOo7HGQ8s945c54IyphstLwzYdu90yWSqhlEBi0k7aYDoUeisDfnD
         EyF0FAXdPGOPCbK69oCQGrd0pAQ2pHBNpgR7ad9wm1rm4LTzUa+VLGKmJRUalIdDKinw
         EKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832284; x=1791437084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQud+U/q09OAASYMtL9YGK0XbZ48azGL/U9AiPA1ENM=;
        b=OeCutukmlmHMJKMq4JJwTWSwldBguhmm4U6SfmECLcnD6AK3jLaCNPMlv+UOdABXnl
         nuZkrfCmrKrUjyNU3a9NFdD7+yrhiPSfpXvF0wGA6Z/goaHVxJQWO3+UCCyvsEpb3tu1
         3fVZDCTTsFr2HlF/J0tvPwUNOTJNYi1jpeTIWgYA2GqlmnorC020gwCx39sxFhg+QKk3
         EqVKmR697WbY4I5TNBRx6KfRzFD6mRcCAOqLHMlQ2RvvlEIKxNcjWPfRvawWWSHw4peA
         LUUVPube2TW37ivV9mCF8LVEfdJe5ANiNfD45DbBpEj9vzPgRAHa0DmpAytDRsgoRLDT
         Dbsg==
X-Forwarded-Encrypted: i=1; AKwUvByi6JmhbF9rmkhVNAmPocVVUfqytLOXKY4ZVUjKVn5+ZPb+8TPfSEJ9Nr7TlH2KmcdJc+Hg++w6netJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJsLTCqYFTWWEMFl1DjKpn6y1biflYQJXBC9E4mMsXT0g5r8uF7
	kOju6mfK3BIrTLnGKx+FOAUEVc8WCVFmAkQPnnbQLYTLHF9YB2SNUMSOQ6XO0q6ETbPPpaukgGh
	NjohWvFf7kQt2UluSAgf2jQATg552+sQeg9k+y+Zfy8bfDtQ+pNcR965TDdFRsPiF
X-Gm-Gg: AYBFou0k8pe+zGlVSgxAeMqbY+EMWWVRgg+trZ+O1CEM1IibQn1CBYdNN6ihIQdOnNK
	EblY2WUoT/dmekAbfN09GA0TWbSkk63/ydPkm+KwSHw9QRpWWcFCptmo887fzqXlsCRCl36K0Ri
	gIJpG5EppHHbPfvLJYJT+QkgJBwSHqANxfTKiv6agECZk2qwOLRCp7S5eHsiew6gtNRkA5caarE
	DMKyLm400uBBYG1ZKSJyZ4bh5xPfUFYcGdnAQEOWooCwKJywSYmWjVtyEkD1XrbaseQCH2J7QD0
	fOJ8qS6secWjuyvnORSVshtvdughqaD5LvSPVp9eNW6d1iVOBkEWy4p4pnY1ChkyfBcxSlOuFiI
	Jv3yllM1VMk8+3uyGMEUBcdXgls9Lmu3uBaGRIiitVdSdrKeIDVeyOcs3iv4I8FWiPlskZpqb/F
	UnvqCNwsrqOiECHhvUTLVdcac5
X-Received: by 2002:a17:903:3d06:b0:2e2:d02d:a171 with SMTP id d9443c01a7336-2e2e4b595e3mr31892865ad.19.1790832283791;
        Wed, 30 Sep 2026 22:24:43 -0700 (PDT)
X-Received: by 2002:a17:903:3d06:b0:2e2:d02d:a171 with SMTP id d9443c01a7336-2e2e4b595e3mr31892775ad.19.1790832283277;
        Wed, 30 Sep 2026 22:24:43 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:42 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 10/14] riscv: Enable DMA_RESTRICTED_POOL in defconfig
Date: Thu,  1 Oct 2026 10:52:21 +0530
Message-ID: <20261001052243.3042627-11-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -yuIDP0Qdj4llG33FxbxxvE4Qyjd0OfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX/Iq/7IdAX68r
 KHW4KekN2eBZPzVXHn2hAs0peoDTFrAkBXlRZMZjNaPKKEE0Eypvxr/8fx13yqqxNQDwvYE/DNA
 /MT+NizhpnZem190lbZKgxcFhiq8TbIaIyQ5RG15zCCGXkt5IDpynrEaLYgt0gXTiVP+JbzWp0E
 qMrhZ3qnAxauoiXWwZQyYaAR2GAqRwNg3maVDdO9cwbsEp9MButJKbbQUlYhjDxr4AfKcuxPSTp
 WAcKfBDDp5Ca6FDc5PG2KAGokZgDL900ZBkjGye2fDMdFO7Z9ch7xQIulvj+8rqS43+DeQSr7yg
 qxIKgYadpINwbDBinpns9FENMja7+wABFqkRG6CNOBFfs+Z0KB2bov8uUdQlu0h8GMd3eE3IOKA
 lQJ+yz7Jm33ETfFzyNPMr3B8RGXTKY781yXQ+u2TNssXbgfOWbtRdEgZ/ME8JtAWKsXItdlA5wB
 UVY+pnZRudhL6a72spw==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abdee9c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GbvFXuxacV0FzgsEJgAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX8sCiZHGwfl75
 UGEjPCfMqBvl5ZAnVIHlLJGY/V+xTJ0oO2KsT6MbC0VOEMkaG3rOq9I99KiMfisuY2QUOHfnt+X
 g1qljoQxYWaC05fk3SxprKLa3HrdrC4=
X-Proofpoint-ORIG-GUID: -yuIDP0Qdj4llG33FxbxxvE4Qyjd0OfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021

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
index 04ae305d5511..7319421dcf7c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -306,6 +306,7 @@ CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-- 
2.43.0

