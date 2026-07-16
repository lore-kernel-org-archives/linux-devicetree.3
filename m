Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C133843F080
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784230240; cv=none; b=EjQ+X0pS5E7oNH2EUgusq3raBxZo7dGXEkfL5D6RMeyTCpJkoei4+lA0nupr5L80LdT1PYeJm/BMBH4fkpTRBqo3j1RqB2n2jZ/KRw9T2oI6kw/NF8maBp93Bu96qmm5zyeC3b6oMrYq7kuVEtYSY7YRoh6smTvrWvCYGfDt2qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784230240; c=relaxed/simple;
	bh=2PN/tmpjLEOAUOEiIZAeKGoU4acuia+bZfUQHfdDPFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwyCabEJkAhokSjLz7z66a4wFOt7eKiyUnL4XW7dLVcR+WC4mPNewbDmN0SVzx18YGDP3FPnED9RTEkGmQYBS5JOAjPS/hXIx/viOmmMNAT9QNnwDxISWC6//2K8ClcNMIwNCG93Ha1svsnPtUI5sxJs+qnrfRlrYNJ67xd7d1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/EZ3Ir1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvkxIaA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/EZ3Ir1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvkxIaA4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZXK0385739
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaFYE91okIj+RlCflYRRadYWaOtWBl4IVntenGlu4jI=; b=Y/EZ3Ir1QGXeXv0Z
	DR9sFLAcEpk+p1UmWegJE9o8c+VFNbKmfjVifLDWIwBnFBou80iILZFbdj3GjKJ4
	px2oRdjcGQKt0OoaUq+pMIM1jNcaMdJ+R+vT6L1cpKDjmc0Z3h1Ii56Sv/TRgFAO
	heC5sdanEubVPm4VjIt24zLhsiKCD1YupbJMOVhKQBx041tn8hDFMpqQOuqGamMw
	0bZ3thRxNDl4nIpzSXxR+GmDu0cMx1fyzmQMzqJCp+emfPEc7PZL4lADaRfYPVYw
	vbu2YaWj95nZyHgHhA7g1upnhoByBqgeXP/Zk2OOiQWsyn3USzOwGeqxrziKklyu
	SA+B1w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6gdwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:30:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848d21bbb55so1184661b3a.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784230235; x=1784835035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaFYE91okIj+RlCflYRRadYWaOtWBl4IVntenGlu4jI=;
        b=GvkxIaA4UkFUIDNVo1xYfNcpK4GOwQvY3nwIj/gS8rIL5d3JAqTytTGXXLnwCCyhVo
         adwh8sDhnzBOp4oGTTasL76tYr2dLPevlaUgY5W1Mbwnk8Onf4kEdc6+asfaBslaq58i
         p7QKp4OVSVtSoRAUUQK6nR2NU/CW19qyXv99qU7YScuDuJc5WQ7qXWo6DRKVFkzkFE7g
         3G3WFEoaxWusWOaeLmxfJ57cKUQY2J67I9v2Xbw2rMBNlS8lzUZsfAwcSPccSo0Z8Dai
         D/oRt+ovWYgRJS+hvh62xuN5r8M9eBmCxKojjZ2Xk1r0lvKpv0dOY4SVSG0xunNjqXko
         pPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784230235; x=1784835035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaFYE91okIj+RlCflYRRadYWaOtWBl4IVntenGlu4jI=;
        b=qdUb4/DVDpm8ycZ+af/TgUWi5Zy7bc98N0jPUTyA0UBWmWsjfWhF0zlcQyyl3bBb+a
         O48elwlyel88liexdXlqVCJ0Lk1xPyCN5ME09uKy4fc1pF5p/di9i5NHbBPzo3jmCL9e
         1B6tAdfOV4l9DkfyJOE9NQXREHojHCdWWoYyz5jgUZc4mSxrQsoivkboY4UpDFkQBExJ
         RyN0gFUbcgln81x3hmqeyq5fC/VLk6IJkmhnCn2aFf1uHRWM2OZvUTnhyzieuOVeG0Hu
         42VZcFDXM24hwZyf1Mm7bFu8BilIKFJo23Pl5V3dFys9XFDWIvWtZdO82ecWc6Mox3un
         Rsyg==
X-Forwarded-Encrypted: i=1; AHgh+Rohtfx0J4Ib3wI4FySjpw2tRMo7EIFrS7W/8gdM/m8GrSGxWKuSikDeYMQNAsBiW+qm3rtzfoKFR6j7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5BqlheF+N5tZH9fdvc0fuMycOaTpYm50ZHSlqiwmm5dqH4tcv
	jwqkBjVa83Dj4miRYdUUCODx88KT+1Mob+fSd7gvgNmlMY2ZVjbN8S2xP9aTROAHujjQoKv09nt
	y2TjZS0EAUPlgl/MSLxnINKyjfv3OuhSJCp9WcrImTXDCR9v1J/vu3YEkIbK+J2gS
X-Gm-Gg: AfdE7cmbokg4xFZYU7NGYJrRL/+yJPoVyHxmQWMe5JLUO38tutYyXdra5sm1cTRIM70
	oqK+NboU8te7v+HT54g3t5MPhGhTziLuUEhr85n7LJW55mdI0PfiyLcpSiKXd6ZAmFLBfd2mSHl
	lgPrq7iRFGEKuM08uMcPprNMwV13fkGVGzqTHDCR7DeJnBlhHdBEEPSLXWanF0oFQjj9Lq2HR/7
	RY2WMNXdaDE2RAVy/DNMtO/J7qt5Wx1kkkdq+8y2yDjBfDy7DKwBtOLF4wtRE8BnKEaSGYXFbU3
	fcwvtd2W8an1jg4qi1emxc7PIDIfo4Pvz8+vX1Aik8JcrERvx2h215rtscviFTe7zUwiNEOGep/
	PTHovzp/BAsPVZciPxwd4LQmJag==
X-Received: by 2002:a05:6a20:6a20:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c35731bc86mr13658031637.2.1784230234783;
        Thu, 16 Jul 2026 12:30:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a20:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c35731bc86mr13657992637.2.1784230234345;
        Thu, 16 Jul 2026 12:30:34 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c2b17sm21468394eec.25.2026.07.16.12.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 12:30:34 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Fri, 17 Jul 2026 01:00:14 +0530
Subject: [PATCH v2 2/2] arm64: defconfig: Enable LT9611C bridge driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-shikra-work-v2-2-86ae8552259e@oss.qualcomm.com>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
In-Reply-To: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE5OSBTYWx0ZWRfX7mQyI4JE4rPi
 wAYWvm9/lWcP/daHBQ3DeJZHKn3+KbWev6W5Nlpb1ZoelTRNDYMh/2pXQONBkUDM62rrGG6lTf1
 jEmvbwL9k5G6gZMp1vwjAI0ya44smxIlp2zzT65BgnLjkPOixpxI9qodWEgRK1hG3WS0nHGj0cT
 mRO+OgHj96jJLwHGkkX5iPo35POIQbgmkj8tzS7q+tb/UpRv2zIOqhxt4xoR7QDLfh5gOGkB9LV
 1/apstEC269sf1ld5bW5JozGV3SaT67K/HJRPkW5MGmrs6AAf4qvUgQmXPqQxM5s0fRZXHcpvpE
 7aTPYiYzeV55zbd4agb6i9GP4dNjWurAtxCBRJcRDXgP1+G5pB70tj4/ySHkZ2Lz/eilM9Z5RJR
 pj6O+9kkeryay1GLq4nKqmWAWpavXS26gMtUVjCYZkmcyAXyUhLlnjUeQEj1F3CL0ZeunjmZ6Sf
 rEEuG+Q6ur4a25mqazw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE5OSBTYWx0ZWRfX8mYn9Kk4TUaA
 RTaTWzw/h/whVNBV6wqs5RgNA/xg49+gF2f4DAWSufskKIsMYpXFfp2+70IZiQ44Hm/NxIgCUWU
 FIiaLw/j2ElZ7ZEWncUlj0Gdee2qGMs=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59315b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JLjO1t5ekhtB3RsVtqAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: aKSYZshHNOcCBPFkTU1RyFHrKvyqU-MT
X-Proofpoint-ORIG-GUID: aKSYZshHNOcCBPFkTU1RyFHrKvyqU-MT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160199

From: Mohit Dsor <mdsor@oss.qualcomm.com>

Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
This driver supports the LT9611UXD chip used on the Shikra IQS EVK
board to provide HDMI output via the MDSS DSI interface.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e1d8e65782d0..8a6922199545 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -965,6 +965,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
+CONFIG_DRM_LONTIUM_LT9611C=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1

