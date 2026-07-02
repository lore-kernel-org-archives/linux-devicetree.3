Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76803368D67
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017234; cv=none; b=p3jbAY0QAEjs4BMC4qC0QVt+AHe25TNonWNxfD8itPx5NHCb15qUXu/oK9aXwSrC1slo/VXZCg1LeJhWsrvPyJ7oNjsoMzMXTZzM6TeLHdElo0Rw/LHyUTVvTofJaex/yH1q8Tu3PDEqaXpySiF5qH22cIjWVs4bF79yj9EFnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017234; c=relaxed/simple;
	bh=M8JKAilImHWFwyVYesHC4CdcBEqjWGwTi9Aqczlvy7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLfAsP82IH9ZZVD/RUXPu17lm2iTe7nJJ/N2vndW4woZaA+fQgxe0nUl+zgzNG3pdNSjPK45gofVJBXJFgBwN/zgrPMSOCNbxCa+4JPklK1+Nq5cwvEmcv3CeRewOq4LMOoY/R0O6jLy/LmObp7x3gqB1bJ5z7mGQdVqxQs+H+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQvHSKSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARb7IjCX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQvHSKSe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARb7IjCX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3InB670818
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/I05FlTslO+Rv/QvjZgNXnkcUU43INdsKcKJfZS3/0=; b=WQvHSKSeyzEWNwzu
	+09dxQP5b2vSYKA9c9UEoaHgDUXGUzAx78vFvTn3uMmP3M80P7+noc3p4MnjcIa1
	aV8L590mIODUSFK2EoAFgV4UUPiQqxaVp54wmp8qt4F++eIxACYgg7wEDOiIcBXa
	uicaDA1eNU7AuXKxosAH0PtkwoLpRem7/LlGBIvrHLiovaS701sxC84j707fhnNY
	2gnDaiJQP/+81pFnj721bnHx/xuAUGZOfhAqPC1bAS6FjT83pz6gwi4INIPSGFN3
	QREXxDhmQOVmp8aktH+yptE0VTQN+YyLGjue8rpoXi3vX3neCRl0AMif/rRiqtF+
	YtaLyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7nbc8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:33:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9b71388fbso43934595ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017231; x=1783622031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/I05FlTslO+Rv/QvjZgNXnkcUU43INdsKcKJfZS3/0=;
        b=ARb7IjCXi6IicjZlwvPEPhRvPi5yx0ViqiSKNzcZGnVZzDCZXwAo50P1chsH03MM7B
         AdDo8FWH2cx8koBH6jnGrA7/8V4G17s+AkDo6vlZWoa+EOzJmY+VeoQEidqsL7tdWuZf
         zXm/vaCwYSzmkns3WoX0Bht7wxuX2E8U2GG9YBYL75aHDxFjqh8Hr9S7rYcg0RJ1gLo/
         kvG62QWV62VMF4YN0kMWHwr0iRNS0LK6cg6gFlDk0I8/iRAqk4CKN0cWJF9THq43oAIg
         fjN04f8Xe7Hmz5Xi8iMc51vlFCh8hW20MbkyngOKEZ7iO/JNIKnJPnqM8sy8noegRo1/
         79dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017231; x=1783622031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C/I05FlTslO+Rv/QvjZgNXnkcUU43INdsKcKJfZS3/0=;
        b=Ed5ttiDGpoLVvdUYiY/Pa1Cf2VnLjIKuyTvDKEwF7mqewkMbLSqAY6Y0ipy3cdW/rc
         8+h6sLsudMWLF6Tt6PItXeoCfjYzv1bVyE7Ak15Xzv7XDvLZsQrnt/H9vji+ehaVa8YE
         TvBTF/QXDJQC8ADdJ/Y9V3FPZHu+QI2SUS6P8UARqS6PfeHBCuEduuPMFsqo9UldfxwS
         g0XTOoJ8NCXad/UZXvWTr6709gtYbcW/gzkauLvFrSmJ3C4X2LgRkGKW3UjtBKF4TJBu
         2lZp+uypPFVboXo5FI3haZ6RICOjy9GqS0SS2Vy0D2Quhj00FrBmqrhLHr0CQa3iUtw8
         LLmw==
X-Forwarded-Encrypted: i=1; AFNElJ/JFfAHN8ORjNvL8kv9kDbhaRkWwCQrEiuJzCkw2rCGARLXQO6pcysNVCFOb+43Eq6ZQ0VLYF/qIONt@vger.kernel.org
X-Gm-Message-State: AOJu0YxE4EGliMBT9Owh99aWrupp3v7gQFm2vMZLV5R1SNnJ9KwJCnE5
	hX2M0L4HjCuQb2w8U4kCHOzsci9lthd2sp3k9tXa6ilodAp9Qe4rnxgUDIhfpHWohRmi/Dc4UUq
	A5mXG32egqbuWFucgs6gD5bQ16r+Y9VwXg3HOS7xJk4VGyLyEOCL35sA0RFcFfVWn
X-Gm-Gg: AfdE7cll0xVHvAln/hQ1i2v5jrX3VV+SfSdMw8d+0FSgc8EnDOekpC6j+IMqES9ZpxT
	zatHtLSFD2O4/Ufj89ihi+1bn4i1EeyRNDUkmyNoVTgEm12R9t5HcEFhI3L1oYSZdv3o+rmkLR+
	THshuoC3oLUPyK0CbM3xEjFi9fj5W7Jn5PykU4Z7RBo2y3EDKjYc8B0u3ixMaIIJbv7kQ+RKlWp
	IASDyWwPzl7715cKvcnv6aQdpNrCdYb3o+UTc7NIBw6o5ibuB9YYzmfAr+cOh4uj5ts6nUe3yTn
	2DiXJnCBPhjDRGcRdyYcMcniIgpFHlojEzS1cGXCwDzOE1bTapI+6UkaP5CL6Q//y5BSkhJKRza
	msStY3YCy089yLPwNfWLProfj9lhl6Nx1kfTrx4SMDw==
X-Received: by 2002:a05:6a21:493:b0:3bf:6c08:fba2 with SMTP id adf61e73a8af0-3bfed5df76fmr8664567637.54.1783017231206;
        Thu, 02 Jul 2026 11:33:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:493:b0:3bf:6c08:fba2 with SMTP id adf61e73a8af0-3bfed5df76fmr8664524637.54.1783017230784;
        Thu, 02 Jul 2026 11:33:50 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:50 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:32 +0530
Subject: [PATCH v5 10/19] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for
 DISPCC and GPUCC GDSCs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXwdIyIiPN/FwB
 lDhVGeLLqve8nvZrWiADxMOx6LmICfVBrTrrOUOcdrECKkNfA2ZcOMMvlN6RQruPr3V5d2Lv2lU
 ZyTPtFUgR26c2D8rkIPzRe1gA7dkzFv3CKhCBMZeBYdmgvvjvM7+Co+yEXwY7EMQlCvG6sPb93X
 Wd0N8FI1o5LB478eqObdAXRhIHG0zgqe9EgTlqM1sV70fpG07xMKsjnFnlyKdtPmNo/kFkAImUD
 OwTPcaBhbSdDRpszoZd8Qhl55/uMnGdxLRGiWe4/wt+ioQoHvLjwjQlX3epP705qyxXLP+kHy6H
 Do3g8rvJ4cgjyQod0zNekMHCusetQrZatBYeqW88IkqEfEcl+InZsC9oJtpPwcKlEEJMY11158M
 GNh7aMOFSQ+T+lGgD8ydwD23txQpBrAWB/7oD4vPDHZkmFf6kwdZNXFBgVgulDAcq5EUgVpKMxi
 34sahFgoNnckJt5sQbw==
X-Proofpoint-ORIG-GUID: UD6PMST2nMO4vSvPbZcXxifMKQy1TV32
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXwp8vRd4Jj2VC
 3Fh4tcUpaQC4zL806TvCBrNepYlxlZRk/uu+EYnKTF3So2W7ANtQ3AqV4+d2N3heJD8cyuZSUJK
 y+cZF4WvHh/iqjt3oAwBqaB6KUhF5dg=
X-Proofpoint-GUID: UD6PMST2nMO4vSvPbZcXxifMKQy1TV32
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46af0f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GcpOkd73Y67OKsgM6LgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
the register context across GDSC power collapse.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 drivers/clk/qcom/gpucc-qcm2290.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6ee074555099ab72106cfae7c21adbd1b4a0fdac..af5527f6a6aed94d372f5c54fa353ad4160549fe 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 3b130f69bb93898ce49654f2366851a7c1c94524..8d397cadc86aaa1666e27c8c4185b9b3de13cf94 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -300,7 +300,7 @@ static struct gdsc gpu_cx_gdsc = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1

