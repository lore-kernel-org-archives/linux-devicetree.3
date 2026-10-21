Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564603;
	b=UO85txy5KLirFXEZCNobWcsDDXBgmDlL5XLY55tfteUZ/aT0heRgl+f+UR1vam2EwIE4
	 5wextJVO9ydY8DGhZ+k5HRtUWNnZ8zMSBk6oaOgMzFqrcF3DgJlNseBE3CDT1HaDANtYq
	 vYfztvBEa0fOt+hckTBphNgeH87/bdJqn3baP3LYIpi7Cs8PT054lhqexb+Y4YRJgQd16
	 0HKSMkrwckiqwPKbgXx4AGYs0gMM/DJExw4pFc9huC0iMLpmVgPDx5EmrRfqVpbouhNGj
	 Sk79Y5eI8bBnIrRrEI+zMe3fBvJNwoco1Oh7HyviGC1ApbDFZo7YgqciGh+Xf3Cqqeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=;
	b=yJ1v7stiiba2HovbICn1j5IoTW7PMqSNl8kfsZODqmDiJvjsmRZzN/9ATYRIfXfq7PFD
	 /cI60ILcGrPmRpXhbjjKKXUZ8HFZOaVJsPdmBKXvl2ZpZAcfNUzc5V5v70HOK44smoxab
	 HkNus2d9vUpjGw6xqnNbHEuB7uKmaNJRjOzn8suWtey5f5gd4QZL1u4ZS2VLXAUlDVJ4r
	 mSHp765DlmzO3Yadcjv+tpfWze7dCzU8kEhknfpONY/pf9U60XDGBQaVg+rjNO7dGbqFR
	 zXmDDGTLTMTCpw9eqv7VSZYNAHux/dxwHtQVc9dhYv4DI5YCTW5Ldu/irFNTWWhLwuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqZYt9N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5Xf4tgj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C8A606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C8A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqZYt9N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5Xf4tgj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iv1m164981
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=; b=eXqZYt9NHbMWx11B
	mEbZHXnQxoqS+81N9BkQhN3YP9ctwTfcUQRFpL4mlOp5wa0/YkdDYZD/cqoJF5o6
	HDkNSAOMUZp/0ky0maFWcd4wWZGk7Q0K8nhHD0U8yTFYWRJrFq0YzTSiMmkCUo1F
	+m3ydB5fVyDdkmwo3CqvQm/DJ4Q46hQuPRJsiwSgBik4VM46prhiq/BaEXZt7UCj
	8CuGn8rE9AXZlaVTpcWjgC2GhE2/Z9A5Zu4bkRfnKn9uXqRrg9d7BVrl560ocD5c
	8nwGk5g8TXgL7CETA392fDYl+YDun9f5DGXgjLvPWnHDaJHlBIuHQAmaIhzaiu0p
	ej9fgA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs01j1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:36:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so586223c88.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564601; x=1793169401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=;
        b=j5Xf4tgjg6MmEay67YJtTEv4Xz93x8IVm11M9TjomtTRVwCglACm2+eiKt/jvPCSkk
         lMg9q38hpCgn3NDDr8qzr9j/OhRNxNoRyHMQmZCGMND5txh/Q+kzvBZdHx6pBor9Lz8z
         vkR/clACkQzY29HdfU9tmO1egH340bswMRR9NDuypPQ5qSU50D74CZPcVzA+bNamOhmj
         wAUSeV3vysyNsqRPQaopJ5hzuDJ/8rv2v3tqpyw1y7Z07zRqNsqMsvfopIPhD/GzZ4Wu
         dItNXJyiXCCBO5t+2qka2ixFUfiQn5y5Vi+uacq83rDykgi6bjAoVbc4bcVFoN5/+YyS
         Rk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564601; x=1793169401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=;
        b=ObXGNN1xwJk2i6rRGK+fxYmjehWXar/tlenR+art2+VGSY8ldJMmbzTeOzBVSpf88B
         33eioRnSfRrtAHDj7dxx+rcGv2suj8aEnTLCWfoQQa0XzKv+XGJCDUx2VmQURqEfvy2p
         v/FZTUMp/NTPWmLAQZE1cg8nwWZr27h+9hA6Oulc0eLjZTh3PtFJvubo5juw0FBO4IFU
         wrFWARyqkIY8OVfsgSXGard9QEwWrWs6GyYSVTWtlezgBJ0OD44ENHMP/vPmYvKaP53h
         9qUCcskzpUO/I8bXgyvSe8SDx7cbl8hhDJ6Q0TAUmizfimXqTRqj2kKNeNDyZI/ek0jq
         yGQQ==
X-Forwarded-Encrypted: i=1; AKwUvByshBwaxqa9fKvSBKsHtoPCQ+dc06OaV5DnVUCtL5eF9qaMGyHBuhh1UQA9cE6QRAi8GqhrFN9ryG2C@vger.kernel.org
X-Gm-Message-State: AFq9FYLDFDckSusyMtZ2D6+QOpFBjNmIE07FedrLBn9UkX97CIrbko5I
	eB+VNvgZUptzM/jJPwzM5Pjn97ErY5E4CQErmWObMUznSBtVtyfWbktsJeRwGMK+LeyPCZfAhlC
	joTbWOWcOLMRCZ5iw/7fS5YRuhgp2R01Op/zzZQBX9h21jdcKPq7CFoyWYoK29PnS
X-Gm-Gg: AYBFou3e1YBEMgNa7+FntAOIgxIdp45SpAFTay734/g54dCsTVtHB+MaVLmfFRXaxxx
	djMAnOSljYwoukZJeV5C13VHXqGeL481ThTabpOrCSmRVeeca0+TQWUEFIAe+kzZXc6XwpHoqNg
	4qXe+1LQ55x5euRvfe7N/vu7cxT/l2DMghIiQd+0ZupxyKeE4eEXRo7NQT0RsGo3u34bJplqbF0
	J/iPtUiuShLQEjHHLGoJTQcjHa4+9VbNyazVPZp/IcF3WbiLtuREFm+1k8lRRMwLzqw0GWaZjLb
	zAY1pF2QdEpAYECugQbqiRnVtd41jsVeAg6JoKh13vBqVSHMb/c9NDobAt0OGxoFEBv72R9cnnj
	awcUNn6ywFOsBof9uqh9m
X-Received: by 2002:a05:7022:fa9:b0:154:dc96:c1d8 with SMTP id a92af1059eb24-190a03343a9mr2050304c88.2.1792564600667;
        Tue, 20 Oct 2026 23:36:40 -0700 (PDT)
X-Received: by 2002:a05:7022:fa9:b0:154:dc96:c1d8 with SMTP id a92af1059eb24-190a03343a9mr2050272c88.2.1792564600108;
        Tue, 20 Oct 2026 23:36:40 -0700 (PDT)
Received: from [10.216.19.242] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm5544025c88.12.2026.10.20.23.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:36:39 -0700 (PDT)
Message-ID: <cf08ef44-54e5-4354-a553-9c51f628f864@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:06:34 +0530
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
Subject: Re: [PATCH RFC v2 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
 <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
 <atTATLreJ1Fo-ZqI@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <atTATLreJ1Fo-ZqI@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad85d79 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=j2EAsdPlCOniiROzf4oA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX2t3FvZKWrLca
 ttBLyPXYssB2kAd0OQ2v96NjLsthXy3T72Vut5GPNcJsS/0XvihU78zGzeKjzjMcd6TJMbYx5aN
 yAkRthCjqldSfrJSmyI/noNOM7fPKP6ahSTEiXkEVp5HTqOLO7stWnSm0NV0lrCOwDeo2jCDymQ
 d4RHENNY+8O9/tF00TVQATMQHnY5Fm1OIhFCJ4C7DMCOidyTzkwvU/BUJMqH3u9+cN6dafcI+Tv
 u19rU1jXLUmbv9gHBchg4ip9hLzt2TG0xlwRS2XGGyWUxpoNFmMWmv62tJI8mcpfzOh8t6b2/u/
 YdG8d/Hy28jXljIr8ZgeDZfqtfuxLUTnhZ64/sy86PgTf93O3mgtkELztuuvvhEZqhuvR7cFhxB
 rEllBWt1bNy78qNwrmm9T6aZ1RxFc/zrZfVzEpXIir7bVqsHBzDGDJkWl2dr9FpwYdcQMZbGKqy
 jwBr9QK3mIVw42Ix3DQ==
X-Proofpoint-ORIG-GUID: rASI461VtFp-h-r0Ha9t6K23LH2Iq5Bq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX9DbJOHtRguRX
 dyL2g+TTfk4BUJxx+7cUABfvTzqKknsNOE6cN+kY1jcS6+J421npa4Neg3IXtlXLuJPcNKLhN2+
 z4isdUochzNSeUth5BMPuno+aDxUd84=
X-Proofpoint-GUID: rASI461VtFp-h-r0Ha9t6K23LH2Iq5Bq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026



On 10/18/2026 6:19 PM, Shawn Guo wrote:
> On Sun, Oct 18, 2026 at 12:46:47PM +0530, Anurag Pateriya wrote:
>> Add the SoCCP remoteproc node with its firmware path on the Nord
>> RRD board.
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> index 47978df0af92..89f8d36ed812 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> @@ -434,6 +434,10 @@ &spi16 {
>>   	status = "okay";
>>   };
>>   
>> +&remoteproc_soccp {
> 
> In alphabetical order, I think it should go right after remoteproc_cdsp3
> rather than spi16.
> 
> Shawn

Yes. Will fix it in next version.

Anurag

> 
>> +	firmware-name = "qcom/nord/soccp.mbn";
>> +};
>> +
>>   &uart4 {
>>   	status = "okay";
>>   };
>>
>> -- 
>> 2.43.0
>>

