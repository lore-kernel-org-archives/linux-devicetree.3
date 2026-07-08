Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A613E3BCD13
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488958; cv=none; b=dgRczeaBN9mZ300mFMr1LezzwOkj5VFVwwb28I7EsgxM4fgZ2J0wLpnkHKH9WX+xaRFyhSQOGuz6DCijENlSzO0tFbZBPiUE+hHMgPswz2XeVE1fIHSd7EqR1FOs7Qx8fyjzK2P47eLkGecXpr/K4tBQKBLgz/r+TJ33FoE+rQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488958; c=relaxed/simple;
	bh=XB0hnr+SeoDNBsLD4keyubVFabUM7ZTQY5JWjuUzUR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jwx0VQ1/dGLXB/En56bwYYtIySYgoiFxHiIC4SfANcVPTOZpFycvKzd1DXXUh0r9hSXCYPvvoVa+ZYd0elFeV7Zph6RcXOwTaTSI94119wJKQa4xGumf3uO3v6q7ZBfwlQqduBspXLYOEwIlcM+8cFsDwQHCmmkBm4RZ/w0Yxx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyVGMjHS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeiEXIRw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyVGMjHS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JeiEXIRw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842iYv1625089
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=; b=iyVGMjHSYXLMOvvb
	whTK6oJiXUtt4IV+/SzT1wIWF1tRxXGFzPJB5KDz0Fe8VB+7px3ddcHqPJp94fgx
	Ze5L7Vr5soKn+zKznGYkt98thcz+2A1Gq2WZBO25klO57cRwKc6RPyi5zY8PkyES
	pvG++Irv6hL5nzc3s4OWjhuzUexAuPSgLt8ypxUtXHlbe1ZpsPfnrdkS73qp9xNl
	3T3NFIzF7q2wemmc/4H9IA1i3tN2GPs0fXWn+/ftR+t9FeInphgSkGQnLHsM9sVg
	+xYp4XB3BkS/hYwyLcQxUDw4MIeT1AAxE01wXzb2Gig4tlJhnHv995tiIJoogDk2
	ngKXnw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd2tqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:35:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847b8d76e3dso453618b3a.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488954; x=1784093754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=;
        b=JeiEXIRwWAtjKHYOWBWCyRPYbYbvtGqq2bF9cGxxzuLI3Xk7M5jtYbeutdKm5UvAYb
         +zEgspPkZ4V35gU7bCm3vji7EMy4y6Vvnf1cwrUfUMXu+QDO1J/pfMD2dBSTK5IZ46/k
         SA5jBPUv0iA0XGVrCELWHBeQtz44ByaINvXFWDLVeIWaVdt+x06Dc8GWbIf6I3buwN1D
         9Arpp65wrXkctiR6+8HiKuCWNWdV11jLsWhdjYE3VFK6C+nRGAWAMeHX/3zedCEZNURJ
         88NYr2eFqaDKbkn/kJFsDq4h7Vwr0x7wo1vuxKzMNOsMfTNHpm/i55PDhNpN/Uw9Vunf
         +RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488954; x=1784093754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=;
        b=WrpVavjFcsltJZDjjAjZ3Yfg9pWEh5vdExo5rtxl+draV7WMJjbCIaTNwmk7lYI1QZ
         5sJIm0GPGV815iG6HttB+odUGdMbtxKKReEsFyaXb/dPasWxA5pAzi0NcnQ7VU6uJU+9
         zjuOnmeztvZivDr+NkdR/qmquYxB9N2Z6/KUPcnMQTkz3iR3fKU1D77ep+ZzCHQxBmqi
         1kp4GcNn0qPDpkjyEVZnVoc1afmqPX9KnOrk8YvmlXpz6JV7z0I0WqUxZHLwsaGw9jFW
         qlhpHq3lPc7J9e0P7y6zxAS74JP8okbDEqckz1M+qPAfJYRf5hS/arRS2Kxp9x/OzuXZ
         O0qA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3Q8Vw/xMiYnd4nRmR9ahyvJpmrp8B28HvyFTFsTZLBzgJcAaOMvslv4ZREKbKll7JspVqbvrKqKXI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp90Yw4UdqYRX9AsJWFpXkAGrRZWKBzkkdFMEJ/uoscNMN9bmW
	bjHfmtprFwb6LkK0zxmH1QFKTxw/ppGcmV3iGW/yA0WaKG1fX21eqewQ9zIohWR0xBfgBMiADu6
	e6OHQWWc4SvkzoK9KnyqOfNIwWrU/WlFuKRU1pN0qF5LkcdowZmXLcYaQk9L+x1UY
X-Gm-Gg: AfdE7ckPTIHT4RZOB1JrDC92tBvsqcPS+GU1avYlnVJ+J7wMOmtg6ar79LYXciw6/td
	DZ+uwzoSm1VcbzhGOFZo/2TTnrw1VtmSZjt/5gC7my+B1M9jXN1gFkqXZHsPirf5qvdlvPgNZhj
	jJ6ooLCOcpkGt54r8Ijz6Y+ctO+beqviCxPFvZokiS5zp+L9P1w6LzTwIWISZNaZTKsc/zuGPfl
	iHgT7fLwP6/FjamVTTOz2HHjwrM6gi0Dh8g9QWgnU/dRtl0tlK3cpcr4Of+F2v0Qdq91tDJivfK
	ds36JjMw5P2StThfChWEbKxC4h0sfiH9KI7ztLzrlRvSYmpm0+8a+I4uyKFrv825orc4gcBQzGP
	jQF540OVChPgPzJjgfc8ONmP5QJK+kRjM0+FWVw==
X-Received: by 2002:a05:6a00:12cf:b0:848:2f84:f431 with SMTP id d2e1a72fcca58-848432cc7a0mr1101699b3a.74.1783488953426;
        Tue, 07 Jul 2026 22:35:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:12cf:b0:848:2f84:f431 with SMTP id d2e1a72fcca58-848432cc7a0mr1101621b3a.74.1783488952811;
        Tue, 07 Jul 2026 22:35:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:52 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:53 +0530
Subject: [PATCH v3 14/26] mm/init-mm: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-14-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1627;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=C66R4z8t2Qna/gYEl08YE1zQ0IYA/DB7tbhATdDv314=;
 b=a4ZKz7sKq0X3Xk4djKf4AkkMOFWqa+Gt3qunjb5YpftQ8eDqQGmZHBmWWdz2ObrXjPZiVPIj7
 /TQu22VS0TvAfSBd7UB5LIi8aMhGbP2gVYcpIP8hELXfmPA5AwjOiwA
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX4x4ZcRq5fh8X
 0R9/HBkvvaiUMtCBtqjvTRJZEywrL2ni6dCyotjBywSHHNsH9VJB1itgqxECRaCDiw0XDXeHPMO
 /x8Nd3cEZCfqIYwOe9zg7DznAQj9cymGXIVlGqIzMqrV2C6ndTSWNpkYS63EwfIcFRtvh3DtsPE
 YcF7zcftJlhJ81LO0JdpRodd9+nRxS2sfrGlv0tvZ3hrqCT6q9wLuwtm8ZxyL3MozHXzcKQNNzz
 KAIaL2MPpcPd7WFCec01pUUrUmgPaTTKMHvNrCooyUA4Xt5JVmeKZTeE22avlL7kEc2rW66e5Lo
 BbeS6d8urll1yelOoRDLPIjufIGcmpZVGb9sCMFIZyxwXcnk5bOb4f7YKT9+gkcBLEQa9wK/Dkh
 PdDhg53wE7XxR1NShKXiTrnMO4pNzXPUmZCZIZyGkI0uE2pQo8kebc7HWUKLuS2v3bg3B0KZpR/
 tUTem+ABe5pi3cXj/oA==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4de1ba cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=HJIP93yTpLwjP442z3MA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XjGOftCFJ7QnaefYg5KYd8e9A_dt8lZ3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXxfAKojSRvQM7
 psUmAZq6DP2ZnbcedXAcSYsfWswBLRlDNF/pgC+KteYlBYkOyvKTnszSUtOVHzV8O/84kn9o/G8
 AU+uL027LnrA0zw1dDFe74KyRU2EUKY=
X-Proofpoint-GUID: XjGOftCFJ7QnaefYg5KYd8e9A_dt8lZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - init_mm
 - swapper_pg_dir
 - _sinittext
 - _einittext
 - _end
 - _text
 - _stext
 - _etext

Information on these variables is stored into dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/init-mm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 3e792aad7626..cf53058410b1 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,8 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/meminspect.h>
+#include <asm/sections.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -19,6 +21,13 @@
 
 const struct vm_operations_struct vma_dummy_vm_ops;
 
+MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));
+
 /*
  * For dynamically allocated mm_structs, there is a dynamically sized cpumask
  * at the end of the structure, the size of which depends on the maximum CPU
@@ -50,6 +59,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+MEMINSPECT_SIMPLE_ENTRY(init_mm);
+MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {

-- 
2.53.0

