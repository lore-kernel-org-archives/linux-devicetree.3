Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525D175A85
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713174; cv=none; b=Rae7ET4t2eGcKv/zSFkqq4WD5Epzuz3Xf16N31i3CHKT3V0Ex/9RBZVAAfw6nLPTQdYHmCRH9lv/jVyuUWF8L05aROQXRe32MVfzBlwvrtdrkRvKd+cPbx7PvTt42EVvE08iKr+SZmSfMCKnzeLhL4aceiidSGADliqiO1xdjWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713174; c=relaxed/simple;
	bh=fJMpHs2EwhmN48GNX6EEyLv37kcjVhTZEXjlmv56/xM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K+fkVlGSe9aSdjPO/Mffgkjxjr3rj8kQP96jh6Nc0c+BOfEzgS9DDnJdOh0b50Dd7xI6QQdqJal7F6cv739DSyDrqcXVT/PX3Exhm32XU05aHGbZB+EIFphkqEoo+Bj3+NkDpiH7NJyzHFHL9X5ILUhNsN4OUw7qaqdoALAxF0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xr8rb4c1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtmKK570; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xr8rb4c1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtmKK570"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7aKCu1871835
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBCPDixfoHRh6gGVlQsT4UlKdIWzU9rvYRNKn+zixbk=; b=Xr8rb4c1PFMaKPwx
	aVnNoy81tOrODJnIwOzgcaB4eVsj+sLf8ieFDUnol9HGfFhhTpdhNu7g9LyAcJ4A
	dTtrFNqucsSuFM6zawqZ5N7Poavd3IpMd5f2TrPa62dZXLmmLzHVgH4Y9F7Pc2AS
	mNkLnk0YImabg09WyjlKuXq2DRrDhvwqYazOJgsJJXzvqEPQBLmXUB6+zx3OFXHy
	IzCoO3d3ZOrzxkRxMoEny0a2ItttghPM60jCKRL8FKj6fmiH74qj0eGImXrGen9b
	e8aFLHkVNG4wiKEB8BgA/gbcbE0NcE9TW/VpmgmWCl/IzljpM/mN3yfrQgvz2Wy9
	1whWRg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0wuds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:46:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5756f9292c5so7125142e0c.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779713171; x=1780317971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VBCPDixfoHRh6gGVlQsT4UlKdIWzU9rvYRNKn+zixbk=;
        b=QtmKK570oyUAqON37Y8s/CCr5dgJHObyGfOQu7pvgiTlJtFzMSTluIjKbv2gvMFkxF
         0nLTAxcbiTSX5gTDJvQnlutcMBFK525/MUIlxBaD+57EEGrnbzgvt22+++kiOAJe+UJt
         hvpcsKuwOIV3cv469rBj5XXdbwYJFRQQpuDCqc/f1hS9NDeXtjVnbCfOD2tI/89ksx7r
         4MAzWBS7MlGmPsLQOFlPfDBBbMuql1KI+1C2Y+pdIqP6mRvKQtcJyShcWGjhoirs4mYf
         9kAhqNqaQjV0DABbeUZXTRQ/zEi6jcFFYRKbmCL9MjDWIO1VWnUhcSwqkNQjVjri0i/X
         6faA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713171; x=1780317971;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBCPDixfoHRh6gGVlQsT4UlKdIWzU9rvYRNKn+zixbk=;
        b=GNrElauYOMQFakudOwwhMLvH0KJ1vEZQaJZcFGTn650dSXZdmXLfbq+bibke25I/Zf
         86Pko1rR1zQWCcmBdrm/qPXOuko694ppTiU8cUCe4oftKwwZi0bbNO+j8qcCeaMjQre5
         gdIhNbxpXGSvGya2YmXcM8JVUmNFFjBpLu452eUr8dvg3BUskVwlDg+qOACymKrE/KjU
         vdlRJEI/Nfpx0KRbHck5JuUmhS2rNxVQ316iUxjz8Yl/DdrdyFQ8pdj0bbrQB7qJNdoJ
         wFDtIULWQ2u4AA+bDGCQV08x7s3S65G75fWeht614CAB7Wxx8p9ySIKgeVEb3ptDmm/6
         KMIA==
X-Forwarded-Encrypted: i=1; AFNElJ/e9unB0yQocydhmWuhV2HspUyU2ZKjxp5kuhtNHHF3Zvdw3S75I2YaX+hkzVFQ85nmzT5TK/DXrwiC@vger.kernel.org
X-Gm-Message-State: AOJu0YxvJXeyTywyZSF5OG+Hhz3pAKqDjvSLjzskRLSFd3k4rwzBmeLZ
	jKiWhCioNjYrqtVwJcFlEpLWDgHkI7Wz+uICdA8lBs+8kCYNNp9igfl4mET7ymkdIBAikrQ1mDF
	06bNc0UxIdx6FOIdKD/nwSWQj85X3ihrS4e1SfWZadTf8Ml311TItZUAypTOWvxyR
X-Gm-Gg: Acq92OGSKAGkW9nPi7hXlscUVVGE3tsa3/PylMrK+tIs/dgt7h9k3Y8L2qAZLJ2DQ9Q
	C2PF43zt2AunmEbb41mj7/xyl+mIlycLagX8N873fYVIbJSIR3+qrqomKwIo6L8qjUn7uVrtHVh
	EB0Fo6hq3NjewncUDqcy0e6Vab54D02F//7xcGjQCouIsFF/qRabJP2oO9y/oGRmEfTrxwU4O0b
	oUlJQbC6PFe6FG/D5PHc/ZadY08RIQy5PHypmmcGJidCkdRH6JlofOT1eLdwHg7S2Ak8rStknE3
	mc0XXvHEk6OuNTLSThEwc36kcFyeTqen6OZuqqNm++EbNS6HDwlYJeB07K9X9TCvsPKyJKg93Wk
	3DtkaqHyAWsIH0Wb8DZoKZifhCP2qA3YGlh5tYWWF3QnDzFqyKzdyjm8vsU/dccWQQpgTdKD5yf
	DB2igY0yBi0P6koqChoyKBm16O6vtXSqI1xSyMIgPd8phN5iFvLmFN43E1j+RK68xtuwR6hGmi/
	SsKUVYp0c6VJYbH
X-Received: by 2002:a05:6122:247:b0:577:501b:a668 with SMTP id 71dfb90a1353d-586616414f1mr6079904e0c.10.1779713171508;
        Mon, 25 May 2026 05:46:11 -0700 (PDT)
X-Received: by 2002:a05:6122:247:b0:577:501b:a668 with SMTP id 71dfb90a1353d-586616414f1mr6079868e0c.10.1779713171083;
        Mon, 25 May 2026 05:46:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f603desm3922656a12.12.2026.05.25.05.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:46:09 -0700 (PDT)
Message-ID: <7ebbddb0-175b-4023-91ee-93d23e5162ba@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:46:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
 <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
 <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vj0lS4cb3x0PHTRZ-xMgqbZRMQ2ojaaK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMSBTYWx0ZWRfX/SvjdJbS9ozV
 ALVBjZ/3/w24rdLVHWDiBvnalQa7foRXHgHZIyOEhjVYA1amGhw7sFRXAlU1CAgX55AJFiBMTfc
 saEv5L0lCVE8EngokA4rwXrGJ6fRsWLYLwyf6u8Ox3MY1+riBCrILtLQN9Mp8JdC/8snde3Alwb
 xEknDcT//QJ3q0s4OWSIkLrty0D4CwCFhfXrzFtnFgYt6PiND/uBhFZ0hUCnpfdHD6SwHWljjTj
 hucgXtwfSXC5gTYZRPYy9cfawEVZuuaWEfwNOdRIBTpJgAjOrbVGFz3xBafAgMuRoM+I33iJWk1
 cTIXTUjNbmilmf2NJ5S4+23zLXY+ZoyPSkL6pzXhS9M9q3xEeofxfngqc74iJ1fCw/Nf2kfbAgv
 Q0Sr63Jj8vm/KrZA29C8FvYInngzhex2HnSSXCRByWFvgien4LbXFZe2hlZAlXfw5+bJ6PmpCLT
 asm7OvZhHSwqNw0S/TA==
X-Proofpoint-GUID: vj0lS4cb3x0PHTRZ-xMgqbZRMQ2ojaaK
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a144494 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=kj36F7Rk1FwkeEXVhM8A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250131

Hi,

On 25-May-26 14:29, Konrad Dybcio wrote:
> On 5/25/26 1:47 PM, Hans de Goede wrote:
>> The EFI memtable (shown when booting with efi=debug) shows that the
>> xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:
>>
>> efi:   0x000082800000-0x0000829bffff [Reserved    |
>> efi:   0x0000829c0000-0x000083efffff [Conventional|
>>
>> This fix aligns the size with the EFI reported size and makes /proc/iomem
>> correctly show mem blocks matching the EFI memmap:
>>
>> 82800000-829bffff : reserved
>> 829c0000-83efffff : System RAM
>>
>> Instead of:
>>
>> 82800000-833fffff : reserved
>> 83400000-83efffff : System RAM
>>
>> before this change
>>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index de0f2346cb38..5a2e84365901 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
>>  		};
>>  
>>  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
>> -			reg = <0x0 0x82800000 0x0 0xc00000>;
>> +			reg = <0x0 0x82800000 0x0 0x1c0000>;
> 
> FWIW the reference memory map shows a contiguous block of:
> 
> 0x8280_0000 -> "no reclaim XBL scratch_buffer2"
> 0x829c_0000 -> "reclaimable XBL scratch_buffer"
> 0x83f0_0000-0x8400_0000 -> "no reclaim xbl scratch_buffer1"

Thanks, so the first part here 0x8280_0000 - 0x829c_0000
aligns with the EFI reservation and with the dts reservation
after my patch.

0x829c_0000 - 0x83f0_0000 being reclaimable matches with
both EFI + the dts (old and new with a different start)
having this as usable RAM.

The 0x83f0_0000-0x8400_0000 area seems to be marked as
reserved by neither EFI nor the current dts...

With the first part of the reference memory map aligning
with what EFI shows, I think this patch is correct.

I wonder if we should do anything about the 0x83f0_0000-0x8400_0000
range though ?

Regards,

Hans




> 
> Konrad

