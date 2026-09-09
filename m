Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E1354B1A3
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955074; cv=none; b=TqV3fQaNJ05DCnzc9ncHUbTFy/ymOXG6q0kqWT2wBvTjPQNPeTd3N+Yss5ALh3QFuXVqVCAlxS4WCzpVLlAe/U0H40l6xlYY4THbve0WAJomT1hbDMuQ6nAv3Wrec7E/QAgEjxv/Lq6dmUDAwR+z1KrauaDquaIkxb0EmXW9zdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955074; c=relaxed/simple;
	bh=lvHuBtyH8PU7WAC9E1zAzmSNFh7r/i19FyIT1zoM1w0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofCiOsjMPIqq5lSsGivMe/aKOfVt/wHKd0LWukeltlpbTusZvA9tcPZ60tmNUFTuL1WePPblstNCZWMo5qWQaaQ4t6T0VqeotCSN7BLr4mYjdLrQFHih5poDpvMR6CITzQgEI6QLHW1qBAQ6LZyXWz27xMP/7a5435I5Gyuq3OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5VDNKJm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7d05NdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5VDNKJm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7d05NdK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU1471723043
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 11:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWcE5nOjG7EYYp/TKk7d6uZY3yzA0oSkS2vdFUfogW0=; b=k5VDNKJma4gx7N2M
	bNVnCgOFRaeXbZzGItFtTmYpTv/gBSXOTIG+gOJ7tCdewnPFmTduVh4Cg6/dhKCY
	HAhJQyfQiWH2DVRHJYIWRKz410iLNuLH3u9cMEE5y8VxB1SjQ+CfwTQ7hfIYCZSa
	2ge4VK3Jzo7OsRA8OXKd6Hfr1xLTr8qzkSdW/ooSf2PoHtEHuD2vgvzlw7GpDv4X
	pqIUG8ZhkLV9ezcepSAPRlJSzXwmlhY5mmaLuqiSpLS3wNXu6utg2sWnZ222Gsfl
	dFhdO1kamLsCmebm1m9or8XcSM7NRv9FfubiUSS/JJUsvPkfkzJIxs1MCWPe8eRx
	2O3Oyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrdqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:57:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9310484c005so79579285a.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955066; x=1789559866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWcE5nOjG7EYYp/TKk7d6uZY3yzA0oSkS2vdFUfogW0=;
        b=W7d05NdK2vN/4UcB/qULgclHGpIR1trFS8pD3PP5X6TvlY0hFXjKMtH9rCpTN0I+lX
         1tiEWjj0mWW1ylyh2BYhkb34vol8CI5mmytYag2xF/7FtmLq/80oxE2201YtKCejrrRb
         850uskbXPlHFcr1/PAE5EkkXwpossfDVJ2QjWEVlX6vsVg9gH+9a6+p7eq8vR02yjJAk
         4AbrEZaNt+VLBxvDXYXkdPrIym+8aUyRYTBzy0DAXlQ4xX66rU20hNnCJo115fgA0Dyg
         OH9/gYEiA7ayOuvmNczFGrhR5onfQKNjpL+LEWmkeM9ENjyI4Korfzv36LbDCCN5pwvt
         4CRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955066; x=1789559866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWcE5nOjG7EYYp/TKk7d6uZY3yzA0oSkS2vdFUfogW0=;
        b=IR/+Kh4sigoYTpmh6DzZpFGxX7ZXDfV6/yjYntrM8UepC0lViMfz07ALndQoIJ+KRO
         8b/cKK93F/37UzuqUvUGWO4XX7iFMzK3/w78F1wOnvYv0hHpec2IOYJ2KvwEom4HO+Hv
         HbdqHSeCK8UBJQG/Cei2JsaWe+OGo1mUll9WHgBGq5hYh3K0PjYeuaRYnWkvV0gjuAgB
         319SQIOsfQYY+zGwiyb0Po2a2NT5dnmHgGr4s8P178/uFbu8xMGkSC4ow3hg2J5kKT4y
         VNo5BiSt0SeIcF9oebxV2Le9u/FFktZN6Xd33Aw9F9PDyGAY+CSo+1wqls/6Vg9J1pvI
         AuPA==
X-Forwarded-Encrypted: i=1; AKwUvBzAkQClNhce9lpzaCJ20J1jRTmEGOSb0IgOn4SkeY7dRXjCTB9JO2XpJ+it5yiOT8g7XZTe28jzvoAl@vger.kernel.org
X-Gm-Message-State: AFuF++kbfTzVCqbLCciYr/+lCfzh9MtMxfKvBl70OAtfLi01trwJsIGY
	msUt/STKjvMjUj7Efg+/aexMz21UVUdpN9Jr23MKlLz4ka3NdRiFY4wt6ix7RUKfy6maHkWZliI
	c6AyzPtPVv+T3i/H/2JN+W+hbmWaxBW43K3F1fbAs2w5tSjeTils414buTI2xAJ5T
X-Gm-Gg: AYBFou2up7onPC2yCpLOOB8QvX9TIyWyEN1kHZOMf6fxp4x23Qifuscze+Andke34OL
	2esHQt23I4wspgvOMneAuUpLW4yhy/iuru+2kACsEqvcANo6wGQqoItmAap1HpSckdRTagSfz22
	wbaJQpk7l73FNueXjX1LcXG3E2GELRshv2iLpzvEAHuT6VJrkXQevhihurDPqCnrc2ld+xxWM64
	NQoN4z8V3uJ3FzJIYNPil5hxwm30ePiz1iTHGu1obUFI5H7YSws3JCuXvSScdWZRLqd8qk6OCrt
	T2p+l7MqhUA+CHct5WJ1H0UzGlVfNyP713TjapFVrYAIe7nDUWl7d5lC/9P76UIejnNSVUptCQD
	30+4EyPmb4n8iNwJj7qrBxw==
X-Received: by 2002:a05:620a:9c4:b0:939:9205:4d78 with SMTP id af79cd13be357-93992054effmr1798995485a.3.1788955066426;
        Wed, 09 Sep 2026 04:57:46 -0700 (PDT)
X-Received: by 2002:a05:620a:9c4:b0:939:9205:4d78 with SMTP id af79cd13be357-93992054effmr1798961285a.3.1788955061188;
        Wed, 09 Sep 2026 04:57:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a94f2e167fsm1614641a12.26.2026.09.09.04.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:57:40 -0700 (PDT)
Message-ID: <cf856c97-ea82-4a33-aa9c-57cd317e5b79@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:57:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: glymur: Add ADC support for Glymur
 CRD
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
 <20260731-pmic5_gen4_adc-v1-6-9c49b2eea6f9@oss.qualcomm.com>
 <52c023c0-a61f-4116-851f-ed19de4d23f2@oss.qualcomm.com>
 <695dfc01-2c1f-4503-9049-2ae266774ed2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <695dfc01-2c1f-4503-9049-2ae266774ed2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _uPWu_4UtHiC8pqNqMemgXNZHSrVc0Za
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX52ZPptTmN18K
 mB/U4wZegpgiD53rWS0k99OA2WH4bHn60/jvxqaWajnouYdqNYpZU7O5MsOlpbG5Fx/Ck4OifwV
 5k3nblp7JWg7OQnjtRDF2mgghsbUvWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX6470dXarBb+2
 jkaYeTC3SXw9an7giB3hAZpkq9WY7TTMLCP6EwrMWr9u03q7/DCqOj31LNrV1CJU7zwr3qg4s0v
 eNhveVophxQd6ytick2D9Yc0gNXsI2OoZqP//Zk6IsP/HTx4J8hkbouCfTLYiftvLCogQATSspa
 6UkdOGgpZtZLV65+RJ6f+MGgqo/NralJRiv0XnZ6cwen73llgCfttQ+zdiNFHRbbA9FHVrlONOm
 w/iraRrPZ48orpj/mBJbAqIDrHB1a+8yteQRsfWxzKWfmQ8SK6TvzYqOmZLoPooZTlV+NYmbbjV
 l7Of698jQtV8DINhBPYCUGRun8cqLMdvA5s8yMCvm5n2Gs00bjupe8Rib8mDaS6QEo7mczGpvWl
 LAVr2EEXOn5mxlKZGSvQosMgYKEQZemdF6e7t9JB634Xz56lPkkW52bVgYj14Bwo5paMFi6c05u
 Gf81zLCHHF6eSf/BCDQ==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa149bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=CY4bWrPPlyhwilDFwNAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: _uPWu_4UtHiC8pqNqMemgXNZHSrVc0Za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090132

On 9/9/26 12:39 PM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 9/3/2026 2:19 PM, Konrad Dybcio wrote:
>> On 7/31/26 8:06 PM, Jishnu Prakash wrote:
>>> Add the ADC channels under the PMK8850 ADC node for the
>>> other PMICS on the board with ADC peripherals. This includes
>>> die temperature and VPH power channels per PMIC.
>>
>> [...]
>>
>>> +	thermal-zones {
>>> +		sys-0-thermal {
>>
>> Please name it xo-therm or something similar to make the connection
>> more obvious
> 
> Sure, I'll update the node name to "xo-thermal" and make similar changes
> in the other patch too.
> 
>>
>> [...]
>>
>>> +&pmcx0102_c_e0_temp_alarm {
>>> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(0, 2)>;
>>> +	io-channel-names = "thermal";
>>> +};
>>> +
>>> +&pmcx0102_c_e1_temp_alarm {
>>> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(1, 2)>;
>>> +	io-channel-names = "thermal";
>>> +};
>>> +
>>> +&pmcx0102_d_e0_temp_alarm {
>>> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(0, 3)>;
>>> +	io-channel-names = "thermal";
>>> +};
>>> +
>>> +&pmcx0102_d_e1_temp_alarm {
>>> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(1, 3)>;
>>> +	io-channel-names = "thermal";
>>> +};
>>
>> Are these going to be always wired up this way on all Glymur boards?
> 
> I'm not sure what you mean here - each temp-alarm peripheral here
> is using the die_temp channel from the ADC on the same PMIC to
> read the PMIC die temperature. Die_temp is an internal sensor
> and the die_temp ADC channel is always present on any PMIC
> which has ADC, it is not like thermistors which are optionally
> connected to AMUX/GPIO pins and can change between boards, so
> I think we can consider the above configuration will not change
> between Glymur boards.
> 
> Does this answer your question?

Yes, thanks, I overlooked this

Konrad
