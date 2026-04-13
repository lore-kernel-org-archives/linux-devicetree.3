Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFDF3D47B0
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089147; cv=none; b=sSkpiuMggtun0yulcEL8XeCzSh8xQDBEoryNod3X1XZAlywTtY13Shwv7kfBDsAfilm5md8nOCBiv4SpzvfzfsZB6xI9pXfZU7FLIkX1lqXJ3fuEQa//8C29pNTfUgk8SJs+wejRpNFS5EKU11Ge0Ua8uchGJ66d9D+Z9XivPMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089147; c=relaxed/simple;
	bh=00/cQNg1NYCrw4ioCag9pzQGr6M5HdXkljprZfWJ4u0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4JmnXxq1hE76A5jBM4s2viShDBCgqGVe9GcOaBWhetdlBw004+h/x8Ku5keFUYye2Yw6lCs7LHmZUcnXUqgLSkkT2s8MfGqjkwToh57KsvKSeQgdTDV33UjICMBH0rs28riLJSNvcYlcJr+u5XzUXdLU/7zjzL0RT1CuyWbdyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqTYoBAf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPbztA7i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqTYoBAf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPbztA7i"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DE3wse1367778
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=; b=fqTYoBAfrCO/kC+T
	2sPHKpdHTn1liOR+f50HefOGyyeG+tQxh1ytjjA//QPZjsPSeGf44V6uWPC76v/C
	VOJCr1O3f/jt8IjqqTwqUrvno4ZfZPQQl22KdMyikokhCqqoHVyk1Rzx0vIgXxD9
	HCxdAUOWn/ulJP0mwKEEt1Rj8bsMqdwuSRTN59xDQRGnbZBDOGI2w0jduV7FdELL
	YNUhu1QO6Bu6dNK7YAG6rnkpyIrQN2sB/gxAN3tr3vUVSoKw0TdVOOddtVolTQve
	f30/WZlWEGcFHSVCVFQmn6JULooEs+5vb4bolV+kR6wgcR3i2+gEG5DbhttrdFg8
	WZ2YOA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtnqsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:41 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-475f6d0de69so6197780b6e.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089141; x=1776693941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=;
        b=gPbztA7iIBEo5+Zh6xswO5Min/9Bs6qwk/bQzLlWwh5BTCQl71L46UskisSiDjeSui
         wfK32vXUWPf+dcrBGJjmSgiWPC1LcnHJAn/Mqnmd0Pc36U/Il8RfLc8OdtUvZPB7rTjT
         ZhmnzXsUnvOGlxnchxvZIXvon2/a5lZbMgMqKQPBSl7HFNYjD07q9N71xDcxu0sbsk2F
         dd/gohvrXwaL+GDi43h8VlzxnooP4j2NLqycm3hjNZlq+tNPjHEsLtoK5qxF7D9MBbGT
         SvC/I+D/wWBWwcHHAvUO1/1VpuvgCIbCTzUxZuEk5aAC7vFW0K0cF1BQ2QtehG+syLf6
         +ePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089141; x=1776693941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=;
        b=itUpgiDcUrl91MF06Y5nemdktrfPGr2IV00e9S89miKvCt+OcBEMavWMnLgKXzliR4
         fVWdjNvMuAX1i/1rs4sa+fg5dv70+fYzbAsvfwtIHy6QflSxVuj9QJBVlo9lT0rjvN6l
         UfebF4qSRCKt8mbAC7ANzbOmN/rQfVH3lYZ144GyqwwcIlJPZYo53Y37oRP2NKwnBkmK
         OMdrJqsJBt7kn4t8axM8x5oRX3omi4mdWljWliFfhQvWC2ORt6Tvbcx0PWBhXNDVp/fm
         1OMrmAwrxwEMF0IFGkQeCtfp5Bt6Yn8OEYdqROcYy0JYVIj0XmudASRabhRENHHEoBZ2
         TNLg==
X-Forwarded-Encrypted: i=1; AFNElJ/hUUpky2p3hDQt5DPxqrjlQmK+V5AhByhhPuNQK3r29yRzUxzZG2H4v9xyEcyefxAf++84kHqix4cc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9CoGAYfhqxJybj0bZ5ILz67NzJBON0kK0Kts+lQC7v+HnoeoH
	EB/7af0sr2C7G4wNPOvBPW9X2Q+Mv5ZQboxp/TPEMqji4i6Mr5HR3DbVZCoo7n8x5OwgmymQ1jz
	e//j+eQPR1yGUoP8sUJn3/84o80dJInmL+PVqQFdKPQSMcGUgS0RAamJBlu7+ju8O
X-Gm-Gg: AeBDietABM8OAtkRXdlgSVT9lUzRZePMYbEv+cpb1hXZp2mdRaKd1zvtiDEzYHmzgKP
	b09EROf9/L+boNM/Txa3RZ/mM4dT/eGpAnHTju1ovLgV2CS4imOv1tLTVp8zHXaPOReYyPBMJsw
	TNuzsn2TomnVA1KYEfRoKfS0xK1YbGZehZ8gRnlG8URb+SxBAYVElLFLi0g4p0Seg/uxVuiYFP2
	8JDIr5li8Rq+4lZ4dOS3VUuOg/yqst8WxBzfsGZN+38JWxFAqXgrJKSW0zIWdPYOLYFM6cHsV74
	fy1vCuyxC05Ik3ciW9DNrVBCvh8t/ccFLSKuMsW/RXEE4RKVgbiQK3nlY+31iylK1P6+/3xfNIU
	a4lrpV/tV/d+FZg5bR5gVzu6Y8ojwMT+cFrBxkbarFNIpwojMlJd46GHe2Sr75n6Y+SgQF5AvCF
	5s2Aw0lFFF7kMmxJgFwa3YyC1kk4CU5+JIavU=
X-Received: by 2002:a05:6808:d4e:b0:46a:869c:b576 with SMTP id 5614622812f47-4789ca3ab21mr6505414b6e.2.1776089140555;
        Mon, 13 Apr 2026 07:05:40 -0700 (PDT)
X-Received: by 2002:a05:6808:d4e:b0:46a:869c:b576 with SMTP id 5614622812f47-4789ca3ab21mr6505381b6e.2.1776089139990;
        Mon, 13 Apr 2026 07:05:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:27 +0300
Subject: [PATCH v3 04/21] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-4-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgmUY5/lkbIsI3ImbSCzEdVXTJ6SyLZWm/sl
 kgSU5YFD5SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JgAKCRCLPIo+Aiko
 1UmKB/9oh53+0taG5F7WFFssDhI8P/ajRU3jHUFKe/0QWQ1xCvogfD4lBbnhtzCbZtEQNEHZ6qU
 4YH/Ywyj5vAvhqTFlanRszfGz5/eKmMHgNKn4fG7ox1IydJePfCpM4D2Y6GI5Xtc5WLvB460wz1
 YzSWjmg1YYY727QYauPvtJ4tMl9EHHgEfqr+LD66JpNnEWCSO8iBiBTWZCKMNU13/sq9xk5G+17
 98e9k3xhcSFI6zHbIihy4OIH9AVniH53PyqX4TDFfX2mlYrUT4KTfDZI6XEeI4/YfHkoJXiVi73
 YjTimH9uIqH5Dmp05lXDEccBUAYH6XsE3bNOSF4MJUvvCB1K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcf835 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=sGmTDZJufn-iKI-mlscA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: jmQ4mNxR1gehQokiSNaLejxLW2t2uJN2
X-Proofpoint-ORIG-GUID: jmQ4mNxR1gehQokiSNaLejxLW2t2uJN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX8Iyzmw2ehgVH
 h0tUGuScGEnQaEj0j06dHAFihCK06oq358oehKAGL5u9jARlacI5EiPBo++KIcNwI+7Kh9kKzYL
 WZj42DYgu45yE4Bq8E5+wNHVMiWWidEMEbrDaXIAdCXddPDZ1Is+cjCiEo+MmZprGi/ZUriSUHd
 Pwc8i+Q9WExy4Nr4LkcK6B/RAxySOJi3Cs2FqSmdbYapw/bl2setXyo91cZKBovNAoBEre2DqBE
 A/mmbf6peu9xZ10YmQ+X/Ep59V1fKVicPHUNb0SLCMjPjKO5nkEqje1yB/Ay3h5kDKUOw639Rhw
 zlOP4z0gfQJZW43lF0dHpRHZz5Jphz2wgrhQa8M1CJAG1yNbkcLj7fW+qHO4Q2jkJEqQp0MjOm1
 /uV+cyBlJDcKLyVVadifvtVMkw0+5wUMC6OELdF9yJWRkAAYyYa5/roMiVKyPBsiuJzlfkX6Ocr
 iLfYZCpfCqLzRW27cuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130138

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

