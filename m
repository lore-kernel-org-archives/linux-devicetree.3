Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CB335E950
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429691; cv=none; b=jUh1zASoLIA6XAKsTQDi5roLlpO/X96QpLT+StatPirSw/5j1kcGO8CcQfktLtQF7uzcKZZTrqHOfh5pnudsQtWBV3tcQ+k/lC5kJmEayhIxIWBoNzFsKbeNEafCeXKdgCdv4/zFW6/MbRMctO4oqePdbthAkf98Eyc32jJC0c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429691; c=relaxed/simple;
	bh=W1qHPOfiLKP9reR3QhYi9YeVhYLovQs0sDLJcbc29/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4UzCdyTo6m9VQcXhjbLodrFNHQ53tVc1G/REcxqefbdoABMiSpOlHtLHGvdBvRpplpsfIsl+xoUtJf5NuOPy5QyE5qTWvOvvEunNZde6EzcjUocnnmw7lEpeJ3wKaBbjANflK8fBkBV1e+cfSh2Fb/4VRb0fISaitFyctIU0L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0dTlVDc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNPFOvHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0dTlVDc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNPFOvHN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXVOQ1571689
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aF+l9BeJEjOCx930xc+un+WIoVHa/ZgTrH/eyrfC/jI=; b=P0dTlVDc8DfrJ4wI
	pytp3nTccA75LMtWp+hPPaH2FIDyucvJc7kaK5q8mDhNrGle7ySsOMYKUqPib6Ul
	n5BUUdH2o9OU6mc07tT2CVHB+KYKyl6YA3TeYBaHKxsXDhjDB/fK1LmSlom44ubz
	dJuxLCFcbzcQqer/yZgurp/AxMGPYU3fBu5eyPGylsomifbrpHShWeBY/+RwUSPB
	4UxFKqH1ynlD1DmpEiExcjSSP/0AVE75LqRlRRwG2uOGvS9p608BhwPmzvtP4ZRl
	MFzGDEfbPiLoJxjtdzWx3A2V1ipYpx6ycV4dmSEXgjY5XBxy45AgwG0ZOZqquiAj
	mV1tFQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891gst4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:41:29 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6688d64bf53so4565295d50.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429688; x=1786034488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aF+l9BeJEjOCx930xc+un+WIoVHa/ZgTrH/eyrfC/jI=;
        b=hNPFOvHNfPB7M7/sL1hU0w+URzSY3c/KCWd/YiPqaYrGBi3P3gjWnXCCcy1lN0Xtua
         lvNM0+9k/+ZrrdJ5mYGYZ7mqMRR8eTUzlv6U24VkF+zQ02fP1vTqmkFQ41Ws2byK89uz
         EogKm+x8QIkCsHLJTchWPfsWHqpXarR7IQptLYmc7wyFjXmmaU6rzGKm97JqaOz/brBF
         4kULrl3Jav2e7b3hOD1gt8FSx3kYZW3E1EVCoIsBPgOWr4HEnLyvsqEF7vtWj45XTSUq
         v9wU7H1L8RmZRkVfaCHzldBLXyYsGo3PqN47uvj1uvedxo75V3QJWTep4zrMhONssK5k
         WgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429688; x=1786034488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aF+l9BeJEjOCx930xc+un+WIoVHa/ZgTrH/eyrfC/jI=;
        b=rmuuyTEfSUlgi7G6EkIq6ytmRw4vBQBtj/qGPSuq4QYmk8qSNHtI3+H3TNa0LozKXC
         pdvri/Vci88c9zL7PmqN+vPScumkL0jUiZOyfM/HhOt8cKkaEiloR9YGkgASC/lYHkhW
         pN0LedClroqZXIE+xuktauNve7HNABVAqcXGh9HRsIJ54ySf0ftwuIUzxun6TDA764z9
         l1udg6Kbn9BGFb/67HDCnmMF1ijFCu9sVKKPBms6tjWdFSYk8Y3lSsj88zi5sDBHgfTD
         ThYMv+gXpKd//urP+vJCJdhV7j19H15yvMpdTl5AcRs8Ai1hm01l9+LwupchuBlCHHk4
         QODA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9CWpFiP8TbhJxC/h76I3l3XAC39deogPV5wfA02qbFyFcgWj7YrZfKSDnORDiQX8yA+Cy3fZs9F9R@vger.kernel.org
X-Gm-Message-State: AOJu0YyZfUdJZopEhmhzjVWcAlcNklDSAQt+WHeP4VrdQri8e76y/ViI
	5+dlYzmTQB5RDHFOB0MWDiSQkiNAa7uGYZLxOGKelK0OXqjyNo7blnBQhif3jQqNJLIxHB1zsLJ
	MIVP3ZCVliGkotHa/0vFzrO8qxcNH4gr99K7UQHPGYZGoqIcivXAni2EiU/v6rxS9
X-Gm-Gg: AR+sD12J5L2eRRvqvgPvIC7Aeps3IFeK+AtGfdzaKxIWOkMXSoETixmDEXJ7c4x9wji
	03kE1dzJCYIHObsdiaqsoBlnqUJOKsYvjB6pAZWU/flBm78rM7XSi3D+vQXHPkA7NRPRvmRflW5
	lsp5GS6mw94mvDIvu4s84GEfa5GMXv5NwFtca7gqUl6W9ko+3+5amhipmJ+vGVuOf+rS70W3S/h
	q4tm0GFx55ootWd98ezxPpXT4CdofOSWwKQdb+Ju/ueBVANKpDwt9ibomWDDElw92pUdK7rjsdt
	hsiZX59Ljy8BuEOhVQXwaG58isESpUi7YUUIGz/CAo/QtoEVoofIlhmRPL2h/r4mxlXZRaOAbfK
	zdZl14pjkhfh8iG+FEpS+XZsvp4Gi893E7utps49XakL4lBbXxiX7sX58GG9A61jKYA==
X-Received: by 2002:a53:aecf:0:b0:667:b5d4:98a3 with SMTP id 956f58d0204a3-6693a62cff9mr530863d50.96.1785429688506;
        Thu, 30 Jul 2026 09:41:28 -0700 (PDT)
X-Received: by 2002:a53:aecf:0:b0:667:b5d4:98a3 with SMTP id 956f58d0204a3-6693a62cff9mr530830d50.96.1785429688008;
        Thu, 30 Jul 2026 09:41:28 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c95ca34sm1627738d50.17.2026.07.30.09.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:41:27 -0700 (PDT)
Message-ID: <ac813518-1fc2-4262-a166-dc54545bff9b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:41:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] arm64: dts: qcom: lemans: Enable CDSP cooling
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
 <20260727-b4-qmi-tmd-v6-6-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-6-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX8ECMCLcsprVV
 uL47WiP8vq0qafEgiTFCkjx/8/8zjHDjsLekzKSDSN4Mo7J9tSxYAzKQrU1841MsYg56acOzjH9
 t6BGDY+7ookokJtLNUAlhU7h9xl+sod1mu6VOojS+NUY2CGgLNJ3sJSy3wq1A4akrHL/V1rrelu
 i6tbQOAdq/TSi7XQ0VaGYDFRy3ygKjkblWZXlkJzOuQ17oxwAJd1UoeQFNmdXlwTyfNdNruQJej
 Mnem6NYLYoNPB/pSs111EgnXhrgwsqB8k9KOP5goBESSE+Z9ygAZ0hKQ20SS0fZuDZ1cgNNbF2N
 E708+Vw4ROEzXLFXwq9ZvzGxMKMIJaKhSXuWYKpdy37Edk9WY9vj9gMl0DjW38G3eWqTxelQiOo
 tj87wRrVD1iSl3VmDjhAEvF1/bOia7CuZPHg0bOzPBcHaqBlJ9mfx9fo7ahGLCUQDXTn28rYoqk
 p8FuaRQ4EDPvQFbEt9A==
X-Proofpoint-ORIG-GUID: LmjHmJFKqwM-26i0HPL8mhAMcfhtd6XD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX3aYuKu7XoQdS
 ktt9aty4+Seuy6Wbmbo4JkSs2L8wEwyZT8EIlLZWlIaRylndFABLXzywJO0JHgrzT87VQsA5k5Q
 Z5GdpuXHPEu/1Nk932yrFIQiySRWKt8=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b7eb9 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Oo7k-GI02y8c9wmTVmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: LmjHmJFKqwM-26i0HPL8mhAMcfhtd6XD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300125

On 7/27/26 16:22, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in lemans.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 105°C.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

A side note, not related to these changes. The passive polling intervals 
look very short (10ms) on this platform, may be worth to double check 
these values in the future
