Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522580;
	b=L3U9VlNNGcfO549ig/Df/dBiW/47NzlDWjK2jolyY5kmzUdEdCV5m9YvGoGYAgVKkKzB
	 cDIfrHA+pN1tthvV1tDRJ2+wcdc4yFLe0LRffRAVcfSuE+sOOQWAJaMS7nOxZhvp36L2m
	 pTlybhXDHxg/a47cA2Tg9LOaxhHdHjw71hM6e7ChcymdwtkHNESu7icRylDYWyBIae2rP
	 /H1jZdiWiL+RobvWzmD+uTdIlzNHCUGlHrmJoyNWqAeiF39iHc7q/ygAmQC4MqEDtQC7l
	 OmjM191A74WMfSqUy77sCywrd3kpY6Oy/s44MtHY7KbWg+LVgWrcApEgwXTA1dBV5og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=;
	b=Xs2eKllXVdiy2Ri41duzVserM5EttouC7iVVZ0hKZ4rQMOLhm9Zyxc89W0j9zoaCX2EI
	 t/e6Zh2wf0NLu1PN5XmCKH2pjDSE7WJQMYVJH3bY1Sv7PGoPUKfLq3ZCtHjG9W/aSa0Mb
	 VSdajna4Z18VXEa1l1zUk1SEzlhvVs4qdsFSu5PJoPLr8e5+S+1ocbCgprMu7kbjii/6D
	 qYZ/CqdPHUDXgWNBTaEsbhCjixgwwo5Fo6/liK2SIUZSTvznstCGlm1A590krGNcPnriz
	 WJ9/6r5K6nr/ugxVpjwVTsuzuRs4+wc3a361SmklQVcWEPAPocYmHvnWr/pea0Vw9AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLywCx7V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HTo/7HJA";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54530606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54530606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLywCx7V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HTo/7HJA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuVOR1736775
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=; b=DLywCx7VIF2etErr
	6/pg/2IJDYM2z4mJ0hQ4hcgCsPlCa3TtUijIegMrSptOT4gF1l0Yg+lTcfJ+DuXg
	uQuADbfcHe3sbS6B32qwvvNNOpe1IuXxrYe796vilRKuGD1MAAZ8TDr3gP/grFIx
	NnQp2Olb/saku5yjsaWCP3cWtAvbzStHGk/I/DZc1/RyGjbnVhoGqIM8KbN8YVg+
	biDZSlGGtW4FTyXbNj/gG+GurOMyDS5lTYQeOL/PhLxJERv5fACAzOBs1RW/iH68
	Vh61/I1CQ+VdiDRYSMFhd6TXk/ei5DyDYpOFAbTWUBsW4WIp/s0R12+AIxtGG9Vc
	HeL4Ug==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd2n2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:16:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so3234943b3a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 04:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522578; x=1796127378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=;
        b=HTo/7HJAEFaRVK5Wvgiol6t7ZENfcCUcfL3F+CIFFqe8/dHFqUqxwYOGMotOn5SL3K
         /LS8eKx9Zz6P2O4oogUu5pGK7imz4XUc8F9J7wcghHUohuDysurE+uXUzP68kMiRlxJq
         wu/ut8eiIXbbzNn9d+QO85S/vstmFZMGS0CvuPQkLhe2Q4z0TOhnQPQ3gM1vqDMqLULO
         hq21wWptutn5NxBxZgRHe80xlEHhDmlMSC2jR+FyP15gs452n6XFWV7iA6fTYrVL9cB4
         bf946A7QfzYgTva7jjAoYjQpQAa7fhfi5TWv55gZFVSHmNldDPz0jtIW2epoxE9wbwot
         YDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522578; x=1796127378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=;
        b=QIAZU4PEdUpvnJE2t6j9ssf2HjwVPafi2GBBqBaDpbsCH66MLkduZSeHW6cZxzR1MZ
         Mw80c9uI2OFKEGqDlAasUczVm39uwlKo4veE4/gLcBYfk1orfWTtGXSwhhz9T7wT5Ati
         m6NTHHbziUPOweVH4RE6wmwV1EMUGQkORS+JQB1eP3IgyJonhk8IB4J6vu0BqnjpH8n3
         I8uA+sWJZ+mtpcNUqZDiM+xwMlG+UUXIUoWiMf213lP9SnB7lNV0iTX98hROd/BLcTZB
         haVlcLDK5igL3YsU2FpxtSBkGx35x/dtLVeDT951cdJsXChJJgbZmZnB/TqTJUGksizJ
         fNAg==
X-Forwarded-Encrypted: i=1; AL+hErGzowwK6h3uoEtBE194OPfrMN6f9f7JQ73UVnET2dmHVsrS7gI4Mc9t6aDjmR7KrKK2vtJ0m+ITOGvK@vger.kernel.org
X-Gm-Message-State: APuU4Z/K26S1TAr6KAuuzfgkllnStHkP69gRXuGNe2/C6vmMsvk6EeoK
	9Bc49srWzhELzVMlIa5kUwfEixUYGvbG3ixG1l0oHGtH/8y0eBWl15Gw09poRYNi8lck7UmzCDQ
	wTIjjw/0a2O/8oMhaafd1qeGHSKyg30h+bLZvyPvhO2JFCUqttj4RFxhCoB9ocHXpm479Cszm
X-Gm-Gg: AZFdTZeY9e0i0SJGCOhhAXri5rc6CAM4aXuMVgTALaCMdWhoIy4JyBHa1hnYYnxRqZF
	no9j60l22FHpNUo9mvSx1iPrOs5VFvLTp5JV6PAkBzyVjItFYFImXru+7HOtUByLgpPBpCWkWjZ
	6zCOJP6SWMbKzwmGn/wkltQcAoX9QBXIueLUe+GAuCp2NJkXisuBH31kDTNM3ZnHnskuWEFLPOw
	f90IfMjQ55cIcNlw8oBQ+wqZyPhNgEMI/dmOyM0t4SqCAZpoJbOTOW92KGYZWyJGZozZ4TP+tpI
	uH1u5b15h83QgdPFYg0FtWZIy/73KW78NvfBMIl3S7oqGSKgGSSlGIDrXFGuwDhEL4IYQGhE80G
	m/1hKpvWmJr1bUKU7ioRruHIoJhz20IQyZ2lML0bEBmPvFtNRWjxNus6L9poX0FRhvA2Op3aPYi
	dT5arxq3yS
X-Received: by 2002:a05:6a00:44c7:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-8c87baccf21mr12944498b3a.19.1795522578378;
        Tue, 24 Nov 2026 04:16:18 -0800 (PST)
X-Received: by 2002:a05:6a00:44c7:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-8c87baccf21mr12944474b3a.19.1795522577871;
        Tue, 24 Nov 2026 04:16:17 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:17 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:45:23 +0530
Subject: [PATCH v2 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
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
Message-Id: <20261124-qspi_qup_upstream-v2-2-cd69894107c8@oss.qualcomm.com>
References: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
In-Reply-To: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=1017;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=EEx2Qf9ht9RV2ShxIZ5R8hgTYqT6216fgvKWmMYEzDw=;
 b=MgqTwicYRlvJgrM+Ti/uoSQignoLBWDzOxIHDD22f7YmBLV3491zS+retoQpIsYP5p+DKHrhf
 mKE2Qd6sMgCCVjhNsFOTSJZT/LrZ8iIqqNAz5nUPLgwvYkHYqWm4gyL
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b058013 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XDCUMzA_0XyrBmuHy_cA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX4Kygn+cmZE7R
 4vrZ7ulj6RNy8xaJ/+NOrb3Sot2RrGwDeu145PTWuKiRaJ6Q84E7HtVmSzJhb3coiVN/1YtKX3w
 wOEv+2egp0MfsMTnoPERnD1cKaxHJVZltHNGooTsnd6ba6VQzHG0kI/P6OLHX50hK+M/vLjOZ/R
 7LQLYWdX8nnJfDHPB4Ka/QjvvBSE4RNJEL+hDrAkhUY5/AFGeSw34IqdYjL/F0yeBb7qoltHHHb
 ymXas1wiz+K1FWHRRdj+nXV6BRji3Zzfu6vmP/Q9H45wTGUvAXZrcA4pLMFG0wwnL/2AofQKQNy
 gmH6BD5EQLeW32ItXezNPvzw9hP29WG0wX+N4wPxtkYy4QMTBxb/tp5pfm913IQ+5D1FYqgKlrt
 RBCQqHCF3fspJvwxPze5/qEuIIYTx0o9pkuAYY/z32KCEp/pXToitOb6QG7y7HwKttI/IghaaqS
 snCi7SE1MMoFme8dYWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfXxdJ845LPK/Bk
 ZrNpIoBxzkSweMCyko8FQXYqTZyxQlhlWUjlRihXr6+ylr5K7p+Lhva4BloZQ3BBJhR/5OZSnJp
 ZkmnPXaX3SolSaW/UJPmVG/Ypnn2vzQ=
X-Proofpoint-ORIG-GUID: J4f7oj9458dc3oUyVzgHdfY9Ixmtxx6s
X-Proofpoint-GUID: J4f7oj9458dc3oUyVzgHdfY9Ixmtxx6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

Qualcomm GPI DMA supports transfers for peripherals using serial
protocols such as SPI and I2C. The third argument of each DMA specifier
identifies the client protocol so the GPI driver can configure the
channel and generate the appropriate transfer descriptors.

Add QCOM_GPI_QSPI with value 6 to identify QSPI TX and RX channels in
the dmas property. This is a DT client identifier, independent of the
hardware protocol encoding used by the GPI driver.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 include/dt-bindings/dma/qcom-gpi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/dma/qcom-gpi.h b/include/dt-bindings/dma/qcom-gpi.h
index ebda2a37f52a..50fdfc5fd9a5 100644
--- a/include/dt-bindings/dma/qcom-gpi.h
+++ b/include/dt-bindings/dma/qcom-gpi.h
@@ -7,5 +7,6 @@
 #define QCOM_GPI_SPI		1
 #define QCOM_GPI_UART		2
 #define QCOM_GPI_I2C		3
+#define QCOM_GPI_QSPI		6
 
 #endif /* __DT_BINDINGS_DMA_QCOM_GPI_H__ */

-- 
2.34.1

