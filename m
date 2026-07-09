Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10F723BCE3
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602844; cv=none; b=YPXpq5Db1I7REnYCGgg38fGPAvCW8587vrXfg6VXH/npLQRm+pLxNII3g67GwRUdQqUK9pJzMNf7Lkgsnsj4kg0OKM11uc6ggLBDjfuOHrdo2+IEBnNXKLqi9tkpT3/rAPghVwMJcTyXa2vug+UoxcxPm9dpJLEdQzT+UrP+Yrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602844; c=relaxed/simple;
	bh=Kf8KkyRwUi+lP9bS9Wa5ac81Fxsx5+F4rdB5Wyq9NNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFgVuwfjNfNUfv3dQnSUQDrVuR6D9iMeR2JKKFhvtdNCKIJ9GeMx3jNxLQTlqR7MbuLfaqsQHmnWNqlLBB/T7+sVFpw7qP0dZZWBEsMtiaC7HMsBkmOZ21ySC/5cwmLPtx7hVOpC64kbR2wFYKZT3Vmnotz+LWv8welex4iFILc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOZ90CWe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wh9hPMrw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOZ90CWe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wh9hPMrw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNNaF1488881
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJsedTfAUnAGd9jf4WEWGKJZShzPIG3A0JMCF5nO4mM=; b=IOZ90CWeVl5nUu7M
	XFpYIEzmX6dmJ2uIOLQ2k/a0RZFoe7Gq9O2WeqKX+2/KuI+JwKcwmxNFwDnfOe79
	u/PewGO93pNAUPfL/NGqI0L7oo0DRpw0m1ywxRdGCO+D3szSGXFCDNz+KHjNFa0Z
	HJOOSOVhGP6a9qSf41pEaJqmEAGU7XNj+DKq5rscJJmbe0U0xQUobdS9hd56XWpf
	EDdbSHzlJeAegWQ7lQY8xDpn2Idy1vKQqXf12WHtjBRuRC7JbXfGWDHEIxUa4u9w
	u0PYUL97j4nvj7NdyO7Ws9nxPFj0GiOSwbUbvkmS8fr13TRNJrHuBxjl8rgay+ee
	G/Xqmw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfubyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:14:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73966c839bfso58320137.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602841; x=1784207641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJsedTfAUnAGd9jf4WEWGKJZShzPIG3A0JMCF5nO4mM=;
        b=Wh9hPMrwxjZDDyoRfuow6eSkYHb1H/sME3dynMhHjmqjEdhTKSbfTlNQPG1XuBhCfU
         TZmcsBkYQlP6IGmy67+DHFpsyJxpoQrcEbx+64/lBGhAUYTgWtrcSLRoXNOBv6epIvoc
         k6cKfiGNwdI/Mc5V+P2H3ZbtwLk4OBsnFZTb51BL8pV/UV7EqmPIQQ2/UymUE/3RCXCA
         4AfV0KkHm5VYFUOHlciFbW9WvxmLNuk7CwMhqLAz6TMyWTfjqvw02X74BtJSn2/zInW1
         6K0O7bnPUFeEbNCLAXLYndWXQuazgdIeTpwq7KWBT7UhPRLt3zFMGNSuUChfTzXAy5dh
         lheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602841; x=1784207641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJsedTfAUnAGd9jf4WEWGKJZShzPIG3A0JMCF5nO4mM=;
        b=BWA4Zb+IPdQ2Jijh7nizNZZk5eGEWV/hNe9ZB1hqa7sN2vwalpJ23HVQs0d3rnEj0D
         5rjq2puhVNe5JrXP6TDpGflmJqDWwWayDFMlI2L2K9nFXxe56Prtk7n/XYhq0+yCuxta
         1nO/QL3mu30SvcX89bTuwOKhxDzFMOdF4R9e8UWDJ1WGxneAALVfJ3CQ/gaV+NkuLYIJ
         ka2/mURa2nGNnyke+X93bUb+dtCXBN1sNQJfqFnJOa11kLfL+DPAr/kzFplwn2MMmbnC
         GP5B2EcxSP2BGqMvsQ7H0rnVTuoCqY6WK/rtfSz+lem9RjwJum7Y0YZtSrhQiUM9JBZX
         lNOw==
X-Forwarded-Encrypted: i=1; AHgh+RqfFS19E9MtpkhXKnoh40XmcFxOxlB/Ozq574G4ZblMn3btGajizIA0wo/wqrmoUcTjmmh8g6nvLpCm@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/zx0sQMz9zEDKHx1EjfZkM43pkGBKMeuszweWN0FpIdSPPb1
	jpSi2ZlP8RXPdeFvGUqGVYQ8nwDgjtJyd90Oc5JzNzlb6AyaFfxcFLDbZfh+Ehez4W6IOKXqsGe
	dHxmGv0FXxvse9TxqZxyeL9LF4BCa9lj2QQw6h2kBFU0uWe3pFjk3cMr5BEs/SaGC
X-Gm-Gg: AfdE7ckEQ25EXdb1bQHkYhqz6Qq824RxXpZ12k7f8VyXn0WpSK95QPoso8OkHSAhB6Y
	kTf/oYjIOth63hbnbXg+YB5EZ8wN+VhYk+enSwsdPCHug0YhlCdP+XwGBfC3X480LuzzR6PO5RK
	iYQtTqrIizd2lwYoJTPmTZFgefJlN7ovDRV5WZddw1e4YtQQftm0yXa66igE7BpJ3gvoIKkpsGA
	GulY6wcWwCT7eKnkUqmyP42qh0btn0O1Kjw4cb/uL0Kd8+1i11niuKPlcJ1hyck/MQuwWRX5CzV
	SDuIfoaPXbj4pVfZtkZsl98UumxRAFZBlX/YIPoVMPLgF82tG3QD8A2bvOhTJs170oX9mXOwlgO
	vqdsjBNtrEdrnfZh6LOqVUkIMQzPQ5MslRVg=
X-Received: by 2002:a05:6102:370e:b0:633:3bf6:977c with SMTP id ada2fe7eead31-744dfee6ff7mr1595672137.1.1783602841312;
        Thu, 09 Jul 2026 06:14:01 -0700 (PDT)
X-Received: by 2002:a05:6102:370e:b0:633:3bf6:977c with SMTP id ada2fe7eead31-744dfee6ff7mr1595650137.1.1783602840812;
        Thu, 09 Jul 2026 06:14:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84483csm494374366b.17.2026.07.09.06.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:14:00 -0700 (PDT)
Message-ID: <494e89a9-5588-42c5-bbf3-22c9baffe0c1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:13:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
 <20260709-shikra_adc_support-v2-1-8dda38f7bf3d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-shikra_adc_support-v2-1-8dda38f7bf3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfXzfOUhEBOzxR7
 5MiqgSiXvwNlI0ta/8BEp//Hc1LBl9pRWtzWD2bI4xYlAXjKWsztlozIQ/deRQR03oxkxh30XUV
 jsN+S0BFMMioyHxDDmbv/6tBAUPTB4noSfNQKgeVK6S4gSVMsfTQeuKaYKZs0E32azfxAJgRpWC
 PNzagoNb9k/RIA1lL2tP580GaX+UTieP2cKKp+ZqthaBzCM/urBjv/79ChwkrFQu6uPbzrjetAF
 T6XzFWABTcurtbrK0YI6y8V9mm5hOih9LRyp2IdFTRi9mXJuEv1cRKdBx+tGze/F27NGpexXDyS
 QqwN0HVGvSrqU4KCEdz1d43S6buXKojQyuoZVxr+dzjaLiaBkxFjv135sIPR1UEsXll4YJ2RR66
 3Tj0chDgcprW3JqwHfcz1+X4p0L4C+6WTHp3K9FwAsj9m2Bx1a3DMXlSqADRAlhg0gtTAhkVYvl
 lRW8D4Wyv/jwmZuxMIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX31nsh107D1u1
 7NpPSs1hK3CZcAFt7lZzEHjjuzaMARQm7S2sfoRzjsf1EXU0xP5qKIBoCcXjpkjfaHIj0D5KDI3
 g2UL3vONkp2OYS1s6uvhcjJUkeimLe4=
X-Proofpoint-ORIG-GUID: vyK8y0K4I51GQRUXOix8RNB6RGnppC5i
X-Proofpoint-GUID: vyK8y0K4I51GQRUXOix8RNB6RGnppC5i
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f9e99 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZcKTkTG6BgqM2ItiMp8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090128

On 7/9/26 11:44 AM, Jishnu Prakash wrote:
> Add VADC node with some channels under it, for voltage and
> temperature readings. Add temperature alarm node, used for
> PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm4125.dtsi | 105 +++++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> index 542e8fe030da..62f101fe5353 100644
> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> @@ -8,6 +8,36 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
>  
> +/ {
> +	thermal-zones {
> +		pm4125-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;

=0 is the default, you can drop it

Konrad
