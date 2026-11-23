Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458540;
	b=FWac3/4VcH+BuIGHRCcbBp+Z2EtYZyLWTZPZnL94t7RFHDVIr5qkPLVFv7wSSh/vHv9z
	 ViRy1DU9+9/li5MuFxaB7bKxqt/SBvc5pIyff0qAIVGWJeT6UiuyB6Xy+htaM/GkCMOGJ
	 ecVNZiSuhXN7pqIYRZ9DI14q+pch+58tQ9d+1ZSDns060V115GkRPQgiqGDf0DvI2lIWP
	 VXyrpfPD74XXn3M3ujm6VgrTy74ZGs6Mkq9s+Kh4B94so3/Te6GjY9zGXOVESLJmtPBFz
	 TsLuYDWA8avSlX/Dun3fnx/5xqMVjZaz3e30auKFmXW/LokPwEakzNSEO0W7blK5OAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
	b=ztFqRD1xNkuLZBrWtAWsv1s7ewHTeZ5rMQbgZDbtm17WL9H6+FL4AWFj3B0soXDEmAFN
	 TgJe91nmNfJ0Mi1lbAOuFs/QjGie32hB5rVjaQ8U80WgKYwRjjQUTNHri8eft/dWvA4e1
	 X8ql7QnXGEMbw+SWIhMK9ZX+XqB8QgnKV2tm0zffE1iAv6GO5DeDMoF4x9asySpa9sIk1
	 m4orAO8BKdi4ykKmtYIBp4p6nZbsse3uZo7iGjD8ahpJpqYAbMtErWaV7uKczFtTQo7zT
	 m6V26e9Q3C88oGEl2VVZ6xaUexQZ5AdgFjNFh59Ys8X0fysW7TArasc9E0VFMVGn/wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiNeKvG9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EGk2KU6r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177D160A2636
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 177D160A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiNeKvG9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EGk2KU6r
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH65l1093937
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sm66atK5a1c
	4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=; b=KiNeKvG9EQ/jqrIVLDZML9PSqFd
	DNln8baOvDpLn3OJB8cmnRSbWdB76Y3WnUVYt7iT2v26U/LoPivaZJVSQkW2Vhmq
	x8+m5MHoWNRp9LL51wywzfrXMTUuMBL6+ECaYVwe9Aa/x+dKrdH6dCkaNnnrTqih
	JapZSD3wCa5ZEPuRj2Rcjc2uewnxQGWCuNeMTJatoZg49Tka9EVhT+ej3eqp+rRI
	P6kTw5AHzuP1+Lvp3/w5KjlTweYLT64qLI3fC//U+qPOw3vwITERqqnO5iS3QtRl
	G6Dyr7WppUu0eJtNnsdQRtkbNYe6qqNuzVQwq1eD7NemUWUNFJSsvxJBxSQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0sspf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso5048695eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458538; x=1796063338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
        b=EGk2KU6r5LIh2u7O7gspDdqBhQ1Ebauh3zYfmahEihwkVZGnoLEh0yDxMFyWnYdxvh
         V/Jhdv65eSLYPd8z5Zha90GmCy+6+2BsTNMD/ty1ni+2kBtDRV31qSDzMZTPEB682fZd
         A2obY7dMgScrh+D6v7aIBBdLLpcYGAsiaD4qF89Zqy4zM4XLAbhtSSIGU4HkC23Eqr8K
         4LIbVN+cZdxCN38e5k5uweHAO6/ccQInT9yJDMzQaD2czvo7+U+fCGjZd3GgD1xo/S9g
         7uirdMMDUMLN0ipJdPKMadHeXmGV/LQ+TUOTONlOQVD+B+LiYeS9QWGJ9yDXo4RxEAUj
         kFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458538; x=1796063338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
        b=O4AWySt58rep8crK5Q/bKllzfwQH5SafpciqDqq0sZy4pCNUCWR+MXK4IamGZxRKf+
         deMP5w3rluSKmy64CvU7eBzdthDBo++nON7+VRhfvIfeozGQOM2a7aKQ/qCEuLO+/nhp
         lJusMB9nCdhcM7kC5Spj/NPFXU1jI0/5dl4dB4QT9D8J1tJ36/bOahgOLnkIHKFEUem9
         4Maw2G2RMHdlyTvxGcPvigUEFo4LoPMsXqNKouFnHzAEkcMkuxSMIypt+cbtikGo+xoi
         lPSwxHonMgFvOBuLy35SSeSrZGWcssD8KrHG8/uZAu/QAoTtEmLpaHfEMfQdFbXTPDuj
         bIDg==
X-Forwarded-Encrypted: i=1; AL+hErHUWYGROrKwIZUINNWnwEE+7NNP2HJtRzFmthQIgb2Lagi6GI63lAmLRjL32kZzJcPndS2zv3FcdNfM@vger.kernel.org
X-Gm-Message-State: APuU4Z+KQlvHRa41GLX7SzrYpAjQHCznd2T7g/Ii7a9SJmwwc3Me+C7S
	NwQMindO1Y2CFxdpknDPZI+c7O0a7AS946Vo/DysSaaEocE2yh8SnFVCCuXZchaTY/sV2V51D3+
	7IiIgWG4MnS+q84xwJ1HZfPt9RNjYc7YtWER0krLDVPl1MjHln9rdQlUTHsvXpWcN
X-Gm-Gg: AZFdTZcm0ge+UFmiq2GDy0GvuLDsipUR1h/eQFbGvww3zf/+MBI2HXEFNChCDVx57Yw
	p+q/ihp/J1z/UahQKaIuK9d9yzJppUa9WltfA41m6+jMCHHjULCixOMvyUK2jLsMHDGZ/5AnMpL
	vs3WLPar88lq+x+XsNB2AHIFXDS3M59i4s8d9Pc7YvduzbnrE+6MtPXMnURq95Nm8sPzf/eWiVX
	v+hKR/i6SOrWHm8xPG7YsVEy8LDJkKmK7iIvpHqFskB/vgwi8n/H4O95A1sv9g8v/3kjAueNl2f
	Wh3DwtJHfVKRkH5da+jitK8SH5cjPu+eKEmf4yQaL4Q2CtmqQxKUPhTe6o9kNnq8nkqe5zCfcxb
	bSoVJXBe4oPWARNCHzsMyTikIATVEC5XuTHkXa0CesxrwVNyDHBR8X0O12erv8JQNc9cbYi9FIX
	2DqWjoUN7uULi8NbTOschjo2HR0g==
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id 5a478bee46e88-386b2ac2832mr3423226eec.7.1795458537719;
        Mon, 23 Nov 2026 10:28:57 -0800 (PST)
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id 5a478bee46e88-386b2ac2832mr3423204eec.7.1795458537235;
        Mon, 23 Nov 2026 10:28:57 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:56 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 7/7] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Mon, 23 Nov 2026 10:28:47 -0800
Message-Id: <20261123182847.143892-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8jjZA8whvZspOk6PcdEheh588osOuK4e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX1yJJvNFDxumm
 CewuWfDJm8HJvjDrtay1CHYdpPSyej4ttHWuQsrYwwvm3EH2tjcNQoF1KEwyDF/qjL3x7anJPdX
 L1we0YQqsLgzGZY7NSTDTdURXRXK6B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX4j6nPJT/0Uo0
 cyHghTXtVZGBjz7OJNTwsgFvEzAxZJNF9WnK+hmX4jo+2TZmWJlzGcVYI7YJGsd4iXohs95NvEV
 YkB1o1KhX0susdnI7A4aaueOckEjHnSW+P/BkM/9kx2IKZ2XT/bmC94RyPBNF/G3WYHLps3qqo8
 FS0hon7osJYRcf8clQnxIY2LIREuaYvBAVJmXaPFyCk3eoPOF55Mu5pggptp/XGCuWTjXHaHswY
 KGgEKhmc8DFTwyW5GOPk1oBf1Pl05hPs76pAP5yd5QQXHJRg1FZLZfbIQVZvJP6LYc41FneEj1s
 j/DF6jeUDEhY4zu+AMsmIhvJOt/44B5PFb2G0eUeJ/wEtsVqiN4CoKZTCgr99QU+N888Wpoq/wr
 v3qEm0oSPcxwk3f2QFaPMWANkYHb55t+V6V9N/PdMKSkDkG+O+CSIB245KVyo7sDIL7T35OYvgh
 L8kPQakDAn+5IR7CIcQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b0485ea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 8jjZA8whvZspOk6PcdEheh588osOuK4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index b434b0447613..eba2ace4f3a1 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	path = chip->paths[chip->port_idx];
 
 	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		/*
+		 * EUD virtual attach/detach event handling for low power debugging:
+		 *
+		 * When EUD is enabled in debug mode, the device remains physically
+		 * connected to the PC throughout the debug session, keeping the USB
+		 * controller active. This prevents testing of low power scenarios that
+		 * require USB disconnection.
+		 *
+		 * EUD solves this by providing virtual USB attach/detach events while
+		 * maintaining the physical connection. These events are triggered from
+		 * the Host PC via the enumerated EUD control interface and delivered
+		 * to the EUD driver as interrupts.
+		 *
+		 * These notifications are forwarded to the USB controller through role
+		 * switch framework.
+		 */
 		if (chip->usb_attached)
 			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 		else
-			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 		if (ret)
 			dev_err(chip->dev, "failed to set role switch\n");
 	}
-- 
2.34.1

