Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7591C3BF7
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785290805; cv=none; b=rYpo+vR3MFsyHhUJ6YUzHGDqoavir/hw5Cc3aKAumQN1nY9Q3w0Tj7IOfHAvzw37tbUPw/STk/bOMp6YnHJ86CaLpTIaGameM9f5v6tS9MnAKwfl0Od5y4EbOQZI8EUOUc4zWYDWoPeZ2B1VxteukOdcEP9DauNH1Gw1A8RFw8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785290805; c=relaxed/simple;
	bh=vPCzuheMcbyLoJgdRPjJo1Mi2PFKOV2N2T3/lhHKYoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iyyf0CJ9dv1jWw+Hpqs+MINKjMItVXhLmkABNeybqIaeVS1+iyCMMWiDyzneQIjuVrSEmqToW6B/xluPTgx9PW0vMhpBzrtQsIbowSmgheoIABqstyWGusySvvgwMD8vEN7bqH2svydOzgTbdKqRUO3rE6JSx0L/hOx1LZQCFaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPyvFKcY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUkJwb90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPyvFKcY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUkJwb90"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1Htu44026081
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4mbCM/VAzhxwI20/V1g/VuFFjGNJdfpASrzSVi3V5o=; b=UPyvFKcYNKRglQyb
	qkgsxTlrnuBQNu+lnnlgHJQU928VoLXWqj2a1cXUwSFPiYbylDmorAq9pT7VUJl9
	/HD1dYO5VsiQ8rxPaVo+Iqax94MTXH2PztUz3R/whkfW+vIGhAKAf4IC9KX/zzlX
	S8lc2RzFtpbncspyRIAZIZnLp121hcrL5QFIlXxo56TBjKEP7RFqbJlyu0X1L8jh
	eZsfRZPNX3YoHqV3yeHaFVHDQo52GzUGMm27btJDkTHnomTH4rVP0ugGdYlmbxR7
	qPRJx2Jty4OVUfwXRDO0bNzTSzLHyixrP6WxX2P5Eg71YNv7FA402txK5d/Z/4/q
	G2tvAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0hqth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:06:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so5810711cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785290802; x=1785895602; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4mbCM/VAzhxwI20/V1g/VuFFjGNJdfpASrzSVi3V5o=;
        b=hUkJwb90RoVGBcXSNvcoytcw275U0tEsMgYytg+EozMSdoFOwZu1020C7umpIUqDvB
         L/NlEWxuXC+aI+MYKEFqUysLN8ez5jJ/oftUAvp+cD6zmqQBdC5Djza9sY9P3FuQRNGS
         IHew9AQt4nonGembO3nU56vVmg0PxKyQXYBJF2azdZYjS3H9F5zhpaHcPwlgF09TKD4M
         aMCKZ/6B60qmxBjMqdcVGpfDZoqtU+vcIxl8FHf6UHjGdLRNM9nj5GIHlj7L/Dtmr4yb
         i0GYEsHwJee3mNWedCatEV04lxFsKNv2hPUwVyv3uVcbNrhpwOGI3fwQp8WhbiEdf3LT
         PqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290802; x=1785895602;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T4mbCM/VAzhxwI20/V1g/VuFFjGNJdfpASrzSVi3V5o=;
        b=VkistzvzKwKyuMUsZf5SuctGefaHO9T6Pac4IMCbOzbY+qqqgN1b63LDIbNcgmdtBm
         A84Mhmsrn80iOtjiQYjcN/bWnLsMtpOK+RPtvQftrn0VrwdRUPks94XQHhBW83ZJZAEB
         AldbN81S2+VfnF++mBOnavLCYm3bCfcJl/zO+raHZi85wcwkIDui0V0dcy8IHsDJYn7A
         hwl9J7DM56E8UU7FjwpVOlVVc0zu36SnyEfD+88oBJeqldYM4vGMBR2NmW0Z283WoQQu
         V9iF+Yr2ZCO5LJ4yj+UGZyKINq9yuoSeVQt7STrvUbdiTWxqpYoPshJ6PfV22K55gs6P
         TWrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkVz4rhMn7HLFSGxvgTTIJpa7+Q+ym1hzK/O6WAydSlsArLZv1gonStIxxHcGJHKel0sd08UvwuEfB@vger.kernel.org
X-Gm-Message-State: AOJu0YyKBETFj5Vs47Q9mgMuBZMUe/jrklw16Q3GvhYgdVonPo/Nwio0
	Q9Vt+7sOoaQXw1KfGkW4/b5KGsRkR+Aus9Tn4AVz8RwiTDxNWi+KD/qWKS4Y18JnXPUgdSNgyzG
	kENH4U03VYBmJwiYfhN7EReLPdwR715Wr0Fq9rMVQ68pjQ8Exl7q7RisTi9qZmDcD
X-Gm-Gg: AR+sD10oY47BuSn0ODtj6TFqNsfPuOmaHoYjgyXX/aH51dOjVim47rU7Fd1O6InlxOA
	BtOej6aB50Mf0Njw1fI1ZMoyhIru1v9u0fM4rLWy5p6h6d0jF5pcd0bLh1ZdZ/x5IAlAj4cdpzn
	yg6bvLciQmq+IRLkBqKzq1DU8V6UCkPofvSu0BXaP5kGI2eOJ755hRu+ioBSyAQzQ0fGAaIxiqj
	LkiIX1UOvhZOupxCSIRArw85ia4Ypom+ZlPPgfBZMzJ3iBJevE/IA4/G+TtqWzoDAUYfeEXtrYi
	TWyFYyhMQPujRkOV0oOWTYi7jKu0wsnV8U7VYwxpt8aw8BnaCmtPf9s3b2QDnmbzy9QmYKi9mVM
	Nr+iZvj7pb5FdPTtO0L9bzrMNZw5X+O2P2stsBGLqxuVR3BW960nmHfCYlnnGoLErL5kJqfZJZz
	stImqEjAyFbkT7kg==
X-Received: by 2002:a05:622a:2605:b0:51e:aa39:4fc0 with SMTP id d75a77b69052e-52b2aeaf718mr3295881cf.42.1785290802126;
        Tue, 28 Jul 2026 19:06:42 -0700 (PDT)
X-Received: by 2002:a05:622a:2605:b0:51e:aa39:4fc0 with SMTP id d75a77b69052e-52b2aeaf718mr3295671cf.42.1785290801689;
        Tue, 28 Jul 2026 19:06:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d76a36a0sm139647e87.24.2026.07.28.19.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:06:39 -0700 (PDT)
Date: Wed, 29 Jul 2026 05:06:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: mohit.dsor@oss.qualcomm.com
Cc: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Message-ID: <pxwcan2yajuvt44vgb5ijfgimowu2odcisxpp4tuhkzyk325jk@koxmaj7jwbnu>
References: <20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com>
 <20260728-lt9611c-v7-v8-1-bda216bfaf37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728-lt9611c-v7-v8-1-bda216bfaf37@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxNCBTYWx0ZWRfX19C6q8ytzVWO
 gv4R+jIUQBkteocoEomOCYF0XrqFp3Yz1lBNCpM6nld5bwMV7Pd1wPxY4DKTcyxARXZv3QBAKiz
 DvE/DmkRn8MTnzBY5ApzNxkHr+P3cX194b2YpcsXSoyrtXmMYRoMNZfTlx0s6wApUGV0WXFzIHd
 QnLxCQvE8CoAk0e9HGwPLvzVnSFzGKZ5qLBKQKKzAJzQ9ReQAlNL5BAJSatAVgFhH2HwwCx0Cou
 KYz3IpjDdizEP7vmmvKfhyzy8Up32L2VzJXzbGKI2OMxnAOJMBXmn/8oNcTG1u8T2d47q6p1qci
 u35vMNZtkFHyZ2Hf9dOs4DfTUoJ6A5WMCiXxKmz0KgyMTk/xM8nxNcqS+b45qpOjsQBNifaXDGs
 5XemPP1zKZuAWPMc0H8pQYpKId8Nyk9ZGvhyqRzJP922M60xmMamBHkd+PSMbg/imdVzTWJT0OS
 NfOu5EknYdOZdCRpa3Q==
X-Proofpoint-ORIG-GUID: ZkxoKf7qZRzZQajGytLg8Vt8OrwHBoJi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxNCBTYWx0ZWRfX0y+fShZkPjUX
 zRe3WFXvINtUZvOCMPlIGkP17PGWShi+zPF7NNwuzR+V5k2aZ7t2xdhfKgx2xBfQGWQCYXdxB9Y
 gVGosDYXxQBgbKwO0G1xsXgqjlhlMFY=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a696033 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8 a=tsJPPiT7vvoKamjX9h4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: ZkxoKf7qZRzZQajGytLg8Vt8OrwHBoJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290014

On Tue, Jul 28, 2026 at 04:39:18PM +0530, mohit.dsor@oss.qualcomm.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:
> - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> Signed-off-by: Mohit Dsor <mdsor@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt9611.yaml        | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> index 429a06057ae8..e0821a63d9d7 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -4,19 +4,23 @@
>  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
> +title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
>  
>  description: |
> -  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
> +  The LT9611、LT9611UXC、LT9611C、LT9611EX and LT9611UXD

Fix commas

> +  are bridge devices which convert DSI to HDMI
>  
>  properties:
>    compatible:
>      enum:
>        - lontium,lt9611
> +      - lontium,lt9611c
> +      - lontium,lt9611ex
>        - lontium,lt9611uxc
> +      - lontium,lt9611uxd
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
