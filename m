Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8497526299
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886565; cv=none; b=qauaDqvwppp7td40+5arc76YxttfXzIne1GICQz7zwF9feEPvw24HyFm/nllMrzDS5uBeLHHlm/l5x6/Qe8Cx0ceW2tBPPiubRoDaywMAwDm4uOf031vErFOs7erAO9pibX1/uQ2MI65KNP0LzQN0DgQsoaytYRln7KrBgVWLhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886565; c=relaxed/simple;
	bh=vp+SJmaRpuP5wpJJX9U6EKJzOSkzhIqZAqlRBKoIrL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ciyY0oVkmHDVnvTUIWPHHDsqe8a5+OzE9oSPj0Ydwsek8zjofz/RStGF+bT2Zao8o9CySZwSW0lGmHms4tuzE0g/o6NeEolq403KkCooXDUbGtyXW2k1wj87iauZRCKOVwKM0ffY91vBsUV3Cflypcl9igRiOQkwF8pmWH53tnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BT5o0int; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7KsxpST; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BT5o0int";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7KsxpST"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MHtnR62630103
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p7getAbtuwjys8gy+hm+EGK6ZsIm6NuSTLfjNxjvD/U=; b=BT5o0intOoWRwcKk
	0T4e0Hgl+A5K7WapCdR44MlSEv2s9k1OhSwGweAq8L6iSJH95ZBCx6Lvu0zlH7l5
	nUY/T7lsBc7lSe6iEeSyhuG585oEy+n+my0D1VzdmNI+42O8SR1/5lj3/UQibJMw
	3Oc3mIQNrzTQn9ntRh2Dplm/F8bXjP4K3iA3uOKpkXKstmpvbLQpkIeGWDMgSI1Y
	PBV5kjVtlEUeK8yLqfkALqxkJ3IU5vKylnSOcMHbKp96jl4L8MeDXAeMJso5HyRR
	t8HRrF4cIdFv7gxi+zfSnQJcmzyCPQswJBjhHPCxG0PUlBPafQzPLKqEfW7COwRF
	H7k/ZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35r8bry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:36:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fbc49bef6so33713001cf.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776886558; x=1777491358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7getAbtuwjys8gy+hm+EGK6ZsIm6NuSTLfjNxjvD/U=;
        b=M7KsxpSTWqAjB+RjSVw1Uw6HrQ6HYzM8+SOxfuMSfVNu1iJ2FWmsRzMk95WeiHhXCF
         O1TKLf+0Ha1yF4gwhVQNdlRfq3rUJtsA52DEK6EiBPfJOq+JPGhOXmCeLwixALbzUheB
         K6q0Ci9z7AENgz/3kEmLbUEv74YfwVz9/sBP3XQi1p+q8aC9wWGkICnR9s5gl5xT1tF5
         Bc9hilSJF5YhevJp4ghLjPL4gw4lH7DqeBTMvFVMm+CZ1ekCmFrHon7ek7uRx62Wm8We
         pTavt0QvQ/AItRJVf8BCSdW9Yi1t0b0DsPi41n3ERHOBK+bwBowVkBgQiVG2IJ9Zcq8J
         lxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886558; x=1777491358;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p7getAbtuwjys8gy+hm+EGK6ZsIm6NuSTLfjNxjvD/U=;
        b=K/6MxaMZoG4bP4Z5Bp5TDob6bUhZim4SgKS4CjNsS+FV7vNOhJXHUVplZ1yhRzuTk5
         sqvZJ8+WfE7hTRmlzz7exbYxXi3CcnUTMTaSr05ucCQwQ4JXbY8TRzY9e0xHAOcsiQ54
         3eLaDMHzb2L61rNfe9BIQRYqCep7boy4g9A3aTpe+oh42mw1om7CLCHJ0F1lQ6h+Rhoj
         f4GbynGEk//dDKsygVgtxBPV07hZPixYtHYFeQIXuG018be5Bba8BVj7glnbHZaOeYz8
         hqTp1TDIXsrx6PaadOsfVAKCZT3Qew8JZEHkzEFIZJh+3tk9iVLI4//DEQdFXUJXgEiz
         s6WA==
X-Forwarded-Encrypted: i=1; AFNElJ+PKkQtMuWmFoKFIuX/3hQwQbxZ6SW2w2U82JrncdZkjcPeryO4TfGpxuvw/536UKJu+xpr9Ab6kvNa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs02gDLLTYu2NdeTpja8CYkTFbs6ssPcqol3+E2wpGOuvDEDKA
	6TUa0p4J+taX2kXKW2hQDzKDbV8fazqbhzOowd8E7GxoGkB4CyivrRIH1WJBu0lQVxaF2EB5eem
	bCrZhMHqInAaPEfXQVa6WnRDgcYbkZwC7usBqEl5tsH6oNSN7qrWhywIhdV8vilxF
X-Gm-Gg: AeBDiesCj4JDS9E/YarndHZeXsN4+O+KEUdkXmzsyK6XwLexW1kUrsC61tHZnoxLFvW
	FQqj3W8rlkpPat7MHOdNekIXI17VzA9zcpZRItj43dIReyD28cQsSytM6MOTMt3kk3DhvdYVWuX
	SCQFK2xJs+pqdQLrEqiCDA6KlIgTKOUjAFsNQlBkovd7ylgxp18MNx4TDKDkNmxtrDIB6SkI+uG
	29kau6Bqfp6SaRkZ5k9gLK5n8DC82UaoI5AahiIOb2/Am3LuOA+kcdFCvD+jU3JSA8cU2/tbABx
	ItIu3hVe9GFY0HeXLCtEfxEKOZiRcib99rL/hrWtWmpDrML56MUqOHThZVrfS2ASoe427uKrfqI
	nPJHUuIJt1q4JdG36ckdITJ9KjAjA5ETWSIdB/OlCjn+ytnecOeCrDGkbpYexriCgHB1KcV5gts
	TVAyKQ3vcdSvd3pfZd0TWf0wBUuw+f8ll6ZrvuhHORP3FF4g==
X-Received: by 2002:a05:622a:1918:b0:50e:631c:c390 with SMTP id d75a77b69052e-50e631cc465mr177606681cf.44.1776886557594;
        Wed, 22 Apr 2026 12:35:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1918:b0:50e:631c:c390 with SMTP id d75a77b69052e-50e631cc465mr177606141cf.44.1776886557164;
        Wed, 22 Apr 2026 12:35:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm4723395e87.36.2026.04.22.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 12:35:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
In-Reply-To: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
References: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] drm/panel: support Waveshare DSI TOUCH
 kits
Message-Id: <177688655533.759482.6233087265509719567.b4-ty@b4>
Date: Wed, 22 Apr 2026 22:35:55 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4OSBTYWx0ZWRfX3cNKe8X9dMFE
 HJ7dsFht/pdsNTALyGrUb+IsgfU5YrxXgLpVeWyElFo3h/Yho/IHy4VlYETibhIe+kAMZoMXPdN
 m9pkbW8bR5to9jtlNn9h2//koOXICEP8A5NpOhGB31ni8NSV/q+txCZ9K7fafKcdQq7MUELUkv+
 HpiCXjQId4uLUjCY6X493ByHLXSfZDlCCn/cKs1SmRnssrVbSYWiguoXMlbJucsRzF4XFFYUkbk
 ykFywrXWPGq0EWsAqqkobEqUjvC4AgVMAgk22pYI1mATOQbQtxHw9Mtig1xfyqt7jQdkoJlrxVk
 nzAqRJRq8JYssnjsAqf59kfI7BtDQqunZbhCou6/gwx9leaF49IflJp7MzTZE69ls8Zda85Pxmx
 cZi8sXLdHUjko66FQRca+FpTDTyHVu5L9kcM1kMyWkHq+ItekXjFrTrR/EmvEo7NS15d1Hnd9bw
 1rU3zacyiAJOp1dp2ZQ==
X-Proofpoint-ORIG-GUID: 0UrL2IeouOxTWKhyFWOcx2K4Lvy1zvvK
X-Proofpoint-GUID: 0UrL2IeouOxTWKhyFWOcx2K4Lvy1zvvK
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e92321 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=V1Sr_61zPZr-dZQ6qXoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220189

On Sat, 18 Apr 2026 02:16:19 +0300, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
> video-mode panels, bundled with the separate controlling circuit,
> produing necessary voltages from the 3.3V and 5V supplies. Extend panel
> drivers to support those Waveshare panels and also add GPIO driver for
> the onboard control circuitry.
> 
> 
> [...]

Applied to drm-misc-next, thanks!

[1/4] dt-bindings: display/panel: ilitek,ili9881c: describe Waveshare panel
      commit: 7ae674a399b6d83ab9b463adb61cc0b64e298eaf
[2/4] drm/panel: ilitek-ili9881c: support Waveshare 7.0" DSI panel
      commit: 4c95b2b7d49edc5846730970cef322a6d8d967ba

Best regards,
-- 
With best wishes
Dmitry


