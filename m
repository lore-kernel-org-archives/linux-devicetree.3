Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7D5231827
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782652829; cv=none; b=LSdzE/24JmDHRxauznj8gbsGs9YwxGMMA6pnxMoM+TB+TtQYtbAyDEDWX13+NCqjzQD2GA08jVCOmtjbmwrsh5/IxsBLDYRnbu3TUf8z435C1fX1vjUsNBmJ/G9HIXw6MlgpbR3WYrEGCoq1Tz6Q0HJmjWEruJ6u5UHmGTKEDaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782652829; c=relaxed/simple;
	bh=HQPj3lAr7VRimSV0ZnUtiZM+wwDMa19qQgGoRxNTZak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szf2iO0lBxsVkgmAp119891jxh3GXSI2kQ57EyVcpI5zPC9HeMGp1FuTpeRVIxXY42KpLJEziGjOiufSNQLGnL6tYf0JkN+HUy/f1snT2VO5FCYrR7ebdU9sRTo/gwWR0MMtvH36x7qFNJcEgGt66yK3XiUDxlNf2q3F72HP6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFuXMWf/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8wdXzdL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFuXMWf/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8wdXzdL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9Q4OS3596853
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XIB7VmI+QpvTPuJKyvcnI2uq
	X/bF7EqWmyx4TGRyCNY=; b=OFuXMWf/ijkaU9K91CQ+bCV/zfdkCQIbqXEQlS/n
	qoVpyr0HzLWutcu3uBvnjySDpPwSJ8b/4ihaB4KlLoCsEGcL1JIiWOMx9CcbqoZE
	YpitCWFWORfXjF5H1Lbg2/fRZaWodjAZJ3LjDx5TJCQx9QIU9jI8UOrxupNdawRP
	64rEwjOPo5U5teD7h/cjhLYaK58Tu5B9GmcgLaoo9mxu4/m0UzUTDKiV0gtZ5kpQ
	k4GegimTT/idwhjiP/CB8WaLZts6SbdPBBCtPBIXYKQa1E5Vt/0V5H2FuPCegFH2
	UhzMsHQQ+cF4+CId7GVhLj/JcJl5dkpFGcu5aV57Ix+wwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734ay2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:20:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so182128585a.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 06:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782652827; x=1783257627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XIB7VmI+QpvTPuJKyvcnI2uqX/bF7EqWmyx4TGRyCNY=;
        b=V8wdXzdL6ldpcg4Ht5G9zaWko73RnSwIIzzW4d+VLeWzzuxSpPHzciOmYYcPP87YLH
         E+eXIuq4KMQy1KlTx8XUcVcVo0LSvqCNVpSdsw48wrnMVP4+yYO4QxW0DIRP3VAVxPCU
         PmtZs1wn92//7x0UjyjJG6f1ODTuADmGwoOxlVUgSUnpujCD0dLLGdnROcLGHQj6icwA
         o9yIosvuXJ+k9jXBX2lrWkS1nGW1i3dbLd0EQfMByrE+osWNgzBg6yP5aZibU9yhgOSf
         oujK4AUOebB2oe5+gH/82WvxYTqOrvhIk44zHmVqPiwAm7etkcqEBHNtLSsDqnGLMkBF
         CdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782652827; x=1783257627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIB7VmI+QpvTPuJKyvcnI2uqX/bF7EqWmyx4TGRyCNY=;
        b=HoLEiw3p8jnXPOZUKrgmF9smAAmo8RxMkZxDAjNqtQeGkHy2xtWMr7QQOAS2ZJQA6V
         KFSnL/WB0i4POkppfK5WXOidTsS51QVVTLl7EgESO6pb7daw4I1OFQhaeTQR+1ZRYQ4B
         XgVYXymiRAURCtc/wRBMLrHKkRIhsJQMJDXeoeMnyE0yeVdUDq02IvciM2wtxaofGjKE
         DIpgvFkRJAGZcwT6R1/p4X92U4grHxM3mbJGLLF9Bm4oIZEu0OeiUl+/y8dPAJp7thtm
         MvEVCXHOj3eQE9JwVC6qQqWrzsWHDx5TH7VfpO2X0g/BCNpqKv3wbJxa2TIrwLa3JItk
         Zn8g==
X-Forwarded-Encrypted: i=1; AFNElJ+h2dPTjlDz7iwr7Uzlo0qwDYxUwJMT0S04AQE+RFJeYWIdn3AbMRB1I/QIktH3CZS0pI0gbU0DpMLu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2yT5YQ84BJVELIs98TqQsBoqU3tdyr/hf+nNrpkvhPVWZD1EF
	JSSGWAg42FfCq1L0iAOFdnvU6XA81y5Bjh9YdkAhvm0wsHOaB4dcz9SrnnNPTv+UMG4Z5KX36nt
	f/A862mKeLbuwwR06YgnQ/F4V4/2h1ZV4KUbspJpxeJb6bZ4mqI9Nbq3iaj9gyBh/
X-Gm-Gg: AfdE7ckvhgsJJW4GhuPmB5kIPSOxunLmk/7agVlx6sjPwe7RRjZoQ9ntPiYoUkdXQiv
	kXmItrwrmJC0A2VfelNMRTtux7UdAi+DSTOQegkh/n/rjyfMFiDzYkFlUE2jBBQXfLE49VFtE/Y
	tAm3dIMBGZr6/jvN8wyDH8+9usJrg+wty3vUq3etiWNaoBufN4fQJEq7GAxuy0/ANZ32oiuNKzF
	BnoPglRDq7/j0VNm09In5FTu3T9QoRWZv80kuDNDMk3m+t6ijaOBcuM5yqzr1zzI9n0bmsxpkuw
	QAnTVsQxmcH2Cn8ar0I3M6KNhy3aqpxGQiobtXGJzsgAF61pJxmNZwubW5rgOB0iaFMXJqwLDHS
	XkBF9zyHNfyv+BxH5CCuMvLko8oKuQ5OFFPpQpAM+tLeFrgOkcsnqsF1Ta/+Sk3deqZv36+tHaL
	F47w2Ie0O1QhMjpoOga7TSjHXU
X-Received: by 2002:a05:620a:29ca:b0:910:21d2:242d with SMTP id af79cd13be357-9293d4b2e4dmr1992724185a.57.1782652826771;
        Sun, 28 Jun 2026 06:20:26 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:910:21d2:242d with SMTP id af79cd13be357-9293d4b2e4dmr1992721185a.57.1782652826362;
        Sun, 28 Jun 2026 06:20:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6955108dsm5020178e87.23.2026.06.28.06.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:20:24 -0700 (PDT)
Date: Sun, 28 Jun 2026 16:20:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
Message-ID: <obf2iw3wq6xuvftkkwf4wa47i4y7q2apoaa5a5vvprrcqphawo@gr2snc33hnph>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
 <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
 <fcb6579a-4e5e-47ef-b9a5-009dd761e4de@oss.qualcomm.com>
 <akCIGtSZO-FW1EEo@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akCIGtSZO-FW1EEo@baldur>
X-Proofpoint-GUID: Km8-j2iBZppyFiUZJ564cdiVxBdOi97O
X-Proofpoint-ORIG-GUID: Km8-j2iBZppyFiUZJ564cdiVxBdOi97O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExNyBTYWx0ZWRfXwyiGpbEd7O+8
 ASNfQj3C6CoGEiQFIWmrrRWLcsxcnD5Zn0k7Mizx4bKRxA12RoAaH2YaTrcv3TqEuu13O3r7rRm
 TQNBZwzaOUQh67DB7pZ78odEDYu1+Fw=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a411f9b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ZhBxFOkNiJ_u52B85-4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExNyBTYWx0ZWRfX3+Bg+/PJulZD
 aExu3AtuxQX2xUIcMKmPqrPZsNmne3/Re7jibdS10o7zbjJeLR+9K1KtpXhjrZrwZR9bpIKqmfF
 yGTMx5Ep1R+cC41XBD96q8FJ9AoGLndnOjw2L+tqnRH5CsA/++CvkXqz+Paw6qdi6zLxg7dukXv
 QoFbtUuzOjtP2KObYuTWX1OHfSV67tXdGXnrMr4nnHQe8pnDlmd0+7BC48twlR2Zp66hZNhhywg
 Pnyk9ziZAJ3MeB9h5m0zcPfL0eVgYH6AlMT8ZW+jk8NqOrhz4mh4RkU5DUHA2/P94iPTxcuFPrs
 yFKu/NltoTKsP/4mJcVN1EiCMANfxL+9f1RBXwqgmDK1uT27ztBETO+zPQHBDUcGNSImw73ChAj
 HwprPX+ckljDeRDq7fLGmypio8Cfvvr9AuQcug5WyIV2/NxbsKqEn1KTssnltao/VQM1GREz33t
 OSmKv9nBf9Fz9sVnWLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280117

On Sat, Jun 27, 2026 at 09:41:38PM -0500, Bjorn Andersson wrote:
> On Tue, Jun 23, 2026 at 09:06:51AM +0200, Konrad Dybcio wrote:
> > On 6/23/26 3:31 AM, Bjorn Andersson wrote:
> > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > 
> > > UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> > > Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> > > the other typical Glymur platform capabilities.
> > > 
> > > The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> > > OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > > +&tlmm {
> > > +	gpio-reserved-ranges = <4 4>, /* EC Secure */
> > > +			       <10 2>, /* OOB UART */
> > > +			       <44 4>, /* TPM */
> > > +			       <90 2>; /* TPM */
> > 
> > Is there no EC reset pin? I wouldn't want others to have to open up
> > a laptop after trying to find out what it does..

:-)

> > 
> 
> These are the ones needed to allow the thing to boot, I don't know what
> the EC reset pin does, but I guess we can add some more for convenience.
> 
> [..]
> > > +&uart21 {
> > > +	status = "disabled";
> > 
> > hm?
> > 
> 
> The debug-uart is left enabled in glymur.dtsi. Perhaps we should change
> that instead?

I think that would match other platforms. But, is it actually not wired
up? No debug connector or TPs?

-- 
With best wishes
Dmitry
