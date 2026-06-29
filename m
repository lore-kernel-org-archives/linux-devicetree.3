Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3691A9F82
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711420; cv=none; b=LFtuD00y66Dw7vRatQcbwn2w2b7J9BksIDzwO823uhncuAg2CusQcf5M6BPNSsO5JqtfFOk3tG+mTCOgH6WjSVSbWS1U6T649zH+rZ1Rdlcg8BpPPxYvD0N8inDEvloeg4UfLYfgH5nQVJ064hn0xZ6Zy+H1gqVMTvL3P0vVHc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711420; c=relaxed/simple;
	bh=T5xDfj4gTS1yOYXj9otH5qZUmbNKwm2UXsV/Ibrt4Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8r3OsLl7vx1mDxXv8UzfZTVhKvr6skt2sr4xfIcL1mO7e0YRgBNvreMWWhQREfA1vy6gPnd/GoJULLCesavtSjFyyS8/r2Il9TeFLQZwm01/IPccTSiQ8YvvU/mp8IiV2JF5FvU/D6nQJjUmqoB3k9fBpSXXoUm3PPPXNoGzfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4EVGE6C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1CiB3Nj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4EVGE6C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1CiB3Nj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NDPK1718813
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+qSzHrPZLIcegIwXCxSbL9utxNx2NUsdPB6ywBdPMY=; b=h4EVGE6CPcygfKJ8
	J/ppWPnDwOBiqTIwRNMgaubFk3tCr4lqdG8L5H85zcRFV+s3H2Y4dXfPWRqKzZH+
	ygq7yuHDuxKl12II/s9PZTQGAnvsxAvDMSRJ2q/6aNfloFXw64HoZCG0ZDZJ19vk
	d7TpdkteWu9iWjA+rbalfRH0okiiqoT2A6R4g6NIEMBhrZDTFo1IeJaHVPHROaDM
	OvbEZZNTWeq7EWvyHZC/AAM9H5OjkxIegBMjQchOEDox7RC7E5SP4hdP7YzYhdpa
	H/J0vMo/KSfgy9UGExB2XG2aEK9Ok6IMLif4W1H+r2CZ9IyyuDM6eipBTnD2FgVf
	Zf/oOg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf4h0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:36:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c890bac374eso3258152a12.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711418; x=1783316218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4+qSzHrPZLIcegIwXCxSbL9utxNx2NUsdPB6ywBdPMY=;
        b=a1CiB3Nj22ItZj6GgzZfHu/47G3nBRR1m/QHaJhyK0YID992+BzE1favQXB4RTkKdf
         oi8komVNWMNVh3BRWY/g0v524BaIzsIj1dxWX6rHpdZja8JAKHBIhAy4xPgsccv+DnzJ
         PO6BSkd3QUQZGKkJCbRfX6Qz+xe90aMeb2tk2G2h1KxdVBY7a/surXplTuH4X3no3GTv
         xJXfBGL5j+BqCDun3xaEFjlPwwVKWiFbxoq4fxZl67svwQfnkSlz3cF4jNrHbIyLLypE
         48U+fYEPmPdsGw1Rw0Lw7RxxOjs8CH0CpJ3EpvMOtuSkY0yCarwvNXVFUWzYj1BvRIu8
         8NAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711418; x=1783316218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+qSzHrPZLIcegIwXCxSbL9utxNx2NUsdPB6ywBdPMY=;
        b=ZjrRGCnO0Lv+DEL9ZCe0sYYt//SyFARRZj2uQW62aODQcbFCPCxBoYOo98K63c0goC
         mIyuMDvk6mkQTUtaM1P9+wOaqPQ0PbAOUli/3ZWiWTrT3/JjVs1hsYma8X0eoYPVANXm
         fpifkMhpcprgLafP7o/xksu1dTDk8ziO5vavrWrRUmSugxB6aB2UMfWvrHtA1cYcz+ih
         exrPW0htHmfuD3YIQjzbRRdhs9FN5E9u3hvrL+bnkUUEFEFy3CF/ikhJ3d6L3BnRZ7F5
         p+iKhAWAp5wim6TipE7yioFUGgml77MucvmI8XkE0CbRJ4/lPCMUMmOMYyZ+oVcKWCNw
         DTcw==
X-Forwarded-Encrypted: i=1; AFNElJ9JWLVJaVPEvfRnG/T0RUIIC4WAIlIAdl+zHPXlCUGMvvcInRbrRNHH2uq9BVV+jAngBT0l83Y734A7@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNSWVc5Mf7Dl2I/cMWHmQDHFi8xSHyu/C7PGQsizaCx0oUL0l
	C3kOKBoIGO6xqJ8xYZNqhV/lwzGpyJXzU3hK/v8Mn8SQMDmCcnkU9uK7MoRknochlBr9J7oSd/q
	kOvz6xd/TnluaeNqUHlT6DDaEAXyePtOWU5Dlu0rK1R/N9UasSQBplFxjp8+0ogYP
X-Gm-Gg: AfdE7cnUJt5IOLvmVkZqmsTTxkvEpLszBgnuR2DsieDHGS3gbwZrqNzBHfvRDrEUiNM
	vdixS31nEITfSvbXA7hd1DiqBdC6jpf0cQhVgqGL2G5qVlnlLVpc6zoi7PBG2lqvVAHFMhlzHYJ
	L08b2R36bFh6L4XNbDKIxJlmpaL/YvZRGUZo9fqTTzC6w90/FkFRGPgrAZ7GUKPxWw222/+GUet
	SFR0Hq0B81EMLOn9meNa9j0jGV31sBEVnTQhzyvynvPyMYVskPdlUqRKiOuIxAwQWvioVzgxGjI
	n5WTHX9czb94gcIH4/hnMWHjK1OUa7Lphf2d/jeBGfD/+Mf6BwO2j29hZ3FEDb29XJ+kfC26FzN
	LZnvq4qzvjgCMz8WEWFfdnHFRmW7+UKwW6p+HXDE5jXk+
X-Received: by 2002:a05:6a21:9984:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3bd4af44f93mr14859452637.33.1782711418503;
        Sun, 28 Jun 2026 22:36:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:9984:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3bd4af44f93mr14859429637.33.1782711418079;
        Sun, 28 Jun 2026 22:36:58 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0a90sm7143143a12.15.2026.06.28.22.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:36:57 -0700 (PDT)
Message-ID: <afb7e30c-c9c8-49d6-80a9-1aa9671b3a03@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:06:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
 <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
 <14491fd8-f785-4404-878b-5764bb8fd593@oss.qualcomm.com>
 <c22f82e1-65a8-4472-924d-91908f4d6104@oss.qualcomm.com>
 <CAH2e8h52YaKNHvX11HheFAK9XJT9KREQrQ115AOEOJS22UWV9w@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAH2e8h52YaKNHvX11HheFAK9XJT9KREQrQ115AOEOJS22UWV9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX7m+OusUgzJsY
 QT7Xu/nff+TUXBZSiP8uIufadApFEqP7btV+LfOuKCrdH+KcvC4GTHnxOZpLIzAwiWOMG/7OzQz
 OQQBB0clyDLfcmCcucaJd6OAX2+wIJ8=
X-Proofpoint-GUID: z7kCD8iENXGXc1xtQJsxWXC13XV0hUHn
X-Proofpoint-ORIG-GUID: z7kCD8iENXGXc1xtQJsxWXC13XV0hUHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX2nCF1y6vEmN0
 h+dd9gRrBEduYPp7xTzZpjSU5Vnmca5kUdHPJA+FEE8ai/uJEBSuhmb9QwfQpNguhGdxrO5RPlS
 9GfuQvXdyt8uDy2P1MFyZGPsbZVm95DeBqyEova7gsdN6vhW+XxszTn9JVpDZLo6DcQjEPxJINC
 rEdLgM7J9EFdXfJnmS+WKpUyXwnzIrJBQCFaeqUDqaB6qUdGDCBu7kkHLzPc4wa44SdnBS04xg8
 AM9bWYzpaNfdbCO+kAWCjWz6nMAEXa8tgebFn9WkruqPFvvjqLy+Ln+UE+iO+rWHr1/8SfZWAbP
 SpHSXVu3KoCXFKnnr2ClZpsVw+JOWMXeYFVmvgMhxDw8vZi/5MhVrpDW0o3E+n+KTyXJrXpLK3g
 ex6pw7SZLr6GMxnKUSABzZ56qKNr6a/pOBm3Cum9vvoa6G3EwbwtH4EJH6v/jPx115wK6t/Ohll
 i/lax+0geBkcuduIqWw==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a42047b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=-sOukg-g24Gd-ASWQDMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290045



On 6/27/2026 10:52 AM, Pengyu Luo wrote:
[...]
>>>> This hunk is very odd:
>>>>
>>>> /*
>>>>    * in case of failure to get gpi dma channel, we can still do the
>>>>    * FIFO mode, so fallthrough
>>>>    */
>>>> dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
>>>>
>>>> In my understanding, GSI DMA mode is always preferable. +Mukesh, do
>>>> you have any insights?
>>>>
>>> GSI mode is preferable but if for some reason it fails, we try to continue with the FIFO mode. Just fallback mechanism.
>>
>> So, would making GSI the default and FIFO the fallback option
>> sound good?
>>
> 
> Yes, I have sent v2, please check here
> https://lore.kernel.org/linux-arm-msm/20260616122605.668908-1-mitltlatltl@gmail.com
> 
Just Reviewed and Commented on V2.
> Best wishes,
> Pengyu
> 
>> Konrad
>>

