Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E295B37F016
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028409; cv=none; b=Gh/rq+gFvbJm6zOa30hyLPXqAeTVl4rf/L9McmQ0fCb4Wq4ngQ9bxUOplkpjVrzt5q/86qMCApQu+g4o4ZTpNxCNvj3sockUWhjK11Ciw1GuYRpcUcNLE1hYZxoxZQXvQZXc86SJbA/RWdDWrPCiayiTOYSH22NJV592IZi/GfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028409; c=relaxed/simple;
	bh=cdQkofKqonQVRCR3RPQmg5mh1tVwYR3iPvbv5tdQJRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZUgOvGmZDFqN+gVefDNsvW1tYlu7+uNtKE6R5ybdhSYW0/CqxmpZnLeurz96Olmbok3ewJh22x8gA4rkI5rTAX1HR00lzTJC4aQyJIq21vFFFFTHIyQsNVbpyKRCXWuyId4x8C2Y39SDmLKkANQgeQAzBlJudlMa12hq7w3rpik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSZQPCB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTK07ibu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSZQPCB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTK07ibu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312dx2Z3081986
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hjls8RjbbsnzsfTsTlRRKkryE1WArQ13EkY6T6bLBfg=; b=eSZQPCB+ldxbDP8o
	bon6ca95+fJaWT6S75LeONfMaUS+38/IC5ze3W3mhzJ9GDWkeLeYsBl5hD8hcq0V
	jitQPn6EBf3wpXnByrYv0eFjSh7VIHypjQ52f+0bEUIawqNd8l0ckDs1N3/+39UG
	LGXVEWEeoFhQIdK14FfEQL0eB9YuwY2txSAoDhnbrY/ibCB96nBt51w2bdqLib16
	INlAS/SqKjLLCudG9TcI/53yky3+NduDUfDWxFm3IFSFfxTqCwj9vlRy5ACHBi59
	0THuXyWYBMa1/oE9UYjYaGaHtqs+fESxtJvDMVec6KoFmCmiPB8n8Fmdb14B7kQW
	FSvKLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkttpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:26:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso58317691cf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028406; x=1775633206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjls8RjbbsnzsfTsTlRRKkryE1WArQ13EkY6T6bLBfg=;
        b=hTK07ibuiC7gXbW8UYN0PtOlB3XFJzeZh21Wdwp4O3Np6SuKVQxNWuzNaeSuNiuyTZ
         IUNe/FuCQxMtciM6Yt2EPuB2+/1zYYLkocHTQ2pvY2VXPtKirSMy7AKrKz5qbAZBK5w0
         ZRV0Gukj4ZNk9lUw9nD0eH/xPoU/VChJKDPnPU4C0LYTryQc41q95+VXcXSrcSuCogkg
         DT0WR/MjIZ+vJdXhamWHV81rR+1TDO3IJ6zdgIT6+GhJwZVxkqXTE6916laBilDd4gLZ
         SoFC5u0F1+RzT9xduEaA4T3whLbb7rHs9LSK/L3cmWcLxL2pocIuC7cCkR/GQTI8TeRb
         xj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028406; x=1775633206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hjls8RjbbsnzsfTsTlRRKkryE1WArQ13EkY6T6bLBfg=;
        b=Nkq465ScqGXmfQ+71IxiyIw4ej1bPCRD6dFXBMdIyNT5Q0DUUbv7iCUHDylKqE5Aom
         6u9/q6V25LgEkSOVXmcDTO8l0NB5eAZd7Fx0cGFIp4tz+A1zYpfwajdrjPrRdy+cj9F5
         rlDyNe0gB3KvOYWCoTVq8cr/yfN1DfBmS9H04B1mNgeBJZgw3Ds/3jn+agCpwPr6ZZhp
         HYfmX7M+ANrUKv5SW7UOXvMX9Gx9gtCrAl+DuX1eUTXegg42LBMJuvDiFckBvB8DzEBh
         Ibx1vDUYHwJDH9BqjeiOTwAr6oydGjRWuVnkEHVx8TfzceBX/30o28zMLnK01Wgz5Cnn
         F1gg==
X-Forwarded-Encrypted: i=1; AJvYcCXusZPLGOqo5mfoOA/E6kg04aT0do9rotRg7FLEFOX0eCyoFyU3pgBcC3YdpGDNabZZWUEjN9Kea0tC@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/Zz374n3VnW+yOQ6DwD4k6B3XX5yZX0G4fWBAomb4JpVLrPb
	kDtEp87JU/ZMZwSmeK+Tb6adKl5Nh+DjBrH4QDK3YoJ34S2o1INVUPbWHB+vsfBDJQdhzVTQ9hh
	y+1ltIlvfkuPcdgvwfDza9vyVklu4NYvxPBiCWO0YO9nuUk3j4HZaw5QYFLHS+WLg
X-Gm-Gg: ATEYQzyx5DiXHbqPmqkxIZfpKocig13Crnh23J7SdF0rdLQTLob/QO4qfEwBGXh29Uo
	1v6pVYk/+pdRMl7rvBc41Ll7xiX0Sgs3+v1LLFzOxnd4EOrjtP9wCl05zwvZm1h+Un9pnis08cU
	3DZv9H4B22exfcc3jfm2e2buohpINYarrk5oMfkF7TgGiOeoWZ0VJe2j74MavliX3YOXo0Fy6iu
	CxEhl0xL9GEqCGzCnJY2o+rWrr5ruohT+AjnEpE0ynz7ysKmQAx9BLCqTi9aOIyHkAQpXKWcrNE
	mlEZvkkurlpC6BnKYVBPn4bYwCWCL+FSnbGaUVE43kW9YnNCxR6wLY3O4/0ZhMdXFDC5ZwNVM87
	pgSrLhV4oiH30cOvJrqlQjRkQ/tlOnXzCKKe87oGeFkcoFPvPFG+9b/9vN6hfgyDyhv3Ju/0jLz
	Dtqso7V+UnW8zlon5ZMI67+UqdioVLCGeLV1Q=
X-Received: by 2002:a05:622a:c2:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50d3bcfd9bfmr34829751cf.56.1775028406053;
        Wed, 01 Apr 2026 00:26:46 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50d3bcfd9bfmr34828571cf.56.1775028404106;
        Wed, 01 Apr 2026 00:26:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:21 +0300
Subject: [PATCH 02/19] dt-bindings: display/panel: himax,hx8394: describe
 Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-2-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cdQkofKqonQVRCR3RPQmg5mh1tVwYR3iPvbv5tdQJRo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMirgQzsB0hpFKG2u7zhkET+Vy0O6KHFG8fbF
 iO7pCCEydSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1edtB/44paXo5P+bFEHj/5QakEC1uvtLwqTP0aX3ugpdP+Xf++7DfgKwkEIGDSKu2w5E/EYi4FG
 1cRLgD0IlDdRln2uLWMGTsJrsc93RvpKKs+0LCD3vbkrWzQ5LhrcRlFuOJNWqM71JtydHKZnZdq
 gUkOBUXePUi25xaSC245oM5BdW09tJnT8YU230/eDG2klTnsm0/s92Al63wQkDCeWErIC1e7+a2
 /+U40yuD08geMdp7QWR2z0vKWl1xYas17bj+RmKvmDOdlwUz6wVgpoqzOzdiU0ZR7GgyCFSX3Bv
 +AZtCruYNJFYFgX7HbvVLMSJGzadtAxfuWPOXWNjaFzbvtTt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX05hcT0zcpAi5
 D3gGypncOvfeiQq0vBxwdZ8VrD8kToJPaJkkZ1BRQn2h0WIJBsz6H4h9WhlmryLg5PgAhMwJsb6
 ysI7+/TYZnwRwaqKL3owGHHEv6kZx4FzLr4+P7Io+s8EwXgVFf7I3gbbbOK5L05wwXfWaXABaI4
 5dZfNA6+WSuxsFLFaNxZKKWC5/SErhwsVtdrsDf05XgZMgrCwoF7RzJ8qxzvdl9i8Ha8P/J13bm
 5rmdvgH/zqfy8SNpaXWvvXZyC8iHLxM1KKEEnw+XTzWzGQkKRua6PnLNRMx9AaRtmJGhyNiLals
 s1YTijmaafSPUWudg+pPEx35yDPPwGmjRpfSlO2NKVYrO3qzRxo5ZFqR8ihJTKMRB17OTcSuJD+
 O1tF6Lreo5WihVX3YseKAFmm6H3vdcM7T/jehTg/sG6uEKmublFS5mSBRbpDwMDYeqZDR4mU9YW
 nfKVAQLSsCsbHOGqofQ==
X-Proofpoint-GUID: sGe8ilx8uGPMbRDcQZMNJY26h_SP0cBu
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccc8b7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0AHfZW8JlnlOAyLNbMwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sGe8ilx8uGPMbRDcQZMNJY26h_SP0cBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010064

Describe Waveshare 5" and 5" DSI panels which use HX9365-E as a panel
controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 84e840e0224f..83c343b02835 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -23,6 +23,8 @@ properties:
               - hannstar,hsd060bhw4
               - microchip,ac40t08a-mipi-panel
               - powkiddy,x55-panel
+              - waveshare,5.0-dsi-touch-a
+              - waveshare,5.5-dsi-touch-a
           - const: himax,hx8394
       - items:
           - enum:

-- 
2.47.3

