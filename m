Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC093BBFBB
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488924; cv=none; b=Ldnc5CqqRxe9hMZsp9lRjHX2Nb2V76+NpD7oih5YcyEaT20e47Rod7Y13+j2kDtZb9wyJi+Xqv6Nj59Lw8Rlfc8XhWF12Cz5/tsKgl7yO2JqM826CpA3qazTFJplqSfgcSXjKkXAU8eNgHdi2YhIbuXsnKwSzxLoGEs+XnGUX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488924; c=relaxed/simple;
	bh=kXuP+iYqiN6Gh3fmA4NpDHbdFws0o7gCzdFgMdl0MNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqMii07y8s6PFZ5MEbG455uBTbQnviHaZUvgFF662BJC0NnFJ/1a5X+rwdu/MGZzWrh5JvC1eTPWaLBV56ePC9y6UVZ1mUm7rpJEWmK6zWsRbZZV4gwOqlMuNlYQ0OlX4u8uQnTISSGy4Rbp8+6DxwfMOTFSCOHbl9B8avgduxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFo9WSIh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gkh35nDH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFo9WSIh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gkh35nDH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842l391645120
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3x+TMMzYs51Q57TTs1j42iOpyhdFk+I0hp3TICnwjg=; b=pFo9WSIhwEYdEYNM
	wWtorKvFh3bDjSxFAinXAxdKwm7Z024P8hmHhadMiLzMLCPdruqT4rmAkY4tQewl
	ElxyGsMl3gajlha+6ZroCW63wi4nK1ktdBuPuX3FAL9ZXixN/0lx3tvC3Y7lNvyR
	Yt37rMWQBgF6yWC5dLeTfFhuwBZ3VQbRD+U49GV2ROHTYrVtws5GaKRnlbgrdpHZ
	M9IeaDbto9UL5CGReS7Hx4YXldYcCpau+lqO1CfXLCQmq064VIbY5TSiGRZKMPxl
	6MIkzT6lV54A4TStfdW2tLHHia2uaiAGk/gWoiKa4LRQQf7oCcF59MGEh9tFrS5Y
	PF8WXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0man9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:35:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845ea8fd3easo752286b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488922; x=1784093722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3x+TMMzYs51Q57TTs1j42iOpyhdFk+I0hp3TICnwjg=;
        b=Gkh35nDHc3a6b+krnqkm6+VwwsdIseQoxprtjAa+S75zKcczvb5H/jzlLqLr7ly8Gk
         kr7KQkcjyOmrasAwADL823QzvdQrWjhrc94meucAymXPfTo89CzDKnpWBLMaopi/KcE2
         qr3MoTSENZaGbps6q1ZbfOz7lkoJ2RpZ46xam4ZIBUyJsGz/pwmv3aPYNeWc5eFmBUMi
         SbdFt71kXLpW46prsWXcz6+DVUT1zVRUYi0LxXrXJqWod1UVqDBwn29lEWEQGrogbdtw
         R5KALJ9eVxcnuhj2vL/oHqYGSdtHxAFYZ9GVnmkoyKR58QTMtB1HK3VAbrM/cmtSvTPV
         5d5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488922; x=1784093722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3x+TMMzYs51Q57TTs1j42iOpyhdFk+I0hp3TICnwjg=;
        b=Q5XuZmI8KMcuYtRhNfve2h6VOxcbLI2OvV4aoDataZVMqvfZo0dm3GWMGlTO5efAuJ
         WCNZn6FyNwq35w6LMn7lbIlG0IfuAvbZhAMhlk/X08ySp2L50I39xbvopuzjvmp/9nVt
         lSgbXHpogq8h3u/OPE3HZcQXwJzi/vGn2jZ12poqRpD3s0i9L1rnEb5H9qQ5HQ6EdzTy
         CAJrk1W88Kz6doRet36uV1jzAscEcJ8fSr5PwL3kM68nCoV3Ap4YMKDmljQQGtdnNVGY
         mes8A1f2drWza67Qk24nM2ISpcH6kwuIWd3Tz6lYg10RMyxVfhrFQPMRaKaUKwrJijMx
         F5qw==
X-Forwarded-Encrypted: i=1; AHgh+RrVTXz3aVhkJ8rjInvxrXC3w0kKPBjOo8W4/yIk6eBPp5ygUGCY2XGPEpxcozZtAFQcqKU4jdPf4Cu1@vger.kernel.org
X-Gm-Message-State: AOJu0YyZVABf+vXrjy9lRaZ2gqq2gLLek9zheDcUaMQOn+XJs+YLfgvG
	Ly3/WG8fllxUBr5EowXhDSDI3vJKBp0wSBousLjvt0vcs+hbsX62mm87WJ0p32VeQ85hrN6nuyr
	M7P5KkT+AcQsFQsdhJuz4fQt093ffgcYNGm0Y3AV8O6vKvBImvbr7bXzf2B6zPdoq
X-Gm-Gg: AfdE7ckM4NWqPwd1I5KwOa83hi/FEPIOADdRVDf8CfUJ2DRjwMhpe3K3EtLOdKmXP/z
	Hz9OxD7TOh5wedtht/xBI2jPky+bSO5xR3etlHfLDB2SnhrHU5Hq9n2A7/VNqCaU/KTgqfMlewz
	czyKtLEYR+HuG72Ijc8RfZBsVWDx/LJDiUbEZhL2NOJDFvOpx7ob/1V2KP1ichkYCoIfgctIujj
	qbwY5SUK/U6Jb9MHe7SaZf5HIs5Vb1Lk+ugsDN5mRB8SowoIYEW5jLkz/IYcXDwpkPJKFgXgguY
	kFodOW8Peq+kYGHDMw6GaSu/7mgSq76hCeFJmKQFChCsXG+oUzf5fgFaILOJIycQZm0BuY28pq3
	USTsmSBevg0Y1DEXh3gai4N6b/SkR7WbVKv7ukA==
X-Received: by 2002:a05:6a00:3c94:b0:847:8bf0:b82 with SMTP id d2e1a72fcca58-848438cc8a0mr1132190b3a.60.1783488921817;
        Tue, 07 Jul 2026 22:35:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c94:b0:847:8bf0:b82 with SMTP id d2e1a72fcca58-848438cc8a0mr1132049b3a.60.1783488920709;
        Tue, 07 Jul 2026 22:35:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:51 +0530
Subject: [PATCH v3 12/26] kernel/vmcore_info: Register dynamic information
 into meminspect
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-12-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1258;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=5yycsUBwoFxiKNQeKvCsF+mVUdasuljHstmWvn84Jps=;
 b=dh1WtDpiEGxqTk4F/COwgg2DhrAd3AuPXNJplwhLTNVJqIHM4OhNRd1Zmmkp2+owqTNHhWdct
 CiAtW2VX+qgAIDAxAIMI67SaI2XkeGHgfZ7O/D/Y9bcG/K5XSCTPfU+
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: BOIDefkQgUI5caX2NCxAorCLatTwWmAB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX3f2NNHQXzKZR
 De7wNK7GCUoCutskob221nbI5tNP5C5ST3QzYEMOJiWxFkMyvn2OguD6YECY2hdBx9rVD+U3xaE
 XXaEDHbaNiRr0ZK5YdWcq8UjbGV0yMw=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4de19a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=v3IzjsPwLRQtBGjmhGYA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BOIDefkQgUI5caX2NCxAorCLatTwWmAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX01XbaGyUxgfY
 OBL209BnbONf4v0BDQmuYg22ttrp68EdLAZ3OPXJJ7VB0H/AWIbHLWROFGJDODzjYniavLiYfs6
 G14ZzZAOpXZAyDLOb8nW6yF4I8v7jY/q2xaVr/fqFMVqn7+9zazfTCyZZ/6RzCTrFlbMOstr+YX
 UM/8YjVH/ESkc8Bopy2gWXeWSGu0onJkzNL0SeE8lPI8LrtTFQnYIYTklIbBwnzDeQIlmpPowab
 6DzWrNiDRGQMPBI9EzMbR9eC+50cTbDWqN77ZdJrSneZRoQZHnQ6epkWkofYAbrEIvvOcGrkLX+
 s/4moTOEODREoXf5WXDhEegInb+7ycrmLTMxHJOrQIIc7fSt/7boFTublvXK9OHomkXyh4q+2ur
 Q31bt3x4JU8V72i9+UUuAlsl8cjXBPYp9ZpcsczokxYpSfhIKMN9i/ocCrjGPqR8PxG4w0L3BR9
 +YDs/4IGBfPQtmU6coQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Register vmcoreinfo information into the inspection table.
Because the size of the info is computed after all entries are
added, there is no point in registering the whole page; instead,
call the inspection registration once everything is in place with
the right size. A second reason is that the vmcoreinfo is added
as a region inside the ELF core image note, so there is no point
in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/vmcore_info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 8614430ca212..c5181e9d049c 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/meminspect.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -247,6 +248,9 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	meminspect_lock_register_id_va(MEMINSPECT_ID_VMCOREINFO,
+				       (void *)vmcoreinfo_data, vmcoreinfo_size);
+
 	return 0;
 }
 

-- 
2.53.0

