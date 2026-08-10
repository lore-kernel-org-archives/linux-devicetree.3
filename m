Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF9411A1C
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375518; cv=none; b=eA9lMcvFFqDmOs8f/qr2Ys8sjCWD7Hl5mbMynsHGCev2NIi/6kJtXoAI4dDC4B4dlLv5K8Ew9kaMnWuoYjApURtRe/UKrq98pTdQS3Z7CBRinr2J1eMLLJfvMdQcyLi1dJPDPKNP9r46Ho1qc9REiVcfi+GWhHh0fSlRn90SQyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375518; c=relaxed/simple;
	bh=c4a8y/NG7USdLAezlweHsYVwlmujkZvRWqtUNfRkwQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRp5j7lL2nKqVAOxmMGfhbyceZFQibxVUzjo3fM+jzzTN5o6CiN2DflrIoO/2YgofVLgx73O2tKUlgPgwKvlXBCMqx3+5HFzzAtykXhOI+MFX02qIVLZj56W1LvaR7Hg0ksEu/IkDnNH8LM1+h6gH3w62uYGTeU4ZsA73nD8Ljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsXWBSZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SyflI6QY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsXWBSZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SyflI6QY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjRO71596762
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZIMIvoLDAmz
	Gs9DS9cbp63zT/hFrfy2iRoEFdcbPmoY=; b=hsXWBSZPzmOfvUbNZ2knXrbQghi
	KaYk4x3ME3vAAzwxvjQiGEBt8q3lPzTjE7p1Wq4f+hI2Jn6DxT/94lc00j5U8/Ni
	iwoW9s4SPjn0A2c1wjtE9lOCB+idkdSfUY+rOfxU5jUhHT6etj3d7bJpjFI3fL8f
	o3QuYWi8Ys5E+Otn+5AHUCO9vhAvU4xyg514dvT4vIyKXC338Ov+Qy5gHxi97ckT
	VbiBtD7GR76bNzDlXj/ga3/aWnEWE+cXKoQJ+B+imm09ksbUnL52T+1qZd/YGfY/
	Jyy/vDGZVBrUjIdhn5a+nqmaYZP74Xl3/zCiAuz8xUhFFfFe3/T5w2WLbqw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6t9uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:25:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so1779288a12.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375515; x=1786980315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIMIvoLDAmzGs9DS9cbp63zT/hFrfy2iRoEFdcbPmoY=;
        b=SyflI6QY7gbK2FHSQgw4ImJop+qodTk/gHNI6TSTgQeM6mtwNwC7c44naLWlJb3LJV
         sd4u66tP0iXO/o8IsUUEuzilM5i5jYuWvNlk/Ni5x8Wu6oZpLLpDUJHL6dV0Z8Vso2rO
         h/nkh5+7wXyiGTwt67KahYEKPr+HUMGfg7s9v2swX525/l58DIOOiG19gUBQEwuG37JN
         nOlvHqup0BrlifP50NI7HVuFjaLLNrENPr7PmYX6ZIC3Ko+qDHjvbIQ6tRHcEHqAdArE
         Bf0m9xHf56uWORP+EwC1u25BCqgBDiCuWwe4wQ97TDk+O88BTTXee85zi4u6GaoeyTgj
         NkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375515; x=1786980315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIMIvoLDAmzGs9DS9cbp63zT/hFrfy2iRoEFdcbPmoY=;
        b=Z3jJG9pI1nCVnl7j/emmvb5FaxEj/jGwfqfPijDwGrqe9+vA8NRS9NQa/oAX90ooGy
         VdOw5pEKN0QajLFlRIUTIKC1jwHcqGeAFvtMjbwbvv1rIN3zPweHtavZAOcsMfyqk1db
         SAh/LFhGlC6+mOshO5nV2GX3NdbT4dGQV/pTHBxO6kZQf5tRIpGlQA2EzW7KxFCO00KX
         1oUXysJaLYiQayLLbmYClXR0GrqX5V0GE2kE58pEd6DJ+IrWbifAdFsIC7g6ytq5w7nb
         XlBQ3jBd6uFGeJPWekXe6aWfznpeil6F7sV7YrzV++U3tJxn2wOOeO61Fv6kXJ9rMndy
         dDBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoesSELQ40XY8RrFF2KKWjgGN9xJ9cXqyg6N8EyyafHccUU2SALK5eTsx7h8CNAcIiNIh+NE4ESIAUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzLYll7W8mx/T1orgxDJaVNumZH5Dyo3xhYwELLelcfaBs/bW7Q
	loIRL92GfntNnTbv8w9a35hxL0J2cGLhwEmOr4y2RcAtHYn4yMPE7LM/bvXW4qQgQ/EaI1ORtjc
	nHcz4ntJR/u/RKSmvLt6LUTj5Otd1GmZlV16aDbuWiwC1NANIT43evz9+gLVdCLeh
X-Gm-Gg: AR+sD11zcxhBOB1X/2ZyVO5fDkBKH4dIdGaVibOrbDqlKAUmlK00NwxwzxwWtuBUzmZ
	Uavw857sA7N19lbhyG3zYZwX7VUsucu695trxLI3DYq+hNIbOJiNGGk6olDXhat7FiXVJNzv6kP
	bpC8i45zUPr5/a1xY4HDRFg2R24PiSTEyzM47YpbpWNq0f+Aec6msCYkSRufPC2xLgYOZuXkot2
	Ukv5nDHdhv81aI83QtTjRLkWiHWn9z3YSCoTIKHqoqdeLuIxgEj+NLq/rWapj6DKrLIfEhSatkF
	jySgU+QUjzXFbuaoatbJ71bEATkPb+MwzD3hioS4Qkfg20MKQlsdkq/qizR1Ye6fs7d+sorDmq/
	UzWWeZnqoGjIrZerbqhNS/m67xoFCgLgQvKOY7wP4xYiofXmdfVUduegQu65GugSqy/Pu4Py55p
	t3Wn2pG5Xgw6FqvLSie/IQ3orGqA==
X-Received: by 2002:a05:6a20:6a0e:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cbadb35cfbmr28824052637.14.1786375514595;
        Mon, 10 Aug 2026 08:25:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0e:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cbadb35cfbmr28823990637.14.1786375514030;
        Mon, 10 Aug 2026 08:25:14 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:25:13 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/14] MAINTAINERS: Add entry for RISC-V trace framework
Date: Mon, 10 Aug 2026 20:52:16 +0530
Message-ID: <20260810152223.3946743-15-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX84GbwuI0DsOx
 ZjiCG/Ifjsznno1QuGuHs9E/Ww+zcCe07rR/eIsOX/oQp8PNDk/K6ihSOEd0HBUoko++16gpcTB
 wIXbb6b0VI3GShPldftjBryXO7wC/OY=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79ed5b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=W-_n0kkjAAAA:8 a=JfrnYn6hAAAA:8 a=UgJECxHJAAAA:8
 a=hzgbeqSfhi83Ps7mpaYA:9 a=x9snwWr2DeNwDh03kgHS:22 a=qeNa2pbTr82C0GpJEZFS:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX+lvEvxeJ3BU1
 BhJr5pqu3yL4hURZ+J9rixnZ9k/96/34AIyQ9EWn8RYcyle7cJau/JwTyKXZmqNvzF7YTTpClNU
 wQg033Y9rv67aJodLyvi0wCboFqCvufNgcT1oZPUrc6M2ztRNnyiGEuxBindv/q6hCP0/DzskbM
 e1CuZhwG3hD4SQ77ZCPKF+THSPy229UYI2KMIGJuVRMM6MZmy1WnQploHOlr8OsAJIr+VcXTzAx
 A4xN08oQMX46S043++napTtPsZcLNNiFipQDhdclguGmcy6oXUjf7Fsof1NC5z0FxDo6CEa0NSN
 oVdw/gR6h3cQ8xu/HPschNfDLPDYOOgB8WsypJHWY1IgW1NltpiXSEhmr+U1qz+IrnSqw3UaKF9
 TazEe7X5wE6Fs/yokbwS1JKEdSp7LLtcNT48iqeOej2oth156lzAtVoDJFQYOt/OYslb1Mbq2V/
 fy2Qv6Revy1OGhh9R/w==
X-Proofpoint-GUID: m9krv0qv27_7uG23VaS-diXncBBtoznN
X-Proofpoint-ORIG-GUID: m9krv0qv27_7uG23VaS-diXncBBtoznN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

From: Anup Patel <anup.patel@oss.qualcomm.com>

Add Mayuresh and myself as maintainers for the gtrace framework and
its RISC-V trace drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b592cf49746..904392530963 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23359,6 +23359,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+GTRACE FRAMEWORK AND RISC-V TRACE DRIVERS
+M:	Mayuresh Chitale <mchitale@gmail.com>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+F:	drivers/hwtracing/gtrace/*
+F:	include/linux/gtrace*
+F:	tools/perf/arch/riscv/util/auxtrace.c
+F:	tools/perf/util/gtrace*
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.43.0

