Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5A39A070
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 22:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782945061; cv=none; b=VOr4zTS5LS3hzluHvAyZ1MxXiZmxzGkHCjusDEYCdodv9bmicKTBQ5jvUhdya2XjoptlZRMPcFzLV5TmIVzXcpxvFeIShrVn9e1XkribcnbeXKLtWir2snn3w4YwiRRHEufR1X7F5DlwrFue67npeSEHf8muwo4sUAav5PMcLdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782945061; c=relaxed/simple;
	bh=Vmnh47otpA4PBJIXUmSz/7RDAie5lV8O9Npi3AhWaNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFAPM+ctZ8xIhrSz/exK+T2iQwTxccb/R4TyxZOUNENPuKShc8tzc+BSFylHLKuzSY2zEmYeefuyc2WJhvf/o1RtV8bsq4aVZaQo9QnkZL0apLgLTpk2sYNgAAKWXqPJDsXZ3Rp3rGdpR1EYoqslhoitu2AJSFcWV/ZT4TQn+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTwi7D/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+jXhuxS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTwi7D/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+jXhuxS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661LhbK42491067
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 22:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mRHu46H+L/pZVnmmXprEV1Kp
	VTSEZ4SeeP6kf2PnGMQ=; b=BTwi7D/cmFTbQy5GvWCK205Z2zfRf7YlNldmRSBV
	TskY//GOnIwfX6KTZQ9lgJC0Z4rrKWLRKANdfrHRI8aryNkY2qlAkxcdJ1LD712q
	xSRHP3tiQxg9LIdnN5/VIDZMhA+amVwmjBCZy0PDECVYh0Z+6ddK5gy/lhKjB64/
	0+JfFEKSUlSAWSeMPqpa13vMNG4Y/npgBN9TLD+RgTilqeDyFCGxPhkRx1I1ZH53
	vLRr75kgcsqsF2bOorNWgh6LgvDVpLVRK2zedNa+ClrLi3IdauaboP9UzxY5akR5
	5LMAB1up+2Us/m7iEvJj38lj/tg8iBI4AjH3WNRQoMB27A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd2xt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 22:30:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9693c6fe1e6so909334241.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 15:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782945058; x=1783549858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mRHu46H+L/pZVnmmXprEV1KpVTSEZ4SeeP6kf2PnGMQ=;
        b=X+jXhuxSYvP1kZD3ap10ae0MqLDGFo9/uYUnPp7X5hxBBP4G/3pkWYdv6GwbAqggjJ
         BhV0dfvw3e0/TtaqpuhJOZkMvgxYoxQiMQXl61hrfAl0HzxatPIwIuMAEzYj9ZI7OlyT
         Uq21hRyTRlLyhJoJh72GpcJ5dHKC4cqpwIeRr8OmySd1J0Wq/6oDeFDX4MVwNO3UCFoD
         odNqPUVXejvhyWcE/1/mU5YgTm68QmI7X9Add9KZYfC54D1TwRUNBNTATZBDaUCgffjb
         xDIACWRaaTEiU7Wcsa3aisgzWdYys3/+j7uzaxHr8H59StTzlQJsKXkbHrpIlBv1bfsP
         pj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782945058; x=1783549858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRHu46H+L/pZVnmmXprEV1KpVTSEZ4SeeP6kf2PnGMQ=;
        b=ToIDdZkkpqz/OCDux6rGWAUsoLhc4Y30/seFghVO0wzX24usBCDoS4M2J6BxnkvqT8
         4QMN1i59Q0Z2443znjcKQ/g1VV81FqA/1g2j3Eg8st8Kjn6IAqLaw1f+Ui7cO8wVfX33
         pSD91x5u7FfUSOu+2qpcQKeckHYx7IE44O4WUOQfDuA5w+racqZBDtKSx0wjWveWFrW3
         PnO5aujcOSDDF1vJHTbVbIAWB9L2UzOMHXAZYooS0VkHUhCwk71U0nVlvTxahlTuLVcE
         xli7rfk6jagz3WMtOwlk5Gw7lVUiqIGyjEV6YQhdbFil4Pl8qS1OdUURTLAZhjZDIFH5
         N4AA==
X-Forwarded-Encrypted: i=1; AHgh+RqE+lPCzC2WLPynKXu5bHyz+Fl5dXFDhBnV9LlwhNSX1ZMJJ/ZHXgXyqBq8AcrMRNmW1MTGHC8xI25C@vger.kernel.org
X-Gm-Message-State: AOJu0YyXerywi8om9nWPfILcEXH6zErkIsXoQgHLDiHlQLYcj0LGnFst
	2eLv12LZw7CjxgWlNMRX0fd1Jsv9ra1nAazxgLcB+3dVF8zsC+cbjxUyO4HjFeczsNAKkjl5UPD
	9Lc1+igNU//2HPZIbWL2Zyrf/H1HGoPBnMiGtblsm/wouviqK5wtjjhj7/sL0dEn4
X-Gm-Gg: AfdE7cnBlQvNRK/rBYtw+RMtqCQU6+C9B/p9s1274gdXuM1FplISVtbuyg606UWxUuW
	pnhFcSKd1zYUJfxgUg4jd3VW60QAgOmi5aGt41nt3GtLkeh1Mwa91JbR2giWkF+HXfWlx7vn1p1
	HH51g3dtyzGVODMFjAKdqHxYqXJnjIBQ4k1zVxK1ITl95ERmks4jLt442O7jON2pWwUOwTKDOdi
	S1e7q11NGUwPKJ2wvtQypL8oitKrs0J67jNfaqXxMm69TC+UoYDj/U8CLFt0PkmBgddMVN7Yh8c
	GRCbl3Wm+lWjNMAuwzSCXP9C0mq+TO+nUoyRMjYJMKhhL2+EoukAsLEvPZ1VE5c6uo6DP2d4qGb
	+3ND9R05/3ReITicb7mn20Hu9UF5blNEauOU+5oWr+Ve/T5jaswyKdwk6UqHv6oC7QU3IE9CWQl
	tJkydUU6tvlfxdT0idS3zm5rIT
X-Received: by 2002:a05:6102:2c0d:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-73dbd5fca0bmr1485707137.4.1782945058600;
        Wed, 01 Jul 2026 15:30:58 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0d:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-73dbd5fca0bmr1485665137.4.1782945057461;
        Wed, 01 Jul 2026 15:30:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89eae45sm274731e87.84.2026.07.01.15.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 15:30:55 -0700 (PDT)
Date: Thu, 2 Jul 2026 01:30:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/3] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
Message-ID: <ujd5oxvjmapkyz2rbl2ogs7m2tvj3lezp5oaeyovcqqp4gdwab@52pri5c4j4ti>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260701163115.3701298-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701163115.3701298-3-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a459523 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RsXTvpzNeT9CGwFVSHAA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: QCI7_NiTfZzAXZVPSyxfV9Muj1Vl5-BG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDI0MSBTYWx0ZWRfX7s+h0pRGMYr1
 Xv124GH/h5uQM4Fpjxd53xnragQ/yc2XHxwFXtpU4GT5aCcj9rwRpo7gnc2Orx2P4fdB56eAZrG
 A8eM65kwSbff604ow0c/DsNg9ejmp7A=
X-Proofpoint-GUID: QCI7_NiTfZzAXZVPSyxfV9Muj1Vl5-BG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDI0MSBTYWx0ZWRfX2Pe5pBJ9QrW7
 tDbx1Ab50vNEqYjHFjQHe2bvcGTDo7EqMUxpyJkgyi+mMtBM0FXMeCk8oJgBlddygjrQd6fnEhL
 OyXmjbPKTk2Aw6V7+EzHx+vQMlhPpkE2hYT41D/DNH4PY4DkdmA4nQDG3RI3X+BpLLq0JokFF4r
 A4W7Ah88Q7gKoCZTXh3MYiUKtFCffYcFAvnTjl73STJPnjftU3kU+WMJQqa1iNER+fyqk5KhOv0
 SSNzF6UhvpNtJPDy9Xx2IlA72IQ2qycWJKyGU+b+6zjOgUB7S2lJqEIBlCFC8Ft+QJmwCp7xOh4
 DMM8t0y8m9oe8AoyfBqtDH6x5yQkzR6OXAEUGV4JPzs7nYSkOb/oOu9HyxXHRji/JNzYh+xVzmg
 VRHiXKWmkhVPpmhvrVgjEFpP7VWYXtqUPyggDnm8khs+nTgU8NZT9GMnTCf1nYxKp1zem0SDZzN
 1jxHOxt1JEhl9xWoMGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010241

On Wed, Jul 01, 2026 at 05:31:14PM +0100, Srinivas Kandagatla wrote:
> Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur
> for proper sound support.
> 
> Also add GPR (Generic Pack router) node along with APM (Audio Process
> Manager) and PRM (Proxy resource Manager) audio services.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Should be the last tag.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 263 +++++++++++++++++++++++++++
>  1 file changed, 263 insertions(+)
> 

-- 
With best wishes
Dmitry
