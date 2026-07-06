Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732EC42643D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362260; cv=none; b=Wo2lwtH/HRs+Ch9UHiCCP/bE3zrMQo22d8aLc424+q+fVtTOqhAleyA2gGHxZ4oDj+4S9xM21YNZzbH1ElP+SsWZbTOdWREa7IgBrxCLePWNfUyVSEdSvZaaPwbLIzKnxcbYR966oVl/RsJ0/S4ynajWcEyPJjuYS7Pc0Ask6qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362260; c=relaxed/simple;
	bh=kwPsWx3Lq+eORWtb/AZEuOV9MdYDT8Y8hkryWQSeGT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4Uh1UbVvW5qCahl/qTK6PMz9UOeek5hrEeXIJryBjCd8oszTJzlUhbo51zdzMjFrpEHeU1b6fhyUDe/8NBDxjTeeZ6OvqM5lLWXHnk2ej7Uf2Xg/Z+jhitax7+mMznMuUqG/ecGjqD50WTG3cwFRG0EIrtFQD/6z3DZ9gmygqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNUbb/Ge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csgX6myC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNUbb/Ge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csgX6myC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FsYYF1050282
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 18:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CcQRmc9BaCEAXdMMGYGlgduG
	dM0vGlhEkoGbgTNTQWU=; b=lNUbb/Ge+fiE6E3fUcv7Jw/FULk4oxkk1wkh3+Y1
	x/hKGfAgM3xzauwD1uGAU/9DjVbFIiTfu3EWo3Be3AtHEolg/IHDqmaEgMs/uO8z
	iSre4KhCH2Qyid8gtY7vz03VaPnXx4bUE4D4R8O2eWwsCfYdKJsYdv9MlzgM/YH7
	2/hFtwwscC4i/YOY6YuG6SrFlgFKOCCKALBi8TJwWjw1ViYpsqUv8u6FI5evO14v
	THkT6gWhTBU/oSiLH63A2g7h27vvFgZgUavkK30JEPuyfzwGJGIQn5cFZnp45Gqo
	4WOZLDOfUc1Df9rZpa4NJReR7OULlo06wc2b1/IvFQs4xw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw0ppp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:24:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdf87be987so528033e0c.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783362258; x=1783967058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcQRmc9BaCEAXdMMGYGlgduGdM0vGlhEkoGbgTNTQWU=;
        b=csgX6myCVkRzewoSH3m5Gd4t05UAxatc4YL0uzRTLXyAPNA5a+NTVrsbxSfjQxdue4
         Jd1fIqDdn/76nqOVxn1yoR7f9OGKngm0QhSvyyqaSPhvxSqqPxJsVqvkTn+FmCEHuwXh
         M0Q2zXXgqdlWzuSiUcSnwLElYQGjnyK6s2eTwr/LbckSJHrCJ4HSf6lAfVb2s8CLgujr
         vMoINer4jNqWMZOunMHGuEb8QGE7hI6Irh4iV1RHCvCVqrK0R+JS2GBSRuoYQGf7vdJY
         lT64V70d+2AyI+RzH8dLQ+3hM/jimdH1BaPZVSwgis99WuTswwF138lHkN+EaVuWYDwS
         3kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362258; x=1783967058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcQRmc9BaCEAXdMMGYGlgduGdM0vGlhEkoGbgTNTQWU=;
        b=jyxIY8+5V6jgmaKrk97+QOGUxVwtUX9V1fckdiy/wnICVu4gLPPr58Tymez2cgo7BC
         OyiHtdkUwtAQso0ICEvW9b5eecb/WmujSFvswiS/IcYwIylx3Asb0uXBEhOtAMeV4Wib
         9QcgkZzgEtAjBiM+nESzvuEouV88HNBnrZV15cEWia2q/Z46SMqQJPJ+q0X+qpu7T97+
         q0laLWZwzTmhFK8te3KBEmyKD3nKwd4bdblPXawXakTe+oanImAUPVEkDMG3Yc8XPAkx
         PpAf4aIx7hjRELYJQKDZek1JHozQfqsHxB5FjdUPSvuqApQ/t2a1Qtm49ii6ZMQlpojn
         MMqw==
X-Forwarded-Encrypted: i=1; AHgh+RooPMseyL/y4+jtnAwMXwpbPRDqM+aqOBZysS6Wa6LnlzalquGvRLRWTsxrpjADI862wD5FrzKH11Fe@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPG2eyNnVRyGR694hcBHEAF6cjF1+D5a1A5vYZ9B9DXVfInq/
	QKRw1Ro1O0VUWcamCFO9joHJ8I9BB5mobBascSUK/33BbjFsdj8TXhNqXuSv1p8af6Vu4kLTfNe
	FBcWe70bdeSNMBZEberbIO6LE7IWXctURFVMXSnyJBNxlqLI8WUtn8TbbvSkTsHSZ
X-Gm-Gg: AfdE7cnQhyCAToUIq1LSZ0P/gf56N1flbKOQ9NUmRlVMxjaFwXNtgRDP/F/opxzoaY/
	T09+sonOtjegOLfp7BMLg4EKKikHQRcSODvCyOn/+A7j+3Qn++ccJ0eHoj/faiyhfQSlsuaaj+a
	b1ReAAOf0952cThTLgRbzbCW7Un3ylg+ext5AsVB0rGdsgpVqn+tplJ2QTGx3IVy5o/k01LWfcz
	iLfv0gUsh+MzZ5t1c8YF/Sby9Qk7jkcN6kTwQTN3bYjRzWXstcmEiOr31Nyh0KqBBVySoKxZFAI
	g7g59zcBCpUnXh6Av40OtEYUwo2LAvx4SqCZSJ9cYqGqrNAzTZ+fhvFynwYaw3fyl2+xmG3umzs
	y+ot+acKyt/xPxxB+nHFY0LOZnYFWDB+S7Lr9gNDGIqarPDF9qREKMC/QDxnpBPvfWQowvgMLmV
	9qDUUVRysbiiK3XAZU0WedhyVr
X-Received: by 2002:a05:6122:659a:b0:5bc:3dde:3364 with SMTP id 71dfb90a1353d-5be907c4ee5mr1028197e0c.7.1783362257726;
        Mon, 06 Jul 2026 11:24:17 -0700 (PDT)
X-Received: by 2002:a05:6122:659a:b0:5bc:3dde:3364 with SMTP id 71dfb90a1353d-5be907c4ee5mr1028192e0c.7.1783362257235;
        Mon, 06 Jul 2026 11:24:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb768sm3082495e87.52.2026.07.06.11.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:24:14 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:24:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
Message-ID: <4g6y4q2udludhwmoqc34afwj5svra4a4j5bmpqza7h3av2oov7@6k5r7a4meruk>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfXwmJfTn4HnoRO
 94L1eJoNie0JlR+i7IaKQq6ZFHLD5xBPIu3nNUFV1Mv+XPSrtNLHu0MP8gOCXQRJqYg01RzTsLf
 twH9aAYfNgvdFlhEq7nUmyzEaR094lM=
X-Proofpoint-ORIG-GUID: yD8hwXCxJJwD269k2joFdBqnNOTLc9qN
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4bf2d2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NjmyTZ_Ky2fEOGBI-xMA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX5QtaFyam0kZx
 xh7AnhNGMIp/Rg2G49GF0YX1vej/+PFwKnnqOq0e0JDyo6I0o3GNgQF5KFFWRIKDk65J/cJOYVr
 ULSAjzR3JPpeayBCKIl99PezjmfVNPGfEB47n2Y/kmAgSUZaSPisiuI6RXo2g/sPZKf8JHsbW3f
 UjPUVoDuvGKW3V6oOSTe8zjGqhWDglqdolVJ67tTSjShtklew3jTXsvUD6ewWP39tzbtcKjfDsH
 2ssiD+qOi2kZiI18rtmRXUqGkfwfE3ylcIi3hRcFwojlmsFchIBnpTFCHItxqpTpvG7UHFgjjIB
 J0xXUcIjq4t8dWeEfvDasK1/t+sDgqEj+cu+n8fGiKUgbvuCMVqt/9Qsf7J6cgTEclEXgW+wk7+
 5hoTvxbPyNAJiztmzcnJvfJ0WxdV+ROvaM8oyAnPSQr3Koe/Hx1nDGbifLsKK+fG32jtvBFdL8W
 1uzcMzNWGpbJdT461CQ==
X-Proofpoint-GUID: yD8hwXCxJJwD269k2joFdBqnNOTLc9qN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060185

On Wed, Jun 24, 2026 at 01:26:06PM +0000, Esteban Urrutia wrote:
> 
> 
> On 6/23/26 7:03 AM, Konrad Dybcio wrote:
> >> This is mentioned in the memory map description, but is not part
> >> of it.
> >>
> >> I booted up a 8450 HDK and it doesn't even have MTE, so it's
> >> probably valid
> > 
> > i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
> > trapping it.
> Then, should device trees delete these memory regions on a case-by-case
> basis, or be left as is?

Please verify that you can actually access those areas (boot with
memtest=1)


-- 
With best wishes
Dmitry
