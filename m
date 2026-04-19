Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388E41D5146
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 00:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776558706; cv=none; b=pyHSwkeJR7QtNoKTkuT3zro17W08pA5G5BNfYtE8RCTuQevD8kl5H8cQPTEMenQ4G/VM3P+valP7s4I7i3tdTFJhTquUyeFztEjEhpBUTaXm1T11kkUOGIS2C+Ch22WZfhd3an4ub1ph5n1McP8XUnlvufhQElkidQaFXmyQy6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776558706; c=relaxed/simple;
	bh=FGvKFH0m8cle6ffycxOl9yBd+Ctg/vSr8Cw5BWUiJCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqhrdpUeR++O3aFJIjjOV9NJ4PjrgsCZ0hgipmXPnlM4ngr3WRoWCDAtz3B4Zh6VIF9R3hx5xSBoYwvBKweZAa8SDQjbssCYoZb8yN8s9AFAwoy3NNdDHWo1IhshH7Bm3mj4mxPsO2uMMVmg137zlAyD7gEip+B/IWAPOP2P+8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MrWWp7hI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQLM+zBH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MrWWp7hI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQLM+zBH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IL7T4i2039586
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 00:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9BJnRhBdmjMPv2ZgiiB7rIRn
	IlSfrZe2ds8ryjQycys=; b=MrWWp7hIE0X6GGmP3gxzsyulbMwB6bPoIs80//yB
	dssa5P1FjWVlbbxy0pDN3dG3AXJB7j7bFw9oGg7xxZlgaPoS107JuHuR2Dtay8KQ
	EFnflp9Uftl3OX+/0tJkp0DUOd2SUETV6kZx74CJ/w4NEQKCjD3CC32udtNtaDgM
	hLDS0dsgdEGqXAKGeC5IalCWs7LGBWj101GU6IRHW30Z2gFzo6LYNyr72f/Tt6g5
	N0ypaqz0RkFLr6Brqk/VT5EdFXUQ8gfmfDNangGoJ9OLk+kALvDrv3ZzxdTJ0/fX
	aHrvvqlXULb0nafgdRpsa30RlCkJce4WE6E3qb1Thl/+4g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx1qrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 00:31:43 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56aa6d6bb5bso1411044e0c.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776558703; x=1777163503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9BJnRhBdmjMPv2ZgiiB7rIRnIlSfrZe2ds8ryjQycys=;
        b=GQLM+zBHrbxSvcfnWsDH33C8OIV9FPHcjPTz6P0VOzxNHdiixIrKW4/5bduEGNcGoy
         X3SFL0ktVSb8rH3y2nRJGeGQhEwWcfNRnXqFm5J0MVnjFa1YsrCpjR0/YZeEtIqMyGoV
         EwcsauvJg5UQQpFLuUosYlIrwvV3PzAfFjDlAfs6kId9XuPlnM+15jjy5h3vUrx8MtNd
         xOHlgHnhw6sH+h0Y+1yczHeXJYTICjxci0DXO+osEQLQzx8hR2DZyzR+71rSl7oVIWs3
         JusEm2RYXbuFvsSWedPuN1nZeWD3MJc0/IpwEec2GkKQraxK3IzI5VGtFUfAcTzC+/e5
         kAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776558703; x=1777163503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BJnRhBdmjMPv2ZgiiB7rIRnIlSfrZe2ds8ryjQycys=;
        b=fY7dqAkaaXarsk7rFquooy3vN9lCwqilgx4FeZe1yrnS+xd0YlG5NR6lpRTus1DLNQ
         ExSBzswN3USB0lLs1YxnLjcxWsVZbi3bqDjXZ2owzfzvZi+hFxBuX/8Z/thtqL0kMu0E
         GkNLRdjewoi6v0CjkxgzWx8oYQ3/kq4lXWCVgqcXRi7oCREzshrYSfrAWnQJCb/4PrZC
         Ys/M1qufxKd82HAY9sf5ZRY8nXRefo4DZx6M3CstdX3JsC6JvZ8CHxPh8UXc2id0EBfF
         Up7xPyUViMS+CNPClHGu1Palbuy6vCWGnIbKxxnqKEXGMw6rFL6lCLpV5f7QReOCC9hJ
         KoSA==
X-Forwarded-Encrypted: i=1; AFNElJ/L869BDsFdqsDu+TDM0I9sSJ23P0cucLzsixIaWc/Sv/5lcG09z3PRIHhz1/yiLbrLtehKIAgmSnQI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj9Puh1ty7Hb36dPjWq6hc+XIRNgYWXYgElQyEjQ0OA5D+qJNu
	z3WiWNnHCcwRLPmP6rGJyvkTaMeBHkdoGkKqLGUllc1pQTLIKm3s1G8WkUu8AGNJYdB4dSPRqp4
	E1prhijNTrLQ2LBmvfkwc63ZVh55UdZnLORsa5pjnth8RsCq/h7RmsdV0cCQ1joUi
X-Gm-Gg: AeBDietEcsNFqYREHReFfK7SGV7OvJf7vehzB3Sr8O0StenVSCLgkaxwEpoWNEvuLOs
	GxQOo05d8/F6ppO4EH6sH6FjMxjSnUUT2VFs9BdrJ3K8TtIMCqLOkXndo7bU/nQOlcWQrH+H9px
	zO6KuHS4UrlPu9D16M2X0Sn9mdoonVuBsZHaWKJNcvVyxEUyZ8MX8q3EhwHL+0N4Ve4FwVPmkYu
	WUaxfjt73NcHoRBL9fqKFVNcMDrJuthdGl/I1fc40AYbvSOK0SZ0SiLL25KDK40yorUvlQuSNht
	KKGrtNzb6LjC4R3xI+uIRnRvL77nwxyY16AKo5Lhim1xTsXe9BIKzLOICmENJ4L27KJDzLfyyYi
	mJDFpoBMhT7EfMrNVKxmuUF8tDl1vb16G19HxLnbopFkU3lv5thnKaVRcN6/uRMmXf2WvR0QgtE
	1CS/5QiESPORN2Imdl+8lUEaHc7mDEKHW3D9UKK6+42lnKxA==
X-Received: by 2002:a05:6102:38cb:b0:608:a01d:f7e3 with SMTP id ada2fe7eead31-616f7c60edamr4073089137.31.1776558702926;
        Sat, 18 Apr 2026 17:31:42 -0700 (PDT)
X-Received: by 2002:a05:6102:38cb:b0:608:a01d:f7e3 with SMTP id ada2fe7eead31-616f7c60edamr4073068137.31.1776558702431;
        Sat, 18 Apr 2026 17:31:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb290095sm13831621fa.0.2026.04.18.17.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 17:31:40 -0700 (PDT)
Date: Sun, 19 Apr 2026 03:31:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Jessica Zhang <jesszhan0024@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Simona Vetter <simona@ffwll.ch>, linux-gpio@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
        Ondrej Jirman <megi@xff.cz>, Thomas Zimmermann <tzimmermann@suse.de>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: gpio: describe Waveshare GPIO
 controller
Message-ID: <bvldldozdtwzcst7vsdjhcwe355r6khhu6jlq5cvdu2mh6ioyo@m322ojan3pa4>
References: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
 <20260418-waveshare-dsi-touch-v4-3-b249f3e702bd@oss.qualcomm.com>
 <177647276773.3416847.5121391765535033685.robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177647276773.3416847.5121391765535033685.robh@kernel.org>
X-Proofpoint-ORIG-GUID: 9c9erhRmseNnfy1mEpSkWJEZMTsKJNyQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDAwNCBTYWx0ZWRfX+jf6WvPSmuQK
 evzgAcoR+f0XFX3ZWxvm8DlySeAnGYwGh0PX/X7E1mQOHz5HXPLI5i/19F3iRhsqMt6I9qJ5Smk
 1wPf++tZS+hcEOmsd7gNCS79xDLvKM+lAZI81vyiah/45QCsKDnNO7Qlsl5DGJXUoGi5vzXCbsN
 +YdZIIQdgSMpOvKLCJzqBxnSgmmHBxKvnoHjsQxXj5Q8vdMUPlt7yDxwVzL2oR1Nd3MDgfq13Fh
 wH8Qh7SLXYqAnmjve/zlzrtwQXNUxv9ZOAFZ+xhyGc+gJ5jT0Ym/4ClODjzXJ7uNF74i19Sd2pe
 C9oBYo2n/xdvgemTC9SMwyYCVxwrz8E2mnQp9edjOvXSyUCvMlP0cEr6RXnlVqfK1NKRubJHlS1
 yXFAiveC0PSRmycFG+iaJqJ/5SvuZJmIevE9Ubid/IldaYaYKV58ZfuUdZh61QsABLRAtgAJwPd
 5P+vJTreTCMEb3r02JQ==
X-Proofpoint-GUID: 9c9erhRmseNnfy1mEpSkWJEZMTsKJNyQ
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e4226f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=0awkmHLjsCMGZ7zvgVIA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604190004

On Fri, Apr 17, 2026 at 07:39:27PM -0500, Rob Herring (Arm) wrote:
> 
> On Sat, 18 Apr 2026 02:16:22 +0300, Dmitry Baryshkov wrote:
> > The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> > controller, which controls power supplies to the panel and the touch
> > screen and provides reset pins for both the panel and the touchscreen.
> > Also it provides a simple PWM controller for panel backlight.
> > 
> > Add bindings for these GPIO controllers. As overall integration might be
> > not very obvious (and it differs significantly from the bindings used by
> > the original drivers), provide complete example with the on-board
> > regulators and the DSI panel.
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 100 +++++++++++++++++++++
> >  1 file changed, 100 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.example.dtb: panel@0 (waveshare,8.0-dsi-touch-a): compatible:0: 'waveshare,8.0-dsi-touch-a' is not one of ['anbernic,rg-ds-display-bottom', 'anbernic,rg-ds-display-top', 'chongzhou,cz101b4001', 'kingdisplay,kd101ne3-40ti', 'melfas,lmfbx101117480', 'radxa,display-10hd-ad001', 'radxa,display-8hd-ad002', 'taiguanck,xti05101-01a']
> 	from schema $id: http://devicetree.org/schemas/display/panel/jadard,jd9365da-h3.yaml
> Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.example.dtb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['waveshare,8.0-dsi-touch-a', 'jadard,jd9365da-h3']
> 

Sorry, yes. This patch is now a part of drm-misc-next, but is not in
-next, until 7.1-rc1.

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260418-waveshare-dsi-touch-v4-3-b249f3e702bd@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

-- 
With best wishes
Dmitry
