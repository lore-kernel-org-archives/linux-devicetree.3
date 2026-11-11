Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416639;
	b=PIjUOU0JUCRanPDT6R8uZpiBrCmtaJ8KB+btDYOqSulmWqaQGEvjJx+BZShf88wPCoB2
	 xra1TFYOmtHxuduuiYeSGmdlwVsqRFzRXSR1l+KbedkK/KmdLNxW6Sj/waK3vBXyegtKb
	 n/c6d3VL3iWUWEh5T5sYXmYTKUXVmrBgZ6/Z3XEWBNiv6dpXS2cyxVCBmyc3O0Nb55VQD
	 0z6+F2XdUATELBjod37XKgem6x6xlh3HzwcMrpPL/Eq/23B6UYwL5kYbQApLkVnWLgBqr
	 IBxkP+HHPXLRIo5eYyKEAVdV0YqpEPal+RCMDE49nwrBUooIFSms8uopGxJ2vuYl/9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
	b=YbS3dh+G3VfGmYOw3JbXPDKLFqi1FU+RKjswKWPAuHMJzNJNkG7cfDnPS5jtNNw7XGyj
	 UDcseKadIwbxj0bD2ruPYsZtmHTjWkKaNrM8GJPxia08QhSmfkI2ntzg/v+aeCjoFD4EZ
	 XE6fRIvNOqBZFHQtiKBtucY0QzbrdMAm8Tp2WcsDkIHOMtXfg9C0T2PymelCU9fwweDPW
	 mE097XohRUbJxqzAUpHkn5eANbrzMJTAxeDv368/6TxTwRTC68vu7wHVBZP24LTjD4UH3
	 z/DgGT2ZEPAGnvGueHo5lX0GvsKKeW6PMNIJhd1gu4QPYXGzUr+TbDAVWLUu2WhSqLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPZWpA47;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZZbcmcn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F8C606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F8C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPZWpA47;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZZbcmcn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0VUs2594034
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=; b=KPZWpA47NsnsKB7M
	BuFAPswPdt3wKsOnqRbCHz13jsxlFVR8ZlgWmVchtXGpQaPmWrOCFiGW05+lTzmp
	bkpO46GY9vES14qKi6r0uaNJepLRii7lkqVfeOe+ngkFNfSpX9aOkq5lHfPJHZrR
	LYN9PDMqAadhfsPJHh9SNViLDWL7r6hxUwon4cVK0tLfk3dTae6Gaz7o6L+J/pwL
	AP84Ip2VXpDjwBQXI6nY1Xr65To8Fmer+Y21MRsFIfKRrCy9OuFb4NPa2znA/3Ib
	7bU877ZvtH1ilDSrEJxnAHil2yj3Hf+kOu6a24q0HnTNGYkdKMkhGgQzlSOk0LVK
	Wf2Ucg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksma8tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:03:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so1957496a91.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416638; x=1795021438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=cZZbcmcnTPmIgwCiU16Ab1AoRRwIRrM6EIZEt9K6ASQSfARed2D07hYSKFUeybCr9+
         XoIR2hhul6KjiMHAB98sAGLa9wnMGeRENpA5/D9aSsfV6K9X+mGfdCL1eyiZYYPPXqR/
         iQ+vJVLQH5O0jyXbhqKPuwG1ZoqoC++DNjgCYX2CjEpqx7gpmw9xIxkyy8lvzZIU/zFU
         vxvI8O/yveWbOWnTlkp4Gt0njj3pC6Bqx4RtAPG4YsqxJLZyZ4n5zkGYxdzHzzWMN+su
         8hB1af7jdMvxm7JUkmM9Zm2Q+RS7r5pk0ENA3Nv7qiwpHuNa0tdwTbbRI3VW4PFwCcOp
         URKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416638; x=1795021438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=K7/9pu9A55vMemH6UXptIMvPGLSHC6LvCKEPqPUbnB+36N2lNQYv/aClmOaXyAwYJ0
         o1LI6gOfFD4I4RWZxkbo9U1POCo0Um+C9Lp97uA4Duigd2/RZFeyZELXpNdc3gxoFzyZ
         WzvyAEftyWSvp8Hq2BcAvGGS1IshArUULNlYlwKtVT8RkU1pTrWKosKwqFLVHe2t7s8u
         6R5wX1vwKcMY9PJ4R+tMvQxCjyp6spVMejt0SXq2JsJ1jE81XnB2umq1y6kZVdgXQCo6
         v60ug3iSy5I6RcVmIqL/1zOGEpUCjGitnHgN6ANokgt7ieRmEtux6rLXEsoD8DwYrbQx
         e0mw==
X-Forwarded-Encrypted: i=1; AL+hErEJ+s6jFFuxtTBCHUg8AWteDGeX479/ZQARk/8aMkuIzkzVtN1+Plb8OYBJn1M595mUU2vZb7obLbUz@vger.kernel.org
X-Gm-Message-State: APuU4Z9UrEbhsGIjn54GBfAYrmrIzxb9gPhoIeKbnl92T9Ys/iE8CyZ1
	m9S3ze9ViNNa/kcGs/Jy7Uqc29wJ6WPAvC9uJWEjenZYNL3llTBU9vsCQ8XMcSoHlg7DKBrrivY
	IoS8cYEmMj/0wzLMjh9P6ekfmdg6TO2kcMS2nQkLbzIU7MbAaaXhnXp/RUpG0dREP
X-Gm-Gg: AYBFou0GFbpV/EJkNdywLsKeVEvldDcZRSqRc6vpuFANpdM8EFbrvK+hKIoAmqvgQhU
	PuBbMiZaVcnwYd9Vdz6DvMO09JteZ44QCIxD4udXj2wD7xy6MlPm23uLp8Y1ZKmYR6cLMgJvFG1
	WGgyqk0R9Bqg/fW7toXzxvWeSP/dKOVEB/v4s+XmHjP9U7cVF/OVddTXfpA8DxzQ54/GTokSgUU
	lnKJ21ikchQgAycjMQtuyC4CtepTWh44qHP7Bt767UgD9peTwewF7w2ASMW+jJQF+icuhBLnYSq
	6wGEPKUTIx0uuBvpqVkUCCgWMqO4JAJapqPslh1RssJFiLzeJQjTW8exCfRR9D2y1wAXPqE7gCi
	e6ig/K3TamhCzA3HEGHQWx6Pza8A+Fnzyn1c6WAL835aoRQt/6l+5I4D0Ae3DC240PAk=
X-Received: by 2002:a17:90b:57ec:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b182f267f4mr3087857a91.26.1794416637573;
        Wed, 11 Nov 2026 09:03:57 -0800 (PST)
X-Received: by 2002:a17:90b:57ec:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b182f267f4mr3087809a91.26.1794416636929;
        Wed, 11 Nov 2026 09:03:56 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:55 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:53 +0530
Subject: [PATCH v4 4/7] mfd: qcom-pm8008: Drop GPIO support
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
Message-Id: <20261111-pm8010_i2c_support-v4-4-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=2884;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=+08zcnHr6A7yFclGJxbZHZCi6ixkui2rq8+7R3gOZmU=;
 b=xzvPfdQghclKk0q/pB7QkkPMalyellw/TxY0YjbTIMhwDnvrlZZuKyilv06UzkgTWlHqKNRuY
 SUPnvNock5rAB53CkN+/pRAaCUxIY26LdK098CCexFzYwUq7UwqvUif
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: nmXnZKIjOdgPlN6bUnT1TmMgzJWVihkp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX/zsZ6vYh1ZRQ
 kWNffNFMM+twSOVT/NfiAZ1TPyVtL+LGabLYHTcKolD5O9v5itR0ZDSmTt0jp4HpRhDE9rp+JTC
 7emMryccfBFILjlBreecka10tApyS7PPjUFp/aeI0CFCQ4dE1hy4H9GXRZY+UWy6F602dEUpuM9
 Ea9wAjtJ5EKoCROmEo0QoL8UAR3NLkx5fjshsGAwP79HiyDhcFRiqv+Is8Kj5+jv1VJVQjzLTL0
 0BX1ki5a0t9OQGMhlxqPYhW0QMZL8Lc+YD6Vx78oR9Ar87va8pNlTGGSlkg0tm79Fuwa/hUuuUU
 ME8nkgZ+JjmfwW7Jfe4tejGLzqgKJnx7M7HJAfJe8DlDgP95R1NxG3oRMMCooAnYFGLSKGmVAka
 r0I+oiEYNymVDU+FPGPKlf39F1Rcgu0KztczaFWcM+4d28kPJacbCLv7EF9jLdX73pFOY/U59hG
 qwolWHfREtcWSR5kXDQ==
X-Proofpoint-ORIG-GUID: nmXnZKIjOdgPlN6bUnT1TmMgzJWVihkp
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af49ffe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX/R8islJmGTxd
 HnXsUYHWvbCg34bTaXhIMOzl2FBWO0DraFTC9QM/zL/nPGjsTLCEqAsDACy3RCOFO6Ux5ZeSKdE
 FojG5/OH6C64d4Yjr1T9K/BEmH2w1G0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

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

