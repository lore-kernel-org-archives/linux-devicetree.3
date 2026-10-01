Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA2A3F6C3D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832319; cv=none; b=HoRk6PhEfLCIejU5WWLMwobVkQyQBAFoa8qassy6LEWI6viYePiipO3aFG068dFyUcnNQC8taI+RSFFGXy5fFiVnVqjUMi5Li4mTz3DQT3LPFbug4OJ01RLnoczZhHwbvoK+lbqzkU/BunKR8zuTivmgh+6LVKl1R8OQj00DAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832319; c=relaxed/simple;
	bh=O6yb0HV3J/toXPvpQfcA1afsS4yAiF1BtgMLQ8UoSe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6LrzVW+19eCv3X94Znxmh4gQuDdnzx+PVjsMQkvZn9n8QXCgQFyRScRXJSyl5Wik46mjVm0epRdaje/JXz2QnVuN9XfPFInSs4lMO7QT318Rj7ox7EAlw4g4KQZN6uq60/XKwm1cmY7Oai40yzYsYyBZcXkTWSanEJEGp2pY1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqO5RFMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AewNUn9r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqO5RFMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AewNUn9r"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913ghAw1089593
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 05:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q55aiCcFgIH
	x6hiu0PyATGC9kqjNrh9qZcfBmGGijjA=; b=XqO5RFMJDnX/m7Rj2cHGHSQ10Ic
	zTwF5bqkuhJYCWP8TBr3QD+r4OzR8ZGII3nlcFVUzXKpWXiwoGZANt7/dbFKqsxu
	Z7tytmV2+pzoBvwPZBBIWVdd658LKtjB0R0VoLsKUF8GoV8Z76txmhA0u3xkoqAZ
	GHBn1NPRJbwOgI9Il1OiFAIQiu4hFfgPSHcQ9kyq7JBTDr/S22KqjwTdUnWE47cf
	UAJ5ITdID9lFuNEAzIyClH1ElwMseOeIMyckcgZGFIcZhhPOIRl3/HDnLF98LYec
	/bhuFOQb4auuqwYClMufud3Ew8MVAh7J/+LwWlj3w/HzIEt730GIihXHDWg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sswes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:25:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd7d0751efso4597255ad.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 22:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832316; x=1791437116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q55aiCcFgIHx6hiu0PyATGC9kqjNrh9qZcfBmGGijjA=;
        b=AewNUn9rQirpZSKokA9XA24TDAbpjzoFDlQupw5Pk5YTwSd7vy7W08XqGK3UNCfWi6
         GdcfoGptq4LbvMjifjgGUrH67SjofwDpEpPvDefufKI7+rK76cfm4lNDQZClWhOYrmXh
         RG3RG5E53iAigbsS1eu5zsdhygz5B3vr+GUlbgpXot2aACh899pp7vwTosxF9U7WQmjT
         xMF/Yi7TOTivGHnPgJHOny3LwNIWGVYqv0dzJRehEenTgW1Hc2Na2EpRh+Ob+C1rJinV
         ge7aR/nydrcJ0b/uVJt9UcMKR0+N/S92hJ5zTBANQcpWw80pShf1N1GJoIucVCHTCxKO
         RKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832316; x=1791437116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q55aiCcFgIHx6hiu0PyATGC9kqjNrh9qZcfBmGGijjA=;
        b=K7TJQNj9iY+bs4fJFBuZ4fvk41vjiYirCCMU5NSqmv9kkc2LOEdUDBGAqbfnsWW4uA
         lBobBtr4kv1hMgMkaaqrnOJEd2sIMyIfsuamsn+Cx7hw6AZLy7nBVoIKX3VH2O5V88sI
         KJnsM4BHJrEpoimIQREyqqgahAd2kqmIU2QHji3uWLGvqqRD1m+HZ4tw9g3Iu1qb88N5
         tjP0SGVaHYzK/0RjLIDDLaJVDKuaHXIWBnm60ax6R546jQSpV12nXamxvRwlBegO059F
         Gf6Zhy2vvrZuEo4bOaKuuVjGIoi+bRgkPJ5qRUSsNI9R+z4MD2bbAsHdi34oRGZsrVZf
         x2MA==
X-Forwarded-Encrypted: i=1; AKwUvBwW6NL/XY6/3g3neh5ir6AQnc8r7sBto6x2TpUG4Ju0lco2Xu1N8+eqAfQJjriSl0Ryh5mDqXJJC+51@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/1mJzG5DKgTrLgtt9lHtYv07CagT89qiY3OXk5OE5xfomRpGK
	He3OXm4IrMueYITvq0E7Bzspsh3gY7W4R2fgKRCcdrS2GVK5IrzDnT5bolXIo581Kh/zuUbqElj
	zh1nxQSgtBk58LrHsWa7ayUuzwJwYmTyfMVtTWxCaf7KXmexnvd1brdKiTl/kgs5t
X-Gm-Gg: AYBFou23xzwVorDNoKXZoHfa+Kibyl/Usp4LTfTNBz75a1DAgwffAFvhd2oNz+yXb0f
	tyw3fSnIm03SLoAtsCw+ZbszTss2doS7d+r4uTKEWQtUGQfBIAOalzQySDKZLvGGBPF/5UCJlst
	lmq3xTqR4ZHMUnHDh7dA68gkfa5Q11dWa+hlFjV4fN/X9MJ1ODE1YbLign6HpDZ2J7C7xXNcRwa
	hHQH9kXhJoG6pAUfxGDKwWn7wEi4SNBkymLRwL0JTtbGaUxIgM046UVXYlvPVbH8rEzm3fGUG2P
	hKUiomdNbSFSC8dxIIFoQX3M0/7pdbzEUR8CEI/+BuqjwXwxc6Sg+nk7JHEoq3IGSpaFYQaUMB7
	zlXKL+oD5zoMOGn0+QlEJ+ZIqMlH4LRWE7XBu09nINHzIjiZL4QcegPyKFwmNu01bTH6Cye/IYN
	lKGqDK1HZKCaofwClIDfN2psiP
X-Received: by 2002:a17:902:9302:b0:2e3:2c8:66c6 with SMTP id d9443c01a7336-2e302c8695fmr5785485ad.32.1790832315735;
        Wed, 30 Sep 2026 22:25:15 -0700 (PDT)
X-Received: by 2002:a17:902:9302:b0:2e3:2c8:66c6 with SMTP id d9443c01a7336-2e302c8695fmr5785285ad.32.1790832315254;
        Wed, 30 Sep 2026 22:25:15 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:25:14 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 14/14] MAINTAINERS: Add entry for RISC-V trace framework
Date: Thu,  1 Oct 2026 10:52:25 +0530
Message-ID: <20261001052243.3042627-15-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX1SKpdFSbSA/A
 uAh7Ni1W+kMDkaPAe8cOg52QnuawHENW/y8KM8rqb5tlv9Iud5/JJQUzB3CptQnJTbaiLnL6JDi
 0/vbeUAHeU4mpkliink+zt6mJG/rshw=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdeebc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=W-_n0kkjAAAA:8 a=JfrnYn6hAAAA:8 a=UgJECxHJAAAA:8
 a=hzgbeqSfhi83Ps7mpaYA:9 a=1OuFwYUASf3TG4hYMiVC:22 a=qeNa2pbTr82C0GpJEZFS:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-ORIG-GUID: iwIrjKt8FqmE-QuBiYDeYhkCAh9X57ag
X-Proofpoint-GUID: iwIrjKt8FqmE-QuBiYDeYhkCAh9X57ag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX9nCCcrUrOqLs
 448Nv6JbeLtMkMfspMRx/xCz5hKkvoRUICCWeQ6KqO+KCrYqwDk7zkIV4jAeL2j5zXHtM1ivKv8
 2FDkrESKVVQn01FlJAcdnlhLdalsrpYN0AvDlE4GmTxKW+yyUIefrGFi1sq6yJazyElN6WX9elJ
 tGJyqweJKP0Z2/QMV3rdpg7p0Lj64WWjOvjeTKZl/w1Do/w5+0IzrTPmEu0/5VKnXjNh3iXBiGf
 uWvgrz0W0KlAB02hbS8saXfF+ZAN/XHYPyhUS07+UOE+13BpBIt29UnYDrlqofcf/ge9FvKxON6
 HnDdVzJUwEtjAX0WlcBmpxo7wL+1l/UpLe8S0T54fa7DX/9VRGVaw3ctiWe792UN8Yf20V7qXRe
 T7L16ArLOq6tMhYGUtC2lB/A3MaWZfDbo+r7TKJryJF8m7RuPvBxD2Hrg13T4YE1tkxIGjcT6tO
 5xoVufQWKhkQrxUYa7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021

From: Anup Patel <anup.patel@oss.qualcomm.com>

Add Mayuresh and myself as maintainers for the gtrace framework and
its RISC-V trace drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 360977678f70..8b5bd2815690 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23656,6 +23656,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
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

