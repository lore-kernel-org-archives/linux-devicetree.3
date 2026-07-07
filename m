Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB2A3ABD90
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416151; cv=none; b=sUAft6SgJCTbOzhXhzoQb0IM3+C4ho6tLz+w3tSQWav1641IgcYL26xzMgrZSfFvyuI0Ui1CKzJVQvHeQL7oi5ViNnZ3Q1NQxEAhqq4uDhnPGIVsxTkzqq1BPMJ+Gjzk6jDrP1hdCpnKnIOMp2o87ufIic6F6bm/vF63P6A8iLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416151; c=relaxed/simple;
	bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXpaDLV6tScAieTg8tc1Eh+KekTl3F2w3FDEgU4PiHU2xV34UocuoHu3bUx261MRmD9Zm6urvr9r73eycXoy1cyyFnVec4XhxI9ReSVdkjDAgbXYQzBjexzKwL6avOee8RLNTHmmpiTRNPQXTUu8ERxh8EQpoDoCfKa0S/OmUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixyW/EiS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANORwev+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixyW/EiS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANORwev+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EBZ73139784
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=; b=ixyW/EiSRuMCSA6q
	+cn67X0vU3wGCVUGjYpZYAIFuIvxDoVEuCM1qW8118j6h5eUQapVTCxRRP2wAzHO
	94mwq4FjHQYNwWRe6zjEGjw9pnKCeHZ5ZgMPp01n99UYoQLG6TFrvCLGmbjsSWuK
	A/gJP8ay8Jk/q2t8orxlfj5Q8wACcMRwLK1K9Y4Mvv4JMAUNTCA/b+KbfF93qaZp
	2p6ICnP7cr6CLYBMtMiG7BWO8L/cxtrYSPZd/8xIqgn8YI5wjj0EIKE8iXTVVxen
	/asc5GRrkYtP3aqlsOwas/KznugeR4jYH+lq66IGNo58+bFOqGqnrWgwS0PPiuRo
	vDFfzw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t1597nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:22:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6bbd0afffso83347465ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416148; x=1784020948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=ANORwev+sxuviHg66vSl24Oq33xtR+QUIO2KXPmN+Fx6kEHmDxQOuArpiYd895b1rI
         mcPXtk2yhuDtzdEVLZrsN8dBXlEzP7is/SxQY5+PN2HPbcTtdpPCGSGqGaTuij5dmIrx
         MAUwqKPr6QDlQidDe1w3A/TlF/r8mBVa/+WjDlH/HyV9fC45nDJdFVFjdCa9T2nTT6ux
         jEJOdUsHZX/kE1ieLIqfI51o5Zlsopbfu6HRcldtnomQo+tzIr8tOQ9D3lZGwZBtHq1h
         slHR1B/w50RJbtSDoqrBKN+aipeqRgiPNheyqkCTuyfm8FCoGg64VrgcCVoWz1tccXRA
         zV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416148; x=1784020948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=CbnyXo7gS0yGgsesV3l5o6Cq12Eq57iVnY1p1qKRy3QsbXbQOzkRrSf8Dcg2nT2Usj
         wXAMxRLfkIQocgUU3nx1XrHp0gtW2BqhBJTnKjMJrQmK3nLLFuzBa9eaYB76OZjcqSML
         ui12xgJd+qGWbqQNBBHhyOb3JYslwTojEgGTjMszX3yA8UfcbINCM0NgTcr+mAvh7YVk
         7dMpJ4L9OUj4uyK9XlAaw+wweBxC10gdwwY1YdMXjDTXb8QFqnw3Pc5GuUxWBNy4YWgw
         +/7P+NFrnax22jdf9F99zivGtzWdaHR34YGIFkEFSBPn/L3C/cYTYdPKaR8ll0PRk4DE
         FXDg==
X-Forwarded-Encrypted: i=1; AHgh+Rpu23B+/zaI2IiQ13T4swzwMhMkwAghdLrKvoMOnZSqLA0ZnY0wqmf88T8LYLwrZc43rLiL6YknMNfG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ZwobUuWeQRmqTukMPZvQzcviRRQyCbld/DT4HF4zt/zUrHK9
	Qnw/jxN5Q001DidlbOWzUWvg4F7EUAUXwuKhmpuueM45Fm+M6ZRG2ay/1ET3bmudW9xJDHtexPv
	mbtzhCGFNGqCjifUeeHqDhqO7AawdwnNcAV0lrAdmqO6jvm4RKl/oQ2LYl1Z1LMjM
X-Gm-Gg: AfdE7cnxpc94GdTCqALd4R7bgdBidCSov48mxd+0APzqhIXXNq8074FndhiJqcoaskK
	2v83NePi1uSDBVxW0yz1ccAd/MbdYItbI9BQX7+82MUpi+iN1mP21EcDbvrps8naAuw6ctX0Qla
	WReN9bYqDKjgVTmsbHqOFWn+XxF66MjHUMgwq4FgCidzuKpWtqyfu6TonK5GZzuJ3ebQreQG52+
	vAcsv2pjpvbdqCt8CvK2XdD7OpUiAXJCNJEfmVr9gzuy4YSDXdrNYWxAHG6qzoEWOAdf8ltCBK3
	XIw2yK8j6TbuLHXj9nfnFwdG5q/iq3cEZoyt6iPlsCVX3RvfdEVyA3g3fd3SXHyVURLyYkRHDUj
	TR8KnvVMOUSz+E5NVHt78x7OgVYEqwoXLqJFn6Mk=
X-Received: by 2002:a05:6a21:9d4c:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3c08edc8ef0mr5833464637.15.1783416147804;
        Tue, 07 Jul 2026 02:22:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d4c:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3c08edc8ef0mr5833401637.15.1783416147345;
        Tue, 07 Jul 2026 02:22:27 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:27 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:38 +0530
Subject: [PATCH v4 6/7] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup
 parent for now"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-6-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=1077;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
 b=racUsM0LIceTFRNEm1u4GJmzYjWAZ2Sm9iJh/DltpBAnUwEWTWgPpq+geLk3bwaFxiPvT3FJl
 UTpnTfsXW1bD/bgSG2pw8vi08cP/G+f3Yl9e+LwcG+BBnTUnszr/b1P
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 85amBUyTxJInc6-LmsVfSsY6oreEMk1i
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cc554 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TyWXDXqlpdzf1xDbr6AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 85amBUyTxJInc6-LmsVfSsY6oreEMk1i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX/f0oRDOWVlFx
 LG39WFWuzUZr10SbLF9bT54DTSc1BTYGiJk0Z8pEHYISoEGAyskLBwgWv8iw31IMfqJWxk7De3t
 k+BEgZZ1db7ScfkkZZ0q1/yTIN658MI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX3LsKIk23dyIj
 Yz/wtUKqb4oVzv5etfHfRendvG2NrOgg9DMZ7tmQGOdmRhgxE2qYo+NzFpJUw7vdBsz3sWAmJ1K
 AF80jDW5z7JRrpEDkUaG+vZjq63e2BQpv7HFwoGA9ZlVeR0FQcandlSOxVVk87a/Z4NfztjHyRa
 +emxphvGGu1wCBWpj4oZofeZ7ra6O2GzG/fnNaNZSMkpu8n4H5H4wGuHczK/CclGCzIz/OYyqpi
 tUp5rxSFDDdL8U80ti6xB42yVJs+rBo7+TSz/q551vej+bWJYj3egUtONfapkGz5U/Ih4BY9yW6
 hHLU0YCmO71NmjDRMyAnjwZN7KIZeVjHaBYDNF+3XxC+g2B2JgewT92AKXy3PsRki5t+uQvfSh4
 6sZX9ZFRmkmDvmLH3I/mP5h+vBhDlHU0c8A/XL227mtyYbb0xqBLr/tMWTF3ch2CSOm4ajUG7Mc
 sP7lHy/yceIcDH9WHWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090

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

