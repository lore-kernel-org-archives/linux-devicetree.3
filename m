Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED82732B13E
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780961821; cv=none; b=jnH3NoOcwXVdOaRl6PSz3/6xcPwHjIhzNpbNkUs1NDc4SOmPgI2pJImiSy8AnW4KgTP+HwTwbI0YNt1PyZES5Nh2YD4Yuy4S/SQqfxC6wwXsrD6PaPpcM2Q7SlMTUMVwmpSB3kfyJfEHT4hEKMI8zClHl/YPBaHZB0xg8pbyxg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780961821; c=relaxed/simple;
	bh=dS1ElGOU/uEK7BuBerHn47h+aj6MzZrnwhNcUiuqfOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWZdnyip8M+Lmtt5c6HUXT+g6hg7A89/DXXiV0jVhUv+PTOF2jYV8K6j6RMz4uHh6YV/ANxmoNB2fkIbz5JCaET97fyhNsIcffBhMnrVOQROs+uOiRzV9O/8ziRZ7r5CMb0zIJtdEZB5Cb/M34+MejDDt8RDmH04IxBmxPyXWaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJb0QwF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+4MOFQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJb0QwF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+4MOFQS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658NDbYf445131
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 23:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UBrkQRGZcYDhaaq4PZ0t3p+XWTYaSbIMbZWV83bVyyo=; b=ZJb0QwF3hAH7XrK5
	/zmUfib0oTuUCZoyhRvYkgu/gi0MnX91UDY644ag7btA/pZGA2j7AxH94L/IYrD5
	p6V+X66+7dqMy3b2IpKODM6xZ1ZGIJJ5D/5N3fWQBRIZMk8WPgxprvDPzilfCC/V
	NILgh/EXqHfcAP80dbxAY2MK+D1pFDQVUAKLxY8arSMkVoB4Cq4A6tgbLOkjUi5Q
	yl4+MzEXpj5h+gVcZJDlsGTL6lUA69w1CK1ihi9PYJQelo58N5WcEdXTV2/NSKj6
	tkPEDUDtJrHM9lH5uDphP2QfIe18lrPNcPKFsM3W8b7oT/lHxuaAN9NY7wwUVzre
	dU1I9w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun43e49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 23:36:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so67020065ad.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780961819; x=1781566619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBrkQRGZcYDhaaq4PZ0t3p+XWTYaSbIMbZWV83bVyyo=;
        b=U+4MOFQSpjE6lYFFCKfBuoclQdShOhvBqQHsm2P90Bcu6/AuNcVOIvY0iCrtBQq7fY
         Yfo3ORvVb2dYZ1AdRTcYhtqKn212WSSmNSZSWpSfI8mMvgkvSEVAn9dUJBJf1suWRhpP
         qO+MLgiDP7XcoAngS5uQWguW5Hj4fGaTkgmEK83CoGiFTVNgONav2AFeZKIr8zwr+sbs
         Toxwo1l3mp8mIngulv6mJl4eoWBeVQzdj5UpDZMV+uMlDHREjmVSeVb8Hhg2RJrHWN24
         sfZ1n1KI+EvMgZUowc2qewlpSnsdz+XnuC1nOWjDi1HczI9GjtD76LIhcvMEFqZbNEoK
         8S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780961819; x=1781566619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UBrkQRGZcYDhaaq4PZ0t3p+XWTYaSbIMbZWV83bVyyo=;
        b=UVHXktY4Lj28Tu5kb0zNeY/4waD8UQEjECcei4MFbhAHQJxmCzNnR2oOpWFcsQE0Nm
         2E2rHwW6AaPTXKfd7nc0s44iwDMHjzdTlzbrCgC0YVQGRUy/dXQqNzo4rQzPHC5vAMG/
         yiDttiWFdPoSw4lNfa83LApt5PjtfvFs9ptG3QIcvfoQO7AvtXY6GgdlyuM4HycC7/+h
         wHINJuNaSIpwoE+mHCk2ElvC/rcAFnkgxm64t9CQQnkTChsKUh3nsCvECZYHRS70ynxr
         AVyoX8WkfThNM5fiyzrGJKhMFZ+Jz330l51rldpg2M+8gMQAp+CsQUr1K1SKyS+gnx5j
         WGbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ksv/QyoB68nBSurZ/dVx5WDwZRC8xpyEcl4o0e5WK/8wJUaiQoMSETZriQhVHfacuGIEkcysdu+O9@vger.kernel.org
X-Gm-Message-State: AOJu0YzWuc09X0rqRxXIm0dQSYrcDgzVdzKjUAWzSeIeSIvQxLkzh0kL
	a3x2IjKxAI/7jplHovUd1bjNl/FdNvbuchO/hPABUOSXQvB4mtKPaA6XiYTifYHCl0hhTpL1KfJ
	OKaYYsR6J252xPKCv++pw0BxNoPRspV9/rw68C3lNpSsA1j6EVsbsPtnCgHyJgQ49
X-Gm-Gg: Acq92OFn/JCouQGf2r8Ou7E/YaeyyjL/qcSDOYA8eXy6Rppr3vOXEP45YS5xvdNveZ9
	/FvEA214NbObRe9y0XYzm1HqhetRz/pg08aOuknbSGULPacNHmi65fN5DuWP6YlzCiapbUHyNXv
	pZDidWq9NIQGCeW4up9Ol1A7eH8KFDDY4glVgM+wCn/tw3gQX7rbhq3VE+kmCOtWc3HA9ZV6nd5
	rcsCXgnBOREqNDfATPBk1XCs4xgw/lkH3MJPBhbtR28LbStHX98LpGJu3tqwrNt4qFP6T6UqZhR
	0+6OCoIn1y/LGwazWMhdrZmiDCorVVW76dwLTCEDf5s6HXh+1PiORRPiN3bYLGcXp8sjREvxws9
	JOQsREKXa59x3wouWEuaseQ7jq1rMhUNgx6swwxQnwmeeUHSAmlp0uN7C
X-Received: by 2002:a17:903:1b44:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2c1e85aef51mr219048405ad.29.1780961818641;
        Mon, 08 Jun 2026 16:36:58 -0700 (PDT)
X-Received: by 2002:a17:903:1b44:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2c1e85aef51mr219047945ad.29.1780961818187;
        Mon, 08 Jun 2026 16:36:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8ad7sm66206975ad.42.2026.06.08.16.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 16:36:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 05:06:29 +0530
Subject: [PATCH 1/2] dt-bindings: display/msm/gpu: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-shikra-gpu-v1-1-9d0e09cab115@oss.qualcomm.com>
References: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
In-Reply-To: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780961805; l=846;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=p3O1+oVxykLDP+avfBtT5F2AwxJFis2S4LsUV/Ws0Zk=;
 b=KmVpOd+07fG4xxEEbAy6jMK9euc9ZYNKCadBlM1MTvrQ+bp5f5/mWujTWQruv8ubQ/eSbU1cO
 4yt9peMvMSxDINlXN6z2GwRjuEaUylvOLQ8RbHPlvaws5hOzXufjvVr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIxNyBTYWx0ZWRfX5tUFjnFSa0ko
 NDI+7t4MLgpNXpfhSON3MTY6Gd35Zp78hYLzQi/YnHHdp+OK/svg+pJUnaZssanN+yoD4MzfVWy
 rX7VnU0OOb2OtZO8W7eP24muBJcbj2SLHcatzNnyoudl04oulUxCQuEuYr8yfVlvB9pCXaOcu/D
 sgSiJsPUpsmF9MBsfN7c3FG1UduHrhlrZeiz+NSdJOvEMf3JQ1QPFWo8Rf0y9O6xmls8u4v7DMo
 hYMbSFqrx/Xn0JK0HH9D/NUAuWFCj0ZoB3lSavSsdwCnfDgKov+alo6pK1jVYMrnshXFSPkL12u
 dNQDpUZpg6bKgKkOqD3g8tGSulvdcS66lNjmvsSjRIWY1G1hT1Zk5JmvgbHwPsibU99akBZl3Xr
 +r/m0dJcdcQOujp6C644bSqXeYhzGnvvL+9sc4wXqktecUWcHeMn8hp37TmFfTeNYicId/Z+0RD
 fHuhAPkavSkdsahZyyw==
X-Proofpoint-ORIG-GUID: 04d8VzYh6fbx9eXuxNtY5d6HvDocqkkW
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a27521b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 04d8VzYh6fbx9eXuxNtY5d6HvDocqkkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080217

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index a40899e5ea58..2308e97f1467 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -357,6 +357,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.51.0

