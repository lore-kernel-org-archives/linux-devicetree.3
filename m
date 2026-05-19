Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6F1370AEB
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187696; cv=none; b=B0pQ1sxfh7ZsKYmP3NCqTDKW9or4BlI+EylleDWJm8v5e6rgk3hmk2YLazg8RhWRQRYg/H0rtjwmylmjmtBd6bNBQPvzOIW19uBuCnSEtVE1KpAhr0moeY9f9eFib8GCGcQnBEa/DIJFQOhl5cAkbFepqIE12fpy1DIJvZ8G06o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187696; c=relaxed/simple;
	bh=euCA0V2vNy99npuL3Sz9Ok/lrsInKeUdM7RhvmoKnJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvkMS8XgGeF9zaP/6k5Z7GDUVfef+/o3hN25QcaT5tloLkrHzXVx6Pd8rPwaMrMoDvVn1aen25rxx/3IjORL+S06xUiRP/T/gI5WoFZrMchhiwEalmwb9TG4KoPB+2PbYeCvjBLt0FZRafGvehfixT2h8h/JIcoSk8DMiUGiGtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVzMuOKr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCTY0Hws; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVzMuOKr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCTY0Hws"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAEnsP2438091
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCNXFzDO2h7+P+JxArx5XVC6FfJD7Xne/Qq6iGe6fq8=; b=QVzMuOKr6LURXLh5
	HUIBtU9V9gHkYAoRIUCTFXeft7lAdxCtK4fbKYIuqBnopvms8SzQT1S7BjmU4O7U
	oUysQyGcz7qxekLsJDvfDUO1g0flPcPtwuemdtRZh9QkaSohHv7T8NfmT1edpUBn
	Yv3GMxUdvTCSkAfiknT2gLmkPMVywErX70MbZuD6rmQuVvK3QjQJitdGFQ6q1zHb
	jBcqntRXHpYWxV4Z/9gm3xBhr8g+hE4lzrUf0aT7dZf2FXjTr0JJO8xyd5VWex68
	jMeSQF5fR24D7mmIbT+jldSUa8MBCiMRo9jbn/4QxZ4ZrbKh2/EhptdAIwNviIjJ
	ULVHow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v4m23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc49bef6so70615321cf.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187693; x=1779792493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCNXFzDO2h7+P+JxArx5XVC6FfJD7Xne/Qq6iGe6fq8=;
        b=TCTY0HwsYhfobZpMi/ZZ/+g+BwOcWyi6KY005v233AHWxx57QlhgHfcRmBamQyHrWg
         n7MYpo0AX8V7u0ptbTIR/Kk9t8MmeHwkIgVN+FoIOeAzkr9rIR5EGCiCd8no1ZbMbDWy
         UrycjeZcIUmNamqJsA4bxDXMQWVlksT7mSobWrs4HEtMjvG7sMQByk8wb6o0yqbzAkAq
         lO5+AHmJsHJtsZfp2zTBU0D+Wz7YLOiMh8P/ko4p2uks+hrQZmQ71vKlFkHcHGfgGLLG
         xErmC0hDabe2cau3EEyOOox3GNBtMXOX5ZqXv2nnHhGiONQV1L+0dej5sbWGd00CnWwJ
         DgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187693; x=1779792493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PCNXFzDO2h7+P+JxArx5XVC6FfJD7Xne/Qq6iGe6fq8=;
        b=CeYZKv7HjI3tCQT4udqJ4jKkFe6mpxM6KDC83dzM8OilT7yI+2Z/DT5Uh9pPv2DvhS
         tfY/JrQKIICdj/yBHK8y43RWfuujvK1bIU9DbpBvZtbQGEaE36W9rXD59hDpuHYmogou
         BKj0Jazv6dT5H2ue1cPC6TKNyzRHs3Ev9a30BihhZpC0jVgdO1aHjIm/oxVLju8e1xze
         FkglJCeICyON+M0zqew5/hTVMbUq95iozdBc4lb2WrQjJd6nLpWUtn4JA0SALOeujqpw
         yqikJxyc/ShEmCKu1d6DpBLjf33UBJ3fcCkl9LhRFcRl8/ejXfo8KA2vkDYsGk1eFX1R
         YV4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8jC3V6kjQRWA5EcXD6PQLEmDpf20MQ7BuLqNGR1HsdtYTSkNlO/0s98XC0edXuWGF2RLhBynhSxEvN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Xeuuv0FAdFznTQSj6310MkwSLhQs26N6hl2uyjzlurlIKgdr
	0D0EEPkU1uuzBH6/YcM2/QahXZ6CFFKPuEtRAiwWMBQIVIcineq7CwmmJJH/Pa9kZ88o2OKzRf5
	SGPRxlbw8L+kij0cFhJhouV4n9kPpShYwMwjr8mXp973fPPFMYIWqlF09Y1G+EVQ4
X-Gm-Gg: Acq92OGVUG5VVmzdTpvBjlC+1WACiXcaECoDwK2atjwOMqGvFgO3coC9S1Rp545IIeq
	o5/gVWV43qzFOGXGcojWSEHJNb9hmWuC4ebqxuk28y+80Kc3A0o+qspP5qFECtuAKZOdJmWFrww
	WyBgVDrYjd9dvdfUa3ZjXpPvtgAQbyBd52Gco7JROjwQNNLnc8xgGj3Jxwofex0BPumUdpbHR9L
	oq2Be+opoJ8jXAIC5hcSbTxKhiscrZuyPa6UYXHB2ruS5TniZEgjs7XdzaoKe9rHA25iW+ydo4b
	c7I/KwvhiM23Bv+KoOyP5TQlaVbdH4bNHpAns6si2YgqeimpAm2Bj4YuZS+ASEyqNETUHYpCWA2
	LWor90OewFFB34/WrCVQWaxTfc/JcxPGW6ny2gIPaBnbYZ8CetojaZbH7x1DlZkhGB1OdEtjQj2
	xQz0+lN90VZK4v0tw2JhpsoTRwrcYRs0FFsV8=
X-Received: by 2002:ac8:5996:0:b0:509:35d1:ca3c with SMTP id d75a77b69052e-5165a007384mr257543721cf.5.1779187693498;
        Tue, 19 May 2026 03:48:13 -0700 (PDT)
X-Received: by 2002:ac8:5996:0:b0:509:35d1:ca3c with SMTP id d75a77b69052e-5165a007384mr257543381cf.5.1779187693039;
        Tue, 19 May 2026 03:48:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:05 +0300
Subject: [PATCH 3/6] arm64: dts: qcom: pm4125: move vdd-vbus-supply to
 connector nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-3-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=euCA0V2vNy99npuL3Sz9Ok/lrsInKeUdM7RhvmoKnJI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mMMA77PKdzfg1VT17mBLUrDIkUNpNgbkiP
 /ZlylI5QPuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1TuvB/0ShnA2khzSDza5ZyBlkWWgOJPBwdHerZvEAfMPQ60SpyCyjLa8kzVJsYTZmF28VvHoYD6
 IbyOi8Hm1em6hnnUcc0Nl6Cd7kD/dFrL+AvfjxNYKEh3/YlymqTc96eLIKteIWgTMyEXPEdK3BY
 eYgqIiq58TmpxWHZFYfdq3TJpJ3TJXfKIABlN7mFVxvLC2Z4SLPyaDWuYRHGDcG9yXTVSpWoPR7
 xV+5TKqlgl4S/ZCKMuZ3nCvN2LUS6bUIJhyFAb9RYr6blGNzValCFEujmCC3sSBqkZWdPSa4Ztk
 Ck69U2w36r4xMypngvkQFI6i7ZaaMuQjxBYYj42W5wbFNuPa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c3fee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4mtkvhgW5BEYFgMnPP0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: JRQloLhhnjhD4miSeqWHDApCJ-EwQu-d
X-Proofpoint-GUID: JRQloLhhnjhD4miSeqWHDApCJ-EwQu-d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX4++pGiy+3hPd
 swYqlSXGrOdFRJUuwp9YH6PXZtWVk05XMEKFJaYw/c3VdBYB6GYLM7lhkleJIF8v049gHipDF2s
 BGEdjFzDAD5mxG2QRSaY7ftidFwI0ovlRB+p+U2QNgMdUJIl3vm2GbLhZgceXr2ekgHkeR7dIak
 hG3lq1UADK1cECWF0BXNp+X11o7s+VKAlD4IYlNbVynsluaWP8+58woDwxGdAjcdxiIXvr7ZFyB
 6Sk5F04XVPYoSoWKjrr+LMxZi28V0H1T/zmjGvPxRdYfK0N4LMuJWaBtIh8z2W6DmDG5cOwP6YL
 wHi45cnJHR9xXgMqNkY+pxnoyjwNr0b3a2FcfClxI2oM3olqD990byO7F5+CINHKuU59gbnhjIn
 sR1U+nDrojkLKo+3sRt7hUKBR4eL4WnRdshwCEV9MwvMtRxuSb5bZLilesHH199PS4UYfI9nqkw
 laMmKJkj+tO4Ciqd8mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190106

Instead of specifying the VBUS supply as powering on the Type-C block in
the PMIC, follow the standard schema and use vbus-supply property of the
usb-c connector itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi     | 1 -
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index cf8c822e80ce..542e8fe030da 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -61,7 +61,6 @@ pm4125_typec: typec@1500 {
 					  "attach-detach",
 					  "legacy-cable-detect",
 					  "try-snk-src-detect";
-			vdd-vbus-supply = <&pm4125_vbus>;
 
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index da46e9d65528..4ace2d6c06ce 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -409,6 +409,8 @@ connector {
 		typec-power-opmode = "default";
 		pd-disable;
 
+		vbus-supply = <&pm4125_vbus>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.47.3

