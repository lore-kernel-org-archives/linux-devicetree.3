Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228D3D45D4
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489766; cv=none; b=My7C/IvLkaP7GAHKYuJx5Ox+lk8jQgRm7Fstm0A8eSA6rF3UVktQdCvyGCKl5ACcEvv77fM3Q0iJP28Gm2Impt7A1siexuAg1D72aBJwSZndPIF+6MtsCeGRRYSlwQ5xnbQnHQLIZe8ifyLlPvQQ6Qx8FPzLNa04qciof6qB6ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489766; c=relaxed/simple;
	bh=YMiHS7/GWiUf2GISl0uQrQVtiU37t172Bh0fR91tIQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwtEBNXeXH2wA/2yrYZO3GxONfTy5f2NdPFW5FtcVkKmDNWqZl0zRZieS8KxCoXXOo2uVfJBTkVyq2TJbhiyUhykmYoKh1gQT8Xc/36HjOAAF6n2QLkyKqANiwQYl+yrLwvj634/rAM/JxT7K01N5xB/BkpIap4tEErlrBm/9dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onqXhhsv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EzdSR1A6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onqXhhsv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EzdSR1A6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536v6Y81755367
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 12:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=; b=onqXhhsvHEFM3HWw
	klqBCjujNpHOAxiBAz3lOekrKdUWlpZCX63ui863WkH9Hb1M7/9MHQhvYud1fdIe
	EgWNFWRky8+f9bvFo4EJIhxkV06mCcDyhaI4hvwY9sJtqeGXqMpOb7EupJX3/Ydy
	gutLLmjCK29oBYSaoCHx+tD+81aGYPHBwBlB3havGfh0KVPszovtB5sG/8wfj1eg
	Q7D63DJxomJvO7Zi4S/A5ynmnTuqE4H4errGdBPlbeDk7W/ya33tJVViM72f6IpI
	LwZo9C0MM/sepb+9WTmk92+SC4xllUgc+ujq5zCo20J1fxpm7y2tpRZhp1ZO2i1a
	h2GVdQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff01b4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 12:29:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfdce65690so1554297137.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780489763; x=1781094563; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=;
        b=EzdSR1A6eBkCe2KlYxdaTW6s3q+6UiDvU3TlAg/ZpObJowj8+1+1o4VAMIcT/SwuXI
         Bl2vfhYiI6pPmLlK+CdUVCXA+Dzjh+6m58WEs+dhFAtfQ2AdkrwtA20DhQuz2N2VCAYu
         AH5SmYRt8s4OfkPvRmwzQW/eedZlVuh3by94Mir1RXFw1apAPB/2smiu2MVo/qeEa19C
         1QG3Vgxc69hl2vPlcsj+JRlSLzcW/WjtGsHRWEhFjKq6U6VVqWngw2ojnKbUIpe/LjHS
         LlvyF8EK7EBGLQQQhX7IMbo5HAlBc8F7CBAyYXxJu6jIl4m53LKcrsLHmOGOe4nAihRT
         p/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489763; x=1781094563;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=;
        b=Ojqabc3fRg0Trq8wi3E433mDzdxQQxDzG6tvpmKeygNhO/DVoTOewflVD67Oo6f5xR
         2GopV4ElyA2GQ5hkFIt90ogrLH3aaD6nusfV4JNAy8W0Q5hiQVhJBoZYbpcf1NpWSOmb
         jOLkxUVxz3VfUIbFoLvzb8vUvGn99lDht5rfh5b3fLXBOFm5R/8e1tfWXFTZTdNrnV++
         AeO9qXkO9s3turxNaePf2Y4O4YxWwqS6ff6XUQkHfTsgA8IYE77y068GCX/xF2qkr9rR
         WHi62l1oaPl3kyzz66fGJhc4F3ALy+dFwNXPA2BUlTBqjMMS3Q70U0Sm0480bKHp5EGI
         ATrg==
X-Forwarded-Encrypted: i=1; AFNElJ8V/sck57XeRYpcfuHR8g3e0fegdKfjx6jk9z72OOr8BV1LUx4icc8GFWiHU2LnO3ZjRM5Ik9pgTjmD@vger.kernel.org
X-Gm-Message-State: AOJu0YyasO2KMEbEdb3bT3geKYsmiF7OnfQEgjxgAAU8MZjn6qR3hkYe
	fr/i8BIUCBPlWB0awtlW6/oPzO6Z/L5C4dQ3cFAary+isbyH9AeNxY5uw5DzyOXK3YrE9YvpGIV
	sDQb7F3G139zbMnIa7RphiPbvq3cOgpCOSwhKRLfEbTZmf9cjqRws/TNQR/jLZ6A/
X-Gm-Gg: Acq92OEtTnLRXZec3lVh/apswmcSKaFd9WqZtDkvImMAxSrQL2Hbg37oZ0JhZFj88XA
	U3vm694J6VEeR7mXZcyoHKfEsdRb/xV27ADz8rROwEKS4CIuNTIG+oJGf2vs801VsWd7UvKtNMN
	SnO6E90iVwp8NBxZIT0y6hZ8tQb0kRCzeT02EoiDxkWRrHY0vtzBWcOHKJHL/5D09S2MfoBeg69
	8tBSuNTmeqWHiznYHjp8N9Ep4fhbyGnN+Wv0Ww3E6Ty7wAn3lLa6x8KklwcgaR6p7tMO3pQy91V
	UaXiuU5KyAb0ocjzIgTznHGFBDNDRYULRsGzmDgK+mEidsxhq0+y+/kAc4ZK8kojjkAlZrRNpif
	+7PWvUyD3aWOsNteRYeEYvoiyqajdYnqpM0MfUfg1gqm8OBaV5VG4IrRH8eQ0W8PKyRGlADh5J9
	i/TVe4fj2Puqvyp8oNBGRV1qFb52dgYzJfgi/bx+T0xBsUEQ==
X-Received: by 2002:a05:6102:5812:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6ec2b17b508mr1292414137.6.1780489763596;
        Wed, 03 Jun 2026 05:29:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5812:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6ec2b17b508mr1292387137.6.1780489763242;
        Wed, 03 Jun 2026 05:29:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c11csm620669e87.78.2026.06.03.05.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:29:22 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:29:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: MINETTE Alexandre <contact@alex-min.fr>
Cc: David Heidelberg <david@ixit.cz>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
Message-ID: <thj65jrvef3z3dmn5f52jplewrjgklomc5s32grktsjejs72sw@npk26yx2hpf7>
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
 <CAD++jLm=BxHsPJ4rgqwY8SvaefZUO+Pfv8E8xizqPsdJZw5weA@mail.gmail.com>
 <298550eb-1bdf-4d7c-8111-8b8f0b5dc056@app.fastmail.com>
 <4b797a3f-01c9-4b02-be98-7b82099c2e0e@ixit.cz>
 <48cfedcb-a9f5-402e-9973-f5c175fd2740@app.fastmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48cfedcb-a9f5-402e-9973-f5c175fd2740@app.fastmail.com>
X-Proofpoint-GUID: ltKHubQ2cCMR0ZMtkVxiYWOXI9xRjgDP
X-Proofpoint-ORIG-GUID: ltKHubQ2cCMR0ZMtkVxiYWOXI9xRjgDP
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a201e24 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=JV3oGrjsAGRtxPpt7K8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExOSBTYWx0ZWRfXwIFHdhW3TYor
 K1f6pl+zVrwk4H/GnJjIV1u9m4bvsmnBuIDYAACTf0lvALo7D3B8QUfZA1n3bicSAB1haW4+/Et
 QXId1vm2spKSO+hHP00TkbQ6BSMs/AF6T/UOPADw4AXgjAq3JQAuL8T5u0hgZnwsz1cEFmRvtvh
 v8Av7kvBsfFmWja+jYNrM7YP9WVzDxJuPLrPQb9xwlCs1pQvlK2AzCR69I/RxoFVy56iF7suwBV
 UKP+0fyXLDjD9m4oR9NE5ixcvshH6rfR4kWWGXZpllM7+8OghbkvcL2xMJs4UpXcPiK+r6fL+Ml
 tRbMT8JHvURMSo6w3egHrQM7GwcAFEdXChIbYSxHDoQwTDIkENGUdwwYB8sw0YNZFmw35idYx45
 wh9Rj7IwQAbw4EGAeBk7v8/bkmcAOIWFnnTOsGUtCvTX3IdITIjLP8CFMF5Vc0fFCEW3q7AtbXn
 SEtBRkvQxTCMbmuyvEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030119

On Wed, Jun 03, 2026 at 10:58:24AM +0200, MINETTE Alexandre wrote:
> Thanks David.
> 
> I initially considered adding a Fixes: tag, but I do not have a commit I
> can point to. This looks like a latent ordering issue in the
> Qualcomm pinctrl probe path and could have happened at any time until now. 
> 
> The failure became visible on APQ8064 boards such as this jflte, and I also
> have a report that the same change helps flo/deb, but I do not want to
> add a misleading Fixes tag as we don't really know which commit really triggered the race condition.

But there are no gpio-hogs on Nexus7/flo. 

> -- 
>   MINETTE Alexandre
>   contact@alex-min.fr
> 
> Mar 19 mai 2026, à 23:03, David Heidelberg a écrit :
> > On 19/05/2026 10:48, MINETTE Alexandre wrote:
> >> Thanks a lot Linus!
> >> 
> >> This patch is required for my Samsung Galaxy S4 GT-I9505 to boot but I also
> >> have confirmation from another contributor that the same pinctrl patch
> >> helped boot the ASUS Nexus 7 (2013), codenamed flo, which is also based
> >> on APQ8064.
> >> 
> >
> > Hello Alex,
> >
> > if what you wrote about asus-flo/deb is true, then this patch should have 
> > `Fixes: ` tag, as I remember it was booting with few limited patches ~5 years 
> > back then (only one serious was hack for proper clock bringup).
> >
> > David
> >
> > -- 
> > David Heidelberg

-- 
With best wishes
Dmitry
