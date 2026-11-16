Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809649;
	b=pKFsSw8Th13V3WjvLyQsP9OjQiT+7alZhFcLQJCeLG+nbNkgyR+MMIkMyjti8pZFvu1a
	 nT9OCHC8sj7tFrjRMjZdysQYJwxJJPN+0Ufhqf5XGlkVZ3W/EOazZb0kOmu2Y1gSbRdZv
	 c/7Nkhl6yaL4Uz9l3xPnDa+RBSTu/DhVYhgSzHM9Al1MHmyUueZ776AafufObmPBCU2O0
	 opWirVUhXd7wvcRbI2XUyRAk0G76Z8VYkDWrSoYRsN8pVg5M89jLREx8GHWrMHbQEMqUr
	 EygGfBjEqPIBfaz1c9tQFogi1BtIiPnugvr21nODRLmkjyRtDGyuyKMILwT/4NzoLkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
	b=Dr2NPk/0Izf3Zuu9IWSmhFsfCFoY8NsPgA1JOPhZ4+Ygw6bkPblWFMlR4kLY5zNVIv00
	 3Ui6MUvjyos2a8SDOomxx+3/XVU9VSORlWqI+LIqQMeRUYOb1Vlv4pDsUyBNhYi6SaHXx
	 oama7S4mipmdmF0Zf/BvO5H9OniP7O5WZ85p2kYDtFTCs0jn5decDlmIIzdip7dz7ncm+
	 JURk0BKAdiw/xHeuIDX9gLrlZILHxIEoU0XL+eZbdH7NK82QdZDzgbyBZ+aHhD8botqG9
	 WpOzN2wukGKEMeuw1hIFfmATcorN8ZxGiBbC5ZJDFRUlHYZ/ph7W2dyBpL8hlZGke+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwCY0rfq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LOK2lx5q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC99606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC99606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwCY0rfq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LOK2lx5q
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LUtd1585478
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=; b=NwCY0rfqi2Hq/opV
	fYU5/b+WxjM2res+3+q9Bwb+sZ0jFaJtTDIeU9Gzx2KAcJplQczzAqe0OmOjBtPs
	rGeklI7M8PT7P29hkSDxwwJPBspU/wcc987pRPBjo85hqBElL2azRjnGgVJyBL56
	qEqToHOAQiCW1FiT7+hdabQRcLeHOIj/8sHyG/ia787nDiiT7/tdsor0TTgFekta
	FCGA21Cy5StJN/0mvJTwmM3aNO26pE8CBNFDnGbwbTaPffmkTY4Laqw74eDXYdx0
	q3qlTijMamD/FJEVbnkJ6S+HCRt7Nt+yq+nkog8ObEu+ci3Hw7NYnHZauHmN9LnL
	Uhq22A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdw0rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:14:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb45b4ed6bso2990372a12.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809647; x=1795414447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=LOK2lx5q7f4p5rYU3CXzdPyRxMF03OibS4zjo2z2Le6zZqp5SD+ettJBn5Iw6lqhOJ
         GraK3trgh0tyBA3oGrf2t4Jg4XzlvrUzxmT6tny92iWtwQk0NeuyzglOiIws1L1HxcOG
         w0otrHLPgPTPHTLt2VxAAMMLLD80O6BdcPBsafHTcU12cBkcqkmf6uHaABVlIGZKiQde
         HWrur1nLWWLEcWJkldJX927YfhQYq99obNs8fym+SG8eLUho9XF08IdTAGZS61tDBx40
         LWQLsr37jU5vqM2DWET2H/p55HvAx++02oqOhJUClvNVmvdydUWHWZMwcZTQJbQiZiiR
         u2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809647; x=1795414447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=YWvCQgTG0SXRuZ5ijyUe/eN8TvEOVJZZ2AkH/WbpWqPtgGCgPajFfNUNwga7rO7H3u
         8Gqp21XdQNL5gNrZEMWw/9j/6ela+ywNVhi/5bST+ybqF6tYneaWQGWhgPzNnup7y0kI
         w95CHuTC23ksgI1ifTtXB7Yyw8do5OrgfBhkLZefrLIJcyR10QrbY6KuJwE8ovOsY7Cr
         jUmpv1qeShh0MzP4YOugeFAfKWOesQQGUXu3RfjCIQ93yB0sAgA5klSUKOL994opOLRN
         2IlslXbStal6CGip5SUiui4h7fldvJk1MNogYe+VHIAUF8vXqWr3nQkADMMOy+vTJIt/
         ubxA==
X-Forwarded-Encrypted: i=1; AL+hErHA6iQin8P7EFTTGIUOm9DigesYg8BuZhGFmcgSznJVwJkOv/Ph5gA8dv0XAQmyIMmEFGFp8qKJhgRg@vger.kernel.org
X-Gm-Message-State: APuU4Z8PcaMm7/beYLhb//3tVLm1bJjs3W1yt2AG/81b/+/3+7w9wBVd
	JKJCkm9/ZhoMfuNIbydTEBLjo5goDTITom1mkNS5sOhgCY7w220iF8qwRy9haZfFZFQ/PmN0ax6
	+ODK/Khu0uebE0BNMqnEzWfzhRO+WI6vcFNUPS+vCCtsLURsahNm2DawTE2nbiCBi
X-Gm-Gg: AZFdTZdXBc8zflwOtKBerjJkqs+jsfCH8ijOhqO40lhpNmY0r01WHdLQRI9xpAVRB1H
	q+DRxf/najhekC54mKdovrYM7q8XoksP7Qkxy4TA1iKnjocMa2zoE4ol+tQqeKWa6A14TzmHNHg
	PihoaATz5crE82M3v3tg0WmmVkUP5nMsAB/ofXjg7YHH9XyNIEsqXajsNRqFgcx2h5V5Te4L/xU
	/fT+fh8FmAhecRU3aKilW9lwNeYzUklfIuNAQzen5FDgt0rJuca2N/bzO7btLDdXYYmmVg+uCnf
	OXKdBo9FFLeXYbBo4huP5YHRcjOojHDhWaKkyBdZ9AHitHpEktj4vtSU0Kcxt2TJdjz0xNiLb/A
	WAZpuOQGlWxjVhJXWZKNFC4GdYPvAW/mBLa9KwswyDVOkYjjS3i/w7gvSGn7cTufeZ3G4
X-Received: by 2002:a17:90b:5687:b0:3ac:bc3d:6fe5 with SMTP id 98e67ed59e1d1-3b1b089e26fmr9640083a91.7.1794809647071;
        Sun, 15 Nov 2026 22:14:07 -0800 (PST)
X-Received: by 2002:a17:90b:5687:b0:3ac:bc3d:6fe5 with SMTP id 98e67ed59e1d1-3b1b089e26fmr9640062a91.7.1794809646534;
        Sun, 15 Nov 2026 22:14:06 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:06 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:22 +0530
Subject: [PATCH v5 4/7] mfd: qcom-pm8008: Drop GPIO support
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
Message-Id: <20261116-pm8010_i2c_support-v5-4-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=2884;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=+08zcnHr6A7yFclGJxbZHZCi6ixkui2rq8+7R3gOZmU=;
 b=/vsSAQbip/tHDFPtpttUpBSJJspjd6Xf4OE2fd5cc9VsOGTkmiBe8MQdQR5VzGi0SGfEAzwht
 /OQ47TlLAY1C//XHPSWVFkv2MduIcndSB7RQUM+FX5ARsyzO9jDt6Cf
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afa9f2f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX6ePPcGRQ0H5F
 1GkquhJoBM5ZTEKewERRnfVLu1lpOvwxe+XM1l99H6TwALxKBzcNSOYhqSfyFa9racIMcxR9fTb
 LxKE1ZCJaHVkvnD1u47cmbCNQwq3eYM=
X-Proofpoint-ORIG-GUID: eyd8lwsqNUjy7bB1otjSLVvxnjQFcCSk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX03yyzblfiYWz
 Pg88N/xVd7Z2NB++VIfe0GncjwimGjPYBBA/qXcBGljVJlY46ueJ3qbEo/CBT71PLYNIcJ5a897
 Dg2abkqoJAyrZcH9WquaR0VKO6rA2ce0Sf4uGbvKFxw1hS9ZRJELb+nJ2swpHp9/EFsw+frGBjX
 DTD8duDK3oAUpepZL/E39pPtA3ayqgzq+InIg4Oo2dyxOyqDoX2+BG1r53L/0PG4UHZkf6a7+EG
 z3aYdilvgUPcJU0PwYUcS4p5rCECMVEikd8MPT5V2Rd8UJSF3E4FifmrZcy2L8uQHM2hB8AxYwB
 798/rIoVT9nAGXyV3eKAWcZTpwpSmg4fN5D3oRi0obHLj5J6jqI4WIpltQi7cJB+JeNtK4Y/n+q
 R6lfTfEPXLBWcBLgN+oIcjJGeN30Vcd6pAnOS9anBhoygR/pfMLQBriwk8oBC1iDwPxqPYURXd4
 g2tuEHHNstyZ3773X6A==
X-Proofpoint-GUID: eyd8lwsqNUjy7bB1otjSLVvxnjQFcCSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..2d6c01cf54f3 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -31,19 +31,13 @@
 enum {
 	PM8008_MISC,
 	PM8008_TEMP_ALARM,
-	PM8008_GPIO1,
-	PM8008_GPIO2,
 	PM8008_NUM_PERIPHS,
 };
 
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
-#define PM8008_PERIPH_2_BASE	0xc000
-#define PM8008_PERIPH_3_BASE	0xc100
 
 #define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
-#define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
-#define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
 /* PM8008 IRQ numbers */
 #define PM8008_IRQ_MISC_UVLO	0
@@ -52,8 +46,6 @@ enum {
 #define PM8008_IRQ_MISC_OTST3	3
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
-#define PM8008_IRQ_GPIO1	6
-#define PM8008_IRQ_GPIO2	7
 
 enum {
 	SET_TYPE_INDEX,
@@ -84,15 +76,11 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
-	PM8008_PERIPH_2_BASE,
-	PM8008_PERIPH_3_BASE,
 };
 
 static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
@@ -180,7 +168,6 @@ static const struct resource pm8008_temp_res[] = {
 static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-regulator"),
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
-	MFD_CELL_NAME("pm8008-gpio"),
 };
 
 static void devm_irq_domain_fwnode_release(void *data)
@@ -252,9 +239,6 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
-
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
 				ARRAY_SIZE(pm8008_cells), NULL, 0,
 				regmap_irq_get_domain(irq_data));

-- 
2.43.0

