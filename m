Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8282D9787
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467793; cv=none; b=A3ygtq76DPIbAlwU86Jz9mYaaJbFkn836NqtYuHdhEbBE0uGe5RHeBKVF+oR7KOKY/mGgpVz5oeR12E9w8NeP8p2ZgjaOLEp8LfJx5RGOsJOJhsyj/kXl1sNX4Uy4mYFxYVhteBRgUEH6KU8DWMrQSKpIowXrf7adRVbpDrm/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467793; c=relaxed/simple;
	bh=00/cQNg1NYCrw4ioCag9pzQGr6M5HdXkljprZfWJ4u0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tPu+8FZhlhV9DfJq9UgDCwQwFvA5/CwkHvL3W+ho9FOLaNtBb/8CWFLseSAqPo7fT8NENlDnH2ITL5KxlQ03vJ5+sx8FNx16Od/zwIWgwLZ6OAlfVAj4cDGSo1VspfxJX4fhAr4GniquJ+fZFWGmeHShI1wR+2nlPFU8uERQceA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6VdFk92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZN4b0r6I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6VdFk92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZN4b0r6I"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4R661985602
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=; b=M6VdFk920NS+avqG
	GjTn/q0E1gYwG1uy/SDwcfo+AIsrrw5nkLAYe6Y6ePj/7zw/p4ojqxZvjIF0IIfL
	enG1wyz+BBCThgAwiD5yYr3L6Smiq6Ig1Eaxj8M+fr4445d9tf1jGdxUL43qAHa/
	y0hIVodbpU4Lzz/uckFim3hFtIhUhg/YASf3F4VRzwIRjITuD6vEhK6USBeF/avx
	DccxkncHRf7TqK0AqEN/H+ZT6HjpeUUdsUJ5X+mbn7SPgHAi3mW3XP9gEe+LUM9l
	IXzh2mLJvJRaDreN5pFXAsbBbxzNv8ETzW61NR9L4NE4WTSFfqgmPq3gJpH2pnKn
	hAv8JA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkfyqu3kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:16:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e136aff17so24150501cf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776467790; x=1777072590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=;
        b=ZN4b0r6Ip6EwUUco8sVj91m/rwsFs7oOVyHYcTHfViRy9n2GQrfFjE1Wwl0WkZSQl3
         bvjRVGyM0F0BIGm8p2URLLkhOeWMM/oxR6R1a6r/je1Kvw9VVSebpie562tdN3sHkB2j
         K5DApow/Cnt5rPG0Tayob+UpPpyrjM3pv5LEOnAwa62X2YjUAGuSmNP80Wv8DzCHe3p3
         9H5PEHHEzHLc/qPz+eHNrGMTd/hbLXL4xZEo5DbYpGdtRChYkchllRJCOpQCBd0xP/No
         FTa0mFQTQrTQPqOxvmd1aEy7D2PnFhsqZ4swkI3mBeBiulva16ucF8LPYqfe0rUxYwsu
         0n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776467790; x=1777072590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=;
        b=p7aCTyCEIs9bJcWuMh0SbZwhhoU4tL2hzZ69TpibspePwWrtGlfk+Ya4C3ixuMhnC3
         W2nKDNtCNa+URPMY5iFUwUAb+kIn7nDI0cTVbBkxkhcc+t5jQHI0ghBMoFLmKVAFXD/2
         gxKJFrPKyvjbfQ67506lHfLV3uNc0UAr9H+Bx7A/bOk3Ik9ALKQq2onAvTgJnXN9KrqR
         pvrutWA9GzAdmSLcRlNvb96Ecl4zCiQv6EvHxaSEdhxdYBzcqKtAqx1iY8ywNJe73UWX
         uxqDErX/NVSk8MQ9lYBbdznmALSiav4wPfMIgTE/PxSpgsu6YPgTiXnkgbARCESV0uDN
         4KiA==
X-Forwarded-Encrypted: i=1; AFNElJ+1nATUIvEFeTGH2p6QjVH1iy7r7xpjMG26/iGyNzbP1nMVnvmFRCuzXU/96U5SoGeMgJ7Lr7P3oYKi@vger.kernel.org
X-Gm-Message-State: AOJu0YzdzPM9SSUONpjW2K9SNc8Ih/rLhv+7voJdGiIRNrmRmCVoPdj9
	oSbDToE8wkCOvCo6i1xIjEVkGu7rzd3Tf5CVldmRBA88xhwJwacC8Wg2uyTAL5ZQgJkfNZgJLi6
	5PmoFHNmWFdcweD2Xdn8E15zgIvTMiYlw44UDGvCcnLxDCNYo4CDRSdFs7NlKCsjt
X-Gm-Gg: AeBDieuGWsFHgGrcYBFSy8FcaQizKI8xKyjf2iv7Y0wciVVOKFLbYMZp2saq0qW2K8W
	f4CMOAoUjfV0tPagVX4Q7B9komYTl1uINxz6OOjtQpbY/dxrthGxgq4jZQtJp3g/CJ/PxETyL1T
	3DxQLpkBNm7RhMo1j4iuzw0WhQj6lqMyGWNyOigCuKmkDxSqUzN5OXqJZPTL7AWGkxUikGykdBF
	yczzwYWufXIEhJjjPzEuhY8JXaMMEkHHZrngNC9wSgZNpoLzUrV1m6ch2YfF37eH2Dy8a87bUNv
	p3+WZnlK7pFx6jmwBxGRg+GdUvY8x48vTLMwVi8U/MOidKWzVvz/CCn+VoQu0/W1vurI2h2JFuw
	0FgslG5TgLtJTqg5ut/TKEKpZOri43NWYqgphvONCZGgnuTFIvgytCTmk/NXS0hFSF8dG1avj2x
	J62O9wBI3Pl//C2XkjTz5Q7AmspaUTPdOvbo0Xkf230WasNQ==
X-Received: by 2002:a05:622a:a06:b0:509:3141:312c with SMTP id d75a77b69052e-50e36c39df8mr75420791cf.40.1776467789956;
        Fri, 17 Apr 2026 16:16:29 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:509:3141:312c with SMTP id d75a77b69052e-50e36c39df8mr75420261cf.40.1776467789530;
        Fri, 17 Apr 2026 16:16:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad12asm815695e87.1.2026.04.17.16.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:16:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 18 Apr 2026 02:16:20 +0300
Subject: [PATCH v4 1/4] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-waveshare-dsi-touch-v4-1-b249f3e702bd@oss.qualcomm.com>
References: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
In-Reply-To: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=00/cQNg1NYCrw4ioCag9pzQGr6M5HdXkljprZfWJ4u0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4r9I3pRwfKe7m7I0xhk+TZMgKAV07C9sH2XED
 p3U2kOs/rmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeK/SAAKCRCLPIo+Aiko
 1RMzCACS8ny///gSx5KtGdFeNzfsEAXWQCiN7UvY7WbiiTv9uAFzhoF2rhcpMq4hUP8XOkBXV+Z
 aM9Yr2dA7CM5gMEaE7ULarGlYjsr1tgxPn/foPrOGssvxvkkIBhhspHuw9SFU4MVMx/wgDc7DPN
 XLl9k4rrBa5setOah1P+peF4XISgxSE3uBKrJGLNS/37do+cbIaQS2muEdNT3dDUse+cK8Ce/B7
 g3J+EBrojUaK+ersgFWQ/Gj69UXHyrDaRQGepkvaKafWYgcHSVCzMkjmrxaAXHyvqTRFHiqsNVV
 ogHgfLXUwdYqX+/WT2ZuBEA2sxYGC8fE+mRkWYrLG3QZBbo2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMSBTYWx0ZWRfX8TwSrhSeLvbG
 ec7xfhkhyEAEEDsLyCsS3NJRdRKSXrXP5XMYrQoWFLvCv4Zm2iLhNuPY9sVnB08HSqZeeiks6rG
 VyDHu4njH4eef4QDcfVEQBSs/zNzYQJdb+3icVXtfY6m0KZ/tTgAMzxoCAIo7ObUXRYj+R84TJn
 Ja2mIKPfk4yhWI5j66lVjbTjLNpnh4BXOuN1b/rzF13Ufl1zmnuNDLezMyIw9czYac3eANGj2qT
 UXAjQ7rMhEq+Zhz4NXPoxZ2wxioUW+9uObJ14WnO/Ta6WY78UmZlVnOBY9xXkvkfjAWKKSJ6Sdz
 M/plgSr3pHiQgF4me+LftDOVJSEiPmr2vxSH2vLF4S/iBNddK0oBAcFODX4qnycsgkHBJ+8UGHA
 xIwgpoFNHAd0lw9k+40WAl1ArLB8KWLzzZVEjx5qG74ygrUbU4lsQPqNe2AWS2KbH7h0UtYZywZ
 dbCDQWSfTnW1D78PTlQ==
X-Authority-Analysis: v=2.4 cv=BZPoFLt2 c=1 sm=1 tr=0 ts=69e2bf4e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=sGmTDZJufn-iKI-mlscA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YvfLi_39wmYwWmLqxcveWkZdh0R-mWC2
X-Proofpoint-GUID: YvfLi_39wmYwWmLqxcveWkZdh0R-mWC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170231

Describe Waveshare 7" DSI panel which uses ILI9881 as a panel
controller. This panel requires two voltags supplies, so add separate
iovcc supply.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index d979701a00a8..42e35986fbf6 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -24,6 +24,7 @@ properties:
           - raspberrypi,dsi-7inch
           - startek,kd050hdfia020
           - tdo,tl050hdv35
+          - waveshare,7.0-dsi-touch-a
           - wanchanglong,w552946aaa
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
@@ -34,6 +35,7 @@ properties:
   backlight: true
   port: true
   power-supply: true
+  iovcc-supply: true
   reset-gpios: true
   rotation: true
 

-- 
2.47.3

