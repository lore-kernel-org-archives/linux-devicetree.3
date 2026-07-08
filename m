Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711043BBFAD
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488862; cv=none; b=Chb70PaQVCW3EUKOfi1AOdRaCgCWmTY03BV1wiHNb1hm2Li3YfdcqzWXbuFSFvoAzS+A5644idKXGGyfyzu26Shmz7KpKZ89iiENIJlhsbInkUyghRt8MUT7DnwUJ47xBRcc5qT+GLvzBZeMqD+qZd4fEyyiRXp7Gz/tv25WQj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488862; c=relaxed/simple;
	bh=Sj1jdSOOXK5Nzs0wxXa1BmNiFoIG4OgDkHPeO2dnm2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QLFwV2Xacm3tPoH/m5SoL7DtrvqAfSszYI+qB5/yhyRHtTkl0ocFhQ6XGu+KMcK0Bl/f/n07CemwvQLXHl5Ijc2HNSYr4HpTxS9rhCX9w0okKLmYMBlxB+8+e9FyrFq33eyCCEXszYztGACOTSjVvnZYwoABX56rBz9HSOg21bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NT2dGDDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUIW4Wzq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NT2dGDDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUIW4Wzq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842PUj1695676
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9JKSKEpCwUWulHpC5aA7ZnyWLgFgRV0CQRGlkqfNweI=; b=NT2dGDDEzC2DVpT9
	SrR/ynRKYJyvutjIvYhW8hdnUYlZdoJEk+AnEimC39KOOphBS+JrL0IvpMWzyJm2
	9UiFeYoWYnSa/7i/DVQH7J3ZSewaDtqd1lD3c5aOEP5DaWfdjHkwB/gWRC0c0RdA
	nBeCmtT/PY94Nzd/XFCdUVybp8N3xpWJR4Z8PwTH0AFsEp+Qk2dql+6pTYPI3HLy
	7L49ucsHiWU5wKZhkBXxa0qLekf8/fgpoY/x9pNsOMPWBeNx/GHuKS9t1ES5MOuB
	CAKXUZZzqHepgOdcWQD05u7ulY1OLpNlml38Wm4J/iovZ0+2gQMxrr1BkR0vOWyZ
	XwfwEw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw8sk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:34:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8479cc04d8fso630028b3a.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488858; x=1784093658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JKSKEpCwUWulHpC5aA7ZnyWLgFgRV0CQRGlkqfNweI=;
        b=LUIW4Wzq8/tD9zP2tFABEVDnkRMsMCCEhWXlWabwo8VV5PM9x8aHJqM2KXOM/h4CqW
         v5q42I5bt2ej2yOOkgQCvngO8Ak5UV0z8rBwn5bNPhCXKayn7AUJ5HpFHS3+KtN5ohF8
         0zESkl4v+kL1HxwqAW6vw/JJxQ1G+SOgefYpHqyncRoQIxD8vpvWSVTj5sAGeyMIzPM4
         mIJ9Ii9etUo29FdxqF1DUisBifUIxKgkod/rap61YTHJ3LlPgyUTODNX4+WWGB+lqDdq
         iup3Tx7LUXP8+keh9C4lUXe+ohdqTBeT+w8qQBdUoqmVbXZGLSex+yqWbqc3Jm+qXHKc
         hlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488858; x=1784093658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JKSKEpCwUWulHpC5aA7ZnyWLgFgRV0CQRGlkqfNweI=;
        b=C3pIdD/yF0KIwH/MRHJjgh4X5JR/f5towMuZzdYY43jRrKS8TfSRifvzL+mVsx9OGE
         VwgwGrg24ERpml3qr2NyxWGKWwylAZWJ4EQZFRjHPHtzurzkJxFr4dzd93YhJbkgPDkJ
         1HqwXJpASnsls2zhaO+ppbGuqi//VH81Z0lZqGosuHvhfqYpa7HIzd2QITPSkQ7pw3Q0
         7sB9xKrR/cQt1Zuw16k0x9pnH99/XGp5VySmIwBOSgraMbfTqa2m7Ooo7DJE+buzScsG
         rqxVY1oTHav+/KfCDs2Rm2vnqHk54Ppw7lPgSxHTxi6dFyN39iO9bTigQ9HbPeH78r3q
         vODw==
X-Forwarded-Encrypted: i=1; AHgh+RpNo3qmHdjo3ou5iGssK2aD+3fQGJShUmzE6GZ424skuLmT/3WOKE4TE8Yp0g6yuN2lRMFd6o9cTBUv@vger.kernel.org
X-Gm-Message-State: AOJu0YzEOn5iZwu33w/iSplPRZlgKjM7+cYxw40w/WCqvV4SISu7epcI
	eHyPi/DoOWyDybL7gNs6iZWJVTnxJUETcGy0NJr4X1Km3fV0bkG112KAb5D/I3Q5asi9lxzdHyL
	v2coSOCOr0g4FVkaWn/554be22pKai8DdisznW4Gy0fhtebMFEkPu7n3c/9HovALe
X-Gm-Gg: AfdE7cnDGLfVi/7rxzQbWYvv0lObwaKuUNHr42tuC/VoMGLPDbE6G3r6lLlNGN26pTd
	HQ4jsW2rXr5893gxixpP1RLZOxoViOAeJUO2DcX86SnhFO5FYlrhasX+mDEbYwd4BpB6rEBiEsy
	qZb+RtfN5kPCpa204cHKr9c1Oxbeyd0wuW/Pon6lXaihQtsYgANXG+Lw1yR5qkDP9Pbi7jg24XR
	Srdu9Ok/xyGfHhI62EGSC20K1XaotQyncIFgGo9snpyIJFEFigZR/GzZVb1VE+J64u3IdZsLHCg
	c55zMlTrtM7BUkeT2xd+4huxV5eVAo5prFcwEg6sxmFQ0iAXKg0gGR97NSgFdb39ixUyLE4I8/W
	Xa2rcT54/NIQ+oedtMMLZHk1hf+X9wMmh2o0QJw==
X-Received: by 2002:a05:6a00:1886:b0:845:d286:1fad with SMTP id d2e1a72fcca58-84843232103mr1002146b3a.60.1783488857910;
        Tue, 07 Jul 2026 22:34:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1886:b0:845:d286:1fad with SMTP id d2e1a72fcca58-84843232103mr1002094b3a.60.1783488857213;
        Tue, 07 Jul 2026 22:34:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:34:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:47 +0530
Subject: [PATCH v3 08/26] kernel/fork: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-8-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=954;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=tH4L3qrbhSf/V6y6KtMHUcarziHQ2L0/qqZt6IntL8A=;
 b=83U3lLes7ct+RTYAnjAk+zQH7f+zLTDcoSsWkgRb4n0jXNEWzZ2Nxi22zBFZqS5mjh5c7YHcu
 LAQzf7ye50qCA3/5b7cfLy4jL7uV11VSKD0yoe1rHcr7kFM2lXZj5Hc
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: skOLBBdvjb7rWygiTEfryURx31VEh5ha
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX/+mogDFAeLNe
 bL8FrsLbpsskWITjK8YgyPcz/sxJzxCPFO4xy5jUn82WCA5Vn/G1bMVjrCD78FlPiz6Cdgc8nj8
 zobmimSKpFFsUyc/sM+/LXln3nj0Qc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXysVUbPXMvqB3
 19P6q8+guNOawIIx2O1z6tvoS52J85QpbHfUPWBeTUqaYb1L+K33XKOSTG+jD3W0VoEGN5rNn62
 c+DW9Z48gc3rKUSEGvjNpTFMkeJb1N5ugdQgbOFTT6hvl49QHYN3ca9y8Zvu/dETRBVOY10GHs7
 XgrlaMeUSHNwVsVErYoAOIA84ZJwJwCxljrVmikqq+imGXXRHDmS5/SrDqZ/KIbunlDuwjdBXQa
 mzwymQNd8qq4A5leoKfxLtb+EwkTQEmvqy4QVglvWGa3yCZxrkBnvNrrw/15O85xRF5gNNVFkEQ
 DJpvSFvbUF/0HN2oksPhLZdEao36jGhCNcZD8Oqs8EbUA6Fgq/LWbpySht6DvOhVh3eE+p5hNOn
 BLIJFXkDuBGa8YbbGuzi0PR5xS31hoPBTJ6Hr9ro/Q3euRbFl466wakavYd8zhUUitWhUN6C3gf
 SRElSCyzeAtJYP7LbPw==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4de15a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=A5cnksRAjNInYuj8VG4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: skOLBBdvjb7rWygiTEfryURx31VEh5ha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - nr_threads

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/fork.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 175c73bbe2bf..ec99066eedd2 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -111,6 +111,8 @@
 #include <linux/tick.h>
 #include <linux/unwind_deferred.h>
 #include <linux/pgalloc.h>
+#include <linux/meminspect.h>
+
 #include <linux/uaccess.h>
 
 #include <asm/mmu_context.h>
@@ -142,6 +144,7 @@
  */
 unsigned long total_forks;	/* Handle normal Linux uptimes. */
 int nr_threads;			/* The idle threads do not count.. */
+MEMINSPECT_SIMPLE_ENTRY(nr_threads);
 
 static int max_threads;		/* tunable limit on nr_threads */
 

-- 
2.53.0

