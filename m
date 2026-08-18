Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8843CE4B
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043452; cv=none; b=MsmD2qMEvHW0U/1W7o89VKpWsukSPBa190J2r6kiGXp6lwyFUJZVIM7yk+xl/oD3IkKSqf3WpfMGBa8Lzcp9ib4EACX1Nn8GTjHWfGCinbe5yJk+8yfYRAPGfrFoO5/MU8CvKEwVaAQ3E8DK2moiPU0PIRxTUBCPnjuwa1uj6Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043452; c=relaxed/simple;
	bh=v69QcsW2mOGfUzf1hWEyuWqfUsnkP86q/3Zcf5zRAjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HANQs9WxyuUPMa1YoY7/tUd/WZk7aOnd850jg7uMRGJryFeInxrR6U2T6ciGoBw4qIlWs+6LRyQmzsPZywXGGHNv2jxca5rqsGiUoG8uL+9zGcF+MY5R/qfC8EPQY30Ts2t8RlPvIBo1Nf8HlRmlQKOBGJiD0AfnW3Jw29gFjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1YXZb/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rr8DXtYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1YXZb/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rr8DXtYu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BLxC310051
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWoV3r+YPiscKAy3H5JzA7RjIekZzVMMLL5OXDd1iD0=; b=h1YXZb/apjm+o+yj
	D6/wwFQ+XyMLCBzqrCPZ89IVFPd0h+hrIPReUhWaX1Y9ILspzdYjczNngWvafd4A
	jHJ8MQl0iaTXzw4mqPw+LQfgjdr4EaawzIRYNaiEPGf59azu2DG+PIEzWs2xbadP
	jFiWIxXRm4EsKbaySytz1alkgyPbnS/u79oYPeDDcRnK+fhnHoFeI0nIT2BUXSgB
	8t2sC2j+YV7BoKTCwq6YUoAPoO2+HrrDlGTcu1EnEr1d8WNyrXDty1rLmmrNjjb6
	LscySl1vtsb1GVd0BzojtT+Ai/eZQfWIRi3UnEZel0Ovrg3wSRQOszTZqdRY8PWn
	b2TvRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba9bx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:57:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936bd9b045fso2925985a.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043449; x=1787648249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWoV3r+YPiscKAy3H5JzA7RjIekZzVMMLL5OXDd1iD0=;
        b=Rr8DXtYubw8KGhDyHXleT2bKC6PMethFt4mZyezLWuQ2jkM7Pmrl051N3UKlNweT+p
         sCLutcZVPxkzGBuQSIAWSLkGlgr1h9bg81m2B+eeXsdlu+QHf1glnr7rnsVpV20TTwPu
         TFYdg6VT44IqmA2phGQ3Dboz/QGaq3SdSNSKDaerCCITXtJmfNRY1oqAq/KMd37tSiex
         eJ2IHqVXNjOvFMewHCgrplbBbJXXmzJiVlH2kRPs0cp+lAstYUiHqNPxEWi2fCh/7k1V
         1otB0Mq8rHLocgludIjIGywT2LPSYsGhSkvBr5eaaDxO18Tqa794YzUt7/SkpBOBxQLE
         vtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043449; x=1787648249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWoV3r+YPiscKAy3H5JzA7RjIekZzVMMLL5OXDd1iD0=;
        b=DRiQw6QqxbhOr57YpIjTVePtO3XMoQvnxMAuPYIsV0lExlxBi9kVRV9c4OYhVmwNhY
         jc21UI/dZ0wZizivX+uqaWNiMH3F4MWhRrq6EcUhec+HUEX+5+LVAlCcFxOxJTWVtxAH
         dBEdNmnJAvJwYoiugK/zsx6vrV9/8DnpoG2Eya6Tksx6EW+vu/TRs5WbUWpv+6FoviBt
         OdVDYWkJy/PTXorKNdEgPxQzFmI1bH1njh6Kor78c0fW7FEVKGELZqN9596vNjBAPZEu
         KwI6Fun/dX3WW1EULn0bBbBK5ORT3DOMiHQBjFXKSjqs4fhNH8yv29XeMz9bROy3bWW1
         0Pyw==
X-Forwarded-Encrypted: i=1; AHgh+RrCpUAh7ZAoeqimhAtoWgQgqr+fjMZSdDOKE161yLvw0QncijQLTr6+kwTRSkJKxfctarw/7dee3Rit@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd1HqnFy7+FgeBF2ay6YiGCcxswZgP/uZUOU7aKTsL9wKoG8MO
	QSEJITgQ72jbKWZ9oEVf+cvRmGiAC5S/zltJsmjI5EiJp482QKi24eWyOgFiqPV9U3p3a7laoAE
	XemdipaKl+WShf8nn1lr380aSf4yeAdyDWjQY+0/q7I8Mgy64Y4SqeyJ7jea7cx3Y
X-Gm-Gg: AR+sD11ZIvDoBlBIxz5EhzV7Rx7uBSemPBmL4QCVgKyRvNvo67K8S/ceVibLMyOYTP+
	Cd40pEpATWe6vidKtLGix+61MpH9FldAmHh4pmRHf4HEm8z7k3XjYr7iwP3BSad5aO/HVF7HIuQ
	RBH8ayuFrpz4maJBPsvm+lDneZ/9QYUgR82ZQgHPXILUTIzEHzaQT9IxDSl4IfTpJduBV//coul
	3p9eCKnQT46z2fSdmWOGBmDScr4A7o+J6kBJWdP+1EN+xF+qCICYpDVWEexaMXQdFq21/OC75EH
	gHaRKuHr+Xlat3p3VFMPTql7IWl2dcp0dcLqtYRGGnS3nvSAv0yLgXUTKsSEW4ZFELYY2pCwQVn
	lqJJ4oLblzHbLp0fsL9EkRYX5
X-Received: by 2002:a05:620a:45a8:b0:92b:7420:bd58 with SMTP id af79cd13be357-936d1ed8aa2mr2213170785a.0.1787043448932;
        Tue, 18 Aug 2026 01:57:28 -0700 (PDT)
X-Received: by 2002:a05:620a:45a8:b0:92b:7420:bd58 with SMTP id af79cd13be357-936d1ed8aa2mr2213169285a.0.1787043448574;
        Tue, 18 Aug 2026 01:57:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc9a35sm117355966b.63.2026.08.18.01.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:57:27 -0700 (PDT)
Message-ID: <17cbf5f8-c23f-4b97-b971-6b6f4f3226c7@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:57:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] phy: qcom-ipq806x-usb: fix the SS PHY
 TEST_POWERDOWN bit
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfXykxlga7ZZ9Ob
 TQ9ovaomBQc9PlSpJYNHKu4kL7RQIGrYeIEKUPss+s6GP1CbMFWIyAD4MFxatumEyXmLNcNwzTV
 U5rzQSxW4xgCqMEk9LRmwiHr8S+NWeA=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a841e79 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zhQxU6SgEyqCUrVtDRsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: I8LovPLJ5i-uIX84JJFUGjrkrKAbza4k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX/ZcphPOdWUW+
 KLpnJnCW/JL2tv+KTxvD8s5l4edKdCQhZNo8iT5eWYtSHKW8UJHB+1rWUzFO7NzQIHLl4nGj1MX
 fsrjHDSOZRVYtHlf+2hFsBWBBe8SlxoqBhRLzuQkd9j2frhh5zPCtUUFcTJBI8J4ZVyXqI7f5HS
 aadqmBlMJG9XsnHLf8a249DDrB0jOzaiGNhNuIxl8qp2anr1WybGlqDJGxDIq3lJysZroh/W67a
 TDlyDHSXkLhLWaftSb5izcF17U9et2dYuNWuj4laJvyWrB9WYP2U/ZZKn1bsUyklzNEJJnE15HY
 fNLa8ccMqp6hWsR94NqM9UPRGMDVKtuvvf23s3OsMWSt4N9eOSOdXMW6aTrvQL5f3TipVLIWXcu
 z4bex2baso0SLt73vCGZl2v9A2oWchkjdEwNnf+KnETM+3Pvi0jJO0HWFw+jiK+RBmaVtChLqP1
 r9tsrqd2JxoRDoJGhVg==
X-Proofpoint-GUID: I8LovPLJ5i-uIX84JJFUGjrkrKAbza4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180065

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The SS PHY exit sequence tries to put the PHY into retention via the
> TEST_POWERDOWN bit of SS_PHY_CTRL, but defines that bit as BIT(27). In
> the DWC3 QSCRATCH SS_PHY_CTRL register TEST_POWERDOWN is bit 26 (see
> the downstream phy-msm-ssusb driver for the same IP generation), so the
> sequence pokes an unrelated bit and the PHY is never powered down.
> 
> Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
