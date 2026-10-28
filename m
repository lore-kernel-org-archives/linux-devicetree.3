Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192101;
	b=mhgo69erwTHA+mFiGG+6eqO1mEfBi/Xlc0Byto6MfG+yHej7DbrMEPD80wTmMoyQmHWE
	 ZbFubS1tGwSaEyc2zys5zR4EofP0YRSbsOsWnQ0yPaitKGvtr251E8Nh+jdok1dhWZZat
	 IJIOufup95oY6cXXVHWsFJtINfUrDOiVIrCCLMzJrZUELm6wJP2OI8XjZ64JxlO1qCAJG
	 z2N4W+k8WQ/l7Sm49cAxJi5A8AIZIr+cEVkEClgWzjQppH+t+OwXJA4PXB7avsLIXqIPN
	 fXeEvEnZGvHuvLuhBhOc3ThHRe2EWSIeHYylfsQh7wWmvg3GKfLiZnsbWUzK6/RxmLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oBGX3wEUWU/zL8/JcUQMeSMNE0OdIiQmKuQoXCX4P/I=;
	b=r153gb4UfkAMHyHDv3ay6UwLqqP4j2zPS1JuzhO7scr1oswo5qYUxr2yvyuhRW/DxHm0
	 DCohK5OTnMqFM/pJJRS9qH0RjtJG08oNRFoWUMhXZJElMpq6rYRAHkuZRJIEo3HZ/tQJd
	 2RtM7dpg2qr2Rm+mR/VazqKN4YiY/u2Kc+QSbeHMR0KPTYU+VrJyG5LUghY979pvaAwCn
	 gGAaWpNvPQVNg7cezQxhHUmWCD7LXYNLw3vQ9wQ3+VVRzNw/ZxrqPuM9WoABQghe184Q0
	 u03GFD5gCR4WQn7WAzrldoZDGPRBV/aq4reY/ZE8zAA1l29XoWniw9wm6rsZ+XY7W/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6u90Gqi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuExwkTa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E3606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D83E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6u90Gqi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuExwkTa
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4J13704227
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBGX3wEUWU/zL8/JcUQMeSMNE0OdIiQmKuQoXCX4P/I=; b=U6u90GqiFQG1SvVe
	b/7ZAEfeyt6CT2fIbV2taQhsmuDKtZVKiz+x4u8dTDvceG6TIDdV2tT8aOPWbaY9
	jqbfr0uNY3ipYT4UkfAWN1h3GRkfxdBS/nkSgUmAPciCC+KCd7LXpuNraJFMvmJ2
	vD5HVicr0NH/Gs8pc0hO0dgfypEX6JmpOi8sVeqY3U8GZ80eL8S5OZA5wRN9APfW
	KxCj/L4uZnPS6n3D3AQnz9JKlsC25nHSFwJ+VZBQvfSjOZOBr2o+EeKCgQif8OW1
	buV4B8HQPc/a7Z2r3SVMHh070uTuWpxodJFKgzq8oPBoqcBnOkmIBMWc00AghWfG
	qHZ8/A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy71484p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:54:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaad898904so47683e0c.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192099; x=1793796899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBGX3wEUWU/zL8/JcUQMeSMNE0OdIiQmKuQoXCX4P/I=;
        b=cuExwkTaOWnC0henazb1cB0kjMcMPO/l26BX8MJeFjxQV0AHgXk+/jHSpH4rgFX1Wq
         VKUQJScQAy7Q3hY0iCc03ewUrKcYGsMDVa5sz2IqRn4Q3yUCqcLRFhdB7dOftJjZ3XmD
         mwKUrTeMGcNHx1LLa9CMUWQbcrdUApbhm06t7hsAk2xmEKDfXluvkra/jRgfd+w0DZZZ
         QUnIQNF7KaZv2OdS/APF9FJWbV65enEcz3sNfl0+GECCj1rw2SqBIQ1cGnd05mL/UaA1
         LTX/9DuZR3UVMwWx7FBe6zqHDJ8B4xY4+poQqkEo5agbRanOKRfKx7QqnZ2+OrTHrZ5g
         KyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192099; x=1793796899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBGX3wEUWU/zL8/JcUQMeSMNE0OdIiQmKuQoXCX4P/I=;
        b=mXBrHrZPJ52824+Ait7W346vjHrSApyDyGwYM9sW5Rrb/2qxwLjkKPH6OpOpiL8l1v
         s/mIokydZ+GDdaPGk49FWW7w44glZ81ZN8WH8Y83z/cYjQ9xgueJncl2Sj1dMYAQdEDz
         v6yhijwk14NqDkik5xjXqyimYH6SRZzKGrNTs/3Nu0GaFdJkZJWNiN68G1hkZ2bzPoVX
         RsPuPgXqW+gTT9xTjermnswE15NXE4i6+DwTcBWSOsp3QCbHWSz8oKKCphh24ShGZrLL
         bePv3HLbTamILv8qZO4z4uq+qzoCWtoyDmNuB7WGU5gl4dT3xvhNiU9Q21HmJPqFIHPo
         4kQA==
X-Forwarded-Encrypted: i=1; AKwUvByKdaVQD80sayMVSc3jY37v0e2TKatYh8ccnDU7mWlnCuGTvh/TVTTNeoR3tZwBaOTVL2t5NbeqevQt@vger.kernel.org
X-Gm-Message-State: AFq9FYJzDSoO32MAK2ibdYkZlc219moZ0zRv5WpfWAZZN9EOstdqEprF
	qRIwBQ14s21DwjooNNiuikIhTe7zKoinq0FJicBnI8pkuUrFl8Zpuk+pVXLWl5QYl3XuM9O1mwJ
	xZbg7ETRy5iYCwAICWiJiNNbyBeqpJFsLvcwqTKJGpVrrcQsIq7xG8LY9EFgQ95g9
X-Gm-Gg: AYBFou22oDsA+xvSew25rQoxa98vv7Y3hpOKLDXxb88kSSpft18E1lQsOfnnkjTbMKO
	xY4GDe5cSJDEZOwOof+NDK6F8UF69qVdDgW8l+ovM3T4F87zf4sGv9pCkdyT5vaFqUS5f2sBCgd
	aeRSL+QVXBDQoTX8gnq48u3jD6jffr0l1DTukTrHBnahhVCq1gulS1nlmf173BCvKezXO9Vh/34
	Qj8kyeDzFDpQJE/LG4gYHrNxlz609JIyrjIQ9zBou9hE+EbO4fCIf7F793oDlVpGQiYYrbEACiu
	tOcygx0nFNbY18RT6DiixVGmDw57yE5wvyCWssg99nEaVIAJ/cD3IJIzaiPeCvajInHHPMUbAYU
	oCL6qGXWc33X33gpsCO3LP65pxzP+a5fnzu83ZrETbOo44Ti9p6ELbn9OvqLzPKbZLUqLg7s=
X-Received: by 2002:a05:6102:8483:10b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7d03a54962emr695004137.3.1793192098753;
        Wed, 28 Oct 2026 05:54:58 -0700 (PDT)
X-Received: by 2002:a05:6102:8483:10b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7d03a54962emr694977137.3.1793192098370;
        Wed, 28 Oct 2026 05:54:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964601f2sm1405843a12.37.2026.10.28.05.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:54:57 -0700 (PDT)
Message-ID: <465b774e-b62c-475c-84fe-da4fabc38b10@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:54:54 +0100
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
Subject: Re: [PATCH 8/8] arm64: dts: qcom: qcm6490-idp: Describe the panel
 bias enable GPIO
To: Vladimir Zapolskiy <vz@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20261028095151.1682096-1-vz@kernel.org>
 <20261028095151.1682096-9-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028095151.1682096-9-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXzHBCY/d6O7YS
 A7KjRz+YDCguJauTV67MMeRlzTwF+XX4xaXM6NY7ihsxEKbT7ksE8DzAhQlxRZhjq9GSa+P/g/7
 WVWmAllaW5i8j1wAasrCftX9kFg7zENfAzJ0NFzouKt64tVYtTC9OTHRi4qU5fHB0cf+oGXB3gV
 yZicRgRqAvQx8ZuOspJlo6UJcfoRsDRH053D2vDkvVoP/cVj0qgDacyJop/yETAb5sK9Y20c4If
 XW23ePnmBO8IGpsy8eVp0mPw3fkzkbmdvyoaksJ6xvLnrLpVCRBo36ymWa1xEpok66wJOwX2lrQ
 +Kqr8hvX8R3NCGGCMW8wL2nnlzy/3TmBU+8LKjCWiKRVZDN0l4QhvZO9zNHuBVWA27m511MPWbW
 mKdUiI2cbsk/WkD4m0vGIkW+s1A7pjJ5WyGjOrDyF/xQjUaIljiO9YARnX3BYl9CwMXmsuxbnxv
 e54+mh7/j2IJeS3hOag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXz+bZht26bKjy
 AxoPvVCFU7XHdMF9SxTVagnPJVYQ0gMB/RHYTezfZ61eyhKklt9eQKjws6RztHaqUdOlwqX+ddC
 O8DaVLc91cbTIKmlixq9G6YKq+Tk3Jc=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1f0a3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T9w7Rm2z-0zB3deyQ8AA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: QkJpL5ELNdcQAZHnTf-o9jwc1AGP6rP6
X-Proofpoint-ORIG-GUID: QkJpL5ELNdcQAZHnTf-o9jwc1AGP6rP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051

On 10/28/26 10:51 AM, Vladimir Zapolskiy wrote:
> The positive and negative bias supplies of the NT36672E panel on the
> QCM6490 IDP board are switched on by the PM7250B GPIO2 bias enable
> signal, which is described as a single fixed regulator supplying both
> AVDD and AVEE bias supplies of the panel. The fixed regulator does not
> describe the hardware, it can not supply a positive and a negative
> voltage at the same time, and apparently bias supplies are generated
> right on the display panel module.
> 
> Since the panel binding supports the bias enable GPIO, describe the
> signal as such, and remove the oddly described and used fixed regulator.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
