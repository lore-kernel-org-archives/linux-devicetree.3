Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5596F360EE4
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488765; cv=none; b=BYl2oed2Bv156/qWeuV3ojT2avH1ee/JgNjXd4RNPttqp0649B4y582djG+a4ykoQsZbzTV2yRtBVteO7rHUoFw25ZxEv9ajB4mHBB8o8eU0UCB74+jwh8ewvb8PIUA3btRXU8gaN6IvuH9D+iDQWPbKN6L+13TzSwH+7JlCXJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488765; c=relaxed/simple;
	bh=LViExQ3nDxQajjv9U5jUdFV6kLaFd1zaubarifh2xpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MrU5tGe47EsWZ/VfKYYxReLCtaRsH/ZeTFrSGpbavmdU56SM0qox5i8aRuaiAVHExMNzUKh2bk4FrP3TbPOHVUkdpXO0rpL81rDYtUsPGd/E4XLTCbGxnXQlyIJB5nmJ+I9FHA4xuzj7dwuhWm4PONLiSmVneAhvGh+Xe8ESNsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/GuVMHR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQOYozoG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/GuVMHR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQOYozoG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6685DpcO1818065
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wt4xXlBaiTArQJb4Dc9JxahMF7p7g/k7Bc47vJjViYw=; b=D/GuVMHRdMYWGI1n
	zcnAq9lpN/WhuPQNUi7IePjTU9zxLKQDqzCLYxNbMHdlOJ09mo14YIGsgDPvyIAY
	RRCA56dsuCJ5WCWsz2WAmwblGV77toDFBbChK7iNJ/vVVtIPQzvIjZWPDe9jYr1K
	uzDrcqXIvdYEpYzC58tGCon0724sJCjjUCULAu8evnTuMnDM1uXqSEQc/ipO7I1T
	VSHsuLI2QPFinLNSeyng57txHpbeSTwQhux3JvOS7YiN6Sx+j1oCdRcvrWeLnm5S
	H4hwgq2dJYhKB5J5YWKpQQ9eZQvOYmz2HXyHzt5wlr+VFGeXHqm0duuedn9rNN07
	KhJk2w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hg1u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:32:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84240683a82so328782b3a.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488763; x=1784093563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wt4xXlBaiTArQJb4Dc9JxahMF7p7g/k7Bc47vJjViYw=;
        b=TQOYozoGmXbKe3Q3xQXow2iOvABR7F/W0fueDAcBSOyAfZIjHgXCggXQBipTlELVlJ
         Zyv4hrc7UsmlYL4e2Kw4zdFquWaNcOiNB21E2Dft0YOuWKiyNUped3WXz60b8shbE3Q9
         Hdx3h91NIO4yLzpj5PLFMLOrALnL+xC+YfV8N/edRlnJDmmCnM1yEd/GPV/01hKXF+G5
         W/LlLoHzne2TaSj7T28RC95i7Pnqlwuo9gyMy89SBq4AFqaGugJJvVr5ujlp8ivhynDy
         vKUCV3aMzUKgtbpQ2ea1HL5akQJlm6rYLU3+BgWbMfiGJNDJY4z1NBiXC7lbbR/a6Ziu
         0A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488763; x=1784093563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wt4xXlBaiTArQJb4Dc9JxahMF7p7g/k7Bc47vJjViYw=;
        b=cUgH+9+MackvOzhu/uIJ8nDYCTQCS6y9WIxuHvae1+R91LgzoYhwtvTIbEM3qpdD8W
         a+8isv5ITms90CW1ko62e5b5oUB9lY+l+2Ev2feOAPypms52w2fs9/hUyKxyEgG9k2O2
         nZ2F05eXa8B/K9ItFL/6+G+MGex6OIDXsOYuFqYCL1Ga+/pQQ4cyscrsXSeLiQ2ml1CZ
         12Y4W5J8CdhDpnv0d1ABn+1Vhhwt/93o90wslWQRSpsfrVkmaElDTF63JyVXorCStSCB
         WqPCsck6zgfV3gduRxYQKT9Gr/sLGcGSWadVkheXbOrI0gsqEC1aXkp/SAgEoNNd7L00
         aogg==
X-Forwarded-Encrypted: i=1; AHgh+Rrm1oIk2p9QAQj3tysZPd2MLstNfNpF6XD+kvB/Vhn6oTzUjBJqsviwzeRoOLDps4h3AikReHFx46cr@vger.kernel.org
X-Gm-Message-State: AOJu0YzDsshlag0BnNqcQodvBb1A/1YDFfjzUvejDzelq2FnzE/OdB16
	6Nc+hhduvzZ4meWsh9gY/xMQoXfHqOOrkIQReX4bgjcRM9D8wPde+i1jUlHTuCZvZEG2ZuUwYkE
	MSsE8n0/Sy76Ddg7oNb7CcXjvVZWAek6D9aYqmZL7fzZpuzgMqtMJxLqMLcvK7N7C
X-Gm-Gg: AfdE7clvWa/llAbpUtig6hQKN2BRQHB7YlIoknsHaF0M9ShFYPU/IqbSkKQaKbEFAVV
	J+u1gRCCI4INF1/nloxJruzujKP3KCD7XXuV4YGRqYAGGN0i/Ma5Gj+q8ThS6TiSFNw9jY2HgK4
	/OAvFM8lJgB8SxSUigKIJi17SaPCmskygn6LJ+y6/PbOQiGOY0EjgJD8WDGqr0NjPU1LLvO+ZIw
	0T1csDF1VQX5WndTLmWFpyPMOQ+X6AlPsBefE1+zZSFOMugmqzOkm5pD+JG1vJPnKdBX3Ka9lep
	KXbigDt5ujaagyqNrSVcsImHM77DxBl1btH/gNJRVfZ4pHOdG9HpNadA70v02gNFSdjFxchOzY1
	p9paCpU6WNXYyuW0vYwEg3VvCpcwgULGHo+s+MQ==
X-Received: by 2002:a05:6a00:3e12:b0:848:2ef5:50d8 with SMTP id d2e1a72fcca58-84842ffcc36mr985389b3a.32.1783488762940;
        Tue, 07 Jul 2026 22:32:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e12:b0:848:2ef5:50d8 with SMTP id d2e1a72fcca58-84842ffcc36mr985325b3a.32.1783488762180;
        Tue, 07 Jul 2026 22:32:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:32:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:41 +0530
Subject: [PATCH v3 02/26] init/version: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-2-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1541;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=biMhvzpDIK+Q+HwprmIy/ZCCVhqzt5rT4bfWf3Rfits=;
 b=k3O5TLngHyIRrBNI52+BrcUxw3xmjpVsNzhWV+7yBVH9wpmKpORd/vbLo8LxRWzzPpOJi8dut
 RJ4Kz16BlfeBP+Oj/O1AoT7PAHbGUl+ejWRIaB969xrnlumEM1RZh3T
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX1d9JX+EBkX3C
 /RtM8AxorOKETw3dpDZ7jrlml5mcpOIB35/yf8BXtb7YMM+ZrLYlbIY42RSB5VRlPcWe8PYTbr5
 s5eIX02Bu4yAvGVLlq5/8cPqBZxr5Kpf42Er2CPWoUWO26pDmF/toC+CqYlr/akJpACjjCPzsni
 2u9qBdnMT9l3AxLu2mlF2zxS+5hifeEK+9p3gzPFOZJKECQPiezQ1dLnIbLwPqwkfiPcwiWfxz1
 72whyePxwUvzSbtb1ncPdrt0If8SujEm25z8XqsBraSR5ovnMX40hHwq80EXDeqCRpEXiQNw37S
 PJmtAJSiwWPxzmFRX72JrTmian9UhHllnfNwHGzgtfos/NX6BrJ1DUnZs8HHlYxhnKL2lhGyhUw
 6NV87R3UoKUNCFMVgBOIPUCi3IvERyRRYjg/vrChCqo1koyEKGt4RPepI/qr1Gho1QPgk2ee35Y
 MEVSc8rniAtUHisuY3Q==
X-Proofpoint-GUID: jNHfLfjBqg6ypTcye8HiYwaNxGgtdbly
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4de0fb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZVr_NMlg2zHurtFOj60A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX+OPbHTk1bB1o
 PksFqKLL7RdHY0016V7LvYwEKY2P+6N6rBgeoCeO+GpNWPnPkx7O2Kj+fFl4Ynf0fBMG0UVln5o
 lxLZonx+iYGmpkKTBe7Hw9sq2sEE3nc=
X-Proofpoint-ORIG-GUID: jNHfLfjBqg6ypTcye8HiYwaNxGgtdbly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - init_uts_ns
 - linux_banner

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 init/version-timestamp.c | 3 +++
 init/version.c           | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/init/version-timestamp.c b/init/version-timestamp.c
index 375726e05f69..37bdcdd443f9 100644
--- a/init/version-timestamp.c
+++ b/init/version-timestamp.c
@@ -6,6 +6,7 @@
 #include <linux/refcount.h>
 #include <linux/uts.h>
 #include <linux/utsname.h>
+#include <linux/meminspect.h>
 
 struct uts_namespace init_uts_ns = {
 	.ns = NS_COMMON_INIT(init_uts_ns),
@@ -24,3 +25,5 @@ struct uts_namespace init_uts_ns = {
 const char linux_banner[] =
 	"Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
 	LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
+
+MEMINSPECT_SIMPLE_ENTRY(linux_banner);
diff --git a/init/version.c b/init/version.c
index 94c96f6fbfe6..eeb139236562 100644
--- a/init/version.c
+++ b/init/version.c
@@ -16,6 +16,7 @@
 #include <linux/uts.h>
 #include <linux/utsname.h>
 #include <linux/proc_ns.h>
+#include <linux/meminspect.h>
 
 static int __init early_hostname(char *arg)
 {
@@ -51,4 +52,6 @@ const char linux_banner[] __weak;
 
 #include "version-timestamp.c"
 
+MEMINSPECT_SIMPLE_ENTRY(init_uts_ns);
+
 EXPORT_SYMBOL_GPL(init_uts_ns);

-- 
2.53.0

