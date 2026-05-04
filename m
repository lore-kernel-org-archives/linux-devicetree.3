Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8D2311975
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881259; cv=none; b=EWWvBrarmAfAJE6fYQrFB8mdLFeULMbKpzkMM3h96IJeywM2fynvNMA5v/3FjIzSPUMCWTtKF/KV2M7+zA6caSLEBN7U9TYD5pP4S7P8WaIvuU+vGJDOVNCuDOqvHo8GIzCgQh7MnaIDzT/Mk3tp07Bq0YAnBLnBI3FoFjt2MvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881259; c=relaxed/simple;
	bh=T/NTBBFEzaxAlwpKUc6y5t7nXGWmMKdb9NSBix0FWmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uykU3ewZ/IbH/wjI0yyxPCfbTdniAVcTal4f0sx5aKjbi0Xe55+AfChyyUkV6W97YBj2UQsr6i5fLCp1L5HXsW/cDxjUhCPcX6m4L/n0AcNv4AhdO4HEKBuoFIjixjJ2i5iFWiHI/WCvmVRJvw3TODvXFI1i/JgtteTHQRv+82o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eB7tNgAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R29SngMI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eB7tNgAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R29SngMI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DJG74174410
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 07:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Za4labmzB8LC6ifgc58LLb3FdJ28JeS0v47Vu+6GOvQ=; b=eB7tNgAMC4ra69B/
	OtlZTyQyB7nFDWo+BDSEiD4JS4TctqFKtCMdJtlMRTVKUpbUFlTWBScO4RatFCK0
	tNwn8YdzCOOFthupdnoPRNTy3Mg1rlCXa6X5016QZxI+q1jLwePiWG3ZAR0OQglW
	6Q9vN86xjh1nE3vA4XA2t98QIzKe1i8G6Z0YjRBoB77ifJKoo1DVTB/4XxGGHyBB
	i7N4lb7VJ4+MiBI/D6a/g6NfZPLc9swyooOYmK2n4wT879tHUje+xAHSNeRZPACl
	mEnO5K+CnasulxUpwpG+qjJ27uxADpkRHsBCp8vgAVFswtrQbbUeiA0YceEt7Vkq
	s4lW0Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9n8cq49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 07:54:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8156e30b6fso781369a12.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881256; x=1778486056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Za4labmzB8LC6ifgc58LLb3FdJ28JeS0v47Vu+6GOvQ=;
        b=R29SngMIf0eRuWbW/MmUPNYc4YbG97dScZQdR6xIj6QsUY1WLA/nl040hCSbTvuVnN
         VEIjidBS5NqW5XHbQgzpppdaTBodh+6oNg2NTuCfXSe+TvchUNwkevtCu41wYQThf2r5
         MloiFCyezG6YWHjNS+wZ/YYCp7lybj4PHedeqDTjLUVqBiX0ZmCH5XTyhhK/HfOr1DF6
         yqwCOHf0UWLnLVT39ynlUjA7xdsn2Hmr8aBH9yWzP0FG5q208VK95y251ailqoe4M+K+
         HbvTUw1Sbq3UlLZnznNiQYIn34w+kLgGjnaZxNSez7XM5UMj+ZiviSymKCLK3gReTJuM
         rUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881256; x=1778486056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Za4labmzB8LC6ifgc58LLb3FdJ28JeS0v47Vu+6GOvQ=;
        b=C9BT1Q1DTY+vRSm2HrPkuc3E9Cj2Ezp8mgCl6nrw4Jjwg1cpjOAZJkTHVq0tQ8tyaP
         GppXcHmLADmgwkQaEGQcdRF+1gjFdQVrlL9x/YQybWBOaksmh8tmNZmzPlaE9AunJT+E
         dwRMiUPdzIZLxVo/RRa3OkqKdwJz1pDyACjFZ+U3DEFyyc9zBSpPbIJ8rQNdNtLDOuiS
         gUfypZIcslbQW5WKh+LoxQMMnt/hiWzhj9j/sHWJwR5QUXzDbf1dZzKqTqhbZIJQ4M0p
         r3J1hm1XS2By832RcrW+0J71ojNvCRX14kWP0+hUIQ2QVxIzMPjJ+eOURYN35e1npjKS
         Z39Q==
X-Forwarded-Encrypted: i=1; AFNElJ/fkWq9ZSU46LH4DJBKTOJ22wT9SVq18JMQnGgViHKBM3RCJ3V8f0MXTmmQP562N3AA17EtF3Z2AMp1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+iF+VeBxg7tYS99F6GXCqqTvm3HuAVa4eN7RXiQPVmyIDoTc
	nF4Y32Ej/afdoU/w8w4oE/+YvzhnkEGhy2srQVpfTdJj6lffuBJHE+BdXNT2gYdp2G6QEp5uaxJ
	ynU27A6HkKYf0eBDO7hovfXCfzrkyivK19NXX+Sjpj/7ulQKSIiiQXgIr+LpFbTX+
X-Gm-Gg: AeBDiesn0f9pP/UhLJ5k1/jnGIBCjWHJNIhizyCi4qpOMfdORwfJsePj37hR8UXmjSu
	ZSHtLqZr455kREuCPM/rDAaa8881yuRm9Qw+fvboxhKtvKNscPslx/IKtqNV2KMDaT/2cdLRRH8
	ebwg8Z/gXNJvEhzCPOCnNJpTfTkPs0ghrruFNPU9lxr1dnDouT1N+j4ois3BhnJGpeOooo7LOaS
	7Ts3E1g0cp0lAEpqxagTDLAKF+//laH87jZvNXupCuTxVpQwoDwW95aDd+37DQa0TKmlLvQ2LJh
	lln1OrNomkFfZX4kDyQC9+w5gVmNJoONoK5KiVJkNgL+2uqFVFt/JmKOOEHhIzFiMd/vgSi22RX
	liOSoAHTlSCgFY7fB3UNaIb5JjZrU31+7/0qXEcwzzrW1qhOgvGEz4Unc3Ys=
X-Received: by 2002:a05:6a00:300b:b0:837:7e7d:3c8 with SMTP id d2e1a72fcca58-8377e7d0876mr2821340b3a.39.1777881255876;
        Mon, 04 May 2026 00:54:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:300b:b0:837:7e7d:3c8 with SMTP id d2e1a72fcca58-8377e7d0876mr2821322b3a.39.1777881255415;
        Mon, 04 May 2026 00:54:15 -0700 (PDT)
Received: from [192.168.1.143] ([59.96.95.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-837a0578a92sm2350052b3a.57.2026.05.04.00.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:54:14 -0700 (PDT)
Message-ID: <f671a58a-d3c1-434e-8b47-472b89f520ad@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:23:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
 <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
 <bf1e9880-745e-4c7b-bfde-3c5ac39175fc@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <bf1e9880-745e-4c7b-bfde-3c5ac39175fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W85UrnXuI-QF_QMVWFrgeux9PlUFpGUl
X-Proofpoint-ORIG-GUID: W85UrnXuI-QF_QMVWFrgeux9PlUFpGUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NCBTYWx0ZWRfX/BR2u0BSozHS
 7JQ8R/SacV3Nflb5UjVK4TB7LasFpY/k+4cFvqb1skLWT9DJ6yNQfF6b4K3vSpdGQy9IuK1KgCx
 AmWP++Ih7yXxL+xN2eQ1iiBYMdg1QrMXBnG7cBptuyRQrHYakiiG43VXlkgrYrVz1+sc/xqwsDM
 OkD7Ng83NO2DLcXHl1U/4TGzSKwiW/3BC7pAAYHuWd7TMdXm/ONCRAapRepzLssp9ftjRVAP/Oh
 a7Ns7oYfsWE9gPSGxzz41k11HMzrg2J1RgdP0HSX0y4O+UhN20dK0yrnF5KCOiBp7IJSS2oFwV6
 qW/+K/xoqQ3uxUyzi6EuS02bsWJHXYZl4vP4AOgk3GSR4OEXK0MGoPChsUWlFE2Y2Me6Gqmu3sn
 5562tY4H03Bn0edaX80celQ2JvXEZc+7RqgVAZiDg27XMytzz3lZw3cqE3n/yzkMP3igcyhyNLz
 p4vRsE4UrggBz5gobUA==
X-Authority-Analysis: v=2.4 cv=ScjHsPRu c=1 sm=1 tr=0 ts=69f850a8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=d18XUvOkrfNYrh/LwM53Ig==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=v733AJcmkcc0okto1YYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040084




On 4/30/2026 4:24 PM, Konrad Dybcio wrote:
> On 4/30/26 6:06 AM, Maulik Shah (mkshah) wrote:
>>
>> On 4/29/2026 6:41 PM, Komal Bajaj wrote:
>>> Add pinctrl driver for TLMM block found in Shikra SoC.
> [...]
>
>
>>> +static const struct msm_gpio_wakeirq_map shikra_mpm_map[] = {
>>> +	{1, 9},    {2, 31},   {5, 49},   {6, 53},   {9, 72},   {10, 10},
>> It would be better to have spacing before/after brackets inline with other pinctrl drivers.
>> {1, 9}, should be { 1, 9 }.
> If that's also something that the generator takes care of, let's fix
> it there too

Sure, we will try to take care of this in the generator to avoid such 
cases going forward.

Thanks
Komal

>
> Konrad

