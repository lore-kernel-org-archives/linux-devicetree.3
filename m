Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430890;
	b=BkPWj1ao/f9dzNwRYHhxUbfMLsL/gxYdxMMKHXG0vnDMc0BR+FUMLHjbC7QlgKHdkzum
	 AfbkANjkuOv12qSTDilIMzcScMinCaDnnf7LqdvwM1WnH/25CpcYt5auq63xEO2iGXYBh
	 TQC/B9iS0T6I/MUx5WiH07DeFzxk9u8g+Pv0NEAtyxbhy0Qk3bGdmVU3LOzO1gOnhfFBW
	 Ws0H4LmDejfIWWvhrBoNL0TwWmRq44q0gXP/8NPeA5jJbu1/5A4Pu3N6jV1ZxygYed/EI
	 arHq/sc7G34l3EcGUfscfdt5J9GJGOPtguhe+p/EajkC4PYhN6DMNxVWomNa7KptbNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
	b=H+tDnEyYj4TU8IQwrlgNw0Cyk6XmOwt8oaKPVThv07N0qtIr2CtwWovlTNDT3RJCQTcj
	 infbSF2gBrbe2oYRjFwLuDr/fdfP8iWLY7mmYy80exIL50QW17K91gHQKU9dj2fB8fONN
	 /ENpfFrphohdGhZD7RgIYDdGBuuyucsdt/etEQt/s760Uee7tw/sHyRtHE47DqJkkXHYS
	 B3aa8RPmhRAea+VU9WMNRoOG9vcdxSPw79Gy/smsr3jdvZhL+Chn5nHZBVVsv1MI6LMW0
	 fCUT5wGqmYosOHWcFEYY42P/JxL9YZHNn2ugORGLK3cn8Oe6hDEsfH+nC4Pgl4nYWNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Zd/uHTvI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBWMIW9d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73418606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73418606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zd/uHTvI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBWMIW9d
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G46n1544557
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e4rxHmb8Mfs
	2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=; b=Zd/uHTvIdICT+UPLuXyWg2CSkE6
	82I3JHYoho6ZjBGRlAy7vgPsHfLI6PdSg4uz34ZCfwunmd56MRrb4z3SaPovarQT
	p9amf4bbJWW/TgokESA+/G5RA2WmLvUgJiEL/bK4yhnA6YUwDjwMPMnIrvLwxodJ
	MPVDybGz5UtSmb0DKKBFVDPJhS44LJcvmRLci3CbyBf4jNQeETkhEEkaBYzLMn3p
	pgSTmkmWncJFwK+Z9TDbLNWJUtQLohQJEpuu2zw0AAW8urVyPRyxslFXEqknYzJC
	gCBvRaAYMEVLpFznOqaXOapa2Koc3iFn/w8tIqjDr9gvBUK+cKlXWAi/Yjw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy011p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso2322650b3a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430887; x=1796035687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
        b=PBWMIW9d8wVVMtc5ke71vIOwqGX9EL2Ohj9DBbwULHGwKI0oYcBQEKEXS0lyliKNxw
         00i+Gc9Eb/K4Jj5IaR//NQs7eqFWQj/dPy/2p+UqzgoCgNSjKKayDfn+DMmlJaVbRzRS
         WbxkE6+CwknrIEziXzuYRyIJ0wtb9+XQxYOpYBS5pXm/jN/pHvz12d3iZOOQaiunQZ6R
         XXA7BFzlIZ97T2xagjxTtXz4+rsgAh7jpAN+9Q2Q6mrkVmxHQjpqh3EMhDRTqQFTKtE6
         onDEvVzA8Ca/ZxYcUmYuw5Gus1drooem/LV7Rsse8mEPvaP6wVuezAQQ6K0r83Gxsx9u
         3VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430887; x=1796035687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
        b=Tj/jBNuE80T4VJ9HwJCQawVWRBcP9+spwPhOoHAkh9Dyl6dz6zTlZd8yDiVf3CUHta
         +h8BN3ukrYLFgQ9TJFYG03XHa0EnCohRzaY4H4+MdM7JNyrnc0YSfx4hEGeKNM9ATqMJ
         cplkj7j0xF0+ME2AEXuAUeUWwZrRx1Evl8h2k7BRKrkBG1TDKRHREaAGY5MD6C+rJgAG
         YtLGCNFCbJruRwHQZEp72UkVAzlBIFK4+bauPpCiMVysqWwaGjCJHseUGGpThBhC23DY
         yaefM9s00AWpI4V1X4+9jOYl35FH8+EJ2u0aEIpoB9nldugbG601zqHwXjDibF1E9/kY
         2iyw==
X-Forwarded-Encrypted: i=1; AL+hErG4BnrY9OhAaXXe64Vutc2/gP2fS8cCRe9cWVNRUCHHyn8EkyPgANFAJyuJyAoloB8DRUay7/NALwkO@vger.kernel.org
X-Gm-Message-State: APuU4Z+EAILKp7UngNjf5Babh1cRxmIGg0nBEckpKzyolPZRtxioAPg/
	a7fJbCB68IcDg4SL0weMtkTNzTtt7VOkjF23Ab1f1uyPj8V89X8pN/8n4PmA8innwI+wSfPt9Fl
	WpaSB20KAKO5PDI397561Ft22SmGZysI22S9YC10awisoijSGCh71XRmnTNqqCpSZ
X-Gm-Gg: AZFdTZccrUDOnrOr7E6zJZo/mY4HiC09xl/0OaKCnc2En2UCxbC7jvgy42gG8wq3TFv
	KiZ+IgoMRyWgqknxGXL9lKdSQ1i7r0iJ5FBEGpHV3l5iPHivH3hjk7kEC/WutX+L5RdVhOtQfcg
	fixywkJn+JirKcZilU1NwLVoa8kcJwgS19Y2BZfogS7wiBaB86Gqbh3tsR0IbY1XOPhOTethLy9
	eiDyt4MDPtxylaqFziYM76trTQyLeF26fUVEJ3AiFNY1WE3eiAg8tgOa/Mox88DOe7U10Q6LHf5
	3BB0ttgoI3+q59PY2cT4qU17dV1PaH09sg7XywlZV1fd2m0qSu9cO+c7DnPRNt7oO8NWlTWxult
	/GnqV9/BlYIVEgyh2zqPV+srYXFhkBbUPJRXOaMuC7ZjSWhKgjRk+9TR4aKT/ATByRuORcxkHjU
	LK4BCBkw==
X-Received: by 2002:a05:6a00:3403:b0:8a0:3307:c46c with SMTP id d2e1a72fcca58-8c87cb4678fmr9206459b3a.36.1795430887521;
        Mon, 23 Nov 2026 02:48:07 -0800 (PST)
X-Received: by 2002:a05:6a00:3403:b0:8a0:3307:c46c with SMTP id d2e1a72fcca58-8c87cb4678fmr9206445b3a.36.1795430886923;
        Mon, 23 Nov 2026 02:48:06 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:06 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 05/11] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Mon, 23 Nov 2026 16:17:20 +0530
Message-Id: <20261123104727.1539149-6-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXxDNdYWHWIGub
 rnBm4zox6r+1im8M9A4l1l8mywiljZC7D5bqr6pe0eX0NshUOUCCYg18n3/GKBH9PH1wqyIJMQa
 QxoRGYFIrtMQG/58pXRmgMQCVCNUaBGcMsTKJhvfBUqEsZ41H7Pw8q1vDxn7F8kHdan0Yyx54s+
 JQEnSRJfL1QuSsFPVD9xj5vs75wbosMeHnHAZuvPsXmBeaDwlESXkjcavSg+HDpZegn4bNCQeUh
 FfkK6vJ5iIIfEK3GUxRd0PEftN6M1CQxRk81LJLrgvoC0jyGHzXj0P5vFVTHdVnRuS7R1s0bdnk
 f7uBz35aEFTYyin7gBuPtAzaQyhp04dVCqbhisrgfLgIp6j7l9vzOR+JBofT+H7KJU3Q6cPPzg/
 nlpFscjx6skmql0t+yWKF4gxQPf9WUGQPsdI6oHmiz7eHdDnajCg9ycRieiuPSxaU3Ia58rDQel
 kY0AYybxh1TS2ZwKRKA==
X-Proofpoint-ORIG-GUID: qgJqnkonTnBSUQfM_ZqL6OqLsh3dshn4
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0419e8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: qgJqnkonTnBSUQfM_ZqL6OqLsh3dshn4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX0qVG4hXmJVm/
 XQlW0s7DT+hrlXsrhYY5olOKXo+4exrK+mJJ0eA0nTPbG6LD4yqW1JDJg0hFhyG5zhNLXEmjKA0
 aiJ7NM9Hj/4gE51k/WbIE6zthQzTqvA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..0093ed24ac3f 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

