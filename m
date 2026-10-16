Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BDD34041B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142056; cv=none; b=RNRF8hOlitfyDv93fE6YMnqAu+e6DjtssgiBswcNGjlFhD3AgehOwcs5NN3/H4k8tUnjDYEIRQgxFipVC8pJAu3t0t49ioerGlFTuAQGWK4t++agmaZgQRaDvwljYiZORa9lNfrbk+JXMnpo1qrm3VmY0ATsdI2HBZQpMB5M1Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142056; c=relaxed/simple;
	bh=OJEq2jEr53ZPXKtp/Mi680q8DSbM8duPldM1a9SdK88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsUMtoVXYwNfJV/LWRKFh1p/1g+z4xVRcvuNM9c4GtjHZfY96+qCEGAyGnW48prtvE6OP8VLbLnc9eMIZgXM1Z1uUVUwLkzZLRxhOJpfQ0QWxeakPYOf3UZeNcOy7NKNCEFJXGe3AC2OYYB3RZJ7KYRDMHgDddgdcFa436YwcKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdOlJQdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYvpOr5a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdOlJQdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYvpOr5a"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lDNp1761526
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SrmfRoS479RGoNTAm9ZWMnLNQHWSSZ9Tr8xg5KM9gZ4=; b=ZdOlJQdvAbIjdPSC
	Vy9+CDU/vIr143YD59EQ7OMYrTupZmxkqtPLmQ3L13bVy7NXmseGptjs4b7cXz2F
	10NunXJvNVFeMM3h2ez0N5C282oCn+bW7kooesVDKJB5lqjhSI+E/3VDDrHMDDuO
	o/ZO7U9nO/LMtzOFhqSE9qo3NtA4BR5DBErNiRVzHGgWH/vraMkbkNPYlC0rLedp
	f2MkUKAMOfc7u3B/T3sSdPee0Po+Dq79CwF3U6jLe6k+RSfuqVHWZMhtLfiTQ2ag
	rA3KmCXNqh9o8tgGf6LXBvtVpZwCiMLMPrwPIwE0p1jwuxxo64WciA5imK+DhPEf
	1hXe/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr82y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:14:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53635fe2335so434851cf.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792142053; x=1792746853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrmfRoS479RGoNTAm9ZWMnLNQHWSSZ9Tr8xg5KM9gZ4=;
        b=XYvpOr5a1q+omb8/LPqgng6WoFPkoOv6zqlTAHMy3TFOWiKpv2Va/EhpsHRlKUHaWu
         e4sObi4+aGjBxhbp5TlFX4uXTGIK6VnEHktoKL1Nd6fPqJENFo04LMF3hnqR9b8rJfgl
         gI3SBY/bAQzOkhelHWDOYUf6jt85JN0k96NbnxCxL9CstRMCmSBCk8jXb8gghU2dc3gV
         7n8cecWDdOLixbXymCNELQ5+5J/xzl6V0Ol1uwfGfLZI2RQRdzucyPjWPpmqLcMk2eIC
         8C4GVYFqH9osiUP7jdwaRCGDbUbaguCb102RQy7lx2yR3xNe/4RI6lIupj2iS7sJ7R14
         DE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142053; x=1792746853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrmfRoS479RGoNTAm9ZWMnLNQHWSSZ9Tr8xg5KM9gZ4=;
        b=Bup7WUF518bPDniFM94AVjmfLxe1Qx9qGsykJSeVQsrT5bGitZ8ivaZpzWIZz+P6u6
         YssT95UQqpW9AxpVUSuaOVgGJxHotIL/ZoI1Rn8g64X34A8EBOzWbdTbliWjMT7avWS1
         TWop5gKe9g3sHzyqKQhFLuv/RL8mYGkqLDQtwsTwE4sP33HUj34Y9HlrGPcyiGDGnrOw
         kFNWv+1mezGtidO8iHOwDLje+pldPiwLsMNcy6JhfZed0dkaHkpg/hSh74lzzEeFhO5a
         PUtHtI2kS4oXYIVKLeWeKQS4iC/gAmvpyRj7bngGWMq/LPTQ7JLM/v2Wqvnj0IeUkzVo
         nZlg==
X-Forwarded-Encrypted: i=1; AKwUvByaKMKqBufZywC5+WJyZ2NfdYD8N47EziOT8W/6kBZGFFORYD/RmIVtr6rarG5Gu6nXmm6vSaJUmH41@vger.kernel.org
X-Gm-Message-State: AFq9FYJWl30KLtb0ndY0Zha3bMhG1wrmI+xlJMsYui3maBJJ6/UgG+LR
	TSLaeO32+65RjGuhI4ggTn+TU7+q+SwzLBAOhkOtkNO8BqT/KgOwVedlu4QugC34OBHKUgYYvGN
	W2BDovAV+BASgrEkFo79+LPUp3kEoc/CumPrEx0C9//wiGQyJWup3w56L9TQ/AXES
X-Gm-Gg: AYBFou1oaYxg7F4ZFadOMo6EUhwSOgTUGB/CpLCpq2d+fOH8dLodJUPXgeiRiwyXl0F
	BEX/RAeeGzmpFCI09QsQ7N//e3xTZYfVRCoGiCIVTb3VDLOQfQMTMR2lWwr56diQTZXvuAY37i3
	/nL/ZymUdO5+OdRSTAFhoBXkl2nORvm7l2/O7uSm+jTELuVWxCzihaT/xmXJKR3gZNaUz2kpSNs
	3t8MLrLVGd8sqfZrVoRxiisRCmR3AlPT5W7uZ37UJ3l/l9SVPxzXMC0O9Kx3dUjJPBePXoJVTik
	jtEIGZ2EJX0KevS6MCMfH4Vc5jcQ0ztA8mG7msnTDC/7WKfoQHjjTC/Xo97c4jvm32/T4Wsm0ef
	Xz1y7a8pLLDEEyDp3FYlGQA==
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr420037471cf.0.1792142052837;
        Fri, 16 Oct 2026 02:14:12 -0700 (PDT)
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr420037111cf.0.1792142052249;
        Fri, 16 Oct 2026 02:14:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c1282sm53264266b.63.2026.10.16.02.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:14:10 -0700 (PDT)
Message-ID: <4244177c-2ce0-48b2-9a0b-d63f1c420f9a@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:14:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] dt-bindings: power: sequencing: qcom-wcn:
 document wakeup-source
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-2-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015041241.2186521-2-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yI0VzS60g5huhOhGXmjgxgdtcX7D9CK8
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1eae5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=R5NHEjnr-bMx3tpQEQMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXya/niw6/Og2i
 lR7pE/guQXjm62JGtFklmrX9z74zR8++o+W3geevJQsiSJQW4StIPnKGcFR3t3NKAf1qAptfyB1
 oq+JsFHoz0ArYsor9ZWwpUudDwkuteg=
X-Proofpoint-GUID: yI0VzS60g5huhOhGXmjgxgdtcX7D9CK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX0FZUuULADyhd
 sO0n8/EGmLqhSUCArdHhVqZKKrGwopxiEu9KxW0OzzSG3IEovodhQ+m+I/wy+v82IHXP/ouB0Ku
 MzMZqiUVWFsSwNmZDI/Mp3UTocE4I+NznjEld5GgabfX+w9UVgxuptM3R/Xz3f1KdvsCZEZw+jL
 pKN77idwRLdqUcs8hADuBHcbPIbhGPdHkRDoFDuYQipzUHdWbIn8WvVYSf0MN5GMGkqWHZ+PoCj
 o09ABZ1e6vpwLnb3QSTDD9ONdfS6P6c2lYd4DpSrfX9HXMjQkFOtT9yHojIL3AaZdYcgAGwLBHy
 hGvNI8aDdYCQ9U59vT6WYXvp1vW3mHKopIxHkXT810U3wfmtZZmAxJbTUirKvGntDZdP9IENl/+
 92P44nLafcFrPnl5TNtKTNKZWyM5fLDX47NcOjgYtDo3X5db7mAlNxbVlMVIcn9OETr52uuaTCl
 QF8fRx9Hx1XqA8cyejQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/15/26 6:12 AM, Linghui Wu wrote:
> The SW_CTRL GPIO can be used as a wake signal on platforms where the WCN
> device must wake the application processor.

"must"?

> 
> Document wakeup-source and require the existing swctrl-gpios property
> when it is present.

It's a little strange that the property lands on the power sequencer
and not on the WLAN node itself - although presumably it makes some
sense given the latter may be dynamically discovered in the general
case

Konrad
