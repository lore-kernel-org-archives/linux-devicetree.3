Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F349E3CB8FC
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787119458; cv=none; b=MA9Y0xMCRSJ1M9+HfwvVBlHu55WBi9ndBaezoI7fMJlRm6lcx7ynRotDK7YBQGmcAQuhWsaUCIQKizwB/hOpyvC16nO9AYK6Nvdim94Za9j0azfOYKEn94D+ReyyO9RspR6CjCb4bQxSnbM/bpqqANBBPHK7f3KTxl2LYaTsbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787119458; c=relaxed/simple;
	bh=IR/31YtnigtYs7bcMXgDQAxFO0EktcOTHWIkWRKXzeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lsn4xUwSynKCgre0A8Yv8lIWB+AL/nMiR8wFr24luXLwQGGBDbxKcdNokinCY+vFuBAyQLOJC9mASDWtaTgmP+QsVrXD54Xtw65q/lGtDgsBVz3rnwwDO/8lj42vNEpiftK10ARaojk6Fz3hE3QzH7BOBozONEyK8Eiyp1Cu4WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjj+ivny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxPN3HIe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjj+ivny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxPN3HIe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I3AH3839459
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfGcfanrAxASsFeDEYf+aPFdYJTratLZBBEPs/Mgycc=; b=kjj+ivnymqNL65sf
	RVle+RVZEaImguCo4sYIrn97MCUdYmWtYxYg+li1dok/FT4iHmRWdHoJ7tQdphAc
	ccyb5+bUAQ2V8rG8PjMGBRsiy6/ddRqBkONEL50aKZL3hnZVZ2LrqjsFBf6t6420
	io4E0BSJTyyehd3o5sYLASnT+OajixCYyBOXggXUk6CvSh9DDThgzFj4maMjaESl
	swRLilYw4vbckSa8E0dTJ5oVlWQmVX4AeOwJesRfsESIcC67/mNuQNvF6nF2ZZEn
	0UxqAcxPyj4uv3frjZ6MsWrMRFIEIFbfDfvh9eNzSzJDjAe1XYv8lCgGIGSVB25a
	0HFlHw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm9kdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:04:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1693534a91.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 23:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787119455; x=1787724255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfGcfanrAxASsFeDEYf+aPFdYJTratLZBBEPs/Mgycc=;
        b=bxPN3HIeAdiWnyjShpPUmxHs6KHlL6Y6zfTAlk07m3Rddf37wox1vib/Q5qYK7LdNu
         5M795062kGOY8PKnffc5pKmFX/BGNji8XO377eIV+PqQ4VehDW5v01rWIfzA0by3aPza
         OCVnFJfboe2iD6q/6PqCweC+paqFcc4FcKYApOIs8pkX3+iEsZhJ94s29MsXrtG/m/g5
         h0OXW+VvwsCdL0+bzuLeSeDq6F9dJWc8RBqLaSJY6i30nAKO2FMsDfvkge9bme7IMmk3
         Q0GOwhTgHTX4zt3wzhGky9NKpM/bpfltw/gaP1j2826uvDcwD9ENO50HagkC3utu8dYL
         Nung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787119455; x=1787724255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfGcfanrAxASsFeDEYf+aPFdYJTratLZBBEPs/Mgycc=;
        b=Q/gjxkWnFA8Fd/k7g9Ur+S+D4Rm0z13gLIN0ifG+N6tUsAqUmuxwuYE+Pu24pB7xNK
         /Oi+WtC9GaFTAzEZ1H5yUOnRALTzgeRv28Fm+ESbfw5INrTMmv2dfXM25h4WF7yTl1+r
         jjgPeCKvLEk4OP34MnaqPRq0A1QUbnqJOTfMn1GMC8auMTKCAV2ydlRw6/Z+i2WrvAXM
         li8yisLi3pE2xFukpOO9aPxK4iDvT9fVoYdMsI3w7XvQlnXtD3gqWB7290UO8Jop6hjq
         uFsrrmtAYPityBP3h2hxR2KXHLjFjLeaCAyErOHM/hBdyPw0kwJxm2s6I7AAp52lAb4R
         fS7A==
X-Forwarded-Encrypted: i=1; AHgh+RrH3pOc3BLygTFn8q4jHySWQ27dOkRsD0JugFBweaeWNS4Mwo0HFzho51IirMgSbbqmcWbtn4HI02Wx@vger.kernel.org
X-Gm-Message-State: AOJu0YxfVJ7iw8yTu8CJwTYov0EsBV40mD7UKKpEG64SZ5WXJy5XirCk
	CSSkSezJdgz19bqCynQv5nkIT/1q24TRGslzqu4ijZOYvZpCDwbOYBOvEtZYI1K7r0hm7nQY37S
	h4t3zV9mfOiJjD+Io/m0fTIqn5GEOukK6ZJQMKe1WkoRKJX94Ie/+iBUGoyoWh2Sa
X-Gm-Gg: AR+sD12gcaV4XoN4P2lWgZf8jtY5m5Dn+NTD+O1sShlcbM+P0GfTPHQox72Uaf/d9k3
	DZxUGts3BgND1q9qbjTx5p0m4gfQcGHLVNoiz+B4veN+YvLBtRTzdsY7rbU/eiL3FXxK6lKr0tU
	6Usi4x46C2np9nRwUA3aKOCkFTdk9VudS6DCT++1Y/x9g6oLwi/sQLj+U1xF/t5QRqxbRrfz64a
	disJlnwDLERhR8ZDqadBzmB27gMZ7xevhxnFkBCQ2J+H7PmZR3DuHcyhB8TnYCxbH7HlJ2XbmkR
	btJMiUPm02rddG4H4SqNvUK5aDHJzIn9LODsBjUMlVFc2vJlABPMxZCW3bvXvOhyp01gsjJnoAn
	1mv8EVngNl3dbFr5n01190XiJT+DagZaqgkI=
X-Received: by 2002:a17:90b:510a:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-395810df1b5mr4732625a91.17.1787119454737;
        Tue, 18 Aug 2026 23:04:14 -0700 (PDT)
X-Received: by 2002:a17:90b:510a:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-395810df1b5mr4732553a91.17.1787119454332;
        Tue, 18 Aug 2026 23:04:14 -0700 (PDT)
Received: from [192.168.0.104] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96cd4asm1431789a91.3.2026.08.18.23.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 23:04:13 -0700 (PDT)
Message-ID: <ede4e5c9-595a-4412-9b20-16b99f337537@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:34:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
 <0b5a7518-ebb8-4e3a-b6db-c053c2edaa42@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <0b5a7518-ebb8-4e3a-b6db-c053c2edaa42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DLpV5DKeQXQoBWAWJ3IEJJe8f5__mFaf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MyBTYWx0ZWRfX3vTO+ljCZRIS
 K/RsvtszUDcj1zCTS67fHM3Jp/TM4ZziwH/6QbCOfzfP+gzgiijrBCxrBjeZcBdnm1EJjUjlyfE
 a7TZQ09NaY20LyFvtqaaaKeiOj8Jt0A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MyBTYWx0ZWRfXwVr4GaY9gsjE
 3clUBus9SGiq/Wng7fN0ZmX/RuOD6yNhDusUCNCKdlvmD0YN6Bb50M2Y5dWvcYuQVobzOpdAI2o
 CaQBCtT4ugxJvd/sQHs+AufS01YDELbFIGhN3WzKUJADrANq6lhZlM5I+guqJBBOYctSJ1Rh0oD
 SHx+pABfOnVbV6WJXL2/j0HmMhda42rhnYwih1dzLc1LSmLlPjZTGVvOEIrqVSNzJSynUayCxvV
 Yq1lbMSP3luG4JtCMsOs0OcFljJZg97YXDsiUP8/ODZKKqrFGpGkW9ccMLbBaNizjiT1OTXBwXw
 2JPX/+Ea/FLn7Uad7Hukm8k3ug7gYbcMRtGV7jmQ0hEshI5ia5mgXE9HURFowAW1uXDrTCYwyGG
 m1UhvRTGq6bjtaUCVG4XYZ+JwMrKggg6Pss9Eg0wQ8PSU18qddQpzRRek8NOcS4cAocULZ11b5D
 eVefY/ctiylflCdbZwA==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85475f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3TlOhtAxTlW9CNtfbbYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DLpV5DKeQXQoBWAWJ3IEJJe8f5__mFaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190043


On 8/19/2026 11:20 AM, Jingyi Wang wrote:
>
>
> On 8/19/2026 1:42 PM, Prasad Kumpatla wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> Add the qcom,maili SoC compatible string to the QCOM SoC bindings.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>
> your SOB is missing

Ack, will update in v2.

Thanks,
Prasad

>
> Thanks,
> Jingyi
>
>> Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml 
>> b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ff8a35df7862..00d9a493fe76 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -175,6 +175,9 @@ properties:
>>                 - qcom,kaanapali-qrd
>>             - const: qcom,kaanapali
>>   +      - items:
>> +          - const: qcom,maili
>> +
>>         - items:
>>             - enum:
>>                 - qcom,mahua-crd
>
