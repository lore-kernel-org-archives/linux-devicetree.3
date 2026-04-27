Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BBE2DC32A
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300412; cv=none; b=o3X447zgU9Vb+sFsxVc36J7x4uCBa51o9AtmbCgur/OY2STLSmb9SDT+Cx+QCkk4hXVZkEAWUUHtIRpt+amO5u/L2w2UwNKT9KAfw0hLe8SBMQcDio5P2WN9Wmw8NjXbAc7lsJdWbgbEZqQ269hspQaIuH8WeQ2UHHeIbqsGtMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300412; c=relaxed/simple;
	bh=JuemiLqBRwrioORUP3apGn8ByH6NxlePrkE7q19s2hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWyVe3G6H90gyGJcw7CsgtJOeYzH5AFEc7owaQKfCOu3tfG+/4WE/42Z8SPkHIVX+nRSAiGDNkCLgIHs1I5WwBKRHND5rDsEjGHsHj5wee7lgkQQfExYqk1nCGlfM07/UuuEPtgEYeu+3diDUb3tL8aCWHkuFOd04jDW/aaLLG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcbvvKZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jchMWZoH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcbvvKZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jchMWZoH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDteS6241124
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ENCWJ3tXp/MAXnI+GiSGkpNUCG5d+RbFUTi1THpaXuI=; b=UcbvvKZUpaOzhqw2
	NUml43E5SDcN3UyHwHQVXIXCKe61TK4I2ZMzZubZF3ca2Ike2vKVRwZoh0yVWcwu
	0zOdfCjXlvOjAfW2SOlwvuUuKYchDtGXy3Z91ROX7qo082RMzia44i6KiHM/1flr
	6LJjZlzy2Xd1ZnIEA4zcGgL+O+SaxedUk1iy2THwfOch/E0e7YI4nGctFhnV927l
	rk52EBs2y6zFs5NSjTT3zqkIOZL3egwRajwm8/50kBooy+k3WzQYPxYlTbhRfsvj
	2heS28hxJcbmwvQictJCipujz2roMN4+v2kpnQdbLLPXkTkfkVzPmVx1Ec30X9iu
	V1KUwQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946r542-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:33:26 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95687296dbcso460865241.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777300406; x=1777905206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENCWJ3tXp/MAXnI+GiSGkpNUCG5d+RbFUTi1THpaXuI=;
        b=jchMWZoHLSXby5wK+UNZtr//qetH7TMzaPvJ5GZNZI+Q9weTKkF9otRBEf+DLmv852
         UwG2KQrs8Rh9AvjkKQYSjaSBbREJ+a1vSQb6I0vDCjJeo7yC5FSdHMsrd6rMmiK8pSOw
         Accqh1OXm15V/WKS/mKJ5GsXf6H/w9cucXzAzoL2jB6unjUKaCKYfCRzmhs8W24sphVY
         +AZ+Ld0CRnq38KQGhHFN/quJ0kuQIO8tuqJh7incfCeMCR0vCpp+YBNaBlSZUCRXdT48
         CSzco7VJjsRnqGkaEwBpw48S/MdK6ZzeBSAhZ7UwWebPxdhuJk0fmVy6eikNfG9fFFer
         jfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777300406; x=1777905206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENCWJ3tXp/MAXnI+GiSGkpNUCG5d+RbFUTi1THpaXuI=;
        b=HPoZL6iu1OLPXMi9P+kL03PW5niljgU3f903Rvt4/AaY2CbfD1hm8CzcQMZkY3sAQ3
         1jgkFx7d/oqiQrVMnhSNlvwlN9Uf0SpgUaEfPUxNQcDuM+6gbiClPx6kSWX0fLfJRh4I
         QJTN6vESe0+FE/Wpv3CYGRH/Vo9w4BGT1SEGzFyW5COo75tpppwag+vTo10V1sYHKlec
         S6zk1A60rjvxOaMU3P1RvFyV60OUG5sE0vGUnm0Pf1e/UBTqYp/kN6tkHeN9bO1ElAxz
         gPRzQBEhIfeMUkY0g2NMXA8WQKO1xqKqwvUpB0mwX4EynWiixTwKmVZn+H3HQBhLPl52
         y0Eg==
X-Forwarded-Encrypted: i=1; AFNElJ+aY9ZjUnREMHJYLeoriu1ArKU168n2g9JD6swT5DXrm6U471DBKlyNbR+hbRUwMrzR5EsCYBq0im5/@vger.kernel.org
X-Gm-Message-State: AOJu0YzuioIo0P4XIEXSjhGd6WyEkFMqysfua6dkbOsrUNhjj5DSEynY
	whLndLc0s1pi4P9BfPpNtMeGXL0Qm0LP283iJ2xF0yNyeliE/ql0CMuzxwqpXwqsHsmXo+kYnQd
	KYyHlzRci6DzzQuKxERTeDmceD9pkK1HjWRAZKAZvp067L+RQp8kMsQVJUZjJ8XO+
X-Gm-Gg: AeBDietyk6Yv63PXThXO7+NqHbcVRvDaUYNIPEU6ScxCDzc1HYcGb/wKNP1DqsLxbPu
	w6OJZOhqU0+CX6XLS2kEN7yVBuVR6Fokn/oVSKMuk4csSaTEE+bb9lln9NjjcqkXJy9w/1iup/b
	sRYgn3veAdPmtpm5jpHAeY4hJ80lcx4unMwBDzBMqKM87cgOAJUtR77kUETs1YZT1aV5tKLlUAk
	ucPt72TbaOA1XTx/FkhSUo6BIf1moMTKz7U2jUJk4H0A9+myK/WWxKqyBEEbaxuk4iw7eWVMIMk
	tzJLy6pGTdo3cPNmuZsHwUGUiFip2VY8WwhNuAOUmui21u+k4cmndkFaDd5VqD5KekYPQ1ARGnu
	HnAb3N64GRU2blG3DKmjsbeMA8Px6V0ynhsbo8PFKM52Cnn7lztBln62oJWIEwIHAz3icLLYz4t
	piPsFYGBegeg0+5g==
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8288175137.2.1777300405897;
        Mon, 27 Apr 2026 07:33:25 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8288147137.2.1777300405231;
        Mon, 27 Apr 2026 07:33:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451be2c9bsm1156735666b.23.2026.04.27.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:33:24 -0700 (PDT)
Message-ID: <db6bfee6-6b80-47ed-a29d-1f894008a346@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:33:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
 <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69ef73b6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JsCFQBrew_vequdH2koA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: umKQXFUgArOYxjObJtnbDK2cYTVh1oHI
X-Proofpoint-ORIG-GUID: umKQXFUgArOYxjObJtnbDK2cYTVh1oHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1NSBTYWx0ZWRfXxIvv0qyYgkfW
 VVzT1BLY0rWGGeYv7E96etfkM8xildTlHomTpSdOwVnueIgmvBOIzNF5edvBjdO3cY5Bbms/eIs
 U7dRv8WDVQXlZcLQmMkbSpAtE9SNMI1QCNi9pH1LgA9f6nA5jmJlVuZXfcgjZhlhDUiTHnXgLnJ
 AIhPISnfDUn4FCSspt///+S5OlV2WS6BE0T0i2vLc/VDJqMPKC0PSrJ/Z5K1fqedfFdk9+4MpYD
 U++WwQW99gCg4Jhtf2ivn5Ut17Il+dkP7lJWn5aBNjsKfJbmVxbz3C5XoApt8PgeETtroBHKpX8
 k//Ga3WFUsE8V3qR/aBLxV/ddhqjRtqAhNUh1cvpL1OC9I57aaPS9zEJf/lDHigBhtROKUgH0/9
 3sfmDjeXQxLlaZwN1ymQbBItGbqFZpusajPWvDcJi57WkKcpEUIifUxN6t9bniOyWsosH8fyhCa
 ZsFduiiATK+SUmlt5lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270155

On 4/27/26 4:00 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

[...]

> +	[177] = PINGROUP(177, ccu_async_in1, atest_char0, _, _, _, _, _, _, _, _, _),
> +	[178] = PINGROUP(178, ccu_async_in2, atest_char1, _, _, _, _, _, _, _, _, _),
> +	[179] = PINGROUP(179, ccu_async_in3, atest_char2, _, _, _, _, _, _, _, _, _),
> +	[180] = PINGROUP(180, ccu_async_in4, atest_char3, _, _, _, _, _, _, _, _, _),
> +	[181] = UFS_RESET(ufs_reset, 0xBD004),

lowercase hex, please

You'll also need to alter the macro definition - the CTL reg is where
you suggest, but the IO reg is at +0xbe000

Konrad
