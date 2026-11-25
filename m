Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603818;
	b=2ryN4gPht4Ii1wKp86QI+NmDw2AeUazAV+HajhP8KQtU9CfySFwUuBUeu+/v5+74v+R6
	 zYa9Zj7dmPi/K+0E0qYNkUlHT4yBtxywi7l7UjGfY2aijHnRCKU8R+aEj+oO9naCz2Mbr
	 yXvGwBrIPEv6dToGAFR1zwr9aJ3l6NVob1uqLi/K3FIj2doaeFJl0OnWEiPbe/8v4Jy9r
	 yaDQsT3Ic5LFjrFVzgCVIvSq9u5FGBLAZGENrfJdeFQ60e14SK2NjoZUBK7vQ1yVoY9ez
	 Ij3W2WomIqQ2e+D7jrBcjQrN8vR40iQX/IjdXNhS9fUH54cn5cvu8GXPAoTlmZS+9Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=;
	b=0YWqgLZBk+YNPW+htv+t3Iz5SlRc4o/DYdagaeoXMPWAZnHuATe+VAB0GEhHYj5IFuwB
	 YZBBZUiHcBBHDRaJ6qk6S1GSY/Uq1vT4G9GFeeABacZA7BAdNNFMD9smzYb2ZmKajrq1N
	 tzXpdF7s76i+em5hVuvazoooyEw8LhoWBaxBmHsPTMOzBlEkG+rq3udfIDFWQBMhAWHSa
	 C3vb85qQrxSqzqnftqKJQkMp4KOj/6ka2ifLIzPhSmRDvUqcCGMnNqVXYxyFjZ7CprJDX
	 kj4tvK65t9gRX20DVi72Hh6bz4ZWRa3FpqzzPfHrxtP7yz7tiR6c3fPet2gC5exQxpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5GGHLPR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ht60KZMA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81DC606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E81DC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5GGHLPR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ht60KZMA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNPe555490
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=; b=n5GGHLPRCDbvmpY5
	oQ1FCw3JrlHss9ehReHHP13EWWaOr7vdEMvf5N5yNJ+A6xU+lBOjts0zbtcqclRC
	ZrbMjX5IapYo8/NGhXiNf7LhzuqznK6thBXszY5ekbFGkSSimzZJhO1DtlggkdTv
	5W8sfKCr4ot3jn5CL2xP48Mssf5NGeLdr3jlSTk7jzkChGwyFvLHdQYTP0d7bk1Q
	YH18NB35s0qyWSvxBY+ugXp2LSE/xDpIk0BcZPwEw9EtIqVlkfnxNQUUCKaMeMzc
	qyvePOIoJv4LxXgKqNKF4J+mJYT+tzj/VlNzwS5mlRz15UCwfGzndd+ABdxBFMFS
	EmvGhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrdqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5476f5bd009so19082001cf.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603815; x=1796208615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=;
        b=ht60KZMADnBHxNJd6igVGoRVsL5YJe+sDS/W0ld0IUhpDj7JviczUCVIT5Y+7/thQ9
         xVw/1SmoigmKvILhdiMNQx54kVrbO51Z/4iYK8ppeOPT7Av+S3W0sUd+btQoep9czHmM
         +tjRMjQIeIPXxcvHwkuPEL2sl9K2pSAgKJ79VAgVflhi4+wAVWz5iJZEwIum3sLaCJuC
         6VtsvFE/RSotIeB5108+kE76JZW0qyyIewAdjPm9LkwIhTpnSOXfz8AKmioJMyiL1DZp
         RTfntkmODyV7dHh32x4SW0SWDIqImEwEQqFvq9CeeJJLmZue5cBJMqiOm20B2wPLvgAx
         nt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603815; x=1796208615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=;
        b=2F9aRrYuk0AQvUx5I1dumXO/Ecd/34hTuXbmaKFvXU+RgnKCcDjzdQT+i1JaSQy0Fc
         Vcx10zouS00zEvMOGODpBfAUiANJ6UfRgUqW5UWfWi8UJUHbDOoWjNC2Eov5adAcsg16
         zpAChN6bQQ0X4fFfhgQGhqQPXAYkyH+cR1pChngbOdotPVMEo2EoBoBmxZVOJ67v8rj4
         Wge4oy3Jj9cLtFJcx1BlXYxKCvuRI29WWAVHfSe/4roRhDzI2ATDgopnqkO4EAAbe9Ut
         Y/FHWnqPByCkqTl+OSVOHRQhPfuhvHSd9cxdGOfav9Fuu7F/hBC5YOOPlJrR+QUcasze
         mDmQ==
X-Forwarded-Encrypted: i=1; AL+hErEeW/fcKThVheSeunSstjmPVm0zfwmK8zRQblVs2nJUiPlaiVI9dBCv/sccItD4mpln9SNf7wqfoJ9R@vger.kernel.org
X-Gm-Message-State: APuU4Z8nLhXAr2nraEFbviHGMBUb9PGKry7QmLiWUjprfvxLcCpb0zi4
	j2ycIySUXTyRdIsLDOTQUQl8vyyaHVnC1iuyoZVE1wEV9koU6a2Xd2RLJsnI4cHVLYh0YRVh+l0
	NXRb/xLF+1MGtuS289i/C8ByZbr6sFqFRS8w5NPi4VrmryO7AESRJzOsg/QKyk4Vo
X-Gm-Gg: AZFdTZcRGXiKQXKyXRoGH7NBJmqwB7CwzHdbovksF6EaE9rpfyy2BgCA1tdPANz2LP/
	xeCsw1HRRgLNmz85eoyi1BQJ9iEhrMiioIwbYA0yYpTnY7f4/RnXiuajIWhTo9PKPllNLZU5A3R
	dd4FF1UxxrHqaJJi5h+mn9du9OOnBXEGJRRfRiWkMmzW9Nv8umwVp36CVNy34LiyAy+eg11HmA2
	PS/bWrFDG6/FTYdzVnXGYbv1R2LEN/VyFFjkkFSKmrm/epIoywGJTHWyfDms+Vmbvqn5p1jBVuM
	VYn5cESPTI1JsLe/V7UKpTjBVPFZUsBi6scXYZxzUXO8T14VSi/eGScJMIjXw7o0hQp612t17vl
	qSJmKRtIy5WZhLOGcrQIBZ7I24Ve+TmRy+S6QIMdORZ5/IyDH7FHujg9diY+w/wBnUck3zNc=
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr17324761cf.1.1795603815287;
        Wed, 25 Nov 2026 02:50:15 -0800 (PST)
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr17324401cf.1.1795603814869;
        Wed, 25 Nov 2026 02:50:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:14 -0800 (PST)
Message-ID: <57fb06f9-8e64-4f52-b32b-7987eb322cc2@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:11 +0100
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
Subject: Re: [PATCH 01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-1-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-1-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX5qcTV0m8DOvZ
 Ac0HObCyWobA6Zb6aSyEpEvnXpVVkcgFciPpU6bj6SMHj/V4smQmWIlKiKMGS41mBmrcHFQoeG6
 JzxSbHl9GuKLk9ubdNPF4v1jR2OsTmuGZ0fBEPKqJl0BSaFyIxodNzqnn7f5K8+YpYpn0aJg85D
 v3adDLEoLeSG0WJKYVnn8kOpiljpr4SjKMvOznnMczo+mcslyNPrXKWH/h+kdj2/sAviVaWXJNT
 pPn7RLZKEinJSMwyKOn2BrvTQnGkXGzuEta4bGu7GaiQf6VKGxJbgeLPGeWMPHg7hVGcE9EjBiv
 DjACxbKgSvqbP0nywWgYfgAmVZDo203GzcWo4Gx/0K1QGVDhEdNaVD+qxR9ZVHpph9grpdalFWf
 M+VaoVfp42CTk5vMBz7/d4sFie7eCSSqMcYTd0ucMeiCQwB9mAic6ykAMcAkpSaCBx2OcGYP3Q8
 NinzLseFp9TlCcc4wPg==
X-Proofpoint-ORIG-GUID: tAJCXYbjtM1gkXZTQ5tHakk55eNFn46a
X-Proofpoint-GUID: tAJCXYbjtM1gkXZTQ5tHakk55eNFn46a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX9tGB7NjE93yW
 SbDg9Unyv4oeq+YbXYHWb8JDjWDTOARAGf7JFb/t7uFJdkPl7crfFAgtop+iagNuETMM6lmqH7P
 cUHufXbNvvBpYOOppGJp8uPEg+iJxyo=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06bd67 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=y7CeRsGPqHAPMiWuVMUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the sm8250 driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: b39e9199fbe1 ("pinctrl: qcom: sm8250: Add egpio support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
