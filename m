Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F737F016
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028411; cv=none; b=N4hMMVu2+4cI1wKz/mnZJTkYUAsNev2iu4cYpwyjA5VytLufy0QCo8YSUKWew1NWwFTKncXYgqF5jlUEdQsFVz1RMgAUd4C5YMolGSN6XGEDR214ci2AnIQJRsUgnsQ37Y+W2bLav2cYZdUp0fyZCfvrEPtKp/kmSscUW5ycZjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028411; c=relaxed/simple;
	bh=9BUAPXzA40V6xuiE1cTes3j3rjDbHWpL9QzXZmTLuNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQ8hcEIq1st9npay67nO5xBY53C0wHO2dbRp5QBnvxQETV5oRnaGw3IhWPtAJNa2yiM23a10n/jYZKyL+OSAj7wIOLPpmj+MaoQfkd4SD9fcGWcm7S6HCRUuhZeY1VUgVLs6VDupkwU57wyMMMakW4T4uVjTOU2FPyzrmJ7N7+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4wX3cMy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Udkgn78n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4wX3cMy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Udkgn78n"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312IsKa1004296
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=; b=Y4wX3cMywAr79oQ3
	YD1uPEYEz9L7HbIRy2n8pFCr3M4vtc82encLhHN7MlyJpZ0rCk2sQ630SlT3Mnoj
	TVZEYJeBZbs2Ek1s8uCqwzam6rpK50aacQ7Mw8dzzDq1q5uKe2VhO7nXDweeDmKh
	67OFuKqhP9meBLM4NYGLk1Y4hmKM9K8F0hm7nHTGaWH9SbZs0VM/XVroj9F1A0JH
	fyoxyHz9Bn/c86xSbk8foIWuIKvmhah3JjmN3listc5l2T2zsfcVnoa8wXXHorxR
	zt/TeEjjPu/IUG+BCfFB8jvZWvf464hIAK6RcxFdvpKvXnnYU0PGzB0mJjJqu4/k
	SfOyUg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjh32y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:26:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso217271731cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028408; x=1775633208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=;
        b=Udkgn78nTjP5ifULDIPFLa/RX8mAzfd7hbNvKo83fSZS9JUaSYdu3CIEFyDNAiVfsJ
         uGytm9h8yJhdTTlsj3vK3OWJycXCMD058/VZiybEn+Ml73BcpA6XExEBBHdQWeJ2pSWK
         MWs0iWn6pDqaGCHVD0bOFaJUkX7zGsySWrF3bm19zcEv/u8rkqFJSeohtgsWgFC33lhK
         OgvlqKRwmQHt7ux7Z72RwmA/fWxFLw2Q3b2VYnyF1wAhNjCQYEjqwqG0LjEcIdp5z2cg
         BdVyiM946R10NOAKGLB44nY2e4zu4in2ibSK6z5Gvd5LQKsgMaC5M8vQ1IN2s6MK4l2V
         xEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028408; x=1775633208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=;
        b=rDDN4B0YZVWYxUnetDqXU2pH9WBrCl3i37ahzNM7BZULa3RRRKw8m3hwzGsxSZPaJ/
         x2kmD3vTxqkbviAmY7TKz7ywNYWC8m7puTWmfDSxyGE0cBv4YKTYuJ4J4YA4lUqJJ/ya
         1NeYnnofufYcgJ6vhpu733I1szez3Ck5GsqhxT7WgY89yokUJiEfhmubq+8jg/zPBxFY
         /pWXA7b5e3fXtZAgZtgbwFd5xEn2IwyKz7h0KjIy6ILkPQXd7DjA0HQRkt9kbqbiR1J8
         qKrAghUcXWYeoaUFNDaL3XmbcT7HHThtx9kdKWylAM4zje8AieBYp/ZbDOt8fzdaDg0X
         MY4A==
X-Forwarded-Encrypted: i=1; AJvYcCUdjBtQBeKWbZsfSWhh6dSqFXw+yuQDTlh4qIYxLnKFxlzjHsGT4yj5YBHxmXbRW/TMAnsB2aGhBh0e@vger.kernel.org
X-Gm-Message-State: AOJu0YyvgU9g1IhBzkcnjv2uiPm9iciYnkntvP5Pux/Y0Hznnt1DOwWf
	QZDV5O39ZUKcn3axqkwdyp9K5SMBM/zJTQ56VKHwj3Za62MJ2L5yR+j6fSBQ7J2SaPL8oH+6GLW
	MfWhhxLg1fks8ftrrTPUoa8MqjsVBk+DY/hIfmaEuJ81urvR/0hEiVbZD7nINcctt
X-Gm-Gg: ATEYQzyMOqLZnObse3QLu3NgEF6JTHbdTThivPpqLxMusoncly4xJB12BMpV6e1YJlN
	Tzy7K1auex5ngc7xA0iwuCgjP5v+z9KDkDJZ5zFhPRmaOr8ggkaRAJpSdp0c6gvtgW0A8NmRXuG
	5IhjBNgov2sKwkglUHszRBPpLfskarEJQx8iBJLGOQWobX1XRZw/r4m5ZkFQaWr5Gw+8s7xUuar
	tqMvC7yiY0/fFx+sLF+w8q73bvbmllUp7yrfJxZGe5kwqQZF8b3sa56qJJqZbgWzqq6Izf/j6TT
	ftFf9XKEp98avjkcftX1dYXzWNcL53fM422qzbSphuBQwMdpiZqxSh9KK2f15l/aVwSBQHEa6AU
	jp4GUeWiniCXOlF0+d63ouswQI7x1n0chQgaLrDPVMDfcGuFXD3jEvJLI3q0t9fUQ2oD7/qQk79
	PUfjvZ0mkbVaFhq7bLgTPLi+phnv2vbZjNkag=
X-Received: by 2002:a05:622a:134e:b0:506:a289:fd3c with SMTP id d75a77b69052e-50d3bba7d2cmr33948931cf.17.1775028408428;
        Wed, 01 Apr 2026 00:26:48 -0700 (PDT)
X-Received: by 2002:a05:622a:134e:b0:506:a289:fd3c with SMTP id d75a77b69052e-50d3bba7d2cmr33948751cf.17.1775028407985;
        Wed, 01 Apr 2026 00:26:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:23 +0300
Subject: [PATCH 04/19] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-4-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9BUAPXzA40V6xuiE1cTes3j3rjDbHWpL9QzXZmTLuNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMirrOKHHguZib7Qm6juGjzf7VRKFXqhi5BrR
 yH99FUuX+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1VJhB/9fEHyhsyKNE61PLHs/8O6b8870lRBQbab7Zn44gpywX00gsld6suPRXxIzjBh6XGUgcLH
 S9PQYyKrqzMfXQQmXjvvtAvWfj5om40XojxzHA2mcuvDWMJSmTeZ1sstCDrQiuVXsr3RlMNSW53
 3civh+M5nEGRvSqmJUhQOalaEHJ7DhqhQNZLKMIqTk0uqe55hMOOFpDu6QGBw3WuiAw6ewqroS2
 TyC9iVpjbPQZiPd4a9/uqsj/Xutp4Q1yAVxjRk9cgPqjaM9lukv2gdvqxAoA/d3cqm/O2wG+OYI
 5UX6Wn36VdacrouZsDcqRjhKllFNhsTPLu87X4MKg5BiVtax
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 6XjOwbcspaGHe4KVHkCeSE0rZjniA5Gd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX5oAW6PkDP0ha
 ZIb/ife+saXe0qYk7OFd1RSnGvWN9KEYGtBYjUEao4EdAsUDU4/bjZGiXXdvBZ0nlJDH9YZ8iPW
 7N3BCf3jxzNq4DM7nzRhD/xMg6csjlgExr/P/cuUpTKSsC9qppofJ5pqyCVhNdnSWm7dfJAfZo7
 q6IaORVB7kmI0XEUt7dUiDrmQof6Haw7pvJmX2IdGx2IWWJow/ZL5b0zFUYnJpaciiJ+Nt5elbz
 Xd1vLhbaJvJ7+uK+SrJIkVXPJ5DV8arbelgOCxGEL8YPkx1LA7f63rQwJcuj8oWM9G5V8tHyAl/
 5EJIWqdKf759dpY8nxwlJEKTdvCMp+dh7XbaoT8XQuABbcbtpMu6Q+23lJw7GUkPVzst0uDXlJx
 tyrfJVfwvjQmTJhuHy8NGxTcHR9pRAslWbY/B/ospHUJXKMBw0hEl7hbQOdLszBnt8zk/Peoerj
 BEdSvOkEC02KvGJzBGw==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccc8b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=sGmTDZJufn-iKI-mlscA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6XjOwbcspaGHe4KVHkCeSE0rZjniA5Gd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064

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

