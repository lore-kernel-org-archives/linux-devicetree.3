Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725A83D646A
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089142; cv=none; b=TyXosv8Frion7YPdo+5G1COsf+47dMTAfv7ioByHmTFHG9eDicQcEMNzjEZqrg8gRm9FL0GofQFh1GdgLA2v7tY2KrC/ijUUq2+PlC9yr0275beQn+8GEILT1miBABVKzmnPT8VlecKMTYDtZZTnELR9+WFn7NN/ldgzcqaYLys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089142; c=relaxed/simple;
	bh=b6lJFQy4133z0QDWI8Z8xZQHGNeBu8+YH/BZ7Z2AGmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nN4X73psNEEkH//3LH1OMFlHXkOswZ5Tsu0E+gh6xFvixaHk9WUU1W8fGpmHQeD6KzXwpgrcJAIGMvbfs8JkvGCv2VyBGS6KraKD3HXjkc0yUDL/TYGe01h7H1PMPzIzwHw8cr4+XBvtPZovgxTjHzjTdXoPUxuFLU+ri00JJzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWFSDb+5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIcSjBWE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWFSDb+5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIcSjBWE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DC822E2187721
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=; b=PWFSDb+59IiXJL3Y
	Dd3+l2neFoQ+LBWhsNZ5z8zvVuvKa42FFYMzza32bbeBaVmVIrjt0hAvtOSDkzKz
	oMdSeSnvQWkLG0n0tLkPpUjvsh4+TrNBMpCm63pn22Q14U9XZGboTpexQDU+S0Gm
	BFpxERNMc0yQBvLVwcWGMvzNGBL3klGUNuZk4s7McYJODLlAzZj+A7eJotoH0k6T
	xrtF5jAiUpB0hzOmDpDODIP1SsY0ZlEyKGpL0dybA6z5B0C/UurQHgSZrKpQqsjm
	RoOhvbxSMOAou9ax3HQ0dtbf5Kdf/w16Ux1ywxWHb/j3C+QG2l4joeZ4etqGLtyT
	g1p6qQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hgd6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:37 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45a8cdc7e01so5307654b6e.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089137; x=1776693937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=;
        b=QIcSjBWE3zOq0XdC4Vh2TdAu+bSf/qGS3WsY2yV9Wp02qt16plIR0CUYHtAMnaxDNH
         ogn+kJuMtPT9ZVkRoCsuxVo9dKWcuNR6FIt3CJn4ax3NU4jlVqGUQn68hP+WCQjy4x2o
         5bx3ZsB26eypBzu3ZKirbvDIY1kp7QU56Uy1mDpr2Kdn4+8XboiAGZ7/8HaL4pPrzJ14
         GfK2fKd08sTtRrMMtaVtif7SOtKVEtJVVkZYFC0fGEi2jjZB+G0jOVITWgtQzHngcmhg
         8CvwVpBD1WicFnhbt1Dog7NmMFT3KSan+Jn8Tu0cf6aLxJ5nIBYhkwFxU6jsEUHrf9k8
         vRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089137; x=1776693937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=;
        b=VuBWr2l9j/TDWHCOl2epVP6lGmO+DbfLVtEF4GFYIKBUgdXyGam10tu7P47XmCbEki
         1kcjjNJLbcoxYfWSbRpwXOK5XLFdw0N2YHIvYws052bqEQY/rG9smxCyRwmzeHHW4jre
         tStQoTbBlrswQMNHj6NTshUr4UqIetjGHQC/aDzef+qIIae2KGFMxu15pjMFRNUuVKlJ
         C5j/4ktMRc0iUG0jD3ZfA5xCioW+Ea7m0iWGAMcvWHCLtaEmDezfcIwD9d6DEbat1Drn
         +cfT5ISSjpY6PTHNEjpkq5Kdy4CS6fU60RBhKaQDVMNWYsGsZ9Na7JeEgogLgM8l3T90
         E81g==
X-Forwarded-Encrypted: i=1; AFNElJ+hj4YOlZS2sgj0q3Vdlw5szfLpstA6IPiWk7tj3ukUDpWfKO3ICRB5XoLTa/WZpa35RPwTCJqc0Yb6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw6hT3+2EkFuRi57aUKNdgij4Duz5FDhvDIbgeXBMh/em2uswR
	G1VL1cu4oiOm0yMaW3hCFa/UbGn+H6u49kO64IHLLiAQXz3/kRIi+z7kx2Jpj4h5VRjEySsihbL
	fxnOssqyQmPlVQ4etaO09wS2OTfTMuGwInAzMgfYrmKr24Oaf/7VaDlCut21XW32x
X-Gm-Gg: AeBDievoz2m6OJoY9PJypDgi+PaVtQAybWbjdXZOCXvQ2/aUMo8burUlMZWHrI6Kuwf
	KMsz1omCaIxSUHhAn5jEc5mky7+T8Wpm+FxIpdvCo+X8Yb54lJy5nnSZsLbBi7Mmnl3l49DB/HE
	iTvl/ZGOFs0Z7EAuuhauD0zkkXGC9WpHhmnjm3p0KQYpkI+w0HwmpoDQv6JGbFHOLe28shy4zuw
	uQ9Y88Au5+dabafgfM5wF8aVXlbDQprGHgrKUAPlI/uYQtecP6P1kfiBEgnOnFuRy8rcIntPDlZ
	9DxGa8oIUDo92eBoiXESMQwFU090fZOxWa87KZNKbCmvxhZZkMUoOXf0VnGntbUBkDYjxDeEgtA
	aPvfxeApX6PbbZgdxGod77+uFhQrQKsZLiGLXu7fBc/vgXBHFUfjEWtGya6XSzFYHorvAYvtoKE
	9BPxc57M1Ay3vd3Ooa4t2HBR8Gbb7x6oPS0TI=
X-Received: by 2002:a05:6808:518e:b0:462:aa0f:4375 with SMTP id 5614622812f47-4789f20b19fmr6692745b6e.39.1776089136939;
        Mon, 13 Apr 2026 07:05:36 -0700 (PDT)
X-Received: by 2002:a05:6808:518e:b0:462:aa0f:4375 with SMTP id 5614622812f47-4789f20b19fmr6692695b6e.39.1776089136463;
        Mon, 13 Apr 2026 07:05:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:25 +0300
Subject: [PATCH v3 02/21] dt-bindings: display/panel: himax,hx8394:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-2-3aeb53022c32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b6lJFQy4133z0QDWI8Z8xZQHGNeBu8+YH/BZ7Z2AGmc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgmIKJDbaJv9dSV7hV2tc76PBOML/r0GSj5F
 qL/vUHV8LeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JgAKCRCLPIo+Aiko
 1SbGB/4hfXLcVYqX7VE6XHazXmPGrasJ6tcL/wypAthBWUhjrNl8jBb9lv1J0jFmAEgng9lmMBd
 8KVdC8F9BGVazj8lT3khDUMphrSzH2xrUA7R0MB5isGInE2HiTfU7l0LcFKmP6Pf2mvy3mc7A4V
 cKipRgxdl/zKgz1+Be1tuUrU2H+JIhNCPqWn2CmpzgS9Sc5HcHmPqjLuzsQ+AGhSqba2hTB2Ui9
 p7vRCWHjyehi6qr5QeTcpc/7lPDPVxkOXKG3q4GSc/x0LR6jYpX+dglMPz3ZT7T2mcTR+erOfZy
 YB6TqxW0NdPMw+54/yqGruhCmcFR79yIZqnfJB6LV/DP4lVE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Ksm15In8cEpt8ajJb5XYY8tVEcYT7y-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX6GotuEQmWpNV
 ecM6DcsY6AOuQzgD2CmHNr2D+yFYpfhKMTV5NKSQA1xsQkB2K5zYHpdKNvKdzubif5dSXMa3XXD
 xcwbs00jB7AiOMLqe/M1Bgh4u1vIXKYhZloUZfRYK6MGwYqGXwpmg5GFZ2JXFYEeIMoBlfNjGTP
 TGrxcFYlYLj0olJbpk1RiOOEx2x6NX3SOEIulcqlSbyREnHZJKErXdU4gbmMZrw87bNgxvY4xKZ
 qPOyuhvoNeTy2qkWJcMZY2sjgyc1Dw9rfXGUeJyNdz+KvetPF9aOsh1W3OVIU1kl59hV82wH+tL
 cGI1NFHFpW5wZIOzc7vfvLJTZud4mRG7WnFQPAMv2WLj24Bju3c2s8cv6REY5hl+Fku41YhTzi5
 VNOMjMYz8urMHniJV6gd8QA6iBoGO8+OFVBoP/qA6/ZAHtEes1idvT7oavhZJ/mwmm+gpAhHVc8
 gUH3QAe862m5+zPYRCw==
X-Proofpoint-GUID: Ksm15In8cEpt8ajJb5XYY8tVEcYT7y-m
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dcf831 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0AHfZW8JlnlOAyLNbMwA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

Describe Waveshare 5" and 5" DSI panels which use HX9365-E as a panel
controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

