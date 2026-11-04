Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779871;
	b=pV1adQOrZQ4xsQdRsuC9nPlsoca0gRMddZ7mQmPvgnTmneOfmWki+YFcIRRdnf7zO3ZU
	 53n3d8tjBAAhnGmXp6l82Dv+GbdJpJi/hyt83A69vP0J3Be/j+LRXezMthsOyGRXe0vrF
	 a3YdG3n0XFKSFm9KH5Oftc5Pk/0D/+j3GdWcUM7/1LdITz1xZt66pe74zWU4j5rQ/AZX0
	 kNh1+9X50EbWhgf1azRnAKu1JmbGUCNZM4R/fHD2085+lL3Sx5QarzIyRKtvdlxsf8oti
	 js0O5Tn8FSbfchk90C25l3oGIMDafTBzsAQ2m6X8BarpfdHQ+RIyu3HZPMtspWUSLug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
	b=ZsRlRIi89sbCdS0ZJNFLV6dGXtuqt3n99rN1TiNzT1ARVdRzIzHBEIXu4SOPr1wjfEGo
	 gZDdoF0DxYzbuXIPO2cMg90+O8pQFVhaf3+eKfNJPzbZz5U00BJZxbQZkdn+JCFlexYHD
	 ds1iLruLfmH+Co8VWxVwwLyv0xW96RF4eJgT+8dgVOwYMg5FN1sted00LCZPTB7qoccZj
	 7mQy6o0gcbpnSwjN7Io4SnjRhZOeqUrxzTdKAZ4VDJOHCmlZ7eZuUN1EQuCAA98nzxd/i
	 5SpKJmFaqCEEiu37IRJ6fUFXlIsJPDkuIpx/jnlaagqex6155dqwsBnXbxNVcEc/84A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Q5Hl/FUK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQb2yDYF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C03D606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C03D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5Hl/FUK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQb2yDYF
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46tKS63335342
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 08:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=; b=Q5Hl/FUKLsIrDvnJ
	h8l8F7cD8QbVmi1BSMZG8XyGAH5dW1ezAryoqO/XJfHg+nX4NAyoJ6PdsM0x9GLg
	VRngGW9BW7IJOcTGX3Uu09gfTfMFzaD+wwO523W7RDyECOfypRcA6UVn4FrBaOhJ
	QYmcIPPsJhWuUb21Q4SQrddWJB1h5T5BU2qjHqe1MgYSGn6vcodLGKe4Siot/hAl
	wd0eiAb262P4cbEVNvp8buNLUV4DvkFlMKHPvJkidSj9zewJrWXFPxPvVG3Dtq+c
	gJPI46lZtSavOb9zAgpOcZU1cL3Xk1bpHnKWYK1AyMNBEquY/A0xjKMLqaSD+SKj
	1uU3Tg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbtxxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:11:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd6969473a4so326312a12.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779868; x=1794384668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
        b=CQb2yDYFAcxyGGz7u7syvPzZMAdvGU68fPbr2OQlIcLfapGtycojdEXXCCGaqhwbxJ
         +p93HZKia+ktdlMrtxniuOSrrbGRB+ke5pk5qNNwpluEU7PszTZH01ltd2jFU0mR8/wS
         SXOLSMoYIoxtZpAL6eM3xsuV/RvZQ1p6Bw4JL352lrun3SaykOGQvazN5cWkDOzRqZyu
         7kfJ2NaTLZJ/nv4s1lWkzAF402W4juEz3e6i9YcrvOD+RfXbWsH3DTuR2aI3JWo9yHRA
         c5F/OyDT6lnLN8+hOPo0elpJzKPRbBI54SPCOyyqS5m1Ez57BblcVrDFg5Cwj1M9/2Dp
         pffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779868; x=1794384668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
        b=fR0UbFlyRJZIMRzND8TNkYihAsQ1yOx3DvZAW39KoEHF9dL+7FOBFapQnVCA2h0E8Z
         sL7QLD9vjvlbjDBgGmEE4du6r1T/GSOqfeNTJI2yl9E5T3n+Hyyoqv8AvD8Q1ec61q4k
         Fp6r7Wd11m4x1xo5GghzGwQk7kb9tCBDsuqsRUegQT9XFG+DjkR7XXhxjMpD9emXNJrU
         bWBxUt09EO8AyVwVyIHMxW0XD0qdcozbBsWOPCkdL/QPo9eigxhiG8cJ6fULIWbe0Xh5
         Co/jcWyr65cetyvBhb42Jd/zYitA/a4efb7r5QPReRmqdQAkJe+Jb7z+LCgUPW7uVClM
         7rmA==
X-Forwarded-Encrypted: i=1; AKwUvBxCi340zmVVWKQvCioChkzhZrSP8Vi1OyAG76l2GeNoj0m3/iqD5ElIP1OWlcBJP5ctu3StF8P7Ypzu@vger.kernel.org
X-Gm-Message-State: APuU4Z9lWxuRGiHsYC3SG+kw+VJU1ijI3bi+Br4Kys/TKfT1u/29FBlp
	yLxQ8krLt5TIaE212AqwHdOsTPMGjwRElJdMkLJHoxtPv0gPvTKjycREVi2EulqpA2anSEX2MsH
	pYa1HQcuMkLOJbChAbCbXTH3Jk7l/RmRvO2ZiHaFj4B/Fv8rFG8ewQ0+hEO3i5S4O
X-Gm-Gg: AYBFou13WILt+uhdKCzZV3DQrq3NJt/QNVMpoT+Am+yjMOZE4xfhBBxiKVlDo0Nsif6
	SNyHlC4PEjEeZZOq5Vv0UShgBx15uQVegLvJXpDz752/Kd36c1KGKyqehNDI7KneXF7tU7GTlJ1
	a/4hh99gjGfgLaIdaT6hKqKqMKGfK067ROQNvdJyjKySK3PtcPpsYpSVJBtaOlabVSnS+3nBee6
	WmLhsX5tDtsPX9MQELPRKtqSxREyTiyWQ0C+80MeC/25+Sq0dbM4jhhVznVCZxZGSE2YRwBfOCF
	/7Uq2uGgQtbe9jgAQ7Nf2yQ8BakTco9Ey7PLNKcsFqEE7+Vl6n6TDYalC5LkVVSWf/mpMdgJ9KA
	FOBiLwiPc5xt2JCIdlOrO+KbO+Z064cq356IuCyhkKW7zV3scGGwjwTqCfmfZvlcsi3MIXb+Boc
	Hks+y7/ATwkg==
X-Received: by 2002:a17:90b:514f:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ae897e224bmr11430312a91.40.1793779868316;
        Wed, 04 Nov 2026 00:11:08 -0800 (PST)
X-Received: by 2002:a17:90b:514f:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ae897e224bmr11430278a91.40.1793779867692;
        Wed, 04 Nov 2026 00:11:07 -0800 (PST)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm6089920a91.13.2026.11.04.00.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:11:06 -0800 (PST)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 13:40:48 +0530
Subject: [PATCH v4 2/2] regulator: rpi-panel-v2: Add vcc-supply support
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
Message-Id: <20261104-rpi_reg-v4-2-3578e794ff45@oss.qualcomm.com>
References: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
In-Reply-To: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793779851; l=1681;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=QWiYTLoT7AkiN37vBI/AE7LlJlRi/CqB8G17hwaEjjU=;
 b=DVVLCw4My7UiHN4FMaawHLE6nfj1PEFdkTtDbGuC4Uc8xs2R2kBnhY1R2CXl59nV6prVtRdwI
 MNy1Pr+uH0aAnwZmZJz/05OZFSF14PXJ+wjAgHFDCkkHC+/mCBWii9h
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-GUID: QTwogi4hPXGDL4_OTdG6qxuY-aYEbCtV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfXx0Lx0vb4AsOa
 BCPJm3Sp9JN24SQSKTNoSlsCRvNfhPHPCNSE4bEZQOtP7aWWPgFaigI1+C5K5l8KYMoFpdtvpr8
 33GBhCSYJqHbf0DriEyEHCYuCKkXSQekRzki7CPwjk3Q2VhLm7Ux8WrATp4TTuYBQuTOrnwdhe3
 Ep//OQPIxiX73sUmlznnrSME7oe7Hei+2dln4HVPsgM2cdmZLPSoV08Lkutt3157CjabISW+ONK
 tkXMFUTZ89wGB61lIJPdH0kEcLAHpyo5z7rNPIHE0UPh/kZ5Wk4XYaDlsBUC4cAW3nSShpZnul0
 pjAom5/3Uq2nlm0vbnYdghvAHroXVI2VWUIC5ZEDNFAib08HS22gqFZOaWbz4IxKabVV2h8edjo
 hVXIT5Aui534yXLPFN+gAPso2dMvXcve7nZvsCYS3MRjoe9Iyf0yoSmxSlPXKMi0k8lu2zDPYqF
 rhdbUcm7HYLwpKTgc3w==
X-Proofpoint-ORIG-GUID: QTwogi4hPXGDL4_OTdG6qxuY-aYEbCtV
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeae89d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RYO69U5GnIJllgjd4B4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfXyjFLGp8RvQEN
 L56jkP8+SmQ8ZKggXhwhu8CgoKbCgXFzhJJdnfeEgBlFDEgf6jIXCVXzJFw88ZScGrAPICuV3hv
 fPm2mqXSBsHiJL9xc0Kbmg6OL+ReZ7c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

The Raspberry Pi 7" touchscreen panel V2 MCU is powered from an external
power rail which has to be enabled before any I2C register access is
attempted. Use devm_regulator_get() to obtain the vcc supply and enable
it at the start of probe.

devm_regulator_get() returns a dummy regulator when the supply is not
described in the device tree, so device trees without a vcc-supply
property keep working as before.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 drivers/regulator/rpi-panel-v2-regulator.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index 30b78aa75ee3..e54d675962e7 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 /* I2C registers of the microcontroller. */
 #define REG_ID		0x01
@@ -66,10 +67,21 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
 		.parent		= &i2c->dev,
 		.reg_set_base	= REG_POWERON,
 	};
+	struct regulator *vcc;
 	struct regmap *regmap;
 	struct pwm_chip *pc;
 	int ret;
 
+	vcc = devm_regulator_get(&i2c->dev, "vcc");
+	if (IS_ERR(vcc))
+		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
+				     "Failed to get vcc supply\n");
+
+	ret = regulator_enable(vcc);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret,
+				     "Failed to enable vcc supply\n");
+
 	pc = devm_pwmchip_alloc(&i2c->dev, 1, 0);
 	if (IS_ERR(pc))
 		return PTR_ERR(pc);

-- 
2.34.1

