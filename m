Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126947F2D3
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457656; cv=none; b=PjT5SqKWmG0H2CyFHj0OFGHTqEgXvUVvX+mB3yaSFUdcqzvpnoMQVsRvelckz0KGCz60P38SsPj8WwSHhctlLJbGPjJH7jB24t5ksh1qCyM22gJrXfjQywSVW68MoN/vWaXPaEFXvP8qNv47179EhjpHhSsgL5P4PPY+3GLd2qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457656; c=relaxed/simple;
	bh=IIOYvvyALTUG5OEiqhn5NfeJoZGdRah7bahBexEevB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LnQPw4ewYDLFV4ccssFfUnMHvX38kCvWwoPxgnNig6PzmnJ5hLKeTetsLOeqLpGbmEOAC4pWe8mftGd+z/jan5USU4ENM7+ya9kYFN8OMbiiKyEKxm0XJT61aD0CtBWzqdy5VHXOMrrWz5iDtKl+3FtqJooSNZWdzrolKIIUULs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVkq+4Py; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyqnE2RI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVkq+4Py";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyqnE2RI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbMUA2609118
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 11:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CmKdk7qhbKZD0yxrnAv49ma5jpixmKgDnITWoYiUaeo=; b=VVkq+4PyiqgFNTNQ
	QSVrgaOx82iN4CJvoOTugfBp7ZkORDePaqXkq3lCNfEWmr07lfOFkBBin0SIHB4B
	Si3HIU+oY9W36w7U56bN03VoMfGPrXXkSuV7XD/yu6zoVwPd61k87LIAhBExWdsb
	EeqfKLkBm5CF8/T4XKEks+wrl1/fZUXc89Xn0fnBQtU+hHXUtfcKHlRlOgbeTedC
	7m1cMKVnxFqqVVfdyBtt5a2kz9TKZbrqXvgpXPBw3I87gdGgOUZYe29LXGVTA7h6
	3u3JmV77k+EeV3pBaKeETkyzip9zo8gar76agFbPeKKJ3GMgk14tVQQf/yuc8Um3
	6YQJUw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tq7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 11:07:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc44d708055so6324525a12.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 04:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457647; x=1792062447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmKdk7qhbKZD0yxrnAv49ma5jpixmKgDnITWoYiUaeo=;
        b=UyqnE2RI7q6rEmRU4hrCvc+dZsUsnida36J4Ghh6sw958sPLGATgmV6lsUKeQcH3vc
         umIRDt2CJZ8R+8Sv6cXW93o7UDLv87vPZlEGT+7/38XVWtPWxiFEZzGXq3FwMW/3GC/u
         8+BI2sY2aOEi2ybDyDasQ/5pGbEcVtbBCshHZ/1PLins1VVrSgKJf4JnwfQggmmPSkgP
         4xYfkgVdDhAZBndlT/iWjNcRIql7jrCWmdbhuQuprXq3ulOutFMQ+LtZxFAy3i6KfKrN
         fUvt1cH4krITeybb6LBUBfAmZZSBK33PZmyZoJ11lmS4dd5PIYWA3gaBPv+tLUwNJq6X
         zlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457647; x=1792062447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CmKdk7qhbKZD0yxrnAv49ma5jpixmKgDnITWoYiUaeo=;
        b=Cy2GaKIvB59V7/SAkkZv+tI2utSAmmzr58jZ3lHVyNGdVz8wC2pdTnz0Rau8Xj4xrA
         Y0cEiuJX7jbxQWAfLR1m+9yPwtYzGoHRTtKxANrkDwmRsTjVijRNnc1DHfCDT0aa6NYk
         9g075O2TWZ1xrYITUYhPAx6xCCq0xOTluMBUAJ7VK4LOQMuKhSahHwP6zIlquuIGsB2l
         BhdSFvf4vJpjMxkwc5jWf4M1wUdSTUre6klgv5VjQEqy42nlz5zsuQHybhELtGSOJ17u
         CmegQenYujWueVV9008tsTWiWIJd+suZVD8cFuaFE8KbQ7BtAS7vaTHVmQ7K2Rp/l/8R
         OEVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgKMTw5lqTmyyVm4x23QnE0nF0nkdG0DkR8JvXLVKzhmQbNtKfZ9813Jh8u+gueOxb6ppNYrcF6pad@vger.kernel.org
X-Gm-Message-State: AFuF++mZHHf2rL1lMugb0XB2GvCL4QASoZ5OM8yerz8f9J24D/oKLXnP
	8/aQA3T6N3QqxSOY1CUguxabJDWHjfDD7t/npTBFZScMywqTK65acgiY7S8b2HvoazzsRUKXfi7
	Q3PWy4BWlONAnCJewNFQTPt+FvLsNS7qHlwmjYrbuyx/aYXc0Z8pzwADv/cnOxeWK/55zTAdH
X-Gm-Gg: AYBFou1u/EQecPC2fizrXbYlmAzywB8G5tyZjm6u85NRggAZOWQrbE5SapA4jpnSMVk
	jK8tlBJbQlv4W04zL2kqQfwKpJTW0ptyBmkMZDM0Yb1k/q3d6sCQwzDSUtdI3GHpc0A0WfGbYQS
	9TUR/CQqahFAJraY4tW9fCRg9MeMuXhFytCysLypf8K46ny14YBnYPcKhMHYTfQpanYw7+Arob0
	D6SJwv3Ib6AaO9gU3ApikxtgjYy1zyo8RIVdm30Ye/+m4rtJ5c1yeYKCqxmJHeLC64eDwT0BqIG
	A5ZQJt9kYMlMsm0GhbUY1iBFkbNhcW3Ar6clkokOooPn3YUaepUMfQGi1CHwCDFWlVapb+HNVda
	qf1KVN0XG6o2inpitbnCS/qMe8oh85sAqTkHf
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr4294486637.30.1791457647307;
        Thu, 08 Oct 2026 04:07:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr4294453637.30.1791457646875;
        Thu, 08 Oct 2026 04:07:26 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:26 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:36:44 +0530
Subject: [PATCH v2 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord sound card
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-4-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=957;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=IIOYvvyALTUG5OEiqhn5NfeJoZGdRah7bahBexEevB0=;
 b=lMRtNXkMwmKTW5qGmC4AwfR+ZaCKriQdL7Qw8wmr5KDC8GawWLpjaWKcgMPLaAsT1rv/OHml2
 40nQt9hiXDVB1pa6auNbnoGY9z1Di8cITbPm8dBQwtpvVysxYCg9v0x
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac77970 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7YRCYCP2VF9Zukq8dE4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: QleUwI2Io6zpepOuqT89VCZGSYvCkxQR
X-Proofpoint-ORIG-GUID: QleUwI2Io6zpepOuqT89VCZGSYvCkxQR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX4WCu6Mn6D+OP
 l7Z4z0vq5o1mcC811k/hn3GDnAbwqZ9VMHYnJJ34MPR49zwHsMSW2VE7SWFhhxonU9sFlsK+d/l
 HzCYX4Xj36mnWnZEAlJWWvTiYtujMkQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfXwDw6oW8L+cpl
 ZOibA+Kmq/jft7jpfbPux/n2/6E1Pdv6u3wwwDUuwlwNJq83DRaqGXueYQW+MR1gf55b5oVVsn6
 n6vpDS3wREL8XgZtKDF2hzb/GHJs3IiT4UBDkJQ91JNCTijqNMx4liTgjkdBT0vIyULD1HNCaNY
 lX8f6qIWLSmDBNz6Ulwwm9TwnfwjZvlOWCEsY0SZ5B35UNc29zoHYHUN8zVLV1vXiKncX4hn+o6
 ReVBjoo20HqZ5R26GCezmuZSq4A6yXkE1P6WyiSphUP6Am8+/jInJUEP8sLNeWeaP+yMYdZ/gZ2
 rfj7btXM+Iqf55ACxezC3aRswhPr2/Xm+/bBCDV7SuIB400WVEZWu6mljk9qf6NTExxADTefXXm
 crYncPzylNT6U7S+hBbDMVkA2oI1ZTBRtBLIDCUsRQoabZWJPIeOFpb0fOdaRaIGa4IaeFJ5ot1
 gFdvAJ2sxIdtQLlW24g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

Document the bindings for the Qualcomm Nord sound card.

The bindings are the same as for other newer Qualcomm ADSP
sound cards, thus keep them in existing qcom,sm8250.yaml file.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index fc7bccdac..372919ff9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -38,6 +38,7 @@ properties:
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
+          - qcom,nord-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs615-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.34.1

