Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4A940F8DA
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971385; cv=none; b=rwhq6TDI1T2zeDBcfmdsaBhERUFsZw+bQnj2J13ZjfXsRsfo+om4NIUM3YdGKwHvXnv5dJnuUuS6QTlEaVgPPUdNqMLCmPAmzufdta1w9jNYsOWvnrUfxdynBW3dMWnNEHp2pajXAmclORMo6eH9b5DYkDd+KRteNwvUCvJ1gnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971385; c=relaxed/simple;
	bh=Zjrvh7tERyNDztcZ8548f0Y0HGpBLdU/mpFQ/R3BYls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIJr6o6tx4ebV+M1/LmL37EMd1g4a4TtHEskaPHBo9jMknLhOFwlSL4wm5W2J8Q60tlLYhKBLyaTqg69CQQOM0eLwygb2PhfhWXRCJYy7b7tx49R3n6syg9On2ax2dojcfRVZldqUvVxHstt01XSbjNRsqgrEQxh+nAX/tUMg98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owN0pGh+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5aSIKzP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owN0pGh+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5aSIKzP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VDtApb430936
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Db/vFpaBzmlgTloXuvSM0YLf
	Oqas6qh0AtMWuHO6rHQ=; b=owN0pGh+ho9eP7hV4ZgoRb55vFMRm58Tfs22sHPz
	w0MNLBmdcGkMPmZ508AAV8WcMLCzVNuQkH9giXFzEtMrIV+MXV+gpa+Qtvk7OmLh
	BNWW9qzc9RcTFH13jO1xXK8/uSvuA6przpKqSO/xQt3fIdZ7/dg1c00IXfOr8RNW
	hadASL+Ox7aud1IeYe7WM4s7cTBWm2WsSyQVsUib2cagkoFWVF+sW4rUCd6CV6mk
	Bbx3Ao6wNJo7b+TX0851jQw+BQLBGl2sEep7TzWzDHoWPqrZcV+mK6OTqVaoVImH
	+YELMMhHOoi6bPjlVgoM9MCVyDRXbM2IeRaAaYwsd++y9Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfka6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:36:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60521f54387so939829137.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774971382; x=1775576182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Db/vFpaBzmlgTloXuvSM0YLfOqas6qh0AtMWuHO6rHQ=;
        b=M5aSIKzPyvGCaI/+bhk5e5/CYTHBqpFwh3biN79DS9Xz0LOPanoZmotFZv6gkCutsN
         7BefQcjfILMDuGiiEmzkWyg9Ldu0dC/YMsbrJuWYHRxnCWoOj/wK1nthysfIMYD3n/Bs
         pDCCoYTeCT333aPsppj4rbw+TT1YA6yMgSHA8xfpu6GY4LI6wXmH7U4WWYZ3zce2S6Y8
         qrLNN7U9PHgMOtRTe+n22SOgvc6Fxnkv5RR9VhJ/uTd4ixGInNERLNmaItjh1X/VVrom
         5Q1yCwFp5Y/AdxnOmscCXUmO+EKbwDoknpNUk1U16N4NtfELy2rcg+XsjqMEXG0lupHx
         dq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971382; x=1775576182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db/vFpaBzmlgTloXuvSM0YLfOqas6qh0AtMWuHO6rHQ=;
        b=dDuIZS+HoehNQWKuJuawJYjxHZ/2+eoflYadScnvoOO3PTrM5t4OvgO2/KPs9t0dxX
         vykzwHArQSMcPEnBlSZYapDTyUaZhO4h/2IpPh920TiywfmXAn/7ujM6NqjWrZdLajdf
         mCHo2nGFws83YCa/J/lvYeoCTUpIanbVTm3Imxq2ngeYDNWf+1+pKlUCOQCijFDV7wZy
         CqVBUiuSyLoaFfgET9c4zfKEdA+ltgAWp1Q2tmplH7WIMG0Qoo1Zji6nJB0ihRN00qIj
         Dk9i9TinHUkn6bXHZeaVFZ4eDWLT5mHr57ZRyfAW+beLeIP5VAAQY5f/taeuMAoZD0O5
         ocoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtMs+goLL19MWW7QSUGeyyGE9h0wyUHC0lASc/7JbG9KLLoZdd58AF5ecBviIuzSwksrPqKqCeKNQw@vger.kernel.org
X-Gm-Message-State: AOJu0YxUhYW9WrcmwtmpJHOsuw5pJxAdYzPXLvJOlmOJkzJB54kq8VH/
	LjAoDWy7Mcm/S/Vlns0o86nfHX00J5TpuAc5QNyyPtQKcJ0o+nThhrUVpa4swCrqZ8pkX992FSd
	dSu3lOKTrIHpClrG2FlobEEr/BPlM0O0PWRXQ3qbpk502dRBtmw1bASDh2OLNeGVy
X-Gm-Gg: ATEYQzylffrh9Zw0OT3PveNXGMrc10mUDgs2gWIOn5itXdKiBwXri7/qW0w4izD6uRZ
	82sLB/5RqzSzHLJubgPDfY8QO9zIBTCrwWea23Nfwc7wmJMfZTGPWfltTZ7C3+6jXvgykv1zGcM
	S1kqImeAjlK8vipaJqv6ljesIpbi4ozYQVIPQPJBET3YR/CHQ+qX41cX5SKddj3aHIsADKbnUaX
	4FURSuzZ4MZrS/GH4kfHHfjVkn9q/r5BpMRaKsmHJqWHZUsqFcbkD7VI8CKiTN+IknjldOcG5ca
	icLXUmlEfJhbVxGsUcrLK8fNN3bCITirYDjA5pjGCG6LthcIPP8uMA4OftnZz1MALT/bqChVCkw
	8pgqSynTcYxoqyDP7xBrwXN6klH/qxNwe9meo1JalYHnX+5ERvsD1udiA0Qe1xd/P4iBLaGjn0V
	qHHq3LUQhU5sin5kk4xWMyJUbl2fBM+vxC6S0=
X-Received: by 2002:a05:6102:43:b0:605:c5c:10e8 with SMTP id ada2fe7eead31-6050c5c133emr4029083137.31.1774971382164;
        Tue, 31 Mar 2026 08:36:22 -0700 (PDT)
X-Received: by 2002:a05:6102:43:b0:605:c5c:10e8 with SMTP id ada2fe7eead31-6050c5c133emr4029061137.31.1774971381610;
        Tue, 31 Mar 2026 08:36:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm21654231fa.21.2026.03.31.08.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:36:20 -0700 (PDT)
Date: Tue, 31 Mar 2026 18:36:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/panel: simple: add Waveshare LCD panels
Message-ID: <kqrdzvu5ycajmdprrjqwcktq42t6453csi77ngzlkomtazxjhv@sxp7vh66my4x>
References: <20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com>
 <a13f5d5a-76aa-420e-a724-9b4714b51ccd@mailbox.org>
 <CAO9ioeUFfjr3Dh58TQ8EB7H3NgUX04N24OXXYijiigRZ8Kkh0A@mail.gmail.com>
 <982c4d97-695f-46b0-b819-a0b3d016b12b@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <982c4d97-695f-46b0-b819-a0b3d016b12b@mailbox.org>
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cbe9f6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=b3CbU_ItAAAA:8
 a=tnqjBxauYMpWV1rEDaEA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1MCBTYWx0ZWRfX03nOeETmGkm9
 n8OGorUAttQL777tGb7CTFS/qcpvm3F8LvFKbnBnG3GDvE4mX+mdFbMUbrELu6/roG252hKYCck
 cd5z6o8LNRwzEdzxNlhJPhiZ7jPF9+05HLZRB4NAZSH3nbX6KCph2aPMMGN68SUU3KSSRlJ0Ui4
 6UWlaoCFGBWLMkmWqola5kY/8WiCeNZka3/YfB3aELZRGZSBMTaNEYzuqDRaOV1mABr79QD4NRK
 2ogadnvdkBsbawTacnCz+Wb7APGu3mqFVkPTLaOgrf0NE0IwxepJoGLnUghZVSBy6813Gx/voJe
 3IHl5Vc9O1TlxHiorgNscPcl1HSXgaSwj4OVYrY/gD82M9djoQVFzqNeTgeOVnjqkQs7Y0ix0Td
 gOLzVqklmzX1S+rpzpMQrEPdE8cuNKNG1+hsInMfKexqxdyB3LxTpHTT03W6FfkH/JpOP9R1H5A
 TbPVwS3rNMAOhHha5qg==
X-Proofpoint-GUID: XodnUJ7w_W5BKcOQ318XWgebrOg_Yh0B
X-Proofpoint-ORIG-GUID: XodnUJ7w_W5BKcOQ318XWgebrOg_Yh0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310150

On Tue, Mar 31, 2026 at 05:11:43AM +0200, Marek Vasut wrote:
> On 3/31/26 3:22 AM, Dmitry Baryshkov wrote:
> > On Tue, 31 Mar 2026 at 00:07, Marek Vasut <marek.vasut@mailbox.org> wrote:
> > > 
> > > On 3/30/26 3:25 PM, Dmitry Baryshkov wrote:
> > > > Waveshare have a serie of DSI panel kits with the DPI or LVDS panel
> > > > being attached to the DSI2DPI or DSI2LVDS bridge. Commit 80b0eb11f8e0
> > > > ("dt-bindings: display: panel: Add waveshare DPI panel support")
> > > > described two of them in the bindings and commit 46be11b678e0
> > > > ("drm/panel: simple: Add Waveshare 13.3" panel support") added
> > > > definitions for one of those panels. Add support for the rest of them.
> > > Can we by any chance use the icn6211 driver in tree for this ?
> > 
> > As far as I can see, no. Waveshare kits have an extra ASIC in front of
> > ICN6211 / ICN6202, which completely hides all programming. So far the
> > interface is really better expressed by the waveshare,dsi2dpi /
> > dsi2lvds: this way, even if they decide to change the actual
> > implementation (like they did for DPI -> LVDS), we won't have to worry
> > about it for as long as their programming interface remains stable.
> Hmmm, I've seen this before, but I don't think this is extra ASIC. The
> ICN6211 pulls its register settings from EEPROM, does it not ?

The kits that I have at hand don't have I2C EEPROMs. They have 25Q8
QSPI. Also note that neither ICN6211 nor ICN6202 datasheets describe I2C
master interface. It is defined as a purely I2C slave.

The kits have WSVTH01 chip (CPLD?) and 25Q8 QSPI NOR. I assume the
bridge settings are loaded from by the WSVTH01 and programmed into the
ICN bridge.

> But no matter how the ICN loads its configuration, this is not waveshare
> specific. I have another display from another manufacturer here which is
> also ICN6211 that is preprogrammed. Can we instead have some generic-dsi
> display , because I don't think these proprogrammed DSI displays are going
> to be only ICN6211 based and only made by waveshare ?

If it was just about the bridge config, I would completely agree with
you. However if you check the waveshare-dsi.c, you'd notice that it is
not directly related to either of ICN bridges. It controls backlight
and panel regulators.

For the reference, *technically* the signal sequence should be:
DSI host -> ICN6202 -> WSVTH01 -> panel. But describing it this way
would require additional changes to the bridge driver to stop it from
programming the bridge (over the DSI). As such I really assume that it's
easier to omit the ICN bridges from the picture.

-- 
With best wishes
Dmitry
