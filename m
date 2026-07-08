Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03453BCD38
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489052; cv=none; b=sUqyE/eKQAkVgOoTYLa1MZhI34weK+E63D29Ii03Spqn7ZDkPQo0aNaHl3ynBcPDq67XMU+tECQBEXv4/A1l3Y++FmB/arJJmp/SNvpy9LDtuoqhifgLFNA5wqiaUROlOBVkc/NFYPHvE86P+L84rzSABOUbnu7PdccyEaI1SS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489052; c=relaxed/simple;
	bh=a//aHjAOCZdOEDNOGwW7cj8bqxjleSnaH73aGg5zKnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDEyJOpY5Kcrh/q/MF8sghPQ2H2LmjyvsGxE/Quoh7jgujLHzulcddy+3gdhAQx9JmGLYyFDPl4Y8HyQrjoAJ3WzcADc7JICo+0pPO8fIIHg5gIbsMFq7S2VjzJEkt9t2+IWTFJpTe7GG61gfVcJv/gU+LyI8r83R9ENzZHRf+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdtinD8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=al5jpNYu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdtinD8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="al5jpNYu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842kpc1491929
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJX87HCSkcJTd7kTCA0/nQnGj2UQmcItMQaaFDWfyJQ=; b=AdtinD8/0bXvXerl
	YGn9KFl1bhMFe7gFO40JI6emTQXt75jSzn3nNrvl0JmjJ3Zxkf4b1fHFs8XJQ/KP
	SuoEKr0GElrjwf9A5KnphGI9waiQ9ZXSYZtfPAcuieqU3uf4vDgo94J+yJNGog7V
	1ltSTfSimVja2g1NCoktksfzXephR8poFoa12l2OImMD+AL63cypVkPikhF/wWrP
	tLKVRLhiaL2iPiXMOIor9/P81WaxfLfGOZiHYrLSZcOVjJpC7V2qjroL5umYsIer
	xxE9u1/PPa+CRwLa16hm2Wk7yv56mjJAToKaPXm/FDYCW+3OOC2SY0/NBI8vkja3
	TIMlwQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g94yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:37:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845df469a26so910114b3a.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489049; x=1784093849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJX87HCSkcJTd7kTCA0/nQnGj2UQmcItMQaaFDWfyJQ=;
        b=al5jpNYuqFbC0LIcXnGiU+HA8/j+exfgST4IeGOtxq3SX2wVqhlFanhEcaF8aq/ZaF
         iG2yfuzIsmsuTz70NbGiBB3Cz5dclA0gFoQrj6DCpCSPpqL/TmHMFlXxN+Pvmzwwqtfw
         ZZoAe9oFuCoOeoI0L0s1lBYgP7b4fwBsLZrvM2K0RRfFvZaGbMJIA8wLizbav9q9hClb
         LY/CmtJlkTTMLqb7tPAe1SZesrYtrH50ulnWga0X3KIr6BXsXMqPq2I5i9gvvuZWxkD4
         TLTsifKKw1g8/oWWL1zyMBCl2LNExLb+M1PJ5Lrj4EYLGdKqGyGIYEeIXd/xyWdBrD2W
         /R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489049; x=1784093849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJX87HCSkcJTd7kTCA0/nQnGj2UQmcItMQaaFDWfyJQ=;
        b=FQNN3j+k5bqLb/HiJD2jWTf6iqdaWxPHd8lE/s0CpFU/jBV6lMJaUWMPVxCDNI+eIv
         GMt10fU/nyA5T810fqJZVbOgtd9H8MIH+YRuxj7rEnZVB0sLh0AC+SXVsaDZmT066pwd
         tiTRc8ZNP3C/I5haECEXjMB7xFBjHbO2SbEiDgudkQgSSYnaE+Q9qghCb6SKRiMAbFAx
         OjmIxUdoeLqFNP8uQzodzAPX3vyCjJNvJTaRXxAib3tw8aq2OHNTmWJmJdOOiKUJIEXq
         ++ZhSuwm+KSHc0N9sVh4aPh/pH6zyH6mrdaIPuK4JFSMUf26wQNvWzZsuuNqEXLwqzlp
         JpjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWzdrXvzr2rA5n8QwW0hReGgxV3g8R7aXAPrUhe5KmCuClCbJt06xBe4L+m0PqNxwatqtVVf+PvzA9@vger.kernel.org
X-Gm-Message-State: AOJu0YxlSd5OAFXbH2wP3HT59Lgo3OI7niZHIAHh+55bli3JSal6thn6
	MR500xD/AvzrtGiqF8GxAK5Rkkhs1Ftrdc3Z5gdH63AI0tWjY9MCaQFTEHMFhnvWT5a7yQeYkr2
	Ca5jgkaPD5FMajIRTyWNrDHo6v4EafDuFJ0lnTEdvjW8jL3/htbtOViYjslb9rxSA
X-Gm-Gg: AfdE7clehC+O6AxSeZJM6u1mgw8fd8MZeL35wDISbXks7xSR04K2uNyFG0n8FehNkWk
	1OYxAGcSm7/4ykcZwcpn3xXNakr6cPVUCKvVC+tGRY1ozm2yKDmIoP6EM3IXdLi73XoagvMFP+J
	WqnPszpBY/+17Jxzf+ipYVw1CXgTz8SIqnMfquMEf6Fg6JRI0IgV67jszcFUEp2vIzF32EhYKv0
	MNGbsPQB6AQTZ4EFuZl49UdBFN5KrdnzAi2sDpVG+VWOt/sDMpLXpENjJwdI3gfA2Se7xYvoFQR
	WIcL/LVW3DBuQqdRnAJnupOFJJ2ue273Y8x5JRPPhVe5NLy1OIGXypvoJ8+rjKC+saJsKj2+E+Z
	BUnzID/4bHgmhkp1NhD6jS0BdgCbpILHfWkRz9Q==
X-Received: by 2002:a05:6a00:2193:b0:848:2f77:e2e1 with SMTP id d2e1a72fcca58-848439317abmr1120442b3a.74.1783489048620;
        Tue, 07 Jul 2026 22:37:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2193:b0:848:2f77:e2e1 with SMTP id d2e1a72fcca58-848439317abmr1120395b3a.74.1783489047954;
        Tue, 07 Jul 2026 22:37:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:37:27 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:59 +0530
Subject: [PATCH v3 20/26] mm/sparse: Register information into meminspect
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-20-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1429;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=a//aHjAOCZdOEDNOGwW7cj8bqxjleSnaH73aGg5zKnY=;
 b=29tpun/9WI36+AbZk5KGoVhyWBxd6E9AyE00Qj9B9ayJultsqHtisEukCmg+Pc6yavSnSZJB8
 fznsdxO6dZmDcdPiYEDbgHtL5VgKNvVrVXBP/v99PFh6GVWx+oNIDcS
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX+cNn5K/Yt7+d
 YccVvx3SV6BSHWDFLOjV14KpRaNYEPLDWVsfQb9Jcme0PRaf/tDQ9xzm5kjMNWowotIeTsr4Jwm
 0U5cdHS7IwxA51T6Vmax2m/uCssR058=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXzoUuoBFqzTV7
 mg4NmCyPmSg2XOZf4He2bRmG6jNjsvzQElnPAg+uz/HL7r/qo46N9ACcYMpcQaKmdo1OOS7Sgxl
 Z3ceQTrc1YgAf5VwtBiyIOb2NowxUg6gA8gbNwNPZiqkmhY2QghXfB0zU9tUx31vORcuJYoVV0m
 AyoDJlmIrOsxZUluSrpcWCa3uTupn77woG6+EyhPSf/Kx+6s9iaWfyj59JYC4wksO0L75NqxD/S
 Wx49cFx6AhSgGKUaEihWr1z2OrmmDpQZCn2Rt6qg65GXWfWiXjnIJT68iBL8sBO1IkDUdr43PnA
 Y98FFQsFsZjQ6gzflOub8shuCd1fadTKuBG6K2SMJJuq4CmGFBjpBbCNyi8J4OsbP9c3Y9ZhrdK
 dJcfAFfr0coAAib3RvmPHSZil8gR8z6FpBWjk5qzpBo21sNR5pAxQcJP43NkUnM4BpyIV46Ieyk
 Xi9N7RLLux0NpuL383A==
X-Proofpoint-ORIG-GUID: ciGigpGxbKQyOhHI2mvq_Lz4ARsZuNio
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4de219 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hPKMzws2jpgYMEASFUsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ciGigpGxbKQyOhHI2mvq_Lz4ARsZuNio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

Annotate vital static, dynamic information into meminspect for
debugging:
 - mem_section (static)
 - section (dynamic)

meminspect uses a different API to annotate variables for inspection,
and information about these variables is stored in the inspection table.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/sparse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index 058ef9300367..9e890fb6c43e 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -15,6 +15,7 @@
 #include <linux/swapops.h>
 #include <linux/bootmem_info.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include <asm/dma.h>
 
@@ -30,6 +31,7 @@ struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT]
 	____cacheline_internodealigned_in_smp;
 #endif
 EXPORT_SYMBOL(mem_section);
+MEMINSPECT_SIMPLE_ENTRY(mem_section);
 
 #ifdef NODE_NOT_IN_PAGE_FLAGS
 /*
@@ -206,6 +208,7 @@ static void __init memblocks_present(void)
 	size = sizeof(struct mem_section *) * NR_SECTION_ROOTS;
 	align = 1 << (INTERNODE_CACHE_SHIFT);
 	mem_section = memblock_alloc_or_panic(size, align);
+	meminspect_lock_register_va(mem_section, size);
 #endif
 
 	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, &nid)

-- 
2.53.0

