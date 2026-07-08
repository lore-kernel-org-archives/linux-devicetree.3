Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F907377558
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488940; cv=none; b=iqYJWHl+7NtkgXc13lp/HsgP9HdmyqKlX4PAkhuO9mdFbxQ1u303J0pf9I5Vejc9rk4cubp9LrtMl0/v0XAjCy1jm4HwRI9KoHxVAgV3J/16oqb5QSERJAWboKA5JMAgi941Gau2voSZ3xAvAwz1d0qVwfidIORg7Ou8HUTskYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488940; c=relaxed/simple;
	bh=VGtMpDFFJ8AMn/x41vfBeQZo7MfofL1gwJeLzgL/KfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/HnInc9U+A3oZcUBzf5yyDw5uNcP1ijLyidZE2vkRFSE2PNTrT7uPD0UeNWtuGLH0qb6tompyUAB1s8oSnfKEZv3iVrS2El6dOHUYJbzIaK9D+ljxoTOxQCiqkumU+pR1gvTxg59R1Y/xJhwDvBSapR0cio+8sdrEQL2I7xzlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEFi7exh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZ7dHENt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEFi7exh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZ7dHENt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842ZvD1491275
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mY9TC1kShItUPWikoDVcElgzg0fCudtz+RsSBo7NFkQ=; b=VEFi7exhNSE6eNEW
	+eOINcOvpmvrYtMDQ2p7cokzjt5kzecHBE1gJNpxiTLmdl1qUz9o1o61/AidoM9W
	5aVMXNyOdd4piuVhr9ZC+O09c06yDw6rYq9buVtuC53q/zta3TqKj6PITSKHl+/k
	4PQSHLgG6NrMtQ4lDdeuzpexKnNxfO5AlU89IR26micEaRG1GgUStu+GqIHiKTVc
	HGee/omlz97CBjj3CBgGEj+7JiOX7FYdeyJXhDqFXm33K0IEohevYWzTnQ226eR8
	qJgj7kGAOJQh7X9PuwyrCsOhrXCLtCpcWAVqDBKFcdtCsj/36uY1RrBoJoyk1l5w
	LvCdVg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g94p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:35:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-846f50381a6so326333b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488937; x=1784093737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY9TC1kShItUPWikoDVcElgzg0fCudtz+RsSBo7NFkQ=;
        b=PZ7dHENtjhXfluVc4D1LcPjjEJdYIOjw9SmXGuKlfXJwKfXi1xholfCG1NnfYA9WRW
         67AGD0Hi6EBPUHPdMGf7H/cx/XFBam/9SGWcCMSR8FYPcJ90tfw7clgMDI5rchsT0++5
         1Su5cictYPuxcEOYr/P4pGaqz2BBZ8+zIFFuAsdliolmd9xuNLyuBLrf664nIwFUIIaF
         t4yBREaaGIXmL9YhjZciP+qMNMl9010VUo7IGtL0Cdwfd17U9vLq7xPPRfOCU0VV5lEZ
         ItfTumCcj2gPJgkU/VxjrTyah6GR/w7U6j5quf73mR9KE98EHcjhUtPJqENwrccyj4cZ
         SGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488937; x=1784093737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY9TC1kShItUPWikoDVcElgzg0fCudtz+RsSBo7NFkQ=;
        b=a0pWrQPWFTr4WZ42WhuUasQgrimqbKg+pJGuQw5DPOgcj2GvcBPDLfpSEbtsfRJOqp
         y/VspIlQKYFSR6Jp9iZr5w95QO6J26D1z27XzLIOm8cRG0abZWCCijOiuv4X4encufAm
         lQQ9F9lzb8nD2Y/ajDOcP1kN6HvryQNJ26ROqd1mJYtE3SKQNT32aKcwQ2SqswCzyd7a
         /teYGI/tB5rK9bQ7vXiVtQi/MTY1dhObXozYC7YAkOOnYt7fB/tZ/9WdglD3Tdph5OVS
         HaoJKJsbpVL2dCaWL09Lo4yzefcnJOIw62Ohxt+17Z35Liyxc6keecS55CHUqN0/Vhki
         kU0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqYHL8cwQPCH32LeLXU2hlbgr4/srpFYkldWwP+Dxz92HR/s4sT/GR3/CKIgj65iErP07pp2BRC2c11@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEm0LKMiuccPZSkszhQMv7pi4j5e8tTMaIc9TsUH24Yb/5bVq
	8ZHxytidA+xVIlRlC253FnDy1GXRkdSH3Yiyxacn1FWt2K7SNv8D9LAmu24QOip5PjVAjj40kmN
	Q9Sj2q+USxGINX/rkrGZqBCtYLxzSqWkiofjAxalurEpnDWXAK7+Thp8J2peDkDXq
X-Gm-Gg: AfdE7clBXJgIwZtxaEmLHHZgL97HcAYlsidpgJrtsvaoPUE21TE6HHIQ/5c1l+Z9KAS
	MSX4iXb4xgnewG65fsPS49N7NyUM3xLhhzNRakdLt7uli9phWY6c67itGKYZiRm9HlmuMrXLmyi
	uE+KYayBd1EWZZ4Yqbi/QuCsaZWPhZElA4NkTpkNJYpjCwSpzmKr5BhAOcf/f8dzlhma3PTIyPp
	qd2lHcV213Euw94j9J/egOBGG28fLlxKajwsPonLW7eTlnhtEGbByRAstdIQjpPnX9MSxRH7rX4
	IZRA7AuRLeh5bCBJK+/HECqFr4n56gto0r4CB6/TMOvzIllb442trd5Jgnka2lMN2203pTmRRHP
	JFKlnpesRWEAetSijwyGi335ozq2z8QssBdQVTA==
X-Received: by 2002:a05:6a00:3a13:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-848438d7230mr1080707b3a.76.1783488937319;
        Tue, 07 Jul 2026 22:35:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a13:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-848438d7230mr1080644b3a.76.1783488936625;
        Tue, 07 Jul 2026 22:35:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:52 +0530
Subject: [PATCH v3 13/26] kernel/configs: Register dynamic information into
 meminspect
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-13-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1125;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ZV2kS+66Zo+GSuPrvrjZxSGkrByR7dJYtHrlrdTWNGk=;
 b=5SVbNkatrByr1/TpyiDmMuVtbPFXDVWi0cCCZKl5b9Zre8CMglPYGspE5ZWEb3Shosf+K63nu
 /z7Qty/Pfv5AEFi1fClZu/IN1yxFaXSgXEakFkdUbQUtlP344UBgWQA
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX/CwHbLKF0M3n
 v4skJG5rBhqr6qF8Tq/KmMRv0y38BMKTJPY2K2PS+rAl4gnDVJ5oxZa6sbMEyfLQqEV7pWeQ6O3
 LO2qcBlJsd+8EXNL99NYPs6F3XBtDyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX7gALjgvTe+st
 piB53fYPIjI5JR0KFsMetTqaa0ukNjuMjuR38LlE8ErrcPRZdIroqC2nUtC2A8KygK+FBZ4r0M9
 YG9mytf/lmfkMwMfdSM9Dx69t1xNzhjZzBQDeI2l4+fVfec0wE6+zLFOzaKnP5zYl4HrEGKhDfc
 UfNcVcvPAoAmXi3p1vAcyCH1JxVchdlEy8l1VoBBd0CsaSaiNhhLDP4/oFQ7qeGjfi5MIWJdEdf
 rQuECY4YeZ79C3tHvX+YKdGH9iEvuj3b8zZYSgCTbmX9pLchj/nnIBGZNoMQhymS/5A8XhAb3Er
 RI/YVHLVn2e0TYN+RAfVScRxPAgpIAYGUh+vJM0GclUFTxa8LHMjNGzE8XwJY7A3rQSh5UtNcVb
 kjailtoHO8XFGlzQKSsCIYS5/hoHhh+lz9Oe6b1falzItkYZ1K6N3wXsrJTkh9RViqOqBPJznYC
 e0q2NNOj4kMrHjGNfpw==
X-Proofpoint-ORIG-GUID: 4cJ6fKbkb5lTHcr-2BGpiHLt-0kb9_YX
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4de1aa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=LjyN-fOCrMyGU0ESAFYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4cJ6fKbkb5lTHcr-2BGpiHLt-0kb9_YX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Register kernel_config_data information into inspection table.
Debugging tools look for the start and end markers, so we need to
capture those as well into the region.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/configs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/configs.c b/kernel/configs.c
index a28c79c5f713..1e7b86a8b3fc 100644
--- a/kernel/configs.c
+++ b/kernel/configs.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/uaccess.h>
+#include <linux/meminspect.h>
 
 /*
  * "IKCFG_ST" and "IKCFG_ED" are used to extract the config data from
@@ -64,6 +65,11 @@ static int __init ikconfig_init(void)
 
 	proc_set_size(entry, &kernel_config_data_end - &kernel_config_data);
 
+	/* Register 8 bytes before and after, to catch the marker too */
+	meminspect_lock_register_id_va(MEMINSPECT_ID_CONFIG,
+				       (void *)&kernel_config_data - 8,
+				       &kernel_config_data_end - &kernel_config_data + 16);
+
 	return 0;
 }
 

-- 
2.53.0

