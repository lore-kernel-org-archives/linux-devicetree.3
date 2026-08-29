Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860E23AFB18
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788021876; cv=none; b=UdJo9T2sEXERomzqv+JdXaAYmXUWwLdM7S1s/McnPdsOFZBp4ZEbvd8uab9E9o5n4E/fFrDPpcsOtwqeUk5p4aHjWnlR4SI0+aBrwf4CyTJrOijaxdCWruc9Uz+KTLVuEFCN611MHc1kJ2XuOfjMgAOworR8XIK/57jzHgAI7OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788021876; c=relaxed/simple;
	bh=aSklOJBjcdqPcUYEeeCoNyo0uVQ6XvKNjvYw9Jp6KvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwwPDaMNXE5mimPTvYno6oN8g19YWH3ud+eXMCNdw06DXgezMZIoLkvcNz+Uvvg7LG0TuzSEiFfT+MaAT/b+14nbu3HF0BDVYSRRy2v7bri4/j7obJdJTjH/ZstMUvziUPhPZBhx4Gx9EeO2sBHzKMVW25kbMW9c843etEDtmOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcuqanXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/waCf7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcuqanXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/waCf7/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TE1wJO1834434
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 16:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IL2xa6WUcouEeZpbiUivZKwcC8u6B+zkhU7Sq5Kit2M=; b=UcuqanXHhJgtlapt
	ecpj0LrsltnWGgP367OBB4M1UfDXN/I9rzmKdlZNv8K1Dbl2I58LNJ8vGXPyJL/s
	JyjgcaWA96ICipFlD39+Umrb1pyA6IkVigtztwNrB8s26RIO3b5uS9v1xRBOr2Qq
	34DzvXoLjQq9omNR8ClRlM8SwQ9e7kNREfpvZithiC1Psheg/C5bhGp+ekc7jk5z
	lLMDGXncdMNIFMTL5hyzxW2dWjdmIH9uzZBUZIBtBGVIXFz3NRttixNmCOM3c4e7
	PeDCLJ1TMe3/C/9aDDPE7OUwDi0EEcrh1+I66eynD9NS/sBQdWWMrq9sTUVC+htO
	AIGUXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe29duf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 16:44:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso2635208a91.3
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788021872; x=1788626672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IL2xa6WUcouEeZpbiUivZKwcC8u6B+zkhU7Sq5Kit2M=;
        b=d/waCf7/0AQiuaXi+v5By/dlCDcQ0pksVjSiLRBfzo19cijlfNRlFyeLVJBgq6ZAcN
         n5l5KQ4FVEZ7VVW3OH6s0XdoxbsRWpZWSWA+wFDx7h80x3pWwGlsVeqLOl5wefwoPzqU
         C84WghBnRkYy/fqqN45ntK7J1P8z8ZuXYlbmLt8MFAlZ5HYF9V+cTxH3dG+As7cbIUBb
         qbQpqZ9Pu6ens9Frwyx8U7EpNpm73dXQkQliiqKkPfZ0ok4pJQ1oBAq0GcUdLm0nLdim
         DIePXXmYkj3J2E5+2jaFxCTQ6UnkKR5kycG0mllIL23bnBl9xD8KslzUnQV+cf3tlAY0
         QH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788021872; x=1788626672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL2xa6WUcouEeZpbiUivZKwcC8u6B+zkhU7Sq5Kit2M=;
        b=XTwepI9ym+RaUDI7f6Eo5ZRIc+dcGlh8v8OvAvT36nqSJ2HmCgxgc6f3xNVjqoQ8Dl
         iB1KnbxABgK7KnlzXhqJJIdaeAiqVJefgS8NDYC0UP37SKSpP4u7RVuzgaELKCTBjcm4
         5b5sRTKRY5tuX2SnLbn82vQpbziGWuq22X6TuqJJ7LblDSFAUy5lbStE30ql0xrJWtZq
         /EYHiGnRjfiWixB+7g1C6RMdE4NAIrH8/tPiTOAdSRMd/M0XqrUHdy9cY+QBhjp3cwBN
         Lv1QNaF2wwuCb+WnfogT3JLYivq81gK6VZmItXAH+cw9kBFuZ1Fy7odix294LfIZewN9
         HMIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB1tWNzxuGhXd0simuUv1t8IheCiDA35abdNcmYDXPQ/BXb3oWmyNs7S9etOO+W/kbNLgUKGYjlgxn@vger.kernel.org
X-Gm-Message-State: AFuF++nFFYO4kBWRH7o4mMRV0c1Fe60PvVjW1KrJDfJwaMfvin6bbEf5
	lA4UupSJWHH9c/13GSwBoJHh5UjVdwqwdP9Q2ZiXyhxNU7NbndZG2L1BnS2EmShVUEVXeDbFfBN
	iZLTYoT0tzCKyqkTXtbYb9nA24SGYHbqfe+OYFD+4PtHd6a2+b+IVmenbwQxJYR4y
X-Gm-Gg: AYBFou3CCV12IVYM+pI9NhvynOGVNaO3Lch6SayQjnZ14d3pW6ZENPr/kUQbPztJ8ju
	L1PI839892A3rYB1yx51jKvcFW/6iE2KvyEicLjFSsBCyH685HNU3DUH2HXgiC9CDG0rnfqdr7R
	IYsbvpycz5d8lWfligiiTcHPQARbcLZcfvqPaHOiD8h8oCZJiFBCiRI3xjp63L/vWkpyUHu6SET
	jtZaaiTAoDlCwSZgyOslqwXkS4J2hadRz+1B3rix3/vbebPI33Tyd3Ml2IQLJ6c4ZOvynuG2U7s
	fn24V0jRMQInchUBf4UTfIALZkgxermJAZLoHJQsv06+1hsxY4OyqxgKQ/RGV38cLXfpPs75hms
	pQpyQ/FcvPBiRy5H3krSIYcw8z4zQPhmA8+7gEDfL/2m3++JlELgQK+Nu75SuqZzxM8o=
X-Received: by 2002:a17:90b:6c5:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-396d0f9d0famr27215605a91.12.1788021872466;
        Sat, 29 Aug 2026 09:44:32 -0700 (PDT)
X-Received: by 2002:a17:90b:6c5:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-396d0f9d0famr27215559a91.12.1788021872023;
        Sat, 29 Aug 2026 09:44:32 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.241.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186809dsm12283012a91.10.2026.08.29.09.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 09:44:31 -0700 (PDT)
Message-ID: <cd5fc80b-e52d-4fda-a831-298f6bd56fea@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 22:14:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: qcom: ipq9574: Flatten usb controller
 node
To: george.moussalem@outlook.com
Cc: linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-9-5c1f3170bbe9@outlook.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260825-ipq-flatten-usb-v1-9-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a930c71 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=PZ14JaS8AzYbITig/tPzRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=jScrFQIav-o397sHpJwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: t1YLZ0SeSSKPruoTkaCgZLRg4EuFOOh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0NCBTYWx0ZWRfXx7RFYjP94sqe
 k4pcFjzeFMjucpzbw6RZMMB30biEQG/otoMm+ak3OfKXxfXB5LhL36Xi1MiOmC3NMQ1MFtrpZrU
 mSxzgSB7XBmVqlwlf51Dn7ZAx/G5x9IfR0WStBoU5mOSwVMLUcvnSiS4TiOaG7D6WH9gi8EM/51
 xHXtqgBPm0/tH1kikuRbSanDtrbU00plvw+yK1s0P9R/4HQj6iDm+BxjjeeI9khP0knu9R/yhO5
 U+kJQeqHiAAWzDuDy9LVLwUZ72WpLQqNEYCtUSX7bQ2R+0RktvbNXiPmKEfOtv0ANAkTyg9aOmT
 dGyCnaCZgslei93qxT4wOqhAqOYdEb7+KUYl8hj/jaqV2UzGRKESjcy0IAu8wek5Sz79YV3vnFP
 DB7apm/+hdtpT2fN5W8PJERSF7FNsfyTnr84pICTYlWS52w/oMtdqc+0SO0sA5UTiEu7TxqCB3S
 FIvUGieg0s0VVz7I/HQ==
X-Proofpoint-ORIG-GUID: t1YLZ0SeSSKPruoTkaCgZLRg4EuFOOh5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0NCBTYWx0ZWRfX3m3/QZQRewh1
 wNbz90ZjxS9mGQj1Axeg/JAiZM+viKPtji/SsFCenh1cskW7TzePEOrIPKmxcxTp83J3ndYHAUQ
 7gKQJqN5ut4DzKYhk69mamOyujJEMko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290144



On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> Add property to the USB node to select UTMI as reference clock for the
> DWC3 core to calculate the right values for the period and frame length
> adjustment.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

[...]

> @@ -780,32 +777,31 @@ usb3: usb@8af8800 {
>   			assigned-clock-rates = <200000000>,
>   					       <24000000>;
>   
> -			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>   					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>   					      <&intc GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
>   					      <&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>   					  "qusb2_phy",
>   					  "dm_hs_phy_irq",
>   					  "dp_hs_phy_irq";
>   

You are adding pwr_event irq here. So please mention that in commit 
message. Or would be better if you can send this interrupt addition as a 
separate patch.

Regards,
Krishna,
