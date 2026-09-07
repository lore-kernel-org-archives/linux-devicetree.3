Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E824477FA
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788366; cv=none; b=CbxV7aIHqlIpB/ADuHyfGWJMFCbGzMVSYA3VCHjg1iPQX9IKbHTrjJpE5CCpAIGQ5sIZitXq3ZcynYudlJ1ozc1NPn0Hwai13WVnbCV9afZ9/GW6ZS5Mp/xNcxhXLNv9CPUmEyD88+AX6ZQ+GVZeY81Bul2wpJF/Isi1d4wOeKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788366; c=relaxed/simple;
	bh=qcXZbw/SBgWJ8tuEFHn1c2KHIgyPgHN90XFCGbGMSVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFks3WeOBZKNuCj10oMrmVdJ7cZen/yHdfI7joYObeaQoTGk/IybD3AZ1FYGkMUzHHPU6uwyukclINbn89lz8dbILDpGgAIdFNg+6nVu3wkFBahSceqh8IHPcVsEryuVfx7TaU+t/TMNXckT3W210MpyCoMmyRxzb29x6IQrQUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZSevcBU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9ejHUUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZSevcBU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9ejHUUq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdD9R851186
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntco9bweaKZBuDTST+ZNAj9vIcsX68lueXT/HJ12Y0A=; b=QZSevcBU/qj5bbnJ
	yaYnRatnPwKcLpPEoAafEI+FsPo2228CIayN6v3AO69ZfmhL2f7XkbVmsDldEMG7
	VFsFV7IEyFRhXXni56/+/c/gZvIzrfWIHPiViIgzX4/G8JzAWO2LFv7im9WdEDiH
	3pWxQvDpnFABcxKwP77EJwMBtMKd/B6YVHVCoULTmpTt/VkNHBA/zkgH/Y989sSW
	hAkizotQqG8g+pcBKUL6u5lvD+GzqN31QkjBW481vCaBAM04PKkHwOmyC3WATZ0M
	KFyqXeGyjEiVGaJiFpDEmH4guNpTHrm8N96NJS+BnhFBmLlVGXw5tDhNnaVQkCXj
	xmdaqg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8huu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:39:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9102fee9920so7606526d6.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788363; x=1789393163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntco9bweaKZBuDTST+ZNAj9vIcsX68lueXT/HJ12Y0A=;
        b=C9ejHUUqE/tIgZR7xuQuipURfHX9SNtxMHx9NGh41swJZ7UHjowOeyqhVBdcJuGLgl
         TWrNZ71F87B7B7M5Y3LORY3wenfsps9dZC7zU4aAv8MvuOcLngPDsHEckM3h5ADJNmmY
         ORTF3+Zqh4o3CoRD78p7G8944+0gXu85/UW2JjiLSdXQ7sX6Rqd80ZTo4eCk7ErDEEvS
         KDJDMsRwUcWivJYWgooiD5QdOegcsc8ZwvoZ3RFPMZTs8AgbSEzDVZr656GUnVeay/pp
         RKUvGB0hg+547z78iwUpUPC1NaBlhNbOuy+Ks0IXwhlHw0tLgPapkmpo+4+VjJ2EhJ3u
         uFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788363; x=1789393163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntco9bweaKZBuDTST+ZNAj9vIcsX68lueXT/HJ12Y0A=;
        b=heop083XWe3hd84J3U4hv7Ugjf4HHxuHzPx8EhUL+h3SNMAMpSYl6TJ1WvdTMat6H3
         t4w48wqrnIEswwEJd58UPkxmhXet2ps0gDSerYyGCYp4IDkSOOztHEzrBcS11I5B9Gdo
         gUtISO5YqCztCR+V/MN5ZumNeVKFPZX2y+eO1JPZGmHbYDXFNdJftgxy/mX+vdX0JLjt
         Wufv6JjLPKWx1bDUYnNFOOcX3GVdcNug8SOW2+ZFU/b8gYD/YLTrqbS+3MxQTghrd3bL
         eheplCCA6eZ5ornJPopZyjSWG1hCjV94nxhXTYdXQK58YgYTohL0+I0QCuGtAB9aTKLI
         Cvpw==
X-Forwarded-Encrypted: i=1; AKwUvBzQ/+R0Hio9m5MIbrlMT6Trg1VISWQPtfu9U6alccC23jwuaaWRhi0Eq3lSfXEC+Me6ZXiubJViVjiG@vger.kernel.org
X-Gm-Message-State: AFuF++l8yf8ZbqFWC9FON9X9vydzJFYFnsbA7cJVy3KxzM2b++Jb4xqk
	cGFhA1bQvWlXDrEa5dfk2Avxu2LKTP0XTaQ0JDyN5brUj6qdJF57McigqmXbkWVT8H2EKAlhFeN
	j0WbQlccA62X0qJArMyH4Kt9zweBLpKE/J6KZLTt4HR43Y/OleZiW1fBrgYfOTxYzIed9EDCv
X-Gm-Gg: AYBFou3OmiYzPJkmFnJZiPJVhKMxGB7+4EZo70zarAKNW/4P4Diq4gC50cQX6F4NYsl
	QVaOP1ZiEEoXmTmEy0LW1RLLSN7LdS0XrImzYzUpmtgWEDmcHC18yPC9JhP2vjUMdMMWXzXfP7F
	i1azX/j7wJ2dM+h7eLnmjxxUhoeHYW3M23wCHuTravS/fFB37pN7u09x5lbvFkDu2F5j90AvS9m
	f/V/JrRHrWPCgNIJjFmAlRu/+gEjflKfbX+ocqrBEixr8oXig1iDg7X4Q9PbT0rAdhYH3U58LT7
	4IX/eqsb2C5xj9Rj+z6Fvqo607HYnbZESKzkaiwmg+Lnc5ibPExn2U/rbwFFP2jK0A7f5dgBQii
	Ca0CcDPOVIZYcLzjxN7sxww==
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr1131539685a.2.1788788362831;
        Mon, 07 Sep 2026 06:39:22 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr1131534885a.2.1788788362361;
        Mon, 07 Sep 2026 06:39:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6db6sm4080601a12.5.2026.09.07.06.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:39:21 -0700 (PDT)
Message-ID: <d1ec9149-7034-4002-beaf-d389f0603fc3@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:39:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
 <ef41a092-cd83-4e65-a16a-7a8b838bcb63@oss.qualcomm.com>
 <f27df150-f21f-4721-9fbc-1bea7dd0f05e@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f27df150-f21f-4721-9fbc-1bea7dd0f05e@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MSBTYWx0ZWRfX4TQv2U2fH7mo
 XmPg5pyIqc3/m/mwFLj4wRc7/7NygZ0rP4RiK2+aPAWuGpkXF+bT7DwlK39A3NvkzDrvlaRxlu3
 A0D7J5XoK+aapDcMMaua95qK9F9PGo0=
X-Proofpoint-GUID: 7rw3QUPgtzqtBeRqYXKyzSSgZP2ZGduY
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9ebe8b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UOxVzSRVUou7as5_x64A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 7rw3QUPgtzqtBeRqYXKyzSSgZP2ZGduY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MSBTYWx0ZWRfX1r3G7RFjGy7h
 qaRgtsbwhp66BXlXKfKNXEmu+pdEEmt6x8S4rQbtjMPrG/8itxH2xmfPKdfljsLHwRZlY+WwJlJ
 K/Srds87kNZ/aiN4GyZrXbWAFpyX1v91r4P8z5AA7ogAraY4mhB6T7wiPOh9s+ILnmzX4YjLAsn
 k6tyxE3lh3sw7O3uFmigztd3njsYLCxvyN7FeDipeH8NivCwOHzC7WWoxdSuN8XRA6PnZugP2p+
 3QJD2rQVQkHCDBIHa/0KHnZRP4gNy5914Np2BNuYhE60+dELHMpZTiqlhGUMeEPu8CgeyvkvT3y
 Ic+5iHUPgz+XQjUFqDAJvka+/4fmigxZ0MSknvttWrx5TFgPE4gq8tmG345Yd5ZqjMDsvMiLlzx
 b55I+sACA524T6tyI1vnUYjm7kW/Ytq6SW/X7Kwc6egBm6YGDt/3jB0LDeQJ67b1QrEAZ/BrYcJ
 EnZFJENIUXV4uiVQ8gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070151

On 9/7/26 3:32 PM, Muzaffer Kadir wrote:
> Hi Konrad,
> 
> On Mon, 7 Sep 2026 14:04:59 +0200, Konrad Dybcio wrote:
>> On 04-Sep-26 14:55, Muzaffer Kadir via B4 Relay wrote:
>> I told the robot to take a look again (and again and again
>> a couple more times until it stopped complaining)..
>>
>> The following feedback is meaningful:
>>
>> Hi Muzaffer,
>>
>>   `qdss_tracedata_b_groups` advertises GPIOs that cannot actually select
>>   the function. Please populate the corresponding PINGROUP slots:
>>
>>     GPIO8:  mux 11
>>     GPIO9:  mux 12
>>     GPIO12: mux 12
>>     GPIO13: mux 12
> 
> I will add these to their pins by sending v5.
> 
> But also I want to ask,
> does atest_combodac_to_gpio_native
> have any mux on gpio12/13/20/21/29/30 ?Or are they wrongly set ?

Yes they do, the robot pointed that out too but I figured it pulled it
from the internal data and not from the existing driver. They don't
really have much of a use outside validation testing I believe, but
since they're there already:

pin	func_idx
12	14
13	14
20	11
21	11
29	10
30	11

Konrad
