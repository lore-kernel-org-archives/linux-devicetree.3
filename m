Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60B39D6E6
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334752; cv=none; b=cZly4JdTAkLfQ0wxER8tWXOnyW1FK3cb/9PLoIYvX3ScebRN05PaQaH2sxBZTIwMr7tBXTrsXEI7gYHXxO7usaTK4QG5yEqg9zejWTRwteOR002o9P2MZQZ2/JVSSq2jn4spsHm5VYJ6pQWeQdOgJ95kdCmyFNZ+juYpedmxT0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334752; c=relaxed/simple;
	bh=c4VwJZZHiqwxKGTlSxAgPZPW7B67LXDA2lbH5JvoZQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nz5S6bi7GqV4A2kuRKpjGdl7841PRiv9aoGjj9b+yL1mcKqmWlpEkcvWn1qbnGbAH39yYsuAR6P4VPOK56Foxu7y4iGW6B6NcLWkHUMDA7smDLUGxecvDX5djjxHnkjQrYdspVJxDjiedfd0TfbUYRQx1XGuI3I+2xjE9Doa+70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pkJEoBWA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmtVliuU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pkJEoBWA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmtVliuU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G90WxL2979221
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USAa8uvL+7TxJfOHDwWP43QFuij6Xcb+8SFcS6Gw118=; b=pkJEoBWARd3zf4Xi
	OuK3RNT0dnzJWi2v/O4rs2nVilwtdaJ1Kho4r9FymB9V6bBRLmOblMYYJ3AQ3VDp
	vdNDHLNGVlrScdLvJmIt26TOIDtk5Rdd2e1KGETxxzBhT4UGqPjt8JSWiT8ai/Ft
	Zsxq7DU2NfH1lj/7FgU2D1FnvQwsI3B9Z6CKAHY+lbpMxIm9cGoKKWhS+HkrFLS/
	OeGokXDa2xy5+4YGHrdQiI1r6aiaZhhf0Y4pbdFxvLDoXiK8wEhavbTX/7gpyTaQ
	mHEPGDldrPDQub6bhdsc2VpWUE9XBIbcOuNygBieUckV8fBPYuwIzZciv+SXoYDf
	5xbbiQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvru89m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:19:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89f59c9bd28so17816366d6.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 03:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776334749; x=1776939549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USAa8uvL+7TxJfOHDwWP43QFuij6Xcb+8SFcS6Gw118=;
        b=NmtVliuUntsO4b3+/YNH/PG7tuQAQ31/egpbLBc3a9oVlvOQxlLlEdeGLEojXDlAd4
         m5tbTA9g7E/AKmAJpTuuiK0Ioskd7CS4IkQd286voazLftJ/lP7+JR6QPk5O4n72qfZF
         glvmrdpMv9sY+8XMM1sFNG+4TaShGeTamTwMI1hML4pIzK+kHL6IEeZ7pdeBODHhTBLd
         49s50Q+nQgcVgW2POzH5p3xUpdF0FHpUTcm4IshzG3MgRNtp2tFTlJFrLGmusnrpsSTS
         2/18Ounopdbgk74YGh41oxEbDeuQPFgtyiYAPil1llBjPW6MRl2wMWXw2SX/xPITMWkq
         JNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334749; x=1776939549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USAa8uvL+7TxJfOHDwWP43QFuij6Xcb+8SFcS6Gw118=;
        b=lcVCD0IDpWrLRqy+eMeE+dLP80A3Lb9EJp5c5cXEZEfDlv1XBPWCyAmakUZzmwUmMl
         rcskJvJcC/wFgl4O1dXW2hO4wCKq9lVzw5d6Xz2iFfAHz8vvKPOJaGpfOsh0zVc8kreJ
         1yvE5C7o04xfLKVPrMx+CkzkcMgGinQo31Sr0ufC6QyVq4x91pIM+50wV0X028bg8rOS
         rZH2eBZiA8emdIX0vXxiJLUxiTKt+XcoGbi0QY4BbMJQS15RyufTJXUUUYN5k/h34TwN
         BWm0N2XRhLYe6Ir/mQEMe5H6UVKEQMIJPYNpds85rD1s07MaOZlphlkhjDslRzmLVy/l
         IvRQ==
X-Gm-Message-State: AOJu0YygsytuW44WYMem8mS2dskbC2MNtYrMXolAvkdfUi0zatONadU+
	W0HZD9+w9pmXZdo8FvTgmM7+OnJC3/GXdbXEAkzBr+W88twrFt3hQMF2oMnQZaprDefRUerCCdJ
	Fa+5okSpTae1nLfqBWz0X+QJl0/p/lCLCJZF+doDv13CprnWkH/Lz/WrJ3NYYx3R4
X-Gm-Gg: AeBDievJZzQWCE8AqNDQ8s+M0YMrvxJjI2TlFbP8hz7JGNIWciHGD6KpMDoFNnzn9Zf
	7Dgvy/I+DJQAEW6LVbuqSsBYE46sPs4UvAQCxYdJDIIfwVuZ37HIla3yyK87G0HW38KHSzTv4ZX
	1MbMWK4739VQx3XG4BJ8+hEoZHv/zUKN9M85JoP2vj+/xF8FNkwWfMWPzPWWxlJdc1BW1SO53jX
	5+xb5R3MD7WwIGkkXNZuWc5nu8d9ngdzle1ynpCROg39pj1leVD1FC8Is9e9szxvF4+aCKMwCad
	YQXYENe69126eiXL2G4b00LZPsFyPPFm/K9QgepgLkYZ5frXQtcHnRJOgJGKo5bFXGwe/1A7lg1
	NuD9X0RddTJxISM+cW9hwDa4IlcR5uf9WpdxOEKZqTHUYOlQNRD7CqG1U5sFC2Q37ZkbnvLeHo/
	bs8hcCclSGliT4OQ==
X-Received: by 2002:ad4:5c81:0:b0:89c:c7ee:fe96 with SMTP id 6a1803df08f44-8af6b781bb4mr19991236d6.8.1776334749411;
        Thu, 16 Apr 2026 03:19:09 -0700 (PDT)
X-Received: by 2002:ad4:5c81:0:b0:89c:c7ee:fe96 with SMTP id 6a1803df08f44-8af6b781bb4mr19991016d6.8.1776334749019;
        Thu, 16 Apr 2026 03:19:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba334539fc7sm27136866b.11.2026.04.16.03.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:19:08 -0700 (PDT)
Message-ID: <098ad1e8-1ad3-458e-93dd-859457cc58c9@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 12:19:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add IMEM node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me>
 <20260416-eliza-imem-v2-3-fb7a71123451@pm.me>
 <9592f205-7467-462b-874e-7fc599e5277a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9592f205-7467-462b-874e-7fc599e5277a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5NyBTYWx0ZWRfX6pzVNIzTZ1tZ
 JkRGosHbHgBcHu0kYg8vy9ljPm5z/6GC6eZOA9H9NFIyZh2nTAHRmLn59JtcPYGUfUrMQrF5WAm
 6XfEFiX8rTVmTkfn2k+J016gPckl1E+/PvGPsJ5nMh2JuUIA/VnelYTtjeNRcAmLsLZsvVeJ7yY
 9o/IWX1yiidQFuhFgk9cTbXiVE01ImhetY1wtfnwaGi6RM34LAf1yGAOnzIXCQ9eZ+Di/4TUv4r
 gsfR5FZ15L5WRAoioZ76R4fDOyC7krYqEf81/iVRxhIwxNCYILAvheFplNVBt6HSfjacGPcQLvQ
 i5x68Ql4bKnXO1Ztmu+53ZP3vOsfp204xqpc5Sq+z4cDBVQlu5iobT7XeFmdRSBqKdI+5iB/sge
 J7BKP3kGvT1qDRfWeSRykS7xiThHwuQZGcJe5729AqCs8kIxhn7CVRH5nbVIsPhGX8cPVf2wSiq
 QLvnJVidAMgXAkTaPkQ==
X-Proofpoint-GUID: DJalx0guGFwXb-we_Fm3kikeqZRLWXGI
X-Proofpoint-ORIG-GUID: DJalx0guGFwXb-we_Fm3kikeqZRLWXGI
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e0b79e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=44A4ohInunnxtq6OaqkA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160097

On 4/16/26 12:09 PM, Krzysztof Kozlowski wrote:
> On 16/04/2026 11:40, Alexander Koskovich wrote:
>> Add a node for the IMEM found on Eliza, which contains pil-reloc-info
>> and the modem tables for IPA, among others.
>>
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index 6fa5679c1a62..551df07e44c6 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> @@ -1029,6 +1029,26 @@ qup_uart14_default: qup-uart14-default-state {
>>  			};
>>  		};
>>  
>> +		sram@14680000 {
>> +			compatible = "qcom,eliza-imem", "mmio-sram";
>> +			reg = <0x0 0x14680000 0x0 0x2c000>;
>> +			ranges = <0x0 0x0 0x14680000 0x2c000>;
>> +
>> +			no-memory-wc;
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			pilreloc-sram@94c {
>> +				compatible = "qcom,pil-reloc-info";
>> +				reg = <0x94c 0xc8>;
>> +			};
>> +
>> +			ipa_modem_tables: modem-tables-sram@3000 {
>> +				reg = <0x3000 0x2000>;
> 
> I don't think these two should be in the main SoC DTSI. The non-modem
> version obviously does not have modem-tables.

That's not quite right, IMEM is partitioned to have it either way, even
if it stays unused. You'll notice this slice is there even on platforms
that were designed with no modem in any SKU

Konrad
