Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671993;
	b=CSdWxnlfKX7/BDozrLA3y6Dzy3S/cCv568RordlZ81shqleeSMZk4XkHrd3wQPZbIcUF
	 Z41EmfFa9oodpEkTTYm1mwql9plSgPq+pn/JLuEktFkbpY9o/16Rk7VTHYeoVC+bfqM7u
	 vqDIHAYpt573a9GlgwmtWZbIW76U8dw/A5lo3N00k4XZVvaH8svVunoQUJIQgqJT9CTbO
	 WQytTLp/pLhJIFUp1RxZP1jW1Jxbdc43gvaxadxdcMaZn3OUjl4K5GNNh3wHxmLqXbCZK
	 aYIzYviqcA9HtrwSKujHuF+ErCoNwmEquEkJRySyZ0WJcJvExse6vs6ksEZy5pqMYMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=;
	b=sYTKpWFWef14T5VRH1ZbJr7jpewNZ09IF53Tpur/OiboePd/XbZiuGVTz39Hm6j5lt55
	 WUMsr6IwvW4DaTNNM34EBaCW8PthefVq5WKZ1FWTg4Y/JMpIbX0d76GdcD+lNizTvdFrO
	 OdkqCpmFctt0Rv9pUjR+VNU8luZgYAzILeD9qmYpwdZ9vXSRb6UR1EASgD4aZdY5OxFXh
	 Hyc1/ytEqhXE0/YYb7rjZkTXlG1zoZN+flA55tYlEVgkySfud2E4l+kr3AgXjt8WUjINc
	 9VRFg+uPAqwhDPcjKxx2gfoaFEBthnTFABGe3PkNauZwix/iS8GZUcNmwHK2b1cp6BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dGHclHLz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjpCtBWf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF9606A32E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BCF9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dGHclHLz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjpCtBWf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Rct1812868
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=; b=dGHclHLzI850Hspu
	1TdBchJmfOIflHZu+5SrcJsVIVYPz9AnWcG3D+8fRkIWirdwJTGU5ubCHOoYoPtR
	aP7u79LlcIt50h2MmsOKRyL+nh8X6/6fZbWRAHN6IlH8nJBr+Biw8Vp/CQ/jo4zy
	o/YJHzH4qwMJVaUK7TKJ7QIfuf9DzOC84Ib3jq4JDruGmHvMh2jafk5Gf0q0G1MT
	dnJN9ERCaWHF6RF2bU1PzQp/SxXdmdLhQkfwSKss8xalYI6ETtbdcUa0zxpb1UnF
	DTMPOKPvjUMJMb2hMawQ6z6glpq1SkaA91ujqtTrarXnxUvPl2jvGQcyECr4xc7i
	1wteqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak00sfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:46:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41e8c1ac0so9347270a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671990; x=1796276790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=;
        b=AjpCtBWfymD+Au6hBB8IABhVfdoXtApE17sZ1SIVBOfiFVHCPS/1QqtuOzgpQWBaC+
         7tvFCBfE6E546QKCDnshXQwUDtKR3CQXSBsKlJjgiht3n+c+DVwEAWFSE2zC1Tzc4D/v
         bUoA7Fjnm7J7hcZrsbyLzDLjRtb9KEhiBiDtmUj6Pl0GUds9ebAZ0i8U8Vp1Dhb/7xV8
         E1zXCFO0Imj4SJ1dlC9rl/4R1AzLAQAPsTqC6j6GFZVyvP4rQfTeeyPZg2OeuISA6Mg0
         kuv4gFeTDtPMszOz3GrzW12hA9YdvtFNLiIHMcdZCfpBzAxB80PO2pyxhUbneqZfBJjs
         dZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671990; x=1796276790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=;
        b=H0o0VatPL/Jt8qXQ5G3WgMC+OEJ5QQlvwR8mIAqbjTczQaG+8tJ7lfX/k332sDhH4W
         S5FX9c8Vlgyq6kiAwEQmFhPdukNQGcbDPEUYwHd/UfuNYeCkTDM0xg382EamZYlxv5Y1
         /vpkCexC0dCesGlzMPVbi/24XoXEaFzGL4Xa4R3qYeCx4gVSeQWEzQLQPEo9kQCXxC3K
         6FRX3Hce1zW4sRdnx6GkdK8jDjUbBCMfgQYplvS9sm5byHmyCLpUCw6BumaUNyWX7AHh
         LN2aw/hlxm5nrQX7zLWTh9lgBt/KF4/ByfwHzUBOeYqRe0pAjprC8AO/zvCiM0q76GjO
         n+1g==
X-Forwarded-Encrypted: i=1; AL+hErG9Q848GIP18FrbUiUhwWiWaNyu7drrOZOCrk4fGB5wom70pMBxwB04P+qkqDVZ3c/C0Qqug2xR0BDP@vger.kernel.org
X-Gm-Message-State: APuU4Z8SN96JYSgY54/ji6QEuKKkFZIPpsPQIJGg5c1xPuInWXpT9YqJ
	rcthsZYOFtdDivbcGJq5jd2HTpzeWDrxXef0ugxb9K1tFhJOPioP08aRiUJiAjSZO7liVBy+4rv
	dBR+lmqHIokE3MOfBheHRjuDv9kd6BvxUacuNgAKbi+tVTa+cDm7mgOQ1upXgyRzX
X-Gm-Gg: AZFdTZeO+rBgHY4+pYgf5tk65OjkFFpjpkwSQ0PBw8iG+KU0sVPSigLHipDRSqn82PG
	FYGehMAhDMSFaQmjLBGvi8ASxqocjNfGgrhREvuRRZZMNhcev9ukWfNjLSwAZSrTcgnox851Lk0
	isiJrgssOOXU74etnnQNy3NFSjQOg+yxC2tXsWm3Wg/uq5kARr8+pSK4CcjTv5xPbJItu+JSNjR
	M9z8/NGcLBggWSfPgHuHjMWSaTqmpBPPnSos8C5S+RYZesbvcdFYuT14qWeQU0OTFXoDiFh94ZT
	F6Zrb8HyzveOQlUBtq1ulhs72XekcJZmRtzx/TA32Lasg6Ai744b0k4oz8o0WeyTvknyl76uO+b
	hN3Oq1mr8I5XgyymzjqtASo4FbbvW4adiD1/vDWIMD6lHUFVpHfz/Hbzj3IE/l5yVJz+x0r+KB9
	1gZ8WOw1dcwdDKdPhJx2VuTN/uuKpYy0hrY6KSs4VwszI=
X-Received: by 2002:a17:90b:2d8a:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b41c96cde4mr20837141a91.47.1795671989911;
        Wed, 25 Nov 2026 21:46:29 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b41c96cde4mr20837104a91.47.1795671989445;
        Wed, 25 Nov 2026 21:46:29 -0800 (PST)
Received: from [10.249.29.132] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm31772158a91.12.2026.11.25.21.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:46:28 -0800 (PST)
Message-ID: <61b5252d-151b-4a6a-8ab8-28bb94583ffb@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:46:22 +0800
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
Cc: wangao.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] dt-bindings: media: qcom,hawi-iris: Add Hawi video
 codec
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
 <20261118-add_iris_for_hawi-v3-3-51786f6d4057@oss.qualcomm.com>
 <40185500-441e-3706-b68f-188a55b88014@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <40185500-441e-3706-b68f-188a55b88014@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07c7b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=h9KLfewQyvMvtfKxVGoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ACcOBzn8RRWj_SF4e6-cQucG6lJrbFXA
X-Proofpoint-GUID: ACcOBzn8RRWj_SF4e6-cQucG6lJrbFXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX2OJaQOgY23ij
 7ua+apUAdPs3pFx35paMZrJFAZoRrQG3OKwCcZRwVSDZByaKhzJsQVW67vlrijLbBuCzPPz1r/Y
 oV/U/C+9xG1+bdOaw93tioYLSx+tjHY88gljG4An5l7c5IGmbbRxQGinVByQURyZB6TbR/bAav1
 5avAyktv7wf9pq1ltaUkEpgZVcp8oopWOajIkqdsK6noktUoTHbP3lWcXZKX/u850WoSqJPhpub
 RUsKMnslEIRPJ6WKrZKCfyGTZNfxka/FvYzZpTQXGcabZfckkfW1jDEqLiaHRZfU3JkEHBvoFZ7
 gDqm7e8QcaYKvGQ8v+6WGQOwgV5NThb4PVD3XYPkJd7/OtWzUbUsDlfUTPeFITxwQPcK6RgcmPP
 IZHq3CNU2jDJa4SxgOv/ywMNKmGBTJpDZdY5RF/0GGAMEkCqS0VK9q4Emg+G6hXaxXVwIUnvtb9
 QQb6hxhLA38EhHTUgBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfXxyMYHQdgoUFt
 QXG/hleHO/RZ+z+3yUYcj5aiu18yF5aAce7zGO0E4BA3jE486aQrrsUVyzQPXhEmgfU5kkqWp/r
 KEIZaT8N1TL5ztqWjhJrKmne0VnvbEg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021



On 2026/11/26 13:43, Vishnu Reddy wrote:
>> +
>> +  reset-names:
>> +    items:
>> +      - const: bus0
>> +      - const: core
>> +
>> +  iommus:
> 
> Since iommus has been moved to the child nodes, it is no longer required in
> the iris node.
> 

Thanks for the review. I will fix this issue in v4.

-- 
Best Regards,
Wangao

