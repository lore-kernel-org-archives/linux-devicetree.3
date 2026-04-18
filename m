Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3303C1F
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 01:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776475058; cv=none; b=s7IQhAOmMNiGxQYew3QB5zXwk8R3t9aE8iYaPzNGeYQLYM7afCDLff+xXkFRKhgFXP5SrTBKYn3yIaW3j4FWrABjnM4eJg5Wtv+uFD2hn5e5v5W34cTIj2x9nmRIA2T03PAPi1wRU5PyihIe5nADF73fJx+uUzszB2hiP5V4wts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776475058; c=relaxed/simple;
	bh=vrk+ZxD6f5SDsNJ1t+XmdCDFGlS3EoLtdGwPya8DYYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNfW/9Y/F/qAlrF7pVUxtRPffiDzsR/9fAtqeJXLHcoH5kFi3zSNBhKtUxtKt755WMj/++R1QQIVlukoYU+BgA+DQhzRt1HctR6pi84vK01kAdkiipoEn1QhvQbOvK9c8wQttvM/7PiBTUyeounN7QJ7yN0Vcq5Mure6NPRW3qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Th5b1BZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjnX8eiD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Th5b1BZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjnX8eiD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4SjL2945210
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 01:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSaK19+lqSQMB8BSrlpU+L7Q5JHSk5dmmbOrWGOZ0L4=; b=Th5b1BZ/+pSHHH6n
	YBgKCTuh4wt8/mSBgN6fW1kIKmkT9xEC2Del8WfrcY1WIWSNAHpzZdJznoAwzz4Z
	ZQOBFjZpX4JryRHnKX5rQYltTyDeWw9kdQ/5qMmdz5zBg/rQWDlNUHBq6rqzkc2t
	QO3mzRCzh3DFJLzzqQn9MadrvHsrZOWOXTIui+WqrV8qsqh3YAZ6g9utupF/HbwS
	qbNxgWr60QLu++BEfDa0Ntoom6IZC0miJKNPDgl16ohd6S5MGZtySS79A/F3HgNh
	SL3yjHafbuqzn6c5Xx7rbSXpY3LkY7meUhCFVwnw/6u+CW8n6LWwAvESfZhP85Dc
	GKG3pw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy3qym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 01:17:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76c6280732so1604880a12.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776475056; x=1777079856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSaK19+lqSQMB8BSrlpU+L7Q5JHSk5dmmbOrWGOZ0L4=;
        b=EjnX8eiDtW3qgC9wt//gDvLwa6RzGTnOXVNpEp/OZE/UKaDEomng4oXbxKUKU5kL1j
         Sq4IsESmbRbjzFiohquXgRU7JL01wJ3pUgKiiC4bEgbN71fNrhUmdPwzfKg78nVka1t4
         xNC54BvgKxMeDcSdmOwtOizGmQfcPhMuC/w0N3ZgO/WB8MFUcCO1J27M+PNRmtVy28ql
         O1gE6lRwtb8IfHZDUTJPYd01E201bPSZpVr9K5b+NlPyh7KRZE2783rFZ0nXZvJ2Hdiq
         7WkNN7VbnokQwzcGpSF1cKQNwcEcyymqLaMgsVTTrDHuJ2piOhMlJx5qx8hih3e9u4Uu
         +Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776475056; x=1777079856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSaK19+lqSQMB8BSrlpU+L7Q5JHSk5dmmbOrWGOZ0L4=;
        b=gjnss9hBSBt8LM/yKgk6EbpMdoZFO+wJNbjEgckuunSMeuGJcHB2moggl9pGa0I5QS
         /PL0o6xPfrLLQbWSFcchUdFlCYkSyxQ0ETjs8s5y6XtjCt4I8vHGKWzWaJg7i+nxJR/q
         stVIm044MIMfMwOp7ngtq+MB5IJe0gAmlA7d+AW83aboBJusRU95lqeYJOfr9xD9GDLF
         Z77RGOdiBub8TDDIfrFIerg8f+raPWUYou4iyNO0N89JUpiDP8GWVMNuNvnxSCtY6tx0
         fkduTaGb2U65ljoJJV7eeCqTXKTvrWJttpdMuHiHT3CWohnGN6DHy3CzNPbtt8K7BhtQ
         F+tw==
X-Forwarded-Encrypted: i=1; AFNElJ+iNex18bNwVam1PVZ7Thffz9RBgMOUBxsxNwETM0PxX3+3J4CAMHV+eUdlfTcCAVORPCz50wuFj+bC@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVEYo8L27+04RvXVqMVVsJQvzZW6Y/mP94Ix2hXEhZucu79Dd
	TwN55vfBYKVFMQbfTKUqaeC8cPbC8+f8J+F2WL0vRHOvseqGfjCItuD3zJXgP4Adw0QEjWFgJ+k
	p64yjrX5/3uC6xy7QZvmtfxhr8QFtoVfRQpJJgAw/kQiOKGF/ORyB7jZ1Pyp2Uhj6
X-Gm-Gg: AeBDietrmu/v1otMkSicR6Do33lqN/POk3AUC4wedPXHhV6DEnuCwwrjKTW4T9AEdwZ
	eQVuW9nQY2DYmPB/vtAP9Fsd3HbabiUSoNpGgCIwMiTTY0ozZwoMLHG/f5KIfvx8t2Px+tXc8xR
	+fodvqNa9IdAqtaelSwIwekmyRlV0AGrrcZtiT58P2Ry+7ElrEFyuyGDrd9RvTRb2sfgO5TJwB7
	f19+xFZ9aJM0HtjVDjGBbHlsXRJ+irCBVJRlNgiGlvvFH/gHAOMxCNQ9MVo+r6L3/QoaNRN/t28
	3WiSXaIVlE01evoEkWSFXigO2OLQO26DDEb57O4Kedisd5+2L/wpX/YDMAYcuUhO/E7NFsYi3Vj
	wxsWo0Ir/X+712a8uAGCPCUk2X3svF9IUDRflEYKwCsh6BUwQ1+mQaCkdhShluroH
X-Received: by 2002:a05:6a00:22cc:b0:82a:1044:3563 with SMTP id d2e1a72fcca58-82f8c902bcamr5776946b3a.23.1776475056108;
        Fri, 17 Apr 2026 18:17:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:22cc:b0:82a:1044:3563 with SMTP id d2e1a72fcca58-82f8c902bcamr5776910b3a.23.1776475055643;
        Fri, 17 Apr 2026 18:17:35 -0700 (PDT)
Received: from [192.168.1.10] ([122.179.227.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819e5sm3359151b3a.2.2026.04.17.18.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 18:17:35 -0700 (PDT)
Message-ID: <d9eb2350-6d51-4638-99b8-5afdbfd4928f@oss.qualcomm.com>
Date: Sat, 18 Apr 2026 06:47:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
 <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
 <760729E8-7CD2-45DE-B3FB-7A28611E5EF6@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <760729E8-7CD2-45DE-B3FB-7A28611E5EF6@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: unQMZofYZ-6U3f2D5yO9UlZrh3E92eXs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDAwOSBTYWx0ZWRfX8NTx4y9xFUWU
 951YAcKLinRyjOaq4i1rngvCRSInsH36KIPV4rJY08XrkviwXxr4jVuNWrTZ/vOI8oB1/TIwKdS
 NrwSQ+I1eadXA90Zwtch6Nc8xEw7Y9TlyWkefv6JqnupN3U2Ei5CxuvTo+mgHGnqJGOIG2UUyow
 YTDD765KOVsD495X8Ydoxxm+56XVpQzbzfotqyI0ehQxpvCHO4udbHd3TBRjfHxvcEuT8ceMT+5
 PoP1ta++mqkzonp497d7NtEOyfGoFfoNDsBVX2tsYvWCuMBq2oaZlmtv/PzdAxNdTWSFnrITO80
 l2N5XRK5tZpykNdbaifER7RlDemv4Hxq/bxuIFZc3ptGBVeDLOu2j3CEGO5eZ82h2UcoPeL0RqY
 ip5JgyHRg5rm4J9APlfegOYwhOayrppbp3V+tEopkaaM9TXmGL8a/e+mDKtkqga6b/5m4P0qUUy
 U8yUaG1IIb1W4oDIxXw==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e2dbb0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xJoAcIQ2wYp4krwY+vXiHQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Gv3PURsRAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=IaGPFpG_6dTtC4rlnaIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: unQMZofYZ-6U3f2D5yO9UlZrh3E92eXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180009

On 17-04-2026 23:06, Nickolay Goppen wrote:
> I'm assigning this region in the fourth patch
Okay, I see. Thanks for pointing it out.
> 
> 17 апреля 2026 г. 18:15:45 GMT+03:00, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com> wrote:
>> On 15-04-2026 15:22, Konrad Dybcio wrote:
>>> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>>>> Downstream [1] this region is marked as shared and reusable so
>>>> describe it that way.
>>>>
>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>>
>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>> ---
>>>
>>> +Ekansh some insight, please?
>>>
>>> We're giving away that memory via qcom_scm_assign_mem() anyway
>>> and I would assume that making it not-"no-map" could introduce issues
>>> when the OS tries to access that region
>>>
>> With the current version and the upcoming planned enhancements, I don't
>> see any major benefits of making this as not-"no-map".
>>
>> With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
>> entire memory-region to lpass VMIDs. and un-assign it only during
>> fastrpc_rpmsg_remove(). There have been implementation in downstream
>> where this memory is dumped in case of SSR or audio PDR using minidump,
>> so marking it `reusable` might make sense there, but that dump logic is
>> not added upstream.
>>
>> Upon checking the DT, I see a bigger problem here, this memory-region
>> looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
>> Please correct me if I am wrong about this point.
>>
>> [1]
>> https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500
>>
>> //Ekansh
>>> Konrad
>>>
>>>
>>>>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> index 4b47efdb57b2..13094b5e9339 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>>>>  		};
>>>>  
>>>>  		adsp_mem: adsp-region@f6000000 {
>>>> +			compatible = "shared-dma-pool";
>>>>  			reg = <0x0 0xf6000000 0x0 0x800000>;
>>>> -			no-map;
>>>> +			reusable;
>>>>  		};
>>>>  
>>>>  		qseecom_mem: qseecom-region@f6800000 {
>>>>
> 
> Best regards
> Nickolay

