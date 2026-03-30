Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2CE3AE70A
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859929; cv=none; b=ltly27X/RUs3GPelA+Vdzzsikz7C6/yk5afDRt4kIF653y49BbJ/QUqnMDjHjaYHafzqc6Db+ZH77mmuQaITBV1RojUNveyLpxYkPK9dSOOqd2PgiXXi2fJ47fViO8lrjii/6vazAYTSEUzFa70NlJ1i9PK+agYulB8s+h8MqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859929; c=relaxed/simple;
	bh=uPEa10RUZ/XLrSwr3txF55Qj+iEJvmEjuNcVPYvP7A4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=W/1ZPvXFo3S0ABnskiZGiktxXwb0AObYVWneIMZzIY3Kkb3CtW11d47cXOTviIVYtRxKUbHvNhlbEMRf/jCCraBv954J9JCHUkVTXU2ufdJpUxP/pieqj/9l1ZBOQJsmmqTIKLltwqLPdUDswPh3BmCyGnUCQh+jZAHj5Gh0wrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLNvu1tD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b61CcGOH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLNvu1tD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b61CcGOH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4QYGR4008353
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMBwZVcrgwfSqM1AFW0Gp5hq1IFjNkYD0/WkoDCtmSc=; b=aLNvu1tDibXSUFb+
	uwK8fIs1JvosGM+L+g2HT7pa0ze9lQJUsWYO0BSGf/3W/Zoj8gPej1QQf3tr7jFu
	TPEgks1OqDb/yZ2ICvA3g7bCapv7nOUZvwoX8MUZfwCMut2H6eaoCeXBNg7nG3H+
	w5zvE5iogZ8aG0+bSgHxGqbUj81i59eZgqDxuBMmwWz+haBlxRFZU0hFys9TgoAv
	LELpG6ICRD0R7/W7TeYuDQbiTVmngBLS05gUaJtddsgf3KiAGZlVtbsDyy3mtYcd
	BWrfCjyLM90Ll6WE5TnYwJfDr2sCtYWAMN2ojwfZvG+MLb5HkGaVYxJA4CGbRDmp
	mes+jQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm5pqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:38:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so109422661cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774859927; x=1775464727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EMBwZVcrgwfSqM1AFW0Gp5hq1IFjNkYD0/WkoDCtmSc=;
        b=b61CcGOHZRY+kTzN1kLa7vHw/Q0JTMN4qwUGIitz1UaFE52OHNz7xgapLdxmVajbsk
         Ie+NJOaginHthHoT6QWezGVXG0o8rA7OeFrjzfJPwplc3PyZ3OG+yLs8daHQQlRSbmMr
         hEUgT7GcPLYyU/y2rklV2JaeO9CGCXM9LSyo2Lcj3T0GEWcJdV7iNNHQJnI6w1v78fj/
         78i5K8GRjliQOy6r4UyU/KCc5jnWCpCWnkNAFdpeGYc5CbRFNtAPvrCXDSxejTwC+YEb
         f7pzYXsLtWYTUxlgpZEjNyFpUejoWQl7W8/jojO2uFSDdU1gbFCJZvMFO6Z9xx9x/21z
         Ymug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859927; x=1775464727;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMBwZVcrgwfSqM1AFW0Gp5hq1IFjNkYD0/WkoDCtmSc=;
        b=K/U7KUtXnnPh/QywqqcrUtbcDyhBrTTtY65MuOXiaw3/6lMYDDI/M2yyqaxIszZcWA
         qf80VIzBiWMVMSpryiE38Lly1iLuRb1HJn3RFlMh99xgC0F+2gcp0Nh/dwf/mOQiJC1L
         wPim47HWNuxltGJkNOaMblqXZq693Kb6xeO+voerlJFJyMUEJD2agKhE1VyAi3lIbakf
         3yunzL2uSRsBWO027bMU/wdry7dbsUZwV8qAZFqxHK3vw8qgFitiB2Hy5JBMg35FEecw
         V6hpBFnCRtGzzbgFhwBnXCL+EI8U5z803cQa1Lxfn8sz4XMfW6gMcszMHDPc5V/0I2g3
         m/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUINHwE3j31Dndho+35go5xJ+4mAEGKZQlJlAOLiXUgwsfn59/QQs7qedJ/SvHymc+Ysl+2CPgbAZTE@vger.kernel.org
X-Gm-Message-State: AOJu0YxtAVhYpKofxcrrXRNS72PqZ5sNpz+oRfeGAKbHz8gJyt6A81OH
	fQccp/3XtwVKP5EIXabVNCxQUBX3xrThS7vraWWpT/iecBTEkYMSAVqZ36vVAEoSLH2MJcZmdgL
	IEw44O7uytQQG6OAWp4wfpEn5Va+q1AO/1b14cr85fVNGFcDbVvCLMM50Kh7kzEto
X-Gm-Gg: ATEYQzyYi0IbDjVqyks8kUaf8uquPmI5ARglqNcXJ/Ddy+9M3a9+mNxo89Ya1KYllyu
	u3hxj5SzNIotXyQrboBH0ORKpnvMcB36KjpAECnc0FhEIDz0kJyY6/Ncbb9ZMyiEh2nYV/vtp8z
	iwLW/CCYpOgtRy64bjIQqM0nm36+bG13UAClHo7puGqVGKve0m73xUOtttkluvlc+Ck//zRx7MD
	UAzTU14+V/I/4xfNQGfZ3d5lMAYS3/6xUWLX+GxdjGe7tvd/tgwF9JMxQ+738sKLQS4SBsjN2XY
	X+fl5s2RWbdT4Z+Q0NO/EB+MCznCLFTPPp6VyrO74Llew908Xwqv3AIdHeWP3fjG4XMlkQ+Ao8n
	rdH6fOdVQNg1K2RTkmMgWGO1TcnlvkC1fBITn+ZjWtb2WIml0
X-Received: by 2002:ac8:7d4b:0:b0:4f0:131f:66fe with SMTP id d75a77b69052e-50ba397bc82mr156069401cf.59.1774859926784;
        Mon, 30 Mar 2026 01:38:46 -0700 (PDT)
X-Received: by 2002:ac8:7d4b:0:b0:4f0:131f:66fe with SMTP id d75a77b69052e-50ba397bc82mr156069231cf.59.1774859926386;
        Mon, 30 Mar 2026 01:38:46 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43cf245ebafsm15776586f8f.21.2026.03.30.01.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:38:45 -0700 (PDT)
Message-ID: <3419a58c-c099-4dda-a019-4900419aea9b@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 08:38:44 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
 <fe9bba47-13d8-4572-af8f-d4c0657f7195@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fe9bba47-13d8-4572-af8f-d4c0657f7195@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: n-sPf6j4ciVdAycvQR_HgI-Oo_fntioV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NyBTYWx0ZWRfXzhgn3FaQAQYT
 CrO9D0pBsQkclL/5BlXIxa5xeIMF/0lH5v0i0r0B5Iaoh5lOdT5FRNzn2HkYYYNFS65sT63Wrhx
 rMBt4sCyJHaL1+/F5j2JS03PP830tV0i3XpFWlErUwUHa7YeThS6FMw5IGmVQFn4bcsgP/m6q02
 X84o61GWx/OSjM6/Rov6286IzjfZALLybvFvs16nvCEwVxOPWKJyT+WHlGW2XlIhOPCPAmY1zc0
 csJargl5RLE6tpGHeaJFB5WGPJf2QSyFasfy4VeRWw1h8dhMVEMVWvpZofhwxIJ7T/yUWvI1d0W
 1SB2qD4Id+2RHqWTMeHZ2Tzbf+fnPSQgBLgxqEZCAAQrFwX9mrnP4ZRw6Wy0GzNkH90iORIDMnI
 slHgduFjKt34pNN6vxC0GNRCneDuCkvf2kTVX1X4Jp2WfI7nitYeMQ6FEm7aPCvUFRd8NpJzQU8
 yuIEgbrDmpkbGq19PXw==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69ca3697 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eL9--ZToyrh3d9sDi9wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: n-sPf6j4ciVdAycvQR_HgI-Oo_fntioV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300067

On 3/27/26 1:10 PM, Konrad Dybcio wrote:
> On 3/26/26 4:41 PM, Srinivas Kandagatla wrote:
>> For some reason we ended up adding only 4 out of 11 compute cb's for
>> CDSP, add the missing compute cb. This will also improve the end
>> user-experience by enabling running multiple AI usecases in parallel.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 10e799dd4a78..38fbd44c7d8f 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -7739,6 +7739,55 @@ compute-cb@4 {
>>  							 <&apps_smmu 0x1964 0x0400>;
>>  						dma-coherent;
>>  					};
>> +
>> +					compute-cb@5 {
>> +						compatible = "qcom,fastrpc-compute-cb";
>> +						reg = <5>;
>> +						iommus = <&apps_smmu 0x19c5 0x0400>;
> 
> I see that the other CBs have 2 iommu streams, the other one
> having "DMA" in the name - could you shed some light on that?

AFAIU, These DMA streams are relevant when NPU dma engine is in the
picture, examples can be data pipelines which involve transferring data
buffers(in/out) in-cordination with different IP blocks outside DSP. May
be something like camera/video streams directly to NPU without CPU
involving...

Personally I have not tested such usecases, but for upstream fastrpc
clients AFAIK only application streams matter as clients will explicitly
allocate the data buffers, even for sharing across ip-blocks.

--srini

> 
> Konrad

