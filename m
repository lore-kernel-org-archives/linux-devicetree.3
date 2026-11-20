Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166457;
	b=HyVbDwWZCRcUu02A9JuvtKCsXOfS9pkdmmbWlbtXO7Khgk9kgLC6THQNxpDzwhNPKeE0
	 WestEhI7AMjvQp8zrriBR4C6ZHpnxrAgeZ5HC6UdZk22drpY7GbV9Lxa7THbrl5/AJWLT
	 ERy0jK9MO3oLgUB8ujuMQXVVkqUR1/imB92ahqXlf9uXtX/hR/qCVmNzNShb+98XJzb2C
	 oIeC7YaQSFsrPwXzXt2GtdlCOAKgbUwubgrQG+/lHoii6mm050FMank/H1PWMi8IexyIO
	 ils4MxCVGwruxUjEDIkRCq4Uf+1+kU9bPxTUI+5dVbfgaJHAduquuU31jOdsV236l4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=;
	b=nJ4gwwHQFrXVMkP1cnwJ8xylMZkSMHvXJjbQS51Z2NyoZPtyaI39HPkCgxq2j/T3ySEF
	 hiIww9TqP5fIyZXW1m0lEiBMFfOww5zPLJm6xi1TCZpfAAf9eYHnrWvZYCdJkDOmRTPoW
	 N9W3Pw5PGQtqPs7PccmQgpmNCFR8n8wAfPbMmkqNYYWOlPJAYoBhYU9SEeWZzPAqjEktH
	 DjAzlTpw3JBsog5PuqNSBL35SYskd6tUDqmuU+LmddmGz7+rxGOZ5MXVAUvXSPtFcDYod
	 +O1IZNdmWXuw5oDt9aN4tQFbe2g7KJ6xZdw9z6XnRceqRkMmbdIZu2KR8Gayvkczr0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmstM3Lo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPBaPM7+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC3A606A33B
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC3A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmstM3Lo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPBaPM7+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fNrM650478
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=; b=gmstM3LoZSHfV2dJ
	RxhiS3yH7+zvUjuisiI0wiiUUnhRzNorX7xavBW5WERpLyqXnEJDOW5/nB1gD020
	J1sSEF3PTENuZ3v0qr0yeekihpL2Ld9+leAuVYD1Uf68PzRfrG37HYp7iKnRtFoU
	m7rAaPKD1cknvkazujrQoIQWtc9Z9nZtA0z27cFIuOAP5z2Yfve/38J0b1615PiF
	MRc4RnLMQcWS7Vy4nJYdz3RC1aqkfZoLf2icfFPoDC7gxAt5jKiz+YydCf/q4AhN
	XL9xOytGNNe3jYrVX7VrguYQbgAVSzDXFqsv0lBYyd4tlgT9IxOI8ZS3o5zdZ3zH
	m//vOw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyjx08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a064f294cbso703092b3a.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166455; x=1795771255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=;
        b=NPBaPM7+9qOBTiYCbdvXQ6+Id0ygje3QTGewasWOmqlWXxYrtUYINfpSHq0eQc4qEW
         QB8C6KXx5FdY+88TKvSLIwJYFIvcrYDsz7GK2Uaz9nUUjbydHFG/qh76Fj6r9cMCl03N
         /6PLzHeASx6UbDyskIkJz4SlDFFo4HuanFFjL8BDAHHMkpg27OMp3gxpwauFilc75ZiI
         ceOcHsvZqBfKHJmjigS1B11fcJr2cuL1l1Ks6K+3b7tO8vJFHx8IRKd9DEyBw9QDEzXd
         5+rKGibKHfUSS6hriTa4hENBw64edXeCzgC5H6DpmnD8uv+S+ADAGnfx6rs1VkIlkUWO
         BccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166455; x=1795771255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iex+7DlCxfokNUjvAHxZkktzzR0JIxIsqe0F0xKUMZE=;
        b=lpkP66Fl7eeX8STBjhzWQPCjBzPKpBcN8A8AY6YOcKXDYdMbvHgJM3eGNrvkxJVcw3
         pPXzMhbmU9XlIaiMSYipV1F+Anuwjoul4Tv7FZBxV+lfTiptr3wcD8rYdx39D7IxQ9EW
         bZyLR+WqnDoMoQfE9QAfZpjOBkCgTet9jfLite/l4ho5+C+ti+Ki6Rs0SCGOo4Lc5PSz
         dx5/se2IIDbO0XkIyW9Lyj5rf1b9Ig0mYTucrrnTZBonuWQYvg7rL4iHShPzc4PsxJk9
         xFtj4NH+eGZK9Mi2ld/fUUCZQduw3oTZ5YVp5lLF1YSsoWjbFuXSSjq/6zn+9wLoTEPO
         xlUg==
X-Forwarded-Encrypted: i=1; AL+hErFJ99GcXnCJu980Kc4BeOfpfJlftA5aFOB5XtPvSAN1V22icfZoJ5RocH0Fqq5crA5KHW7zQOhbpWKR@vger.kernel.org
X-Gm-Message-State: APuU4Z/okmpi6FUMPKyC/rz9T7wmF17Jg2DiMdBd0l2EdYz/WKC8jSxM
	Jlv9dN1Ikfk851v428nRXlOLL84V7XVrtW7FMfVTET+FN9OLfdEwZvLg+NsbvqIteA+1eMls7ak
	Jysn1VJxyax8dZSiWVfWwUDszNLU9FptOwiB6kNd0vHU3FYz2mXMJhEB6SFZZmdQ0
X-Gm-Gg: AZFdTZfkRSHHa4atjmaH9EDg+8c9zd/asMfc4Ha2v/suWGgvzV+LMzvi/o/HR4HAp52
	OBzGnIb/9B5m+tTrwZLSTKmtVDPB9PNAcsLik+XLDMBhhm0eatKQTGSeCqf2al/dz+yNjE3IdIm
	WxH+XXEu7dHNlV3qh3acOcLBmjsTyJx2btgudLgITaFHgToNsomzmkhYtKPXUunehuncc64Rp22
	PjCbOo7HWugOS9GjrED4nMIvAkQdwExcezVGl9+/lDv6KRnznB2J4CVgLN1Q1l/+pg0A/sUsDOE
	6/0E8t8deKVaaiJkEZWQk2Bl45JQLC0fO/qsouNQKQ98i0afKRi91zQBK5fKAEb/TKSjSOA/rAN
	Ga31hRQB6wLFz+su4mSJZtZPYpDzAJ2cY7UiUYqof5QatsDbhHDdFjgu6kxHsoSHY1i4+
X-Received: by 2002:a05:6a00:2888:b0:89e:89f5:18eb with SMTP id d2e1a72fcca58-8c87baca1a4mr2848603b3a.15.1795166455132;
        Fri, 20 Nov 2026 01:20:55 -0800 (PST)
X-Received: by 2002:a05:6a00:2888:b0:89e:89f5:18eb with SMTP id d2e1a72fcca58-8c87baca1a4mr2848552b3a.15.1795166454586;
        Fri, 20 Nov 2026 01:20:54 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:54 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:45 +0530
Subject: [PATCH v2 5/7] iio: adc: qcom-spmi-adc5-gen3: Remove Gen3 virtual
 channel macros
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
Message-Id: <20261120-pmic5_gen4_adc-v2-5-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=1334;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=I4p2EJOwVOFdhLV3d8fOV8mI8YFEYd6rXRgzQ+V6ybU=;
 b=rGlc5oobOonUPzUINfe0xZ01U9TskVZZ8B1j4gHL5EkU9puFHuIEXfLWsU0dm8BuRzoxIBRiF
 kDWSaLgE01ADQwp9CouyV4yLzDPMdMKAzrdmEGMgwp/UkEDQnpMbyAh
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX3k/AoAQerk3z
 fm8aOHWgryvieOttYfYwgseo5fNYHWG4pd1O9apBtJTnCp1/lsHMUpZy0GjNvFxEmqJVxO7iBYV
 vyAp5pg6naqouhH2TE0NwMHVNrlG4Kk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX5WEWDJJLoswQ
 a3TnuixCJ5iKxqiwExc8pvBi35hfmlT34oxW3rwDh51jxQ5ZkbB6gcaix7X+6gAEpDquX55X9Dc
 x4s2tGUOANsN9LYH10aAWJXlP9/msbDpiBq73G8oR1zfBVHfvbERhRyaUm3gbnOzPWvdHf0Qp5u
 nABjPEMHP/+Mx7C4LXmxYEpBKDceVhOpjEYI2x71BB4tMNhhsp5M7NnN1tM6rZe2OWgPG0SKPn/
 FV7hLwCeECMOqVhg/FCUYtte6WOW81nP0mJrhoyDYqapDDEvSexQ2cX0sdCO5vUhHvl+1DMkieF
 lsfCZC7i+JL0+4uvcGC8dBLZWYGy+BjqsI+Gg6OIWZZx0UvNP5/NyOFC/viopwQc5TRNPXvtah4
 Al/C0geBNpz0j5Cft7qPVstqI+IK0jKZAf+/gl5jcDdxkMaHrDuJiHEgqbdob1MwGdeMe2wBYcV
 2a2t3DhwmgKKmiT5DKA==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b0010f8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YNQv7Wq190UJ8kr6mkwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: ZJDLDK0rRVwqpDYLUItefY4Kv7ZHVQho
X-Proofpoint-GUID: ZJDLDK0rRVwqpDYLUItefY4Kv7ZHVQho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200037

Now that the Gen3 virtual channel macros have been replaced with Gen4
macros in both main IIO ADC driver and auxiliary ADC_TM driver, remove
the Gen3 macros as they are no longer used.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 include/linux/iio/adc/qcom-adc5-gen3-common.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
index fa7e08d67f26..105b0766a01f 100644
--- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
+++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
@@ -40,7 +40,6 @@
 #define ADC5_GEN3_CONV_ERR_CLR_REQ		BIT(0)
 
 #define ADC5_GEN3_SID				0x4f
-#define ADC5_GEN3_SID_MASK			GENMASK(3, 0)
 #define ADC5_GEN4_SID_MASK			GENMASK(4, 0)
 #define ADC5_GEN4_BUS_INDEX_MASK		GENMASK(6, 5)
 
@@ -78,10 +77,6 @@
 #define ADC5_GEN3_CONV_REQ			0xe5
 #define ADC5_GEN3_CONV_REQ_REQ			BIT(0)
 
-#define ADC5_GEN3_VIRTUAL_SID_MASK		GENMASK(15, 8)
-#define ADC5_GEN3_CHANNEL_MASK			GENMASK(7, 0)
-#define ADC5_GEN3_V_CHAN(x)		\
-	(FIELD_PREP(ADC5_GEN3_VIRTUAL_SID_MASK, (x).sid) | (x).channel)
 #define ADC5_GEN4_V_CHAN_BUS_INDEX_MASK		GENMASK(14, 13)
 #define ADC5_GEN4_V_CHAN_SID_MASK		GENMASK(12, 8)
 #define ADC5_GEN4_V_CHAN_CHANNEL_MASK		GENMASK(7, 0)

-- 
2.43.0

