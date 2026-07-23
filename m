Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268374968E8
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818355; cv=none; b=UEix8l1o2dS4d7USTnxgEWwiHLIYda0LzQYfY/vgKNN78TsPAO2x6s4b8P/imB1WqOL8ktU9zQHJZHlzxip0Xa0YU5sg/qOb7KXr8SGSkZMYpLzd84/2Qx3IofmzTcdn8mWT7rz0b6Yb3oQdFdvzKWWgutvgoVZIuqj4lrQdPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818355; c=relaxed/simple;
	bh=AcKFe8rHZEN9WA/9gvIgU1Qvi10KyZKtmdCtoxfZdSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYmc8bzusdfljgvfNBecb9/AXhSSSNlKoYO7LLwO8Nhm4mq/GH3KM31YEaCFSrfOnIl1atYARqqY+fSHlPxd7svqPsDz+p6wXfq+xNKPb9qd0Rl5frPO+MTFvOT/Td+UI7A4t0uSmKJGTxvju9QK/LRCUMZ7S4T+36EMyE13noc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oclqc78F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoOzihUI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oclqc78F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoOzihUI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvUnR4078292
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6BuEKfXEzT6vDZyFzbYENFwq
	P2ZCaxQDHcuegPMajFs=; b=Oclqc78FRFy0zdixA2Y3PwskeExSft32Q9TAcno1
	DoClNaOebgIgx6+EOyz+3zErI62uO95sWF4ZN1Cz0V7yyIVS7h+KGLxGGtCHhabs
	5MUO/kRqWIQ8WRaFQQZVsg7qssyGR5Sfshu2ssUp+/C8yLBv81CPykEnqwc7stFb
	wRdj5TFrDBXifcVCCa2MyKF0XW/KGqponjSOs4cpnn+Z/OYwbBhbznBf5+Wy5Peg
	p/NmqVSMaEzuAFqL2aEEKKyCCjc8g56BXbw4Ci/qSawK5m9Qf0n8Vs5hmMJkzHtS
	C7ZmxiPUxLl98y9Y2cdo4K2uquLoLcfee0YmIaGMqbec5w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg521cj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:52:32 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e4a02796so236980a34.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784818346; x=1785423146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6BuEKfXEzT6vDZyFzbYENFwqP2ZCaxQDHcuegPMajFs=;
        b=FoOzihUIrNcXWqRX/VgZUTbmQ7MIQerIgHlw70Wh7XOy4g1MyV2upfOrQ7nBPDCusX
         SvcVPtaQxhq4CBCtRHUzlZUxtM1K3n+Y8YC0bEFznFen0AUpFr/d305xkpcnrWnoGXLb
         Ke3mcBOhtXxsZFKDmAOeeK0MYX9xOoBMMkzsKy7Y6RAEX5k0itk/1aL88p6XF364V0nR
         rl0dlyjmlFOCAbMCA1Vm7FMEpFdXdR7SrZG8KfaDJ9zcCLxgc5wTgSzIrVcSqiu+q+20
         ClSvim9TuRTRRlsUln55F5tOnBUVrMXQR4OX/MGC5vyf/qT4eXEwj00ZHxhNVcIhZ2Xq
         C/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784818346; x=1785423146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BuEKfXEzT6vDZyFzbYENFwqP2ZCaxQDHcuegPMajFs=;
        b=MGB+W+PtM7VPMkCMa+Pwii9XCLkENg/e+mLsoC9JXfp5hc6NJtsLfHg2/KashQREUu
         nHbSifAKFMtlQpJEzA5v5UdWSi03SmARyz+MfLMGM/eEq+HLMgrWjnp2eo88bvHyIRYX
         Obl3cWRq4Iexev7UkLkilwELwOba5JPYWd6FlkrgDEVYTyoUhaHV4DrmHkXRqazJKYBL
         7cym1sG3Scqy3GbYmx1sJf8Tn/xw21hd20OyHGFO/2lthTa4ngKhIzMBQnN4tm//s92E
         EM8flMPx9RfpLzsPEledCcOomsLwFp2koDzwLdcNiSIkxW/zkdcbCzyDLFSpDTaHrHdH
         rxtg==
X-Forwarded-Encrypted: i=1; AHgh+RqQSlaHsizseev4rxiun2D/XcEM+vgalBnM3Nk/nNB2Ahsqcx0JTwXQK2CNWVugzfeOj+DL/xGXOQ+J@vger.kernel.org
X-Gm-Message-State: AOJu0YxeUuE0umB4qYLotbQdbzgGLtCHCEeS5DEQn6+iRbTlpVRcshro
	8wEECUnILSPz9LmIXBL7mb3bd9R5Ho/+cQrYhYWWNPw9+nIfiVUdm3m3j2u3qjZ6qyTSOI9d81c
	4oOMamt/+/jLyY933aKN9WBmWWIEmpZQjX96y7S1S2MTNMffmXo0OVTYopO2+V+V1
X-Gm-Gg: AR+sD129wQSc3wE40k0vG2sPw2z0PnLohalH6uuruGiKkI9L6nIhRYLzzbJRGsvB8nS
	eScYutTu9twKJS1VuqsGvXDMK6s/4vdZqamF6dgB6tUau7ZmFN8kYbZvpDW/ypP1j9J9ZWDvhXB
	hjgNRkcq/f1QS6tLmKyVOGhdKWKU7sDFbcm+6Pleg+jUYdmFxovOC+hPe0scnKWvb8WSW09wG3F
	7d4n6TgRCH4HoGjtidoe3dttM3638QVPVr2vt9OFH8CrmqbKTyI3RwZFbDBAQIUmeo51PVWgIDw
	16il8e5jna50uLEAGrDfRKkx/59vnytJ5YtpIlNAJ4Yo3EzP5XMuD/zgqOoTubzO3zWukhAy4yS
	VcgRgKdWJAg6mkaNtdsd/C8RtDL7/7gEE8H4RiuUKVagYcFyULiAmtq7dN/E7JgFHSedVOO9NTK
	3s1y9qb0AiM1Ijk10fhHpd
X-Received: by 2002:a05:6830:81f6:b0:7e9:b772:9ab2 with SMTP id 46e09a7af769-7ee52dc0600mr346516a34.7.1784818346159;
        Thu, 23 Jul 2026 07:52:26 -0700 (PDT)
X-Received: by 2002:a05:6830:81f6:b0:7e9:b772:9ab2 with SMTP id 46e09a7af769-7ee52dc0600mr346499a34.7.1784818345693;
        Thu, 23 Jul 2026 07:52:25 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee4f10b691sm785096a34.5.2026.07.23.07.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:52:24 -0700 (PDT)
Date: Thu, 23 Jul 2026 20:22:15 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: display: panel-lvds: Add boe,dv215fhm-r01
 compatible
Message-ID: <amIqn2rJhgjkHDMS@hu-vishsain-blr.qualcomm.com>
References: <20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com>
 <20260722193954.GA1559082-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722193954.GA1559082-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a622ab0 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uidagIbUEOmi54HA150A:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0NiBTYWx0ZWRfX5qZRmrYGuepl
 qznNivqtXXFxtJu92WN8vIlNkoyYklN9o/UCVOvpNKLQdWCZNUfS3JcJdn0vazl5My0x6GdwDR1
 Upei34heUZ6VU4oP38wud001JNyDxZ4=
X-Proofpoint-GUID: Yu57C93pF4pQZx7FybukgsLNogYvSFLB
X-Proofpoint-ORIG-GUID: Yu57C93pF4pQZx7FybukgsLNogYvSFLB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0NiBTYWx0ZWRfX68wGm68j9wZc
 FWPvEf6Fy2FV/huwQuJ2LF3SLapISRhTT3/zwmyNajcVOjrg4z1sbnRVDpPrzAMeVM87xPGKApQ
 +NqDnZ1p6qwYxx2rz1ndiblS7oaQGRqSaxXXQd66aUeUs5P3W3dbxqw6/ooDIzEUwD/tOFu3pCV
 cAxik1dsRF9wxn2oxTuIbBdzx5XXzJF5BQ7Ijj9v/kEBELT3earIy58AWJItejxFrWZ5EH+wDGn
 jXNcRQUUohhmXqXmXJjC5MMWM6sci8CKsLJIxtIElKwmxtQvlm3DykvK97PlOjyyXtYuboIy+fh
 +CZnehcGinYWjW2vz0i5llNXLipQSfhXqFqbKOtY1miPAavmrx4MU0xC5hTZHuPC3/4gBkrdrac
 r+VRgWYbH0ARWNo0Y4X36q8X15kNdJRJ6Bhg4APvqoL+wDl+RNU6dXopEg+p5KxIs7/M2WLgT8I
 VvSgHid9uj6/gzKK8yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230146

On Wed, Jul 22, 2026 at 02:39:54PM -0500, Rob Herring wrote:
> On Sun, Jul 19, 2026 at 09:38:36PM +0530, Vishnu Saini wrote:
> > Add BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
> > compatible string to the panel-lvds binding.
> > 
> > Also remove the 'port' requirement from the required list to allow
> > dual-channel LVDS panels to use the 'ports' graph topology with
> > separate port@0 (odd pixels) and port@1 (even pixels) nodes, as
> > required by the dual-LVDS binding.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/panel/panel-lvds.yaml          | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > index b89f86bc0683..584818b2df6e 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > @@ -58,6 +58,8 @@ properties:
> >            - hydis,hv070wx2-1e0
> >            # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
> >            - jenson,bl-jt60050-01a
> > +          # BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
> > +          - boe,dv215fhm-r01
> 
> This belongs in panel-simple-lvds-dual-ports.yaml.
I will use this path in next revision, this will also change DT. 
> Rob
