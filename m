Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85636F8EF
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893873; cv=none; b=ESyZvPDdMwkBk6ARCqsCEFgAKJ/q4WNFRgOJBS2L7Q3pJm1BfCF43biry/+OHCxjuwqomgk0tJIWlf71IMycIxmi5RoTBkCiHa2UVOItFSnMwTmnLHMschCNu7B0ODb1ER2U0/pcKFgGCZuoU1QcMSOa2albUT6BzFSrFWRmcRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893873; c=relaxed/simple;
	bh=b+J7ExI+T1gKi6yca0Wgdr+FLAEZZWJM0tjQt5dctBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phi/Of+knUp9EspxBKPD/hV1fuUmI3fhyuJ7tmMMKQozqI8tRKLgCUyifbhnx1uEeeqjp5d9D6vEFq+CNFyUdLmo979cnUY24HQs/GRNvoN4RNYU+HZGQ3ViyoXhOferWaAjDBj4jb/jhq84FH+mHwBchw5iIlrFBXHd1lqHkwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cekm72yf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=To+Q2iSf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cekm72yf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="To+Q2iSf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADwB72889386
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FIPh3UUxAks2ZSCKEmePYQA9JiJ5/cC1q/MXli74DVs=; b=cekm72yfsQsDmzxZ
	0qDDW9SPgXcTX0Kdp3TpLUW7rvdccvCkyIQVUlZH2ybxB3/gKZ1dQ7vcfyTCiHCn
	01q2wQia2O0A8lLIpFImiu6CPBjjK/WdNVyEZTQM8E6W93lj6qgLSE38Ep3mprpV
	GUbcuAhUmA2eB9aZvlj74cfmWwMWFPIwKxJak1wj/4NE+a4Ryy8Gva8JNHVyxEhv
	6YVEyEY2sLRNgiPDc6rIzOnze0vEqmOg/k9ma4CgWtCXXl6wZicvwiUG1pszk+9n
	zfi1aDOTWzB9Ydn7qhUxbW2vCqcY6MEBL6er/Q8a7Jgx+Don7fgv/n9vBVxiv2Q9
	+xfhBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm61kgc6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:51:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so376258a91.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784893870; x=1785498670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIPh3UUxAks2ZSCKEmePYQA9JiJ5/cC1q/MXli74DVs=;
        b=To+Q2iSfXAmhbo8mYe0yYbNSovgwEh4hT8cEMOLn6ACNsrBryStk0n7axuPTm5GXzI
         vV4yVJx+qs69EdPSozs9kmkFjPCKU+K/emm4bz/w9xGfuAPDRbX4zpIyZIYaMltlnets
         D0GmwMdSLCcdrGYhdG3+/HdydMuZbsH5ZQVjCXRehgNbQEsLXwWmLaEcEAaye3F0iIua
         sOO4EldJGsGsQGcbNJRY5BUkRlt235IKXuvujPO3v6Xy9/qMjoS0WHh8tvF46IOIJYWm
         neAgB2SVMfwK6nAFOgIYfL2MdlCM+w1j1WQYUGLFVsYiVeOl1pqCn4T/zd48f063reCu
         v2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784893870; x=1785498670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIPh3UUxAks2ZSCKEmePYQA9JiJ5/cC1q/MXli74DVs=;
        b=YcWgZUmnNf7J8b8ALZ8AMxgtZ1gId69yAORHZPeZ8UOup6W2MWh1twHU9Ko9fjMU6x
         1rVyDbfOny2WGWvVVc0lRWA8nPh8G2VYR9zfGgK/e8p+OnGuNP7vGTF7sAoKdnyLZSO+
         vB4eZFCQH6VhPt6dKiFEUTpC296LqslSdLqFmqOcyTsh9YJ4ih4ZubVbE2bCqkXOGqaR
         7e8QnvsT5aBG9ROYeMQH/kbTwNOWsIuD0IwrQNLrnYlfBbqVwCwpxB+O45nkUPYWXM7i
         pwN7nTWE8MglT0MxOT8vkYSW+LLu7n5FjLNdoylabMaetuavTo81iiHzTYoS9QyfC8zk
         CC8A==
X-Forwarded-Encrypted: i=1; AHgh+RqVIIT2o90HTIdTLSyFCfVSwivQ1J8dP44ROrJpRxXsoFr3dhgrBy4EZJJVZuz0p1Bgl9y7KGoSnkKB@vger.kernel.org
X-Gm-Message-State: AOJu0YzaMepFSpjcbGhgwdydqEuUG4saxooBtgsYMXkPB3qWLZ7SrD6E
	DRbsusQ6CjW3x8VSWwVL7bIJkXZvw4lbQQfNsJBDTcTy48qc9uLjMZQzG/5ZoxGaQQoaPXz7vjt
	d5dwiFMMKEXdyVJSsDnpNjtFF6vlzeuz6j9PsPbs/iDmihhePwSnipy2OWKM43KDJ
X-Gm-Gg: AR+sD13IGUKjs4WW52iqSbspPD1KwIaw4uKBK7oneF7hVIfe6ulLOtxYmlTHZ23iNWj
	BCGGCJZpfTLUd5V6NmIsjXiM/UjqXnZCNBPgkY8+vrBw2LZmjGsPAmEAOKSjIQEYMRGSWmKkEv2
	yVs18hiGxpKPVgnxyjXWPdxgcXWH9KNjgCZOC5w4WOhREw7XVIsU2eBRRlkvjL5ZMLPk2cR9p+d
	6yIY6K3bhebetvgQBy4E4zLXXOY2nZVEXvlnpw/KA901bR8sm/Qh60+N9rr9YimzQqzryUvERfL
	fPoEIhiyiUJ1suTwjmRXJY209PAhlssylx0AiGVK5gJCpT84APj/0hN7XkDgAIMF8psA8xdN2Af
	fuRMQHFXDcVWqvIFZf//evx1iLaxDXQJUTo/yaINalqEawnMccQCPFXK9iWPHz5ZFu3fTiF2UR5
	RrKcQ40IHIDcGSkvM1e/1P1+45Snk=
X-Received: by 2002:a17:90a:d885:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-38f1efd68admr228751a91.14.1784893869620;
        Fri, 24 Jul 2026 04:51:09 -0700 (PDT)
X-Received: by 2002:a17:90a:d885:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-38f1efd68admr228726a91.14.1784893869173;
        Fri, 24 Jul 2026 04:51:09 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm43133232c88.2.2026.07.24.04.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:51:08 -0700 (PDT)
Message-ID: <76f9afa3-8836-456e-a9f7-76bc65187ec2@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:21:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
 <20260722-b4-kalambo-crd-v2-2-32d4addc1ac9@oss.qualcomm.com>
 <4afe6c0f-23e6-4081-84ac-67d43ced6aed@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <4afe6c0f-23e6-4081-84ac-67d43ced6aed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ayiMS8SOU5IMbfariO-UCURtUInEBvw_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNyBTYWx0ZWRfXyHjU2cIA6hEi
 IepkFQAZqlw7QwvrIZxeTOJFSebvit6E471YI3rAYcGux2d5PqmkATIW4Qv08t+xKfDPkRL7fA6
 dSaZxoFaO7qsodDmHFIJWOecyK695Nj8roDEILeIjgcvzEB1hpDdbSKudp1HvmqBagv0QFHFYuW
 LOZuPp9yt6IsvVTC5FVPPUZxe49Pb0akFVm0xuiflH3E4cJufjuhCHTWnO0b5K0NCZEx2YoFXGk
 wHTYeNFqTKOgugc8DxLuXM0cQo9lDlaadwQc6hbJYmi5CBmq/iUmLWlqwRruTuM/P6pRmscAmi3
 VxigBupgzT98KU4ULKKOQ1ruvAwCJ/u4YG2yibkCGfDDkZm1eJrL/SDkXgl6MWNPBzk3Nz7rriV
 P70P2CQsJiH9UNkTj32fvVI2qN1idV8d+A3bpI7F8/rptPbnLLjwbpN8QJ8qLRXNbJ6Z1ebfy5s
 qiOU8v3sqFHT0WeTLvQ==
X-Proofpoint-ORIG-GUID: ayiMS8SOU5IMbfariO-UCURtUInEBvw_
X-Authority-Analysis: v=2.4 cv=JLcLdcKb c=1 sm=1 tr=0 ts=6a6351ae cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6NkYwzYD3Cn8KXPhvH8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNyBTYWx0ZWRfXxiGgqm4krJRt
 KClsHLnYxF9kQ4C8x4zArAU/ua3hRegPt2pOmwCmEAhmM7luS/kadza9CsicuWrjqO9riFb+1BC
 FZyfOrKoHiWlLH/V5vUUHkGmRqf1FRc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240107



On 7/23/2026 5:59 PM, Konrad Dybcio wrote:
> On 7/22/26 12:55 PM, Gopikrishna Garmidi wrote:
>> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
>> with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).
>>
>>   - The surviving cluster is re-added to the cpu-map as cluster0, since the
>>     kernel's cpu-map cluster scan stops at the first missing "clusterN"
>>     index.
>>
>>   - cpu6-cpu11 are reassigned to SCMI performance domain 0, as domain 1
>>     (the former cluster 0) is no longer present.
>>
>>   - Point the SCMI transport at the SRAM and mailbox addresses used by
>>     the Kalambo SCP firmware, which differ from those inherited from
>>     Glymur.
>>
>> Add labels to the Glymur cpu-map and its cluster nodes to allow their
>> removal and override on derived SoCs.
>>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -274,8 +274,8 @@ cpu17: cpu@20500 {
>>   			#cooling-cells = <2>;
>>   		};
>>   
>> -		cpu-map {
>> -			cluster0 {
>> +		cpu_map: cpu-map {
>> +			cpu_map_cluster0: cluster0 {
>>   				core0 {
>>   					cpu = <&cpu0>;
>>   				};
>> @@ -301,7 +301,7 @@ core5 {
>>   				};
>>   			};
>>   
>> -			cluster1 {
>> +			cpu_map_cluster1: cluster1 {
> 
> The deletes are recursive, so if you just delete the whole map,
> you don't need to delete the children (and can drop the labels)
> 
> You can then add a label to /cpus and reference it, redefining the
> map in kalambo.dtsi
> 
> [...]
> 

ACK, will drop child labels and do a full cpu-map delete + override in 
kalambo.dtsi.

>> +&imem {
>> +	reg = <0x0 0x81e08600 0x0 0x380>;
>> +	ranges = <0x0 0x0 0x81e08600 0x380>;
> 
> Is the size *actually* different between the SoCs?
>

Yes. Kalambo uses PDP1, its tx shmem (lpri1) sits at offset 0x200
vs 0x180 on Glymur (PDP0). That 0x80 shift pushes the tx region end
to 0x380, requiring the imem size override. Increasing Glymur's size
would cause a crash, so this stays as a Kalambo-only override.

>> +	cpu_scp_lpri1: scp-sram-section@200 {
>> +		compatible = "arm,scmi-shmem";
>> +		reg = <0x200 0x180>;
>> +	};
> 
> With this shifted, is cpu_scp_lpri0 still at the same base?
> 

Yes, lpri0 (rx) is shared and stays at offset 0x0. Only lpri1 (tx)
shifts.

>> +};
>> +
>> +&pdp0_mbox {
>> +	reg = <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;
> 
> Please keep one entry per line and use '0x0' instead of '0'

ACK, will reformat as:
	reg = <0x0 0x17610000 0x0 0x8000>,
	      <0x0 0x1a980000 0x0 0x8000>;


Thanks,
Gopikrishna

