Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A0C314B9D
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881887; cv=none; b=I4ViwypkinFGxCnGiifL27eEVQlMxZfYjGipFYXGwj3sZw743tkcmSNab0rZJbiO/VfBCD7+kk5JDLqYCI4qnc9rOfPwESBaQG5BRlx+p6ThpJsQHfQKtqizYY0oZz+jak+RuPnvIEM+6iLYxHiayxG6Va8uH9c9mMPWEoZMZac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881887; c=relaxed/simple;
	bh=0VBCOzp9/xdIM0amtibq05EWqR4To8uxZSZ/8rjaIEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umaXTZoUhg87cYhmCqPopS12M/uS+taWN3iQorC4tzyRQLYiwtzNTVluCoR8aaB10nJAuFrfUHvtKW2Kg1ODeDQq73NA6mrdsbElsMs1pCU1Y0Nrg5ISS7VwMDPQeaUzs3jAk89Gb4AzhHmyDBKm8JvKtWRG9Aify2Iis1ODllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQbqz4u5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eN3as5Td; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQbqz4u5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eN3as5Td"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DTcv3505359
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 08:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIH5wly7/WGzQged6m/KZH1f0fhTWLSyg8Vj0M9ZT4Q=; b=MQbqz4u5JxY+aVXl
	Pt/vh9VLpd+zvAjHMPN1P+S2xYjgriKScigRCNyf0+sQugwS9VyTLpBMVISi8iAu
	mSGqlAzTPixlWrJRdapssCtG0jgS8s9dYsps03TOv+j1FKaJTH+DIngIsTfRI1oo
	AyN/MQaurl2qqPAMs7g80Ivm4wy0OnaSFliHCqq4t2CMcC/jIxMYmtlM3NcVZ7Cf
	G3bR7PzNpLdGJWl7fZycgQ4BcRDCGoRKxyNT4SHOwhanTJL9B3f9yQlshgOdU04z
	h5eVWvcrcQ4uKslF2AGwbprfxr/RpzAXElyFsqgyo8rHToX9+DNP9IpajcrsICr8
	QeBf5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfd5k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 08:04:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5c781193so8080271cf.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881883; x=1778486683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIH5wly7/WGzQged6m/KZH1f0fhTWLSyg8Vj0M9ZT4Q=;
        b=eN3as5TdrvlmQOWgYbt5klvjqwzMJqT+SI9WgGm6dKoWLoGwcwjCkyoGPFjRaf/prl
         hstYak3wzXGzklAmVcvVhyoFq3ujntyb8ftMjpd8E0RQoaQzk2qYIeJvouXHsjPrfhPg
         5zgHmXeLJzlpzd+iP4ezfEVfUgssLvVnNBq8okVNpEW2alBimEms/TVT05VJ+AHFwLwG
         3fbY+hEuyTQhA3ghBdDTlONtGvtdk9PNf3ElivW3c+W+eWi4JMRhcewPUvSY2RJ7U3HI
         cp94mVNfPTnPlrXWyqtraVZwTpDR15Wa3zQizv23af3I5XhevIDGdYaLfRSYM73bH/Pj
         wkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881883; x=1778486683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIH5wly7/WGzQged6m/KZH1f0fhTWLSyg8Vj0M9ZT4Q=;
        b=qy15uHAvPWHx5PA9btx0HlByUbPtPgqIGe1vpxMhNa7qOL8zEQqLS8bufjhQZ4BNh4
         +pMKi7x21ZlWQOsUnt1ycFyX2/yw0qLRUPhat2uFYoU+jr3vkeS8k+zapCemlLyEiM63
         0p5n0vf+x93R54SoM9eJy3zSv0RmbV9rfLlaNkTClE/9hizxqeLbHQ1KprUfhmf0Ni5g
         UMoV5w9ST/GElYpsL2YQ/DAXllNcXOKuOxXebclXF787N/rQozp2evUN+mE2k14e98yC
         p2wrMRb4cM72R5fePdlk0IQ8fqEa7cw89RXQYYeX6oNSHPnDThaTkPSslgaw1dDdSPL/
         xF5g==
X-Forwarded-Encrypted: i=1; AFNElJ/o7N3M0FRMnWi0McUM61SOHuS3QZGbV+S6vmpgbiLADZkqZeY1+j0Wn4jBtvA0ZDGBGWk9knOmO8/Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzUvUCkNBm06ZEU3JGaYpuUqPBkCOikcDa+hvsgMMZ33DugayIA
	x80QCJ55rl7mXp7QejdelTj7oxsyM/vmuXyBvplhhSrnZTjyAW8NO6or0RoBDQetmDT1yoIRGYK
	aMvlM38uu35KtJuKkFWIKzTGTehBGCK6woUT2ZV/QQidN9a3x6AEQDkoKoIeerBOA
X-Gm-Gg: AeBDiet8NgTFpYgElCzbQyZYMT5hh9Apv4hZ6aZpTADDbXv9P3piTR9O3/q5p/IWTQ9
	3oJ/hyZYKJEOFOwWhqQo3t4BLV5h8D1sV0OfHgjz0ee7SMeLP/qH0jhfkU0GaJiYfeq7EfUX7vm
	c23NvRZ00Hr3T01Wo480/V6FmxU84LZ65L8VhXJreVnojO/g3Vxhzh6FyPQqcu++h6deuBii90o
	uLgDKeLyCl6I9ITIf8R1kEw0svviSYwtNB7Mc5nv9qkRIATx8bxubRZTnJs4Mo9V/JwdGMFN20J
	IT5xVMVOeIOLbEH8kuZ/9iM5s31HChFdyCxTi0ImL2u1thPUz3joxbIsTeMryY+5mBOLDyrF1x+
	60qABoemFOQ2TP1VriJy2axRm41p6c7qBlrfqwlHSgRquDA5nLK5HaezA/VnZdm4LtCfAmbdr9I
	Dnb4/FbzI7mff6Rg==
X-Received: by 2002:a05:620a:4724:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-8fd1776c534mr903146785a.4.1777881882807;
        Mon, 04 May 2026 01:04:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4724:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-8fd1776c534mr903144285a.4.1777881882226;
        Mon, 04 May 2026 01:04:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b88a4d99esm3109690a12.31.2026.05.04.01.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:04:41 -0700 (PDT)
Message-ID: <fe3e74fa-c874-4be1-843a-009da37937fa@oss.qualcomm.com>
Date: Mon, 4 May 2026 10:04:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc
 offset
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20260501-blackrock-rtc-v1-1-bddf3e37fa94@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501-blackrock-rtc-v1-1-bddf3e37fa94@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rlE8GSp7AET-WOCRouuuvkGQjzGHiMUy
X-Proofpoint-GUID: rlE8GSp7AET-WOCRouuuvkGQjzGHiMUy
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f8531b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=VL2iTB8cqDA4uMkxVQgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NiBTYWx0ZWRfX9EbRG6oN3+gt
 nGat3i2dHRxQRDYyXpvd0WkYdARE0Ymc+44P6Nivx+WQ350+P6XRfTfNSH2CcbVM5K7my3UPA6I
 0rWQuUe0hyx+NQYrSywRq8yc4kM6ffZScjaq53QPFX2frCLimyIcWNYEgcL0xkza2mj4P1biDfW
 4TWx5841YE+tRXu1lecOaaKJtCNM3yPfo9AO3wXWIdxop+ndDMnBfoxpD6+31Zw2MiFAGY6Rnn5
 IfVeaVAkCDn1FG+Z3UxOdPn2w30vsplKqdzxYjOf51Z1/oAMpxw+Cn4gsGSK5ThtOPjtkKj6Npo
 N/oLLVXqH3zzzAO8x3zzVEh6uGAZokf1dZ0GZsXpbXvOdI1CKK8TwAJtdbeezb57EpV9Y12CLyg
 /tFD/yW5Ss6k1j+sl/3avKTAByfJCpOy0uyifKWI2hCy91Z/5lwA8UzbN97kgp01qznP14dTpxu
 8txUnFj+c7CWO41tDKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040086

On 5/1/26 11:11 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> On platforms where the offset is stored in a Qualcomm specific UEFI
> variable the variables are also accessed in a non-standard way, which
> means that the OS cannot assume that the variable service is available
> by the time the RTC driver probes.
> 
> Use the new 'qcom,uefi-rtc-info' property to indicate that the offset is
> stored in a UEFI variable so that the OS can determine whether to wait
> for it to become available.
> 
> [1]: https://lore.kernel.org/r/20250423075143.11157-4-johan+linaro@kernel.org
> 
> Fixes: 16a7fed11714 ("arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023")
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
