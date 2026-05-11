Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097343D9DBF
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496565; cv=none; b=FfxVtxqW5GoVQFy/UkzFZst48mTHxaqATBa0LbJXFH+RfLGJgvqR+WzxQeb6uyoenJdPB37U+rD5ZAp3PrLu6oNAlYKB0qlu5VkyDArbwp9OJ+ywanVHeF2xszE7IkBvLxLzZByl2TOaeDrYne03URAmQMozOBFBhKSOCfCHPJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496565; c=relaxed/simple;
	bh=rm2g+7WCJu3gDwkB9EAuBBjUl6hpY5pkc4BGZGxOr5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mxFWOhXhp+FBO5i+Zer54fD5y6zhVhud8S0dYqRqnMogw3COQ+ySSzg6lUVa7wPrEV+bShe9MSmyB2pT75l5L2Z0StVr5FUfd7p/Ic7tGKIU8Ooa2/WyRXFhebRdPOGowVv+pO5EcxwpB1FDRSPdpQifrJ9FRRIitjwc9D7YiDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDcuoxeq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1aAcvcd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDcuoxeq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1aAcvcd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9A9mt017644
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tae5Yd+glqdsIfXCIHTUr6
	ZN2vtdU+CzMjAVlTQqV9Y=; b=KDcuoxequrHpJ8nmKUoBU8zbjCHGJzuF5/oOSz
	tnpD5inlo65fA0VuJ3ZChA7cA1NhwN/jIYjK9Otu3bTlYXXD2UrGwpUTWJ+jrP7m
	EcVGeu+XgxW+NQnykDOxoOGnCbYzjJwBYAKfh46HPY9ET3vvpmT5eAs9xhoniDvt
	no/wNjJd70oayVXvRmpZcSHvN0IqcOc30DzJ0Po+T7I+UQKulEk0io8daMxLchYw
	41S/ycZlRtW8dFvoJKiP0sC3GeIFqTPwmTCBOBjaQzyq3TTCeoT4vrJPYwTQLCiI
	t+nHzkkjijeVu5bOdB6Okmef7DlFl1KxBQcock5+fPhRplag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfsbt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:49:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b461b36990so46250565ad.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778496562; x=1779101362; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tae5Yd+glqdsIfXCIHTUr6ZN2vtdU+CzMjAVlTQqV9Y=;
        b=O1aAcvcdoFQNvhR8bEYGnfYQQMQQjLa0RPtADbsR0GnQ/+E/YsybDUvl2x2b+r5/jF
         GUUY6sqHlg64QACT0Zsk5zk4y6qWHZzu/YrEoJtLp2N192y2kEU2l6ln6GxGmoQKOoUu
         nryhGE0LXr8xrPR8H+QBAIifNLWHlvBp/YPJCN8JPBdlxzKF89K7WJHwhdEdO525UNwf
         G5qCuAUGRQyLDdMFUGBpLi4j3luVkEF9mJaVlT5kC++4cziiEaggLb6s3DQ/+SOD1FF2
         +070IJk+qw1GSzJBMyZ4dW3A8vCS9PAMRvw/vyTCHlQXMWWdYnwN8vuOWNtzTUypkxlM
         k4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496562; x=1779101362;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tae5Yd+glqdsIfXCIHTUr6ZN2vtdU+CzMjAVlTQqV9Y=;
        b=ON/prwv0zwivoa72PxS587k7xqciwVNo29I48PX4gDbwGHNdL7EphW7widG6HBK7qW
         uoIOTe8tWEGIezr9g4z2sIYeOve2W2F2lECrnHmJxmSd45TCCXB1k53gsW0g8bejnXCr
         +lDNvoCUpqb0umROnXKR/NdWttn3QS6u1mAM6pqRIuNwVZ9FAv1FUl1uJLPjqqYdpZsj
         8AMKlL0cJq2hGujhJ2TYxhPeSAnAstllE33GMlQzPKCniF1PzudFa9NZjjvQCATZ/fTA
         Tyzq4e2XVFrFqAknq2mxQt8WbqiIup/AgKT6auSXtt8mg1ycjSl2ArfcEE9QQh/P4cKY
         XsbA==
X-Forwarded-Encrypted: i=1; AFNElJ9o6tlbXhU1LXrfE1d5RJ0ufwW9ECjYDlVgXKXwZ3R5D2bQXC165Ya/0U9XfLHb333DPuO3BRJodWZ6@vger.kernel.org
X-Gm-Message-State: AOJu0YzudUneqgM9Fhm9Ms0vPV0iieOhrSYbfLiPPa4dMzBHNt4BvLxv
	LxgodKFyfZOq0drjt3xyw+w0/ZdXdEZRmEuvzOXNuTVwVR3bd73owaLcxzU7JxL0qmj9SjZ79Rn
	+iZzQqgJ+kktx7uPkNULOz1ABgSE73ttN1lD2cE14FccJyC0Vs8dTAPKvqATnLqoK
X-Gm-Gg: Acq92OH6q/QDv7f+Vcp+SSKuDUMYBxlagpsfopwcbTRd3UnzllmlPZ3qVvJRlmu2xhp
	//LZj9F0io/r8eARwLhhxQwDoTYrdOVSuf/BYYOCEScLzSKPW+ehJFaBzh4/nmQ7nf6UAvA3c79
	jUQoZef2PXiOkMEBZxgOCBo+8/GzKMUGJ5Xrk8U5KIGdEF5cY4fWcC4A1sIuNcFFr6Fu94y08av
	whJsVgKe2JnHsTbRLNxeHOgXCmw4JNPoRKb3uQeh3F6OI+jFo+ioFug12XsLeztYOdudL5Vs+Bf
	OPHmpFNknl9EeDIRs+ULPkSVZLUjqTTivrvJs8QjGOM+9jzZ+HfY1ZlCoFsXJGaMgOkSKUBHE+j
	fwV06/5FDXTYakn19251gXro/LgEJap0eT7ZYdRGuwb51buiIvuzcsuEHtKZcAdsB/ZeEohaKy7
	r40Yj0BxBH44fneWqczE24Vvbg26pK3gWqyTT1fcmuMx7+lWO91lSU0KsY
X-Received: by 2002:a17:902:e547:b0:2b2:b117:1d5d with SMTP id d9443c01a7336-2baf0e4fedcmr143601635ad.33.1778496562040;
        Mon, 11 May 2026 03:49:22 -0700 (PDT)
X-Received: by 2002:a17:902:e547:b0:2b2:b117:1d5d with SMTP id d9443c01a7336-2baf0e4fedcmr143601215ad.33.1778496561438;
        Mon, 11 May 2026 03:49:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d26973sm103610245ad.12.2026.05.11.03.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:49:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:19:13 +0530
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: Document IPQ5210 watchdog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACi0AWoC/yXMTQrDIBBA4avIrCuoYFJ7lVJCjKOdLqxV+wOSu
 8eky2/xXoOCmbDAhTXI+KFCz9ghTwyW+xwDcnLdoIQahJaSU3ppJcX0dXWyFB3FwI0fR2e0mdX
 ZQi9TRk+/43q9/V3e9oFL3Vewrhs9/t6EdwAAAA==
X-Change-ID: 20260511-ipq5210_wdt_binding-9f77d959a28b
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778496557; l=1071;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=rm2g+7WCJu3gDwkB9EAuBBjUl6hpY5pkc4BGZGxOr5I=;
 b=2C6wnhOrgRtGkh87K3ZV/0I4+Pda/KlnWA/nndO8Zy9Yu074ZXZstfitfc+xdQFM96Ykrqbpo
 tnC6j3sQJjYBcrtdsva+eZhXJpER++Rrv4Po/NS0CGOMtRssmhJZL6g
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01b432 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JxiR2JcaM4WusKbI-qIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: K9Gry_9VGq4J4MH0zpYcS7W5sfhNmEjh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExOSBTYWx0ZWRfX9NQH0xW8REWz
 mE4LqgX/pfUIf2SV2RNcAKAYpsHw1SqsSLXbJrb9UrmDkiiPJ4wgO2eL9UIU2ZFwQm35OwEds8/
 kYvkdIwUmpBIa49gYUAUS58wRfSNcie3lDZklAqwuzmvggXyO7IDh0XSp6aD3sV/fcVodw6Bmna
 a3/3pAatjw47elWfitKvkWFZ2ngMhg2o0f2pNUcMkL0Pva+HmgQGgALnKVLFqgnVw2ktpokfNOH
 VmF8YoducPdWxgqTRivmTXgD0m/YY4pBw1L5EX5PTUPvflZyyfA6G10xN/nUaHaQvLBz+lPgWsP
 I68YaXjNTf+JPrs17JguH0qkzxOl75x44w8yOqqxf2NUfh+XXU5un0qLPb0G3xnhAYT90CHMDvh
 vGeR8hcFPl0sjYuRx0CRD3Wx1HSPcMVRBiz7edgDGiqIcnYKDWwsyaANnXSZpA+rWq0eWlwWKHa
 p2u27S+aBWjSvb9bitg==
X-Proofpoint-ORIG-GUID: K9Gry_9VGq4J4MH0zpYcS7W5sfhNmEjh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110119

Document the watchdog device found on the Qualcomm IPQ5210 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..21f6f7db7f96 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,apss-wdt-glymur
               - qcom,kpss-wdt-ipq4019
               - qcom,apss-wdt-ipq5018
+              - qcom,apss-wdt-ipq5210
               - qcom,apss-wdt-ipq5332
               - qcom,apss-wdt-ipq5424
               - qcom,apss-wdt-ipq9574

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq5210_wdt_binding-9f77d959a28b

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

