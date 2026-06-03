Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56047DD69
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490426; cv=none; b=jie7WAAEZKlBY1owAzXsEVyjCTd36UwHOXrLzS7xjr1Fk9gzX/hHyW6NMfiOa4ANr7VoIUpRfsGtNkyGWY1uy7YSXxQI5Flh3TtbSn91VOmRS/IAZPkUQ1MS7VnEq3+QqvIOtobYIxBwS44pRkqiepEcIo13EcLFXIQ224/Yn7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490426; c=relaxed/simple;
	bh=3ENO8Cnau9XEGZ/1SR8OWRDCQnePaNfIFs/M5B4ZNgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfKhck6X+mV/TEsdAhJvQbXJfaqQi5ZImJ/BucDFjvQbbUpfg6c469vKeRJ5G3ZgiMgGghDOfDOPZcRve/X0ioJ2NkkmERMyeQUIOSfj4hced/PxQ/zerntP4XgVqzCkvAc7uFsgJaEwLYz3qiMTenOVVe2nKOR0W1wYp0B7h30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpMls+1x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsBTyoKt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpMls+1x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsBTyoKt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653AB9MF3552373
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 12:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qkFx9tbUxp1w+RmhJqtjjpX/
	0wc2j7aCCAIDgm73PdU=; b=YpMls+1xXmsWASzVOnwTaqExZvCILBcKM31RlFe6
	zmbEgi/Mldf1iuPrXJy+kW5tYZOvXttzv2MrlP66DHOsRAMngxJwYn3vwZ79K9Lk
	Wh8LAwwPhVaH8ykGFaMu2OG5U1h7a2AI+skcqiJcdlj1GmsGAxvFIx2pkQfMy4Jp
	cNGHgvvTpvrpz2/MWh106M9K8UHz7J8r2/meESi2i8QsfSUK3r7NmzDTknElSl/K
	lwS0BVDcQvP5pLOBp1xHrc7lHsYmO3gnUN9dh46e4FN5fIKRmEY+nr30vexIV+wZ
	Wv7DxcmEPJvddi4Jmaq4aV/sQ4flkCUyil8oxyfctSs+xQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mrhhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 12:40:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a1912d5c85so4829465e0c.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780490419; x=1781095219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qkFx9tbUxp1w+RmhJqtjjpX/0wc2j7aCCAIDgm73PdU=;
        b=QsBTyoKtqX8cZsTzv0RZv415bzUd/ezjDTtgGvYIEjJF8DN9FvVqXXMEUd0sorLeM2
         gc+/Nwtqnb20rW7iB8SjMhheD9khY+cRCPiPBa/AQ6hs3Z/Xxacu48pksewZI8eGyysb
         FjSpnSqlNMNHZ0q5390czk55LxbY6vn2ckHfHeXt1xmAlRAHnfib2gLZrlUCo6k5xdiE
         0nT4QHZ0Ssf2GunXAGD7sNG9P7eXHv11cw17FeHPt1j1uEr56Tn7XACl/Yad6fFv63nw
         DnZvjxoo5FPl1YXDupmyXp6CwN8GvKQ1D5pjlntQdLvgALqaFtZ5Or5GhYIbLFHuripm
         GAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490419; x=1781095219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkFx9tbUxp1w+RmhJqtjjpX/0wc2j7aCCAIDgm73PdU=;
        b=HseDTvEuYrBG++GgZIgBmdVbF//jMhBbk3ZohzKYciJDIg5WC7vkkm35k/pd161/Ij
         mU6iw3GBS73gyKDhFvdVyzSvejcpjch89mZOAy52//FinbFuBbhkxLJ3VpDXSCy59OQt
         dH1MAlGxTH0Hgbe78T9xBWIJIe8UWOJsVhuwa/eHVSsspAKY4ae1zzBYiK1Yd5CjaWoC
         Jtz1GS5LhfSecpx/yq63iJpd5IM6hr0ApwVNYe+q5BJ9Res/MmlUsy9en3YdbSV+5k/L
         zMshtku/QaA0F5r3bH32CMO8nnAnwbWwRRaeolzGaWWWCSoYNeHtZOXgI5b27pWIksaF
         a8sQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/QmbuvIz6ULNws86KluyPf/c4OEkJtSAMt+1g9vkmhJNhDmLYSDqAcZeyH6ncjuZm+elSWdXyDBLy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6fl2mBxSEzuaxV52yU2TZtAsK/QF6yVU3ptPr+nqQccWJSCtV
	5vBRoUcPR+h8Q/57wRslqLMjBoZi024aWe9TvuFIJ1gE8gcru2XgsK5f9rohNn7vr8qU8HjDmvF
	eyqUXTiumCqHvZDWEMtQLXknw2owMrN94sye0hxvgr/ONMj9kStAaZ6aOEPmwhIMr
X-Gm-Gg: Acq92OFUIyEa1Mi2KEcPTZ/1hEA0cD9Q73yKNG79OG0PwARv4vw64dETzX+vT/jSzow
	KINr37xSiclC5uMB3jPGieYfr3msG+4TQ+Cz6TiDz55QCG6EROCjIW9CBV89KoujS19JlH0B5tP
	UeXdaZYffSHt7gC1wOaO8UVO65MQTQYiO5JtXz26cy3eJbei46XWgwHIEhKClEfqERIljbKDOsE
	doWGDmGEaAzpFi+Jmqz/Pw6+36HrHUYXp5cWhIzw886yVqL48BHFV7SLwQPJ8NB+dTnHAnRKEc9
	L7v/MMTq/2eBWVPBGZfXguX+smvUH1Qdgm7aAdmuFR/Zha3IErzcavqKIU9uc3dfBJ2f0ZW/AkT
	lI41YNlSD4O177lSgLZ07pEo/H2RAur+yfyB+QepCpTDQT9QS27TOmFFZ/xc6Oy6r4eOBeXMyex
	AkE/EZw3bxNWPMLQnjsMD/gvnFb6HuyOqlAFvUbBkWTeo6yw==
X-Received: by 2002:a05:6123:110:b0:575:178f:62d2 with SMTP id 71dfb90a1353d-5a6e97b1706mr1765040e0c.14.1780490419111;
        Wed, 03 Jun 2026 05:40:19 -0700 (PDT)
X-Received: by 2002:a05:6123:110:b0:575:178f:62d2 with SMTP id 71dfb90a1353d-5a6e97b1706mr1765016e0c.14.1780490418569;
        Wed, 03 Jun 2026 05:40:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b9c4sm625939e87.48.2026.06.03.05.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:40:17 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:40:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
X-Proofpoint-GUID: RzBbAuUbCHDMI60NjDfDghucwW-O-QU5
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a2020b4 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=7klWIbz71j6PMBmcNRIA:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyMCBTYWx0ZWRfX3ksoE9xaoMha
 GR8DRm0ZNIqKc8cWhp9Vx3DaD1i4HNBi2KUhSgyJxC3sVc1QNwsmngDGNfZYXv1uazz3td9BzEG
 ts6irdKl6mu9D5jH9mJWf2K16xcsjImmQrNdhPA9XRuZBCLwIl5BXPeJ+nR/k+Tef5YSH1LCUqs
 Bt+64NaogYBm0XomAsT5+2/hfzaJYoRBKK8WDnBogSPAeuzMtCtmVC8AxBoiy5lvml5okfx9rTe
 wj+S8cl9BMwBsadjC6xOQoO6PalTMAMaP7Da+TWH9iFb6wz1hpR9c/L+B5E5Geon1mg55husX+c
 U+fMA1vZPeAD/NUfxbAsYls4fTUckdCGRrYGHW5E8FiyLSyKbY+7JRIQeNV2GjqtfAm+XACZjva
 sWFt9ukWPbHZUJxCCcPYVm85hFFH/IGe+fKbvpb89EFrWICfMG3L0WlR1WtYO4DSfAhXHq+KZF4
 xutv/qrmgv1ihOptS/Q==
X-Proofpoint-ORIG-GUID: RzBbAuUbCHDMI60NjDfDghucwW-O-QU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030120

On Wed, Jun 03, 2026 at 01:22:11PM +0100, Bryan O'Donoghue wrote:
> On 03/06/2026 13:10, Dmitry Baryshkov wrote:
> > > Documentation shows clock lane at lane 7.
> > > 
> > > Truthfully it makes no sense that the clock lane would genuinely be locked
> > > to lane 7 but the documentation does seem to suggest it.
> > > 
> > > Yes in fact I agree. clock-lanes can be reintroduced if someone can show
> > > hardware that supports/depends on it.
> > Konrad and I checked, Hamoa supports using other lanes as a clock lane.
> 
> Are you sure about that ?

Yes.

> 
> ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
> CLK_LN of some description.

Split configurations explicitly use other lanes for clocks. E.g. check
the RB5 Navigation schematics, CAM0B connector.


-- 
With best wishes
Dmitry
