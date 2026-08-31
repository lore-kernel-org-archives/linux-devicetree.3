Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBD2352022
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145319; cv=none; b=n5AumOlVTwf6cVivH4w/RlqN0DriFHD4BhkE4ObcQJ5w8VmrgnmO0MrrVXfRhZgGF32VV4mkVWbAnhMbQTOHelKzQSwVUxvmiWyAw1WvJDCFXirqgiLuvdXKnp7QHhBljf2bH/8i5socBLN0gmZOlKM1JhmdfA4Eko1U3VXQC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145319; c=relaxed/simple;
	bh=Msj1DOVWipO41oW51gTwfsyr27KLZriNHjyoIbm6njM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dSCHO2uwULSTt2w+bPHfryNvrfWLwIxl8dr6WwMJHe8l7ko5YK78I13MXQslSeGuiMiaen8Srg4dPl4xG/eHOJpeRIqPJ/kqSR7TBMIY5E80aeUdBdOc47z13jvmXQTCqLTbJKUZR1UdUYU4fhzx/MsYcBzucy/XozvLBxiw+Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Imt6HGc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwzn0Jb8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Imt6HGc0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwzn0Jb8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1c7qj2821114
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oEsuGii2+Ra
	6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=; b=Imt6HGc0AG/UqhSQQCuDFCb+NGD
	HBD0cwRhzfBgGiXJxy3XorwadI/1p7vQgC/Re4ZIF/Om3++JVL11Ss2D5A2XurE4
	pGjyZaX1cB2vVZL3GCCQfs+E16dP1wkJO3IjVu6JRfK4fNwl5p/vggKuVpwqgCbr
	FqInYKZG1juGu8kd1qLu/KUwb504ApKNaheWivhX4zcrH6ixWfx6lQoOMJwjdBK7
	8nJlUxWQr0Fm/yaAQQBPplmG3Af4PsTgsIeZmJwK/qMOSfOyWZiX9P1AlckSgyC/
	WnlrdjJbdxEvNkIszYulVUMcQz3VRJTnbTV28B9SV+K8x1pgDnuk76JB41Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfma4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so5093403a91.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145316; x=1788750116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEsuGii2+Ra6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=;
        b=iwzn0Jb8Px2K9rqul8CJHlGHfrS5zZ77FTUfLhfUEJBo1Gqw5tfnUj1Ygw7KEO1md3
         Unx3VpCGLOFp1UVdiXvC8n5ty1uRCd+vcxxxtqNYkt8K4dGwzVv1dNf11bXnZKo4eJ2l
         0xkY3rXs1XzPi+OUU9UV37jpk2WrXrxfhtR4txK4gKhFiz4evqGs2nK3+eAmlnluXouR
         ZZ0HcYZAUF207WVpfEwTc7nHQfoZGxG2s/Wd/cQh43NoYahPqfdW9L0wWge+N1tUcfPC
         PtucdCLzc1Hm4sbZTO3Wpy8Ay+Gp5WSM4gBGWu31TqVvcEwLJdu6gHGO6n9PSj02lg8P
         VGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145316; x=1788750116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEsuGii2+Ra6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=;
        b=Q4yTiUEovcu/gr10p69mOST7PilOnhU18DpsruW+MTW7SAchYHGBYwxZ3RYtZKcMsw
         6ly5Z2G7Vvm6xq3aiC0Qmbpt6OhUFCKAQojiYsWvPdixR+5xJHxk70HH8TzcS0k6If/m
         avv49t4Gffkd3g4pYxeQXbV1w+/BKGQZd/RRVuYL+0iq8OXq30YdUu3LgXM5AESJOcT3
         AtPYWpBZ+VE4qGYwEuGv8lx6Ed+KkNzgpJK1yk4UWjaZCZHl1CRm3LIFLC50Z+Lu1sNJ
         nIyeceSd1nvh9necmWY3tLBq42GJedRsqcQlIudMJJKL1RsaTQr9Yuwv+T2qhqM6Msh9
         7zjw==
X-Forwarded-Encrypted: i=1; AKwUvBxj+b/1D+MWs8Nr5xVJVOrLSNWADKsCXxCPGNlD3CDikKdYnlCbCLyoOCHYUsXkTxsQTrpJF8J/2M0Z@vger.kernel.org
X-Gm-Message-State: AFuF++kD0NlscNm7lJfkNz5udEDEJjigdG6AazmDaEGWrTSwrRpzpIyc
	IzhaxqX2rX80TW5jt9mqfnsDC16awE7FDljGJjhXQAUr32HQ/27EMargPunTIZgV31FMCK6pnEm
	dEIUn+srxPMKyPlugcdl9zP+mAwM89IhKnOGKlS5dpOvMtAmwEk766Vc67wbkYfZh
X-Gm-Gg: AYBFou3BDk9uianSI2G0pvIrwq/KjbkE5g1g8hqA0RRm+TyD8lQ+v1Vp08H1fQEZyIn
	wvuymSt5Ott5H2GGSSYLlxcGwoniRC0YCWEejCDb1sfT2g6CaUh5agC2y6MPRjsAh+vk2SxjkvV
	Eb0gps35c60CQta60eLHP+GS5MbJSJS9O6lp8zbERBVuP+7d6EwEwEoiaDICCRlAM64/9vJTZEC
	hCQ7PvMZR1BI8gjk7rykiINg9Fpg0bPWqvZldxJkeeqFhg5bmchiyxOY5l5FRq3gebCx/0xIbW2
	75onDMuKI3+C4+IKW9MZ5YEwlApIoDjWiG8yXE9TJmYqnHwr6xURPMkmrDlUyKUDAgeO3Of8NYP
	oK3bwiPx5pGkdu6cseCJuSvHH1hFqiyqkL0G1cHvAJpHGe3a/BoHM6g==
X-Received: by 2002:a17:90b:4c4c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-396d0ebfb0amr33823023a91.11.1788145316464;
        Sun, 30 Aug 2026 20:01:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-396d0ebfb0amr33822975a91.11.1788145315996;
        Sun, 30 Aug 2026 20:01:55 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:55 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v7 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Sun, 30 Aug 2026 20:01:46 -0700
Message-Id: <20260831030147.1500616-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX6LtlDLtGKkc0
 MVuDNY7/k7aLAKJ7JwjljAybOqVVWh5+9yyLCCoLPPAkVMmaXzQVaWgxZ/8pAFf6vYQ4aZauydt
 dPdvltDWd1uxRKZnlQXEn39HdyFRv0JnoDqXAxKZCAOK4YQnVlpAHuaEJ5Ia0X+EAN7Inf3J5mg
 WHUiAtbW0cNRlMZmFtGnObt9TN0zcgpmQARxqfFPGwPV59RpBk16RFzeNWWYzyxgCC/7A803lkF
 8rW0D+l6iZ4xr09TmmsGrndQq6LgBv4QptbaiZopUOPTOjrE2sbTTHhe4MsFTwrpY2ednms3Oyt
 PS3MoLLjQOc+Nfcy4YNMjwY8Y1CzwvrZ8vDH8jQM5bN+4W6iW2o+NOv9uK5KHiAPKw6ssVsqQ7N
 bZc0fc9NX7aRd+Z8WIDQPgI0XqZJZLK3G2nco4S6gBln3a7cUbr2dIfdyFzY6P3Q/e/xXWcDaIO
 REKNpDyeJDB3UTDKZOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX6f0Xizrsm8s3
 e3MZLN5MKMtnnj1pBH/O5sIYxKHYE4hTEtfFp6M6uJkePxjxJMtN45b09zrqzj+TzKM7CwCruHp
 klhIHv24PkfrXxiBjgZrKjb6xmBK4aE=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a94eea5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=oDIJ3hVRoRHbvujwG_AA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 4wGZw4wSuSspJoghud3EA6VStLT-eahT
X-Proofpoint-ORIG-GUID: 4wGZw4wSuSspJoghud3EA6VStLT-eahT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310024

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 549c0d852bbb..605f675ec7dd 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -306,10 +306,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 
 	path = chip->paths[chip->port_idx];
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1

