Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D83CB2D2
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080878; cv=none; b=lfp5AKjQj5UYHZ9QhYFgUt9y0eiJvEpPBktceKQrzGZb6vapMbPRMcZI0wbgaCWTKbX71DZMlwmU9x4YJIRg+bI17isx/lWpadtBzC3FYJIlvYt71PH96Nu9Z4KoREs+DIDIEtwhfqjV1sNiPqfmJLZZi6BJouJga/pW9gkQpk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080878; c=relaxed/simple;
	bh=FhtUlwjr7tw9++wf6dDd1Nybl65mtYwol8Y6LJwRbCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbivLRo/1+uPUJhcpV0eoNbwLsqJGCLyPTlPvPBwOSCJ9NduPGpOv2VrqzWkfJ5zlJjqKh8dFjesfgM94G1AUO9plaHOeZQBIj7BU6zZxG5fLcBibsn9zXIkU/XG/jcykhUlRVELjQMPpKGL9DWlPmkAomUZdF7ARn+tFIXKEFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFkcZtel; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZkWhie6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFkcZtel";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZkWhie6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE3EDx1975500
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GyFGOvWEzqIpFkIBZwXQUYgf2SG4Bx32yZ+Qv51BiXU=; b=BFkcZtelWsCKz8+7
	qTl20N+rAILv0/Mca81O7e2om51wODlwSIA5KyNwdKTdTuq8HOcvvKhSiQkCxqKy
	oQpuFyV3UmlaW3p5e9GdKTTfoPrUda8/uLkhRoMQu2yju8Z4Xvu6ikbv8tfvN413
	ECsnDcInXBEtTKnbgeBL1Pwi0WUIN4xgTzhTSZ86R36W4zrDYYS3gfBWvDr0kJCZ
	wrrWu/NYUWRZnK4SELS0vg2PSgZTJsOYb8gXNAiOdORQVxKPH6rVP2Vl7zOSqllE
	qsr4qkPc0k0hJplMk7lGLzkwybGbpFq/fxnqfV9Wl3NKpEx35FzIvUor0zm+QFI1
	3RPCDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufuf8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07f25de2so18014551cf.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080874; x=1785685674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyFGOvWEzqIpFkIBZwXQUYgf2SG4Bx32yZ+Qv51BiXU=;
        b=bZkWhie6OA/t1ypdWGf2mh+O2PQx0ywBkkQQb+AXY3ZPn6u05qu34+gwWLLk5MiJeZ
         FP6wNISuyrycz1CAkFiZOTTOYXG+562jL/5MDjOH0DfzHu39SYAa6f15XEl0romyDcnK
         2ENasD7RAKTGzt3WQ1DTuyY2IXG34E1A6415gTBU9GUov21NcTJf3Sgu5gHSYl+7c73z
         j0GMaEx5LVzxtgEpeMxSzNFz1EfsN/s3dwJJyS+j9URvR/3V17kNZ6GuQSflf0uLs/Ym
         llviXcq1Nyhk06grXJ+zmOK0uFEhM/nrweQQSSq9N2J+oU1N4jUlAfZAyMB33fov6E+j
         vY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080874; x=1785685674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyFGOvWEzqIpFkIBZwXQUYgf2SG4Bx32yZ+Qv51BiXU=;
        b=LxmdCb0RQjE+6927JK8OFl2XT3p4jugEEyU9ZTb1IyDlISaTqLWF5q4miCpqq/0Uqd
         YwJ18UdXxixL1kkslmOQn+En+xm9D0SiR0nje8+tn4HmGH0KYhQi63Dh4cI/vd8SeSNy
         KOZvw2dRX/laUYeEJBnzCBWkU//GUGHZPpSZ79SwlSJIcgHyUDHJwgEIJy4eDcCMxk4v
         yParl3uhGGmeK/jtqOQAYTdwKi0BW0w7uCIlmjsfX3QK8dngk03aLC/gzK4/alz5THP8
         V/ZRsFrgYCsGpnkspbdqz1wJXmJcGLjLn156X8YBfLSxj1gON1JbSg2WF5uJ9F8j2z04
         OR4w==
X-Gm-Message-State: AOJu0YxhOoyRFSZLwsOkdrzDTagkLuAH168n/k1Fa6Pes/7BJK8ZjiBo
	MMWeEU+pPeIyg3U8FfqzfrVDTQ6Ey1ib+k4MJxE1tvTXNbb6CQ5ORzc1oWh7ErpLAOXYGSazmHv
	LtmkMex7w8fPU1Y/wg2VyOnbo6O5PXO0vMj2d1uGUJnbLABr+iWyiEQBNx9D9HhOY
X-Gm-Gg: AR+sD139Xe9KPslJQ2WqDvrT4wkIrvQx6CyZDNh01NLtbs+AzP/Tx1pSWtfLW8tzIUy
	Du9u1kHJeu5ri/GYgkZdffE2nnhIp5ydzFlObCfTPT4OxXhapyuPbBwMmA5aSTikb3lRyQZCHJe
	dvo5EMPklU5Qqf8HfB4nIJAg6/ELz0P2zDN6rvBd0SkHx9oC3T9iZeb6ACZ5+YOFiEQBuFc885T
	bjYG+1Ziaoq38ckqMW1AfTYIrrl0RIEg7duykkX0kkRWBEocZwlgXUBO6npOWGanWNReGOV+V05
	9vjQdtGsyDTyq/yoO6eVMydpiAj93vdRtDpLf58H089bGPNBfCp6j1WXhWzVyKi0OKslyMBGirk
	4M7ojKRpWYb113v2ZmIq4HyHB
X-Received: by 2002:ac8:5855:0:b0:528:143a:1d5c with SMTP id d75a77b69052e-529a86c101amr61478041cf.73.1785080874544;
        Sun, 26 Jul 2026 08:47:54 -0700 (PDT)
X-Received: by 2002:ac8:5855:0:b0:528:143a:1d5c with SMTP id d75a77b69052e-529a86c101amr61477781cf.73.1785080874071;
        Sun, 26 Jul 2026 08:47:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm236848035e9.3.2026.07.26.08.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 08:47:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 17:47:28 +0200
Subject: [PATCH 9/9] MAINTAINERS: dt-bindings: Include dt-check-style in DT
 binding entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-n-dts-style-checker-continued-v1-9-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=841;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FhtUlwjr7tw9++wf6dDd1Nybl65mtYwol8Y6LJwRbCg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZiwWnE0WZPq0EgYvO47SlCX8RRkpoeGEyqn57
 HEIY6oi0XuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamYsFgAKCRDBN2bmhouD
 1xewD/9F3Q4Gwh62wMQTQyQUIlXdxoEi8+9rlH6942Ln9E75IEH/BYVoxudj6FDGINBmt67u7a4
 xHrHhrwfk2FqWfrgcdpQfzl4P1MVkvKdBQVpxQaPmLwodILrbmBf6Gk5sPuOBZ8XTuC501qLv44
 0+CiQRdqz195s9vgKa69oEokvctMpMNa6wCAZi3AVeTNk8LPFrqrHPRITb+9d0L6APObW7cQM6f
 QhQOsWdsOGHHWC9JqST4tDL8TqiHdIH5+EYNNpK1FFNQGT6L7hwd6nLWW0RSS43+2Vce9PzO7uW
 g/KmxIKeDNFmhbpY6yuJimeMhDU84/zEI9j+NtvRX0J+Ap1swoPH6DYgfp/g0yR9avWQsF/TOb9
 1ltQqrIyjTVOJqS+586X9BfZHqWQyxd7qJ+vNMC77oUYThV69uhyc7prNchGAG66BCG24tGtQVZ
 soknZSl0TxGcd9786q36RIdJUyObBoViypZeggLFH/zHshNd+CqGbQV3lpf63uJoaP+y26ID49/
 pLSiGxWMtBLNTcUIgd8Y9VtWeaEsK8Al38fyUFzrzDYOfFuJ07m20UUGjNxuL+Eq5XOCA5Ec/ls
 v3P1hQtiam72EdjDaP+ZzYiAfLjiAbRAydTtqgdY58vAD03QB121foO4z4/YNqs1GkYz4pv4dyx
 LHiAdBUR1ndbsIw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: JaXfiMH4mEg8ZN5LrjVzHLtn5-WZXMk6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX2XYbmh8SKwBC
 Zd+NCZcDEmm9PRyVa2ugf0kyasNFXHyW44fKArEbP9LGNKzoT7/45tV61iUGCREMyX1uAoG5e27
 M5J3sr1fGSgh+xFi1LoQFETHRP4Sz7Q=
X-Proofpoint-GUID: JaXfiMH4mEg8ZN5LrjVzHLtn5-WZXMk6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX2CFFGIM0KR+L
 UGCwIhqO5tIZKA6N9Ts8o4JdaeUBitj7sq+plgQeJjsaLry62GY2lCtRbVkk5e0Wat9ORyAxbwN
 p7uWAmsQf3oHv8Jo3MKgMDy+++FU7y5qfsWGBNT2zgvXAw5g1NeZTcoFAkEWWJgNKmdgMjKgpuO
 3uLRmCKdDvKB54+RXlJDFQT5t/IsmpdKS/eAlOqcIB3LevxMWwzPnYugdH+iGIf+svGKhTf2n7i
 wEKKEH94Yeqm8abV//ycR0v7LrRc1NZgwL8TRgl5E6jbG/MgKUS/cZD3TPZ3H8d5mpw0gh5zn7L
 8j8B/JE7xjOGzv0xf4HX4TTnDdQL2eHaJ7JBB8ZJi12eZbqInqzN9gERg8tVycyRMBjb0HDlel2
 C4ZpH9IQIgwYmSOX3A1wBk4iskkX9NJEqNH84tu+vrQa1SyWwPiobNgqzkzHiFehhvFe5mpCdaq
 OpR515ZXaGbBg4Qdo7g==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a662c2b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hdCJvu6vi-O6ykQZt0QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260160

The dt-check-style tool is in interest of Devicetree bindings
maintainers, not only the driver OF-core (where it is covered through
"F: scripts/dtc/"), because it covers the DTS and the bindings.  Add it
to the DT bindings maintainers entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3c01eecfa2..2c8aadac544d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20374,6 +20374,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
+F:	scripts/dtc/dt-check-style
+F:	scripts/dtc/dt-style-selftest
 
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>

-- 
2.53.0

