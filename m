Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB6E421F1A
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601998; cv=none; b=XV3MLpaSXCbamuADWPReqP/FA1QxOEQntg5iYbCnote996OsMG9EyTf87aoZ/FFU81gthqB5nQpxsGrjJgXIwtK4v7v/q/ENwC1t5KqmfTuy4ze0Fbz+qQVf1wzOjemC/wYOzGnAuTBPc8aCdiAN5b7fvQxinm6DsNsFntJteHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601998; c=relaxed/simple;
	bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2VGLAfpaoBTtwF3RSM7Lor4NbcuzD62sk94dpaP/EOR3BGyu+2icGlRg22QtG6dYem+E1tbn5EJwzCNX7o1MWvBroNRmFGZWnZgTTe7U/VhpTklLSOVD7B4LO+GYqdTyYwOyZ54xzRpB8OkOMuRGDfQsLYzi31vg615ashLpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvKu4SRk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erAlil+C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvKu4SRk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erAlil+C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64Kwn2289495
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=; b=OvKu4SRkORk6Q0zJ
	mVya4uM1OkI1/h1sGUaE2/PUSGetmISR2oWmxo2KrNCrNVgM2/2vU63MqG4iKHK+
	zHnem3O85pk4nKAaUcis6Wz5C0VlC5cRSCEBRoFnz4sMIG7bcgl67JPKA/aoBpnB
	r3yweNlriKlWw+yADmVCxVIor4FeTl7R5ojLPKqa7F4rvE192FufoIs0W0nbUVhT
	IG+TDbshqDYWyAIJYba6W3iOakn2pRdcmpfC45U+Z3uz/LpSTjbrNw0AOowUEkaJ
	iSIxK2iQsgPov34+RlssUkfIA2eq6OqcGd26W/DK5R/ChBBvg5/GcGh627AwS60H
	2ikV/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8k9jqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2da7fa311so45236875ad.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 02:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601996; x=1782206796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=erAlil+CRGh0mDkPYrngS183RHKogX3x/rPWpmXEbQLsp61Hb7+qxAJXEcLHnt8c2D
         iMYCGZvaZ/CCxaCTB8sfwhB/B1Sx5lQXBcalSH4EdycbhAcjBNHD7ipwHyx725twkyLz
         XNg7VCicZcx2bdpExReARTfrF0USfrtEJBBz8SlaG10WBxVhxXMWoC9rXKgtXBf6fv8l
         OERQ06fnXeipcTh1WfIIZ63thFnZlN1ktXnfYjHOa/+E1dQ9wd45BkxtbZXAYKZtW5Sd
         MA+9kmMqhRcTQNW7maZrtxKUD/u8pqf1LCIDmEn4B4ywX6SRMwcz78nZ4tlzTjME7cIG
         KrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601996; x=1782206796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=X9BLkNRKoXhrVvBvQ0KXrw35jg53isR4wbWveXskiqeNNIcutwN+xY45VR9/dYVi96
         I5lt9ywuaQv1+rQGIE3pJLg3/iqewfnjXbKgG1zGCIIXLoKkqKlp8PrwdpyOaPouuV3g
         t/cVXw7+imRvLf6QV9RsnzUs9Z3wxxuyAglTXPnLpMae0EeFHv6Z1KjjiOlQC3bsM+9K
         Gc/PsZhwdp9xUzpEDXDPiR9sHLdndK2f8LONkfnbRAEI6sWHLhBDBhOM94EZqnlmRGt2
         GTUidYMQbT5t4gX24nxktu43DyFbIVaCcjZgLvUQYDtDsXdk+5qNAS/5jhrQdhJqVHAe
         6Y0A==
X-Forwarded-Encrypted: i=1; AFNElJ9GJyLRPmMZUQE/dzsAuFW5/PbZZOhaDqefZdATJDBs7UrovDvV4XLkjCsCzQZIb8V64SOGozJ0nAae@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkamo//UXt6n2Z9uGS1dPh+2L1j9sP2CWCkb7vfl9NOA1/r0o8
	uazX7rCcgqXAIQDjX0tFMMjMryPxyuhCVxNLcor9pZ75tqKusosq2JgliVMf6JN9UkxnsyKI0uv
	l/8cqfEB02YiE/d8bsBUNfhFk9pfYnjaW7Lu1Je/w1IjeTgdnc5nWnLKWuMcigrg1
X-Gm-Gg: Acq92OEcJM/82WDS/GKgLQsCgum0YhC2avpR7h1p9PtA3B2HP1Qj6ZCG5C8WrKanOYw
	ydyjy66BQyUyPohC7txlGl+upPnhPq9cK8g2tEDFtOBxMYfaqPjIW+n0qr91IcQ6BDpv+N2zQQ+
	Oi4BFPtijos27aY05wKrxHQWTe8ICOny9o8xySj1Uh8YbL3JF7/OeeoFh9fJLNnTZYmU9km2NHk
	CwoRRJM1PiZqMh9aTNMgsFXe9CKKz9fXJpkYqUttSJP/cFjHcAdBkyoA1wZQVjeMfzJhfwbaWR6
	WLDWZ3iWeFAqi7t/cj0W5ovP+vMwSRaH3yO4c9tuYoL0u/MCqb1S1tp/FTCg8FsNC+17q+OgVAa
	QiTZAaRfHzha+j1hZETU0zFZdsqPAh36w0ICSCL3OdSidNNwO2A==
X-Received: by 2002:a17:903:4b50:b0:2c6:a3ee:f0b with SMTP id d9443c01a7336-2c6a3ee0fd4mr8610745ad.26.1781601996404;
        Tue, 16 Jun 2026 02:26:36 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2c6:a3ee:f0b with SMTP id d9443c01a7336-2c6a3ee0fd4mr8610375ad.26.1781601995920;
        Tue, 16 Jun 2026 02:26:35 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:35 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:57 +0530
Subject: [PATCH v3 7/8] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup
 parent for now"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-7-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=1077;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
 b=6RxGKFE4QbfqPyXmwyxC/j+cCoRy9Ch6DClcKVz7GbBiAJ5rjKCKgoYeU08rrPn7jK+tpEwpx
 PQ4/ixYQPiEAtJ6BlCzJP3YPWmDtCSak6lv2Wj+5F1A53bFosEpWdw+
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX/xK8Am7HOh8D
 kGwSY1saiPviykZSMBej+4qd7f52OhmW2/Lwski3OInAkxYfWOxwtMZerCvyziwsTKvnh4em8rD
 oyY+C+xi17s7g7D3rpfFbisi4vxudnMEGcdpglUH8cP4/bFVwfFV1hZBMRxF0ciwXo6Q/pHqcZs
 9AMn6D3q1YzsJewGzstBboDgmuZzDkyJFZuuXTYnCLc9w2bCwPcgkyYlr0uJH1WbTYdpbxOYnJQ
 BigdQux56EW291BSYDqGgehRamCq31HdH6FIkgTfxcXIPExuLBXEuMU5+yfhEq/mpqITFEmzIWe
 +K3nWzwUQeqx2XmnRb6UC7j/2kuRx0uXGST+n1n7F2C3Enou8unoJ9jl9R4IkMHwQysi/7Vb+ru
 m3r7ag5NYOiw8vEO0T4T4hOOg+JNc8eTp+BD77LJu1qtsLdOssfRu3XnE/f18iGvKS2JXh5IycS
 tCeYevNM6NHdsceuGOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX3u9dlftypXCD
 VM3JKJMcXUntd/vWzKJ1szpF4AWyIfJDCakGD/CnAIFllxX6vmmIpi9DJNJhqIFpR46JxT7AET+
 OqJ4Jwir3cWaDA6JIIPmng9Ah8w+DL4=
X-Proofpoint-ORIG-GUID: qMzvcMXYnmc8yDwfqVozxViF809A9lhE
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a3116cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TyWXDXqlpdzf1xDbr6AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: qMzvcMXYnmc8yDwfqVozxViF809A9lhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160094

This reverts commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC
wakeup parent for now").

PDC interrupts no more break GPIOs PDC irqchip is updated to work for
pass through or secondary mode. Update nwakeirq_map to reflect the GPIO
to PDC irq map size.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index 8d2b8246170b..e4c0abcd95b9 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1836,9 +1836,7 @@ static const struct msm_pinctrl_soc_data x1e80100_pinctrl = {
 	.ngroups = ARRAY_SIZE(x1e80100_groups),
 	.ngpios = 239,
 	.wakeirq_map = x1e80100_pdc_map,
-	/* TODO: Enabling PDC currently breaks GPIO interrupts */
-	.nwakeirq_map = 0,
-	/* .nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map), */
+	.nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map),
 	.egpio_func = 9,
 };
 

-- 
2.43.0

