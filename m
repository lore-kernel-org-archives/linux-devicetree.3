Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623469;
	b=EC8KIHwBITp3WpOPBq6nt894/YiW54e2Qv8vUCStjwdcUUqj5f0mMK/1Oijtz7Tg6HOJ
	 nAZNPuqTvkkwdDYlpIswQWLaLjj7LzPC669vhteVQO2az2vjaNa2GlQHWuFmHuKZzVzuw
	 ZNhjKcdGmNeaL/DQIsPq4ZhWWv7mb8vrDtlPUJlkQAqL3242okGozN0729EmiKwRV9pLt
	 ztc7clN9aQJqt3gbw+NRg6JQjPpsFLyRzsAmZBE5YK9BVJSX6B95BryfDWDkvNVmjHl4H
	 UJSO4OwNGRHq+nQxTPjfeXCa/FNUNn73kvB0oxsqDAFJAJKIr4dhkmV9YvpXoYxpLDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=;
	b=SGDi03D+9YdFLNer1uRdqFIPk2bDHmCxY0vIMrWHIncAvU7pkOUbYqtH7LoL+m+fcON0
	 sYDa4VDf5xLu3Su0EiuLXB8lUelfoBzGlDFRZU6J/L/jfk7OyDADnadXzWGZtbZu/HxXQ
	 GKYhNWLDHBy1OrRm+9ZolyhzObncZtEXpZhSqtzk95tvns4/8qihHrUcmLRQU7u/J/y1z
	 aiyuC8CzHQCqyZ0MQ28cttkuwiKXFfnVX3OjUzChqvQJDZxluAmuY2pSomuNPuvs9ZpYg
	 9F04AVOFXbnUoOHjvzfPNb2ceNmsl2wr7nF5g3os5MRl4VrBQieITJNhFSufciB+6mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOioltV4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A7QlGTJT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C0960A380F
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C0960A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOioltV4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A7QlGTJT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1jI3402501
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 12:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=; b=EOioltV4rTXNoKF3
	ipmP8gz3lEBkTW5wy4eLvI4Uk9sWVyL/sio7Fh0GJKxk5fXSaL0VhZlQ37M5gKkl
	utI1djX5mcfcMR2+HBR7ym00h560mBPHQ18bsMi/7RC38I0QdVzzCaVslhFxPB8g
	WOQ8v9kMSmzZEf1Jp88whqKbJ/1aklD7VKWlFCwzgWhsfVoWp2Oiw4bKNw404hw6
	HfrnjxMrD+UPUO/PmrzmEn2hqobqG7OY2RbeXRZ+2UxMZ06IrUJGvsgmVvVdvgaB
	C2SVui3qlW+SumQ0SbJk3E6Qz5H/SzHMVgy3dcp4nnWhlThLJ6KEXmc17CFlcK+f
	ur6lYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe94p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:44:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5350173dc7aso7946071cf.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623467; x=1794228267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=;
        b=A7QlGTJTg1R7aVCIxrZBno96wyT57p9MR4SyTVob30EUPPSoSOrERvCYWxWjWVfxtX
         vRfgFikK0k5G76xM2d4jYhiJymFPWnXigQ1jPCl3iohwDdiuO2MttOCSMRve8gRyM7Mn
         nhB87XZnpJqf3ciYGDiP7t6AUdFmZWBM7hpdN4L5qTZBp45kJuVLplZ1N2q1Ar8CSF9p
         D26ml7GQzQ3RGKyZHBgso6ACO/zP+FuGRWVGvM7B7sMU8ziPFRvxF4D1uEAYX+lVnuHg
         HJ5ORisL/e2+33bdKsNvUPtFIJTRXbMwLOyRR3L4NCJsQYP/l8jLef0Ele42dGrM2icI
         ydaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623467; x=1794228267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2IEIbjIJXVuOp6D5eD8OuUuoxSabHhJvcs0+CWKwqGM=;
        b=kEQ91844A1OXp8UFZQl2BIuO8QVY5ZFdAO+sh44sy62Iufpk6deZ9wxASYS/fM8QEX
         t8Lblmbt7QfcBKOk4Ch0zQIJLdE2IQxdxTlzA6RK/sGp2b/Fs5Kes/2cWXg6t3MY2W87
         o4qMp0WDsVVY8mbLqluOkywM1cQcrTPnB2fWT6tzZxwUrivYL8A4dJY60WxK+ICq+zHt
         tPYklT+DYhAOhxzl2AQjckOzZRdLnAcw6dJFYPAo86ACGz6XzUXLqBjShfo8fEJ8vBqS
         aDwhVL2JM9VKyDpC/1wOXroAL8WIXAmDaqn/UYj4FcU9+0AGhVyLCUmRM/x7D1pwm1FQ
         P6pQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYcVQYdb/VDIBGRu7o5yWRUADH8/iEpC2bPKJ3bsGZsnYkOZDexfhsupERLujO+TpRWx7QsjvVmtb/@vger.kernel.org
X-Gm-Message-State: AFq9FYKt4uXwqpIwh67IQwKuC+OvgYUTv9cPgXCaL3wHVWhsZXFh0dix
	Ok7i+aimey+PN26YaWH96Y+FYovPasXVhoJJWYG5b1EZ36qAb8P1ZkNiBGM1CK7eCEMlpBet6hd
	J0Vbh0UnNXjubU+yUKw3zFMjeHs1C5VtgmzJ7+fbMlH7TF9ir0JzB+WZRJeTGMe3L
X-Gm-Gg: AYBFou32FxzeWFi8tNO4/A5gbAcOEeF+y9DK8wt9yVKwIZSTP+PnwJpif5GetRlhOBz
	0Jd7Zzi9QomrD6HwWNsd+4pwVZOLayHnhvhLNxf5veocTn/rnus5fJ3B+UtiQtWnGbrqJ44ZlbM
	P0cXXMFOG9y3VUotVc8o0x0CtF2YKzIlQILGTKGRqsScIVUlABuJWgGyXoKL8x8JYhwv7Y6K1X9
	JV10QzD5IQHiwRrln9tOI827zhTQ0cncBDwKeFIFMdcG98NwIKQmmh7DUUi0iRma9EqkBSKTk/n
	5xEV7wPjfKl74/gfhdBbBKBgwWs2DY9qQYfIenF3VaNa/fNthcFWYu/1t4JdJU0Xud0owIfkXjj
	OjeyH/e3WiwBDgkpC05UkgISmvHmjakG0Uvp5Lxv7G58+HKSi0kEa3Y6MDKvPoe4KF5oJQbQ=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1564909085a.4.1793623466918;
        Mon, 02 Nov 2026 04:44:26 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1564904885a.4.1793623466454;
        Mon, 02 Nov 2026 04:44:26 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe101d4sm389225666b.40.2026.11.02.04.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:44:25 -0800 (PST)
Message-ID: <73f05be8-6335-4d48-87fe-71ba5fb1d2c6@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:44:19 +0100
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
Subject: Re: [PATCH v7 11/11] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar
 <jassisinghbrar@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-11-ad748ace375d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-msm8952-initial-support-v7-11-ad748ace375d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae885ab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NCdQflJRAAAA:20 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=MxLZmUXcRv2kY27zAqIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX2VvRm/7LEHLa
 DrltYJyA8xjIVVWFv7ElpNt+U0c1F2IE9vJJ0fwkZpgSdH9vpAPKku+oNCPGhlzKK2Dg4/1M/t3
 rDnVa97pdaQiUXIH74PlcGTtTSBbjTZydh2d8UWUhyJps855A0Pj32ikMmiv3qPu2rqHMc74V/o
 LLHbxKRFYH7XxQY2Go+JSDhGsCpnZ9NsBnMM7Lcy7g/RUoXz/WDI1i/6aj8zI23Fj4LkXP0Whg2
 39wRvi1B2IBX5IM8Eh2JIWUsEalKb6cAU2dJdxca54ZN1mENNVem09B4ND8yQSzAdn3J3PDcvEK
 V9/VSCiiegqq/h9u9jixU8p2+qjK+zasQMBogs+jgAb9hR08X5gZuyVxh6DeENRBZSgHwsf/FMA
 ygTRfC3uxtriFYeqzof+molqM4gRXs5aXBy+qSSKMS8RroCGF7ofRyRBIeuI3atKGsBL9aVpqEr
 xYf2DtR6wpIPM4NzE2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX0q/3m6lWyigG
 byBXLriL2K/JlL/X0T8kak4ru/kFVgtcFxxZ6IuLJ9BswQoc1GAeNqgRNRh1D24d+1zNfYlGxNN
 51GYBQhqHzBe7GdJSmnFFyuUU3eI7iU=
X-Proofpoint-ORIG-GUID: whNx1o0BBQgjokr7tJ0gwFMjnoTIJHGv
X-Proofpoint-GUID: whNx1o0BBQgjokr7tJ0gwFMjnoTIJHGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 10:02 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add General Mobile Shamrock (GM 5 Plus). Shamrock is designed
> similar to L9300. Downstream reference is [1].
> 
> [1] https://github.com/Asderdd/android_kernel_generalmobile_shamrock/blob/cm-14.1/arch/arm/boot/dts/qcom/msm8952-l9300.dtsi
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
