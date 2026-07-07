Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0954319601
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413681; cv=none; b=N0AwbHH3d+krxm9/+v+wLUluLiOHKliAeYMs6fDUjW1SCFyHA6QrKgbrivoZtXQ/LiV4fwsQPntCUOphAxwqNRx3Nh3ctbHutX0/N6T5Dcv374BPQVhYbnqQFBeffOm5BIdIN4RT2/r5CBGWeZMwfHMRwAfQ48CQuZyGTmVMA7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413681; c=relaxed/simple;
	bh=Cs4b2wW5iHtR+kmFHtK2w0lnkwrBwTQEiyr6wq4vrrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpVJ9KWAgbTGlCmFfSfrPKAf0VZfVbFQa0UYcm/ptHq/WlhgrgTPYyPy8aud68st9PRMjS+oLpMoSc9/XVqiO9uE65ZIWq3uht9fNPSkhA++c0sLF1exJ/4p/Nw5Gq0ZXk57Jgbq8GlEiRvAX0fIbyyCcMPJ4W2GJXy83zEjtkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Su6uGUkR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5KU0V+x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Su6uGUkR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5KU0V+x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678ECE43231437
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 08:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J6KUhfg+iGn7S5vp/sqQvH9RMm0w2rnK+coF8csypQ0=; b=Su6uGUkROEs+Gl1Z
	vtVr2LLrHo42XNui5cxEi2VjFru0lTF6FaMYVrYoPEMH6xZc8N1B1lt+bQIwonBq
	Buaq4miKFPrjS8sXSHGS8o5cZ9TI1a95kHsQn1wIp2k27PDoMmKdeb9pOszqOkL5
	CmFxtVjETwFtXa7bRJP5HmJloaneS48LBKmHPgZCggJW4636WVck30VhGvSUlu4H
	J5uyJsPXzJHg9XsHQiAzBVCSjXgyEeRlWcAQeE5aTRpCvoPpcOFoxxBr+9T4nB8l
	o/qZE7e6Y4t+/muehZhQsniJe338F0d3lp+S7aaS0h31Fxs99T2h7fBjqeouQTn4
	61aldQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj79h2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:41:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0c6ea10e8so10697726d6.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413677; x=1784018477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6KUhfg+iGn7S5vp/sqQvH9RMm0w2rnK+coF8csypQ0=;
        b=e5KU0V+xgWZ8XM86laZgKFj35HesBp4ctJhwuXCnLrp9C3lh8aNX1oKAtJn7ybmwh7
         UNrfOv1hiC4K0z4shc6dH4KGYjGfL825GtKqkGaI8D6Vlx9/0XQ9LcRKK3Awm6MuZYyM
         Wm+3mQgXBlnrewsj9gBZxS6laZrnp5KcRsFrZCFYUl5AWnN+MbapZWEQM2fdp0r9nY5l
         GfqTO2bKxBsCvfGPxPcnPxQWqwPHoTnw3qnT2N/RwEfm9OybswuMgROxEc8mE+lrhAtL
         hHnGyYN1UD2DVYGJrPQ5PfOIgjcSzrJO+cNQyIPnMv+t7LQoy/4XvJVQl3KF2dgt1oy8
         XaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413677; x=1784018477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6KUhfg+iGn7S5vp/sqQvH9RMm0w2rnK+coF8csypQ0=;
        b=Tlmf1nV/mU45GUUA2CEbB3L7OCQIElc/lawiZQGfDGiW9FlOAv8a9tBXJn/4BcFWGi
         vHA5qZVnSdu3CnHD5ZcM/exyVSXTYfxu7owXdy/MdFaQld15jJPt3VvqC+dZmrAAYa3u
         BWfpjWAXQJ8+SnPzsnMD5QJLvS3ORF3hUgtOqd/G22EpREHqchWJMVDM9zzox3p3jT3g
         KvVRse/CXnz19Zxo1wQRz18JlEr7udLxuduZVUg2FeQmHyZISajZdlPQdGNy41maXzmi
         VWmYhotMW/V5hi5v44TDGUa90jxKK08iKHEc9CYdMAxhEj3OwIX5gYKC91C+bEQGalA/
         3deg==
X-Forwarded-Encrypted: i=1; AHgh+RribZGijoDc3N8maXenrZy4ORHv+w8zWFoU4pn/MTAtKuuJGBT7qJlWRxXS6GdIuqpKK3ZmjfnaSA10@vger.kernel.org
X-Gm-Message-State: AOJu0YxrYUukLe6Kz4/MoTkjlhtePqOfqijkKp9BYKctAyJo/fad00kT
	Q5sGn+vuitHZcZSeo2X3GVXrOb7XX/oHtoTjEWWQdywRIJI2c7zDDpyvs+K7A/eR/ZDZoG48HKt
	3riLCZ3s11L7dMIcHKeilV9Stfkz2qhBh4fTXQ/6tAN96krB5xPXH7fI8KVvovrJ3
X-Gm-Gg: AfdE7ckw/yAGACAMZRaE5N08UfHuYfSLzy0sNEr62VTLjAqDRiwHYE2ht9AJLynbnPh
	IXR6RFZ3zD2cB4CrzM1Z0F7FdVtnp249mIpzciemW6RzLECdm/chyDsSeQimfzqxpqN/otfym6B
	mU0B9Nk+pbz0yU484O9BxSscSy/yEyib5EbE1cLYFZBJaAn9UNB6dupNy73QDg6ZCNJLQ4D/bx3
	hWKyhkqIplUp0k/ctuZXcxqaB9ewNt/jEJ6Q6WdMd3WnntuSovJZlQWw6F4V5tsfBBv/B7zVusR
	MTg52UrzLP4InmTgGZRc7tJH0RNPj3UsHK+ukxn/0gKkVeLooR2H/NwaU8W+6oJkvPCKm21J3Jb
	yGdZZNhvem1fOvYx6bHve1sA8R75+z5yRc1I=
X-Received: by 2002:a05:6214:e69:b0:8f0:2afd:378c with SMTP id 6a1803df08f44-8f74988336amr123239856d6.3.1783413677482;
        Tue, 07 Jul 2026 01:41:17 -0700 (PDT)
X-Received: by 2002:a05:6214:e69:b0:8f0:2afd:378c with SMTP id 6a1803df08f44-8f74988336amr123239666d6.3.1783413676980;
        Tue, 07 Jul 2026 01:41:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cf68f5sm5617603a12.13.2026.07.07.01.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:41:16 -0700 (PDT)
Message-ID: <bbd86b28-b6e7-4483-93a1-bac96c2dba43@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:41:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9pypmiKm6HDo1vU7fgI2JItyU5MMWwew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX3FHw4blnO3Nw
 jAOvZkiKttM0VbMXzxs0qpzfz/vZZRUwFsjZfla9xblNxlSBxcgSwAP20cX8EbjbITQbPTytHD+
 gAPm1oD5W0yZKWqwfhzxVeG9vTMAVAds8/PH8JKyDpvBDTeWk6gwxGMVFTSSN9WxVrz/YVFzunt
 x0vj200blrff/OgW/d4QKPidc90TMOGQiRoW3TpdUvuHuEO1wdvmYD3wMQp2uL308rntqyn0bDS
 chGDL8JbvIHoDz0uFGEcT7lxQtcf5h8x929mhnB9luNNFf0RIYTUYKDDNmGQ3zXNSrGDawA4Xu4
 HWnFNZ7C8NVw31f5xK7Qv67NbBpfVthYjXq+1lXhNF+KKv5yBUH8ePNSTBRTwtKrD1HcyD93ABx
 0HpyOkyibvt3u/yweZavLIqWmbBIK6UNw5T/p3r8MLoaDZmd/7eU9PCGU7v8n/iInsB56xlH5pw
 1K5Or0Wo5XF54wdVlVg==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cbbae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dqspCxh0aqX29DDAmfEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX59sGNyxJ6E9z
 zTwAkNjeZhjH+xTuyYqRBMHQazxmlw3gRpAGdpAe3IuIg820PhndcPZ7HUjLo7jpdeyXnSLG4B2
 LROIZgpjMpOHNVyH9OxLio9JAS6c2rE=
X-Proofpoint-GUID: 9pypmiKm6HDo1vU7fgI2JItyU5MMWwew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070083

On 7/1/26 7:43 PM, Ravi Hothi wrote:
> Enable the sound card on the Eliza CQS EVK platform, including the
> WSA8845 external speaker path and DMIC microphone capture via VA macro.
>
> Enable the required LPASS WSA macro, VA macro and SoundWire controller
> along with the necessary pinctrl configurations for DMIC and WSA
> SoundWire interfaces.
>
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

[...]

> +&lpass_vamacro {
> +	status = "okay";

'status' should be the last property (let's also keep an \n before
it) - file-wide

[...]

> +&pm7550_gpios {
> +	dmic-eldo-en-hog {
> +		gpio-hog;
> +		gpios = <7 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "dmic-eldo-en";
> +	};

Why add a hog if you defined the regulator already?

Konrad

