Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71A9313535
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728192; cv=none; b=DvoavGF5iWhbc6ipr1nW6Cy6Bp2lGPNfZnxFIXf7Alt3vs8t8e2HWFRbePvZq6Rw00YH1doagExEqzyFF44Q51OdrDptrxowbMmXojpluRk5COAi0Nel7x96NFKqULUfGD4nih4HsFAFgQEurDXQRpFw3kqfzLPzIlL4Q1DdPZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728192; c=relaxed/simple;
	bh=0RsMLv0O1tmrJZtAg5LMqmzKOUq6x7mTc0BWDJmg7/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6hC+Nl0SBOiOVIXlhMFAUg5txhXDqR7ylV2oY4JuIBnzTBpKC7KA8JUMubQjesvod7N7SfGZyKkuQ22bo6AZmB6QZlwA0vfKJixqA0oYlQQK6sh2rphxCip0h0JiMpH4ECCZEBRlT9wRKKxvHTh0bd3qu6NViEiUfgJmnYO9Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hr5fgvDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEvBVWY5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hr5fgvDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEvBVWY5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWnaY1017360
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fQC1jvB8zOlwlP030LDDWgAW
	3PkP4UID3AkRSP2t4JU=; b=Hr5fgvDUlKu8VaWUzKKUPtnoMkrD5UDqJjN3uqsm
	4LCZZHoFy+Ke7D9inNjlgdfoZeBHRgPPQj/mpqYdQCBZCHp5Ds5F9Y05QUq+oTja
	XyL4/OnK/PZy0SsVaOtTpebc83L3QmTisS38UHOtIzbmSZvR9GpZt5wjRkAb1RJK
	5P8miUOeR3ApkH3kW5PQAvYrGn+kc7A4VheF9ol4GIABagzmC6HEUFNN9hMPlRxm
	rk3yXpL5wDhYYD5uUe+CDGRtgmJ7pxyMr8k/irwJ2tLBzRauOfw8NQei92RFIN3e
	ZaFmFjrsZGLGtJDpek9eUcbulDSmIjzX4VnQB8QBgEV8ww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs929m1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:49:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso30842611cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784728190; x=1785332990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fQC1jvB8zOlwlP030LDDWgAW3PkP4UID3AkRSP2t4JU=;
        b=TEvBVWY57/04eK0hWuh+JbqxG4hkGCqzmLZMZM3BYvOAnQKinzgZm3FY1ow80yYo6N
         AyMcFFD0eQOFjBTRiyDZ0Kfs8PrUcAMdJc1NlHbb75AsfpEkBuaB5YV7shrWP/S0MR6h
         d4ISPC8ruEr1a2AMAEW+87K801BU+67AMiFGCxMh8i7TG7PfgvTLKQgI8NlsUVwzMt8Y
         8ookZBcXlvcoaIWMrRh2zc8nkbTSNUjvO+62LjOEKrDRPPSbTXNWjno4iQiGHU3u/x9g
         rZVQZLrW7WFmb0ii9x33PeZH8VKDnHp5liq0tQl6ev3cL1lk320Rzz1Mnqr5BeDnuAtM
         5xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728190; x=1785332990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQC1jvB8zOlwlP030LDDWgAW3PkP4UID3AkRSP2t4JU=;
        b=PplBhzL/nbAzSirzioSZ5o2bBn/sFRe9e12FrRAuAjAbFUj9eohwUYWZBFObFBCmAo
         //tLJygZppiWDqii+rBTcQvr8fM23Bup+bBxuJWPbNlZ1wP8vd5Laq2RhQ3nmVVActNa
         8GiJuq/iHTINqrv3K6PJL77OR9eBsJUuSolknvyiqsHQJ2gHOY+q2Bzxa4Le9Ku0oJ/r
         gKbgniz6U4y6YGOmDk7dJ2iv1OmaMwuodbHlpVY0qeyCVpVmPX7NAjDbEqUIGrvltSNe
         wODXWQwbgu/2uQGUL3mtuAkmCmkwEi74yNz4ip7Yq0GZkbDPgfAq2npx/qM6HeT7JeEr
         qd5g==
X-Forwarded-Encrypted: i=1; AHgh+RpykESVAp4T+yMehDsL+gHYQKHMeXSlm/gkF3ZD4sIFy2pjMXlGiWpi3+ifuG5kTPwVK5emrLBEmIQ3@vger.kernel.org
X-Gm-Message-State: AOJu0YyVaYiDUmy+YdXqcung8YhJNjNmWAJp1MiqxD01OJYt/KIQ6WGO
	uBOpUgc69yTTmZTSPYMrOaDNL9bDB1mPJ9wCXA0a6Q14tQYLq2L5CE1EVUhdsZVP+KwWDP3Um7X
	aW+S68DvPk0eNaqx7fpEBcxIDdPZ5/EvtttA1yq4w0v3+UA1aNCVU7h8jZV5KcxQy
X-Gm-Gg: AR+sD10ky5Lckzan2Fx61lZ5cO/DhXrpfLANOq6PVOeSl6gJLQbGTZTFZrIIeG6xeTM
	w+SIyvUi7uSBAkWYXdtRsV6HLw1gdh0iTvVFQDHFSnTQe4QsAqTtSBpMcj0E+fUWqayvEXvmFil
	CYQfSRFzyZjqyKVrOsrrk8FXa9Pw8Fo4QuiJNL5Eo+YtIclZpyTxcvCS+HWAkq2NfIDaCQvJOZ+
	pW9/qp4beFXyXbU8lw9W3hfhzj2bQfi9wRxqxhotdowTfUBEpW87JbefGA0BPJzg8xfLJJzet4j
	zHsbhhHSClR00Ez5xQq4W9uiY9TWjTjN9FzNA02zARgU4zbRcYgi7PPvEYlsIohNF8KSOxrJsXx
	xBMK3AF+oigPBqABuZ7wMgEb/NbqKO7Qj1f9bf4ItQjNwQ5Mwgf6VbuxkZxHVpQ9EnSlWoML+fR
	qrqJD30+l2xBKkJw==
X-Received: by 2002:a05:622a:48a:b0:519:efea:cf41 with SMTP id d75a77b69052e-5213c20521cmr216204611cf.28.1784728189953;
        Wed, 22 Jul 2026 06:49:49 -0700 (PDT)
X-Received: by 2002:a05:622a:48a:b0:519:efea:cf41 with SMTP id d75a77b69052e-5213c20521cmr216203731cf.28.1784728188742;
        Wed, 22 Jul 2026 06:49:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9ac98sm518677e87.22.2026.07.22.06.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:49:47 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:49:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <hmqt3rwlcx23lndkeky3ykk6or6ibfm7si7gh27utexeonxzqj@67yvhyey6oje>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
 <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
 <04a9d8ce-e83a-4307-8b14-4afe739b31e0@oss.qualcomm.com>
 <altiV4pSkfVs5UKM@hu-mdsor-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <altiV4pSkfVs5UKM@hu-mdsor-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNSBTYWx0ZWRfX8s17wuD+1kif
 QH2YW97P3MZw68N217ZYOYNROoqVESHOjhxGHi9xvEMSeVOR0hLYNNikKZBm/RongLwbBFNWHV/
 p/NMJTyEn6o+8yTwK/8b8fUJqLoulis=
X-Proofpoint-ORIG-GUID: z7WxJs9jKiucUYzhaDceyZQBA8PL0In3
X-Proofpoint-GUID: z7WxJs9jKiucUYzhaDceyZQBA8PL0In3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNSBTYWx0ZWRfX6HoCMf1NTBxt
 wVKqg0s6lK9d+PuyRE27/cqXKPK86rO6ehVrenGMBupIO+r+1PVRW7HJaOg4SN6INEUrBx2k66Z
 DASx19sufkF7V13aWvxrucUOn4wwuMjuuVh9efRo7F4OlMaBG3M3T548vv2wPUFBi5ZgsgALUD9
 1eySEIf+k+8GWid7iNch2mCBZiIyPcz4LMuytYeqbMVlBwo+ApOJLpUeAe0/O7wl/pzxxUzJbFd
 AR+4fbKRSk/dCBIlGXWvPDugaL7WZY/KhSOKAxehd2V/i2vgwJFQzs8RuhxoJR3ojE8d42TLxX4
 BSm71kIjiS3u2N5lZvqNZtPsJrijWDCtlaCAX+83zhUv0EC4nQGSUHSzYjPbg1w2H9rrZ5bxBY8
 mCWagCrz50kXAIaw4DB8ceTiXt6wyxBRDVXHndXiB7gQvljtrVH6mFwrPV/sOJPSIZ/ffy9mDtY
 dZkYTR5/XQVqWKJonEg==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60ca7f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3YUFb16USFhe2vDX2WEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220135

On Sat, Jul 18, 2026 at 04:54:07PM +0530, Mohit Dsor wrote:
> On Fri, Jul 17, 2026 at 11:17:10AM +0200, Konrad Dybcio wrote:
> > On 7/16/26 9:30 PM, mohit.dsor@oss.qualcomm.com wrote:
> > > From: Mohit Dsor <mdsor@oss.qualcomm.com>
> > > 
> > > Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> > > EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> > > 
> > > The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> > > a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> > > rail. Reset is on GPIO76 and interrupt on GPIO85.
> > > 
> > > The bridge receives DSI output from MDSS and drives an HDMI-A
> > > connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> > > 
> > > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > > ---
> > 
> > Does the other EVK not have this same hardware?
> Yes other variants have this hardware but only IQS variant has
> DS-HDMI as default, others have DLC panel as default.

By 'default' do you mean some DIP switches? If so, please consider
providing overlays for the bridge to be used on other variants of the
EVK.

> > 
> > [...]
> > 
> > > +&pm8150_l11 {
> > > +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
> > 
> > This comment is superfluous
> This comment will be removed in next revision.
> > 
> > Konrad

-- 
With best wishes
Dmitry
