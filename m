Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74B83D566E
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089144; cv=none; b=sKA13wPCvZ6S4i8XGU7U3WRz69iRpkYVelnULONjnZAzu34/wsiKhkPRZe0sBeL9iJCrtxa0iX9EdCK73PWoIKbg3u9IH2pCVhDoCo0oVSveBIP1zYI4yulsEkrqVNte7qwJf3wB1lZedbOvU2D9l2dI+uAQKWDaRWBbNZPuHUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089144; c=relaxed/simple;
	bh=N8CKm/X1r0MFwLfZruus26Jh9rArudtbcfuT15AgEuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Athke/pX9eqRR2u/anR/CQL8QMw5pNHYCb7lqe0kdPkSoFgcX1+KvgxfxdS/2vDZDMy1VM8Iku7R0W1KWyTTZVVVu3l6q6Va99K002kA4MK2e8CJXrsjKVRn82aamZcvGlC5do7qKf8ADIdViqyu+8/xohM1V5fdhsqItWArTPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dS7kjxdF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bh+mSvON; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dS7kjxdF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bh+mSvON"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DE3wsd1367778
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2x5lTfFSzhFGUpvlbYeEl+bXq1HLvTyRTgCgvYE/a3w=; b=dS7kjxdF3PZEKm0A
	sn85rVQZLfoWAfMoUoNnivArqgEwhdE947Yy4/MlM0nITN0fEMU341LDmz8By+1F
	StR/h7W7ZLlM8x1n3F5bFmQxa7mmPkK4H3uwhZXoPhrGWzmjXDuDC4MCNIIu4iBN
	CtC3n4Ov8VcJ9fHG/jSNccU6j95TdcRu6Zu+d+lLXPvWAQVQzYjjghqF4mHk0pnJ
	oftKwEEMYXPcozrvrvO6SI/jDWRMcLhSf3a6N1Y35qJ1GMxgPd8oN98NtPnTWuzC
	B8aiZorR5MhI/8myJ9caLY8n4NfuDy9LmA5/BCOYOWaUaqLgZQA9A9NwswYm89K+
	llqcgg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtnqsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:39 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-41c47598af2so6911566fac.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089139; x=1776693939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2x5lTfFSzhFGUpvlbYeEl+bXq1HLvTyRTgCgvYE/a3w=;
        b=Bh+mSvON57Epc/UTHyYPTOBtb8KLZ3UC4uvdE1tH+HtikGPyzUTLbCcn9nyZK82MoT
         1oiyJ79NQqBYryGBxAm27Fwq44FWhi2nBlCxIYaGkAqva1JvMEBZug37XDctAM22TxB8
         4DvOVwKDLzNwPpwh6cVzHmSJYbEptxhAoBMiUy7mAep7nar1RhWfF+WhBJbHfu4MBM0d
         MAavV5y6fQS6vk4eXA/3H9e23inO0xLWjEeya9Tn9vXWYVDrrvcerg7UF/6vRdsMQ2nN
         viPomoMUDLVCf4/coOYd8wsq5Mw0d2vHRGqg9UUFaegpMmmiwH2q6pUKtbQfOEYthPOs
         5/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089139; x=1776693939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2x5lTfFSzhFGUpvlbYeEl+bXq1HLvTyRTgCgvYE/a3w=;
        b=K+PBbgNd3qJ5RFxq38yF/3vyzFWPbpC4eRo+D+bibcPZMZaVZwyuO0Vye3EGXHttcG
         Utn6FGxrH4Tt9g5MkUGmlmCeIZjp9osyFLUmGJp46d6UIb/0prQa9CQaNO3C1GBHnlxh
         DuLK2Y9Ce2LpaT4elf0fHqgIesf5mQDd9PkCf2WOitoM9trIxJCKWp4snox3aX9iIdzi
         maQ03znSMikbE/JXjjLcK1D5AcQnIb4jkiUhbgMKCRnPTiICeAlm0SR+f8SxoeJA3r2H
         NiwUkjvr5ivGeg0mmxMKBWS1BO6eWWkUC//dGJKe11K8MmN5EkPxH6wbiev3KXuoRdOb
         RfEw==
X-Forwarded-Encrypted: i=1; AFNElJ+8k/iK5lhV6HsfQCh0Ma3x8DgGViRewG/UrTx34ht0wF1zrqE7UWjm6zZzPzaRTOzouZUua1CWWbZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YwV5AberjrzgoCGhDZ7MlvGm2dNFr48Iz9NLgPGmxZR5ag5kwxO
	8i/nPINn9TVht1HBjMMnI/QplZMUID7VpOUpYlej/KXExFRipQZazMiFTlqbnn31yDx1vhzsLS4
	KKWTeaaVAaQ+ga7wDiY35jQJJsBMO5o0UbyoW7bpKjatkGNKMSQlS6G94AqFuOVaz
X-Gm-Gg: AeBDieuRgsb1X8dWIA5OuFmpolhgp9iRdWFXdGnQpc76GEFfeJtJIuwDBA5afEGtuXg
	CfG8Gx4lgdY8OvgqfiTJSdDFi8ZGWoOA29RGTk21yRYxaHNEnroEHj/pAu8BbzA9p1p22IJW3/I
	i3AAG9mSwCTEy9afj6UhszbFni8JqYLB7ePiphOM4CXJ3IiGZxIKZOzbewXxyMhfQHl9sP3O/Rk
	kJEvpfj3WEdaigF62IOEa5DbvyrUlC9Dm8J9iLQNr5Td3Xc1kjMcVj/jMcHanNgTZGkNxshhcU2
	2l11gxxbOq2tdMZ4crca7Wi8cvjKhh98rbpfL2a7FniQ973ayvlJU0o99mKsjvovv/z2pSTrpHa
	r9P9dLj7gtGjSA1LtRfhQxwKPNBEWuy+mwvXiPITz4IkbQhrbYP4bMbNoU8rmDM5x1NOIAI4RRo
	TByDMZaRWS99/jfFzsx0WpqBRZpEHL+6eEE80=
X-Received: by 2002:a05:6808:6902:b0:45c:95ab:bce3 with SMTP id 5614622812f47-478a0808fb3mr7049815b6e.46.1776089138848;
        Mon, 13 Apr 2026 07:05:38 -0700 (PDT)
X-Received: by 2002:a05:6808:6902:b0:45c:95ab:bce3 with SMTP id 5614622812f47-478a0808fb3mr7049765b6e.46.1776089138303;
        Mon, 13 Apr 2026 07:05:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:26 +0300
Subject: [PATCH v3 03/21] dt-bindings: display/panel: jadard,jd9365da-h3:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-3-3aeb53022c32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N8CKm/X1r0MFwLfZruus26Jh9rArudtbcfuT15AgEuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgmtV2U4qkj8T0cpHphotJKmtI4IJGeFafmg
 qO3OLzIPsuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JgAKCRCLPIo+Aiko
 1UT8B/4q0xvq6ZwlObUFBLEhkHWQvegj9dvxQI7ZoiM+0M/GVuHpOSQ8lRveP/WDfIhcWYJNntK
 6A/lRe1kyNm3I9jUDhoS81pgt83FbET5h6itAm3CglrlTuldKzBv+3SyepEjZOloFYJQuFBKqdX
 tohASKSEEOie4+7VJcc7846HlFbreFEhlaeayc8hFpUPI8KK8S2yf+4smFhahr2zTEaIL8cMbEY
 PWP3pJBMQ+tKzPi7+jcL4oE79WhHp63HSuGhdq9sUiqETHjb9HrQQ3KndGCbdDxWlonuDLJLr//
 b+kb+Kao5L0jK7kKHxEENGAd6gIuUOwuTvcJ2Sr511VzueIU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcf833 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3ozaZGYpt45I3yT0zMEA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: bKW-kiXj2IhSgIg2nboMsyK9c9TXXWed
X-Proofpoint-ORIG-GUID: bKW-kiXj2IhSgIg2nboMsyK9c9TXXWed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX/SPU7YToapN1
 BbtTcX9/O6n1AC1eKmeDYAOdh2bmoIBqbeBvlngsmMJvng+khsFVLIH/a2CpagN/yzx6B3kyEQc
 Y9xQvAuDJPFNJ/opYxYXsBE5WOOe6hs2u3kZN8l11dElVwQvyq392Pi6flTTO4GelGUAF90NNXI
 zvbHIUKNJQx+3dOEHS0DfY/TUhGSlLg7YOeyaL/47MtmeLCoFHglgH5gPyFxgZNS5Z0ATbyuHIu
 Fv3uK2pRXawWv50cyV3e1C6PlbW8+F82eLOg8+11tEHeAuDtU41KgTQY9jG/erBfonkVuqg26II
 /f5q10XZxNo6MGRm85A13CK7H7KiO+K9uLkyUGPjoNlymnuHcpsn6yvUlkaX7LO1NnQtRDr4BKA
 aZq9jw0aNSPu7h4zUnHh/ZF0eagPGMqqy/xB+ww+sFbJtQr17lJMoPIPEEf+Uq/UH0uRnBHQJ22
 V+E/WkQjNFCW5eKpPRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130138

Describe Waveshare DSI panels which use JD9365 as a panel controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index e39efb44ed42..4eae802de9fd 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -24,6 +24,12 @@ properties:
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
           - taiguanck,xti05101-01a
+          - waveshare,3.4-dsi-touch-c
+          - waveshare,4.0-dsi-touch-c
+          - waveshare,8.0-dsi-touch-a
+          - waveshare,9.0-dsi-touch-b
+          - waveshare,10.1-dsi-touch-a
+          - waveshare,10.1-dsi-touch-b
       - const: jadard,jd9365da-h3
 
   reg:

-- 
2.47.3

