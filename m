Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665264;
	b=szmL6Prm86JC3V5XyZm9REd9TraP2kABIobn7jBkaLBcuuvR7nuh02X0CZuM04cwSFDN
	 RdZG35+J1tCgVL6XUuhbf7gvTmxmbpuGmOGeCA0ODHANGn66p2nSvxnczbEA+QM97GQK0
	 4kA6nJ5q4zP3PtrCBuZdmtrP+ZTBn7/jpjSP/owfpowexhQaR0gWuh6wkM8EA4dDhNHsr
	 Ne7NVO5bWvViwZeoK4nmhNFHpo/sqJ+iQv4M+wtjJzLDmKq2smscn3AN/BYpDHxKxq3je
	 iPP1nv6bRgadLikp2zn0wUWitkbBJWGqz/D5iS/biH3otmMgayID5U+9MBEZtBXAnPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tuRL21Mz7vx7Caeva9OhHL4q0LwXFbBiNe+JziOrgzQ=;
	b=kx2OHQT3KBGSVShK1fqRW+Y8tdjwQRM+8YRq4yBt5AbauqYe8XQY+cFwix7nrvVB6zll
	 Gsg7AjoQJ/oWWAxIrEue1sJUXYcHqj2QjLpo1w+aDb7Cp9eqDpvgOmXYOKb/DD7MZujOQ
	 uo58WwvOcrPjDePSbZCAu7uvNezmzZgvH1RjLOozWo3vO1yHSpTmfK82e69MVVwYDIqR5
	 skwoCKLqFi6jsd7EldF6i1SUXF0OZJMRvAd0vbr5rRndVY2ZDm0775uDTgLAv6w9edBe9
	 OyY8CELNbwIF2f5vtqGv72g3grkcydux8LlBEONIpF36USWzeJ/T89A5zFhYBnzEpRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJyd3pRT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="a1h/d/fn";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1B0606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1B0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJyd3pRT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a1h/d/fn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0YUh3923257
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tuRL21Mz7vx7Caeva9OhHL4q
	0LwXFbBiNe+JziOrgzQ=; b=kJyd3pRTh6yzgD/CCAOI09SdT8zc7h2QRltA8RfD
	JSvIxeeB7bDIxaSj8OiKbzb/zZ9Hyj4+1uQirrMyFYD8n8dApAmPepP6SkjV0WUM
	mbPlAstvexd/bHx61ldrH49RPvOieLjD0HMll2rhGxFDBxa4t7a+5gxlbCbjxe//
	bKMoZuw3Aa2aL74jsxd0gyDFmE3NIJqJ3/hGX5pzAIBilHX3mDo5GwVeIJ+TqEKd
	w378gGs/KyRu/24pw7+nYxocy2dhWuGINEjmcJrci5Yhr+7QGvIPio8K42ivHzDs
	4KwDvODGxPbW4nblBvnEr8+U+LBb5SmwNhqJJ1F50utC3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bj21x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso320240685a.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665262; x=1793270062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tuRL21Mz7vx7Caeva9OhHL4q0LwXFbBiNe+JziOrgzQ=;
        b=a1h/d/fn2xo9X3TP3HP2JPLu54P2NW5OgG/MfqdFbPTGO7grhMPMRSrz5ZerTgvGF5
         qBSoxsc/ppWMbhYfXhmwb/bm5gJvDNIXaktOWvHQ0CH9LLUXJcwKJwzxI9hmL9uYEDuv
         eyF0iO6AxEylz5gkRIyAyCIQV0NxYQLfPgJBdO91ib5nSNZzho6GYs8cLAS1QkdCdi8S
         jSYL/jMT1ceiz16/mM0HrvS4HzbclHS20RrodEwaxOn5Y3hZYnser4+Osz9PekG7IMn1
         T7yP7APKropBYssc2bYeNiXTyPo2dpK9dF5/gTUx28KhMi3prDjWPMbb0lod7smeImgo
         e22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665262; x=1793270062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuRL21Mz7vx7Caeva9OhHL4q0LwXFbBiNe+JziOrgzQ=;
        b=eHvNhzUcO9EbhILIoEANRs+eX+tvC00ZSsYCeFqNhFoxLuncgEilsHON8jar2+iXt4
         yftXKeyl7duIeuaWJx+WTzgzQ9xwGIO23B0fqwa7HADBnXSogsjED1ew+U4knij+ygXL
         DbeBZeLhL0+potmXaUHUL1TYQ2dhN1BaC3jwFc73ORMFy/OA05CHYEbWkjxsnMn6oRtj
         k4DnCStgzP1A4L70CmSE9ADrpjnvGfdcr81eUPFeFf7uPrpM65KiusB62EUVb7PRHdCa
         XHeFb5Q7IYEnSdqWWuIX2TzVXle/1frqUy1N1ymmnibnAlH8ifXR3hFfwVSnSQ2Kucwv
         /wPg==
X-Forwarded-Encrypted: i=1; AKwUvBxuivKJwI4CcC15mkyImT41o1eN/sQS3r0FSLSifGcBhCJ0HmufhlIrKUBYkFlofMqNYaqsId777b+p@vger.kernel.org
X-Gm-Message-State: AFq9FYJ48NCBjzwDBPGJblbQDgiLC2B4lg1B1GQhJBsHA9+NmqgItW2c
	je4w2XEn48E6vaoNlO0Cf/nfbXVzmRaIGblTE8ZG/nOZropb0VC2Rjw1cZ9X9gqTBGzLpX5HadQ
	EohOYmN7Lhf5caOV0RUlI4YPeeDv5S0BzknXIPKq9742ZBNgGsVhkZ0sHSSw/L02b
X-Gm-Gg: AYBFou2Qw9mfn/hY36FBRNxve8POY/FknKdtFloLoHKIvipka7FwBngapSDOeqY3Uot
	BgH8CX6WSBfrP+JU7qA+S8kXFQY9xlPZ+oCoRTUPEQdjEpYAvPX2ncZNgyVyZyjDmx+Bv+7R0No
	3rb+LCEANFSWwZR0BzgNvxASxyauPk0y9KNK6IOTbxvtO0Huw2KqDX6Nffs1NRQVpw8uSix0mOn
	R8XI3gHGf3/f0tUAfoDnMz0UFpnk+K0ZDNTXBLbL6v69CCiwWLCyZeKMr80JJSlBKNe8I8uTj4y
	nETxWr6d3nBTXMpqEAcWVczAWNU2iNoR1QJbdDTr0ugfSwAEtGiC7HEQgeGi117cPQYCM+uihOV
	8QCWe5DN7c0rsMQqT0zwF2yR1jGc2ppo6ABCVR1rsmuwVejkZJCxphOggOWgAhq7sqNI7R0ZTni
	5WJQbA+ty4k0aW
X-Received: by 2002:a05:620a:294b:b0:93f:5445:c667 with SMTP id af79cd13be357-93f57f6f700mr868120785a.55.1792665262416;
        Thu, 22 Oct 2026 03:34:22 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:93f:5445:c667 with SMTP id af79cd13be357-93f57f6f700mr868117685a.55.1792665261982;
        Thu, 22 Oct 2026 03:34:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f4e0563sm7635571fa.5.2026.10.22.03.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:20 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: qcom: allow SM[456]50 HDK/QRD boards to
 play audio via DisplayPort
Message-ID: <5a7wc4hqox6gbpdkttgbtwkk4rfohe23lajlnydk3sl3f756ax@ywultzk2f5xq>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfXxx8giB2KqJfy
 Psk8Pt0fZk3ILvAUoC4pw/2fKa/1XUsd82Yxi4qSaMfOVa7Bxa3Wh8xCDi8nneUoOtamA6gVDAH
 p39qayjA9FaUZJnuyiv1MynzLlnLX69gyS81VNkb8qmKgGp8eJIMP59gIYffaOQHRvFPvLKFrCB
 xrDxdPwZqm1sFt/r/0FY/lZWM/kDaDh8Dqfv2gLgtzhBr23OBsZ3gOdSu4fP2q3Yfsi3YyiIbkg
 sGjj3x9ANzObWwYlYPrF76pfXBRj35v5TCyCFQA+UUoYfuKb8SKmZ1BIi5sOX4EzJTpZ3oW+15k
 NrRptZXQTCQOHw5fxTk2gxDkGC/YzFidb1Q+fZ/pstUGZyMKtrNJbe33Jv8doSmZZre63PVgzAF
 ndJQLD/Pol2I57cJnJH1jZPBSFdtjLdkwDgTsvPxtl4cQyEQiidqt/FIJ54CSfaLEAMCh3NY8hV
 590noH0XXxvCYIddyOA==
X-Proofpoint-GUID: HVdklJmNM_hs9DfiNlMPcSYcneP0GloB
X-Proofpoint-ORIG-GUID: HVdklJmNM_hs9DfiNlMPcSYcneP0GloB
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9e6af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=67hlTMCujxtZ4D9r8sIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfXyUuFATUpu4Gh
 E+GGHenEat/lNzheHf585I6KNPYfcRvcZhQ7JI5xjtuI+Lv1dTdJJ654vh9dAx7NuK3j/nzPX6L
 AJgWKD6imbIYAvXzJf7U7i45aEdYeUI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

On Thu, Oct 22, 2026 at 11:36:20AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the DisplayPort altmode
> outputs for the SM8450/SM8550/SM8650 HDK & QRD boards. 

Does this need an update of the AudioReach topology?

> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (5):
>       arm64: dts: qcom: sm8450-hdk: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8550-hdk: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8550-qrd: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8650-hdk: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8650-qrd: add DisplayPort audio playback support
> 

-- 
With best wishes
Dmitry
