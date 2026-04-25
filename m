Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6BC2C21EC
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 21:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777153507; cv=none; b=KBUBZ3ahBpmkw6GUEGvhlz8Tyn3z0Jr6GVPT6GdznRvzXOb4stBi2+GYTG3mr5PcgowvGmy3I6N9xlxdnA6DKfgNNmyHfn9dpF5ug4GkO/sxyYn5Wf8HaGOD0KO/C19I/1qIlDuaBaFr5QpW4JzTc7TOvUcu8v3AyxsHvQjHtz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777153507; c=relaxed/simple;
	bh=GcdDyvhP1h1G7SbVZkJdtKdUnc1ecmKRBNmvV0DWOm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuBouOYM3yHXD3QqfkuJJM3pHmYy83QvvEIc4b8qFDjXocLTFQNHWlKtukCvhLK3NJFV0/qCOXhk/5dQzJGs34ELYIPyxwLDRcVmGOdfLU0Szg8tiaNz0/qHfh6+2OMiAiCfr3c8nvlb91YGta9XubPxs0NZGTzpPQkFRo0PmpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCc64IYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mtxf6XL0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCc64IYQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mtxf6XL0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PJTjAo2426010
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 21:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f7RZGJSN3+WAdtDl5rsnVh3J53kF5urGcCMS3HU8Vss=; b=HCc64IYQood0E5bQ
	AlFPx6OvkHkwa+Zof3Wz+yWMy1ecMhIpTttSv863tnJO2Db2vapgafoxrbmZjuUZ
	cwdDVCrC/Frfl93m9h4MUzmOfwvZC2qJTx6ym8tsyHw0/6C7yw8cTVlPL5bbfDc6
	vkzmdJgS0n7UaX7uYhdzTQ+szOdQ5oK/llQzHTIwzKZTv0ZgSOhNY7mp2OL1g1fg
	rTJ1U9wQVHHhZMh0SpHMwKBaeAy19RzUr3Y/5tT/TVwnxFcvLkmeXDU2sgOJxWh5
	IIjHZuSc5Msh9NOQkUH/T7Eed7QhvkYImpDZn7jyf2y5DRz7W3XOrK9QpNu2Yx+Y
	CKaa3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnq5sq91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 21:45:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e8c47a3so239628691cf.0
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777153504; x=1777758304; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f7RZGJSN3+WAdtDl5rsnVh3J53kF5urGcCMS3HU8Vss=;
        b=Mtxf6XL0szQZF93PIoXVaCmE7CxEXwiQyHP5dSgihH7u6nsOllHNBWYh8f4TKQITE+
         W0FWmMRG5QJTMzKiVlzlWQ6S+saxsjrF0Ha/bHfbstDzJN8G22oylPete1joLH+vPUSn
         IYr/J3nvJi5Wnno9CNdguKAWIQE6Njq8W7Q449ndKlUFy0Wl+4DhNnYhm5rW1P0HsCti
         UVoLVGDGkvzy8mCSxDB0EPku0CLjMt7NAbKAEBAOC9aRWyrQppoAiy8t2+wIhf8vDIsH
         e7Id4MRKLoRfCSpE6NI57QeRTWel94LPUwMpshIEUZ/Z2rUE9wMTOvR8QUbK9OGhVRBO
         4D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777153504; x=1777758304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7RZGJSN3+WAdtDl5rsnVh3J53kF5urGcCMS3HU8Vss=;
        b=SjTSnr79FkZUl8xA6REtu6XU2WO8ovhZp//CxoAwqAGhsuQfy1P2IX6kuQcnybpm3c
         lSKszIMTrP6PXCHg647NlZ7XE0XfaaoVJd76mi9W83GUrA5PIX5gbmHw741rGYez1TMz
         fLYtCHymB55fISjjuqZXAhGrC12h3Ja3FGaV2CYRp+Bxc2YXvyek1MzRlrgpUoNtufGt
         dFfdM9mfNhmn93s+zmNJtmxKHM0FY3k8KkLdXKnEYhUicGr9uslXWxuHB/S6c8iXxWCP
         o16yWL/XDYizb70XgDCxmn9vNVaVl4KAf1tCE8JKerTh9r4XNxvrLJLFbZII1vhfAGbv
         0a+w==
X-Forwarded-Encrypted: i=1; AFNElJ8MXANLG+lcP6iMgdJTne31FjMNsba5ocNBRBMXaT+5k722Tn0rL+pylZIZrLa7PwgdBJoK7NV11wNr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54dv7CsOn+96XEivo2J8xzg97ki05DCfrUzMArFrm51X/tpFf
	IoJh7DXXVUVVVhPYLgmdDhNR1xazlHI6sI/L1LXTUKj15lCrzVquCv4VyodNeR/9B/1EUkXnJA4
	GI+lTQ4OBMOBz+zi7WuVgQHPjr1ZS0t0fIGD94aDr9BWeNmHrunP8KmSW15ddc4VYLXYXFQPExl
	XRwQ==
X-Gm-Gg: AeBDievkydvRkHSm7WhbCMbrTmSQLSDalXnJ4DkmbxXwsu3MRMrCwINckJv6tJBdFGD
	/fT1Wt3zxQBZ/jqdblEam2TI0hRQhQFBRIWVzi4N20jxZQwN++CezfINj1xqMKZZDUnp7kqBjFU
	w2AmHPyR4v/OlqyW1jqpzrOfLAY2X7OOSvWT2/ALdz4ybCOGqehMQ5seK2hQnpDiDUMH24eYJtX
	wlfhT0jnx9aA/BtFMicQ3IJtSLEa+pWkG9qylopdliMg3zlBvRRKgeKkn9iJQdugjA68a11nDot
	8Evs+JWU4tDV4lkSFLGDIjeCjf9O/0cpwiCSlTzn8p8MU/GdgAx9XJVB3t31LS5xP36BmRItsaK
	VgxyIQ5nHlbiJuIi+kcjvMA7crGwDC03Ug5pxFrQFbxe4ratnpGjXCT972l9v4bkTFbZ23+NCrL
	xFKwFUJd+pbRw39zaDTs/k0DryCeQQL7aj0JAv3qo55BE1VQ==
X-Received: by 2002:a05:622a:1f0d:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50e36c56a1dmr524175471cf.48.1777153503572;
        Sat, 25 Apr 2026 14:45:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50e36c56a1dmr524174881cf.48.1777153502621;
        Sat, 25 Apr 2026 14:45:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0c5sm7017077e87.10.2026.04.25.14.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 14:45:01 -0700 (PDT)
Date: Sun, 26 Apr 2026 00:44:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>, Alexey Charkov <alchark@gmail.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
Message-ID: <ur7mow4lw47ylxj3uigwwasrfywe6n42zb2to7ygeyjlkcgfkf@guzkembyy5hc>
References: <20260425031011.2529364-1-dennis@ausil.us>
 <20260425031011.2529364-4-dennis@ausil.us>
 <20260425112844.GB2964234@killaraus.ideasonboard.com>
 <45evt7lkzuykoqsc2z27hsvm7fasmn6sr6gbjtdnme54jauehf@dmvon2o5emzd>
 <CAABkxwt1=n=CnrVfCcw+EHjqjfsLkp67POk451fV8Gqw4vdnQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABkxwt1=n=CnrVfCcw+EHjqjfsLkp67POk451fV8Gqw4vdnQw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=QNxYgALL c=1 sm=1 tr=0 ts=69ed35e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=c7CpEUyHu0UMHcTobk4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: WRu4EmxAfQVGAi401q-MPAK8w3wBbHaf
X-Proofpoint-ORIG-GUID: WRu4EmxAfQVGAi401q-MPAK8w3wBbHaf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDIyNyBTYWx0ZWRfX0RAiRyT/eqKb
 Ci9i4DUBEKKMPXTIkcwW50hcub0IkZ3HUG1R34vfni9XmwzZv1ceeAK1VfRwSxJJCFsZHOLNN/A
 EJrQFQa6n2cHApciuhYodc6vO8AezZegUk6uEQak9uV3mnw9hwT9MYtlVTah1O7j+HtpcsPzIfb
 MVfrPY6wQ2R/NI14y8swtJHMXDp2bZPffFAvm0ziIpJf7FZHjBL37e5hrQjRw+gCYrvsZK1iMhY
 GOa0uTFNkVVihr6iwap0xCb3RL0FfVgRuuG3qLh+m+2f9L13JOOG5dSFC1ws2zfpCjZAAyJGABS
 t6ZqTtrHBbHMkbQN7uBUkKoVCrmQ9TMKYpFQC2vxifEFn4N4i4zIekJg6dLJ1rStA0mGZs5wUHX
 xLHP4UWaDRrnDcsEPoef3rcbmlSfk4bkwPMrpumD5q9puxzgyke9a9IO3pkHgo7uL74DNEoMpQ2
 D4i+JCD2X8baOTBUsfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_06,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250227

On Sat, Apr 25, 2026 at 01:10:02PM -0500, Dennis Gilmore wrote:
> On Sat, Apr 25, 2026 at 9:24 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Apr 25, 2026 at 02:28:44PM +0300, Laurent Pinchart wrote:
> > > Hi Dennis,
> > >
> > > Thank you for the patch.
> > >
> > > On Fri, Apr 24, 2026 at 10:10:08PM -0500, Dennis Gilmore wrote:
> > > > The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> > > > to HDMI2.0 converter, designed to connect a USB Type-C source or
> > > > a DP1.4 source to an HDMI2.0 sink.
> > >
> > > As far as I can tell, the LT8711UXD has an I2C control interface.
> > > Shouldn't it be an I2C device ?
> >
> > From the datasheet:
> >
> > The device is capable of automatic operation which is
> > enabled by an integrated microprocessor that uses an
> > embedded SPI flash for firmware storage. System control
> > is also available through the use of a dedicated
> > configuration I2C slave interface.
> >
> > My guess was that it can either be an I2C device or it can function as a
> > simple platdev with no I2C controls. Please correct me if my
> > understanding was wrong.
> >
> > But now looking at the schematics, it seems to be connected to I2C6.
> > Which means that it should be desribed (and bound) as such.
> 
> Hi Dmitry and Laurent,
> 
> While the schematic shows that it can use I2C and has been wired up,
> it also shows that both MODE_SEL and I2C_ADDR have unpopulated 10k
> resistors; as a result, MODE_SEL is connected directly to GND, putting
> the bridge in autonomous mode. I confirmed this by running `i2cdetect
> -r -y 6`, with the only device on the bus being the HYM8563 RTC at
> 0x51. Without reworking the board, the device is not directly
> controllable and just runs autonomously.

I think it would be nice to mention:
- In the commit for the bindings, that the device can be running
  uncontrolled or it can be attached over I2C, bindings describe the
  uncontrolled mode.
- In this commit message, the same.
- In the commit message for the board DT mention your findings about the
  board, mention soldering R9 or R17 (which one?) and R27.
> 
> Dennis
> 
> > >
> > > > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > > > index 8aa31ca3c72d..42c1f3d5ba0c 100644
> > > > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > > > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > > > @@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
> > > >             .data = &(const struct simple_bridge_info) {
> > > >                     .connector_type = DRM_MODE_CONNECTOR_HDMIA,
> > > >             },
> > > > +   }, {
> > > > +           .compatible = "lontium,lt8711uxd",
> > > > +           .data = &(const struct simple_bridge_info) {
> > > > +                   .connector_type = DRM_MODE_CONNECTOR_HDMIA,
> > > > +           },
> > > >     }, {
> > > >             .compatible = "parade,ps185hdm",
> > > >             .data = &(const struct simple_bridge_info) {
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
