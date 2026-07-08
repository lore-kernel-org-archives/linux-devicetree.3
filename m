Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77363BD225
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488989; cv=none; b=U95tddU4qk5vpKBiU0adEWuZ/n7kEWJvh11mv+gAdauIaIANfL/Gng9q3W7990Cy3lVRIkL47wpcnDdBHphqaYdyPzdo0Z4qi9Z7qpSbV7fiywuGZay/Bk2otSZy3y6Ih/LtDzFKchb+ohYjluoNOIQ2JaOjdrDQeYKtqLN3/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488989; c=relaxed/simple;
	bh=X7v99CqRbrev+LS4B/JWYl94Ngrd5oDJbPRJ/GykfFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maBv43TMaX4Zi6fy3t+a8h5C/y0GYAqkxfVTMaGoT5Y3L7h/YuTnpiI4FyTWtnFinZzNznx3jhxMgV4t5vUhDLodxsk7TuYOs2Qy7z52JsqVWE4xB452HPjGvxe4eEj4eBtVT3Chhp78Xu+8ptoYeja+YbHgiAvDOPkcLev1750=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iv99Fe6j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOoSAAtN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iv99Fe6j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOoSAAtN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842WJj1638178
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoV8YBxGFxD7tibQwZ9WC2gTvFHftXwkSTWa9oagng0=; b=Iv99Fe6jAbsZCCqS
	NiM/Qq1pQ3aRuun62AHDkFpQxEYFtdthDAqXaUY+HQUJ1wFw/bPDans7nAPcDs9M
	zYV9AMQhoif2Gkb4YRB+yMEyKyLZA4TgjnGcZzO34H69ejcJqodnn2faDF1JpYXp
	dpjHuH2gzqRGZC1HgzQ0bJ5ZdgcWksb+VhkNv6BDiaCOdBP4HAdY4zJQD6GIEugc
	2xwzrptfJ2UTJcvWMfTxb0j/6zbeZImKWeK8+zIm88CQSNIePJGMAwKFFtmL2+E0
	5yS36eJoF4Q4RsIvsAJ7LbVBeImkcTef+XGdPa3CMbZgTFwHEQUo9Zb29FthjhhF
	OrAt5A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a8y07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:36:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-846f50381a6so327094b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488985; x=1784093785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoV8YBxGFxD7tibQwZ9WC2gTvFHftXwkSTWa9oagng0=;
        b=OOoSAAtNFXkS8eu8/ekb/tE0dsO3pxsCnr1aalEDiKgo9xecXkyZ+fGuAxjKehWw7X
         6N0OhN5LZI23tdkR2ZV7k/5A8/KcGDRghl3JF74r1mKfCl1Zj5sl+RBDEH//cj+AiENr
         eNWo98g5QjQxORqCWUmcyDEr/afr3wxULXWfXXL2hbtPvrX6HDkUEU+H4Mkk01vskglG
         AWaetEFi2o5ajpmhIgEtTV3ew0QS6kx0YpEdTdcIN61kq+FP3/fBVrBdjlzYa2KeHwzD
         LmQh3cZ0KisRqZSI2VLYHxEtG2N8vIB/1kCEUO+J2iia3sb8zSMxQFHbCZrnek8GA3HS
         HJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488985; x=1784093785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoV8YBxGFxD7tibQwZ9WC2gTvFHftXwkSTWa9oagng0=;
        b=GdSW0asOjfkyAHCuaEHHnjTzI2qmk+GQRrM8x8gSA1aXfy89pu91lL48VuN986+wcR
         GhtbUFYLj9CmXKZG+wmn97uax5bGa+0Ed0/fKPUT6DFQqKizOhEc3GJIiSbH/N6MIKEW
         8wLYdxbW9y4sc2iP+PyfbRsPEh97a2xZAkbm8xQs71FCHBnSyRqP8cEfmMXY0+AEJuKR
         Ft5WZJrbEsEek1t83JqJQEDXC5mfWC65QNicJBOF4Vj5tcSQgPSsrMoN9meEbGFYc9pr
         LAMqDsTXjpzeISpPqLCHtWa9X9WjHuyUxdYlVqbXQfuUCwMJEf7mnqzTlL1GaAj8g/n/
         81iQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCp52PDi41p8gW45O81cgU5ngS0+vmpy7QP4lOxZM7RaIEIacF0Q2dNReNTffndcQpUR9HOucG4TA3@vger.kernel.org
X-Gm-Message-State: AOJu0YwgD2gLwXwGs8An7hdphO7CGUnXUR3gD2yuxkhIifVYTHR575oC
	0J8SY7l5gSnZ9dy0UbFZYmdeQXHj1Bswm8vzIwgnCwwFejQ7dhO+aSZh0qtl9EUgk1q6uHBDU67
	htynD3FjAFwaOL0d3m/8jubg35NSJLGEjYvqOY+rd6+H8LDFR9fUQsCndk/cjNoaz
X-Gm-Gg: AfdE7ckQPOO4z+73fnj5dKhI8Apgs8X0sUn7Yuuzr1Skwqi0AU+HywfoJiSchcFOGgw
	MAK3kJFX0NHLQuP2hyu6FNqaAX4HLt8B2/4nb9ziDDTM9kXd3O24atfOs6hOdckPz0XZGgurhNz
	dRDfR3aDQ7uJMEoY9O+gBfPV+hpt8oc8d43nxQjGxzzM+Ic/y+BwvtdKy3YgYASMDje/UUUPFWQ
	j1A9NMDFpXD698VgRwSG6JyRl8+x7RPXAoTrjPUZr9p2aNwW3ZxkXeG6Pn/a721KTf/9kdnvjpk
	gPXRKMyS4dwk/k9n7Ny9kkvJh/KgSdzj38keaIE7hzi5/L3sdxc0N16M29H3hUAIrF0Zn1+3UVp
	adm8HloUkU4fbAciJ2w/bW46DthBJbhU1L4HloQ==
X-Received: by 2002:a05:6a00:a205:b0:846:bc7f:16a7 with SMTP id d2e1a72fcca58-84843233d05mr1113970b3a.28.1783488985095;
        Tue, 07 Jul 2026 22:36:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:a205:b0:846:bc7f:16a7 with SMTP id d2e1a72fcca58-84843233d05mr1113887b3a.28.1783488984399;
        Tue, 07 Jul 2026 22:36:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:36:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:55 +0530
Subject: [PATCH v3 16/26] kallsyms: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-16-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1392;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Gi0PIfTIjU9TnT41l5DIWFSBN6wjIpAR6J0C3M16mR4=;
 b=4j3BsRQDoQCY2sSeQc174A2W0e6sMIQ9ts68CSYZZ6ZC0iuChwxNv0mlJ/UxecW0pFQsfhCfc
 knHk43S2I6HDzfKU2yn6g+e2LK0aM67W84x5u9xvsDoxGMo1wtX+K7g
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXzCWbtnCqqpmR
 xGt+1wt3lumipAWvSZdRjWz7LkNTC0V0hlQA85gQhNJwPtwJ1pSQaLDcj+ThoL9J08gg5W9D8WT
 cvAyGAq6D9IlsuNkwAqcyLMgLmBQDtCrnXeIqz6UlqxuSoLQS0MCcEhAwXjrLte0kU2oHf+V4E4
 MdaOyp8s7XKdhrn3jp6htPVESVnNzW6z1nMMlV4B3MJjqAqM/H4PafAkNEYOi+EPTzMhBs3TfuJ
 XrOD1p8Pk6DgZc5OILe7tM6EgYwnYKbkEecQLSsUxkcDVLijN9ldCAT+6BcvLNszgrJrrwK3z93
 RMtFiyHr3ctOCWIGJrcy8+4QqhukhEkLrU630fU9FhL3hflrCkcc5DQfjOamcGvSMJ0ab74S0aa
 SLsWw6RVQoZSeZdsHuS1kX+iPqLmKCckFNGocTn09Z/ZRNbisV89Cg6xSvvfhb7XjnNOVpoTCv/
 TM7BR7H8R4/0QtKG5bw==
X-Proofpoint-ORIG-GUID: fjq7DUsmNRJm37s2AHIwh3Jq1Ocmr42i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXxjiRLk0EDwHg
 XUl3VJMIGjSMnccQphKCUROJasKl/o02byou25VcrCGDKun8jFv6HX0EH4kWnzD1A7Ocb6yDSg9
 Wyp5Q2Wd3U6iAsq7gaAq8PGVtoBwjo4=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4de1da cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=w68G1zR93E_Nt3437osA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fjq7DUsmNRJm37s2AHIwh3Jq1Ocmr42i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into meminspect:
 - kallsyms_num_syms
 - kallsyms_offsets
 - kallsyms_names
 - kallsyms_token_table
 - kallsyms_token_index
 - kallsyms_markers
 - kallsyms_seqs_of_names

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/kallsyms.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index aec2f06858af..e71c085ec837 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -31,9 +31,18 @@
 #include <linux/kernel.h>
 #include <linux/bsearch.h>
 #include <linux/btf_ids.h>
+#include <linux/meminspect.h>
 
 #include "kallsyms_internal.h"
 
+MEMINSPECT_SIMPLE_ENTRY(kallsyms_num_syms);
+MEMINSPECT_AREA_ENTRY(kallsyms_offsets, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_names, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_table, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_index, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_markers, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_seqs_of_names, sizeof(void *));
+
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
  * if uncompressed string is too long (>= maxlen), it will be truncated,

-- 
2.53.0

