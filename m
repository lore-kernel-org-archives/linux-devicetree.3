Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92DE3D6475
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783083442; cv=none; b=E6EFUyMTTZ1YjY0YFCrUMuJVQjU7ETIGGfQLTV3OcQuWsIimlZ+ywlac3I0iwZXsdzlldmrK+GMi8RtgXIqQDCHD/289gTbp0Y6BxWr2oQBRkyCwGcAFQFciLwGYIO8U7VRnRM4eABa3PJhOn7GB5KizGClRQxscHN0vd95yhj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783083442; c=relaxed/simple;
	bh=+r4eZSF5wUW3eEj0XZ2FoYRZNS2r0b1z6KZW1+f1i5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+iVtNdoL2/Pn287QdUnjL1J7U4KOEgRRQZeHDI0z4GnSORCmb/K0rmAHYf7N/7Z9g1l+tt0Mq4N9MjUyZt3VGYz8bYHFK40BD/uHMp7IekgA1rqGkxHz4AUk+rgMWLglwioUoYUJUG/PDJJNQWnqj5V8v0U6553Nb894WK7CJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLIw3pWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GunTAkO9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLIw3pWO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GunTAkO9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6639BqZv3694381
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 12:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4MY2427j/ts83OjHXrzZDI75
	V9a1sPHf8LfhklDWR+k=; b=ZLIw3pWODWerMjtOvtcf+P48gqgvZwhl+ZTY8Axd
	0WVanM+2whMGmWoVTV6HmoMnsJBSDF1gNEJA40SwF5ERi8bG3QQsEfK3t0hURB55
	0kQel7uGELv4AlkWTP8wfsOFUTHT0l8taUA3QrcDHivKFE/xld3niMuCMREBAVMP
	sQkZNjZOsNfdx4OfP3A8jG5T906/Kba8T8lMch+iKK6aWBOOtU/+vj62WKWIFyYP
	1nUiVMuufxHb7nJYyrjaMpyck7wrFa1bmKAR3JVP0iypt8ZE2IEAfJnDC+P5g0Dm
	JEeE0zFsI3McHU8fuRT+anLHzeixU+QSyFZuPOIKUbTXIQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a848tx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:57:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so898469a12.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783083439; x=1783688239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4MY2427j/ts83OjHXrzZDI75V9a1sPHf8LfhklDWR+k=;
        b=GunTAkO9FIdmdyQRORl0d0ool9Ah41q4I2q6p7F2LO3Nz7cx12w6ZIw9Vz01w8cSnj
         GREsCWZ7Fma1HUgvu1zNoJC7kk03Y3or1+J6WX8cvowaxv1MilV+ItiaY73LTrBAkKre
         ckxp41N12Tz5fZpnWdaVgNzRkgyqog7/idLhi+l8CNCn4zI82ewOBJVjvD2Fi/W9rb2C
         GCMoxRJdrZbBo3JjXE9iahe5McVKuxRBU8FEA2rgNLBFHopOCPnwCbHKeRiQ2yjZpfhp
         +o94DIVkLyFVjUcgwB67TPvuUIyZAsN4yvhyPbll/1OM9DNteVQBTqMr51udEKOsjury
         Rr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783083439; x=1783688239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MY2427j/ts83OjHXrzZDI75V9a1sPHf8LfhklDWR+k=;
        b=NNqwdT3x4mZ++HkirfCr/zRwhNHCk94fSnDHbfC6141XubitE/WnMIox3b1jgEvzXx
         27jGNEv7Ei3qfTp3vHcZAnE9EGyqhnAZKDT11yvh2gkX52FdRPjmLMTjuxaFwNISnVKG
         1bD3EcxTjxI+wuzdDO5AAFtTXjkwqi4PZ9ObiuJDkOy3LV4okAnKlGm/YSPC92AfQUR6
         C2ZjGS/vUzQn0hrqGum4/Bc6VctNZdkn/zPbUaPZWc9cb5iUNKALgsTOlPAkMhWN3O/i
         8uShGFX2eMtA4kBzSFf80IyQXtzDKTqPFEd61D3mRFlRa9+TV6qD7bSx/ZL72YT8fYF8
         Z6eg==
X-Forwarded-Encrypted: i=1; AFNElJ8QCMJiSPfSKKcFxxEZ/CuZak8mo5cD2LdjCAR6y6+Z9ej1UYMiULRqt1qvi2PU2159eWW6V3Z6mtY9@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHnny/eOJMMuE6GKsVd0jP37nzrh9IOMzd9hxJfbfFoY30YED
	kqHavHUg06pjLpQ+UygWUQDLZ5YttuunD8Q7iehLveaMn+r+I40eM/4nGcLJ75apeSZ28t4NjY6
	q24q+a2USpxLNLvtNHzfk2PUli68JyKpHLAsFHtP+grVc+Td7DeelnJbN3wgYNJHs
X-Gm-Gg: AfdE7cnRhDlqygewv5XJizUc3aMMEiznb63ZSgnQDJWTRqN232QDHc1Bw6XNGLMg9xY
	FZ+5dxUMVD1qGDD9UxaWI/nZfvFuZx30H+aMuMDq8xkiRU1zYpGj4T7dRUGncrIvlEtQEuJjSwU
	t4z5JDfYdYacg902MgpGVbLRRTfPJOBkb+zjMHZL2bYa8kymJ/lk3Rm5V0uc7gbdgLxJyRMAMo/
	TjpbkrdA8GI8O3dxaQLbqWe3MRUi1OkM3QkZzjnScFrBDWjRAElIgKl2q1ulOD7Cp6cB96Fye09
	cAcJYbUoUPnS8WSHqpZtfq7MNMnkuJbrRVIXmIcyRCNkQiTRVLMd/vi9tRHKKw1HEv+dlxPR46c
	32Ki88lzqIlycVaaBfuJSnWlR6VyLwBRleus4
X-Received: by 2002:a05:6a21:e58d:b0:39f:91e9:cada with SMTP id adf61e73a8af0-3bfed1bf7b0mr12177783637.9.1783083439383;
        Fri, 03 Jul 2026 05:57:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:e58d:b0:39f:91e9:cada with SMTP id adf61e73a8af0-3bfed1bf7b0mr12177729637.9.1783083438782;
        Fri, 03 Jul 2026 05:57:18 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm22192457eec.20.2026.07.03.05.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:57:18 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:27:08 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <akexpMGzU9HDTcDb@hu-mdsor-hyd.qualcomm.com>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-lt9611-b4-send-v1-3-42abbcd3bb1e@oss.qualcomm.com>
 <a64pcvbmkkszgnokarsig5gyanviqcvdxhbknkfciylpuein4u@xmn6znafguxh>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a64pcvbmkkszgnokarsig5gyanviqcvdxhbknkfciylpuein4u@xmn6znafguxh>
X-Proofpoint-GUID: TB8uIciITiRgUuB5pDar8PInFQYWy1y-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyNiBTYWx0ZWRfX1o610yAPDKIe
 bCA7onfMhpv+XLBALg5vJCq7biYlElz1EaTf0ciCe/GaCVTPN8CjzZc3Iw6YKtg1Mo4N1wrNdWM
 JFErHAA/ZuV09YnjWyayKq63XxXdn5g=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a47b1b0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=K1nJ1lxNh3oVjQTzV4IA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyNiBTYWx0ZWRfX7u46eZkNyETR
 FFAvhoOVJJoiZx1pBY/Fwkrydag6hNo49NEOoHORSVHxtAYtbD7Mc8XBzTZimagOsppQUYGSGwl
 H9ut4AUV0w3fog/oyTggYo4/rs6fsxrb6VA8RaiVYlAZPfTct8EULSrzLYYiTB25MR370TR0xAZ
 pKFmaAG0wbQoBmguau3/cv/HzIK0MotIc2Bjx70oqmAkrj+RLXIwjNSwhWwfkyY1DGD8BV8PB2J
 nvimbqrfpe9AIOfeeOKgyUJg5tOW5eFUs8Od84/asfg5C7bAbHju65/iAv6+LUyfPp1+xddDiJo
 sQUPOAyXF7GUUBFlwnii2NXcrEPiFM9z9HhyxGwam6BxfCqkQhyi0onF5f6g2B/TFAOUmVOhzJq
 RTJVcytmuhOKZnLu3P8VVAQno0ocMgLxx18u+d5Mykj05BI0j70lgDcrTvsDl8PtiLyi5MKxNz6
 cCv/RshI0iWak0M0tXQ==
X-Proofpoint-ORIG-GUID: TB8uIciITiRgUuB5pDar8PInFQYWy1y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030126

On Fri, Jun 26, 2026 at 11:30:56PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 02:44:58AM +0530, Mohit Dsor wrote:
> > Remove two redundant lt9611c_reset() calls:
> > 
> > 1. In lt9611c_bridge_atomic_pre_enable(): a reset is already performed
> >    during probe and resume; calling it again on every display enable
> >    adds ~440ms of unnecessary latency.
> > 
> > 2. At the end of lt9611c_probe(): a reset was already performed earlier
> >    in probe before lt9611c_lock(). The second reset is redundant.
> > 
> > Also, the DRM HDMI bridge framework requires hdmi_write_hdmi_infoframe and
> > hdmi_clear_hdmi_infoframe callbacks for HDMI vendor-specific infoframe
> > (VSI) support, used for features such as HDR metadata signalling.
> > 
> > This patch add stub implementations that return success. Wire them into the bridge
> > function table.
> > 
> > Also, Store the chip variant enum value in the of_match_table .data field and
> > retrieve it via of_device_get_match_data() when probing from a DT node.
> > Fall back to i2c_device_id.driver_data for non-DT (e.g. ACPI) probe
> > paths.
> > 
> > This is the standard kernel pattern for passing per-compatible data
> > through the OF match table, and avoids relying solely on the I2C device
> > ID table for chip type detection when DT is available.
> > 
> > Populate bridge.vendor and bridge.product so the DRM HDMI framework can
> > report the correct manufacturer and product name in the HDMI connector
> > properties (visible via xrandr --prop and related sysfs entries).
> 
> I was going to write that this should be split into several commits, but
> then... I stumbled upon a fact that the driver is not a part of the
> drm-misc. So, instead of posting an update for the not-yet-merged
> driver, please post new iteration of the LT9611C series. Don't forget to
> drop the R-B tags where applicable.
> 
We will merge these changes in base patch only.
> > 
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611c.c | 31 ++++++++++++++++++++++++++-----
> >  1 file changed, 26 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > index b0402726367e..fe51f4978546 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > @@ -622,7 +622,6 @@ static void lt9611c_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >  	ret = regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> >  	if (ret)
> >  		dev_err(lt9611c->dev, "regulator bulk enable failed.\n");
> > -	lt9611c_reset(lt9611c);
> >  }
> >  
> >  static void lt9611c_bridge_atomic_enable(struct drm_bridge *bridge,
> > @@ -777,6 +776,17 @@ static int lt9611c_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
> >  	return 0;
> >  }
> >  
> > +static int lt9611c_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
> > +					     const u8 *buffer, size_t len)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int lt9611c_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
> > +{
> > +	return 0;
> > +}
> 
> Definite NAK. The purpose of the callbacks is to write the infoframe.
> Purpose of the check in the DRM framework is to ensure that the frame is
> actually written. Please work with Lontium and find a way to write HDMI
> / HVS, SPD and HDR infoframes.
> 
We will implement these callbaks.
> > +
> >  static int lt9611c_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
> >  					      const u8 *buffer, size_t len)
> >  {
> > @@ -895,6 +905,8 @@ static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
> >  	.hdmi_tmds_char_rate_valid = lt9611c_hdmi_tmds_char_rate_valid,
> >  	.hdmi_write_avi_infoframe = lt9611c_hdmi_write_avi_infoframe,
> >  	.hdmi_clear_avi_infoframe = lt9611c_hdmi_clear_avi_infoframe,
> > +	.hdmi_write_hdmi_infoframe = lt9611c_hdmi_write_hdmi_infoframe,
> > +	.hdmi_clear_hdmi_infoframe = lt9611c_hdmi_clear_hdmi_infoframe,
> >  	.hdmi_write_audio_infoframe = lt9611c_hdmi_write_audio_infoframe,
> >  	.hdmi_clear_audio_infoframe = lt9611c_hdmi_clear_audio_infoframe,
> >  
> > @@ -1025,6 +1037,13 @@ static int lt9611c_probe(struct i2c_client *client)
> >  	lt9611c->dev = dev;
> >  	lt9611c->client = client;
> >  	lt9611c->chip_type = id->driver_data;
> > +
> > +	if (dev->of_node) {
> > +		lt9611c->chip_type = (uintptr_t)of_device_get_match_data(dev);
> > +	} else {
> > +		lt9611c->chip_type = id->driver_data;
> > +	}
> 
> Use i2c_get_match_data(). But, also, why? The driver will likely not
> work w/o the OF in place, there is little point in doing something else.
> 
we will use i2c_get_match_data. id->driver_data is in base patch, we
will check with lontium for this.
> > +
> >  	ret = devm_mutex_init(dev, &lt9611c->ocm_lock);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "failed to init mutex\n");
> 
> -- 
> With best wishes
> Dmitry
