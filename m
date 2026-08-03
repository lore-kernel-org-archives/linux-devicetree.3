Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B029359A6F
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726947; cv=none; b=b+ATtr8+vxhR4mdgTVT42X7xN9pIdTFggpp3AkCLmOqnXBKqizbLMenK9Mh+HmLN+3R8Q8cX2suwIYeepf1s3u7IJES8NEojeHrCpEZ/av67ScFPI63xmcfNSIp3ZTyfH0JqrV8B0LniGH6bZv4gQH9/ss2y8PkgDNHZOtwoheg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726947; c=relaxed/simple;
	bh=lrzDg3DWlq31fhZW3kj/zL6U0reZsq/g1bOD8a0Dpjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cU6Jy3U00oHFkkECaYebp/KIx9xGmYz9SRCJUWc+SsNxbWwVvKhkkqNFc4KbPvlTfpq9efymOpXj770OaYwYiu95lbir7hkLIfYH5xrWXzFErbmWKC96qa0zZbaCd53mwaPMxZ4TIH/Ta/9UxmnT2quU2OSnDlIDF24WcGWKkGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dc8/243l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxSRWhNq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dc8/243l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxSRWhNq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVYOX2941302
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 03:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FvsgipU31nk
	17Fa4c3BK7HLyoHaUyZsM4m2Ma/Z/a0A=; b=dc8/243lRTePF6gfJSg+UiH9OVN
	ccmrYqGV8A1xCgOyoVRNGD0tanMa4JHdlX5DgqXoVrjRFRnPo9/QgwuP8rarKDvP
	LoP7dA5/ZXqdGcL6gx07ZvkFy3RIaWSBVPsIhH4Md+pY2F57iTpHQJU4pOhKZ6zI
	IZYqCM4v+68jrN5oDTScLVrpIZQGAgXj6CLuo9qVUTsmXdLKiL+HTIEj+Vs1TnBq
	XNIvaxIst6yOy64V8omXy1dnr2iXj+ZawMSzzOl+in3pRQHdZ3ZyVS39oyYU60RT
	1U+HtPE8d/AI816e/ITXAinuT40/+UMDE8ZP7djigpwIYp8nq7O+UaZt3fQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs911c84x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:15:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so4891205a91.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 20:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726944; x=1786331744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FvsgipU31nk17Fa4c3BK7HLyoHaUyZsM4m2Ma/Z/a0A=;
        b=JxSRWhNqADbWYx1Rkezb3ZIVowGsgLZNsE1/nK57MFxAMzY+EILZwNOvfdohbmNQsB
         nSNe4ligOcb27DYelzAHIbX9cidA6K+cnfoulI9rlArpuGIpf6V/hHMLTOlQaWuGbvAa
         hzVOXyKw6m3/2zqebiVBgVChDqvxE1IPRjDy8GP3yyWXtUs5777DlQP/o+bm+7FTdXhi
         96lweZYlwIzetZOYMBUWH9JnHJeB6KG31qzLn4pOuRvuzmeXmLYOfFiLTTkDqxo+bH3+
         YathJ0J7hV31T7+8zX2T4eb8SGMd0JtpdATiotXwu2gbAPO6YtVojy1B6s5NmYzdcrc6
         PWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726944; x=1786331744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FvsgipU31nk17Fa4c3BK7HLyoHaUyZsM4m2Ma/Z/a0A=;
        b=mUZ+gWvMiscWtXBL/Ua2Ln9A2Zumm8lPUtEGB79CcU1alHMfTO6AZIP1PsvmJESv1S
         FDUT2mIP7t6CPTulEU34YdhI2w8QMQYPCrJGUJyIMbTmTYzBe0pCy3z2fWMIwQD3My+C
         MC0dW6aRi5FdLfF3EoUgIu28hSkJEunT+STIdZWnB72Twv1wjYoWV+KsSu9tfwUsbv+u
         y2IvzGjmEd5uQ6SWf8+xNxhiUjiUPkkgYNG/0U3tB5IolGF+7HEqRXBge3cqkB9UNuoy
         uqr8/T3UFdKZWhAizb02lhcPEyMZh3IzGw+rAfkplTO4O0aXS95YTYHzKRE490rHKwFp
         HhiA==
X-Forwarded-Encrypted: i=1; AHgh+RrUpke12hu88duvFQ3BZc5pS4ZOHjjhQvRgfZ25yKUCgICTlslF5cqeh+t1Pn0HvCbMi1fvSd8LOkP0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxznua9maBJg3/TsF5S1rmZa08FEANqWVGTqqxoqC8rBYAhL4DG
	7o9ZrlOX7idJZsOKDZ7thYDLGQLA/Pfe4J1ADuD1oMx0cys82C7GqXp7xo8QWJPZi6m1KAkGDSW
	GEfXJkK0VM7yVWFcnfRommjMEbKzdkAO4+7KiQzzhUqAwelsNvCmwZexH/c2y2rW6
X-Gm-Gg: AR+sD10oXxC7FxD9RviPTY5vycDQGyxLPHQpNGzSaMMTuK5/BufQTb0MIHnI9aaLcO6
	/Vw5vh5Uv5sfCkfnCKTgZ7eUP5HVYGk+cXus/n+g61HoOHnITfKpUB1Q8vdeiHzUruUgJ/SO5A/
	aKu/htSP/qSOG5Wvj6xQ1XYDxbnsc4J7JZvZ+6C9mBE5oKxMjMBbGzorqM/nzDL2BKAGEBpKkuN
	+njN9nhRx0/PGv/uRRf/Tl/SM3FiMgxgc0zbcVl3HeekteAoiLnxzQWSQJ7fWYsFVbJAZBXtA5d
	YTUrsuN/zf8ERTc/QWCzEYVfC+mrSwO33zaQcV+6qBadrFweUx2tMsaKK0i6co+arZmm1YOXfeC
	4/epz99V1UqK4XfRoeTIRLZN5cFb9PDDVFZaqzSbXh6piPOegT4VQVQ==
X-Received: by 2002:a17:90b:524b:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-38fbc3e5c67mr7323478a91.9.1785726944111;
        Sun, 02 Aug 2026 20:15:44 -0700 (PDT)
X-Received: by 2002:a17:90b:524b:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-38fbc3e5c67mr7323441a91.9.1785726943670;
        Sun, 02 Aug 2026 20:15:43 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:43 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 7/9] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Sun,  2 Aug 2026 20:15:32 -0700
Message-Id: <20260803031534.2942628-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX6J65HYX6nxCk
 1FqetDNS+1SVKSI1UL6G+/vlfPdN97QsUv3zud8kEOi5nVSF6fi4CBYHAhJWE3g0aD33silVc2c
 84GOszdc17bnIzXPxQqTK7Wh7CSDNSg=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a7007e0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=oDIJ3hVRoRHbvujwG_AA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: mCJkgs2LYP3e47GUDI_EPnpOeOPa_t-v
X-Proofpoint-ORIG-GUID: mCJkgs2LYP3e47GUDI_EPnpOeOPa_t-v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX9ijAqjxBWAKz
 wkBQbsDJBTRLy5vge37D0iXTQF4EEidYdgh9Wxgt6PS6rPfDZlpM52L+qywf0IXHeGvwX/+7VNq
 ss3Z7saAAZBEpNTp43AV4npGAaqo06RF+/cprreq62ZV7ZiiqiQbBkwsKFIOmWH1kJbx5ZtdLUV
 uMQR3/ULVkxGxLpTnK2Q3NyVSCiW+QbWfHK5BR3hx+WNZ/rViK4iJKs2wlkluZSDqRt93KmODKp
 u8t28PfeyzZ8hhNqP1Emilf5dR/bsGEwXM1ryubpirRjQwQr/VLFkHXkAU+d/M2S+Pf240tnxMK
 Fhmy8sDa9D/R7j4WBDNJqznL1X4/A2hrfNMplqTGxcgRUMb+ADI1yYrFwyoxCackJ2XU/vN04Bl
 clI3DbfwK+7E02+vaapHint6s1fEQgWOj498PM9u/tt/yN8MXpAhHUPPdcfQvU/BRcE0a9MJOBu
 6kyN9dPUMz2lenYFQ0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030024

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 538e070cc140..a02f3535956d 100644
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

