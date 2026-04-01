Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD3D37DE87
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028406; cv=none; b=oOI1hz6OxDGLBYKAMSeNTNalDpczNIZlMIfaGrTCcKJdnuNxkvh1fLQy8YvhlU81iFc9X8qlFUAsoNFFd2UtVlB5+VLupARe4YLj9XFDkBXWKSil0I5dAhtwutjsc0jXEk6peBvLIQ/2ZInrPnugRyMeXaey2J3DB48OmHgoKsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028406; c=relaxed/simple;
	bh=CKt4o9MtJVlHGeGwYzQvEJIoQaM/NF+MZ+0HmD/yJ9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfOUmPtoOL5dNzR8rhVZtDYa5zpNLSUSry4D4c8y92YM6ez1L2ZFMAwClNZyvJU/bRoOtF0yWJVRlvj3SdQmrSRDB5e80zQj7RlniXmWuRSwbPPbhxkOMCzM6dk5uy2lYodK2WVyv4zaBUp94aA3XZDs3zkWN2ZFxD7/E2lzf8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=od46VEHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9gFxaFz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="od46VEHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9gFxaFz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312dx2Y3081986
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N12IT7QQm6dQyXdftpTiwQDPXATOjkTcFh3mc09NiTw=; b=od46VEHNjwjDL3Vx
	/OeLgV/Jzx3wRxqL6pce+ExMJvYw6dHlupKe05x8TX6+rs4cT2kQKPGJCaSIbKmD
	DF8PMicQUjDhsnJLoivbRz1wF4WXF+ZyRXxCjmFgU7poj8QiyQabSYEzQ1Q06Asu
	20+Y3WDEJWN+b7t/VBuVY1rp/tUfNWJDxnWZ6Y0KVnOaOhRAu9Fr/sc0ZjDcw4ng
	dJAAd7OSOYlV3lWfS5oP4WfDmHGmYbGSaXqoRHoS6VcajAMm6CVbpgz9TLlZ8K9y
	SmNVPk0SKTHsIFZ73K4usrY/2+mISWzohT+PIIb5wkLv0hz4o+K4UV+/9nObAjoq
	GeisFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkttpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:26:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093a985e21so166333941cf.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028403; x=1775633203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N12IT7QQm6dQyXdftpTiwQDPXATOjkTcFh3mc09NiTw=;
        b=R9gFxaFz/MDHGl1Q6Ii2drZdJ408SxQb+RrtEAGNOisWbam20aZWEb/W8/8gtfY1kW
         R/wiX/xggIBZIktiBAq4m8/vkvllm0gQtSSLnNEvAznhg14l33Bbt/zWGzFHNdeMf//F
         Iw0evY6SMiqIV+Bv/AyEBypxYtO0FhNuZQkL/Wd7tEUvKaSlOJRISAZS62BApTLpDwgC
         1SX+W4hb64dCWPzrjzzDzfjrKHCkt71VEpK8ufSyBg6zokuT4NhMBh6st9316HaCWm6B
         r6dPlghoC/M2153VAN1eGk/QAu/aZrS7H9mERdZgzE6FKRhFh3f2FLXyDcqc9UYNZFRN
         WGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028403; x=1775633203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N12IT7QQm6dQyXdftpTiwQDPXATOjkTcFh3mc09NiTw=;
        b=i+sp+3+ExOEqchuVWBFe8ZH8+vtmH8OfEUHmA6o+B2abbGu4/DiSH3oyBVu9QeHR6b
         wyXHM9CLc5WOWbokUmShrQSQh2K66fg9dobaCM+iY/ortfwrhxd+5GW7R4rkVKuvONBC
         +Rlg4KKOCLzGHCZuwGd8gIKvicdMlNZtK6cQIGE6We2X53h6wlW5ApD6GvTVlXzyxhsG
         coln6myVncsehWP3BX2hOqtnnkrCze5HuPd+c1ByutwB4am1655RAwLNT79Pujyy7NGB
         xF3HQbE1r7vEQaeuUgsFanOVdmHRMrYvUDeJPBQuvbxQ19SC4FfK5kNABZnNluh/DAGq
         KuOw==
X-Forwarded-Encrypted: i=1; AJvYcCVP0p6XCgGlV2qnl/+PJEQzJJa2kHHVL1msdwZVBqm3hU7O4OPDkMRpHYZ4Iaae7fcrYiq40YCgTBbi@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ60V/R8JD4/JROzPr6iFY3HP6l0jFpvJSk3RovJUo9hgHD/VP
	aRc4imeeHwNEats8MSNfTBL9VClmIdsCDeZUt3Zaiq966I1FT80huClihgng2CMIrnfKM3+qxKp
	WnMsjJRowXABbhtRpqeecuuKXJjkfkKnp/ek1bg6cFdefXBmdOc5xIy0dt9NOCmJd
X-Gm-Gg: ATEYQzwPRKY8P8vyKyXoicRWVEA46hVrP058zKHdgBwY1kHtso1eBpSK8zcUTId4o1M
	8ibTWigzKv/2+2jgdYDLqfi+QCYD3xU37hhUZnQxwTrxLVimeznNMIpGJV4P4FtFZjDP8MRTk2P
	5iIxuxL9YuDeq93ZjgLQSwVJFDo9LTSSh8XfAEEhR/eOOjjkr2mDNVS6sumogQ2wcMYuQLZOFgO
	uHp7jU4pvl6p7+HalX+uAPWMKc2Zetjrv7sVR1zZ0pXdW/qNY7NBvysMu4UsB28C1QkGN1WfrVQ
	cjDSaJkggMXQik41+mzo2w3DXjPg28YQoZihvjNGUtXrqZigW3mUqKzIzwJTHTClphe4ltsG9Ui
	TQCfHGZ/T+mhjNYrTCyANzDmK57qFvnGntT2hxbvm4ymmVVWSWw8azVPe/e6uHSm3swDa/lBgLD
	gJECQaqBPkuc4+xbnp+LAB8UwWUbjZBWlqVhU=
X-Received: by 2002:a05:622a:347:b0:509:31bd:3de4 with SMTP id d75a77b69052e-50d3bd36066mr35220001cf.56.1775028402498;
        Wed, 01 Apr 2026 00:26:42 -0700 (PDT)
X-Received: by 2002:a05:622a:347:b0:509:31bd:3de4 with SMTP id d75a77b69052e-50d3bd36066mr35219721cf.56.1775028402051;
        Wed, 01 Apr 2026 00:26:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:20 +0300
Subject: [PATCH 01/19] dt-bindings: display/panel: himax,hx83102: describe
 Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-1-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CKt4o9MtJVlHGeGwYzQvEJIoQaM/NF+MZ+0HmD/yJ9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMir8s4mocEGfwo31npITXA+knKdJ0LlAlBqt
 gVKdrFjX8WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1VWYB/wJdQeubNmHeczzuJLLmF7yqFrmL82/+5J8KYZss0rUKi5WcUnMkcq6dn2fLFtWP5otFYy
 8uHY1u4ofoZopDx3Frg/jcOb/L0ALVBm8Liwf59rXDFNAUL53MkK6CjqzFYaykpQQrdDdmpVpHT
 6xTTKR9Q1WRwfIDgfJYehbSfDWWxKanI10Pi2s+5DhWL8CTZ307txR8hYtFg+JTts18TPlxkm0U
 DyK2pxAdKhSzJM/MACuc2ekEc7q6hPx3FqAjAWxKKh2uVu1L78A/6Cgj3LkoSD91cvBniugcYw6
 Kn88RcMJU+B/YNJPqamd152wYxjGoUV+4qCJ/+XmwyPPSexa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX/KEQ6J5Fiwtp
 D6R+iibCmsqUlhVujwPbpLCzFt10gRvSaiSSgB8+7/8L6zHPyprOu1StjaaFh29n2jmxSVQTx/V
 3kfC5CqcOHA653XLtSPYmKuxHSKvh9uyRd+Es+T8gCG0WMKk11Ha9G4EGy1toPL7euYMxcfmS3R
 e1TTVj1T0FaFHRy9SZXGTZvoc8Cr4yt1coAQCTD7PZSIFfL1XIyzRF39SFUb7rYYzUWg7UYTSVn
 P2XWtRp1X3AOhJS2Jb11C8se2hFoAWTgSoKKcrYn2NMtY+KxERWs9M6lSv9EG/XeMlj1max7u5C
 6teBrQsfF3B9cnhXIf65bQvTlxjMdk52lNSWKHLkVv3yh/SllKyKFk/vPA6cfeT6emX98BvYRh1
 l5aMFnsGPTDk6fQ7W2BVemkPUIdlSyK59+paa02jtoI8aiWJZGrPtZtWzTT7gFyTq2+1TpPLjNJ
 aaRssG8u4Ah6DjTPOeQ==
X-Proofpoint-GUID: wDrZDOvvp-ijCeOz2r--HA-Km1l-E_Gc
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccc8b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dDwtKCuX-g0vR4_aJEQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: wDrZDOvvp-ijCeOz2r--HA-Km1l-E_Gc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010064

Describe Waveshare 12.3-DSI-TOUCH-A panel which allegedly uses HX83102
as a panel controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index 66404b425af3..7667428bf9a8 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -30,6 +30,8 @@ properties:
           - starry,2082109qfh040022-50e
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
+          # Waveshare 12.3-DSI-TOUCH-A panel
+          - waveshare,12.3-dsi-touch-a
       - const: himax,hx83102
 
   reg:

-- 
2.47.3

