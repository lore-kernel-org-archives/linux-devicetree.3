Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4060F3F0A95
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494142; cv=none; b=D5tn3jCXN12TKCABn+Ur84eO9jYD9JtGnqkQ6s5lBtShHDWFBM9hmGx6uBxtgxq03PiW5yoGizACjn/Xu+5C9Q9htPw0Uy4WtZX1uoreZYBAXIl05fQqYvMgCYzD2Y/Y5bS05IYV03yY/KTlCvlcM7r8Yo5VH35EVHhnvtUV/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494142; c=relaxed/simple;
	bh=a3+u6bqen98RIltbKM6R1AY88Zbb0gytbixnAWAgASE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8vtagYjY0LHCFu9PvbEZdUQWaFxYzLWKhYDRDK74eEAe4b1gYQSPHqLmWR0PfDAYOIpPn5KCoEsgmXds3r2GfjVTIFALQi0ft+9ubxWi64ysmIgQFEC9VIVIGef8mMvJFIpOU1EIpPak+Km9KsRCz8qS/hNlJvpgh5kp17qxgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kb989Jkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7/t26ct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kb989Jkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7/t26ct"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842d9g1573678
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 07:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5E9DTeuL9lwGprVKTcT9XKG5hC9lDtVWiXIoh7IcYJ0=; b=kb989JkhavL4eLHT
	Ktxl4S4vvQOKcki9R+mwvzLR40NECxNBUvJDrry/pDfepNyOJ8mhOZC0tgE/+NXi
	6V1L9OBrLpQ9vxcuy0YYyWX3OErwkqV89hdpnRe5Lvnhco5VKo7/xP8rn2ZnfERv
	CgwtA07A9euns8bxwxU9YE9DeCTa+dJ+p90PHW3diNI0p0CnFn7wwS1dEpknrrZD
	fW8NbE31YkDvw10UxWLmPCAWes6+OlkyL2cZzc7sQIyoI5EQCSE+2S0Ng95hYGU+
	IetzJ4mPofI2HKF6kB+rYLUgxJ6RO2QgkpveuwPvQsalLuDv6JGUWxrogiROxtHd
	sMF5PQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgsv81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:02:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so1110081cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 00:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783494125; x=1784098925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5E9DTeuL9lwGprVKTcT9XKG5hC9lDtVWiXIoh7IcYJ0=;
        b=B7/t26ctnW92AsaNRaHaYJbOmU5Reh0oDfq3nYUFp8QSao04vXXlcO2pVwuRh9BxVu
         d72Ry2TdlEs5fGLbAAdeThtceFCKXx0DD5WfFAIrXOOsioUFP4iA2YQj569U6M+MdcT7
         Z6p+xDAT3XgN6GLat0Ftf4KTBFPd0/HZioJfJo7CgqguHgTR5WZkntTTmzj25WHgoWK4
         yBRuu5Ivk0Ctkto9yPlP6GSDBRuzDNNXL4amp6onnmq/MZkZ9l+qdmljoDwWDYKXGM0o
         4aF+Dww5i/7mTC5ew0yeegudK1hN6Usm10BSTCIz3Fmr3gPdx/ZSTMDCZuamsHtQBXZ+
         73BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783494125; x=1784098925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5E9DTeuL9lwGprVKTcT9XKG5hC9lDtVWiXIoh7IcYJ0=;
        b=dqdHaL6Q/jfDysB+9Hz9khjVDUoSPTQBIP19/fI01albeBpNIRAKRX49q6XC6rhzC8
         CBkq4SBeRPMIN8uJC/96K3oeXMI75dRixLBFnrl7IQlBYemgFO050r7ZClb9RUkXRPz0
         OALo6aP9xE0UVYmVI09lOWj80gCt9fVYGQXq04ppsY4+HRNznidcxG8hYCxV5esHzOD9
         43LlAvC+g+9EMCrz0gYzZatAt+WDBLAvFs+AU2pqYq7NlHfMnyABONrYm3x3qzyDwJbp
         o9H655min80CX13m4+Vh7lEInO3ib0Pn36d5oLEXRm3K63VNBY/7Jpkza3qHffTbPPUf
         sAow==
X-Forwarded-Encrypted: i=1; AHgh+RqdVlQ1cyezskHczCfj7EgpIfE+yi8SU+4nibMX0tIgg3/rpiFksTNexFYyoN2qdNYeSAuV0phosAxs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1NVt7s/pPZTWTVSDnEOzPdzLtOU4hblZ9J5xKstgsIOHQ71qG
	VvY1L80n1Ms85GTZDwMRXNlyxTs4dKEgRoul4+NQssFTgjffQOmNuW5XP4YhPcdVwU5jAcpMJUa
	qP5o09K6scyzFHtZYmmILQUBO/xRPES2Lsnfq7JQwLLwAIeQCw9cZCmeFu8Jha54M0io9idWJ
X-Gm-Gg: AfdE7clMFXcmjoBfYLI5j1GPSjbDcGDI271fvh3SsSNtCnRroWlZN+07SsGBHNundFH
	83AjLMbK5oV76ZNVXKeARC9HpSrGMwgvhNHRTCEU9g1ks5pAVl3PJTqhFZve7MNqd57yIvAL5vP
	3gE5a0HwatH1yL+sueftcs9gzRhZGpXdpm72AHClJeQCnR45nLLtUJMHBAEywfJZfEmAReLZWFx
	WuF5H1UYoeBRmDo3OTEi0lKdzMSvre2z7829XhN7EMoe6tcifPzEhuvP4ROCzAHLfTHJmsxEnKK
	JWUzpMQoxErkoxJUQMuykjFJkaNcdx+z+zBBhgV6nSEc7MJw37ofLOMeG5n+G87wjwuieIGQT9K
	R6eRIRZ/qs9hBvicapO70NRcSmbvNx6e3d64=
X-Received: by 2002:a05:622a:14d2:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c8b53a6c7mr11077101cf.10.1783494125466;
        Wed, 08 Jul 2026 00:02:05 -0700 (PDT)
X-Received: by 2002:a05:622a:14d2:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c8b53a6c7mr11076831cf.10.1783494125047;
        Wed, 08 Jul 2026 00:02:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad882289sm257222966b.26.2026.07.08.00.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:02:04 -0700 (PDT)
Message-ID: <1f98aa3b-9da1-4617-96a6-025bfd81c2e6@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:02:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay
 for Waveshare WM8960 Audio HAT
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@oss.qualcomm.com
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
 <zfmtqi3k3miv3ncgla5x3gjktj5j25zkyqqxmyq5i44ynzfnhb@7mruev4sw5vm>
 <64af4615-4581-43dd-a1b1-8324c63d5853@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <64af4615-4581-43dd-a1b1-8324c63d5853@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OfDX5in8S3GaneZfvFVWgvdZY_CGv3KO
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4df5ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=tXEpHCNmLiySnc06sYEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OfDX5in8S3GaneZfvFVWgvdZY_CGv3KO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NSBTYWx0ZWRfX0oQ6qvUEYgLT
 5rDJMcze5xjMa6MxdaRd5nnaduWZe6VXXn7GQoZw4ETxNhA46V3Xt85o+H0Ps25SjIgEvmFt/CM
 KcYvCgnhwcz3zVqmd7INzcjFxBF2anU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NSBTYWx0ZWRfXxVzuuBGu/dOc
 SqNShdiOnldJ8kwVKO8hxHrCXhDgiocwgzM2WjKGPtnkR9EtD5gPHm7cu7QkPtWzzWHVF01w1eX
 sEGmZPrquC5ntgztKTkuR4G8AsWw2oZP9vxdBVGqEz/KwA1Bjlye2gvX1pLbtwiglamlIM/wf0W
 XUznvXzdic8kzTirkCaRHJNh4WGPEe2VecTCXJMnPueb9mrQwyurkdyw2oQ7L0M/SEBtIqzLhtA
 XVeY29PD+KsmZjEBGhUjCyDvIRUPuRw0kk56eXkV/GzrjKwWUYHnmignejsiekQzVgp93S65V4D
 2IzZ9ZTkxmRX7RdIINNlLaRY+btEDYpV1ks9VKo9AkIqjzTsQbZJEH0kJO7ovONqSJQcpMEsLmI
 MD02t9n7kTv67lu9VWOK84eqcp031+Op1HigPnIbpyYDLeX2Hc+WQFbeOTRPTWdJ2/fxiBQCoZe
 uAVpwRX9Nx2ALKg54zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080065

On 7/7/26 10:41 PM, Srinivas Kandagatla wrote:
> On 7/7/26 7:15 PM, Dmitry Baryshkov wrote:
>> On Tue, Jul 07, 2026 at 05:37:03PM +0100, Srinivas Kandagatla wrote:
>>> Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
>>> 40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
>>> the WM8960 codec on I2C0, and the corresponding I2S1 playback and
>>> capture DAI links to the sound card.
>>
>> The contents of the overlay is more or less visible from the patch.
>> Please provide some useful documentation, e.g. how to test the codec.
>> Does one need extra UCM file for it? 
> 
> Yes, currently this has been tested manually with mixer commands from
> console, the plan make this work with ucm dynamically based on the
> existence of the dai-link that comes as part of overlay.
> 
> Here is wip ucm changes required for this,
> 
> https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/ventuno-q-jhat

with the commit message amended

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
