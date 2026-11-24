Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550533;
	b=w9JM5ZldNFNT0Bwp2SIhDfy7iEohPjv0tmHruFPY6LKe7i7xTaAivEqWz0AoAJRkl4xL
	 xSvn6UByd+Q9RomHxSCLO7nERwyvmRLECXh6ac8YcEF+ku4nnEpFF/mbM0GGPFmoqMYtG
	 PZfbl0a6wTdb2KdsA+mAn8Bh7gfjYoo0dvFziohzF2nFDFZ5C6S0S0ay68BQWPpHY6f1o
	 A3p0eEF8I/IptydrWLm6EAK5vMT8c1tC7Wap6J3VbK4ou/x3lTiaodADuv0mvBPZiCMcH
	 tDx7A6TFrn3XK3urEv7k9dN7OZK886r2oDN3abVZRpsg9Vk3dufc3WUpuZ8WcNmzO7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=;
	b=m21NO5Up8HZWrSWJZPOuQXgp5cPYR9pMtqfcMv7gQDGPA9+7xymbKuf7OFSqLCdvloZk
	 cj7fEqyL6umcFqb0DAeEAHmsyZiO0xERVeq0sIrH5B36xxXMVc1uu+UNCIWU3nx0xv8XQ
	 dm+2F7/FwTxBCvyX0kV0UHiDB7MQyZKh9Qm2+T46cYOV5w4OiLqHOS3+Vvo6kAU9eZ4q8
	 +dbqaLxcWUFWBOxdg4IuG79sKUlF4GR2DrqtxYPED/YfIVHh002MrBttEoDhzmZPgFFfy
	 qWL6vFB5sFrDzZXxl1gAvVIwkDvUX+LxyN3/cwouwTCXyVgmU7Gq2GTLZouujfO4YHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TGvf9KwK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLVdftPQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2D9606A6B1
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB2D9606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TGvf9KwK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLVdftPQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJOcwJ1758326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=; b=TGvf9KwKvWtorsv7
	IlkKQHvhJ98YDIcRXg+OLTdiq0/gIozGKCv3qjHuNnCfF1KQPdQI0p4WDdDCbuTo
	EEBiY1xW99qNtNT3aRywF+X8/RB+pZacJPSK2khsA/BX6GY5wNZ+yV3tbQ9huJaO
	MuPwJCublkI/HInKTMAxX+y0oHfR9egSgOKWafrjzOVisMzqAf+Wsi+ZwCRiRWCX
	oH01GTUTd6AmgLaPJJT1IWb+EzG/SXZAmY1PGhjuLi5A8zIFX9/RdYyLg8rai3As
	zrl70kWcugI+5WDWyDTahbZIcpASndWkVhN1lYJ9Pf+cB693g4hq1fLPOcaskxVa
	OdRjzg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpks6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9212747f4a4so4809036d6.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550531; x=1796155331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=;
        b=KLVdftPQp7M44I+EmAHNWMfsiHduu3P8YvJCAjvRfdOuuQNujTPihV3paMim1a/PKW
         A2wsqWS/uRIMRrVIh2g43Rrt944/yAlUc9ZPodj9/n+IduljF8voQQlByTj1/hsp00TX
         DsC7xbeKbJiiPoZ/W4gi/6D3R9paJ8djD7fynAC5zurBKwcAtmwg8QdI9VehNlix0lZ3
         X9n04HUoyQTjhYsrvHtLQdsinHVqCrH8kASnIxAEu3ZO5QJo6EzQyk8cH3pP4eAOE9kY
         EUH5SUHoQ2PogKeACo3j5eBcsEuBm7n3OlqD8vW2aFgTAyEzAEFV7se1/sQb6Zy0Vdqp
         VEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550531; x=1796155331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDFGofZS9wIbG6zZ/KoqobVo6RlFteO9ubwUWazjPnM=;
        b=M2b1lEoS2PfIxLDOT3pMERuvhr0RWMq3IqHlizr4F6cLHamdbVcl6MhyC1i4PjvH90
         0w62KFryvGVUDODvLKvstVByZPy8c1MqGO9k7WTUpjoJgIrrlWUqhT4JJm8rZtDbxjiF
         D8DYChnzrCQBq3vVyuJIHC+Z42/c5FXMKET/AzZ8CNQNDGHOGXuE78SKD19Lhi/RTJXe
         eUXn9a/EmfelMMORJzQbaey4pIB8ZPGT34OMDiz4fjdf7bbEbQJypH2W3Tf6q1K1QuYy
         HwRzSfLQR0XCw33SVwqmvgxG+RlZqXueGdfDIA2xlJZ8B4t0mzR9uLQVPc+80YpU/U5l
         ENvw==
X-Forwarded-Encrypted: i=1; AL+hErGg4x1fVp0Z4E2SSnOtxKCA5AmilbBKlXiqQHq8qfDJYgCqDNPjjB29HDI1b7niSYpcwS5B7fnE1uLs@vger.kernel.org
X-Gm-Message-State: APuU4Z+jq2VgyRPu7sHRPzgYv0CIpSk/3yMRySpMGkwWGjFR8ZqSzGqb
	jZ3j0+bh8BqDJlp8nm+YCSXme4P4mEtepRAe2z6Re9UaLq+KdqR9pWOBipoQ3jlsOOEcvUowUEY
	ny5PMu6pzCUsC1f4vudNtdpKsKc02Dugj3YAVIgZoxsVQxYwBDjZuZrgJeCeijqNC
X-Gm-Gg: AZFdTZcF7A68UQfzF/rrH0znmxIUQ7QNYKi45yrA+ops8oHANRYT5mvZMRxZYArjMPA
	lM8DT7uypwvP1ceGh8c8g/8fmKZx9b5eHdRL9dsZGwhNDsMUqouJ3HFef83xEH//pBlCSjdTGlS
	94HIQJuampmA2X2dPhYkeSNdha0TiRplneiw6eymFt433C/11eksx1FOG1IRJlQEjIENOhOL5dK
	Mze9ZqxZVZoOowBzslLDKP/qULLYm67eXF9gKO5lXIsh/SbVJj73MqTK9TOC3qvY2f0OIPqkoF5
	uD/V2z/pwQFO/0gFhxe9khW0TLqjGDRBCdDUHFFsqCf6OgKRzBa54cFuE/QUS94LKIPE4zd2wQn
	O4CLyNlezkzCTc/Od4hKS1R7KzbvAl68g9XvShbow0/tUpzChTO1FDRVIVY/NTCPk3+BAxsx7RT
	qV/evTPmI=
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr2807628385a.3.1795550531096;
        Tue, 24 Nov 2026 12:02:11 -0800 (PST)
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr2807622685a.3.1795550530332;
        Tue, 24 Nov 2026 12:02:10 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:39 +0100
Subject: [PATCH RFC DNM 10/15] thunderbolt: nhi: Resume a runtime suspended
 NHI for system suspend
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-10-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1364;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=VT0A3Ff5mjwo5JFp7mj0fXPs8lsBYJ24xhfJ+8TyvbE=;
 b=BI/O1PsXCKL75DybTynegzhap9M3cUZ42FTlJ5Ou9qvJpR0kF5q8oxlq+CxsGnKfDU1bNa0J+
 DWYwwr0nFv9D9l+3YxFMBX2j0dcjtFaVMoXllO2R+3oUn4HJ+WZFIi4
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX3mZrlSFfTJiY
 K1VRlL9+OQQg8Yogf34Kx+GViL8NcydISDBU9wF44iRXa4yBe/dbuGW1WByQaerdOuje4apQh37
 1+g6yMpg8BGsA1gOeQ7qmE5kGFSAEb8pVPJX6+4akF+e+fZjyQnPSNYEpXEMvdz4YFoPxcVHH7O
 0tlMVv+HotKeoqRZDDtbYl9IVDX6HmBBg8nGPuBKAzAaKRA3g+sAOOJ+cn8BXsGtPEOIPGnyqAw
 wF+8mFQjjZbd5Elmxi9UOG2qx+IKGxjzySp32VW4guUihMW/fjnu4T+qB0PVKH9KN2Wc9xRDTy4
 Y93AvLdlUKxpzBT6x+/fc6XwW1FekUmyKnd8iE/p/NlrD7caO6D4007gDOHC5+UAKD+CeUytz3s
 uSHqWejnpk1JrMvMr1DPMfORHjXDmZjtysGbDR8DJuVcNr5aQraGnuRGKVNT9YL/0pjsUCbU5LK
 jU6ur//5Oc0J5202WxQ==
X-Proofpoint-GUID: MBwioRdx3PsHALEE9wj38mD4k7RuzTfm
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05ed43 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KHM4NlRHU2ppStx7mUgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXz8Og+7fmh5sV
 7oR6DbDs0M+e3m+9uoSmv5kOiQ/YBZiaJYZR4cyrZxVU6OsL6iynnaNCT+Y6pHs0jkzAyE80Urh
 4N6LWif6IPw8zoH1jj9ggCtsqDmqMAs=
X-Proofpoint-ORIG-GUID: MBwioRdx3PsHALEE9wj38mD4k7RuzTfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

The PCI core resumes a runtime suspended device in pci_pm_suspend()
before calling the driver's suspend callback, so nhi_suspend_noirq()
always finds the NHI active. Platform devices get no such treatment, so
these runtime suspended NHIs gets suspended a second time in the
noirq phase and resumed in nhi_resume_noirq(). nhi_complete() then still
sees it as runtime suspended and resumes it once more, which corrupts
the control channel (RX checksum mismatches, config space timeouts).

Resume the NHI at the beginning of nhi_suspend(), like the PCI core
does as a workaround.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index e2578740d569a7ee1d5ab22e8effc153cb7d4632..56bc5748b6515b9d4799aa87ce0f72e1d673d634 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1258,6 +1258,13 @@ static int nhi_suspend(struct device *dev)
 {
 	struct tb *tb = dev_get_drvdata(dev);
 
+	/*
+	 * The noirq callbacks expect the NHI to be active. The PCI core
+	 * resumes a runtime suspended device before calling this, do the
+	 * same for the NHIs that are not PCI devices.
+	 */
+	pm_runtime_resume(dev);
+
 	return tb_domain_suspend(tb);
 }
 

-- 
2.55.0

