Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD9D36E468
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361474; cv=none; b=iQe2aY+pTeoSS4hdy5D0h91AkDd2MHNruK22Rh7Co9xG51FnEtBJP/nE9/mAHk4QIYRWPzHLBoCMtrqcshvxwx8xSUkSD0/ggQ1Das44mqks3hS1Xa2teDq1TwS0spkCQWOPobnEHyaThq9cVdj/9HdTAA/o6CTaEFLpxrCJZEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361474; c=relaxed/simple;
	bh=ulUU7EJMYfrda76jBRn6JheT7gqj1wPjN2Q9XZwxpcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDctkONqk1dxRKsfaVr5klS5NoaeLWHqC0jzBodH0NrjQEKMF71LPismiGtUM/ToCNPrZL8bQ7hFSFJL3BNK/lRFwJ0O983uCi1aNsXTG+sNytFbIaWXklx6Tl3H1NRlcLDVI2v2BGBnM+XcRQvsG6co8TcEi3e0II9g+R4Udpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THcP+Nbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVusiS68; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THcP+Nbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVusiS68"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S4LAvw429013
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bwq72CVADBTaOQqPqrMijBTa
	KsgmE9bGcYbY85sgZTA=; b=THcP+Nbs94aKZHmAcQkGVC6CCnBaXlEYcymTlG8l
	mk2lZK/9g7YQ1nkclsowUt2GLif1bteybOYS6KfEWLoQ9WMTG0QZybAPUVVIkqkW
	3QJtnOQ89f8CSOjfH2fjgH97KzpvhZme6ekSDnRs7eI5MMsy4NYWpO9AVvs7o5as
	Mw8kPQTsXgbypRo1zHowDkVCru6lDY3eNZXZKtOjujV1DyOxbWyek0t6IOqj76cd
	SvD+RHqOtx9h+gltq/CM0FIjnDffa2kPvufkVv5ZtyF4Nwrt36mwEBmPtUKB+4Ls
	eXyfjMd3JX1ZOyPLm052dPGE+ZT8UBfgY7n83ecmt7bA9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x33wt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:31:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fae95c82cso211857541cf.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777361471; x=1777966271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bwq72CVADBTaOQqPqrMijBTaKsgmE9bGcYbY85sgZTA=;
        b=JVusiS68sAVI0W9518CBx2kcHpQrT8//yPAfk23SDlKQFG/JjR0+zqXwM+pMGlMUbV
         G2wJhH48qPkcpOXqxZ4Y/UtTPJssxg4Y8qEjz7Ph9rGsEKlIk1r3bIqyKFYYVb4Ypc3G
         92/bJhuJ/qGJvA4xXM1FK/ctt8ZGSd4yR13qZ6cddPfOGgLhhEkMhjDpjE3Z7gA4T87j
         WYp5+x7sDZzyT/PmBVpRaXK6yKG9qpVdiTHJ/1RgTFDiJFteM7GuTfIttpau6qIU6L6K
         ul1reycwxxh+Sb/nFRlxt6NmVnW3oassI/RJlamLBGWy6Xgvo3GoGwv5mBi1V8wKbQZ5
         PgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777361471; x=1777966271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwq72CVADBTaOQqPqrMijBTaKsgmE9bGcYbY85sgZTA=;
        b=kpjJ/XhP3d76D9Mja4BWVPVqg5hg9TeXZyW7ylaiccRAt0tMDKfeZ1aMTNxp9vQGAo
         rWItNsgiQn03TYaXScsv+PAub5PfJud6J6i1BRG16iakFku1IlYg00ZEjZt58nJRQMbs
         l0Wlp6hjh+F2gjFXJ4odDqDZwmednVWoMuRIn8DWlPR1PizUzWROGX7tlC7LVcU7Ko1c
         Mo6dqml1/mmWkqV1JmhbGqlmpGlvwCDnmk1XFOqjpBsV72sJ6qSZlgJc3NF/pwr5QhkK
         iw4BgxtYezvMpymGI4oop+JIj96l2Ukvmag81xkUelyOqQNjtMpDd/0KoiefjySy8Cgn
         USUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/v6m5hNnjpW5wqNLfv/cX0amVc4pse1VUYl1/JjTDz6ew30OIht+1xseMKqaojiVhZ8XIFZuwGUau4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxos2PeEbB0oINKK7JIPbkaGUAhheRyi6XwWFFwJmHOWU5GPlJG
	ubWIdmkRdJaY97lv0LmW2/i9K1yvDLvCLXz9m2ufJY+kw3U3EMInxRX/jBch9/K2CSV+d27PTbv
	PtxzU8/CxHHH707kJ96yR0CaU7mvXQGD9/0EQGCyhqJN96QfxCTrED3x86Fs3uIxg
X-Gm-Gg: AeBDieuehfvohTzJySvKvMJpYqULZypiCJbfsz9tiYO+elEPv2qVA81j84OGUoK3Hmf
	4BEz30mmjQDzw+mT1fUgOy7PZahq1jjrX4nN3Gb8f1hK+iLKX9tPbMmOFgc9MHQrzNAfkab2HwZ
	2nTJBj/CLA11AJJILWhSmmyIe+kKmeO2xrcG9iU0zYKXXactLHlENQL4w/K9kD7AT4JndMdShOE
	vethrX+6qm4qChNcW+mrm/N/urLcQns+wbvkLAlY2m6EBKt2PumVHbh99+lz6uI3N9wDsm4jpeq
	qd+QiY90QBWR2zQXgK6FTr7H4qmxxcnrkkk2mYp5DLtrXkPfgQPa2RsaYIWTrOt5E8uCrBLfpGq
	AUty/sQ+TIwSJvTG+phOedmTPf+B30hN+9GDIOVyd5/7tMND6AvyGN2KUCT02PpON2BUtjWbxE8
	HplZus/H1Z+VjlBfWTt2kjhgMB1L795wBcjCFB+r8Qql/ybw==
X-Received: by 2002:a05:622a:153:b0:50b:3788:ab59 with SMTP id d75a77b69052e-5100e136844mr24305801cf.22.1777361471170;
        Tue, 28 Apr 2026 00:31:11 -0700 (PDT)
X-Received: by 2002:a05:622a:153:b0:50b:3788:ab59 with SMTP id d75a77b69052e-5100e136844mr24305501cf.22.1777361470719;
        Tue, 28 Apr 2026 00:31:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462ca9c5sm408872e87.14.2026.04.28.00.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:31:09 -0700 (PDT)
Date: Tue, 28 Apr 2026 10:31:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, yangsunyun1993@gmail.com,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v1 0/2] Add Lontiun LT7911EXC eDP to MIPI DSI bridge
Message-ID: <ilkpth74qyjxmd7fol76kztjvsdmktjmj74qu4f35gevfjgy4v@nscmwgworotm>
References: <20260428063224.3316655-1-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428063224.3316655-1-syyang@lontium.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA2OSBTYWx0ZWRfX6iB+Mkhiqf5V
 VQEGkowWcrQFtj+wPJsoLGuTQtIfkVIJsDwzPW1D7oYsFs7TTO1POBPqVHm61VXt60weNBos8XD
 lnolZzBfOktZ8LG95MtU9v1QK/C1VRw+C215RzYQ0ah+bkG/S+SgsDILdh2aPlmRp9XQaIFsD+e
 Ik01tExg2YQ2yGnA8pGdoJ5JtJ2x1kh7I6jKt2IH/D8t09GwTMtGroMcrH5suemd7sER/bEblrb
 JOC5VTw61If8CXzYKNDki8VMPDvkGGhflI8xx5pcyLeY/fJIIyaImlwS/YvYXd7x3SgVusG6d/R
 oy4szRwiyFpjQmdzTacWaVaoKeVS8ahLpD6iTFUgw3UHhol0tYX6osonBxjvSGaVGzNWHp+mUr7
 7G2dpV7rpHODZK+kvPb8ORZ0taHGYMKuNAxeIv/0HNeJmmYAO/Hynmy3LkK8+WFSgwFIlw/JwxI
 W7Y7aj5aRAzXHXrFGIA==
X-Proofpoint-ORIG-GUID: vHtdtCXWNzqzFPIwQu_J--Q1s3PPdGPD
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69f06240 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Kz8-B0t5AAAA:8
 a=Th18vmrz9VDaD5OkdogA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: vHtdtCXWNzqzFPIwQu_J--Q1s3PPdGPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280069

On Tue, Apr 28, 2026 at 02:32:22PM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> and output signal/dual port mipi. This series introduces:
> 
> - A device tree binding YAML file describing the hardware
> - A new DRM bridge driver implementing the basic functionality
> 
> Signed-off-by: Sunyun Yang<syyang@lontium.com>
> ---
> Change in v1:

How can this be v1, if you already have sent the first iteration?

> - dt-binding:
>  1. reset pins use active low.                        [Dmitry]
> - drm/bridge:
>  1. use atomic_* callbacks.                           [Quentin]
>  2. fix the incorrect formatting and spaces.
>  3. add the required header files.                    [Dmitry]
>  4. remove "enabled" flag.
>  5. remove *fw from the lt7911exc struct.
>  6. .max_register and .range_max use actual range.
>  7. regulator use bulk interface.
>  8. use dev_err_probe, devm_mutex_init and devm_drm_bridge_add.
>  9. Replace GPL with GPL v2.
> ---
> Sunyun Yang (2):
>   dt-bindings:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge
>   drm:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge
> 
>  .../display/bridge/lontium,lt7911exc.yaml     |  89 ++++
>  drivers/gpu/drm/bridge/Kconfig                |  13 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 497 ++++++++++++++++++
>  4 files changed, 600 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
