Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89DD23BD17
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776746407; cv=none; b=dpafzVtKiqK/EFmhjqjfEpzLyMplU4PufClIsznEQsZmpCZBPusuUBz2SRiU727xxWNGuQID1YDFVNmywhVqj3yWAEPSCqXiOZ7OzLp3aMfTFHdi4Lgoglb8GodWY7472BWHoKYJIemflx0Jo0VPo193GRrB0F4qL3zajSlXFVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776746407; c=relaxed/simple;
	bh=l1hLwGTzUQIgc/1bX7GBrlEwTlCX8TxVzWClqq4NY4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6NVXACgAoi7o3KcZAsOU+0iH894ZuUQ44a1HUj4/0b+rWAA+zQksqcyT+YtL1Gos+1GBR/k+fWjxZpKmJon0zxlVbimLx7uj0g1NfoizEI2FtHAhLv8sfqVP6JEToX7jBWn6ud8Yx5EcOZPpPzwsHbPqQO1bTEQz/y6yVZsNsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAlaYkq8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7c/xuNr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAlaYkq8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7c/xuNr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L21vEG084489
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tr8825yytIorPd8JENJPxBVEwgt50vut82kIS3f4fNE=; b=XAlaYkq87eXVkSAc
	W1Hz8pfZe4QPO6bhL1j7nzDE/4Pojp27vIQKlpkH1hjVWchGsaDkX6Y8b4j4/PV1
	eDiWDPWOHy8/YDp0NkFyUIPBbi/mVfRstFbvKfwU6OakEmF9429bgDEbNdCKpkYu
	8XnAn+yV0SqjD6RWYZ9GUbUle1OAVnWHJDCKoXLQuxvOJTq3t8bCNhvCvZKgv1T5
	OpLNHwR/GlKuh6vN0Lx5SBIdiSEmT9YOWvMtiVBQc1ycSwSdr07+RtrWqBkOeQ13
	I+eZ8+Ncc+TdQNjNb4uU7cznGoSOaGJ2q0ZQQ0anIVv0eTSFUsDNx7wLVoZnu74u
	zJ+Fsw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81kprg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:40:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so1765356a12.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 21:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776746404; x=1777351204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tr8825yytIorPd8JENJPxBVEwgt50vut82kIS3f4fNE=;
        b=U7c/xuNrpNGu2habUf0jVDS3ucpEMNe2bcIfRck+kdnkQSjUpnErFuW/ifugST++KK
         8LTrMEOAUPHaCyYc71VHHfNvsvN6DLfBWpfzT26kZZCEYH7rBPeWZ4EiUkUI6ZTvIOUY
         vL1dHLSkPZmvBmdGvZnipd2u1vbHVEvbZtyq8B3zf8RYeuoPgZW3jVpYLrWVr/si9YV1
         RpOhmezpQHDOsDQ2T2NrMITn4F8G5invOhijeEFfEBFpKZtdru1HjZdS8khvY6zSbnkt
         /ejtTlcIi/WUR973AEt+Z1FGcmNrIwyAmGQrFW/C2N4kpxR99hrOvBiJQTWYSHYSKFTR
         cwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776746404; x=1777351204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tr8825yytIorPd8JENJPxBVEwgt50vut82kIS3f4fNE=;
        b=b22GPtL/160IE7xlRLQLddEoBi5O1nmrFaRp6wgW+ZhStQKPu1oAJC2N2+PMYSzZaI
         jo3SUAbG3Lgl2UjQtEMdSw3dMZoY6iY9i2geOHPq5mOVEm9f6B11Ti32ga47UecQovqf
         IqoNSIXRxNWld+PhCuAmZAzssseONYzPQMglVYZA0kDSVmCbklWXooZ9xjYaK5p5ZSb9
         AoHAglOx5UCmXO5inv99DKsrnCu3D7WgZMNOYGxVBdWio+ttSXoFg7rmzvlPdt2WtBAn
         SxZZNh+K3EMkux+aY/zpYLU/bDImNh5HeUqAlqmFIKRck11bNrufa+azEQZMEhHvp+Cz
         GnfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gjnh2tgxbiBGprXVejPzOFgMffNkEbu/v6BR4cjlQVOuxC/dAah1fq5Fp6siJ6Gfxuensip9LNwXD@vger.kernel.org
X-Gm-Message-State: AOJu0YxzXMU4N2IQV3D2tUtJbsfJyENJBwkIEujKaJeL6GK2LDtfCgfY
	+kH6c0sD10elFFCqW/umpMKvWo8h6TSpVgW0X6r03QLj2Nu2lgRH7Uc5nQDjyWBp7uTPQGMjj+1
	h+5pg5GY/OAU5MpToW/EUl9QkPQlbLLKdoTf7jcu9ZpXo0tW/Hl6CQDyTsfjmV3qU
X-Gm-Gg: AeBDievAVHH0jp42dl9QQ9oF3VV/H1u+ZIab9TsbVt2deNGXkU8/SYNb4J2VQQQmQw7
	Sphbf//Z7XYWRzUw/AjTf0rCFF5cgyPTdA3rQ8ExniKTOI0Hv3evCmJQY1pXFfwM29vCL9diWzN
	T5bW+TdE5EL9aHd7m8eBAlEsEE+hckIL46V//jkPd7PnYnujFqr5iQhQQXHSsuHcubSTvcNO545
	3DFxPbdOGPcXi5MgqbXoQXEJIFnd91WXPIZOhUtNxef4RxK4SkKajqkoa/ALfCpokki/AqUDVsj
	5/zLGZDNzULf0L5samb6NHOSymeXlV2i4ZiSmmQY2DdAQfqv+QduByX1HNeOkHYUiX8u2zQ+Hnn
	6TBqFS9haFoGMsX7IEAQK9zJgw/g0SVwIcWKI7u8cMHx0lbuhW/lG4zXo8iuSfPg3
X-Received: by 2002:a05:6a00:181b:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82f8b389d04mr15077968b3a.8.1776746403687;
        Mon, 20 Apr 2026 21:40:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82f8b389d04mr15077947b3a.8.1776746403173;
        Mon, 20 Apr 2026 21:40:03 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm12628440b3a.60.2026.04.20.21.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 21:40:02 -0700 (PDT)
Message-ID: <ef46f228-5644-4137-a117-201fce7b8481@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 10:09:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: talos: Add QSPI support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
 <ln66k6kv2jakmoi7nzvoven66ugd4xiagpazgpnxaw2u2ytdtm@42eikb6kyvs7>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <ln66k6kv2jakmoi7nzvoven66ugd4xiagpazgpnxaw2u2ytdtm@42eikb6kyvs7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA0MiBTYWx0ZWRfX9rakifIDH86A
 4nbcOL8M6zJ4l3V8rrkTYnyWG/8KNesIBfFlKWaMGTWCjyCiJIxDzXlLvFA/gGds2WWrphQ+fOH
 HamBYdSe+wVOEHie+u/KGXg23rb2i1ZEiXtHMubLy7lmpZ/MYzlI4P7VaaKPBb7l6NlZ1SU68zG
 9z5mAs6vBfBsGeGDv9WacsaFz9Ztb4/vfng5ggmrBoqrm9dif2ZiyUz6k7TE4xJcKw2QVLS3Hqy
 2kWzMtpmAO8bjwMNYsqF9859254cdYC8XTGSoNGDKHbJQwbCN4uPcsHcNHskccyhT4NpJxnabbc
 55DUd2dlGml9qebLEL9kHQytDUx8Zd3uEOovoS+JZIJqJ0qdfx5MdsA7BR/l5XH5kznst4FhM84
 +vaFpVLY9xPrlRN2aFzRkFrpj0Jobj2CXSU68Zx5XAejRmq8frpvO/PAlGOkf3AgsU1zwrSKJ/B
 6myJHLp88UAj314L4Vg==
X-Proofpoint-GUID: SV16aZEL-j8FcNAhM7sE5wHYAXNwEEaR
X-Proofpoint-ORIG-GUID: SV16aZEL-j8FcNAhM7sE5wHYAXNwEEaR
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e6ffa4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pflzKVUtcQ7LZN8AbZUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210042



On 4/20/2026 5:59 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 11:42:51AM +0530, Viken Dadhaniya wrote:
>> The Talos (QCS615) platform includes a QSPI controller used for accessing
>> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
>> the QSPI controller node to enable support for this hardware.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>
> 
> You got r-b's for v2. Looks like they got ignored...
> 

Reviewed-by tags from v2 were not carried forward due to code changes 
suggested by Konrad in the v2 review, which were implemented in v3. 
