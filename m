Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639913BB13B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489004; cv=none; b=bgD0A2tAWGs5S6ZJhg04QwJ7IlY0kWcRSvJOfsYV5Iwj1G4eCEkn+E3Z3MYU13RtSX6K8Nw5USOyCpjbbqcoqVlfz+haJaJwm5DFBcuDULsVLwdqGu+4eTC70ZDHQnohZIa2NTOaQNFZULVHJnkkuSpz6XPhW1yw0DwV62GgxIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489004; c=relaxed/simple;
	bh=6zWg2efwvk7/IxI9WkFGX94qU9nMXnZuURGzm95EFMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VIepqPAfX5jTGyBegaHJAK10GczP9OanJq+b4EqTyz4c71dEoJkQYWHSI9SzC7RgXNzjRSR7ZdiRnpqQJOmxvbbhs7rcUFsismED2ueiOj36TOCXeUrRznYp6FJyJy8vT26fHZ9iRsHBvXVgd4Q9ztSZZSGa0LRZx3bOFdg011Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bY7gB7vt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsgKTG+r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bY7gB7vt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MsgKTG+r"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842bJY1667907
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UqTfYZuS5v9TxvWd8p5QVvgMLn1YG1IPnoC+xwtJa7I=; b=bY7gB7vtGS8iufzp
	Aps8jeKcX4XgrAJWi3U8RG1DNWLmc23/ZS5++izX2zXirGVrH7nHEhYlRn42vY6i
	wGhTFMamIDLJoj3sUgqu6VBwoxT7ZVJGKkPInUh/xbag4Ja8O3yK2XKc0m2L2zfg
	kB15s+RoFoP4iezQSUzk8iCZFz6w+ddGEwklrZMf2jkdbOd7U2f5I64Vo2EZHR45
	6coNpwsO3rlnQuL9jAqb6b3WJUSaMRwvXcM2wNosfqs+DnOyFsS37ELYHTE3QCn5
	8qwWqZ91PSGQzaQV8mWRyyzhsc8FQ06P9/r9HAG/4mej+cAA2O4p9EyHAW2D28g2
	uSjXMw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5ttsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:36:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8479c6c6cbeso403073b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489001; x=1784093801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqTfYZuS5v9TxvWd8p5QVvgMLn1YG1IPnoC+xwtJa7I=;
        b=MsgKTG+rAZvOnOYtL0AcU0Pjo73lESfzBY0jto/GhrgZlrsnxiD9iGpAPmdAB0iFVp
         jRa0FCKKlZ0G7nsonzcie/W7MCqSVtMqpBi51lBWtU8EqRSrfd6YMUWYPh0/Bf3cbZEX
         D6LocBv+pLU5KdIZBjhJ5IXfXGZf7/LNE9/O+EyqdrnrgVQA6NRjI2705zgx3wsf6Txb
         K8U9ztB+zmkXVwYSoiN3kj6thtX35ZrGRfCipgxvY/jktcZDUsTREYFZZ2V5TTKo+rlY
         yaq4UxqZQludDgalL/2sa1G0Ia/2j+Sob5lZPKKLdZjpBcytsZkBjIRK/8K1b8WT4Hb7
         gEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489001; x=1784093801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UqTfYZuS5v9TxvWd8p5QVvgMLn1YG1IPnoC+xwtJa7I=;
        b=PZ5CQQBnHsbFfAq6gdY/ITXtrpAlm9aDTb73WA7kRcpPxY18vHsiSRecu0dzc2sSW3
         XfexxUjKrijaSxPQLwjpKF5zlJOsUOu8mOhJXZjrwSAzEdkuq+nh/Qc6n6KrXvLRdmDd
         K3Z7s3a7SLDASCIdpz60iYJzXW9bIO24keb/bBWJhUzYxrtOKwb8eJsag6A5yFWfjV03
         k2LazGQL/PudNaBNVb3pICW5Vt6TvxN2euhc4osZGkLP90K5RHSEo7NXMtXOz5iTRMjz
         gZNtAj/ECib+XKxvOU9MEIMy34W7QV3Na5lXLYGZLEgk23+2FpKjiC40HnLqDVn4yIXG
         Rhbw==
X-Forwarded-Encrypted: i=1; AHgh+Rrw4bH4XIxoMyrXFrDw+SuC2s5x+qLWAMB5J7gtm/1vR70b5mAGadw6Kd/OeE0txV19g2eUgnzR8v7D@vger.kernel.org
X-Gm-Message-State: AOJu0YyjizpJGIp5SxMOJJUsVcYRRF66njUURhXf9N11Chy2kVnFBATb
	GpvXDHkfNI/9tNx/OAMX4C4kZI0144lhPI1UTRhnjnnXbvDN6TTVSOY4+DexyAokOiokbwC/8MG
	NhtCr+GyoXfHoo3MAwS9F+8U8D4qO/yx3qoVRXkwnPV4wZK4oX5tNj/cWuQC+zrXu
X-Gm-Gg: AfdE7cnWhvFWQVHZ9areXM87A0sZM+tVat0Ys6jZyQgs8AHZj1pZ0AHy6OQyq3MSH/W
	VeenGsynDc9/szxPv7KvL18HPYH7ZDON674YCxAFFySq42tlsW3G6JPc+kKN6wrLBWFeKB1sEGx
	PrKCX6LMM5NGMsnFYeNmfa9gZfLvwXmGHjLKZB3HWguPBCrZyN0YtnOSoRl9CObrESx51mU19I8
	hVGP1s9nBTur6ppIKIfyQRas+x4ZPx3IWSlxUY2uBN9j6sJRgV/JcBx41/4oy8dYVuVWVfBlDn4
	uVk5tPKUdnN4KMOWPjuyGEGQfgauL2/cavHBNJXs9ASB2BWPzbXjRnL/SM6Qmc5/+gFjWYRSSGq
	7jGPdZ59IeBeQ2CTyY6g35niEaU4CdoZ59WseTg==
X-Received: by 2002:a05:6a00:2e88:b0:848:2f71:b661 with SMTP id d2e1a72fcca58-84843000749mr1202838b3a.76.1783489001222;
        Tue, 07 Jul 2026 22:36:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e88:b0:848:2f71:b661 with SMTP id d2e1a72fcca58-84843000749mr1202755b3a.76.1783489000489;
        Tue, 07 Jul 2026 22:36:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:36:40 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:56 +0530
Subject: [PATCH v3 17/26] mm/mm_init: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-17-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=909;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=4qnpCkPRiE5CsuQx1UWQEXlwAhSangPKX8XiWfRWTRE=;
 b=z97EtvKBT6y9k21SRqlalAiHkntvPI/WQIsgr0jHNuEecXk60Tdz+odDPSt9xKDoeipWusU9X
 d9152pff/1jClPE14SdlYcsdmZc6dXry9myPmuVfXbE/BcULjts2es9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: HRHe04RVRR4yMiOocYHBVQXL1lS-Mg1O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX111QKdX3od1M
 dLoKnPyTVJUO5wDoTsATFJNaRFAjvVb2ePprdfklcCndIBtyEz9B2wlD3wN+o15Ki5v3BYjd7he
 ZHI0YGK+KpB/LfGK3aKww9mlpOO0RrQ=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4de1ea cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R-PfVeyQBJMsRd_P_MAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HRHe04RVRR4yMiOocYHBVQXL1lS-Mg1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX5wZveFsvX7ck
 MLp0TM5/vSQSqqwMUB4d2g+TikEpS+uSHbXuuwuP6Gxi+DfbPCZkvOiXH5CdKQpyvHB28Rh4ZEP
 M4WN4aA5svbVkmWhgRbXZxP2v14YWcI1/hSrb4jtttJPNRuucZBMiOGSjoP63XS+1jHnJ/hk560
 3/Rq5Mn1a4Jv/QYg790spoAI+OUsQ+wTdcFzYYQgv79sRqWShJaWJX7MMNRCWcZBNfw1AYUITZB
 NClFVJ1hHn645XWP5nzc+P5IOazCCJMEew1Nng2GU46WX5vNHRxs0tHfQImcC59AK9qSFEanEOr
 8zuwB3KWWvSFF/iqYGG40Sx71EWpi4w+jL6bEN47WnRYSd7O7hzRDN/vcV0rHCuBDPw2RVcwJEr
 HkFguzrHuN1glqOQJLxXH4VfiGaxTLzSjhZfx63+Jma9p2zCmHPI+ywBUEN6VIXo5GX909ZbNOR
 XTWrvtY1ySA/q6s1/Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - high_memory

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/mm_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3ff2e90aa17a..d98b6071d2a1 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -32,6 +32,7 @@
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include "page_alloc.h"
 #include "slab.h"
@@ -53,6 +54,7 @@ EXPORT_SYMBOL(mem_map);
  */
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
+MEMINSPECT_SIMPLE_ENTRY(high_memory);
 
 unsigned long zero_page_pfn __ro_after_init;
 EXPORT_SYMBOL(zero_page_pfn);

-- 
2.53.0

