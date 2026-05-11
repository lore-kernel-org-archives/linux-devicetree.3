Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ACB42A9D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778466287; cv=none; b=ktia4+dvN+vqLstdP1E7lBIJH+uHb661ckuRAq7Hei70YtEaQizEHLCp35kQPY7IGky+KKD3BH7Vqe1OXUHZ2SESpJmRazoruZESDJbxwMVBiAhr8ohReDkuOSDOd+bwm0rBC/2F+FiggOvxmuXRUw12IcF2O0Jd9LNQUJInrtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778466287; c=relaxed/simple;
	bh=z/Oc9IGzqdgqt96PWJXKU1AhRYn4A/ccjjjMOkRN2Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+FWahCtI1cx/HOc7TyNByulU7Yg4dBi8dnOd3eEwTzzG2Up9mdw5uouNgpTBbfsG8pQvPzggYF0RAQo6Y9r5rUU3KuURvgo8pAsYZTLN+wWwhUh72GxDD8rTa9RgBj35gEyC+/6lvV4da8M/jZz2rJJKDs3nJ7VQus9aFgHLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXA8KIRd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsNtZ05B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXA8KIRd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsNtZ05B"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64AMQlhk3509047
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=; b=VXA8KIRdowG6Ps/f
	8zv0HVMzFMIYzuxxUOkhukFSFNHVQn9Y+kXeWGGtumsMTHHwFO8xGMF2Z0vQRGfh
	Nw0OhfDZWAe/F/N3/a0auPLxWPJq0yy6pFojTg52SXyttklbyZNwOx35VvYw42zk
	atPXPg9O1GbNJt1diMqlv/cCIhkMbNBbIgg4yxaXus7cdAtsu8YIx0aZW7FaW1mL
	zznfWgwuJZ7BoIOr1vhRkb+6unfTHtDSb7zWeDSBnlfiDirQsxeQQEQ+m2iSfKrW
	rCVmnKVmDTPWU20Zafee8J758wnULpxJCUELtLCBiouS3tO3RcvP6uz7IgJORWWX
	IEQHxw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1t9q4brc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:24:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8bc140520c7so64158776d6.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778466284; x=1779071084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=;
        b=gsNtZ05BtCjwHhgDdKkv1JYdWZXf3vzy304PjCWDfBtmxMd+igXrWmY1m630LWu7Xv
         jBHbUOkG6nDCTo9H9F9tmHopxXwlK9hS9Gha+oUGjNZBXEFgbNpBOMWX9RvwFMD18OJN
         E1jVepOvyUXC/5voN60xam+wVxUDrmT7kBU2jIqvrWbpU80EczuFMiP6UgPdcJRjTLkJ
         Q+Hx2ZhI34RFMdK2phSfKAyh9kbbu4g+h4mTDqUhCrVBfMFt5+tv/cBDyNasZo5ilpYN
         OXAVUfzcpFphPpdqHseMyaNlpQtqNlGAxgK4GB0xoxtsubLq5b00dtubKQyJOwc3Xd9J
         AyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778466284; x=1779071084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=;
        b=Vc0MfTYVu0fKaioN7XeRPnslzcvYchPG3i+lfwtUwEkHFA+SmVTRux9BaKjtoye2iT
         5qqRqzTECpl1Z4GXxwTzI3NYKeZSW93v+g6CyKr5U+h9u7NMlD5FvtVArXwIMxgbUtOg
         1ZotS9rCfBmElmoyEa9VYrS+5HckYcXxkLKhc715fuEGJBrw1hSRkD6Jl6bp8Mkn8tfm
         5yrRh4DY8EMmlVW19Pl4QABi/LbqH6HJhxGpSmchBLACqkyqeci1EJSdRXr7ev6eUtMU
         TPTmWIQ1oUzh+7SwlYV8r3l6qXxSS2Sc6ZoU1JqTCcBREH/GnNM6PNcsKQe10MICO2+w
         wUWg==
X-Forwarded-Encrypted: i=1; AFNElJ8kkx/7E1rPBSRZcYk/1gaIigmP8tv3zJ6acgEGScHt/1wr9xhEasZHFdtZ72ioEwNNFJABm//I8Y0t@vger.kernel.org
X-Gm-Message-State: AOJu0YzqmgfssDeGtSrOTuvnqLctJQxZTvyK3wOLNElueSI4xwJfcsDM
	esNTKD8DufqG+g4iuwe224gO016e2+MLdT5jTo9aTZLGdYKB9AoRELuVQUUeEBVsT1ZV5SPQ+po
	LuimUs05kCU2CrhEYZch5KRvzlTyrVFfZ/Cr4vjkPKnIfgRLbRxdG/UJ/v8eR1BiB
X-Gm-Gg: Acq92OFg5GoEvxKeXkPiX8NbcZhMABw8MfZH2t35V5/N7+bVx0n8HfgmN4J/hxcjY4e
	tkEocbMHIsvcCrvxn0R1soOOyp+Eh7buePt7SVCm47cTi98O49FjsK8SAxm0hfP7L8Pybqp+RRi
	rw9nmbiiPqKLw+/X3OS2/tED24BcM+6bSSDkFsN0Oys9yG38uClrUGfOIQfCllQauzRTmubhJPO
	i1s/Ey6PhipiB/lsKal4VbGTGcrIEcV0+yUEJT7OHW1iKeVvlmz5Kz9N6mRLkn9ZuXQ+FYTE/lG
	uMEEoAWO1qLjDfKAHWJf0O3n1+NX0opLG4lSMX41T8elPWKpz6iDHwz+qYyOOJIAACIFvnaawkF
	QnvdC37oQ196gDllBdVQpl5sqA7NFv1S7tlk640YYQRqyquf/+cOA7g7xJJ83dh7flEuPB4yAYW
	e2ug+5hFw=
X-Received: by 2002:a05:6214:469b:b0:89e:a170:6af2 with SMTP id 6a1803df08f44-8c1afabc2c5mr138776836d6.41.1778466284603;
        Sun, 10 May 2026 19:24:44 -0700 (PDT)
X-Received: by 2002:a05:6214:469b:b0:89e:a170:6af2 with SMTP id 6a1803df08f44-8c1afabc2c5mr138776556d6.41.1778466284094;
        Sun, 10 May 2026 19:24:44 -0700 (PDT)
Received: from [10.38.243.40] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53ce7e73dsm300484716d6.42.2026.05.10.19.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 19:24:43 -0700 (PDT)
Message-ID: <1d6b4182-7cef-4c00-a655-095c0388a038@oss.qualcomm.com>
Date: Mon, 11 May 2026 10:24:34 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
 <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0qyqEOjKdT2Qw-8MLs7BPia9QwOW7NsV
X-Proofpoint-ORIG-GUID: 0qyqEOjKdT2Qw-8MLs7BPia9QwOW7NsV
X-Authority-Analysis: v=2.4 cv=J7yaKgnS c=1 sm=1 tr=0 ts=6a013ded cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SmDLwImcmQvp-VwJOJ8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAyMSBTYWx0ZWRfX0D+3/7QQaCAC
 R2+h8wW3EdISXksqYaIVDaqnMZRlzgm8LH3DmJfKkDood+90Gf1ju8y13bsY7/cTAhIwUfHHdgP
 t05ivV3ZjNGxgRaQ2FEpiJgfEawuIF1ldJ6Fi2rIixxpvioCBa9KTRiEH/pqfMxOsmNIRta6suH
 vpN/AOQ4IitPm7KQkPBt7h0txBaWkW86cxhVA1k5YsDxmDgvFlswImOcw2aJJyEJzPsptAhnJMD
 wDSj9y+zTwEaHPahsRsjE0AVWJoA9a7Y91LwnZ37N58iHfrke/zLI/DGQz/HbD+VF0fKtwHA830
 oaVgC7f4+DKQe6SX/pmKljuzwNAywFt7NK2K9DYS5uAFTcqDwj3auxipYlUxuzFxmTvm93e9JcA
 TfL9fSwioMVhwKpz+7SSSS3WmOa3bH6/BVqzNkglNhEz2+4LcgOgCax/OhMTjGzcls2bWGsm8Xr
 CqabNIcHkHqi3NJ1ncA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110021



On 5/8/2026 10:23 PM, Bryan O'Donoghue wrote:
> On 08/05/2026 12:40, Wenmeng Liu wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> 4 x CSIPHY
>> 2 x CSID
>> 2 x CSID Lite
>> 2 x IFE
>> 2 x IFE Lite
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> I'll repost my working version with the PHY stuff so I'd kind of 
> appreciate you not posting an old version here, just wait for it to land.
> 
> ---
> bod

If we are able to designate the old version as a candidate, and should 
the new version continue to encounter substantial resistance, we can 
provide a functional version.

Thanks,
Wenmeng
