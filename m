Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341290;
	b=036pYKVl1mZhRG284GZ4pi062DhuPVkr+jduZOli0tQW8g81kGFZaesWcKoXoA94PJfO
	 9NEOUHiS0c0vatNe8oIJrd1qjcKnCezWYJwwRzvX1JShIjogABJLoT+FI1HM9pzudZ2p8
	 9mVFJ9zMzbpgqmWLRwH7vn69qc5ajUoJChJCBnwLXWC7fGuEqAiw7iXPeZnt3fP+w9Be5
	 nGrTNvWn22GMKnhfztfS/c3fwjZY68iymr8jZSLnBS+ZehcDljEtNms/aDuhcpVv6jgQ2
	 hyFYyGSO//nbD8JRvKyLRPtRYf3grG09rK58CDxcqmX4uNGXQ1/pVV8x8I5w8WSXh2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RgmjaHKT+8xjtXoW72r5gl9u8NYf/R6DKfCNFrT8aco=;
	b=BV7fw2Ma1Jgv9+u1RxSQfiJA1q0ymgZ6lCkqXwjL+Idu1q+F9kBqDOTCi/bb9AOjSRXS
	 N1Tf/t6RP6rj7bbSl9htV2XoapLYYOR71MkQnyCqejeLsG3zzSeCPbHGSRkgSqCWlB6Sr
	 VG+op6S2kWM+JmQA27mJmOjuJ9QUGGQ0QT+T07p9nvPTYb9dhuTwbd7UySTkW18Scow84
	 ggs0CWVOGxyog4hZUGDrZV8aMMc2LRb+gng6OwE/Q5vmhr1s1yXlYCsRgm1I/B1p6zpPN
	 VNEhiJeZsXq/yFweicwRbqAXuIwGALhas5NxFrUUzuBEMPBf14uHyVEM2q6CBjUGtLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q0lMVd8i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaAwP7Ds;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9A606A325
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44A9A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q0lMVd8i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaAwP7Ds
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F0wx1738515
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgmjaHKT+8xjtXoW72r5gl9u8NYf/R6DKfCNFrT8aco=; b=Q0lMVd8i9PEtZ62V
	iawUO3S838i5fqp3bVT0qLx17O0ZZB3Mcv/x9gqAX6Pz9knoq4Wg7sDitSk2sEaG
	omXBwq6F3utCEwQZ0dl/n4L9cUUJKXnXPVcBbqXAB10sDrJeEYyu0IcBWjgMBHVS
	DoNAnEFH3c9W2KG0TcPz4h8UwMhCCFMXlqH96JNEhnUsxrwLhJfxikMW79jF6Jyh
	dG2jjnECE3LQCMw7qh+NxJ7bWqZvdALHOxylXI+5h6XANHzr2X8yxhdqhf/ApDPK
	QCwRpR9zjzaq5lc5rsZSOK90t4yKN6pu74grSGDjCbwDG0yppJyGP3noBrn4snKF
	xlQqrA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhgtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so417324b3a.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341289; x=1793946089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgmjaHKT+8xjtXoW72r5gl9u8NYf/R6DKfCNFrT8aco=;
        b=AaAwP7Ds7zpA/DZpilM8UXsckRHC5b7WWiEaHDm//TMqSRxj7Zblph7YeXo3cf2MUU
         TIHNB9aFfR2/d3sznGiou2aNenTuhqPd6mpXIQt0B4bbEBWLC/GQ2ZyOf9eGxF7Cj9rG
         QWv4Nuikr/+ZsnpYwqNUwq5aDhZuR1dIzKTLfpmLjpJH/F6nrM3tv21iLrNEkjyDSAGf
         c3XarUjuhipktnqsFvZ3JxfoHaKKboHL4ZrRwQ7gRSnpmkgHqL1yZmR6iBxV36gpww1r
         D4BBlzQzaEDbhQFKMjYFEX4FglXZnvOhR/2V4l114/NBLJW3XqX26lGOrs/MrcceZ8Q/
         N/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341289; x=1793946089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgmjaHKT+8xjtXoW72r5gl9u8NYf/R6DKfCNFrT8aco=;
        b=ZPQ5JCvo4C8jC2cVIvRGwP4U/PKK23PZv6QLUUJITlQLNkCVz74ELW39XlPaWnbNRD
         p/SWtCiQNueZ0pOmwjSR5rcEL8c1eH7/l23RDOSwHhQaOhXvm7pFC6ymUiBuWEK8pAyN
         +5VjCyeSRGgqX25w0PfjLduYTacDKa1Qg346YqlqXejRBYE40aGHXZZQBw0OBKAluS6v
         u4YX+1bpalTuYa9iTnTj7W6+zKAYhIuXqO/YYvk2Dw0beclW85KaLBzL8VcZK12U4UkG
         uY4EYW9D0+/csfqENMPXjoB1C51E+zVrPyjXTk8SG4VrYYI+tMpsm8/tpEPmfbzlnSE+
         3aSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTHveCcpaIpz8QBIFcfrDyPhcdHfdKruFjCF2O0b9bkFsd5NRCfN4KT4jmUZTzWHxKmNa05mjKfJsW@vger.kernel.org
X-Gm-Message-State: AFq9FYKVYcGzGMCjoETcKgnXqQZWV64bAACKDhemDPDTu25ccVMY6x9N
	CxBxSzkB3859/B+q/o85PQv/izYeQ7bj71AtUw6yl32fB+Vfv+MTD7TLr/5aiJbgI+JRl3BcNhp
	Nx10dVZ/4WvgD3tfJuZ0RH6KRaMHWrxKn7mZj0OGuyRHCPZTngX7P7AIlUAudtCx6
X-Gm-Gg: AYBFou3wwLsniAarnZQaG8PYQVzqW/NINjCVdgicSzZtI+HpzCZiGCFAI6X4RJ3QHAr
	+HJngnMXz+saPHJkc3rAlFzaVGUHlH8O4FQKOWuTV7fiOHDzvHS/XZLd/YalHp1uSBavxn+TmJx
	AYreRPChVPK+UBM8U77E9tcf3LUZThIZNu6tIQWha4wibTobM27CaDc9ZMADD7VPODftjvHc2KW
	bcAdUiYkaeks7GbhL0iep6K9MtYDkRnIeYUUQRhj7z1RXEUffp9pSu3MNJ3iqQw2694wpARRQaM
	D+NT2n/4D6eas54uoVbAdb80v8ARCMnBES5S6XlVxE44zVhD0qBl82hNAhS0mYnUT6ycAQTs0PH
	+SFpgxnV8I4nE6itp1sWnf1iZqW4560WQFF3mrx2BXf8ypqytilEs2OUhoE9N+TA3s6Q=
X-Received: by 2002:a05:6a00:a87:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8a9be48bae6mr1062361b3a.21.1793341288855;
        Thu, 29 Oct 2026 23:21:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:a87:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8a9be48bae6mr1062351b3a.21.1793341288405;
        Thu, 29 Oct 2026 23:21:28 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:28 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:52 +0530
Subject: [PATCH v3 4/7] mfd: qcom-pm8008: Drop GPIO support
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
Message-Id: <20261030-pm8010_i2c_support-v3-4-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
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
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=2803;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=7mLpR3X9sn5PkU9srryIPwK4wU4oxVAA/ffDfHVmy3Y=;
 b=3VC6SDP1ZyUjeKHAJKTRxNVFsCVnabMXGvo7hun8OFtJKAlg2iTU1gbcQu20nFLXuq86EFP03
 kqIJgVur52oAMVguZjEJm8HH9garGe0hLQBjD7Xjy5DEgQy/HY1Bd3v
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX/ieJddvscu0A
 uQlFpOQk7iEl1A78tYlsr+Cmu8guqCQUJZBzruvhPCk2hjWCr4P4A7JCFWh7WDD078zCzWdtbk2
 KndmeGzSTlSVOCIenKcOquj4mkRCor5NOQ9ghxn15IysSbGFxQkCnRaTtPhsXyEA0gBaUH7y/nl
 adYNHZMF9S10IIijytxBBPTyZW58j6OfxP3a4RhTcnpX6pP+U8KCKO6ZqQNdR0h6maYf0o8M95K
 /b+sBls9tgsJ1AgVLuiJ2d7NML1pxittq40IjaSZJkrmJM6dFsm+g6mQqaOxHX+BH1KT3QKUBTE
 jccqrN07UlTpU6qR6lC7TuCfg0uGaL2sLt6Losy+yF7eBEbHcKMoEMnCqdz2Df+H9dVAqjE1Eo5
 LJyFim7h8RzOtRULAP6mi9zHxWH9fmwMEmq9loyof7R/kU/quv39btHZHZpwJ2ACnymWTDun0kf
 VcnAqrFSAoLBEg0L/eQ==
X-Proofpoint-GUID: p5cQBSGfIq0EmaJ0cqkhsO8x2y5cCZLf
X-Proofpoint-ORIG-GUID: p5cQBSGfIq0EmaJ0cqkhsO8x2y5cCZLf
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae43769 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXyukurBgwG/DT
 aJE/Oxs/lDTuGwLDJ5/SVJLbSWazAS9q/L99bHKeapsVi0mMzRZ4MbelkDLlVQMVRN3Z4N2PuCV
 +0mYp6ttMzmECMSiVC3ZV/+vcU7D2DA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
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

