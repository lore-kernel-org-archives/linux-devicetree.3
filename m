Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122E751B18C
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678755; cv=none; b=p6WKtXP0vFereIDMQNG54Hl3q1T+5XVPpJbMzK4MPoZoK9OxKPyYJkbYnq/owC7JsGxHabJ4rGWPvWWmj5XN/92G9KjMBI6ioEqeyMffpH71E50wyg2c/Ga9MFckfIfktg3CQ8xBxMpff/pgt/SaYhXI1511Mx2A7XYEhRfwdWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678755; c=relaxed/simple;
	bh=7oAh9n2HNriIc8pQ7EX6gC2TpA2I2Y5UzF+0ybwLhUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4AUnmMqjZSFcCqgQVrz7vI31dWG0viz3OjA/wG7gCqq2lkAsoZ8V8TEBcXUH8jC7oEn6bvCIbSQLGHdeqSJ1+XFTW4gbaRiMCNooA1KdS6DfNumsXYG3q2R+yFWptWgQQjO9zxgRwDcarCZAAGIejrqiTWCScIUG14sAhxRL0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFM+X9HH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7nIToJr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFM+X9HH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7nIToJr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAjBL43011324
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=; b=XFM+X9HHocuN0I2p
	1BascmweDqw5tOUGaSpmElzjbVtSOBxUiiZMS4RkG3j6bXjtQV5sNiO+Oe/1QTFe
	bA+6iL1pI4I6Uqq9RRZx86HEmyLl2M1QZH925wxjyDEIaKZA4TQhZVe4jmydresj
	prJH7sX4y1x+pyJVa27jskfgAJFWoTQ6M7kzFli1kjsrxtBlCntks54r4+mdeZBm
	OXR4jJyKu23pmg2BRC4pmVQ5wBVKEzgaIoutyRMOdH8NEc712uveYpFwjwahqMZ4
	3Jak2AVkIKyFtYfKxXZXGauuR3dSW7iKjubunClTZyoaokIPPUsaznBcYMStZbYS
	4vTwsg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mna8kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:45:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so7562961a91.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790678741; x=1791283541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=;
        b=V7nIToJrNdbF49NgdusCVmShH50LT9NFLf8kyioi5bjRieX4WWLj9TIHsiGrbiirCs
         6STD8fU7sy4AB0yQ07cX/t0K5tHU6Y++LXPIs+YF3Oj7uj5yM15WpR096E6C+rl4dN9r
         +HFrTJuUwOtZbhkN6TjIxHxKekgf4iKOns1LSMYdCZ6hX3yAzNwvEEiDs0TfPuvaKO2V
         u7C0oXOiuYndEV+/eeksM9G37MYzjg4sATaLxLEEMPbDwaQviyPNpl20jI/xgaIO4Olc
         z9xXiDCZ+ZaqefDVhdqImBMghv0FyaqIpHGZ7h6uhqzvkkVh+7D0U1WZc/STwtZetxoZ
         ZXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790678741; x=1791283541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=;
        b=sZOYpCs9EJpQR2JeBfO54yFZOyEY2oHycU3qSTcr/OY97tVz9A8lpgKXgWRX4MIn3p
         18ynLHXzM9Gd6P4WGoq88tq2WTEodFMZ0SQNDQ/5rPaHH4kiU/6bI+jup779lr0Nyb1p
         SQXSZ4lNk73A/O9yeROfBidWDFGpGci8fNlVXYOTTjn3dASCGEvBVr0C6/cTiC7xFi2J
         xh+L1m1URjyETbLN6tsZU8og5bQZ8MLt9hIGmu3gDmoI9UogcudGObBLfF/pUBtp4zDh
         02V5lwQzvad6wl+MkyeO5ROrmRSxtAIyBZ4y9uKa0ZsVowMX/PidBYLYElb47PWoZQIS
         P3/g==
X-Forwarded-Encrypted: i=1; AKwUvByrUzcIPSLuC/AiPRZbTWfzlr4JsZflQgoc20rkZ4tfUFz7uiFZvhaQjBNATgWTdBV1tdBxS59gclYn@vger.kernel.org
X-Gm-Message-State: AFq9FYIJXnq0e6wVHE3edka7PCedUhwEpty9G3oXYQjLzTDwetTFTE7P
	jBGSkZChRFa4vhlqDIVgA+1oaneeEnm5Wgg8KSoFO7OfLqptYKxq6OeQ4hFQL5AsMXr4EMO5JuS
	rNFzU7ZYKpguEZTECpDAGbEVXHk/1798vL/yquvU9SwGqRyoGmEpGPIKq8eqzJ2Tv
X-Gm-Gg: AYBFou3vywJOqBOiP5tsQGToS0iq7GrhBpXsTQ9foqoaOrCUm7Uoa5TOcuTVWgO7zJo
	y0yEjd58LeBvyBY6CkOolSZbOAK9264FASiiJI4JpMLc9hGBnCmVS2bhg/moDXsaaPwnfFwE7wb
	SrgP0QcxUAtXBkDDcjvDUVVzFmQxYyvMbKyzWw+g4K7Qn5e8XG2zkaL/JiLyN4mm5zYWRTN3yBD
	YP8Ks/uGdC8IdWAXfuvVHgLjg4X3IUoibTNstF17tuzy79scAfmOpQd1a8Dhj1KViobR0Bp0moM
	JtqBPHsEtTv4Mo7iWQ5QMoxzJP4C7XJSN0rZCYAhj/4MB2boF+U1pI5rvW/0tSSDNdXkauTjS6B
	JviNT8LgSz9xOldojvjr6UjCJ1LIZE1EdnGGe3Q==
X-Received: by 2002:a17:90b:5107:b0:3a4:af1b:46cc with SMTP id 98e67ed59e1d1-3a4af1b5358mr412418a91.21.1790678741234;
        Tue, 29 Sep 2026 03:45:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5107:b0:3a4:af1b:46cc with SMTP id 98e67ed59e1d1-3a4af1b5358mr412400a91.21.1790678740782;
        Tue, 29 Sep 2026 03:45:40 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498057a62sm4907530a91.13.2026.09.29.03.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:45:40 -0700 (PDT)
Message-ID: <16a6c858-1b75-45b5-bd84-3779deb0cd68@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 16:15:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
 <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
 <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb96d6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=uVyU-rc3LnrGhSSI6FMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: PcOitIHzvexxCglXUVdEKaj4tBbPwhgY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MiBTYWx0ZWRfX9mj0tUxAwciw
 Ulp2k8f3O+ZY+Vyid5D/4zsPtkXBZgXQNVSTVWfVgQ8Jm3P9v6WRTQBFCWawgP2IhEiI0aa88Xn
 uXpnSVBYxpr3pztUcfgbVRtUqn57E/A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MiBTYWx0ZWRfX1FKDs6+LiH4m
 qGbsJK/VS2vvSynV0u/UNsa3bc/ElMr/X+ldBrbCP6wKEGLiLlPyECDzJT+qzLJ7+UTztp+jNWb
 dteVI0HyJxRgxG5UHyFQ7Ht9/hV8lZIxS9xfkxXAkKtYZkUj/UQGZ735qKLuzrTsblU3BurBo5H
 FJzMgqptNgls5c2ihIJadbkMWdDg/ZKSPRWq8I3MJD6lXGEW6xd2r3RAFZOTjZ4tf5s7nlzITgM
 nzRVcFRLOw2QbrLh/2SiycuMwMKbD3c3nkvdsXBibB8mfsaH6zVb0HXu0lzODsqFazhU3NjzQXG
 STCPIlZY+AHSxS/kAv7nBAXC56Wm57wpHG2NVK8lIyJRsmEwew1v64sh1BO09fQREFXvsJEj1aL
 7YO5hcgCIOK/venr0vEgSxwVIcTPUcGxldhGb3IP9b8VYe/9HYOdheazDvOtYCqFZMtdNRiwPnT
 n5vO92H8Oof/y8qzpUA==
X-Proofpoint-ORIG-GUID: PcOitIHzvexxCglXUVdEKaj4tBbPwhgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290042



On 9/17/2026 9:05 PM, Abel Vesa wrote:
> On 26-09-17 10:07:31, Mohammad Rafi Shaik wrote:
>> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
>> front-end links to backend codecs.
>>
>> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
>> the QAIF block. Keep the node disabled at SoC level; board dts files enable
>> and consume it in subsequent patches.
> 
> Don't mention subsequent patches here, please.
> 
> That is not a good enough argument to disable it at SoC level.

Ack, will fix in next revision.

Best regards,
Raf.
> 

