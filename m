Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392454BD79D
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487387; cv=none; b=Tg1QwlLqadD/WoiXhHn9pb2tiKUPz0ksvAa9mUh1RHlgCnEujFmJJrH16RtKv069G56tQW0UVqvKieswE7bPBDoafmnFIreQv4FeAZnOzuFDQCAfBM9XkDAiK6BilkFowPY9ikig3QfPxVWn1Qa5WhhEApSORfj+UHs9zEZWk2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487387; c=relaxed/simple;
	bh=4ei91b2R3LhpqavB/TmX7B5aep0BPPMa3xpepuWnm3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvAhFe62VdrDGoCNYnIgIE2jM5nWED8VVg7bqJj3+YzeRJ5F1NULT3VJfAakye/HfZqugohxkEt+RJIsR8T/rgl2sG5xokdYm0QF+/ZXn1FegcPAAtW3nF7moq0TapqUb8CDyrBhIaZAkWbnrUrkMLbpT1tdSumEosGCXIowYXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6Rg5v5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Un9nBENj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6Rg5v5F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Un9nBENj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAQoR1014182
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 15:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaIdKmli7v2LIFD3GMLQcKRecXvx+ZCUfvZafIxPoyo=; b=h6Rg5v5FSw/YNtTU
	vroXO3zDJH9SA1yOYDyj3IVvfIBTQ9lrDeBr6d0zGrmPT2nAiFPEF/p2VlTOTb4M
	Cjao1j3rFUPIjobRMHQiAXDxhVtGwVXD2anwGZvxoklUYzWZPUdahvwu2mLWKRM2
	wGyXwkIUZ8ANcEaTL3+lISNjixWZxrYN+Sn3zoGc3jj0x3iEJTByKMx9PLYeraD3
	b6nnUhtAV+UgtAdptqN5XW18hhCvbDuHrJZQ0SRXvX0XCdW6FfCLQswuzfEUuS8h
	L/PCdbqGVNh7JvWG+B5nsxCKtJ1V2bMo1UMvbtkSUr0UzN/I/xgabZjSprGJJZWx
	UyBrqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea2r4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 15:49:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fb956002so57571835ad.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789487384; x=1790092184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EaIdKmli7v2LIFD3GMLQcKRecXvx+ZCUfvZafIxPoyo=;
        b=Un9nBENjl+gtMN8FS8w1CAMgtVO0hPSffRcdY8fonRLBHOdKUQrOXjfEllXyGHwpSf
         LEcOEv8xvbDpQyN49J3S5K0/qwR+Ovwf861gTxfLDksOFEpjGpMk0zswwDxVD8vTGK1s
         qzL1MDBoHaHqpeg3sA0XjmTHgansInLhU+oQIFHoUE+2eJtbNqnob049xZcxAwOPeMjH
         yArR3UmvYhT9voZtkkadG5Oo4PUJJ1FFtM85JCxY4x3nA6Gu2pUzS11y9OydBMPre4Xh
         JZ3pgkXDnc3tR0J6wYfnoJInHZU1ufDKz/F/P4jP5R9I2T7ig8MkvLOmD+TPRNi2hYmC
         vNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487384; x=1790092184;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaIdKmli7v2LIFD3GMLQcKRecXvx+ZCUfvZafIxPoyo=;
        b=zrs86nbdXybUL3xmV9GAaukpBerfdzSj2P62B1JNa/VZ5wr5lHqbdKxQ+EHEJ30844
         LYwNAEzYpXwUqsaU3CZQ7WuNxwVd5zz6oDy+ftI/WuCyCR68tlMi4CaXglJHq6x8C+B0
         Ws7u+4aYS67eRoneVxwVu6qIDbHMg/J+8zfLxiu++ZNJtmHn7CPiU8jXdzOLA9zOLfK9
         /T2nVGqRHaRw+cIztH9XjU3SiOp3LAyL+JVB+1rnmvNIDkOEgbzOeTX+bSpmAd7PGc/g
         Yz+6bDzrvfACWiumhJi+EYO9pB4aar1XJQeb53kz1Ki0SgsMU4UVztoJ2+JwAHs5ctSz
         v00Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2EzGJi1qrx6UYQnAVq7yMnIVYkLvAhtrV31ASA8nnLKhGLNHUnKVTLtKLmh2tADqG2bFzAsoZI54B@vger.kernel.org
X-Gm-Message-State: AFuF++n+hy0NoVVYsgRRT9I7xQflETr2ICN8vZ866HJ044OOB2ABisYR
	sKEJwU+sf7Kc5aqmzvcUH68e2Ne9yqD6CG9VSLmRvcAxQIUIqCCqNdeyq+VqlCIGaZzWyoSRlvd
	jxzH193G0JkL8vFC1Ri1Rh2gaN17ruNObT2SO0LZrQnUcPDg5IfWElW3UhwQa3WZv
X-Gm-Gg: AYBFou23SloeSb7vgyzQAAvbOJtkrbAJ2HBkj4scgS6XQEQUE+kEwivnEceNoFaZtE2
	OUne3AHUvC2wTHdu6bClVneFuo62g4+O/X16IeFbKwn6HcAWK3UVpgt280H9XQW676liaeo6Q7C
	p8q0LfSq+qUcahk96fUuoykR+yv9I0nPSLXL+4tEmypcOL2h0aLLrJi5WsK/YMxfRJlDc0VAB8+
	3yvxDnckHCNOfVaoESCshRMXnXzjH/+2zjIxtInWz3UEEZ4y98D5gAEgW0RWNqfNa333Pw8NFTu
	f4gzNXL7y9JhLTNgB40djA10JB//znFsJUcFLLtpOqKNfE0wJhsyCBKAs7qiLkPhiHA7b3bP6Np
	Pr7oA4TMQni02rrHafOWZfZrnMKU2TtT9IvhWrpKx
X-Received: by 2002:a17:90b:2f0d:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39df024cbbfmr14331066a91.25.1789487383596;
        Tue, 15 Sep 2026 08:49:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0d:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39df024cbbfmr14330999a91.25.1789487383005;
        Tue, 15 Sep 2026 08:49:43 -0700 (PDT)
Received: from [192.168.1.5] ([122.169.220.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda7cc42sm6221221a91.9.2026.09.15.08.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:49:42 -0700 (PDT)
Message-ID: <bf2a490f-4bbd-4223-9cc7-685e5a90ec9d@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 21:19:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Enable Qualcomm PM4125 and
 WSA885X drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-10-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260911-tireless-sincere-flounder-5fdfb0@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260911-tireless-sincere-flounder-5fdfb0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P4OAhNcLp1CLVCXqQ90VE6Y_NXuQh4L3
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa96918 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ww153nmMuBeTcjqybhOiGw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=5zVXc8y5ZMJFenxCD80A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: P4OAhNcLp1CLVCXqQ90VE6Y_NXuQh4L3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzMSBTYWx0ZWRfX7vDKTeq+855h
 aCI235ji/QmVSlaWMTHLjwVB+ORfDKHf8ts70QpR644Eaje30+7Iq0O4yVCz9hmIWEL7goxjzx2
 5qouUkQmBkQwUOPozNciIEiNij2Z0oI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzMSBTYWx0ZWRfX1jPV9URVFoi4
 BPE1aEILBRfjCyJsxAZU2kX6PkvpIlNOur1Sx+OtbFQu37zzbb4qtUQh7F+XZif8FRHxWtg/+vY
 Ogoul48NSZ8BprIl/Y6wozOpjjC1ZoP1lrbE+sacB0QDvjC586YpOEl2GO/wHSVUJVS2+/SAVWl
 3vqx97O9IObv9SfTOQqHdTTR3ijLZ9YeYg6pH7Sj26AbIp+l5im0ysoaetge34AsAm3r6RWoufd
 cgWbACMVyz2S4iV0uIP1JyZWztXLf83i42URKd2ICQswF+KZcbCwS9Q10casl/GMGAFqYER27Vi
 bCDge3ifzCl+9nkSsvGwE5pm8nDhk3c5TYKzLjz66bQdWdYCmzyDca9nOcrkmAXzGuanZ0rAerz
 SvptTuF/CQdH8tGXWlXXfps3xZqStw9gfPcvQ4xY8iB+ezLXIK3AmSbQaKYyX+DIfl0ciRaHx30
 QzSpY7uXj2Zq49iYEHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150231



On 9/11/2026 2:26 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 11, 2026 at 04:46:42AM +0530, Mohammad Rafi Shaik wrote:
>> Enable the PM4125 and WSA885X I2C codec as modules in
>> arm64 defconfig.
> 
> Why?
> 
> Same question as usually. I even documented it in maintainer soc
> profile. Dunno how to improve it more.
> 
> Can you tell me?
> 

I reviewed the guidance in Documentation/process/maintainer-soc.rst and 
realized that my original commit description did not sufficiently 
explain why these options should be enabled in arm64_defconfig.

I will improve the commit message to provide the board-specific 
justification, for example:

"Qualcomm Shikra CQM and CQS EVK boards use the PM4125 audio codec for 
headphone playback and capture, and the WSA8855 amplifier for speaker 
playback. Enable both drivers as modules in arm64_defconfig so that 
audio functionality is available on these boards with the default arm64 
configuration."

Thanks for pointing this out.

Best Regards,
Rafi


> Best regards,
> Krzysztof
> 

