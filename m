Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8B530C14C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501172; cv=none; b=LmRp+oo9rDeBcW72iwDyFkbUCUr1acwkfljRBia/wUHm+ZWAnpKzAmAAigQXYfnQO0n1zYR5iPKGLRZxaT1rRPSBcjiLoJsWuKO38cYBfdidTvIoqCYjCV3cyG8Ig3PGMRbk0nLLojZCwpyMUOssRNX6tk3wyHkiMCgdpbvTBvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501172; c=relaxed/simple;
	bh=YV7/jO8AWy/iVCyJPFG78t7NVdl+EeHWvWjZzeolsUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmanQMqgx5mJgBTUJ833ZUeHzZH4DloUucTUMqZ5w3VfVluRdOeApriBbe9KgBUFkG9jAtAC+KkWqSarlgOyPuC4ccpyf3FWq1uLBNECYQTs10j/0xIzCu5EZ1qC9z07VcKRnwyuI+071LYbZCcTMnA9Bn/1whkxXIxfVNuBt5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miUBOYQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8rEvVUp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="miUBOYQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8rEvVUp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1jKGU3089692
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdwfuxyCAi0gPj2XDmK6neTTdKwFGwO7R13mBBgx9og=; b=miUBOYQMN0YjV6pt
	1swg2BiWxYIXVQTR4hDwb692llrx/97lR3lVKysN1dS8HVP5JWdhMZ6+8u7KfPeF
	0GBRbPWT2jRnb0FDTjzBMBf1ja37Y0ysunqBt2TcZ73Qf+Wle9R8IMYafMc8TxXc
	R3oBTO9S/Uu+UT/Cpqkrnw8bBhLmhCcMrDofq4rMTQLWTSlJQ/dcJVV5VuqE5aBd
	/iL7PkNx4tFqyHmFKLEZWPs2PGE8dwxW0Cp7xDdPULZzO0JfGTyvraDcdm+pgpOm
	BQPuZEAnRy1d+WkM6JvrPG1+r1wbcLAEi/p953Jx1/Uv1n11gP2xK1fonUfWBeCn
	3vfHHw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6dk53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:26:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b76d12so1975699a91.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501169; x=1782105969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RdwfuxyCAi0gPj2XDmK6neTTdKwFGwO7R13mBBgx9og=;
        b=j8rEvVUpHEG/GWUMm5okVwo8VWxuYAT+MuoGWosyszmxUpSreAP3QSSdwh1ShcLFBU
         H6+WHcoVUYDtDVtnMgdjOrA7GS5EW+k0q1jhaD7JPWNdB/rDtCYODA49LlegY2OS6aab
         F0nU4CI3k1plP+o476SpMl4ba7/xntnXyigsfTQu5VXppUQ4C1zOP5BmWKDZ8kucDlWH
         h3sPtfgWDt33lI2xDi5yc2BnikU3b7T63GdAz8GYRk6jMuqtZtfPmn49Cd7cHwyiBjTv
         S1BLUpqvIN0bpeaI4DOppB3i2UozFFOOwWbHcWPnMwB7WZFv60kcj3MZV0S7kl45sHah
         vN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501169; x=1782105969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdwfuxyCAi0gPj2XDmK6neTTdKwFGwO7R13mBBgx9og=;
        b=CbZilUDbw5Damyte39sQaFnWB7nFzp/2qxzx/ZKjVvgCB2P9dvRy0Qeld6Ezkh8dxR
         vbMcF9wFaBxiT/yL1iJJ1S/YUBMZSJx7zb7jg9xD3g7KyMs0OdE6RdCvfZ/zqX3/YWtp
         5EeBZkoAgiRtOnhTXNqCZwMIdfKwojYnb3UsAGqiGjpRHtjYidjhcUTba6zuZibtcosQ
         LbTfVYf1G9Nrd7SMvRDTHGrvFMeikCk0cnR/rf2nVbViPlih3kVIPMIKtUVd/a3IJnIw
         jYXYhgDop2AsKVl1emTzEWeHq1RVA5GVhys7st6UffkcfD8W+1FbIQNUxx16nllvi1BW
         G+sA==
X-Forwarded-Encrypted: i=1; AFNElJ/Bbc7DX477xwoOcQH1w/GrTRWjLujbYQty2mbQbBk/rpuOcn/zl/P6GJYvqOCpIX5LvKR0/KGkbIIP@vger.kernel.org
X-Gm-Message-State: AOJu0Yysb+aTWpvAgRtUBuqePA/JdgIKAiOnrAs5UIjc1+HB5a7wKmFt
	6Wm0nsAWvjqs4rodRngZSGH8VIhbHACboqcaGcT93g6nBaEdu2jACUiIQJT+8jr2mmsEKz4oAqG
	GFd2ShsAuTW9PoI1LdNG6uk2KoF1XKm09LGBFw+jGF5qwKeND3YA9j6wZ1Gbz6JYR
X-Gm-Gg: Acq92OHa+1s3pQIuPPNmxpYQRR10GEgMtFywmpi65k1Lw5KaRLtSChxZ7RAsheqDxcE
	psowbQzXI5tlSIMbQ852OWzeaaJ8lJbMtoAb0QQs5Wtb9YYSDHGPQ3ugRCoMjNlxo2r7NhYVt2+
	Lb1gjXj9BOrzjod76iIjk+1FIoD6A4XRYS4rw5jigDj9jf2+vL1cJjKVYG8vO0yThmK+EZmgjTF
	cuI61fy/mnbm4AdhfBZSTZtEffCxbEJ9uFYhn2Td/DUdjcBaJswTF5xEfGske1CmbZsXckdE/hG
	juO59nJPhLQeSNIH94FVcH/FFeDlk8fZDKQumRpJFc8O+egN5ybSCfNnnXFj6xbx0XzwtDk+pLX
	h0KlQT6Nt4xstaqISXHUZPJUU18kI39tbPu2gxKOjBDDCusFmEXU=
X-Received: by 2002:a17:902:c404:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c412c30b6amr142075905ad.27.1781501169145;
        Sun, 14 Jun 2026 22:26:09 -0700 (PDT)
X-Received: by 2002:a17:902:c404:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c412c30b6amr142075585ad.27.1781501168704;
        Sun, 14 Jun 2026 22:26:08 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e59e1sm87808245ad.17.2026.06.14.22.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:26:08 -0700 (PDT)
Message-ID: <94b8d0e4-1f9a-4905-b26e-1db10a07f271@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 10:56:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <37390682-ca24-402c-bf45-7f6bfb87f4a8@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <37390682-ca24-402c-bf45-7f6bfb87f4a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NCBTYWx0ZWRfX2MpQonYfOchF
 4rY7UL9KzM6reqU5pC6tv5wLr1zkiX/NptXV46I+sAVC1FMcpJMtT3imrv8s3D/f/LtL/8lUoYk
 j1T7t2KbfieP+hPwvekmKpEEHPMhAus=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NCBTYWx0ZWRfXyMS7VvB1Cgep
 Bxj+Y8WeF41SlC8TL/EiFu8oXfjzD7z+nOEUrVnymD/Y9434PZ7bG5MDlzyNl50CTqDu63Md8uq
 tk8Z4ceTNH5hz0nBWZb401nUqPXDzIaTzxJwE/wi5JtcEqx8wNiEePiW6uBeEgVtf5hwM238g9E
 kPhDxJY9BpWH1lTyK7HdhR+KZL8GSTcHxrtsTr8dE6CiI1aNhanF/e5bgHZEbQeZtBRXcr7clt3
 qS6KDwF+Y6a7+BIRirqy9b6RGtJgiSyJrLgceV/ZTIrlh+VSYToNIYvRd+OSmAzd2issGjcKWPX
 VjhlwnuFGM9cN+j+VFfn6xtg5ApdRL9o6mr7EwgF8bdNajduzr8EpnH/ejR4qSHDrfy2ZHWxadJ
 1iAwTu/aaJjju0bNLSmBBgdDjbSkFgPaFNHqdhWgpbBbeZN/2JT3y908Xy4IXVAmTkwnD4VGsVk
 4z9AIAshyZdf3dVpCXQ==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2f8cf2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vVwBTKN7el7THSwTgNcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: SpEIA0ZbjDFtfqnSQXkmhXp-E6gGyXQF
X-Proofpoint-ORIG-GUID: SpEIA0ZbjDFtfqnSQXkmhXp-E6gGyXQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150054



On 6/11/2026 4:11 PM, Konrad Dybcio wrote:
> On 5/26/26 12:54 PM, Maulik Shah wrote:
>> There are two modes PDC irqchip can work in
>>         - pass through mode
>>         - secondary controller mode
>>
>> Secondary mode is supported depending on SoC using PDC HW Version v3.0
>> or higher.
> 
> [...]
> 
>> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
>> change-id: 20260522-hamoa_pdc-1517acc2dcd4
>> prerequisite-message-id: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
>> prerequisite-patch-id: 152df6e30f70eb1b45909ce2793bc4277554b7ff
>> prerequisite-patch-id: 118bd4216e0386e7214133f53153684947fa8dd3
>> prerequisite-patch-id: 1f2f272d8ad1f7930d462e6349bc49de815e1ba1
>> prerequisite-patch-id: 3754ffdf536206353f74953fd6d39804ff7787d4
> 
> This does depend on the changes you made on the driver, but not on
> the 30 bundled DT changes - let's just point to the actual dependencies
> 
> Konrad

Yes, i let b4 handle it and it added all 30 changes since the dependent series had both both driver / DT changes.
Will remove this dependency as driver part of the dependency series is already merged in.

Thanks,
Maulik

