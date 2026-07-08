Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C973B3BBFA0
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488829; cv=none; b=QFtUZnvLtv6GnxP7Mam3Xj+cv1ZaD+fF2NjLtqKH14zCroSZpHVRhTODn9OYwrH0exaQfGVQuhJZ3cq8NrTmhVgc/rOFlRu75sqqlIaEOSVrP+Z0UeCPlQsk/cvksXpgPuRFJoxdOLgZbbakiEfymGdko6k8BtGo/AgzzGypK6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488829; c=relaxed/simple;
	bh=rausTGX/cA29KL+8ZlV/G0O47Zo2G68qaUiTzxM2SoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ovCteqr85GnHJAg3dbqGWPI3krCAQEY76EtlI/3SK/g9pE7TzoWadsgxmvDInodK28oPfcfm8BCta+jzZ5KIAXVhtZg9A5AR9a9LA1XR6BAPSJfQq0ygpZiNhnNuou3GxgMtyVC7uTuVMuZCHcCQqaWzzaYhSBUkUtyrj4xYhzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kis4SS8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgQ9+Zdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kis4SS8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgQ9+Zdt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842TaQ1447430
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITO+JE3opr8LgPgXIr5SaVvHjNfRbkajEoRTp9nYlQ8=; b=Kis4SS8TmV5iP1Yz
	l7VP5KpLpSZzCD0HrWRlM9bPZ/SXhy/pzeuagg8DfSkugOIRNgwO+qGFPEI8UTz6
	xxQpKMEk3q4vPwwhSx2yHQIvCKGadfWDzWEVWxxZr1U1tAjm1JTlZhcuxJq/wHZU
	v5KN+a2tdu1/uxc1SoYHlL4x7Zm1t6TpzqRjbQrtGNZjDwpsvXYsl4iAMzvO/kTd
	fHtdDkbAxSVGRHy3kRK5EmfbHzCsONFcZa09PxBGA18MaN9K7IL+V55kZODy+bra
	MfzYkjW7Hiq0Qt7h8a2OhI8IXcXLg5BAILmPstdQeEwpidHjLbiSIdgV5v2jd4m6
	vvOMqg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u11tf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:33:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848474825ffso225296b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488826; x=1784093626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITO+JE3opr8LgPgXIr5SaVvHjNfRbkajEoRTp9nYlQ8=;
        b=BgQ9+Zdtz83Ulr6SUm835C4Nxqd9yP1s1FR5XzT6neenmVXvmHpamP6ngLyywkXMMG
         t3xU+CWCKLi/u+N8DRxGeqc27x5brgEPsDhExjFgZoGdLTGjIPqsoJUs7Ir9R2aZ9ISX
         qL5InlPmVhk7E8z9+Ong7/St7FFmUK37ZP9J54blErteGVyxiDTCTQP7S4MpjeMw5pij
         +N0pHLD8fXvZ4EfnZLsULl29/TCVz7MPuk+IPtOla69iUJ1bz8e/zXPcWgyFzXX/Qygx
         dNNXT4de7QVnR3abyVHdpKaTSf8Qx0x3WBylACY3PMLaX5L9A8ZllTbb+u3XRCfLuIgD
         Q8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488826; x=1784093626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ITO+JE3opr8LgPgXIr5SaVvHjNfRbkajEoRTp9nYlQ8=;
        b=M0IYmZoSXxOMpMZRZyKm7981Kj2MipjjSFjf66cNzCgtLZ2A0Ii63NMaAv9SI1Upbw
         k5jYpCrq0Dqv0K9MsHm48kDZw8LRUff8mxtuaeRj2lh018yOhjsp5kcDtQD0G/bWzV11
         tAr62hOFpUCSuOl9d/0iXRGwFSjV1rFzT/SO/N7fGQtQtqNofb4RnEfMaU79m0wuA+4k
         rAfuTah593mnwd4oByWYSLVUBVoY67HXowh42vxQHGFbPzzNi006Zf6jTYJhaf6fdb9u
         FAhdait/pHU6WzMz27898y1sUI1mQyuZSwZ4LIAgiWxB9Aeg7czH1FQbMdoN8EYC6M9C
         E+JA==
X-Forwarded-Encrypted: i=1; AHgh+RooShNw+nO/WujV5dmwSl1EoWbRHgfPk4PbAtqvAOGA+hHXJq4hqkStOgYqv0kUiXeMDSv0SnhWCI2B@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9pLdior27AOOA+syJMkFZp++dAIkXLdcLX2yUNQaQm3a8NwGS
	d/Gu76NnAxi5/qKBL8EiY+scMbGSBz69o4mhTSITfO/TlUUR3u8CICdoXPR7qFWTOTMakpO5ZPW
	u6y/8tk0ywdDyB5MtOA0wx/8wwdj4gxj68EPegNd6ypIbrI/48+mhnV7jf5d3URxH
X-Gm-Gg: AfdE7cnpp1OcQgkNSmUOJxP0KpcKLm2vT+YcwLF2V/rebky9iDtpj81/20L5uwx2czG
	600G0YBswvo8PrUNhoK+NB9rbn7JO9CYDBOmJAJoffZ+EicneVH/BPfPxGEi4GyRJcG3nTNoytg
	bmNvmLvnzkW3nhGqtjyGDDiKyKpivLuFujZv/RJJ/jDR1mNVaZExNBFAyrwY85QOOC6mjKsaLrp
	UPToPY0/tGw9I5euKrmOIC/i8KRszbgiZH/He5JV/KFtnaB5SorBu5luQK10/SM4n38t7AQcOn+
	D/a9u/sWIe5qp5OGUBddDA3TtLBw28krobKQ0FneKEPuzekq4D1Dc5up8Wd4FMojunjzMVsG8bq
	8zgqCdaeoVPt9HK9bEvuPbBLTrR63BvUgWX1mpw==
X-Received: by 2002:a05:6a00:8d8a:b0:847:8791:f54f with SMTP id d2e1a72fcca58-84842fe321cmr1182172b3a.29.1783488826168;
        Tue, 07 Jul 2026 22:33:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d8a:b0:847:8791:f54f with SMTP id d2e1a72fcca58-84842fe321cmr1182097b3a.29.1783488825439;
        Tue, 07 Jul 2026 22:33:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:33:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:45 +0530
Subject: [PATCH v3 06/26] timers: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-6-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=952;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=dRXeUIpIlzWe1LNHxoHjAVpHzKcKSqqlKNhUPjx2KTw=;
 b=FTqRhuK4jJoW5z8xkIzP9taBuoDPVq9v+EOp0exYW2spJdYWD+lEd+oHVaecDxylcFpv676MQ
 j09Wz7/ilg8AWemdOCnZLhJohxL16BOY0AIU6SL7rCeCEXHzowGgz/i
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: FuwbHz2jxFJBuzWnr_iudZdS7WQJXOdq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX7y7gDgDuULY4
 IDjOA55qzwT05jsrw5wMGz+2clSIle720+3Vl+erndUPZ1AhPgHvU+70aIp92DPfImdvKMzVR5Y
 MoFnHO8Ez05eQjClUgE8THK0YvYp3bE=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4de13a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WZmkKkIAQcJSthQVk9EA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FuwbHz2jxFJBuzWnr_iudZdS7WQJXOdq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXy6gIRVPdp8iF
 +JdqXuijtWn1U2pOJUP2lxlz7Wqtsm0yf9EIEJkuhJ3nTF7bk2nhALywLJqCpT9SjWZ67w4iFD3
 z4MQHSePdgQpI1pGWJ/19AFocjODdR83nF6fmd02JL+qEBnhPsttyCfRmAfaKxDgXHL2++9pZWT
 gW3CaXO53FZMXxytowtWlZBfVzhcIEtpXo+uJraFGj8grzBTDHufcKYh1EMKO3PWw/ZMo54X9hn
 EEtVBGSe2bemJd3ehRaDq0X4sUqMn+IuPBB6scWWF96CNDPEVICXmY4uvuI4dFdGrySULDuoedE
 xVURRO8PKohdn0MzdSd6wEobho/RG5Y7vRAtd2HIrADnFT7xIyZE195RvW3jur/NnMGdxBfwBXa
 DwVM2zNyVwYc684pVCiEk3AFdnvo6P2UewNJpfOyPASwU3h+qB7WbJ6v4PNHWedBz2iW5pC0VEz
 T6i5PHPiquot4UXr3zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - jiffies_64

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/time/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 655a8c6cd84d..6cbb054c7c4b 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -60,6 +61,7 @@
 __visible u64 jiffies_64 __cacheline_aligned_in_smp = INITIAL_JIFFIES;
 
 EXPORT_SYMBOL(jiffies_64);
+MEMINSPECT_SIMPLE_ENTRY(jiffies_64);
 
 /*
  * The timer wheel has LVL_DEPTH array levels. Each level provides an array of

-- 
2.53.0

