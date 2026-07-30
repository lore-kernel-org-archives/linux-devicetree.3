Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2814396585
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430730; cv=none; b=rBinnclLcfbhmQFh1eewWVZ/dDZGb+bKexcVzzLFqk54yyoiOUhWi6qeeoGiELi6YQWCtMcvW0rfWfW+/mxJjWNhtoSOiBuH0CjQ/OC+COxt4xf3ucz8OqYeyxgojWEBt++VXJ1H76hIl/8EppnsRqeAhIV37VCwzwFMdmn26hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430730; c=relaxed/simple;
	bh=yhlCck/KDmo8x4hISNGON4b5jPd6JvYcp95JUqf1D9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCPBjNCBV2INUgaeDYimQvQJ27uhXZumfMUqQejSqgNEB5519C1VubMsObENU3S48R6KStWDXlwYwdj8WKFgtYMN8HxV269dFTLB6iMgIbmbl2Aeo4BOfrxgWyacXwC/+IWVEFKhnXsjhs9xnZFCMKHrI5Su8Wf9odB5bDpcwMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKEqxsdA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDWvEkEe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKEqxsdA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDWvEkEe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWXGk1238393
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxJhYT9rJBQN+jgGnlG/gzNOb7ETb39jS0PzIwxDi40=; b=oKEqxsdANJtmaVLS
	XByc0YhnUktWimqsANb8g+jXgIbH3Y1hgSHAzisDh5kiJdUDaYgVet1aWYHzwxnf
	4EZzSQjv0CrXV/L7yAIm3GvY7uoX3bvecFwUl0KZ0UasYzTP/2hGwE4u25MUemVK
	GlY8usLv7+RzH1lVQZ1vys65KsrMJt+uNosoBsvsUZbqwnT5nr4uqNUm7z3RojhZ
	6A76AIM7W+m5Ct5ya+2879KX+c1T5aqbmwww4snSjCSd1ifaa8jugIWMJipkpTBj
	PY7Eu8jDLEVeVL72NAERsP18CHz2i97FwlX4OQ65NvNilGVUeA7xfFw9V+0x3S66
	6+6aAw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n38q93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:58:45 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81fc0232d42so1170287b3.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785430725; x=1786035525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxJhYT9rJBQN+jgGnlG/gzNOb7ETb39jS0PzIwxDi40=;
        b=dDWvEkEe/DAyDixHAVnWbAabzYvMX5V+eYtRqsD6jHRwhzUJjYQ+D7rqYeVFPrYbTE
         le6GWRyvH2CYc1fKW6F2dlc5eGvBT+zR+M3JiDKRKM0qZMcfueDjCbIB04UDSXhKelxW
         9jUVQQG+aarTODx8yzD8xeYUY4O5U7D2L9F/5xfqDjjeNjJDnP9y8/uCn1NgJ5ftwhm7
         ki1V8z1wuFDWloiakEAacnjxjoEFVv1+4RJYbWzo3yGfoZ+LU3ot3aDZd0+sX843OLiH
         IMYskhOIzCPun3R7k2y383zVPJCJ4w7FGxeJft6XgbmIDhnnLfSVrtAgjHS5MGJg7df3
         D0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430725; x=1786035525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxJhYT9rJBQN+jgGnlG/gzNOb7ETb39jS0PzIwxDi40=;
        b=VkJ+BZWBUsZpmhh/s/SO1F0/sGsP5S3SITrpFoA/Yz8jKkjD32A6s8UX7IzxAWWz1I
         TCbvfaQoEiRukrjkjO94O6BfNlh6lyQVOU5+bVnLCgt3D+RaC83VOvEl/t+PyUhc6WrP
         +pvyISLqNwqCi0SuR4CvGXaE+1cQZNxiNApQKhx0ixBodX2Do8z/pyfH7C8NaRpLrChn
         7LitsqJ7IWGDMNw2nbEeeRNvbjzH3RLXMw17QBDkkKZOk/RF/B1dIR0E/3JQIitzasbJ
         Sy2tTjkgt3WZiwHva84o5NaWnvwKtAO2NddGaINLkEaEFfYDJ7RAbdQtC/J1Ae48j95Q
         1heg==
X-Forwarded-Encrypted: i=1; AHgh+RrlyzZ1FA+0sHKzRwN3NFecueJ5rCoZ6D+8lj/3IpJuQmyyk/qr5Zq/z82Qy1ZuKVmMJl0L6SWmqIvM@vger.kernel.org
X-Gm-Message-State: AOJu0YwHG7O0nMo2t/HVbsw78ifJMyETo9vrTiO1aFFo5msEqxMAZITT
	awj+/mhgfcE+VlJjKjvBmh6Ad2xST8LbjTG+rwqicw4Bh64pgRKNOudY3/ZYIcZV4P/rhRY1dY7
	1xJTKQwPn1oITkxliwEt5kYrJHVQK08dIhHEEGPUki6j+sd5q8p6S6U1Gr4f7PN2m
X-Gm-Gg: AR+sD134TUnJqP794KM3NQeqTw8EKXSUfegYK2CRGucntIGNpRgZadbMmGjUFC/2xiS
	pKpTu5p7QZMLaA9Jo0PpgWl8Z+CvA0xTsAylCDAGkRtlEQFOCQiSCgCeswyPXagmrr1D383et/a
	WrvM0yL2MgovuE230bC4QbJTYxzqsx/9NC8rj/lMhoYQFcPCl4zV0wbNCSGTaakKN0XQuAroQpX
	D7ldJck5Kno5w6sk1u7g75mr3mgVVmcDcgvp1sKU6WKwQxB7xmykQf55YA4cIL+uh/BIgoBPlL9
	Wk4xWe0Os7fqYxHZkvnYVD1skYKCwa8vJwPXBcLTB5ZWzLD4fiZrE69hZwftJU6MWvLCxGMzsmO
	fjaYf7+3MRGQlMKDsh2cbm8s7W2ALgj2gDVlAr3UC4vc8JlE06sgtenHgkFTSKr2I5g==
X-Received: by 2002:a05:690c:e1c:b0:81e:8d95:3d32 with SMTP id 00721157ae682-81fb8944a72mr21470067b3.9.1785430724883;
        Thu, 30 Jul 2026 09:58:44 -0700 (PDT)
X-Received: by 2002:a05:690c:e1c:b0:81e:8d95:3d32 with SMTP id 00721157ae682-81fb8944a72mr21469587b3.9.1785430724395;
        Thu, 30 Jul 2026 09:58:44 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb88c4ea9sm13592227b3.3.2026.07.30.09.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:58:43 -0700 (PDT)
Message-ID: <f30954ce-9bf2-4f6f-90cf-4442390f281c@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:58:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-8-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-8-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b82c5 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: vGfqgfctkrzWRS26UVtxq2GMMy3JfQhI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfX/rkp92D+VkNe
 CQt//+ZpiXPtT9VxAb20iJDR3ZvdZi0TBMDV7PM+LytG4oZ6vAOlUYfMwAjlmY1pddC+8o3fLB+
 ac9Dbi9+m/kSriZNtvNFihGssPWic0JzZdilgyY+kbAa2D7LCokQp1aAmAUI58rCMi+rquzKYAB
 RnBP1v/cECL5Fts6QyDaM+FeNss+SP8N4CewuH1VX26BaEAolNs7KgnZu+dBrQDvjmtW2bI4zzd
 2CqTV3Rq2sOjIspjX+KHIolVXlqkh46Kr3yjFmSMmmyLU25ZmL1Ut5KIM+1MpCLCZAvmdr0+lGV
 PkmBI3qXIyWz/9nJqy9ZS+Vx6t05L0O6nPZWBPyolgj6qO4ANtrrdC/zWThNmuH87twpy+/4qEk
 fdlZYoq43vqkF9I4U6tLp5i73sYtkMPrzivzO8wz0HUKYAgajcWk3eWp0BbeZcpoDvfueLXZwNw
 RCFb92qa/Ri6LEG6Wsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfXwPC8BFNOO6UT
 ViJk/3Z04giTJ5InxHuszndmJy8WQeiRkHUkik40EvuuZyQ6Nyw10zr0+Oi9MurV9U7DJTEmbTc
 k2xO9TOHhpYZMCQnU7tH3Ok4HONYNZ8=
X-Proofpoint-ORIG-GUID: vGfqgfctkrzWRS26UVtxq2GMMy3JfQhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300127

On 7/27/26 16:22, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in monaco.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 115°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
