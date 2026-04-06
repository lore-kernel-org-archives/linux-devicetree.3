Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC538AC7C
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 16:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493056; cv=none; b=RZMS09BNqCZlUg2AJOqL2jSidVnRtFEKt7+pQMIyGppKXurzvLnIvIgQGqKXwkQHB37fajy/WzB3sqsXAXvzmTKBmf5RqrxoAeRjzM7W5Cav60ol1CjVnqBfDhd8hUb5kWpmgusp8Ai6wIzsv5NQhCBNXWzkcECACK2G+Vch5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493056; c=relaxed/simple;
	bh=YMlNw4W7DOT6i35XXwaAS8oTfUjHUAj2qF7O6Kz4V38=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KRB1h5KRJ6lifv8FSIeB3UJWk8bXQrEbFRl+909OmvCEgmq/U1LeHooVLylxnDioGU8t0MWU/yFJCLFE8ZXNjL5nu+9CtIyKJdIYHXbq595PWq3/gA/mLK/WIh8D/NLA5Pg9YG17by13EEDJCn00VeX9ZuwM7vQZP2pHUa62o7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OI/HvV3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QY0MTlhm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OI/HvV3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QY0MTlhm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636ElWtr1151480
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 16:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V4IA/Fi9z+qYlvcs7UGEzg
	F6SMwi2xeclC9tJCbWSCI=; b=OI/HvV3TsmQhbU8e7rg1iktFoBoAhiLeV5LXLp
	1jyJ3+vBt0kyqyrkqiWUT1ljDvI7XUqBLV7BgHsC0z1F7HyjEYo3t82una2Ex0xG
	jRWutCzvystx6hpXe9NNuwDE6PUx6/khWD/VMG7U5YPoyRxv+DU/q/n/TOdwxfOU
	5gqmhyB/11yDc8gPPJwlCg8UwuOyPJWBMPK09+D5xSwkWq2MBq89jBdNLwglSoQu
	o8b31bRW2TidwxHhrQ3n5GxLa9MdeQ0csMbesIfdLZddzBaFuvWqqTzDFOA81x6u
	ju8CKTh0jWR/7JnpC0rHFEsRRUoeAyxvcPB4sPPF8QQSjpkA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcewerbcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 16:30:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2454fc131so73767985ad.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 09:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775493053; x=1776097853; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V4IA/Fi9z+qYlvcs7UGEzgF6SMwi2xeclC9tJCbWSCI=;
        b=QY0MTlhmmfp2/HYRy5mKc79YLaj7hnifvbvw2RHfpiW9bMLrLJ2lP7cZXCllb5TIt+
         BkN5E1Hl1L/3pFpd0UoR2VEGf19Dg58+zHj2kx+yf+FN8VZTU/cheOPnJin9VG8RGUDP
         WwFUTEMU30O1MMX7u+TdgiIsy40Ov0lOqiLRIrL2YZCJxH2CQpbFp0O7Z/h6x+e5vBj9
         0evqCmEiHQKwF1KUB5jdIWyvnwun1pYYRjuaIL8oFAWttQjsSbXmBxwh46jSs9AcxDBk
         ZpG508tzvoIpf7EkQ2TffxpTbKzGaT6pH83ms2GEvrPaBHIqbKxymRRjEIAX6RxBdT/k
         wLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775493053; x=1776097853;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4IA/Fi9z+qYlvcs7UGEzgF6SMwi2xeclC9tJCbWSCI=;
        b=qrsnKi+Y2c1e+IAWkUqEokG8YcwIr8QC+OKf7P2++yKwMVwMqPIGGCFEJAvzFAI2xz
         94fsqDsC2pQppbnLUN6z3zbuJMB+ET7aeLSZKskhyIaes/2Z8o02X++i5gPZ5i5pjoul
         C9KHy44MeVolYpWuCv3N64pCNg65Xcw3eOaEJG7C5ork3eLRkn7T6YWEnncCW6NYpXrF
         2koarnIMdw2XSiXbBzdoOsvyYyJrHgsMhFhIKOKJXNVblzEmpNhDJHx1XXSZYxvoVkRv
         pO+3D7l2eAhblKC1w7DulxcMrFeuGS12iJh5KXEDiuvLHlUIfydnIV9iZbF+6OMCnL3e
         dzPw==
X-Forwarded-Encrypted: i=1; AJvYcCU62ADfaDHYVDipmDbZfWRV8I0uRa6WnVWn9yKHf2p4HJ06qvwBfYLmFIf60gE3/0pajgNYPpZnhE28@vger.kernel.org
X-Gm-Message-State: AOJu0YwlMLZxmxOLLAyxNK6EFIC0XCVw+GNAYLtk8wHCDs9Aw2gM/BEO
	wZ5OtbJQU+E0vjZCkIJJdDzdyhyeG9xexlz7dad/XF4sw5+R5jtTWJWI8st19zDfhZJdaMaMPnS
	HxggzmIQgYI99wchmP4RVK9IgsupEr3lLcbVLsQikSzG0T6J7o76Y3f2/Y+e5m07b
X-Gm-Gg: AeBDietJRZz++1gChOxix2xpC+3qo7ChOuZzoKKS+rkR6lo1lYgA3O3f8XAd5qyQOTx
	Mr86RW7mjacp3HayWIbnI4XDRAlXrvJH5+De+6qXIDnBe1IRaEDejoyjoUtlun0OVyZq2Be5gP7
	rZ0HnKYFKBD3IPboNl5EcbkbeHkmHQILTk02kB8FtTvmgReX1RlNRvm/1uRe1NnoDSTfBvJ4hMf
	VgSrTc6A56S0zp54GUc6lhLch9Nvohz/LNSVMw2uu/DoQX4+NCZO4uHVBzIu45C/vDFvbcoxiAh
	c43A4FvmdbD/058WPagE9aCfVioDLTabKGRms9vg5xdfG4IJNAMLgXaXOTJevQwSfsg9KoZYA7X
	xzcDfvDqECjZeUXVxC8zCGSeRjCXTLnp3ECNDxGjLciw6wYXHraBtLx0=
X-Received: by 2002:a17:903:acc:b0:2b2:5042:dd22 with SMTP id d9443c01a7336-2b281935ddamr143279455ad.34.1775493053372;
        Mon, 06 Apr 2026 09:30:53 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2b2:5042:dd22 with SMTP id d9443c01a7336-2b281935ddamr143279025ad.34.1775493052824;
        Mon, 06 Apr 2026 09:30:52 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cdc61sm145144455ad.80.2026.04.06.09.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:30:52 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable iface clock for kodiak and monaco ice sdhc
Date: Mon, 06 Apr 2026 22:00:35 +0530
Message-Id: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvf02kC/22OQW7DIBBFr2Kx7lhgbDfOqveoIoSHoSWJIQbsR
 Ipy9+K6y25G+qN5/82TJYqOEjtWTxZpdckFX4J4qxh+a/9F4EzJrOFNz1veg0NSNE2o8BrworQ
 xLhcGSAxW9igs6o4V+hbJusdv8+dpz2kZz4R5q/u7iDQvRZn3s10iGwkzhkltplu4U1Tam6K7q
 DVkgrUFDiTLN+04GkvDR0ipnhd9LdBUl7GV71WCCyG77r2W7aHjDQjwRFGf6xS8+5cbdSLYFi4
 fq4PorRikMdwM7PR6/QANNp2/LgEAAA==
X-Change-ID: 20260406-ice_emmc_clock_addition-e19f36c1fca5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: Q9Ug1biQCErUu_QCWydbZDbEVDx68OcD
X-Authority-Analysis: v=2.4 cv=E4nAZKdl c=1 sm=1 tr=0 ts=69d3dfbe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N2sBZ17_MvgTsLg7TvYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE2MiBTYWx0ZWRfX3Qc2l7vG80jL
 e1rex21y4zJnHRenRh1oj/IP2eBzQxZm6w8EGNY20FNFS4sBE3S6iGwz7PHyRBRC0WctRxpMPoL
 RQgrTN/m1R/+o8eGKMax9+S3cLEdA2cdC2JJnG9sV8J9Jg2ynj+YOAs272cqjgXm+IHlBCQjv7o
 hzDjUo7i6PFSoBru3nZIbQHf5peHYRHkhux25vZBzWt6As4J/VEmLpYbSw9rq/08/7FAwBsghn1
 b0/XpHGKi9F7WQ4XXg5Fjk53HID/3FUPICKTN2Jj+a3rXK2XanFdUazpX7fZOLEkYjeK3/ww+fg
 Y3OKP18aLTgdzQg7D3foQr8/87yoBJMgBxo1tTJB8CkVoYhNI7z9ZhCYvXkYKg1boBUJc938k6r
 3Fn9WBc3WoQM/0ws64siPiK9O3TrR784sI2Pa/hUMQx5GS9l8et0OwiwjPZBk9JfkJRLB7vTEH+
 NvII+IeG3bFNDtoWROw==
X-Proofpoint-GUID: Q9Ug1biQCErUu_QCWydbZDbEVDx68OcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060162

As ice is now standalone driver decoupled from ufs driver.
MMC ice controller should also now specify iface clock alongwith core
clock.

The patchset is motivation to fix ice mmc where ice ufs is fixed with
below series.
https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com/T/#m5da5dd7a18318583b23ffeb42fa07ef1438042d5

Testing:
* dtbs check
* Custom monaco/kodiak device with emmc storage.

This series depends on the following prerequisite patchsets:

[1] Add explicit clock vote and enable power-domain for QCOM-ICE
    https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com

[2] Enable Inline crypto engine for kodiak and monaco
    https://lore.kernel.org/lkml/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      arm64: dts: qcom: kodiak: Add iface clock for ice sdhc
      arm64: dts: qcom: monaco: Add iface clock for ice sdhc

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 3 ++-
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20260406-ice_emmc_clock_addition-e19f36c1fca5

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

