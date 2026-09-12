Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578813F105B
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253598; cv=none; b=HvopLZOsZ5NacdN3fWGQgHTgFTcfgbkTIl+aCLylhguQ2HlNWiC3Czdop2UexLnfu/n1mJ3xqEXGbYDm4Lm0tVrkMR9cGlODe04vkeVaKXG9uXToKMKHDDRnkkobalI/3PuAnl+s8m4cBq7rNwoI03MZGehNNAdEx+uavrdyftY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253598; c=relaxed/simple;
	bh=rzM7FDp46PONIU3FuZdRnR6emc1m2RW++R52letOKIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lIyeU53yOPJOLUlL/ilux/Yk9zTKJNwC5d/mnSHzmceY4nROHQlIpOtdr7bbd2+agD/FSSEuUpqtp0K6PNhynCjjwYBOsyz6Mxn/bpn9OxrUZy8pglvySWZLTvALUdwRTee+tEP15A7xs43g/vB33tvGTMsSudivthUh5uJavG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a650BmU+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SS9b5mHC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a650BmU+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SS9b5mHC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLoZr93674504
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y9biAXn7ssv
	b5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=; b=a650BmU+K9WLJgRcW2DgzwEKaY+
	RfG1z7xTXtfzL6gya+09Led+VFjt37ZE7fjjlAQofCMIAVuKDP6wXwHiVAwQ6fVg
	1n94cDldCb2SEAA62CO4VP5mXzYTJ2X2Pw8khs55aroKyJNOdT9JpKFbBtVPxbDU
	xjG8Wr3kW+CTiPJ9NUPBNE2nz0+cpr70GIvBwNUCEo0+5LH3vKD/mUQzV1gkfi6L
	WXcTvrMsIDNr+B/LHYlSB1qTBdnEAHmp16Rg3bjzv/Sbm8gpWarN7ofUO1z0YYuh
	JWT3LX+afLEAqIJjEoGVHN6sKZGAeIsyOg5eywUKwgf1qJ+G7Cq7VoFB4tA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd236r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fed0652bso22709465ad.2
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253594; x=1789858394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9biAXn7ssvb5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=;
        b=SS9b5mHC2SrbTn/ldjNhqO6+s1dJZv5bOVffJ6WP9F4sEZ9jFXa3ZQ4gRKLukpBLgp
         83GpTjntIKQAVdY41mKU08NYoqX893zCiYVqWGUq/kDQ/1f0u5C0h8aJG9nxsSHWQum7
         9N0sesLXUw+wexJc7LTK7/d4YAfohZ6F9355x27Dkpnxat+IZelRgGdX3DhGwFv0UmJx
         Zl9x1bMCHIlGbhUADLuAvZyadp/0OJWQ6AKVIcR3V3WHREk4c7zafk36JpHef2DVEVdm
         97fgJ5u68EL26dmKlRvf+vJzu/CKzTpi3czrvo7tJ5QgEl1QBhJyQ2lfOn1PGolOatZI
         b2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253594; x=1789858394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9biAXn7ssvb5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=;
        b=dmGtno57Zoy/q6jTQewToG3eQSSgx4wFe9286mCfxPkpTrO69Bwj+4M0mn3o3y2qGh
         pvTVFjKRfom/KNo2OFvJmYiQzz0+YnporSvdmWX7ywqugSLvGDictNOftYMWRnGpJ+fl
         Md8WX/xk7peR65I1d5wiZJ8TkpChVYV5ELt6/brKgcHPxKoVlzXIqdij99yDG8nI18qe
         0JlRPvLOYc1GlBO5vIylLecW6RESoiY0WznTfsgxYSbjjSpoE34MoSfaWwwRtUbcQ9Tn
         gUWcCOX25P0jNhui3DYkn+SXnMbpn22aG4AAWQo4UObua9fQ1xMDwnzHGL59KGrtIEJs
         qyUA==
X-Forwarded-Encrypted: i=1; AKwUvBzHUskRxOPF8+uPkBBWP9DOo0izPficZb7aL/poliSda6ghUwBP66BhqcfNDfryBmY2SAqYwgWJzbgG@vger.kernel.org
X-Gm-Message-State: AFuF++mdYGKNw8ZpKl+Ff7bUXsjkL7nsdD0aPUY01PEXskuVtdcWHD+a
	r6U+GTi0hyK48E9tC66k1aQnYcNYG3mfPwMFSWwt6yfQUJgTE3ZB/5LnnDr7J1EIao/f9NX2TvU
	MswSoTucXOfzabMhUcA5YrtyB9nGZ6NcNe9ud5LYs3N4Nu0DXsS/3kEjx/iIA7kEm
X-Gm-Gg: AYBFou13mvWShq1BxLiN8JMtHTDEbxNHbW1/5AAFklYpiCwGMnHwgfoW++A2zc4HpDz
	ih09NK6vNZJzImqi051b19AMxeRI+VoUvmkNor2zk+WYZgQLIXNaRuVMxyQ1TPwcV6Li/m+fjCP
	n+pL2HZmPKyJi3uTKBv6WFOueiVesDwENFGseJOa6O1WTe8puotoPV7QZONTspRtExtuMFYfXfS
	2VCR39JaWmvXw5e8XP77dDvwpG1Bt7pU7576XQOoU4p2sc14LpPeOyUI76HxuXJfCZmjle3EYyR
	L9A+ZDWqK9viMb7a6qcFbbTZ3IqfCvK9Nk0tL8PIK+rEY065T5OxYPG0qJnxJgn9+uz8TpM0ktt
	8WWy/coR7CzCO55RxkQJ6UKiUUe7WVhR7rHp34mQ0lLi1TQKtyt0hIg==
X-Received: by 2002:a17:902:d492:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2dd2a1d8c55mr172889565ad.2.1789253593611;
        Sat, 12 Sep 2026 15:53:13 -0700 (PDT)
X-Received: by 2002:a17:902:d492:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2dd2a1d8c55mr172889245ad.2.1789253593104;
        Sat, 12 Sep 2026 15:53:13 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:12 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v8 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Sat, 12 Sep 2026 15:53:00 -0700
Message-Id: <20260912225301.3396556-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa5d7da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX3jkkHzTbGqDh
 bbxVkuXiDJFFLmPVoxPKmhcuredZEmdb5KWaprGqZ9GnU59knvAsOhqu4ZNaS2CKecSzy+ItSVp
 K2wE+ADBF69JB+QXDOJnlK8ent+OaLuHuCt/VXw9spw1IQX5MS8axFf3lHeKXbuZ9UTknsMzxfN
 6ThE7AH5HogEpecT/Fy/yELNG3MAiqtOoBzBPn+fMzIwAkLuPxVUK0O9U5kKvnex91TI9Srys5Q
 Sx/GjVilSbuJW7e7CMapzOXks2FXqibfUTuotTf9MQ3Gr7eGJ0OSV8nN9RdQqB7MH5nXgxDQaLD
 5gCj72fEztnjV5Edi7n7o6pA9N69bHK30WX8Lc2bVMH2hwtcbOQzbmJOeJFdr9kvspINYMnynd9
 cGkK174+el2dys/T4DEnLCVoUSWt6l5xccZzAMJ4vIV9pI/z46CFWSXiXS6JBb2/JAKAsHgUqoi
 u1F4Xs94zxxBdHATjXA==
X-Proofpoint-ORIG-GUID: 5B83kdlMihwJfHJg69LUtL8Q-v0kJnis
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX+C+3aJh7/iKz
 QduI15BxlpRzFdmpqxtLOjC2Z9uq3xad5tuIPP3rpBZcf2GNvlmBnf+HwyIOJLFZZKO/sUAMz+1
 z+eir95ghLvv3So+US7XHGI/qChOMys=
X-Proofpoint-GUID: 5B83kdlMihwJfHJg69LUtL8Q-v0kJnis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

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
index 353c45dfd328..669e2e00dd7b 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	if (!chip->enabled || path->curr_role != USB_ROLE_DEVICE)
 		goto out;
 
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

