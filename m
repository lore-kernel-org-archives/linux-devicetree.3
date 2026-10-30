Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353246;
	b=o1v6v7hlLccIzNcHfaE+6C80i6xNcPDB1pegpr0bkbXFIV0TIgF0P6UBoA55qI0gGF2c
	 p08wKDHbEn7wpbSl6zUqFxkKyJzETNlYrPwnE3xVxSa6PO9+3zJiy3cTLWPRmmo0ehGTn
	 ozssmB/KFXlClNO+Utc1tDXYW9Bg1wB90pca1icrhBUf7XiqdsEkSmfliOftEqPTYGaPQ
	 HiuhTAiBzWWexWjwOsAfU1BI+E7KsBczS9/eUVKVcUFi6ynq136tYZQ5cQBcy27jEilCj
	 Qy8RRgdWcbW2tJd8ceXZK23fdvF+xYA4HFxuavygmXVbQxFVJ4iWp8ph2iqynAYySEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
	b=CwOJDU9QJDiPJT+tSWFNxx0BcIwNcLmV1hqmrw+uD/IYkQ3uKMn6jEYgWUyt26LXlPrL
	 YQ13VWkTPRVxsUFyXF/Ry2NCRrxwQebYOz8zSHixemFNQXzejI6qSc6ptzj7HjDaTsCKy
	 eFGFmpKnlBHHjLlZ7rkGTrjQ/qQRu1pgcDya3A5/8ZOaAXmKcxkgy4g5SnRYprPy5SfzC
	 gdmbZZbl32ntkNgn+arFGOWspq1giGGvjGNAfGyz5FqNF71T/b8g4kkPjk3gAsfl2rdRK
	 3o3ZUac8qRVYK+ytvrz/DURO45aLQv932X6yzwn4fBd1qgRREjW/X6PUZVceh/Hp9dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="m/07jegu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D/Y+51DO";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFE360A2625
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFE360A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m/07jegu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D/Y+51DO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8Exqd3737811
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=; b=m/07jeguMeUQJOhu
	wjJcd5PtT0pzOD0sTs4QZ7RAzgNPdFaUxQZHR3Lec8VLWVYcuZJYF//oD+YEisBF
	miGuoCCcUv2kVP+K5SF5iUu0CSGMGLqCShK1HwYXEKxP9WqBSbX33g7HP7LMKv2R
	UprtO1YpuFrIYX8D15EBuPjA3dYeC2Wcd+cN1O8ryBJ4X+WnZ5P6W5uZiyk565Bg
	VVtI+pySXNyDP9g8fSlVyaP2qKGgdH5SipYmLlRXK76ytssVoZISV2bjjXam3I4z
	LVXiDatkFLsOrhSyaZK1C5znsSKJdI1bfiIrAfW58pBGJw5a2B4akFfrLmdsm7z/
	rCkuww==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75278b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so802986eec.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353241; x=1793958041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
        b=D/Y+51DOfJbq/Lao0kArTWj45Ys94GTHeoMZCnGMY2WXDgXNhvWaR1zR/hfWBxf6rd
         76w30vYO4+rg4W6oT/j1lMwPPdtZsuwNTnddWgE4xPBlvI2fN1Te1PLs/nWx/8ecyIIz
         fcqN/ekdGuPNVKLm7/VUddV2Np7Fq4F4x9vMPFRhLsYuAid5nu4RJPnXkQ9eaXAmAn8Q
         Ek/fo0ClJYij7+Xq5MVsAc6tOi/LERMVpcsPc0rlzAdCmw052aetQMoay8bxFZfFRImr
         rQR5i4LJ4ZCZNeK4t0oq9hfXYod111N2LrI8Lq2Tg2oDErasWYMBHfCVjOB7fTpoh7C1
         /RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353241; x=1793958041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
        b=F9Udi8RrrzKiwhdaI8aJC0nin2/04fupKQqlmrjhIymPhI+u6PDmq5ZQF3seIeCUkE
         pHZt3Izv5RhjcBeR2Pp0i1w2Ey7E1iFHZIxrUeIN23h7GPmqllR02FBNvpaaBHs06dRP
         EQRnIhnthWJG3JMJ6uNULQl5a68H272vW4XU2fqU+dBHcjgCd+3Dfi+dYeHWOQcMIrlF
         +2TjeNPoNMdB/zYyoPUW2pfBdEPVQWJWv901oVifgHxZxB1bSLdXB6Pxo0RNjMGFEUbI
         LUZx86ShrMx8L+fPOgOSPH/unY1eB6V9bTKclqqhhr1Zayw5LTyk7sckiIJUBVHxTQVV
         linA==
X-Forwarded-Encrypted: i=1; AKwUvBx0gBiiI9ls99HEYLyL4m8Rz4Qhqid86HTgIBZm++DK+TxpqqW+RDNdaI+Bta6J9sP/TXgyx0xwbAKb@vger.kernel.org
X-Gm-Message-State: AFq9FYLQWsi7fEGcrHXYozrfE4OrlAY/kk8+F7JL3JGd7kqRbWlfPGhy
	178uNgSieW3xRFZ7BIZ6D7elyk+VpGMW1QeS+8bskY3A4/akry6ok1XZU3THkkgXLAZxtDEqiE/
	6vVrO90JCel1Gsl1/VDPoIS3qdxDNROgFoyC0nN+ZfkOd5dqz6Le7fIdHk9eurFq0
X-Gm-Gg: AYBFou08MwwenvrfiqoqZQErgHoG/hEoyIZlYndVeSMlIKlHRrGWaGmqW9XDVAdLN23
	1F9QyPQ9jTIpy7Zn+hOIZuQzKgr5I+W6D1EvuAwe7bAUhSjaCmxU9riqlWc0OashqDRer9uDuk8
	if6iH5m6y7QCGeQGOUQZgk5iVsj8fSyK1k/tqMDDU+B4X1y78c+p88aMgXWiTjOu7X1FwuURRHi
	DEvHSKYnp8ZX5PzAFJkWZGje9GskSG5VWKQxuXVqhpg0yQVvCwiz+6befeW3lSJMExITr+8fljq
	8y26sW4lK+ILJ+oGyO8/tUC9nBWARIryCW6G/cOTNi+eKg2T3zS4+dJx2tm2tKyBBoFmBG3wChv
	Xc6goYgUuJCTYQckHv/NlO5dmIz2gHtWiFFDF58ylE2jKUju2V+PvPxXyEmVTkEAI2vyeK7APsg
	l8Y7ym
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr2459718c88.27.1793353241207;
        Fri, 30 Oct 2026 02:40:41 -0700 (PDT)
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr2459671c88.27.1793353240473;
        Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:10:09 +0530
Subject: [PATCH v2 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
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
Message-Id: <20261030-lyra-display-upstream-post-v2-5-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=683;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ibeQtMqFX8c7zgjBUXuxtpUpCw4tiu7UXa9CVvzuzQ8=;
 b=xZy1v3yJxpgEEnp/0GEy3IHTrAvHzXOiPECRrvHRncpdH0z6F+MunUlikP1iD2jLtS9DagvwY
 RSOxQJSEq43C/5Lz/ujnztCihDlXO3zxZKaItM1K/qYup5YQQr+y0sX
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: IQbQrQ2Y_qrDeSW-LpCjtHCm63LUl0Iq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXxQfIHlFKE6N8
 8ziFUmvrukl0I7Saq76XIgVJPMRCtO/D7M857NDkU83g8YkjsF8ZrzZNaVp6Vw0RNyLmVwo1lYc
 rsSWpvDDNasHyGOfzipaumS2JanzTmSTjnw9qeyXCwdY6plFmhzZ/Jd4D/NRmX3Cm/0dk8oUdNj
 g32FacUkj5tb1dOVeWsDIhzDKrB6vSAyEuuiMb41axwycQnun8B+QkJ4169MaSLBIrSXpDLrVd2
 PNPT10mCBYe2Wh7TRq1lqB0S1euoMnmdiEPdd+utOqLAQy2lYb6dhQYAhbBQMRKJ397/P4kct/r
 t1IRYV31LUUBCQER/WfJaD07EJmnOiHTDocdlYhGqGUIHZRTXqgPohsZ6UHOxonFyIK2AzB1rpG
 GhXu7oqM8Vxxlc/As98+L/K6/OWMs8pbIQ593snlnzIDEyIlyEHOMEQHX8b0JIyPjFc6zzozKZg
 ewjleV7SeJrGBJkN8tw==
X-Proofpoint-ORIG-GUID: IQbQrQ2Y_qrDeSW-LpCjtHCm63LUl0Iq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX24dmFLd3INRI
 7Ecx4AScaZrPfwQ90WKiID+RyD74StsP5J2dJCo671G5JXhkWOl4nq5lEZqrB/3eaTuArCi/vV2
 XC/HAaCRrSY95Ptv9rxPk9W440wqNEs=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae4661a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Qualcomm Talos Lyra EVK LVDS panel overlay
backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0

