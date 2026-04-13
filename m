Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47E53AB279
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069608; cv=none; b=VLCC/DN/hPCU3K6b2bfiLRAG33xLSN+aUaWFLRkHA4MKrxUxaAkb2hFxfGefoY2zZ6UGkdIdV/Ld0hWeJo4X5IX7hd5pMt0xVvVs+ntWPuheHdnB+YmrIKzG8TtC2LmNk4bM/+V+fXyrxFlp1DovuvGC92XFNHoNhMCFqwp1s+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069608; c=relaxed/simple;
	bh=DgO/mdro07DduzQOos3CDaqYUgHX8fPBAAE/vUl0MlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGIJIhizp/eHI0ynqjf38uS09VxqCGnJYEc3YE/hpwKDOtEMTv1GKYT8yaFKuj5P2eWPXrDyoGoLNDOHBa8J5l0dJe5qMKoHL23wzwFHdtV6WM0Rz2zR3SNbnwD0LVZupQODDyPFXBAN4qw7JrLOpEU6qEE7a8+mr7BTTNh3j2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTctrGjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fo13N3h8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTctrGjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fo13N3h8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7aU9h2043988
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRQ70tLSeFnC8kKG47B5IGdVE2TW3i5jqUr0trh5zGg=; b=GTctrGjFdjF8mN2O
	1XfUBK1TXbJAlYrF9v/Wi2dZCHBl3GqGrQqdFrkcA2oCwGXVi4xGAn7dG49ElLYm
	r+n0MNjjl7nPRpxK54KmapYsgaOon938GPUBDWEmSJgTyXr1SIf+14afYQLn+5sp
	CzzAYw7sFBTS40wM9ej75XXJlxFK32VCiXaCxI1/BMYA9mJtaSeyQwDQ0Av9P+xj
	Z0qbKRH83Zx5Y83IOlH4me2jrNHvLbqk8uV091O4Fy5cxQtGLK7SnzwFAuiZICld
	TxDNpAMwnQnSuxaYeT1VxMsAI6vtw3KPi76NpXVweMKbb3WAygRL+Ywfj9VeJJYA
	EXtoEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvdy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:40:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfe29579d5so72999785a.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069605; x=1776674405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRQ70tLSeFnC8kKG47B5IGdVE2TW3i5jqUr0trh5zGg=;
        b=fo13N3h8/OwhleGFUNQ0kVYJxDfrgLEfwly7G+gp/rMkFJKRf/aFmE5I1IJu52qBI+
         MJNKwnHqMqlBP9s7mhXDH/dvSCZWkzkxurRqjuV3wowBNnWvVhnF4aYuz2RzQw05jpTF
         c96EpsT3UGLldeWndMyGqoSkaumf706TR1DL+WDsLX6jERWb1Waa4ItpYDaObIMc1XI4
         55d386zmjXzFQ7EtwUcXSSdp9eVY4RxRtbbN1FVfxc5PDoHJinyCAJhJjqawwpvkaJWh
         Gg+uX77RpDmVhXJmn82RKp6vj5tpp5qFQKJ+jVPQV7iS0GJo7mxUZMfLgToHbDVJh3Xa
         L2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069605; x=1776674405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRQ70tLSeFnC8kKG47B5IGdVE2TW3i5jqUr0trh5zGg=;
        b=U1JOV5blFNHs1F+2ZaKSS7dLys3trwUOJwIk2uysZgXzvYY+AszxfkR6rzath6m267
         Go9ksv8+OEAakfpzw3kQNilmggExuxef1GiR1VGTshKafmyzq4aml47HEfILGIv6lc+u
         mLuOlbGVhYXV1cuGSEoS7gcM70hJg91h+PMHqIad9neb+VZSFees1lXsioHc6vLXtHr2
         fAoIl0kudwvFpoO3OINAwQmiJ1grkHtmeLiXKqMySDjv6kb6v5HM2NWuhHLOyBXlZa57
         BKnXPr106MynNWqZPG+Z8f2YxzHCBZrYqVE4qyEJsW/vttvzQq3QcIMYU/k4q29/om9W
         duiA==
X-Forwarded-Encrypted: i=1; AFNElJ8lsU0m4CFM1xnsc7tDiw1qiHpI5lFty5UrVITSWWz6O7AHhYWDmdoDX1Z5AbelaHjmF+pPURCoanKx@vger.kernel.org
X-Gm-Message-State: AOJu0YzkA5rJ3BlK7Ddv9L5aBpd/uZni3Y686GO8g4zB3JINrjwKxLMU
	6Rf/WW9+69++sFVcLrhVLSBtatjQE2Za3RoVf9P65cuvwWql+wHIDLBWFlxvaCicaiRamCmY3Kg
	aXDNeleExAqhm+5nP9hf9ne6rHRCro4j7MBmZL4lRgVXjQnhgnJlPfWj01FNtcc/m
X-Gm-Gg: AeBDiesj/qy8Ld0laz68jyfyFdy3fEY2dmND7l+l605vDSoTzzxLptiqCJT74c89UPX
	B0/j+/7Fe+4k9eR/OjirT0GcgTAxr1PvLKnt7Y/JJ3kQs77SuOQaR7uaQMTtwOQHP48M8qVlnr6
	lyRhUM6Y9k7Uq7E4UKP6hM/IVpSCtpH11NN4XC6+8jeDm5Cx4Xb6s/6LguMtMaE8kpek3qkkCMA
	iOLHOGXJeXlGdmE9RM4y8s1aX7j5ovtUbY44n/t/aFvrxcv+E9V5oZGJjBgnXj820tfI6CAHInp
	euotX/rQ8xoKsPy8qFiWUEOYHHeIv4dpvNlJ6aMjKXuXAhXJ1tQxXSCvK4wTu1oiAs55m+K7l13
	+ijq8f7a8Kv976F6N15giBPCgXsc82psTOyz6J92yN3QpIDQLT+q6yUoXL9G1hn/iD0SMLYYZlA
	P6z9s=
X-Received: by 2002:a05:620a:404a:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8ddebbddf54mr1196528785a.5.1776069605156;
        Mon, 13 Apr 2026 01:40:05 -0700 (PDT)
X-Received: by 2002:a05:620a:404a:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8ddebbddf54mr1196526485a.5.1776069604710;
        Mon, 13 Apr 2026 01:40:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671a5c6583bsm164932a12.31.2026.04.13.01.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:40:03 -0700 (PDT)
Message-ID: <786bd762-bb58-4ea6-9493-f89868ed80bb@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:40:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
 <20260412-pixel3-camera-v3-1-e26b090a6110@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260412-pixel3-camera-v3-1-e26b090a6110@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MyBTYWx0ZWRfX+//KzXBQG+zI
 3o+y/FwQaXw0YQaKnx24pV4UOGsrPJI6XxbTynkp2/jhlARcfOIEuNgTeGCBPVdqHxj4RqDe6Oj
 j7N/bNxjBlvNmBNyyw17MPY6hUGKCsTK2Yf4vt2I/TjhKEoOVLzGJTCDpm6sgEprMBaNUXShXA8
 APJVcHWzXAOe8M/Y9fk38P7vBlAGjUAGIuMkvJq1vp9kU8Jf0QO6UWYk9pyCuAm9rXt/VUWnja6
 UqxNEgRvlLDK4c9tE+qtrN+tf8S+lXFEEORwVTXneuOzilWKMbsp9UP8vfKgmvXBbVqd7ElEsgS
 6UZ9zabrwr3B//0vZhBqZ+zWyDR6s4/Ov45nJptx9Q9yV6nP+kvIrlKcmr/+B1qOz6qZOv74E3W
 JSDPDuOBvk+Qv3UVQlbHannwwxBusPHmpebh/jRK+/2m8QlIZXMEhB7dknw5D3weIFRc1GnKh5N
 ++qLo90R7EJIR22wkEw==
X-Proofpoint-ORIG-GUID: GrYtkd4nZ1kWUHXwZgQUrM-pT3F0K_5i
X-Proofpoint-GUID: GrYtkd4nZ1kWUHXwZgQUrM-pT3F0K_5i
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcabe5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ppaLKjd6v6Z26LEkUYwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130083

On 4/12/26 6:35 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).

Fancy. Some Sony phone had a dual-focal-length lens on the back,
which IIUC involved some pretty heavy engineering


> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +			camss_endpoint1: endpoint {

\n before child nodes, please


> @@ -459,6 +618,38 @@ &tlmm {
>  	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
>  			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
>  
> +	cam_front_avdd_default_pin: cam-avdd-default-pins {

I believe this may fail dtbs check

> +		pins = "gpio8";
> +		function = "gpio";
> +
> +		bias-disable;
> +		drive-strength = <2>;

Please don't add \n between these properties and align them in common order
(i.e. pins/func/drive-strength/bias), matching the rest of the file

Konrad

