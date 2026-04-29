Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814D23FFABE;
	Wed, 29 Apr 2026 12:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467158; cv=none; b=PNDkBqQFJMVVgjden1BN6Rh8VTXU8QmezjqH4JNpjR3cnXMPDCsTtC80m0RjyOiGGmrJaOdXob4srikoaOFK8qdXka6zozTO7qFbjxXy6CZI5g8VseCAeog2kpuQvUpGPbsQ4tOWA21qdvvwe+NB4l0D2QZG3rfOjG/jhWvlfEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467158; c=relaxed/simple;
	bh=cXAT2Hh0qTQjSTUqDzzoGYsm6EcvGSrPeTmAHc9D6c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HW25j5ZcxFi4oEm6gCKfamTL+04DrazizOY6p1TvhzTpMgsLuhbadPeu8RF2HDNij56EvnNlgnT6eiPwY66a9Xek/niBCJNFgdn1+/Qod7t+trfcQswu3h16Zwg1qJBohAhpfFUyKzgDKJlbZ89uqi1F+KOziHa7NvZXAx6wMxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppK8rpbW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppK8rpbW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q74s1721242;
	Wed, 29 Apr 2026 12:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+jG25hwzYFE
	dW4tHJTb6Enm9wZPCo8BV4CKkZSIZ0rg=; b=ppK8rpbWA6SNAwjvW+C/w5RQHw9
	7Bzew6dOl/IndnaqaxGl+ey6PWcyW757kohMt48pL3v3D02Fyv4pFdCT9TlN+Djm
	fotbZOClEkiWaS2dO82l06BmL5X4xjwSR9YRCroN4YGM6nV9AlUWAwHwnR6j08sA
	oLhwAoEFxDdo0QtMwJVj7rXsQlh789PUKYn+uenDWg3OB8VbozsSt+ZTroMzHvyT
	hIkWfwMn0BLAHytoCzgZpR/vXsRlPI6hmifYdkd3PzIYADyFNG1vtgcqDG7H6XGz
	vw06KKcVbw8Bxc5W6MENX2SAXCjNpARhSQlmTFfv1QkCUCTn0t9b0egkhZA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7322yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TCpb4U010776;
	Wed, 29 Apr 2026 12:51:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds65fvr1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:38 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TCpbD5010748;
	Wed, 29 Apr 2026 12:51:38 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63TCpcYR010804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:38 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D9F0B22313; Wed, 29 Apr 2026 18:21:36 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v4 12/12] MAINTAINERS: Add entry for RISC-V trace framework
Date: Wed, 29 Apr 2026 18:21:35 +0530
Message-ID: <20260429125135.1983498-13-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1fede cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=W-_n0kkjAAAA:8
 a=JfrnYn6hAAAA:8 a=UgJECxHJAAAA:8 a=cfWhVP6ADMLbqTyXlKgA:9
 a=qeNa2pbTr82C0GpJEZFS:22 a=1CNFftbPRP8L7MoqJWF3:22 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzMCBTYWx0ZWRfX4lDEAoF95WqS
 p/i16/o3m1BRsEytKqCIQdhWUsLESZiH5n/eTfKoiUzDKF1z/584uVG/qB4rNNJwBvX47rZ8kH/
 cHoQyVjF1oq77rAEvAIi2nHNtcLD7fjQYQqUGGXXwdmpH8syGG73vmFC+nx92xQzqPl1GP2p2+k
 FoDTNyMid/zKMZ78Z+iv756pft3Exz3O3rpzGBMIcGqsSzhEstiVUKiia27XMIl348vtsX7P+Ex
 KcT3nOhaj7wnozxE3DFJwnT8r1Req+IaIPDRwJm7OAqP+dLFU7LlOgH755GzCAtXHlfi2r7NloO
 XvOYri9MLtgLbl4jIZyBnXu32ykdgJb4uPKRJZs3t1pxfSTRJm+dC61SgogQ6MfETCh6vv5uPRY
 R2rv6IPPtt+FUJb9njmuBSf5T7TkArQtzyZslbQLTkmUuonslE0SnviA05VgH1AMdehS0rTXj1S
 PUhilOgoAGJRp3jSeTQ==
X-Proofpoint-GUID: H2kW0fIPXQuBJTbeDzHbl-Brc6ph9xWh
X-Proofpoint-ORIG-GUID: H2kW0fIPXQuBJTbeDzHbl-Brc6ph9xWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290130

Add Mayuresh and myself as maintainers for RISC-V trace framework
and drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bee6eef2bcd4..352169340ec5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23059,6 +23059,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+RISC-V TRACE FRAMEWORK AND DRIVERS
+M:	Mayuresh Chitale <mchitale@gmail.com>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+F:	drivers/hwtracing/rvtrace/*
+F:	include/linux/rvtrace*
+F:	tools/perf/arch/riscv/util/auxtrace.c
+F:	tools/perf/util/rvtrace*
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.43.0

