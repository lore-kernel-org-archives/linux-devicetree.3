Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEEE19995E
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505864; cv=none; b=rcOChbemez2YeXuqDBmKU9r99p64dhJ4l87x+yrV5ikFRGGO80uI/i2UjNNg0tQi8lqnTuYp5Qcxx9NWHnukb+3SeGXgyl2WcJ3U/U682Iw2q0RvRXRA9bDVHbDKgKtgpis5d0hsnAshrErv0CHIFIasuTPuyyyBdnAO/e4gy0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505864; c=relaxed/simple;
	bh=eIMA0ZsVKD9vWcjtBsY9bCLR0U4XfWLPNOhOyKWVWQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ897+zUGE9aYp0/W324PtblnE/yrN4UzXsfPLsptCgRAm0Rgkn1G4l7BVbxATlmmpEl4MpqKLQZYJRK/J9zTfLJMEP4LhKboqfnlqPvbCSjUwz7Yb4/WkmTsEL4dRhW8BSpQhFKt97/9N1/GZB2k78yXhmJzxPpxdE7rHGWy3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGbJOmge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/8RqFFx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGbJOmge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/8RqFFx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8hm52194617
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PHYL2A6nokSiemHyzYG1DAUi
	B3KVWxjzt9EocyyxjPI=; b=iGbJOmgeUyWiKlQmFZO+wxQv/Ax7MtUjEmAUB63s
	S2mR+IaIququbEfULNp8u6e6sACCt7kWYklKWyh8x9ZZBjSDvBBBsP762r8pNPTT
	9+dWKJDDWApW1yfLsBKWjiwGa9/1eINIB/WAK1b8Ya3bG/ii/OBfTOpeOSX/+7gM
	W/TXPy0T8KCiSR2SMq7NArAg/V7Ocu6aAM0ZwAz5jM4dmsESwymWKKMPrLnXuofd
	V5ZfKdJJX2CR4uIcH163vdtXjnw/EsrRaYRTsJ9Mlf5RmAYHNxg9t12qpDGcgKw/
	0GtwRiyyJzLZjF1N60RCEgP0LyBBl/hyAzg9rFt6EAJQkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1xqa8cr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:31:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-921ed86ddeaso295908485a.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782505861; x=1783110661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PHYL2A6nokSiemHyzYG1DAUiB3KVWxjzt9EocyyxjPI=;
        b=U/8RqFFxeglc7Acfc4MrfsQVZipfNYPZomQ/9QwxgCi7hAXfAAWr1LqJyQSS68iDYH
         Lnhd/yfD8ZA3sXci6VDEp8Kswj2MWcs5cNOt+oPnnm2fzevSJHI4x1IgQcRwCZZPi2bD
         vLRlGQqP1/62sCCLG2CXVyr6iSnfOZ1If50dGMiJw4RmWgszwtFpWeIFtlg78to7ZbUY
         0n7FqKgN1BvHjAPHiHcqyn8eiuzPKpcH74EOAgipn73KHdrENeaMQ+MwduUYfdDcX/5j
         8Xw+oE2wUZlqCTLJx1JdBEtT/kUGeXW6dls+Ydt9ZCtI46d1053HljlwEShAw2sXFiaR
         Jjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782505861; x=1783110661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHYL2A6nokSiemHyzYG1DAUiB3KVWxjzt9EocyyxjPI=;
        b=PQZM7mKQdJnI8AoTQ+YdCoZrBe3t78iDYlVSQHeLFSEOdyWArvnFCw3X4pT3yVQc2L
         RjgMgVeoZOS21YhDULHQfpc/oUlLiuLq0XwehhI+pM7SRZrdzBLYPGnEhlNEN2wjSchu
         VeP0Eb9pDELvCOudDz2fzcSZ7VuZvqgGmTxOqV/4FSb2BmwYdZIJPRxwh3KGW/Zp64UG
         wzvTZ7xfFsidRbJhLDmUBi/jSM9tOEJpi78f85NvGvWjt7wb2PFj6ebHc7n+VqUBY/ug
         2HaQTAkJjsB1Ox/T1mU+QfouENcXTvQsLGQfIUD+M7kVF17Ies9gxlZKGZWVQOCnHY0O
         byqA==
X-Forwarded-Encrypted: i=1; AFNElJ+pry7Lj+kSSYPLqnUm1y7QMY4WG8aO6/tQ1ewysW4jw3xisAf9s9VrddSrEUfuB1uO4IO+J6SFHF9q@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz/QbuBJP0NvHFRgTWrQNwgGLjLmd+sxmrQt9C77R1h1av26nP
	XwFJt9nO49Ewtu4R+y+5OVnjx1d45VNCKPu1KI2oANfvDsjxfY5huv96xmR2xberAVJ7aqa+lFD
	oIsBKsTXOAYSAeBtoD+76KhEnUlAkThDzCDaHSksB+xEL4as3MyZR2z5hWEz1oB24
X-Gm-Gg: AfdE7ck6mXgqll80AicgOc5srGFHxVH4xFL1rYCXI+Tm25aJ2hnEzFDHof5IuJ/xEBG
	LKAqsUGg8A1sFpHDFlgfA45bKeBYVTy/d2Wx9u5tAwOAOcrqhurByiFZmg4ZrDsdDeDO4wFt46B
	z8P1ekc+qWdZX1Xo7MQXjhRh2BQCWHh17uNFVF+nQeG/1zbzw1f0yXl3WjMSvoSxzwpV2elhMcg
	Kp9o7afVmM6ylN/jvkaIkqBwvTg4MFPu2ejkvWYupTOpWlHATmo1By1MsSvggEDRE0iZm45Ic2R
	Vni90PfLgsDbfdZeUaf9DxGt6H++iAgIo6uHtZyjMFY22fZxY6BOJFe0hrZTdCbvv/pak5TTvlh
	5+zgOdGySuylt0bFuWOa6ZtShIu1U1fGF5CiJP9E6c9QxdZKZmgJch+uAeN88ZRpRfbrts0r5iR
	6y9Tce9SNo1iECKZpPP3y1N4nW
X-Received: by 2002:a05:620a:2856:b0:915:c858:7d3f with SMTP id af79cd13be357-9293bc40607mr1376501785a.19.1782505861164;
        Fri, 26 Jun 2026 13:31:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2856:b0:915:c858:7d3f with SMTP id af79cd13be357-9293bc40607mr1376492285a.19.1782505860521;
        Fri, 26 Jun 2026 13:31:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69580fcbsm3760781e87.67.2026.06.26.13.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:30:58 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:30:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, boss@oss.qualcomm.com,
        qc-display-maintainer@oss.qualcomm.com
Subject: Re: [PATCH 3/4] drm-bridge: lontium lt9611c: fixes and improvements
Message-ID: <a64pcvbmkkszgnokarsig5gyanviqcvdxhbknkfciylpuein4u@xmn6znafguxh>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-lt9611-b4-send-v1-3-42abbcd3bb1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-lt9611-b4-send-v1-3-42abbcd3bb1e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: drgnAuSBkUnsVR0Co16ApaHJz39f83Gj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE2OSBTYWx0ZWRfXxjrtzQqk8lSz
 AwfBqPGNMINGW8m/38D8cuLh6dgScPKlPNtssArILvMAnWTW3//McsB1id15x98DZV75GRF8DPf
 dNS1vcrCabCGl02yDiLZvmc8s136qt4=
X-Authority-Analysis: v=2.4 cv=GPs41ONK c=1 sm=1 tr=0 ts=6a3ee186 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=IqmewEwAU6YGb8l4mAwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE2OSBTYWx0ZWRfX1nsmgqWtCGf/
 eXaLY7SSGRL8QzgB0W5VG9u0mC389qzSMT74keaVMSm0QF2sS0s+aTstus8iNKLj4lm+Lxe+Faz
 aiqiKQ14dW1PSsxkO37enkO4/tIcAkMOiFdQbLCsMVZe914Z6kjx5dZ5f7WM/Jijs29i9YAY6Rs
 rD6Q2kwtUgmEUDRAy7+dGxXRvsQK02okM4FwOo0P1J3kDOl1eXDiaOD0cZpAxgBl7Vrre5urRNK
 UkyWswrw4U5ZFz01w5sTxeed6GKJwIx7OiMoRQH7vdMB6lH5IdHnIIZeKwuWYSUQGAjj2lQARtz
 XuDba8cR+Gx7p6cAcpfz5OaM1iXT/OLAt7QYlxiSA5FKcXRYFwo3TlEG4WufyqdfL07z/vjQfsM
 9yR9u7AEWP7ITNCicN2FrR4SHYjXCWxd5SQdDLkaPKNtDD4dEx2hfR8afi5sZOfb3gxQGFuHpRC
 Nylg4Or5mQJJ/QxBkRg==
X-Proofpoint-GUID: drgnAuSBkUnsVR0Co16ApaHJz39f83Gj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260169

On Thu, Jun 11, 2026 at 02:44:58AM +0530, Mohit Dsor wrote:
> Remove two redundant lt9611c_reset() calls:
> 
> 1. In lt9611c_bridge_atomic_pre_enable(): a reset is already performed
>    during probe and resume; calling it again on every display enable
>    adds ~440ms of unnecessary latency.
> 
> 2. At the end of lt9611c_probe(): a reset was already performed earlier
>    in probe before lt9611c_lock(). The second reset is redundant.
> 
> Also, the DRM HDMI bridge framework requires hdmi_write_hdmi_infoframe and
> hdmi_clear_hdmi_infoframe callbacks for HDMI vendor-specific infoframe
> (VSI) support, used for features such as HDR metadata signalling.
> 
> This patch add stub implementations that return success. Wire them into the bridge
> function table.
> 
> Also, Store the chip variant enum value in the of_match_table .data field and
> retrieve it via of_device_get_match_data() when probing from a DT node.
> Fall back to i2c_device_id.driver_data for non-DT (e.g. ACPI) probe
> paths.
> 
> This is the standard kernel pattern for passing per-compatible data
> through the OF match table, and avoids relying solely on the I2C device
> ID table for chip type detection when DT is available.
> 
> Populate bridge.vendor and bridge.product so the DRM HDMI framework can
> report the correct manufacturer and product name in the HDMI connector
> properties (visible via xrandr --prop and related sysfs entries).

I was going to write that this should be split into several commits, but
then... I stumbled upon a fact that the driver is not a part of the
drm-misc. So, instead of posting an update for the not-yet-merged
driver, please post new iteration of the LT9611C series. Don't forget to
drop the R-B tags where applicable.

> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611c.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> index b0402726367e..fe51f4978546 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611c.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> @@ -622,7 +622,6 @@ static void lt9611c_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>  	ret = regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
>  	if (ret)
>  		dev_err(lt9611c->dev, "regulator bulk enable failed.\n");
> -	lt9611c_reset(lt9611c);
>  }
>  
>  static void lt9611c_bridge_atomic_enable(struct drm_bridge *bridge,
> @@ -777,6 +776,17 @@ static int lt9611c_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
>  	return 0;
>  }
>  
> +static int lt9611c_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
> +					     const u8 *buffer, size_t len)
> +{
> +	return 0;
> +}
> +
> +static int lt9611c_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
> +{
> +	return 0;
> +}

Definite NAK. The purpose of the callbacks is to write the infoframe.
Purpose of the check in the DRM framework is to ensure that the frame is
actually written. Please work with Lontium and find a way to write HDMI
/ HVS, SPD and HDR infoframes.

> +
>  static int lt9611c_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
>  					      const u8 *buffer, size_t len)
>  {
> @@ -895,6 +905,8 @@ static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
>  	.hdmi_tmds_char_rate_valid = lt9611c_hdmi_tmds_char_rate_valid,
>  	.hdmi_write_avi_infoframe = lt9611c_hdmi_write_avi_infoframe,
>  	.hdmi_clear_avi_infoframe = lt9611c_hdmi_clear_avi_infoframe,
> +	.hdmi_write_hdmi_infoframe = lt9611c_hdmi_write_hdmi_infoframe,
> +	.hdmi_clear_hdmi_infoframe = lt9611c_hdmi_clear_hdmi_infoframe,
>  	.hdmi_write_audio_infoframe = lt9611c_hdmi_write_audio_infoframe,
>  	.hdmi_clear_audio_infoframe = lt9611c_hdmi_clear_audio_infoframe,
>  
> @@ -1025,6 +1037,13 @@ static int lt9611c_probe(struct i2c_client *client)
>  	lt9611c->dev = dev;
>  	lt9611c->client = client;
>  	lt9611c->chip_type = id->driver_data;
> +
> +	if (dev->of_node) {
> +		lt9611c->chip_type = (uintptr_t)of_device_get_match_data(dev);
> +	} else {
> +		lt9611c->chip_type = id->driver_data;
> +	}

Use i2c_get_match_data(). But, also, why? The driver will likely not
work w/o the OF in place, there is little point in doing something else.

> +
>  	ret = devm_mutex_init(dev, &lt9611c->ocm_lock);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to init mutex\n");

-- 
With best wishes
Dmitry
