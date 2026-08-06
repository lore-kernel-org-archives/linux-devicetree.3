Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F3548BD5B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 18:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040146; cv=none; b=t1EUELGfHCYyDfqR3tsZph4jKRpJcN0WoBMUXQjBFdUD4hoH2RpBpTAOvp4gc0clTO8VoBocUwGXspyz/98cpByUnPxnY54GhyPlkCcLEdit8j5W3sOBu9GNqSQwduJrQpkuHPF8fu6W4r1wZv7fCINFqkJAVsU0B7wrDU42xNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040146; c=relaxed/simple;
	bh=QLD2yamtBTT01mmMIBqZSbaKauRTUXhhITcVluZWuOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sK5COt5bHEnw6A9q/aJQWUsJHVzFkCgUFzeCwuz84mXp/4Tz4iFqCCD2VgfHL9oXoo3chDtlZcL4lgrkV39fQZHuUqvFIgdo8s5/jwfzS9XspppXPBUZlfHozZDHLT7dxB+2TWUtCTilQ2q3XzfZVMq7HyvsLi7kM4i5NBq0TtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WN4eKVk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjN2y8dW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WN4eKVk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjN2y8dW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676I1jZU2408353
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 18:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+92Af+tfpb+HXUrkG7jzilYoIyo/FgNcZb8HcmlYTR0=; b=WN4eKVk5zGEUI+9m
	OLqDLGMWFyTHdQrseD0iHC3vVe+4hZakp2AXrHNLx5dIs4mGoB51dWgCm7uk58Xy
	3uwmQGvmkOilk4J5tCXR5jZQh9t6wu/ekpdLdwex0Fs8ZGzR1VIFtQJkx+8hednv
	KXCM2D97Gf8bghcH6jtWqT1bcpoo6qDGbQ6PSYtLb7ylN64fPB6cYXyQyIO9JEdH
	5i53wqZVplaPiqOxdsDsgZOpB3903EZLKRk3Bm9+eKn6fggfSxR2WFOaBuBQ8ZSh
	+qj86eMTgOAUsWk/yddP2fVu2rf3M1IGsBDSiaKUjXxCDsnAZ6GAxfjqa5eIn0uN
	PUMqgw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hr271-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 18:15:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8486ffba174so5533651b3a.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 11:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786040143; x=1786644943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+92Af+tfpb+HXUrkG7jzilYoIyo/FgNcZb8HcmlYTR0=;
        b=hjN2y8dW8f64Y4Ef/I2WtBkdN0e9YbXpq5NbwKHqykCJJkWsDjc5gtdQUEEAXEwTOm
         p7yrR3+JOVyFgP8aNG2bIEY9G305DTusEGhybwF/7S70h2D1QzOd7vG8CfL/e/PzaSxY
         Uu+2ilk1i3+xdz7CzQFe3I/zvw6jIEkbMlCrFV3lgorMI4aE/mlqJwQuRNHGnaHnVEGT
         7WtwXYRJ5aU3oeDQXzxBLiE/ku8ImoAfZ4iAXNc+TVIm7gPofV4AGkaMGhdYn0mO6v2Z
         9xVHfp64fAAmggFuCL6FxYL7rhM3uJgLRtw7jNbsMWIanxeTA0zfPyboYiMmjTToqla2
         8TJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040143; x=1786644943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+92Af+tfpb+HXUrkG7jzilYoIyo/FgNcZb8HcmlYTR0=;
        b=p1EdlYmwn52r8gpCsaB5Dpya9/5pe6VaS/Iosi1hut4VbTZUH4433TYPTpCt/CRpiX
         ARoh33H24QUB7/Ecwx5e/CyAGblFOWdy01YaOLJVIRU4C2I++YWeu+IfMt1CXeF7mVqP
         EVJrdnWoJfoPDyidaIyHRh6ZixcoRbgxqEAr1EFliehn1i/e4emHFiTaSEIJl04KjbeD
         dpR9tf6XC89NRpEDG8JA4SquLt2VPogiKReHhTEShN//dng1pWg46XNB9A2Wd2HZzkQp
         VZwh6C8DaswzcJ9PtBh7ZyL6oOZoYjKlUS8fPd6ktXKQVQBXMDmxuuwFjhziocAFYuYt
         Z7NQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsAYpk10qmTLnd1VCH9xYG0+6klHW51h0oPIPlennj0zzoGbaT/wDc/vCySeSXlkwhKWX2yjeHGZ5l@vger.kernel.org
X-Gm-Message-State: AOJu0YyOe7ipFSiXw3Ec0wGt3p+HJFAYSMs94cbIUxQBvzQUULQxyjjD
	kgB5v/l3lIj+yPZOJjFD1WPZV3n7UZ071YXr571EJ+g3a10T6hkx4roE+fBRqD9LU5aJ1tdLb5b
	numhaa67RrDXXY5+bPaRUV8UGVUJndwPkxVTf2/1/eJEOn5NA4GNi+ZpXAsN0mjbF
X-Gm-Gg: AR+sD132Fgf7JoSO7MGcRGwndkHewOpRypF5D8HD48vUd6ikNOAdJmFKAY2nXT0G7KT
	JJ8fMcsVfECY9uajP7CyuO3iyBgz471BozAS3xLDP8rT0jyJUv8kDzYD6HwHiWCoeU3Z99bErto
	KbcT27VYLpDG9xR9GoiBcX3jye9/Wm8hk3IBpzMfjHdwpSSsXDYboCvukfxou251HvioHqFvCVq
	x7gsr4usRWp6lp9CwUtWUYUZgZv7O8AOLM3G6lUV9aYqRLPxzunFC66ifDwi3cLOv0JajlgFycL
	Nm0td36Q2Qb5zwjGbm6Jm8NJ/WOyXyg/Yw3z9YfzFjVKGDsWIHFN6Uk9bI5M/wrjEyElfuQaLUx
	jeuLZTwXbh38jdcJPWEmYFVVsn6eDWJ5nZg==
X-Received: by 2002:a05:6a00:3393:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-84f2dfc8f8emr20328152b3a.14.1786040142862;
        Thu, 06 Aug 2026 11:15:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:3393:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-84f2dfc8f8emr20328068b3a.14.1786040142302;
        Thu, 06 Aug 2026 11:15:42 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.231.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f459ba2b9sm1829259b3a.48.2026.08.06.11.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:15:41 -0700 (PDT)
Message-ID: <8cbd912e-0f50-4fa9-b534-7ce1a3c77d88@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 23:45:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: qcom-geni: Document device-gpios
 property
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
 <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-1-c363a9b5df69@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-1-c363a9b5df69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0MiBTYWx0ZWRfX0lAt0xy5yoYd
 lvRCtC7LzS/3D0Pil+6a4mafXISJpY/+obriS20qBU6fimZpVwuXt/gv6pph++W8G7tSXj9dUgz
 bQ/TssNzi7Q6WKiG4KtOBcqfxZp3L8k=
X-Authority-Analysis: v=2.4 cv=PK0/P/qC c=1 sm=1 tr=0 ts=6a74cf50 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=uB10XSru4U0CyR2DWkO06w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NXe-hbaaH1PFlVkP-uwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0MiBTYWx0ZWRfX3w+E/LJKtUuT
 HjWs2kqOzdsbe2GdKkYWugCsDG6wUS1+OujQK1wfx//DfMJy181zRORLBuqdRYRMWebUDVgx4YL
 Qd6vHxl9iFK/isM6I5Bvip4gefsfvK6+74kbJMu8I8921F0jQ0owea2XeWu/tLPvcH8afulb8wt
 bUoSIMUD69G91bq9A9m/FpOweVCq2h+jn/o2jCfsCrvnKpkmO/krmQJtSa4Fq1fhhx7fUg/+x3t
 kDH/tf/bfAFwOdt5B8KeTJJKbwWgsk+DY8RCBvgm34HxrEdPylDmybIjKRuT3FK1z4XTxngIp1/
 aAva/8GwlhjbXhpajPliLbYpQu7na6fbAkExyhrD5bUfFOEqxrg/wOIDO11hURauxzCtJSFsQSj
 DijNz9hWTn/PECDpvP3+2HtklPieBlulHEuV/25GEXwU+QMrYF93dm36AIahZDeAZ/z9/ovEDwq
 Scun36qjhUEfEatpxCw==
X-Proofpoint-GUID: pPpaKv88qUZMSTqRoSr6EwpWwcgIMu3J
X-Proofpoint-ORIG-GUID: pPpaKv88qUZMSTqRoSr6EwpWwcgIMu3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060142



On 8/6/2026 3:43 PM, Praveen Talari wrote:
> When operating in SPI target (slave) mode, the GENI SPI controller can
> use an external GPIO to notify the SPI master about the target's
> active state.
> 

Is this active state meaning target is in ready state to communicate 
with master controller ?

When will it set this gpio ? can you describe little ?

> Document the optional device-gpios property for the qcom,spi-geni-qcom
seems bit generic name, it should describe the signal purpose, not the 
device. Something like handshake-gpios OR ready-gpios ?
> and qcom,sa8255p-geni-spi bindings, restricted to spi-slave nodes.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml | 9 +++++++++
>   Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml    | 9 +++++++++
>   2 files changed, 18 insertions(+)

[...]
