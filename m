Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2253537E5
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909455; cv=none; b=We+4ymlyYcWCIAweMVAze7oU/3mpIfTPjge/jqQkaH4LRaNFPdQ+LA12UEeh8JzdMHKo2Mhv3ehS8hJb1iC9ArYEc3FP9ypoKR6WpUHn3jpsMp1MFCkYFZVikkGE6n3ihNfreDfln4RYo3dQVpSw2Y6JYTR4NC5jGCvFHd7kACo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909455; c=relaxed/simple;
	bh=USkwXBfci9sIWJW06UXbOmxrqKMlrITA2EN65WJiKAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlXiDWZ8OGTllzkSGpiYrFO4v0hzXGB8xyeGkDc9r6mAfhz2Ix3ryXlJMc2uLJjo4pU26qo/1hCgg6AITOb9bXKBlNP1I0+q5rKXBqeZT8h6qrlFme03rXTYLrW+MVF1gGvNxFCVRK+cOLQBlAdIVxZm18cvnC7j1R+jMDgDov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feTuxqXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hC7wq1Sa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feTuxqXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hC7wq1Sa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43Dg3620989
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=; b=feTuxqXsGcTt9uq/
	6+2xm7UTQX8lQOiyqNWortvOz2yCLVQTs7BBZJ1ZnMLMjdqsAtQL/UiclIiiJ98J
	v6XJla6kY71vBQA7bfIKMK3SNOVYqEkSVgYCQCtbc3203EGPa0jPDpWk3WqH1HNR
	KAozu5PgpJsZvq3d35M7etgA4OQ7KCD1Yi51YFraLxADgDbMglU0sr0sGCrE5CYY
	S+hcQvV1/Rrh01qjSCbVOTLbltrd7EdOgXUVcgT4357hU3YNWS3cS9HboaYLcK2a
	GqcXni2mQXoDrvtCWWLIYXrUy2xEcDELvzcBPS6/CkBJu3QH5Rm0h1YBlmYi5akw
	+snIjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrn9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d831e8083so26145341cf.3
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909452; x=1776514252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=;
        b=hC7wq1SajOc10T4tCXS2/h0sIjZ+lJcE/98pfGFT03LWyPV7XAuDsZME8EPsFWzYi7
         uZI4CkF8eEvb4IyavcR0XjHL2Hzzxejc3fcVpyIZDISN6h9A6j08gGJnfge+lkmnk9OR
         ZlsA2kL582eusj/0nt+XLUtHE/FZgGFw330JiDJsQhEOCunJoWdIAtZ3ZvDWxdNlJpec
         LneZ3T9q8fPLWczE3VQeNoODZJAGNoHMfYS48SogHKKu9os7rF7hVp/rBMtsYDLO7Iba
         6glq1AcNmMKyvfgOfbAh5ql4fUIxzTwCwxuBLrf7L2/sHkrJNItGiO/CF+4kDpt6vrx/
         viCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909452; x=1776514252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=;
        b=Jk6kGQ4baYTIAgDOmdWFZq9NtdETY5dAz07Tb6g1sLoKH1LLR/2XvevqBzKNdbt5nq
         FcFokrkT+6PX2z9MJsuHugkMAnLuOKnAlUu6t3HjMBfXpqdbB0/AmaUgSKNvpTdrSx/F
         vgx5eknd/qq3n1M/NyIHWOkVsZBBLxP4+wzBFPboVzo6qvG9aZLTfmDkTrwBJa+7zHtq
         55LkoIm7JTm/3/uacBIRCy6X70e8ub/tlBvpeUV8WZRd5Nh5pobtPHT41Zj+Bik58xjl
         cJbAPsK9GSQjqj5zygID5NcggIcm/HVTex7faYeivpMsONDdkeCHcfrJ5uZXvl7rmYu3
         Sc7g==
X-Forwarded-Encrypted: i=1; AJvYcCXCITFOkKaVkkC8xxpTgJ25S3uHyEzk5HjiNon0iMkxEOkQ94bw3vel3YQx0cv3xo6R95/hyATsEfLC@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZfe+gRL2CzZm7O8zjm/s+aULD03pJ0l97qGDGXRDvOC8I8wx
	cRJ5vNfZKb0ty0hUB9ksl6Dirn0NXmtKPjEInGnQSROkZl1qNFlOYBWQ0/uC3+QMPolHft1FNtR
	7zY0szxktN5JW7Pw8OZCIYjhC2o79p7vOi6t9Haw23n0LcZfzI96AsPYSTTmHMO5t
X-Gm-Gg: AeBDieubcUlPPrVrmrp1vF2nI2OJY2yNWJsKbK211QLsrzXRO3bCXJbQnFjvb45HA65
	CE/J9UOeIqWIc7IxwEw/NpjyPUTmuD3+QS5c9t+Pes1ps3dn7qWe3RG7MGK13+Sgh3Ed71QNFfn
	qvyd6V/Bk2LnST0m0zZHjQEHOTtNnpL2V6emzFpJJ36sOEexWi7o3466COO8khXckG4QjeKCkmf
	Kc1tmA0Aql/2N9YMGILqb09iWxHbPa+2+/E0YudZoIWnapmiAPopelu4T+nu7IdydYN2cpfZYBj
	EUu/i1srV06R+Mw3gVa2zEgMa2DOJ7pfEywdgpKu4xmRa6EwXhhan9DW0pae9t6dh/8D8g8BELZ
	ZrvYvjBPc9cfdL6SaAok4Po7I7v50VgNwj6syfZzXzYFUuXPwLGxYL/biCuvdRp9CeFMd4cJphf
	8kYy2lLDRR642ApBmtaeBI3tqq04Npqiz1hRk=
X-Received: by 2002:a05:622a:1985:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50dd5ad15e5mr93537631cf.8.1775909451891;
        Sat, 11 Apr 2026 05:10:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1985:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50dd5ad15e5mr93536911cf.8.1775909451378;
        Sat, 11 Apr 2026 05:10:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:21 +0300
Subject: [PATCH v2 01/21] dt-bindings: display/panel: himax,hx83102:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-1-75cdbeac5156@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=USkwXBfci9sIWJW06UXbOmxrqKMlrITA2EN65WJiKAk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpEO9zdh8EzzHxiRDkHCUG+msrq/SXCklYuc
 pmmv0HX3+GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RAAKCRCLPIo+Aiko
 1SH1B/9Cr49LTloTdRXJKJpX7BeidSo8YeqxqZ6HSt8IrpYuMOtkxtPJdf/mPsN6S6m5+af4Cy8
 j/ekpWPhZ+dRaXSfhADqSWB+6zFsmKx9n861kfdOryJgk6HAw2v7ttzUmqt9WPApaaXPSyG5Yqo
 Kq5mASdK+J3ZVqM9lpohHF7rLcxfBMiFbKgMBCDxkgDHLmbg2twHcQunTswlhKdJu+PUCDPoPIa
 iQE+/Bcx2tfokUjYUZCtDtS9Vgsm1rZ01+AAgUuhRJ1yMPImb21SgwNmjFmM2p04wP1kH5QI3Xy
 KlooENrA0RQHmqxPTuObwWxhGPTG4l88HVnE4yFiiedUPzoX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mmR-9tlvwVcK_PNpSyHI9buVQOQ4PwaW
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da3a4c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dDwtKCuX-g0vR4_aJEQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: mmR-9tlvwVcK_PNpSyHI9buVQOQ4PwaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfXwn5vyKCl63nk
 Ju73IJtVLlPhzokuQtUoRfE2QWpYmQYQ2yXk5z+KMMuWa9z+CHQGYGNPYuSMl0R63KEvBxrhvrb
 mgmMuvhBMiop5VXnpqLorKaKrcC9QPPBy/xsh11dQCuLQ7fkmuwcLG99ZSOW0mOPE/ShLJ7Ib+N
 /gHgUR97k7DoqhqKDtqvGeBipsB3uORFu2z4lurF611VURZm9mG2gGIIE76YXEGW0UjcoZ+6EHu
 XKECiwfpEu/6VUP5CNQ8qZKAiUPwBcCYLiPJviHOBQoTgp0g0b2bhZMVrFbG7I5vxtuka97CGT9
 ruW4IfdJKj/iIU7OWEg7aEzXxhHdipPhIGjZ5aD6SatwyzF0UxT1kT2q6NLWu3ddAnO50Yfk4eI
 AqLsLYyXfWsMHtnxVnyYeQe06+2G40tEn4lug4UUP/C8gw6Lf1s/g9pkSy4stnGyLmtv5tLlHEr
 2dAPKdmS+An1j7qeLMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

Describe Waveshare 12.3-DSI-TOUCH-A panel which allegedly uses HX83102
as a panel controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

