Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AF739060A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425439; cv=none; b=d7nJkJ6YEl+h5JRcvL0f4p2wtSvnQvcEetvEm8YEA1nXUaiW9iOdaVSqLAFc8xB2T1SzkLJP0XVvBkB4CE8aXB3TWrXaGeQeLTh6OqfpWbbkRpbKak10WxNM0EN76JlCJDnJWJ0fwun3SmRNOXe+vzF4Du3b7UUyjT9zjbv5SXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425439; c=relaxed/simple;
	bh=yvRA6+RhpqKbBpG7vuhCaw8flA1Rlh5NgzfC5O25f+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGC+n/+E4M05/EZyHL+J22kwdYopYsbYJH+8m29Phd0ml89QUJO9GERfbu5IXvWVcHXlgmnU7Sq5y/j/I1ZJk0yLtSZBYlJIrz3cc37lGLX5tTdEEPnr7uOxM/PjeWdrK7lbJHj9aZtYkrOY46Vqdly52R9Khn09wHdNVe9+5KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nx9e6pA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QE5w1MOR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nx9e6pA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QE5w1MOR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lTjO3749489
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 08:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61ALK7PnCM34Vxnk/ZtnoDcsbGV97BxWP36hX11Z9IM=; b=Nx9e6pA5Lf9U0cjf
	02ESwiiizuR3tzGVYi1FxMJ3vSW7c95Z32Wk5jvxhM++h2xlKT8MciY8HqsDQS4D
	uMvbyvB5+dw1G2bDYO5w+q4u9cQL1tBh9muvPJV1WX2aGWL4MsyzIZqpnXKIvAFb
	Pd982xeucypNlYMW5fzturDSj5SAMzxPQbdUOch989M4XSuDqG8BMfaeVSqDIzOf
	VdVBldJvfPSPCexq77YCE/sNsIwh27y+SSM2xkoiNMN99287XZdekqgyRCMS/0ev
	ozxqPFgKmomtMxFp0q4vrGeby7S0pwLI4ST/IK/d7MkeJKCGq/iSubyOXWP4S+KX
	o3NvVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5urvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:50:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso51373185a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788425436; x=1789030236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61ALK7PnCM34Vxnk/ZtnoDcsbGV97BxWP36hX11Z9IM=;
        b=QE5w1MOR0OF+mWTGiooj81jasZtrTv8KbV+QSGZaK2Jw6hbyG2Ys/9qr4fV1z24ujr
         9Wo6z1FTdgG/w5KJJLLsh6PFNxxcdQUSDvptuBf9ZCFvQry5dKRHv/M47VrD3I3Z4el8
         AljNMtPzQyY7rHm2fyPn7xe/YmdJy/UPPPDfjZ0m0WCZiF45Ld/IlsZC+Hcy9JsvsxXT
         BdW71z5+H7mvAL0izYaw0V2SHV0lHuMyEskqa6jnpearRpC+D0GeGP5/kEn/2X9PqQPo
         VtnvnwFaHqSfOL0uhqfAejUspmGCHobxKmA2SfcmtA36cz4VfoO1MOD3po2UIeAkFu5X
         SzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425436; x=1789030236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61ALK7PnCM34Vxnk/ZtnoDcsbGV97BxWP36hX11Z9IM=;
        b=HENG1aI7XhozMJceMgIdmOmh723USqELMF+bi+BSxySXZOc9Ys5fn0JVJiwdWHXQn2
         +aXYuUcfUbh7JRuceAdLdXxWd1kCk1r5A6rZRYg1jTGWw5pXF3mbHWguGgxfchHe/YiO
         YFM6w/vVYqE/nhq5SNKIOXZvKBeD265haGhlstiMH5LNamr34nuJpQvAMtr54EfvAbhg
         lE+rU8VUbJw8VaOanrmkvoVM7dNtBb/Hye6HG2ka3IMclPH2L3tm0K077la0/gYtKfX+
         cVSlCwLvgTXw9/3s7KWx5siEdaiwBPkgyHiPYQmDSM1LNLs1ZPCE2fpZp2d9C0L9Ww3j
         QFWQ==
X-Forwarded-Encrypted: i=1; AKwUvByMYQ2MqDUMcAArINHCiroKudcDQ2L2RpVZJxwef3fD972pkyeLH+P+Ely28MIFqiAVOj3pYggpIDwi@vger.kernel.org
X-Gm-Message-State: AFuF++l6hRHpxiTB/+KjaDa4buf2lkAnd8zKr5OmFUPFNbYliVmM9/gl
	CChOUBYAnky8GRssNcR783K39Bp68Fel5dBlpg83oBgWYO/PitqGdvAHZMEb6yK/6ZQXCWw5FDZ
	wVshg20grufqNKzsEjPflpPzI/tRxGqGsEPn3+t1hcCWYZ7I+rO9i0yoWKdAkmj0k
X-Gm-Gg: AYBFou2YIFDuBSn3Dsuvg4SkwegahYBEDILI39/lNnf1cJMSrLDZDxH3DfTdehlBDzE
	qf/iJQ1E3Gtm4mhiusN1x2sGfjxx506z7IajBVt/AK6ihl/Wc7+Ocjrj/8MnjLW4lF0uUrPmANg
	nuSWieLF3FHgoc/Mxn1h3ZNvp2nGIZz+NUb9oiE9okQc2rpzVoiWKDeH3S9rIiC/d9rmLfzDHo9
	9rKUZvtNNS5mvCwrmak9Cwi7Vbq2U8D3jV/fzo/qpIXR1xCfpvRBpk8Qce1BGP+SQiAJ5RQWR99
	/AXAUSI3BdGotfwrQi3faeTzM5bte/IUQHuy0t4w5a52baon8mfZWh9O/FgRjWLylpOSJXpaGrP
	bqICCbqXcU2kCW5mK0UqWPQ==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr738045485a.6.1788425435804;
        Thu, 03 Sep 2026 01:50:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr738043485a.6.1788425435305;
        Thu, 03 Sep 2026 01:50:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41733b2sm67614866b.17.2026.09.03.01.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:50:34 -0700 (PDT)
Message-ID: <6ffd13db-1ca0-4497-9ad6-fdb65b001dbf@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:50:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: kaanapali: Add ADC support for
 Kaanapali boards
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-7-9c49b2eea6f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-pmic5_gen4_adc-v1-7-9c49b2eea6f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a9934dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=T6yAfy7FHkEd-x0P2_YA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: feQ3VvsYa2a8Xlf9q4BYVUE5iZVGzgFH
X-Proofpoint-ORIG-GUID: feQ3VvsYa2a8Xlf9q4BYVUE5iZVGzgFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX+6CChc//nRys
 tQu+VHaiaSflh9vC8bByGIWoMEecxCwLRankotnEmT6HBOlUUFbupmMwMWkMkW8+11O1c36tDfe
 uiOvKLaogGiYB9OaY/SaZsWvA2bQh8gjcsSovhSi2G2AUMkbCOwJd6pHp1uijQNOHMP9AoYpy/A
 CIXO2ASnDIcqdZzVH25MH4rZ7de32JknHsuqVUuHCUQgL6GKukgrIkH5s5xaj6va4311vjKD3Vo
 jLD1+o85437Zx75V5OhkZePH8sEV2PFU9xyVuStF60V2SA0oqSKcMwIr/x6iLpNuEadiGpZIIgn
 SoNnuIDdPkDDB0xAxRS+wfngVH396Irtg5BFUddDIJTc9423fniZZwRio8DnD72+bxRFYT9TH+s
 1FR3FhNF/GF6MYtgGiT9XblKAdmpO/7v871o+lZY3h1CuXchXoQofC/TaSRLj9mOU302D1nrz6R
 VNwkzivIYgv5/K27Vgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfXxu0KKG8JJL6S
 LauLGDN+Ws3gMOyEb5cxxx3HxLb0f6ysmc96rlQMo56BBJYk0vqsrpPamNDY0pel7nyImVhw/46
 m3wsh5SDUmJLJG5PJbEs3Z0/Pmw1blg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030075

On 7/31/26 8:06 PM, Jishnu Prakash wrote:
> Add the ADC channels under the PMK8850 ADC node for the
> other PMICS on the board with ADC peripherals. This includes
> die temperature and VPH power channels per PMIC and channels
> for available system thermistors.

[...]

> +		sys-0-thermal {

likewise - sys-n-thermal is unnecessarily cryptic

Konrad
