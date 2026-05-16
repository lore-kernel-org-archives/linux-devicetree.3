Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8637474B
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778927658; cv=none; b=FhDVrjo7huas5jvy1bKLHfHIOEN5ON2GzkS+jTi7s3IddHm30GelqDcrc5p9H4IHUOaEyHUlfzfRnAB7tvsiC+SWqfltV79CaqWG7hMwD5dRwgB0M4kdagwDc3ynRZoGLE1nBY6MiTi25rTzbe9rIABWgzcu9KPS3vUpyiSuvm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778927658; c=relaxed/simple;
	bh=eEy+NNl+WsVSXDV9JJ7AihsAdhnLuMN3nivA8ZtMXog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNQwcTq5cW67DaFFYdHVqL0yXefU5Lgagut6lUz7fQFzy24lkNrI1ml1PFInt64Mog5DwlAZPV1pljE5avespZZPbOpkrx3BwgUMF9T4Q2rU3Ss4Eo3lme01ME7Gov3tc9Pm94+gUm6HqltHKbtkLUOMXb2pw2W0XA8rmwAxVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVeq8slY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bs+ZPPMX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVeq8slY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bs+ZPPMX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3grRJ3246442
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 10:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DKHHswqBUBxZlbbXiyxDnU5I
	5G4+BYbZHvJWJAxuCA8=; b=jVeq8slYRU80Jijc0nfMiALvIbmd8a53SXUuy9jb
	y90d8PQF904qQeNPnHM9L7X7VVeyEmF94c3BRCo2XmefLwKnQfyZqgH3pQ2nKe+J
	ZfyF7T78jbbV0xW1AvzJmTClQGfxYcSF12NMlUsfjiUxC5cqisSm71lkReDgZdF8
	p6MeeRpL6FNn+l//406EGVy4lOgq8bdISL/gzcTcZegwMO2twVTxPj0QM9I6K/+U
	o6rGTELqPdjdSl5c8ru7f3EN+rrOHlUtVhTIlD9wK8jMi+aFnTfott6gWO6VsH4v
	ACjGADFlRDFMLcMWu3zPy0ovF3FEZR4OBT7EJePmQQFMsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqrnpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 10:34:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf575af4so24116311cf.0
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778927656; x=1779532456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DKHHswqBUBxZlbbXiyxDnU5I5G4+BYbZHvJWJAxuCA8=;
        b=Bs+ZPPMXR6NAzKMhXMUoz84wT2sSv7mAF6ZM+bI4WNyHyYtP6XNftcCkTYINSwjvG/
         jaN67c76gxpmqhVgptJUOfATtACVwQ3BUfSKaAGqTPymxgIZCNyFQrh3i1JKfGiaMlG1
         aLMJMbrbMy09HnMlVn6NBDoX/xkEmWKanXNNKG2Z9A9nObn1Mpfxs3KWKOZrxnvW+qex
         rHrAmJiZOq0AgGa1wZsruhKgaWmYgKyorTTTCstCd5PiftWzomYlNQhmIBZY+6UCwthu
         RzB3KT9tXe3x4k0/m0GmzF6DttsyoCUH2x6m7mkg8bcbidsuCEWkjUAPTuhNF2OxxfC2
         fdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778927656; x=1779532456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKHHswqBUBxZlbbXiyxDnU5I5G4+BYbZHvJWJAxuCA8=;
        b=dHYNU1grR5mzjQ9SNmytEfjJgZwswAqmpkCPtVqDM9DjEgjbZjKFuhL+QMhlYxSNLO
         xXb1qFkNwgZAGbJ7aTRvt64KuOlHk4+fr67b8gVdUkmT791VKabP+evT5eksZOFtPvKM
         j6NlCLNDjr/Yb2dkdiANHqoOqn7wDpe2bYPEztjAgsiMs8Kv5EAmokc2W1xQR+HYaYfm
         XGlCCurGn/IERfxK4spwkyH0oOhmKCHl04lzkgQEhruCMvzhCga+ejwPlgi0FZk1983X
         B/RSObR6xCzAi5fxXKzJAr64u62nKx55Za/RzdSIXBJBAMDHXl28ZQqqaUFrdad5bPIQ
         R07w==
X-Forwarded-Encrypted: i=1; AFNElJ89PhbjGbOpN4J8Z7qn6i1L1lDKwzMjS3+FJHHLJ/HkheatG8WaTtUcR9o7O9d9iqMmm/dZUp44J0jo@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtXm2wbzo94f27/kO3K9RvosSzWdJQkL3II+Tc/beXu1RqdRx
	Mtt22SK24wFnZIHpfx1pu8eoK9GQv2+A8jyOg6AsYX0a8OxRXm4iY7+ljfOGAaC1mSTZitXNJCs
	cNFxLRTiCq/Rpwim++vl7eMuPn6B0z/Vi8Rf/mfm+0ucNTuEkjqNscrdBCNM2N9co
X-Gm-Gg: Acq92OF175duUZFrMP7XZz4dQHN8xO/MHnoL98aviVyCiiD058FE48fNwCgQyMl07i/
	o7u+U9TBBr3XiALFmgIXr+zaRniJ5LlLgMm2gMP1fD1oiCGoAIp7J9DqKV1IYnxlfkxejUrgU3I
	IZWEcFRZKXnl0k3ZpoeulhTh7jE2Mx5iD+G1QTA5BIf/vWJPVT/ppP29XohoQidFLYF1lbLciJW
	HcVkHt9mTgykv+1HF9Aj7Xj3TGV5xMJClcWk36uPB5kfuVUaC/a8grg9Fff8Os+rYIjaZJfMj6y
	6Ddd+jza5KXf4pyrMZZd98QG4lTXrPz97zB6B75KDFQDUPefbbW4LcbEeRzYj1EfI3spcmSnKHy
	4O6sLm8HecdXRtyuhbLKgjIDduSK16ZkEdhI=
X-Received: by 2002:ac8:7c4e:0:b0:50e:5cea:a519 with SMTP id d75a77b69052e-5165a002a69mr110961621cf.12.1778927655532;
        Sat, 16 May 2026 03:34:15 -0700 (PDT)
X-Received: by 2002:ac8:7c4e:0:b0:50e:5cea:a519 with SMTP id d75a77b69052e-5165a002a69mr110961291cf.12.1778927655030;
        Sat, 16 May 2026 03:34:15 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm35829915e9.13.2026.05.16.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:34:14 -0700 (PDT)
Date: Sat, 16 May 2026 13:34:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <if7u76ecucdpjff7v5a5nryb3oiyouofn4ldpu6dmfweg5tjmh@gxdvexjrazvh>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
 <20260516-vivacious-axolotl-of-attack-4e0ad7@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-vivacious-axolotl-of-attack-4e0ad7@quoll>
X-Proofpoint-GUID: kP5SNqmqKrRS3TUCtjClTC5HXYkEY4KG
X-Proofpoint-ORIG-GUID: kP5SNqmqKrRS3TUCtjClTC5HXYkEY4KG
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a084828 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yHGrZt24M5PB4BZqfSIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEwMyBTYWx0ZWRfX2dCT5Ttxbpyu
 7vgZEL+hRRP8yO6Kq+veiBH2HS+1rHRWIWKgFzMKhotI9EOck0IdmegKZiXbSybtjtCa9rGpYr8
 6BsXAoYAamGNtNQPtZvqxEixZ5YUGKaoPpvLet87FmM0+JJmO24tjRTNf8fIVGpf4oTOg3XB/FW
 qMoBTdIzVp21QRHbCL6rv1l9S28EPQ0YWHABpAwlL2IIMXaEH14+CdPDkFDZW2GNzb0OFHNkuP0
 UWVCDyeWDNsLQ5tQKy5nYvasabem5DF8giyhC4Q5s9TyO1nKmcJEIIicKrcodTkipj50dTvJH9I
 AdaPxYiVJlV+TWLo5dCvHILH++O1sj0uUiB49FMRwH3c2Q0WcjehWGEOhWgAa6A5yIe7w/E11AU
 vn4fBJ0dAqqAV7X6Bf5SOuntIpR9y0ygz+fuB9VD1FpCyTcI1WDxaNBniB8D9YLfON+YutVFAqf
 m8EQCt5KZTBYFcXcM/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160103

On 26-05-16 11:59:37, Krzysztof Kozlowski wrote:
> On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> > Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> > boards. Both boards are built from a base board paired with a SoM which
> > is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> > LPDDR, eMMC and UFS.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Heh, I noticed only after sending email - where is any user of that?
> 
> I expressed it many times - we do not take bindings without users.

Well, my intention for the DT patchset was to include the eliza-cqm-som.dtsi
and eliza-cqm-ek.dts as well, basically having the eliza-cqm-som.dtsi
include the eliza-cqs-som.dtsi and later on add the modem (and the rest
of the CQM) in there.

But then, I realized that I don't know exactly the differences between
CQM and CQS, specifically the SoM related ones.

So I decided to send without the CQM entirely.

Anyway, I'll respin this patch with CQM dropped.

Thanks for reviewing!
