Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A747426B
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427783; cv=none; b=hI9H0hxX8quuaRNEGZW1fRS96IsSQHww5X4KqXTSEnU7pJ3j+ddsNLJFFWlLJC2rxE72Zpg63DsazhlHkjKWdFxiiBqWzisF59ssXZATI1UsDUspPC9QDMw0dYgGr21rJyjr/QE4cfco/DJB7uDHrOJ+Ut/25UATqnw+4W2br70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427783; c=relaxed/simple;
	bh=LlrGf/HAdZjQrur/F/yW8951iC/lKHSR84KuXZ9FSrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVqfCUzLzm7Oj/N96TNQ0O3Wm6IgM4V3+6Vb09T0ft+IQMhFLigjjGiIkNftSlc9nODaKFxoqVjaCYnUF07SAIreSezZLBp9LNL0k22OfNWAHh1bt5GLcMAa2f3FFODBDUPplehSA4Z4C+4eqSmKXRCvRwnc54mIoeRljqygQ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuVyVAe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jW6hO7WU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuVyVAe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jW6hO7WU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683925MX3035733
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 09:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dWogIo6Es588eAen+x6LDEv1
	cTiGVBUYtYi7kGaI4Y8=; b=RuVyVAe1EySwhx/wJKo82dVcG0/wHfZT1igI3XNb
	/jjVKl6vVrLDGe75nAXTJt5TtSqzzo/RorE+xAeAPuYEyVbnfw3+EH1P0EWnj/at
	DQQJOgSl0RJ5XdAOLQr833Jm2ohXRbNpba6aGw0DzoCLQzcUDj4F+hDdSo7hZ9K5
	1uiseHYfMH477z7HXNEeHZ2Evbp5Hnzd5sdZszTYCqxtRd75By7YSwoAs94zsjQA
	35Wsu3EbV1Rg1BC8GbCHPvMtnGgPLwlUd5k+4wCg5Hd2OAesKY6BiOy+TXr/WX66
	f3tN/SBJr33nQFsIiXc67szx4WRiu4LgQJIeK0LAq7Yqtw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d108ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:29:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d8cdso476521185a.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427780; x=1789032580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dWogIo6Es588eAen+x6LDEv1cTiGVBUYtYi7kGaI4Y8=;
        b=jW6hO7WUaIRnwFUJWCOFQ9ZWm78wvAvjn8ICAzRpx6Ky/jusiDDMIe9IzfF0p1ste9
         zRUhLgx05MoFuAWgfZl6HLdhPag3PjVJcrCAxXbTO/dSafzk/845PjrgBYWErrdcZUhe
         gia6zSUfajSgVrE0uikQA4G0JYdYyWgVxRjPc2b63g05+BADeL+JnbqrYu7eiotwdcBr
         47HDKXqbx/V0MBDBpRqP5yJUv4SmBhVefil5BRNQaq93jT2YwUO2DBE3vIGHLnxvIZ3i
         tkEXN2LPhc1QjAsbOt1+Ui7gRHThWaYPQMTWnJpS1eo2DrXTManqsH8PZewmjTP5F8cc
         vqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427780; x=1789032580;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWogIo6Es588eAen+x6LDEv1cTiGVBUYtYi7kGaI4Y8=;
        b=PjebD2lGAee5+6wExXgtvuJDjvUwMW3obp2pTDQAtaCjrF4f6fpgfTsevCgw1+Z+/T
         RwpWaWhC0e0XzD0Rddw8bUA4I0F6K8ZuwffyV7wsQUhUwlnJKbvWDZaN3Nm8t2xoB3bM
         inm5/8RQZuLveSoG1uo7daVm5RaHfo3jtRC81lHVDwAot7SpR4SkPU1l9VkU2f+5zeXN
         /kRip5LBDE7Qf2JJl+Tbw/IejuZJGMB9yxP4MMzN+EHgfK5MRSh+V5xxIf6Fl9L6rZzI
         Yebhef5v7mTbIE5kVMYp31ezpfhvX8t2cCRD0ui+l+qO330XL0clZ5kAXYr3Ves8L7e2
         cS5A==
X-Forwarded-Encrypted: i=1; AKwUvBzxDf+FiasEzD8e2FA1u/vdr+wINx61HqW7uuY1Lu6eCZnuPzP7CsMm8NHqGLzlAI3HCBCZk0HX4yRk@vger.kernel.org
X-Gm-Message-State: AFuF++kiEF8fLV6H8Ng8o6NpLCACnvAbbSIsUObsCXfWrIbCgMdGqIz2
	Rmt/MF0tRK3nFRfZJ11XNFteRy6amS8/I5kd+NmGDXWLJT2lz4bYKI+JPBkUBS/S8p7NYt6KR25
	9YnGVs/qevZZwV+v8hQLuDbToOmBjkd56Mm6fUYTVWzUg8LYmSRCX35/0EI2LW+zc
X-Gm-Gg: AYBFou13SsP9sTw7wdDgOjhv/86yUuHLk1NCkMZIyftUIOKllMSXiyFaFx3qg/v5Dk7
	porCbRmK+luUMjkmKV1w5AlQcRI+Lh/hixiTQGDSXRU4urdfDu3SlD+Ug54QOK9QWZ596vUvcbe
	Oh4OI/recZCnPOZCDwzGCC5BjQBxVG0Ex27R70maC3KuwyVgCPRrm7LMWp491VIpfbDX9hGX8/g
	FjHk5PldVBeYytIFzqgbCv2DSttzBw01gl6h3pzOxuPVGVFGY7iTNct7pr1Dvok7ZsS9MszQSGK
	mQd6gcgN+1OPXHShxpOnESyevkjPaRgQVVoL0lIQIjv5JC2IARllP11cTq5WqlRycxS42V4NH3H
	Cb4CsJSohvQg46g==
X-Received: by 2002:a05:620a:f05:b0:936:eeab:307e with SMTP id af79cd13be357-93960cab3e7mr1278341185a.9.1788427779879;
        Thu, 03 Sep 2026 02:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:f05:b0:936:eeab:307e with SMTP id af79cd13be357-93960cab3e7mr1278309485a.9.1788427774738;
        Thu, 03 Sep 2026 02:29:34 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80020sm12822292f8f.10.2026.09.03.02.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:29:33 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:29:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset
 gpio as reserved
Message-ID: <vjgskn34g563t3hre3ypg7ocueywzt66o6zusohqnzetowfwik@nn6yaq25jono>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
 <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
 <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
 <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MSBTYWx0ZWRfX3b9AQzaFptXf
 8zokUot3MP0AdbmSplHk4JGZT5OH3azF15pUkU3LkVF29CL16gF8UMc/MxjDDNZBLAdpnm3+Ger
 WKHMlF5cCHKGXzGv5UW3oQlUVvAxe0maEsIhre74hUs5DnbJXeHoJi1qkZSs3zXbMv5o9QFS21O
 47PCwHf/sxRveOaVeo0TR+WYziDTkV8/GeZKoWrAsmYy4beHpWTYi6dC25jGwltUTSV2yimobRm
 ZiqepH5sWuTRh8ZqTOkR83hElXBVtyqT58Fi0DmOne5qhUWTIKwA477dZzd4qBgHHkrqndRmBpH
 sxuE4+1vioUJqcpEH/0G6X4HWNOU1smz2upbPu82XaYCvU2UClBcL3HjTkpUmku9AvQW7WL1TZ/
 SaTJCoVXS/FJ4cmERjyYM0c56kRohANoOZQNNyIPBskvqZgMsw4pysY1ztFHq3tqn1iO2Pw3lDh
 VFjhQXMe665sd589sug==
X-Proofpoint-ORIG-GUID: _nx4iecF9pxysRFIPYwkFov0unmijAKr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MSBTYWx0ZWRfX8lyvjuq2aHlf
 2YettdXaFkQDPgxSHNW2kXq54zTAQ5IlhxKUG3J6/OJA34gBV5uRVyCRGCFk8xbXMAdV7IelP0V
 XYR8sgTCN1Z0sOO0huoruEDNGnKB7PY=
X-Proofpoint-GUID: _nx4iecF9pxysRFIPYwkFov0unmijAKr
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a993e04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Kre0GHG-jOPd8bR4PBcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030081

On 26-09-03 11:16:20, Konrad Dybcio wrote:
> On 9/3/26 10:34 AM, Abel Vesa wrote:
> > On 26-09-02 17:53:23, Konrad Dybcio wrote:
> >> On 9/1/26 10:06 AM, Abel Vesa wrote:
> >>> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> >>>
> >>> On some devices, toggling the embedded controller reset line makes the
> >>> device not power up at all, unless the battery is unplugged.
> >>
> >> Have you confirmed that behavior on the CRD?
> > 
> > Toggling it does nothing observable.
> > 
> > However, the documentation says this GPIO is actually tied to EC reset.
> > 
> > I still think we should reserve it, just to be safe.
> > 
> > What do you think?
> 
> I believe that contradicts the reasoning you gave in the commit
> message then..

Yep, will rephrase it for this platform as:

While toggling it from linux doesn't seem to have any observable impact,
since documentation does confrm it is connected to EC reset, lets reserve
it just to be on the safe side.
