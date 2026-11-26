Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678709;
	b=lYYUVYGahWv13UJn7FOmyUrcV6PbOlmquwVKw43JUNkDAfaC1cPlc7mlxcZ5HlKX5RF3
	 tw/WaY0C1580I+X7js4e/+IbrOubsmeuPEgV2BNr6IhT61itzqhWIIfsbsXNHuMxhS4ot
	 OSmOHJCOV0KMyPYyES6G1khdXme2vcvNMB4wICXGUUk/yut/RRm6C27zETpDj8P9J3fl3
	 wXGxQQwonH/0tCcJUACfqkru0hof1A27QT3qXvMLIosZdgPydxS90NFy7NeRfDY1wu8rq
	 gINiDv946TpFRGchhHPkgYDFlzw0CLofUSUzAJucpquNrqQk/bMzk6WTLvJD0EA0+Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=;
	b=Ncquw5ofQFpeusAmEYKNUj8gB0b9hBFLm9apUN0rbHSpYsYXt/DAcfNdVfNHX2b0uDXz
	 cHFEXSJeu9ViGclbO62ijvVeY4U2Cw9kzjIUBkcHAToZlD+F5+mI5Ov3AEDm0eBfibvfu
	 mApGOMgpncFMKpXnxLCuQML/7weGHpx6Ie+bVVZnlvHVkQJD5vFlrDhCqtJfb1TVmr3jI
	 HgihcJ2OoP2SnOYX+wu21BjVoFxlNFXL9n+9tugSnM+MjA36BMTSozvSWKQQZaJjlLe0e
	 XxqF1um7UGF654cBCKRaTatUUhMNAPXjMHeCyMc921LO9/dpC+YLIlpHpmqG9JrOoDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iOO6vOnI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPZXp5M0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F3606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A39F3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iOO6vOnI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPZXp5M0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AsQD2885505
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=; b=iOO6vOnIWc3jpX4c
	gjbIOzXErFehGXjcX89U/6ZHC9lBc5MtI3on007nQCyJgdjztLRe96wyAPkPq76L
	g0AW/VvqCMwHXPZAvQZelXSG1uQbM3XSLEqoJUC5xnlt5o1EvSytYmOZ8X+YU1sK
	wv5sWv/FrQC094KIPyv3oMBtYD0QhFwvdfHFDtFyg9SEYCfVK0xKXYJj9sk5NA+i
	m07SvmbWcrsUSurmjaDa00GRnlVltvcgxgMIyCdH/PFq/OOwSyFcaHmHTK7X4t7Z
	FuFsALPg2DtU+ZAa9CnDA+8l6BAADUUSy/8P52okxB70I7peXxhlr1nIEkaNC+8h
	wi/Z0A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rga9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:38:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8bfe396acb4so4478652b3a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678707; x=1796283507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=;
        b=FPZXp5M0lTgXamaAv11egaXWd9InWa961xokXYw0XoY//+T1n+fQw5zWAecAv5w73b
         06vYGBxAoHuU4SF27cfCZjdg9DAb906Fk7uA6dnxHeiTAKxCFO/FXg+2508LQrpgulLN
         UYzGCw9r+5VRjEiXt4YtKF+cmiGc7kL7xKKxKROJfQbTKV+zkhUm0C27ykMMJ5reJexH
         gfGr6CFKUZzfkw+UAY1Bu/z2SWcjbl26kFlqDvlUtI8iKzQMKRE5wCbedJcJq2YGBi4+
         +yvOZn7LACvNzFH2IFFg0EVS7slzPMhVP0V2foCBL9JVY5Q3dOWUJUVI4ilHPUk9dK0O
         kOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678707; x=1796283507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=;
        b=mpsIXxRXaMRa22LmLdy9bI1weAu/VzyxseLNNvCji87JsD8Jz0HRamT+iDmKE4iTor
         ZgNAlyRP+zWSQF99cH3xob82INua2E13kvZFH1k0BDnYxzbk7dbVJLMf8QWev/1fy2XJ
         OyhmURouv8a2NKt1oGZlRbgBOpOBHm6Z2d9gt5zw4oeHyIADBcqb4j7l2B6clorhaDZH
         yN4WJw2h8AftNx/hzdoQKSZikOTURH13GL8pMyjDIbgrM41cOIDSZWd3w59pdEzoaSJ8
         E7zPd9X+mvn/ORQ59cZB9QaRxijoEih7NwqaNxPjb2WmSjWkXallwlfkZ47Mhf96cgWQ
         yr0g==
X-Forwarded-Encrypted: i=1; AL+hErG1hHUGkXLHF5o+yE0rqSGE2sPpSkxqD7GGbTSRMBykvMGKEFxtK9ovicRGblUnRgaAAjXyEQBWhw8h@vger.kernel.org
X-Gm-Message-State: APuU4Z/V1tx0v9hpFAD+8ZYwWERBY+VHZxfYJI1VU8dP7VpNU1/anV9U
	zbEewyfhzm4qMmYk6mm/nJyYHvhGdk2XmSJMxe+VBYign9SQ1y+IiZ9k+iC/dpslguojzHrTxL8
	GjVl0b7qLVcMHbzrT9mXMz4HTCTcKWopqneELhUK0F22cQKhQrWytjSGP0B0isooQ
X-Gm-Gg: AZFdTZfP2TsodSZ4f4CUAprF9md0E66HJI2FHvhtN24yFc1uz7R4HusYkD6MWLddXW5
	U1hdSqGHeNoW5BiNqit+c9uQjn18hzyt9p1WL2HuMYyJcVYkJoIHdaUyZWRYCTGVOgXpGNJB7fa
	+z3g08h0oUdP7rrmTNZkYEJON79B1+nSlc6WfCo/geK9luLCzU1cI7duNQu6LEbjDQHCwl3U/jj
	U5yaAG8GcgcWVyM6d/QSyK3hzFTTAVmi8YhacuuoSWAzZF2e6//e/f9FpcEXMfuZEJcopmqclSR
	Lyi5s4uTtcnUk3XLPiFHmUbCcat36pRskZai3EDJ+649xqT+vN61ugZsEfk2PiYUY5p8wZDZ8/n
	uhLfEPgIw1pCELotpWjhNGLzhFjbKNG3IA23Qs3FhdI4BpYrjIjrfY8puKrJwE8AcXQtC9Cfjqr
	or96fR5GMK
X-Received: by 2002:a05:6a20:6a08:b0:3f9:3f64:9b9f with SMTP id adf61e73a8af0-4014d2549c0mr23111024637.25.1795678707471;
        Wed, 25 Nov 2026 23:38:27 -0800 (PST)
X-Received: by 2002:a05:6a20:6a08:b0:3f9:3f64:9b9f with SMTP id adf61e73a8af0-4014d2549c0mr23110996637.25.1795678706979;
        Wed, 25 Nov 2026 23:38:26 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm5042987a12.26.2026.11.25.23.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:38:26 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:08:17 +0530
Subject: [PATCH RESEND 1/2] arm64: defconfig: Enable Novatek NT37802 panel
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
Message-Id: <20261126-b4-jshekhar-maili-dcp-enable-v1-1-3d65c89bfe7c@oss.qualcomm.com>
References: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
In-Reply-To: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
To: conor+dt@kernel.org, robh@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795678699; l=775;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=ZZYbGuj3f2mQMixE9TOtkebXk3Us85AvqmAyOEEN4TI=;
 b=Pgy4FcCmA+T5OrU0DcgozrA0hYvJFN220piS7yBQaifoY/tjyDlz3VrWUXKG9sYyXqhaGnAhl
 m93kAJmWij0C45i3qFoSmXbspDPLHLbdGB96NgfmRU9W0dOHHn3yyEi
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX7//cphnMtqSq
 hfE48tgWyJvd+Pee46WLk2Tvw0FXwiQZ9IXm9Ew7hFteHbE4kXo71NxvNocEfyohfSpaSxNCs7Y
 OUDaIkZYZgo+3umzoCKfQXatHmXUlxPkSUGFIDn0UnSB2sGuPfWgGPnTI6qyEvvK5a1kvyIkgBQ
 OhBMq/TybB0i4abwpTEz3dv7GAyTv60kgyNZwwxCxiNVTXo4g5w2+aDkCQbbuRWC/9E0U9xmr06
 Xho55qZKIn4bNn+9pluFeTCTrFM1TD3heVKmoKFnFJSe1jRMYoBMqFk8vOTOVzIrZfBPkXqhh7h
 8taMApL/HfjbA6zrtITpM5QNijgHPeCEwkgLxb+NH4bxhzuxI89JwYBQawZ1kMgPFcB/b4fRzlO
 4d4emQs5+vs3ohg8XD/UGLyRhiNAJqvm4v3QZQTplTVd+6j9zRIo+fQ5SE4K1lwTh8hqwIIJ3Bo
 YpzR8sz9oxhsPjpZnkg==
X-Proofpoint-GUID: x77aoWUqOOZQm95m_ZZuorKzrcgg18Bh
X-Proofpoint-ORIG-GUID: x77aoWUqOOZQm95m_ZZuorKzrcgg18Bh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfXxB63fqiVUM5E
 kq4z0KN7EIZppDB9H1HhTfnPVFHCJ/1BEITVlm2htx1gW2CV3wkWGpssryqmTHPdjcmgPzu3MF4
 zsXCf8q6VwR9q9Xll57sSIIomd7lI3g=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07e1f4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NdkDFog87qYHnjjv0nwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

Enable the Novatek NT37802 panel driver as a module in arm64
defconfig for use by the Maili MTP DCP display.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..bdbc68bd9b2b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1040,6 +1040,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
+CONFIG_DRM_PANEL_NOVATEK_NT37802=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m
 CONFIG_DRM_PANEL_RENESAS_R63419=m

-- 
2.43.0

