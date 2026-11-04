Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779865;
	b=j8k/mVSypUls889yZOV4RbYvh0jGPGvNLCDxGSlLsHoCzWv3agAVMRUVJSu4V779cXjZ
	 FEYsSujXJFv3j10JvyPeNkrLGjLOXMOeR/o6TiXJ8C/Q11k1n2MYsrIkkBB73Hh48qbSJ
	 0ygAYWZjxtP3dsKv9aimEdwdljt5uWNcAcigAh5eWLrdPGmKI/ZGY0l3iVZAIWhUwXems
	 HQVCaBsFpUki3MeNvD9NDPFlbV95f3hnBAqtAll3uDay3P/3ZtIY4/lAQf7WJSfUNsGrh
	 sPv8EpoxVdNm3dHNzd1Iobsr/+OAK4pQJ6prYXTgXa9eyEWR75H1V4fma0cg4L6Y5Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
	b=lVAm+22ROTW7Gbw59yHJYul+GPiAF9wP5taD8bqk1SL1wg/rJ7WPCib1g0iwrCNB6YFh
	 nZyKmt8RK7VQOpY6Ya4BrrdSZPE6KETnDycFbYBo7kDHoHFBwOe7Lgo+51qez88gy+Osv
	 hjDeWvDTRbZjrqbxdJxumdS7Jkbyah9hNRtx1RYq0mm06SK91b3xRT5uixLXYRizDONVR
	 OsgRAj3pFjkiWrKoUYvuXLdkdGxlXpk0JTUErofBdGckWKKRWrZ794DgGtubOdH/cfj0E
	 AU27x+Imuul9+bGyZ/W+iO9PTwPJxWPWEliBjoXOtZq4zcpgSYSSrcutV3lmL+mmnig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NhFvWHcZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1OYHK9c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E62606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E62606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NhFvWHcZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1OYHK9c
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43PBTE268165
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 08:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=; b=NhFvWHcZj6SlwuKd
	JvfrIHkJvs/z6RjfeDlllrPeTIs//bsd0MsKf8wOX3Hlk1iNWZOOR5bxMgPf9z7B
	TcrJVHeyrxt2fgdBcQGV95LtV0DKRYNu+RRF3MEuTiZcFXzCQYFwVws/kJE1jBRf
	Rd5SJ//knkFuC3DTF91/a4oJSOmCphZcYXcThugYmjx0avQSOpeM/Uxq5KxSBH5/
	vVEvXgvEE08W/qvlSq9EeK1gJudeAMw9RS3qICuZ3+0NRwsp3XIgDQXJ7IA8fI2u
	yAE6u2Z5zpoNiQ9QWkw61jnFAzIbQkwuG36a1gB0cPcHBLFuLywZKqQ6I2HLYcgt
	ZEJFJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg915m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:11:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so604393a91.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779863; x=1794384663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
        b=d1OYHK9c0qQovHNmao+SZRDANZipeyjgk55muT+2wT0Viqm9f0L0q2spVerit4wg7n
         BXPOhHrQtRCzzOW/E35dFxZ/Y8OC0B18yj10DaOChFoZsUfSwtBaiCsecZbKYoU7a0SL
         9+ALk5Rj4bBpuDQfmcYNm2aWB3GhCCA2OWjpkyxL5pPGlMNDg6PwDR8ivXr6glw9DljS
         tcHr9U7xRTxEWL3ercX8GCY4ieZVe/VGHw5W7j3U1yE3CbK6F0q0u4PyFF/GJ+WM7TzO
         OKWSLdbE2iDOQKoJ0wiGjA2FzFmj5ef+y5wcVcY5l/mM2Qy/nliby3e9qU3pxlxqPKVh
         Dx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779863; x=1794384663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
        b=Na+OvWaFCj8eppVZM9q2LbDQLTxt+D5m6Iulq7RrftXIFIaLsn0FP0beUWX68dZ0Xr
         TT7TmPirb7t+kzJj/I8yIY8OVUnQgcZF8VxuOjcY9W024ssWgVPH3JQ25WlnSZD0b/BP
         JMWx9lNTMlWvHc8XnG9op9yY5UAkMfU/th35PmmmPZFeiKrNl4WPf1WwrVfl37RaYtFA
         PfuThs3wcsPSH7LWBJDNZuiwy3LIevYvzTx3BT4ePlS1PjtNgna38wQnfKhmUc6uHeze
         G4VdLdvJrKoR4cPCnjMhWPvLIuu4Z8Oq8YcZa//MT0UmoPZOIfbkSrlEj6EbqEgs+iEF
         WQaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4lbDD6BaaLmemk5WN7Opvxj4v3+IiRnxzvamAwn5zSWQ1x79EAEVT6n4HTXeBgjWBeER3AdJXgLNf@vger.kernel.org
X-Gm-Message-State: APuU4Z+804Nljk7Rbo3HGm2YOF4xuSB7H4Az/aKFxpbfHE5jmJhnnhWG
	l3qTfBAt5jWZxywier/0UtqQzO9qqLbvsuwofUzqec71m0Msi06sGa4mquVt/hBoyLFlLVB7B/T
	eppyOfE7Pr4QU+/trBx9Q8n3OlXBlvxlufZm0iDsMp1cSKcch0rUuD/tNEMcjM6KK
X-Gm-Gg: AYBFou2YGIvNkD0I91Oalg3ut1Go/cpkWu1dn0/WO0JYVkuaVaHEufSyDJnFO2t9tge
	7aC0Tu/O3LJeYb3qP05nFHjpmp67I68Mcj2K4WU4IA2Pe9Ydc+ewKOR78phZ51Hij38ZTLNi7eB
	iTpKtgh99Y+IQFqe84J/zgHDEoufV9kRhKWVEc4+Ri9ANwXnUYkvMQI+L0P5DBrOfu+d6iUCypT
	tu4FdYswVXAc9R21WLMZR5T8DHoRUxHxrEq1E8woDqc3UrV+QuPIwAlea02pf35LkgD9+jR8NBZ
	mhKmhghKGf7+/N9WfISS4Bl8xHwloF21ctc9SHPHzALacPCQiWHl12MFYJEyPHI1gk6eOiG/q6l
	CZvyTkW4yEm4ylJOIHZtB1TGRoi+12VaavXLYRvlz//nM7TTel3OpOxzTWbgAB5k4iLzeg8agvo
	rcxeSg75cusw==
X-Received: by 2002:a17:90a:dfc4:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3ae897994e9mr11683460a91.36.1793779862711;
        Wed, 04 Nov 2026 00:11:02 -0800 (PST)
X-Received: by 2002:a17:90a:dfc4:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3ae897994e9mr11683435a91.36.1793779862158;
        Wed, 04 Nov 2026 00:11:02 -0800 (PST)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm6089920a91.13.2026.11.04.00.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:11:01 -0800 (PST)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 13:40:47 +0530
Subject: [PATCH v4 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 vcc-supply property
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
Message-Id: <20261104-rpi_reg-v4-1-3578e794ff45@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793779851; l=1446;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=hqNneUV85ciDgNcaZNEAxA4akOO2zgiQecHtZF5ZtVY=;
 b=3GMekl2J1cqQKWD80nY5cUazbaoIRGsNILCjoSkD8xTX4crMZswNM+k2jKFr8kY6vEPA9fD+A
 2NxAWmSdpjFAaOknzezzUyWmmgnkozXO01JCWdexBNZUv4ZRcMJufqx
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeae897 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=P5neLcC-yKLQ9RCq2NIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: pTpz_hsIw53xxZNlXJmwPuqBapISLzyl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX8Wcw3J46PGEs
 nzvwDm5Jr/EQzJTFOfZG5YCbM30QJ0RotexcEbKcCNyLX8vRuwaJtMXFvrPTE0VW2HDgRsgs4Tp
 ZkVLpA/Db9pQlyAAZDXZ2Q3gvhFbxUF5VX8XgWBrh/rNfYS8BZm8rNAKKYPgOUJSrwV2X3KMVzT
 pypc/g2aguYDcgNoXcL50BjpH+4ZcfuJw8zLjaHQA+2t8rvt3Sq6Y+1FiYfeT9ppAenJsubkgxW
 ji0oEjJ2kCs8tg8EX/Ssz+09hT1fmUtNXu+h6Aw2sGOK8NcaoWSu2eB+tNhlElRpx7vcZirv3Lg
 bVbgzd+lDUrS3C1liJ4+XsdQtUKwgMt1WXgsQ1lmJrej/5Tqk+MQbk1p+Ol6v3c5ymfhuqdC9T+
 AAXvjGtV7BjrEkt8W9ajbsCAhWF0HynxRa1cKKnz4mr43C1yCjsEOACzrnKPqgoovSE9bXcHNmg
 iYDt9cvaK4Dn7/DjYcA==
X-Proofpoint-GUID: pTpz_hsIw53xxZNlXJmwPuqBapISLzyl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX/FmL55Moio6E
 F7zQ5kyWronhJ0Yu1088LQLrnWmqpLnnPz7ny8m8WkIST2DlfPf1u2ve461k7FhPj5mN1zmcdA4
 w2NwzWR3QVfX9kkIym9DJdP4XeXHBfs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

Add an optional vcc-supply property to the Raspberry Pi 7" touchscreen
panel V2 regulator binding. The panel controller MCU is powered from an
external power rail, which has to be supplied before any I2C
communication can take place.

The property is optional so that existing device trees which do not
describe the supply remain valid.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
index 37b9ed371b67..3e2cbcad6490 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
@@ -35,6 +35,9 @@ properties:
     const: 3
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  vcc-supply:
+    description: Regulator supplying power to the panel controller.
+
 additionalProperties: false
 
 required:
@@ -55,6 +58,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         #pwm-cells = <3>;
+        vcc-supply = <&vcc_reg>;
       };
     };
 

-- 
2.34.1

