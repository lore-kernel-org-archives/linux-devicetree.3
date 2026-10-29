Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279393;
	b=1jqHXU8VbzKy8s8yGP+TTZqk8xq+Jq50ugLVJx1wnZCVrgOZowti5Vr4Uh3zOSbLjx9n
	 H9Jc1c3WS4vCi8G82UPP0xlD126L4ZI41I0o54roWjbvNSg6WJ3Sz21bVvmizJMeLHq9x
	 gz9lSMJPy+1sgf4pfBT+tsVX2RNKv1hdz3CTe14Dlajjjp4XtkOJgXwuL0KnAXnM9zLp4
	 kv+AM8Qwg4w/ZOc/dhZhX8aYwwoS/5vbGPlbrfDuDAXyuwXWCwjWriRmZUcmKByWA4mwj
	 sO6kgi42XzdoHQmXqv0IfYvnU1kYQl1OABOuYIKN8yyd5V3EgG484aanaPZeBbK+wzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279393;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n+Lh6rrQmboJ2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=;
	b=rN9E6WH1NT89CF8W10OpOzi+g3H3dlxm+LOsMcU0bpvqr9nRCQT2IFE50ZLWqRAaK/vp
	 FrJA0/gXecA/shVnuvJJ5dhnMB6hw34QjBFyQbO+NXLbJJ8WgNnnsenj3TsLDqFsYONjm
	 KdU69N90igLNl8yHqxr8yHDFdOjjXdtuYDVRzWU1LFww5UCBtTT122vQd1HbIndsmLrSl
	 oK54IZbu1PzskOOR4KmPTNYB+GH4GvdCYtYPD4JmGkSMhpuyeF/tMQlcCsBjoA0UvWV3A
	 9tn9yeV3nC5LnnDmK5tZ5GJkLnvTkHQsFusocWbhSPjD0BHbbEoFUsu1DnwDGKg9pQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FBmpacEv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUTwrDlG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235F606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4235F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FBmpacEv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUTwrDlG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCePKh3215077
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n+Lh6rrQmbo
	J2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=; b=FBmpacEvz7WWL70DvADHpRxoXt0
	zU6RXP/3YrHk4NgguGOt+CIQaQPonZl9O2E7UDS8xva+EouG3/FwtumYWdThK+Dv
	sCyb7P35FGhJ+eXCwK6cb6m0l9qIOnjFOL6Fpcar0JRlaMf/vKGu/e2HuTUbuf8x
	Tr92J9fojzDi0O9IxKj/p8TDwsfMyFPfcxrNghQC6HI3VzD/GeRMhQoskQqs0usy
	HstpnvkobixH34s/cxoO8ph2m5H3MvmC8ljcXyWcHoyqNzf2RDT2aVuh5vopqvI/
	JRG0hmwTj0369/of4djdlJOkEyFaKUzkZxgkAKQaRVa4ubTZdYA/MwVVkXg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s9t15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:09:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so1758930a91.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279391; x=1793884191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+Lh6rrQmboJ2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=;
        b=QUTwrDlG3GLsfYqtNNiQVIUP2/pdJxAu7qGbaVZBO0anfa9O5Gzr/OD+4gvgivuF/S
         ZElztH+uwxQnH4unfHa7sucpARKn2+6WSYVa+i8Mj7lU/k5G33cYl89s7x75M4qcuwVO
         gjYZsds68kV7Yg4IEYyAwFVyXmLBBGhZsOhgXT2OERQEI9jE9Y7JIKpkG0rV7HQG4x2h
         Slgve200pCtjsr9iMX6yHNsZKILqKTIj+G65/t4X5JYVfrHpZaeZA9S4DcToiAKV4Y35
         Cry/Fk/PsrrDmA74DPLSih6xkPRZp9ieRO0gYtg56Rm25t6KH50DflUmDjaT6ilNEmsh
         iQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279391; x=1793884191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+Lh6rrQmboJ2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=;
        b=qUn4WiGLutcpXILYKThiboJyKzGODesZKxmDdOdMyGfGvXNPZqWSsUgw3E7I78WXgm
         j5mN3SSGiU2TUxCxTX3m4Iby3fEFfGGWolywSuAuMg6ngvpbNZ79Oo2I16D00zTRNAxK
         lFwVacjy/uVgy2IqqpQQMw2mwPRvrKCBQ4mS9gWPf7FqpkE2tzmF7xHdQZLjTTcQD2RE
         SJS7LnADJH80X6PoAA+X0ivLNjOrdj9NjfWdimMT52/0wHGhZCISOhm5QPBoCCVtvSRg
         Z9x1dswuWNaoLu931ouzdY/um12DYOBPhITiw7rjMVvTPYRIqEu5YmnNqH1GMwXDtK42
         t+MQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCkxwnV09jhR1eW66XY7Sb4djSnSwaPFOVmMqy2dHYXyOQw5mTwe/omTJRQ4UN3AQMmbi6zVmlZ63A@vger.kernel.org
X-Gm-Message-State: AFq9FYKwjB50KZqli72bcfo1nkRMLVM8hYVPDdGiiR6f/y6CFM+GQAx+
	OmFJjxpbNMlE2VMyo8zMZDWar5zsU75PrKB4iPopb8HkDy5t17bvHH8IsLAXQC1his+h/mfXUg0
	FCKnOq3tuJzG8BPTU4Knq5he9tTKjVySsNxyuGyGUhkb3YBAT/27zdJlFPWPL0Ls0
X-Gm-Gg: AYBFou0egA78kkeUjkakixqCF7Vi9MEXB9i1b/VqsGXbVAwGBZ2fvfQKu2RH25+kI0f
	e8mMywvsJOwjVB1CXN7IRkFhap+QhxVBGZYkBNTLsneXLxqS5ugHV9sAh1Fp2NXH3ZLYKysWHGR
	IqoeKU54AWzLrFYy3P1PEkpgw3bu25JFvHijTR02s9ZzKCH2fyHCjfzkVWYWWlHZTo2DP7FQzzW
	agJKubOi4zy/QyhHVdbEV8xikq3e46rt4RC99TGbm2q/n6qOtXVWeatJKmgiaiFP4fdPCCFqmGg
	/fB5snA8KcxQAKhh8Witl8kX+7vWizjE/RzgJihuorzexG8qjKAP0avZ7alTROsCUMgq2nTRutd
	OdfVNdf5IeGRlzbMLRl/Glygbn4pm/kr/kc0BXvlYo6Af8GbM+Y28vY54xzYwm4+329exJhN3/4
	TwvbgHbMoMhs6c9VqbIY/0ZFK3YIN/lsIIOlWM8YUVajS1+Ia4ckkL0f2FjrmJDiMKE4htB8O4l
	g==
X-Received: by 2002:a17:90b:2c86:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ae581e3385mr4148829a91.48.1793279391123;
        Thu, 29 Oct 2026 06:09:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2c86:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ae581e3385mr4148793a91.48.1793279390665;
        Thu, 29 Oct 2026 06:09:50 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:49 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 3/4] riscv: Add perf_arch_misc_flags callback
Date: Thu, 29 Oct 2026 18:39:12 +0530
Message-ID: <20261029130917.3714691-4-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX5JVrvyldD0er
 aPV7HkFhWJWfFN6ybrIdrk/FAyUBLfyGjPmT/O2u7lP5oOzyd60njCZq86gudk7flKUj8qvz8rV
 dLCXavUZL+xL9c0xtdaswAdKpTzkuoBCFxWNTf5+ffC44hNSE3HXQwwp2lPUPjJGybQTkSykEwz
 mtlWGcwQHPN4rVAV0uD1hsy+V2tKUQmDQDOk55L1fYtZrTXuzoL1fC6IISD9t8cqMziNKVA5Kg7
 o0S09ZV2AxRi4JhurHVKlxhzBx+lMRaxoFpVZVnibRUjv+qhP2fG2Lfl3Q+AefMuRkbHa+LQLtD
 JanyBIT0EIZmp/ZUa8gauZ5sQcMmcBRgiF4lCGrGV2jVjWxq9XehmMyHuFK9F/MWOIfjv45awKz
 zKMJn4dEd21LYcEzD6z2sr5HnIZ7FLce/9ljMXSxWkS4MwBvplxmBQatjIHVU/puq73YfVLVDfW
 u2XWa0CjLVZVWGN0QPw==
X-Proofpoint-ORIG-GUID: 3nIb0SE_lQ2MMpjmFtag_wcKZQ-4ePpT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX3Yixxt7IYPDy
 j48IntqIaifxmY8ZaOXnMHboCY8bpIlRYsaC+LCihHvd7LHwQU6sHf+GAMOozZnWAODDB1VslN2
 9yo41tFwWUvXzDDa2qQ3ww/26VrtHTY=
X-Proofpoint-GUID: 3nIb0SE_lQ2MMpjmFtag_wcKZQ-4ePpT
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae345a0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=IJwDnuRGQWnalj_uV-oA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051

Similar to X86, add perf_arch_misc_flags callback so that
PERF_RECORD_MISC flags may be set based on the regs provided by the
SBI PMU perf driver.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index bcc928fd3785..cf13702b185f 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -9,6 +9,14 @@
 #define _ASM_RISCV_PERF_EVENT_H
 
 #ifdef CONFIG_PERF_EVENTS
+/* Use sstatus bit 2 to convey whether an epc in the sample is precise or not */
+#define PERF_SR_PRECISE	_AC(0x00000004, UL)
+
+struct pt_regs;
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
+#define perf_arch_instruction_pointer(regs)	instruction_pointer(regs)
+
 #include <linux/perf_event.h>
 #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
 
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index b465bc9eb870..9b68d21b3a51 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -6,6 +6,21 @@
 
 #include <asm/stacktrace.h>
 
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
+{
+	unsigned long misc;
+
+	if (user_mode(regs))
+		misc = PERF_RECORD_MISC_USER;
+	else
+		misc = PERF_RECORD_MISC_KERNEL;
+
+	if (regs->status & PERF_SR_PRECISE)
+		misc |= PERF_RECORD_MISC_EXACT_IP;
+
+	return misc;
+}
+
 static bool fill_callchain(void *entry, unsigned long pc)
 {
 	return perf_callchain_store(entry, pc) == 0;
