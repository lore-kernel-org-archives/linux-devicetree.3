Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0402A352F86
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909461; cv=none; b=I1bpPSC1TaBHMIqBt3IdRYz1ehoRMQDSO9U18PvKdYBjo8kYC3DokUFb+AK+w6lOriHT5gF5WVSiKdcBwkl/KxTwdsOVFV1mWr+dUk9EPkIricryIa7sTYTnodrjZjdo4X1WRBYxUhic4+s4UhMxH1h3WPCWU8DbOwuY+px97hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909461; c=relaxed/simple;
	bh=9BUAPXzA40V6xuiE1cTes3j3rjDbHWpL9QzXZmTLuNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qCkA7BhlXwCR9hr3Cxuf1hTwRFaAfadLxyc8iVIZVwX2vVeQ4A89xxloMKXA2fTc8wjgmSxlTvJ/TrhuKFYrPBLTe1z4/59ocAwjyqVcYtcCgxx4h013DIix2nzu1WwWkAQWaMw33o2+F88SOr4qiPrpSbIifQ7Mvp3yRZPwaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9S4tiow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VRfClOuN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9S4tiow";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VRfClOuN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B40Pss3909930
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=; b=E9S4tiowfZFoDsAp
	TLO9fEv9u+ITc+ygALNIqMhaKy1la1Ow1HP6qBjM9i/YtoZk25SA+3LDsgEGPMrE
	fu1Y4Ccpe2Imp8T9yfLh1yZL8JIhKpILf1aQdtIm376xRFxaVsMU/KDgH9LqUlB/
	wKnWGwTYFbn5j9Aep1382T2gSsLjcSoTiyoVJQkAkxRoSqX/mOzbCLWvE8eBtCAF
	qMcwrwM6nK2/I95RGk79RFxBP6PJhwIdi/DdawWJb2g48H7ePaiy0oP28iSyuW/z
	x/KzbyRoWIlX/lKvNEwBth8Xo+dwrMgQEYrkZcbtmCc164bB9TaHBDe5KZUjkilz
	fYcAiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew00nah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e8c47a3so25125311cf.0
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909457; x=1776514257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=;
        b=VRfClOuNHg7zGlxoG0PuZfZaaYw+DyP9IpIocDDlmxPDbzDA0cRThDqDpBHRklULfE
         oAmr9f83M+JfnV0sAB+7jNATMcMf1lNNJluSe4ym6LMP1ajoua9OqwmlD0QbU9JJGyhM
         YmPmww+2Wo7r/s884o2gouUpqd1Qiji4pn+rkZqeOv0Uxhd5VPFuhMAqttnVvM474uFP
         Wfj+4Jimi9NEEyIjnxx3Rekq0qtqW/ogl09WKuzxmSSWPVkRWh5g9glFvQQRzK6C9PoH
         /wIj15TwB0YbO6HxmjVZVoqJhgSS0js2rdc36bgMQgcsWLAQrSf0MMDwLQQIB7fY2iH4
         tIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909457; x=1776514257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=;
        b=RCQqPneBKeeJGn0y9b6bCHJEcqXVu4sN4owotGHS7MKXVgMcSHwNz/y3/3hyTWvA4a
         lpkMQA96OM/1SaaUNb7q35ONGpL8UBYyxbgX/vGC0/SqzmhD/jk7EplBIWp4hoIn2Sgj
         m3NE3hK9bbY28D6PuAm6eTbvW7f0s/4r53KEf2oU9i04dpETCQ9Usmsnn1h3Q0P6WN8q
         kQ6Y/IORXgWurkD4Da9JSsC0WDfi7zx0e8nDYUZs7XNgsZ2Rtbqa/iYju2diKscxg/Kb
         xawXJ1BaOMWIyCl3RXwjSAAKfdzmse7w/m1vvuvjwm5RYzVuMeDNXaiMvBAkC34CiMdl
         v6dw==
X-Forwarded-Encrypted: i=1; AJvYcCXKOoJhCc5E0tmWmCOedMio4MAd9QUnaMl0kxB1pTnQc40MfYmFn+HTPNoXiNt8aVaiF42EUl+cOx4I@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/7C6W0e5JaKQlVrhIEkPMnm6xEL1dK1i8EXU4y6OVw3De/qZs
	wALQs7GcRw13yI3idkYm+e8fnaaO4vd8GZyqNt68AYYEbMGydKSsSKfAiLqPmjYvM9opU+sGgSf
	p9FRhjnxI1UdJdLfVJ5qcs/BFipZrZBp3d8c4G/HkZ2bTkC0d4z58GMS+Z9Ep8ZjA
X-Gm-Gg: AeBDiesajfNMLrRl8AF60THFY0yDQyvOCic4pZX/2lJQyzrQJUNFxFKJz19ay2nz+Fa
	3MjT54iCZ2xBNlH89pGyvy35b3aIi2biXmkTi06BVmFrURgzZ42WnNE7X/mVziX+co5fvkQ2YgT
	RMVvbg2bEAI6W7Jd2qi4KHceehyZ8MZUTkLj6IWG4B3rW57Y91HCUF1XveajWLS2Ms5dqZNLaMN
	OtUhS3hwUnKbNUj1yqYUQbjkhYcw193mD3GQm3QVXVJVBY3uhhV9fuOmourbwwugj5iGCOK3IeO
	4FXGP1arhQFZdXpyYYEWrnnKeH/4en6jwYKbkn8EeMWqTlLyLGOe3PqeZbFUnlhr2gk+5ZS2mcu
	olsIHeKosDTQcHjJmRUOYWGOCzUhgyhNvQl54MFNi2SyPdt/Rn8P05vIGhyyj3Yjw58CYC+/Kov
	blcMoOZWfgmPKQGsknCbOGrkmO2+x1rPUyvkk=
X-Received: by 2002:ac8:7d86:0:b0:50b:4c84:67ab with SMTP id d75a77b69052e-50dd5b0ff39mr103408901cf.17.1775909457515;
        Sat, 11 Apr 2026 05:10:57 -0700 (PDT)
X-Received: by 2002:ac8:7d86:0:b0:50b:4c84:67ab with SMTP id d75a77b69052e-50dd5b0ff39mr103408311cf.17.1775909457072;
        Sat, 11 Apr 2026 05:10:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:24 +0300
Subject: [PATCH v2 04/21] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-4-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9BUAPXzA40V6xuiE1cTes3j3rjDbHWpL9QzXZmTLuNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpFbocrGiN7ZBRTZM2TGbU+Z/32ClbWSrbxz
 BeQ+4Z1pWyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RQAKCRCLPIo+Aiko
 1aj5B/0c1m3T5bLh6t/sQxLI2Yj3c6WRggvJBal9skVpbLz1FZi2u7tP6Pm0K3KLzfuK4q2tbbz
 d0jX0pNWROKJx3ah5RXtsUQH8AwxudUdqkbZMp6Vaf053o29bwAt20NwyjmWiHl6K+bFYniIn9T
 TeaDNTCFYmoHzMZJ5isZuYJIKSyEIGbD93xrVoqqeieuOXmW1MNiWnys/Z6dMnSQC/WCTH3dSv5
 fXOMRELsG4AhrxY5HDMwE4mmcOOksaj/DoqB7PDhKoNJQb+12av1ioJHhjnTAb8B6xf9dwrQr/t
 Zx72oVVLteFTwZcqDFUgCnNWskT0rT/wKsg2znbtKB+xQTF5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX6chUDfcwxXXa
 n/NYwxZqmIu04tXY1vwwmriuXSx2kQiTTZMNHDUKjeFcynV1ICvJZQc5YxeXMPZzhZieZvjVyp7
 YtGBejPYIGT2fEbXH4Efv2Ea3X/a8yS71Wj9kZ0YPcoPVdcPmVtjTWbz1YjkfZB1wU/oEMuX8Bj
 SVa9I1G+Z0lq1BNpW5AXJDlgsDPlqmoSsccv7G1eppBJTMBm62f/vog5mImm8YVpXbqG3rK3zhv
 Wi3FB3qTuVgaLKjkW3lafFFWoTZk13qykZB68EEaTNBj+9DQaaU8SoF1u/DyGsE5e02DzFFCIqJ
 NH2c8XXPZ6XS0hrACjl2UkW1mosyRTEsu6xCbHZvRwzihNQs/1fcVHVL0F92TcXFHdTTzbl1BoA
 ogeY3Gcdtz/e9a3o5g+7rLm9f1MdcTDnTs5Mzc4hX25Wpif5OpwQc+AmYRoTWXlsQiASTmR8MoC
 OwMdGxHYojog0kSgGkw==
X-Proofpoint-GUID: kpbICUi798vNvwEDbsmBY741RB2WR6ua
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69da3a52 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=sGmTDZJufn-iKI-mlscA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: kpbICUi798vNvwEDbsmBY741RB2WR6ua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

Describe Waveshare 7" DSI panel which uses ILI9881 as a panel
controller. This panel requires two voltags supplies, so add separate
iovcc supply.

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

