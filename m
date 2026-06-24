Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BCE34753B
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328189; cv=none; b=haNcIyUFSht8XN0RjPFf0UoqnrFBgudXhakxSuSWNVODE0X24SeXcNpEwGi9rKbPpdHfwTY5ZVrVNJCKBV3j624m4qcR1SrdI61hUmCB5lq/k3ugmiyE3uXJDDfk8fWjegwBQ/Jo6BBdf9HbSqNa1RDPcLBVTcChVHgH/8giAuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328189; c=relaxed/simple;
	bh=pZjAai6dEQC3bvSotCI7iAkjjujhp7ETnZsAk9bKWHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhX0k8eMul7TueVmGNeifUkIx8Z/BGNA0F5LV5ff8Pb5u/iJUCW/oju+ohj1cNX1BPTcMQ9r3ItklHRAzxiUKCmrpX+yX8iI0vbs0oFVIPKLVCEzz1AH1M3OMJZEy8XZD10HzGLKYDKTx9UVZ8xbzLCNdP4IFqV/bW7A97CPcAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bF+SPQ2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W17gggOB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bF+SPQ2C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W17gggOB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj3gI3580594
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uDR+9U1ts+c
	QizNgycSotwpO/qHrSVlMysFDU7FIE3I=; b=bF+SPQ2CcIzedhl2DJTfSCdZhfQ
	KFeffNU1ZFF4YFS2s0vo3AMcew9KO4gtrpJL9iiKMHTlTW+81p6GQk3bEUt4C0V6
	+Q9xylCGMWLtl11Oo5XGKDg+eHF185ERgVo7KlvbWwzQS+qQNA0aAayjzDaCS3LT
	eTUXsRo9KbE31uJBloixT5bgbkwkkrAFBXJlBEWnYcXksWyEFfzQVBBrlJ/u24/O
	+YYSJ5upoV5qrbd2c2wjk9QMo0DB45uiHvCQpr1xbtZ2VHOMiWjuSsjFtTY4uNbS
	1KRPhUQRZ/PCVsG8JAEqw7Da8Mht4TCIVOagoIpAhg6s87O/BhL4DBPATFw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aqbw32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845438fbd9cso1382814b3a.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328187; x=1782932987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDR+9U1ts+cQizNgycSotwpO/qHrSVlMysFDU7FIE3I=;
        b=W17gggOBxRk6N2AbblqHafdQWg8dhQ200eEDb9WS8G2Usik0YkKooGUkGkWhsMTwii
         3IyqYatkiNQxwXekvGWlhW3QCq4MAQ30AbMsJ0KGa2GdxeVd6ghQHUxEtv3guH3KqPcE
         sO8UZVvYqM7k4wvTjKpReWRscZ0vPVvdj5kpEmJzuW04hHTZ5kG3Xv55/khWcxlaUdAJ
         KuwtSjkRZWlZqOqucCquJrFvsr/LngfiBJIUzXRJKcAby27D/kFNck0uVMwdWJvmqqmL
         I+E7ftARjrRGI8+OOCHi3QnQG2r0wpk2xfO6t3pw0sPbmb+MmURa0qd4y+CFD0fOxgEX
         NAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328187; x=1782932987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uDR+9U1ts+cQizNgycSotwpO/qHrSVlMysFDU7FIE3I=;
        b=B65/Ytzvf+r2kQSy7+fvvdrhQ0F3+sTnYbfMYO+wqFbK5fuPpEJXTPHAK4KE9LiJBL
         Oh8Yqj7iuCigfopcP+kVkWtTZ5LyMENoNDtWL4X8HR/ZSJXrA6/Fgy73a6kHKsQLRdXg
         0H3gbcrCgpVOHgfcuoKXaYE6+tNf3p37BP2BnXLXKraO5tNlk6EXtospN09UZnuU889b
         Ib2nzXoCC1pa0sZ4K3XD5BtOkzuSc6AGJdc4MBDkjf5wmXmoeeTHIj6nsrPewUDHkSxV
         EdzZPmJZQnJZi/MTzJnMKC4WTdWPkyYObC2XlcRXD+IJBLT3Af6byg3x2fPKfKoVTnxU
         2/kw==
X-Forwarded-Encrypted: i=1; AHgh+RplEL7PxypV9gmkrU6HUX9TxUNHY/E3mlrWSEpAiel6ZIu3C7CRRqnFAUwebSeHvW2dd+4Ig9s7f589@vger.kernel.org
X-Gm-Message-State: AOJu0YxVoPwTKd00lqIpGID2IOCzgLLm0Vf4a8bYzOnH92dB78pPeG1i
	1CzeNiD12mu5OXPXwpCrfGItf/doYJRPb1rbImuXUVeZyyYs1EPMLeiyQ8ioT8A7sK5Buy1MD3P
	I9deKKb8yexm4JN8FPXj1g9rFgE1SUkMBIgTltF1n+1VLRuyj6to23CGReAzrsQMP
X-Gm-Gg: AfdE7cm2iAX/qV20Jz2deVsDK1CFWaJtX9RO1ybHFkqdFPlojmg3XXQ5gE26SjqwKix
	YIE/xYLP2DIRQHzWLplWKQo02c2sfsKmAWeM86Xod3eZIHqzGSlydEwjdf5BJotPIXt633XPkz/
	PnFP7nvzOuAwzQfsuBKImQSGVcl7BtMXS3oL1pd4gdQ2XqtRWzhkwvnl6muVjcAvBKXFL0rpXuF
	KlwK+2/YJOCow0wXEtpqbwzmFpUdQQz7bh2wxqluHbnQKgr+3NU+tly+rz6P9N4H1GfzNsx3og/
	ud8oxqRtajOnjNRt4GQzqaS+/mMOz7vK0O6xGcog73+4APj/ZNJhGhVvYBDYmdh5reBdyDd9QCe
	Bn+Br8s/ncdkh9xo1GoSRleIy7bPq2LHxn1iAaA==
X-Received: by 2002:a05:6a00:140d:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-845a2ca4fd0mr5532327b3a.45.1782328187319;
        Wed, 24 Jun 2026 12:09:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:140d:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-845a2ca4fd0mr5532299b3a.45.1782328186739;
        Wed, 24 Jun 2026 12:09:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 16/19] arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:27 +0530
Message-ID: <20260624190830.3131112-17-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX4jL1MzQotDbe
 egx0wNmf//8EQhOr/mUF5Vg1/BOoEa2QkbhIfgnhByWnr5Da9IHC1KpB9mJ8Osi7wvZTydtstAi
 BGrg5+8Bc2hMEIK7htqZ2xQgtLVrwsU=
X-Proofpoint-GUID: I21Kr8TeH4WbTWu8huRxIP6gG0OSD5eu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX0LrzxdfgTgF4
 Q/HChmiiCumohvZ2YsQDF4wKBfkXP/54JRINrrf47KbdpvFpxNwfVTEli4WPuyNZetiPBRNsA4X
 FSZd0D+4RB0X3X5cWtONX+N7/g34UpvDgJ69mGA5J9/cq5MOSp2o5v6KK/GvuLp0NMtik6L0kQc
 SB/2vWXO/hKPIwxPDZoxHD62KEqDwr5bqz+UaCH44cFKLSRASH416c5iDvTvRAD/85+v4z1c3P+
 P1gDVpyMCATksAIJOsAgns6OXEu3KnZOFWTGmte2s6NWLatVCLGSm568FoaG7Xh20xoGkCerPH+
 SQB+9rEfzf0seF8oEbCPj7kqX5hRmQjBpgHcamNQTI88qTTnSQkLu+e4tG9h1UEnqAogxYLdIk1
 3DLh0zU3RbudwwN3F8mE7LMa759qfA==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3c2b7c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uif5S2Ty6xZypC2F6NQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: I21Kr8TeH4WbTWu8huRxIP6gG0OSD5eu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d6adf68563cb..06892ba22875 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -363,6 +363,7 @@ big_cpu_sleep_1: cpu-sleep-1-1 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm6350", "qcom,scm";
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -2808,6 +2809,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2e000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@28000 {
 				reg = <0x28000 0x2000>;
 			};
-- 
2.53.0

