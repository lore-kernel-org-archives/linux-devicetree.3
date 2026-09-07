Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4191DF27F
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788074; cv=none; b=Ht08seLFpku3hh0itT67dt8WsEJMdi5z/QinvnxsmbNml+lL10Q3JGDUMRd6BOn61fcZ6rItfa2MI+LFewJMSTAUIo+/M3NV96lsUZ5pHP8Q8tvxHH0dvYXHVQiZUSZw/RW+Fa/Ko6bcm1MzBSa8P8XDUhJAenjEUHy5ZoTWgDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788074; c=relaxed/simple;
	bh=oRUD0n8TDjAUwxbhtvsIcjMFzxikBabyo9HhFVuIleo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsmKshGSkJAQBRftBg+TcV2AAfGW2fMGcvMTxwotyiznziNIn8XsAW6DRCg5a5eyywOL8ZZgQV0bae4thAmxTM8XBDN8v4u3RuJJKq3da7jNV+jtgeSoaU3gJmK4yQGWKKjkWSxx3svFWjZlkIx+q7LBAeA1skzucNR7wI4HqGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2iA3b2Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdN5uCSl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2iA3b2Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdN5uCSl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An5On3862564
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IkfSStE7YmCOzRx8ifIvDbY4
	gsqbXj9bbz6lxb4vGBc=; b=g2iA3b2ZxpC4RsHCVH8Z2cCYug6+/eXJ4dIZ61sH
	LAmpkq0ffkmOEsxf+NVd0Q68p1zYAblZqCLuMrgzpnwRnS3snpiDuj0nv4Gq2LHr
	905vq9B3Lm1yQwbrsqaUgXaYie/2REKTzCjcrL6aMx08JTSOZf3/WMdMSuwM5OtZ
	lJJGEIGJy2rKhu37auef+Uv4WjFXlc9AgWWf4cG1yQwNyxFLRUmRa8uTS7Q+nUh6
	0mW1V2YNRnePtTIRc90avANmvRTWpk3med34z0CcCxHBJDpFV6NEsZxAx245rAk/
	pwDZEdkIEbgHjdxX7KkroC8JMGGdnT7qoF/S6fvLBqNZBQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66j1c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:34:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78bb7517525so207876137.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788070; x=1789392870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IkfSStE7YmCOzRx8ifIvDbY4gsqbXj9bbz6lxb4vGBc=;
        b=XdN5uCSlazdBqjKSehBogX8xITx754fgLpOhzndfPjCDOSVEP92a52+kGFqoL4wkHH
         SunNZEycDPtNQ1XvJ2I0UUzQiHs5G0a1hUS8Uv7xroa5obcEnxcJrSLf5zZB3lUnQbTe
         B5DZOSxbHNS1cacAH7+xwsgmBJ3OmObg7s2QcdJdraX+ZTvpudih4St1gvBSWlaW/AFo
         YDPdNw27x1n1Ng/hYrflf7vLU6hYENkPxnDma3PKFfavOGcAM4zkzP57Or9y+4wRXEMC
         QslOpnPNpWNz8Yg55Ox/5k/sUI8A3i95hRuKl2SDQzXP5d1LnBA39qyh97AavJe+M4B8
         dXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788070; x=1789392870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkfSStE7YmCOzRx8ifIvDbY4gsqbXj9bbz6lxb4vGBc=;
        b=XYoB4AfSmktXbXapaMCJGsM9CgK/xKL1Bdux3M+ZCCKkHM3X9wW+VocCe1huBPCWeY
         MAGxlOyqbpg+T0KBrBnF6LZL7XeQx22YizjPxnkKUR6gZO8VwRuy/CdWZXrY9wbl6n+0
         c3NOa+KJnKrLTNboxuku9owHSNdLml0gYZxPNGsp3/ytQvv4cGMhk1GgWmbUoz39erA2
         xvJtoIFk1HeDGga1VqWVLHzZN2e4ZXJ754DXUNkKGVx2GQhHAKZ9xTOENNwDV0i8lzgp
         FvjBmblp9MQXiz9Kb7ziMlVGmu8/KB6Rhl/A+EKvtooSK9Qmq3CKdoX6cxvU/lYnZscY
         Hg8w==
X-Forwarded-Encrypted: i=1; AKwUvBzVZRMeQGtj/Q4SaysAfPcx/g1TVVDziFfIEq5ZpP93SBi+595ktDEK5fpsWW9NW239xamII5lPV2g+@vger.kernel.org
X-Gm-Message-State: AFuF++nqIkaUbfKeXXKCdEG9THbQalOmsmkDi7xqBY7pYyjbMAI1Ilsv
	dX0kmBH4jRmAyb8Pwq670QCyrevdO2+N3awVWltBXyYvysfoSFT92muJ4hb5uF/1HKR0Ph/tBDC
	vzkDlta5aF1Q/GpPiCchrKbdjlxOGvxBsqMj0+Tn7JoTFRN6+g2e8jiSkDrzTgktG
X-Gm-Gg: AYBFou1zN8gcG+ItyC4wL/2DVWJBCUa0mq2tFu9fETldMrqwMtEsrN47wUCcW8wWrHu
	G50S/Nf0B2URmEX3NEsY4aT9FyPa4PwnUb1l39CK/QR39S96abCtZ0tJ3y/qR3/78OR+/2XDtDI
	PLFSDJbJsQedICe8F88OAGbh4hFb/t9lvNTJ5+qbPVoztISr/r2DqNoMpjwvNTa4HaT1eJGw7Zb
	UtFcnCWJCAYQCP7YYgynJVEETiuw/teuyS74bPzi6JJUoTmi93MpEaNUFypEvOR3HrAo+7Gdwtq
	YyM/hRw9L6HXOQu8e5A1/T0Y7lQofRPKehUvwdWOtA0r3lv55azTBDGj/vK8UbpEq8CtsdH9bxA
	6jTwsqhWxFwTo
X-Received: by 2002:a05:6102:943:b0:782:de7b:eead with SMTP id ada2fe7eead31-78a4a68089bmr7492060137.1.1788788069884;
        Mon, 07 Sep 2026 06:34:29 -0700 (PDT)
X-Received: by 2002:a05:6102:943:b0:782:de7b:eead with SMTP id ada2fe7eead31-78a4a68089bmr7492035137.1.1788788069225;
        Mon, 07 Sep 2026 06:34:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07a23e85sm193290965e9.5.2026.09.07.06.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:34:28 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:34:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: ipq9574: Flatten usb
 controller node
Message-ID: <hyerrktnh36crgapyim654dedsbhlu2k3tz7ff7dn4qybbijrb@tgrhu7mjcpth>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9ebd66 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=YHxE36J0psKEVs_6LRoA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: h6w8RHql0_riwlGK-kseXgKriuTBtd_K
X-Proofpoint-ORIG-GUID: h6w8RHql0_riwlGK-kseXgKriuTBtd_K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX37tVKunw+zAw
 1t/4AurwapmG1WrGfdPpH2fSMnxYpKsLSXKAw3xWMQDBltNPGxfjCQHYRPpeCUHx5ZgcIIt4xbf
 q6pPcoxOcJhyYwlA+RMQaj58blW6vdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX2VG9875dhrN3
 LJE4tx4IckM1jhLGnD0mU03WyahNhEHc2PPgEmUIpxsofyYlX9KG97EmsTdzreA//8X/S5T1X2x
 1ok+Vbf1SKblYESDw3FPPEyXxyCuSoDG+vut1cMypk8AnqQynfFTQ8rKL2qc6il8J2f71aIgM4R
 qwydBYDhQ3QbCmEjlAlFWvK+PuB0Sk3YKPrzWcPw8dmDxKxsPIzn+PQp3qAThAsEBvvv3cOsglP
 JH7qI/6FsTi4pzUtY2gc+0GeYYFjAYQOK1YeNFUBvEOE6v9mZLvji3Q71mMREt7wMqpZ60sFv0g
 rLNbLCqjaUlX+5BsCUmm+BL0Pt33W7/zafqWNTO9572Rd7bSG3c0hnvlK1uf3wfPQ9zcgJZMeJX
 pjBEnkBMQKvTqtDiGYBa+lYXbLIM5vmIquTnLB5+y1RETHlp6yuKgVAjxKWew4gCt+4jvC3Ceqn
 7o8ZhJLA449wn2gM09A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070150

On 26-09-06 08:46:49, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, swap interrupts for dp_hs_phy_irq and dm_hs_phy_irq as
> per order in updated binding.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
