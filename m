Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577925;
	b=vyqmwghcXDHw44QHs9lOxliaI0OoF9t7P5e/bi62xXhNVvsJ3vKhlkgme5aCFAZEeG84
	 E2iX1Rmw8Q43cGbc/87UHlhwqzhO21H58tiEFjd+absYlH4f5V4QlJgSbLskIYx89dYou
	 +AidMyuEfojfp52E3MFfvP8DFHeLVnR7ueG1TW6AxWwSob544JXUR187OQLGlAWSmTuX0
	 g/E5yLzfa2WaffulPCUXIt7yupG6amb+rziHlnswSGBxO2eUy02zYO32WTB+IXvRa6iuk
	 e47rguTURs+unsYVPlz3su6/wQ8Sy8UIrZNwri3B2n2QcZ9I9G0IAVDra+Pobg/pA8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=;
	b=jeEjoVZocpWzRipGYYrjDJG9eMGSRZbyGCzQPsJvcH/CLw3Uv7lXlU2VZl5IOSYKZEQp
	 2gEc04nY+2N+/yDbuQ/v3G2Y/QRII2B38Fj5688DL+0GYQRaVdfLTUkdpIMrzYiREZkNm
	 5oohQ8aA3RnCjA7KXOuNB6isNpatW7BRSVLGAN9yLHT2IUmEqVkj7M8Z9ymaBcXgJHdCr
	 Xh1aQAe0PD73/7tgFXooZ90Dd0BvfQ2SYuRKTgqzkEqOGkMkLj0qYLQd05UWKbjEXjGUf
	 EQnNXjk1wxtcNzNYiL0zdddU4sbdd5p+IYahl1oX1a+m26Ked7v+wyej8avDlFEc9eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kaY/uWAZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAVWarRE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3689E606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3689E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaY/uWAZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAVWarRE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5k1w3015975
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=; b=kaY/uWAZc5nGf1ak
	LBzW+e/hUZ09NDFcAvRHt/pNDv6/gpc3SxqwxfzINmDV66rvCQcA3ZtboWumjaf+
	frnLlxOqg1v3dma3fJSYZq+pBNpJiY1Iohw+V08qnTohcW6BkMEPYnGJYVo9xEV5
	SgCW8sF4cUOSq4xb1JF3Bb0P8DyGUpgkQY8tyQHfeiBTKO3eew9NmAlj4A2s33bI
	jRZHq6egkjZi5QXRyZY4+hIEtXf2A7/lQGDdUQJQyC+X8CNo6MOPTfPjD4Nng6Q/
	p+gBze9DVgCox3Q8mTG851LiVOxeYWJr/g+bAewn3c6y/z/9ydIyU2v7dzZRz3ol
	5vxiFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78j8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:18:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so15909585a.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577923; x=1793182723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=;
        b=cAVWarRENzPZPMbusMX5PbqL+Wn/W4z3gTWXF9ZCSlEl13t6rCQET+59jli2IRlH3s
         pxHbi8fkz60/k57mAp6UFlSZqpjKsX5B2jmZC2aHSdRKnfMn1+1qI1v+jUN7Mf4Y8erS
         nqQgD8DNSaX+7cmNuUiwsV3DU0nqXIPcubbDURdbpKdkpk6Fdx7xQevKdO+UbJp608yp
         t3JTuo4b7dyPidJs9Tu/ZA6Ob7kCxStyy0Osb/7pmnnwIuLVbfVQ4DMID7FTP/jXNRm6
         MNjrrF77yLgMInwBfOXHelNexrAA0VtEz9XUckq49MmXXuW1EmXFnM9KsdUW1/Sxx0s0
         efhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577923; x=1793182723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=;
        b=Vv+BBc0nszbddKuqs4BQ4SwR3zD6Hw4GcS4Q0ERthV5h/oHoY4aunsLK/tBo8hNyl4
         EFMQYeNnaCvXLXquhCXPzvbzfcP5V4MYcndLobcfQ1hCef+CoWtkbttnKEHN90qzDvHr
         azXhhpQrUMvKD8ZVq3essRr9D5dHvfNNkVKMnHoNBva4YPUBO0ZIBr8Rb7eUJu1CSEat
         QMfWiszQCXvba+YqFccCg0hjpYiujLUNIuKrVtDYbwfCeN9prAU3okVex9PREJuVSRRi
         wH5QUjd4ULJ/7QnEWWAuHZQoj2jlHrXkIjhKeC/RB/Jdb9o6P46gbVF2un4Z/+Trcel4
         /FzA==
X-Forwarded-Encrypted: i=1; AKwUvBw24uBXcXDevxQC2JemsIUZ0+Eowdpljk7VYpxyMyjCk4hWtC/EJvganxppkR8cFM+8PZ98MlXHPR1/@vger.kernel.org
X-Gm-Message-State: AFq9FYJWk8zn7+hfHMc88iYr5O1U9210372fKZ7OSr7twb8tbJq61liQ
	6Rvyq94YyXw2WSbBjEHpA6ytp1EXPw0Ogbyixq7SqtS/7KLxS46d2sX/mnPJaeDp7iZvPbLAMYs
	rIOohUiI2jkwD5SiFCXfd1x5VFRnVSUVNyTNSTjIS/WJFN3DcS6qtkH8JKQ3L3ycA
X-Gm-Gg: AYBFou2INVzJO8UYunp3srBekE1QehgF0+QEVy/mOBWvEzDMReFQDQXQWpbtjFNF8Fy
	CbHnlQTan2ejh8yhv4u3/0sbpvwN6wnkEskLiOkDVRZVzLhA8wnkAPs7ttzQnHigXWKQsguV1VB
	LxySubBPC4Z3xp7CtXmA3MXS/j2iaHH9N5B+XFF5CdvOouRNny+SFszpua7nSRi01TUyfTkkAEW
	iUTgEJclItS0xTYFEgxuZzTjj+yiBk2AeNBZpTewRBPzeCL6tjh9CkENXxMXfnJMLocg/Y4bAES
	P6fE7fGkKeIKGoR3E4QbzsN0QXVxC8e6SvZuFkE9eUjdr0OofTUMnKCPhn2F7OSwEii0qlwfamo
	xBf67OHkwQlkMvsiepWUkXg==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr370750185a.5.1792577923312;
        Wed, 21 Oct 2026 03:18:43 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr370746485a.5.1792577922870;
        Wed, 21 Oct 2026 03:18:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790063e6sm61396766b.73.2026.10.21.03.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:18:41 -0700 (PDT)
Message-ID: <ebd754fd-96bc-4f37-b390-35a952dc6328@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:18:39 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-3-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727070758.528-3-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VU0ui56YuRPyLwyX6EtViJTet7bTvYnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXxQl0+WV+ui3M
 AL2rVVRU/Kg/oSe+mpgQtf6q645oAkvczuudrpFfZd/iLSczbJctJqJ0zGUmj3NAlFeHQyCd4Ly
 yZAVbyBaQWX40c0IEEm6k94DqDjZtC2QsZOypg/vssF/cnZrVSbnjUX+o8sXEDK2izuGZ897G0I
 WoOFQhqZWpLb/9yfZ+1vAkm6fY08TXr3w2o9TCTS/qrCoW+KiJFvnUoYNi1qLg+2fWchnCbWcDM
 e1HXi4jlKZPOn85aWPyWNBhKaAhH3F9TX3/YXoi/SVqtvBn/l7ooICMhXrVrlRhl4kymW7pJ4xI
 wuHd3tb9TX4LmKAMOYB44fSXo5xDrE+OnzW4zb15omFNencCHz8f0a30QWpAiSIASWB0YZvySEg
 3nI4dQ22rpYLxAay5wBf9mWH3QIekISnaP8w+lwySFzhuhayjM/1y182NH3rbWsvTLEKc/zRr5g
 fXBsd+iNMfJl9WGpw0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX82EjpiY4nhMT
 o98Jb3XoK4XypoY0ZfMhSy3o2FNVpOHLeRXMdYbt6XI2pfW1uQOAWefGCkBTG7/njiiEMNAZjdK
 /IJka9EnlfHCq+D2uBaZZjatgbmBkqY=
X-Proofpoint-ORIG-GUID: VU0ui56YuRPyLwyX6EtViJTet7bTvYnO
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad89184 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=cdovKDQ3hRzJwYAqeg8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 7/27/26 9:07 AM, Yuanjie Yang wrote:
> Add the initial device tree for the HAMOA-IOT-COME platform based on
> the Qualcomm X1E80100 SoC.
> 
> The platform consists of a system-on-module (SoM) mounted on a carrier
> board. The SoM integrates the core system functionality through a SiP
> containing the X1E80100 SoC and its supporting components.
> 
> Hierarchy:
> 
>     Carrier Board
>         -> SoM
>             -> SiP
>                 -> SoC
> 
> The COME SiP hardware is effectively the same as the SoM used on the

"is effectively" or "is"?

[...]

> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l2i_1p2>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};

Does UFS come stuffed on all such SoMs?

> +
> +&usb_1_ss0 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_ss1 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "host";
> +};
> +
> +&usb_1_ss2 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "host";
> +};

And this sounds like a limitation of the carrier board more than
anything else

Konrad
