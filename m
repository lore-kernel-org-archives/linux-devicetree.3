Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCEC3EF66B
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562259; cv=none; b=Rs2Zqm7PGF6QHw2BXZBxkY6Zj+tjgfIZEyfaAF1fsdI5JOZzoDXx51Nzt8QSx5OZSjLJPoyZUsHWCGmevEXYPz9SzhgNEEkkvzSt58Av87q94x3rXaArpQjFphnPhm99DSHiknmt6UzZ1VYFODy+t4guQZqj43z9YfxvjK5m5yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562259; c=relaxed/simple;
	bh=auF2pO2Hmg9N2RW//a8wPjHGAi6Mit9yV+sAZphKf7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtZHeZ+BW30LR2yZ9el08JCkQ4MmqniVSuzwx+aA3QRBwchpJ2G9ocFN3+AcF8VFJFt5Z05dUeaRvJ10AJyj1iFqmfKvrKFr2z4wvEcATZTN8gZSKc58m5hth+3gv3eIdDPesn+oPNK0KsQS+EeCmi30mYUQnhriTmwvpM7JA8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUdhx2wM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQi4vLul; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUdhx2wM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQi4vLul"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7PuOt2665895
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1tg+9GkDewkaIGXkzfNnMwEh50htryN5gYb6ZgOR8w=; b=IUdhx2wMC4jBzqQA
	RYhN2tPt6/sXODOh+KV0x0ucDTfua/yQSnTS5B5imfiQevVkBizpHMrzdLkrf2jx
	yTA7jXFnHmYcKxy9dExIM1oJZAYxjNpOHj9PBGRSzLk+MWQFp8Ll82VJA9ve25fE
	GujNJmf/hoXtgHbm/NFQBiUcBMStm0nr6nakgXK4udBFuWwxgGxADG2mnY9qWLsd
	3ty/al48kJrzKqcixd++RIQ3Hpx58W4YfjzjDgn4HAy26MocgHtBGCn8Agecyu4E
	uiAPCHaGwAJ18inyePO55eUHYhSYtKdVMMjgbbajyEtQmZRQRL6Dk6+ZxmhHfg36
	+yMvmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgrd9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:04:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9d953b71so5859771cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562237; x=1788167037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1tg+9GkDewkaIGXkzfNnMwEh50htryN5gYb6ZgOR8w=;
        b=FQi4vLulmPp6ns3/qlmxtzCrCfwJV89IjTTmRtXnIXOqFxfx9nrfDBr92ohGV5fcni
         euW0LYwpjoPVbBCS+5LWJbcvciKgkYf7nnzMKqXhgpvut9i7He3wBj0isd/YB9MPFUB3
         hadxC86jBGGaJtTYFtgASDV2kRge0FqqU+PYdghQdumjBs7TKmE9wwdcrKUeA+wRUpW9
         Gzi26Z9DeqDC4payQfc9nlGMF01BX0tTCgSSAMEmN+zCBDIWl61gBAYbLrJEUllBOz7B
         XBGzTWyC67vHk5amcBEKwBG5cD3LUao/g9FJ9chWjU1L7gVn5TnofBS7+Hlygim5Poch
         WQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562237; x=1788167037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1tg+9GkDewkaIGXkzfNnMwEh50htryN5gYb6ZgOR8w=;
        b=CR7N8NOn3UPCDz9leKOZPrOQhqtNIBJenmNZnFua3ZoHkUpHc8TSkHI+wuCJw1TkEw
         sjjYDg1CG8TqG6zg/ptPk527l+LByeDnJaun917Bhsn5TjXK1iWSq22ynsvjm5znaVkP
         JjQKOS6ffAS4tEtuwSRFftYgkM8cVaTEOzCDWzKHIe/PySnVzn4/85rrzdehIiQdkSd+
         oKedbMewFQED4I6tYATsCB5rZIfEDDaftkv4o7GkCC1gqDdwLYr1cFXiTyV1k/6sCFq0
         +90yOcVrIoPR/GBRrsK30Uuo/BXaxUAnnxsZmSn42bV4zKrNI+u89AIHEE5fLKhhQrFP
         dN3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrV3+O4D2qFRWMpxot4zrxL6OH9PyM4f7XwlcThZ81C6+pT0brh8qTkXEs6eA4DwXuoWvqZlEJ7VIoF@vger.kernel.org
X-Gm-Message-State: AFuF++moBSQ83Zspb7DtorLWEf8i26MAK9dIrk8DxXe+HcoNIG8cpb0K
	R2587MPAkl2i3q1j9pjJhDGvoEPpzBObkTRApABhsTRkYdbO+/HhX1eG2IaZxf578RhKtG8becE
	HYqCB2w3v6BmQMu6l3pb+E7C6+5jEhuD2tRqBCR6ksGkD5s3621Lx6HM9ks1doT2J
X-Gm-Gg: AR+sD13SkLqqBPAg77RPHNRoNkZ93pq1H8qh0ukK550PjNuwEbwlO9W8EzXqd5zrAle
	I4ljbUmlo0R9zvaMCD/vFYd36BYBzbbW1q+ToUDvWB2YZB1xalJAtj+6Ge+GO0BNrYTRvogg0wH
	TzJLy4zhra23vMKexIUZEGL0pB1+pUIsSUJI+X7/5TrYgX1tzKhtqukoIx3UiExTO7Csndx9l7s
	h/vfj1Z6twpY9aszIKanw+6HG6KxlXA3o9Rn75/ofU6RFZLBXhqHRXV1/yycWpto7dCHeueY5l6
	PJWTE1KWmYYssVV0mZF/FlpdNaI0b/EvUynEcs4rylYYnh+0Nafdw+O3atGm/qY4ZrV4NSJ81LD
	67hnkfF8SWByKJnCtQu+1pMWw
X-Received: by 2002:ac8:59cf:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52df560bc24mr185933111cf.1.1787562237364;
        Mon, 24 Aug 2026 02:03:57 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52df560bc24mr185932601cf.1.1787562236910;
        Mon, 24 Aug 2026 02:03:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1192392566b.42.2026.08.24.02.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:03:56 -0700 (PDT)
Message-ID: <f95e1af9-0808-44cd-8323-687b4de3f158@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:03:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] arm64: dts: qcom: ipq5018: Enable USB
 Super-Speed PHY
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-13-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-13-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXzhy3UA/mQz9+
 L1hqOGyfhYOIlsxy3qelyYy7nH0Il539RyKQJ+S2whBqR/50A+GkXqgTZx2LW0fDiE9FL5W5y8I
 qGMojqVeiHtz2pLa5Mk9BbENRLAIHoY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXzKBJ4LgBUMRm
 OdeDI7jB3m4neDfZr851QsuBgsWF0VqYra1l4XqYi/iqxfSXccnrZm6vhdrMg8UhcE7IzAjEns+
 T/1SWL5+nJSbDBExJm4vrntKVEIhkpMwWL7ZeCVd+xy+9E6WA3giCoKjmBTCDPzlXJQMxzF1/2X
 k2lQnjjv8EVilwnGRiEpYc1gEIs6u6lGfJR9LpiSHTlCJ7cxitqbLVE/nZO0wBUBVW8xommdAnj
 Vq0z5LTQxrORdPPc0SQpAB/PAeBDwOQR7UvqjzsRMduYdwcWvNy5Az9LNPqnS/5YPZyjdlnc/A2
 l+JDFu9LF873NdrGns87Xry6Cm19VBPbhemBwHIdGMT56NTS/t9SUYvfvn8hQJrFQzXMUGkq/wp
 a0K+U2w7cVcdMvkE/2kl01L0i6N3uyAeS0Zv8tbUJBoEl7aZd3fYHuQjen/7/1dGPuWXgAEO3AT
 DLhIrsKY4BKZ2GpYhvQ==
X-Proofpoint-ORIG-GUID: j3JPh19yPvFSNygUCZB27ScSdpbCG-tj
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c0910 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=13kpQq0dworOtm3SAaAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: j3JPh19yPvFSNygUCZB27ScSdpbCG-tj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the 5V supply regulator and enable USB Super-Speed PHY support.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index 8efb2b21ed9e..ca29f271e673 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -22,6 +22,14 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	regulator_fixed_5p0: regulator-s0500 {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "fixed_5p0";
> +		gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
> +	};
>  };
>  
>  &blsp1_uart1 {
> @@ -119,6 +127,12 @@ &usbphy0 {
>  	status = "okay";
>  };
>  
> +&usbphy1 {
> +	vdd-supply = <&regulator_fixed_5p0>;

I think we'd see fireworks if this chip got a 5v input. I'd assume
this probably needs the usual-for-qcom 0.9 V and 1.2 V regulator pair,
but perhaps +Kathiravan can confirm whether this holds for the router
SoCs too..

Konrad
