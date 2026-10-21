Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592563;
	b=NiC0HYPRTQ+QF7c1gVW6K8tXzg9XJXYNUtgPDs7QSnhKImAgz7GKgj/jgrkDkpdNzjVp
	 OTAOQ5rW8nkSbFiWANRhDFwBUadMf5mOCVGJIPT/Q4QjNh6sr6eXn9H32LBJxPHBZTStT
	 41qzDY2HrF7uOkm9s4BLWhQPtPGYl/iMTVZp5kw56HJt0ODhWrec6vYIWhkoR5+CP9D74
	 YvUHBS45oRV87bYt3kzdkvouqy0VxWKJLqjEzuYngES4f3+UMp1M23FBE/6nnVOEsw1Vk
	 IoyXZfc03x2XksXb99+U3uKo90GSZm6JXnf0CBhK0Qdr55wyOBAJjcMJ1iQhkeXpA9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592563;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
	b=5bvJkEDgLRY/LfqHUJkAurS6H3id66m6sg0ggiuHdjtI8J7U35fmsxFoZa+H8AtyLaPN
	 UEUvvgvRbfBJfCwq2EkhcdTViOzx332xc19DlNHT7Av5ePT2FDNbjGp8qPwkMitBkr0pX
	 GGho2XCj01JG++CmtdAuU+1S2giZ1vxUMlaOsUwerKkIxb/OYGA8LwM/1CpXRxgaM6Wm3
	 j22fe3PzYuwHErb51PPrhc8zvKy0k2KTuDyJB2GBUCXeeUm/2mNPaE7rn7khjTvSEPJYi
	 aZjn4kNPw/6QozCn4eT1+Nw0NH0cuORRbcM0g/RHAr8BZf5M3G+6VjoFk0mC2AlswDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VewUM90t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdiEhipY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0985606A321
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0985606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VewUM90t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdiEhipY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEExMp876693
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=; b=VewUM90tac1EJ1iD
	u2kspP3k5ottnaeCKtfGoIvVN6yjkn6NOJG/esUL6PM9njmP4XpFo/u2YgZihGXL
	SYIZy3XhPjHiWDh7foq1K0xW34hapKkLbNQj4WwTLjjYoz8k34D6zhzQzIA/vlfT
	GwVAyexTgrJmByVkds4JfQ0utjNUYbChT5mz3HQicLdfVMfTzDHtojEpLMqlSK0E
	oy+jJ3fdqFtHqwM8kJkaeZN13+Ut4JQSCSaWFdq8pW0jupPNH9tea1J3UzvwlUt3
	e1Kvs/B8WA/i7p3VP8WLbGqNeFj9TbCoh8266hbvQUFV4n2BTbM2SF5KKnOQ2rfR
	3pcy6A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj495dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313c7315becso117107eec.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592561; x=1793197361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
        b=cdiEhipYGI0cVc8bc20oXkv6yENguEr8yN2iuyM81zWodf9JM66QQ0wwv7dozhd2ps
         wZ7ZwdVb0jyixJjSdBXHl9UElg176Kzw6d+8m7RB0oKHnKaFuZtRNiKyQVy8pn66JZcS
         Mi0wKXP9AR3v4rwQiw9Uhj9k1EVCcTwPxerF5PMkWOdEP2BfimLAogwt/V32pNXjEf88
         qgrFUrYFRs7sOlCo8QACO/PO0dTgub9wndWhqLnsyTIqJ6i7v2nZiOH4UoYHFhBM0J1U
         WammE1Firrb8jjitaMd+shq3k/Rtv7748gMdIU3lCp14maB8hj6DuEy1Aw4tPU+j/e8X
         8tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592561; x=1793197361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
        b=XFxxt7/h9DxJF8jisVyaw7Aw3JEASWHpH6af9mS419FqHI6s5zHEpTfR2/lYYpeYdQ
         DQ+IggbkLJkZjHQAM1U9drp9CrVmsEv5xSm3MAeDEUhwltXw5jUwLoZtPPMnlFt7eXzm
         YthD/pjXaBEzsSzZmfRXEAoHY+O2SOcNOYKfvjRAjkPnti5NoRjOetYwJSF1HkqM5p5U
         +hKN8s+kyj+hCmaUspFYW7G338iZTaUa9xFf2TS1B3o+YG5BFGZady7abY6myLUIntwx
         sNUBC8du/esyD4gTiuKYfvypxTs/YlEuLXmdkJKaMHB6C0C8j9ZPdb3kQQZ9zNukHBj/
         KE4g==
X-Forwarded-Encrypted: i=1; AKwUvByhxHuSPpGQhkfUVRVWrZHLIY7Jhs7rXwdoT5B9m6p1ODP42ijqb9Jss+K+aACf5oh5sNmjt8LvkXXf@vger.kernel.org
X-Gm-Message-State: AFq9FYIj6wkX9bIwGHbJYSgMLBsWqHMwsbTwuoPfGm4Cmx+LkFCchTzE
	5ClaUooAmt4dhVjxsjJrjVXC22+ik+BA7wz+RNqPdU+OKYyZ3pv0pyC4zkTqMWM1DVphDmMYtw/
	F+qbOJsmICMXlF7yd21tApAPC12YInjw9i0lljAllGRpb7Dip5lRUwgrCw+aghWlURk1XZ1vT
X-Gm-Gg: AYBFou1HZ5r04/iXg471tZH5GC2Ry2d8mUiuRidMAhBBgGPqGYIqK2RuuIExqb6Tr9E
	TTKgVzT+tl+UJg/lisV3ocesZWmNUUg2vnVu8mQuIBomAEE6PvQ9OeKbnCtGeKW1b2oFDL1WTrV
	+o0BIXxfFwR524RppByTG26PkAHoHQEGkbNk8BYoaobjfz9Aqg46BdcqC1xDF8rYKSg4jHTr2xS
	xv8GqxRZOqNLCTgO6ZNZhtP1tFKH8dUaV8+5HMkdEe3rmQNGqq+pnw2pB+doe+oyUVeeVHUm78M
	TILTCwLRkY2mrvd6jUktKmpImkt69oh5HdObnzT4NEDIVZ5zMl/TrMFgdNixEC5jcaDzQw+7LJc
	samzV7DbJn6E3n0YUs/uII/4lurggHFwDr8bm0g9uVgSarOIpmIMvidIWtBlkyUSELbR4qctRoW
	E1zTGkoyKJi7B5q2Bm48Xg5Ibj3LHvWMK9lzNKyxnE0+eKRxZ2W6A=
X-Received: by 2002:a05:7023:a5c:10b0:183:d275:cf76 with SMTP id a92af1059eb24-190a370711dmr3992460c88.2.1792592561117;
        Wed, 21 Oct 2026 07:22:41 -0700 (PDT)
X-Received: by 2002:a05:7023:a5c:10b0:183:d275:cf76 with SMTP id a92af1059eb24-190a370711dmr3992373c88.2.1792592560306;
        Wed, 21 Oct 2026 07:22:40 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:38 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:47 +0530
Subject: [PATCH 4/7] arm64: defconfig: Enable RPi touchscreen V2 regulator
 and ILI9881C panel
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
Message-Id: <20261021-shikra_display_overlays-v1-4-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=1221;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=U8f+j/BLf/HSFgdLnfHMeSGonjaUCp8+bl//vReoFnE=;
 b=DzMMfaEXvKx2FFuZQfwCxTAstnLov5p96AEPmDFiRpSHF3LH3TYw/+3dMpqJct+TP4Xzzc2rL
 Py3tRE/V3FsDndfVbDG11q6MLSzHliassiWoyYADNnoENEPXXsXiYJi
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: kSYEh_XVdItMIIKnQ3PeRSywqGclF2CD
X-Proofpoint-GUID: kSYEh_XVdItMIIKnQ3PeRSywqGclF2CD
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8cab2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX59jvqGVMCw5e
 /CbU5JG9vWIe+/OgK9Ti+EUPoOGd3iYHsPGvXBlRFmSrNvcfFoVKbolr+Mu6qSeXxLt++Y05OPe
 kb7yVMXi+Rz1VNfwPn9IYT/KAm4cRBY0VnkwC6I5flOePa6yzPqtTW1MAdmmJyX/P0l04uNMYiV
 TDim3Q8B6moTBoeNPP40XwhKpOl30OucvnDqYLCZthOyiSub6+ixG2mOk9C3gZ2EWi68P083bns
 d4CgcwjMoQHuwIeeb9viQXfVzY8wUSJDu7uHLP33qY+c9s5snblz1H7yym5TbFko3G839+wm3XG
 4Zspkl4puw58V1R91R0Z0YTwpqA9/tJIdhMFU58mCDcJtu6leLhDjrCHnTlJ+YIcy7ZgWuvPEB9
 wJIDu6pEQJ+xSjqhaWjDaPHukGUmIfglfCFqk+9ZxeAPN8euu7kf7vVwzfvZiNGrDH4slLAYvZv
 98hZCmG88d2ebCcIa2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX8UY4WQndFPZ+
 4dwTzoJFV6bs9JrkAM6jlqJvfzVsjcgjGzmcLuSnV1GRa3NWZUF5h4SyIvpfwVmK1Muvndrl83x
 5pWu9EGcCLKRWz8rGHO6CQNSRFqZpaM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

Enable the regulator driver for the Raspberry Pi touchscreen V2 power
and backlight controller, and the Ilitek ILI9881C DSI panel driver, as
modules, for the Raspberry Pi 7 inch DSI panel on the 22-pin JDISP1 DSI0
connector on Qualcomm Shikra EVK, Talos Lyra EVK boards.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d18f72e55330..9c4c47a44af9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -900,6 +900,7 @@ CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_REGULATOR_QCOM_USB_VBUS=m
 CONFIG_REGULATOR_RAA215300=y
+CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2=m
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_SGM3804=y
@@ -1029,6 +1030,7 @@ CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
 CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
+CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m

-- 
2.34.1

