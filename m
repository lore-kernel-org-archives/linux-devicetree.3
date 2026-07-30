Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425B23DBD53
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401408; cv=none; b=Ke4jkeQJMck+o18RLfPcvKqnph+kt8BP7IaCXjvK411eBmdHdnkhzKKkN6zbPNlOoWb//SCMUwcB1RyBeAqhZUEVwTq9+Gbp8pm+mrkeds3uWQCNHOAvZMphnVfZ+gXi4E2RA3dBXvCuaDVVg+iVV5n7e5zU/9VHsxtKSFa2uwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401408; c=relaxed/simple;
	bh=KaDtdh/E7r+tujGesviV9N6aAS2jtSVqVcD0C+In2V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvmjLHdlwzrdZRCWlXgfWjXiZWB4+fvVlhoQrwuoylITxzFwRoOTEkZx6yiSzJSC0w/cXAK2zpb4sTFeXfUGExsMHkuLGeh7/FH9/ZzeUkF5npmemva39CLKscQb3CujpUx1CwioeUtq1+eWgulCmLtOJi8yMac7z4eYOzQYT7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nu9KM29a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfxUnHdM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nu9KM29a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfxUnHdM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8dXnv228171
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uw49YpetKrgaWFryiL82iWK9AbxjAh2ZpnHqcIB29V4=; b=nu9KM29akF9MVIoJ
	Wyt7gxaq1I89g6swB3o5QQpifJ2BMdpuToJeOV1EBJ2gXO7/IkcZ0aufrLQYMToO
	i0M9IOCez6+uwqUGWEBmjnughxuHEHrkAD/aOxSne1mWSga0cbzMCLjxIzmwNTe6
	lobkEAnHA3Cpp7+DJMi20NagU5tLmqXq+To7U5FttVzQ401AqVnaG2ghDFCg573E
	kxpVV8s/sdh/55Rsx8YrslQ1ZRRzfPvlT4jGxYZAtKq2iGmipT8zbfCvcI1tlOwO
	dUYMp0hmvKdNdHBGeFcRg5KRhwkVPpcGI2gb+BWlLAb/WsQ1670RQiI9s1zo6DLk
	IY/mJA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3a081cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:50:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so38403965ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785401401; x=1786006201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uw49YpetKrgaWFryiL82iWK9AbxjAh2ZpnHqcIB29V4=;
        b=PfxUnHdM9ga7B0ZfV4QsoAzg0v6z109utbOUJCzoH8/9hKcK6Zyv57qiky/KFfs7VN
         g6lcW6vmebWmAKP6wDFS1Bhpb+gRkPFWWEFbmofFAUZCWAsj6x8JhwzSf3FCKpQoRJos
         sznsKyzYkK9lt9o+JcTEEq91X50teTrgbscq5iGki9mWYKnybaFpmT5KXqNDuxOi1v9r
         rKGAg1GwMjNFiVs72TQNrfE8agTHUHsyt/J4wCxjtln1am0ypPonEpt/1UTE1Rf3V6H/
         qq5rZpIWW6xnaW9yYFvhDZ2XjRM5zbI8ylkT7JRE87Mx4iFa7Xq5IhrbuyLyJLoJbjki
         dw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401401; x=1786006201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uw49YpetKrgaWFryiL82iWK9AbxjAh2ZpnHqcIB29V4=;
        b=GicI7rUy3DWKkVfRVGET9hzS73zWidALRNE7L1VSfoOJh9liBQeD4+W8qIKz5U/MiI
         NTPHxLIK3vy6nrohVVkDGanq2fBHyEsc37DXOOobgV3d4TKG4WXTseTrdF+okOpTSizQ
         CdHIKQcIHeF3JTQ4uSHL1R1UjPf/g+oxgI5u2V05ZhcLuMccR62nA4YAkP0frcbym2a3
         djuHvVE/+JK4dHMW7GVsxUZNwIfOZTzKyY2/uZsaMAccHc769xMh8OqRw9q6mc0ZJ4Td
         0KCFa8GkyKC1cndJHuF5VQTQOPO7TODP/OJcRFDB2OoEiViT7lqJmwRSLnZp+19EjrX+
         XbPw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/5OGdma+/zTpNJNGQhsBO/Hdh2SjRDtClQczP/VmuwFQKbDYczSMg9YcFsrP6xL4dSuLkZo9OFFRM@vger.kernel.org
X-Gm-Message-State: AOJu0YzhdupPM+OkIWg4q3oQpNs+jKc6aaTdutXJ4JmfkQL8tMV9TDT9
	yM2SMj0/hlV8GNJYagHYeaV1n9Q8lxxGTspVzMJre1KtEx1Dl/7AUlaNs+m240doQcXwe3JcYZe
	H41cDeygYigQH2WuuOGbtcar0gzucUWJRrisUpw3Ne7VFuC7sqYOAK9yO4q8GILMU
X-Gm-Gg: AR+sD11Abn1nUJ+JuO52sVj2GfWFHc3DGbDIJwHYp3juEgkvYHAsANhyOgLGGf2nnZ3
	s7y3G2lv+0FPoIJXh1TXWNy3Wb5nHGIoPGsJPoah/N0lSbiLycoMEegs/I2c5WGoDXSBm6R2rX3
	TyHuNc/KIvgvMTTpAbjkEZiwRZYRSqFX2s77oU+PoWvMKEMgipISphRdJ44lBA72Xt7QZ72uj0Q
	gpI9CctDN9lfSTIFvXamcbFJh0vzh57eXxIOUPAtoi03mF3Cr++zfwxYjzVt7t0LgAM5Kz0qOBw
	O1bmwU7nk+d8lq9jdFYvkloOOsss74PVC9jTHaXDdaLNplMGgL7HYoCch4vaCwT4wXWvw+Blaff
	fWVBzYbZhhlBe8MYg8Vm52soU7xE=
X-Received: by 2002:a17:902:cf03:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d035b8914cmr16875925ad.10.1785401400986;
        Thu, 30 Jul 2026 01:50:00 -0700 (PDT)
X-Received: by 2002:a17:902:cf03:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d035b8914cmr16875685ad.10.1785401400539;
        Thu, 30 Jul 2026 01:50:00 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc9bd4sm23039845ad.48.2026.07.30.01.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 01:50:00 -0700 (PDT)
Message-ID: <38bb5227-9be8-41d4-8211-9733d7f3cdba@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:19:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
 <20260723121516.2341900-2-ravi.hothi@oss.qualcomm.com>
 <0267f9d0-f2ab-4b54-9989-37902bd5b066@oss.qualcomm.com>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <0267f9d0-f2ab-4b54-9989-37902bd5b066@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2MyBTYWx0ZWRfX5egwvFKvDDsE
 5+LkfGRgFXiB3vivDx8Ew5/IyvkfPGwvvdiyL/+uNXcM42+84AbmaR59b1HTCUGu0x3b0jLx516
 xahqKRuZVB2Z0qnXCSI7Ha5qZMg1aYE7qooz1CkSpkOlSh0HyS57yz42u6ofvKs7A4Ow51SfC6N
 XjceklX/rjA9eZNxMCx01KWd8Ga+MMlTR3Ah1FPNIUOR+yIj3lRIwW4U8h2NGSf1nV0DVvXwXzs
 Mmlk4N3ZvXrVlLRUiKIkJ7GkYINiPnaYn9ruQcKnoikbZgf4DTzhoHLP546GglVhOvtoyLl3E2m
 s9rkT2+5pVFUb7mFy2xVg5IDacu/5AdiEEYfnUgFgfnJ6abvukyvMrK6KCq/LkrkIdqRHYhI44T
 +6YWLafDybnSXTExDKM6ZQJuVLa1dskL2qyTZgA5eaQbZiTwl4YE1s3A3RGzIytw2GXToYZ6Cew
 SFOW8vScHZfZzJv1tVg==
X-Proofpoint-GUID: S-RKCB1UsTjAtui3FKmHSXo0kiWP4ExB
X-Proofpoint-ORIG-GUID: S-RKCB1UsTjAtui3FKmHSXo0kiWP4ExB
X-Authority-Analysis: v=2.4 cv=EZT4hvmC c=1 sm=1 tr=0 ts=6a6b1039 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=22iYCxRe09wW5uo9xPUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2MyBTYWx0ZWRfX6qGiXLtIypds
 XddAyoq00LR1RNuczxk4ZcSABkT43ob872Lp3Z2vt4OrCEIsDKmCA4eghuoXvh76VFE5/SJAUC0
 v8hc2hE+PxJzjysWozHEoPR7vhu6NsA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300063



On 7/29/2026 3:05 PM, Konrad Dybcio wrote:
> On 7/23/26 2:15 PM, Ravi Hothi wrote:
>> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
>> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
>> defined inside the LPASS LPI pin controller node. The hardware is similar
>> to the SM8750 platform.
>>
>> The WSA macro, VA macro and SoundWire controller are kept disabled so
>> board DTS files can selectively enable and configure them.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		lpass_wsamacro: codec@6b00000 {
>> +			compatible = "qcom,eliza-lpass-wsa-macro",
>> +				     "qcom,sm8550-lpass-wsa-macro";
>> +			reg = <0x0 0x06b00000 0x0 0x1000>;
>> +
>> +			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK
>> +					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_MACRO_VOTE
>> +					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE
>> +					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&lpass_vamacro>;
>> +			clock-names = "mclk",
>> +				      "macro",
>> +				      "dcodec",
>> +				      "fsgen";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +
>> +			status = "disabled";
> 
> All macros (but not swr hosts) are usually enabled by default on other
> socs, let's do the same here

ACK, Will update in next version.

Thanks,
Ravi Hothi
> 
> Konrad

