Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE55374A01
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 05:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786081602; cv=none; b=BM9AU6EYCsj3CMwd5LVLw0WmcHAH68g7C6ZyI3UDNMf/WjqVfJZVbGN/W0cOqS9SQE1bN2kgLdHfylM7hfQrH6qbADR1Mdxs6a54wThdyP2W5WqsL55iTlnTrr5J76kGFSCHI4fPmbOW+vvo7na7yoP0erjd6xi4WgIm8KRoGB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786081602; c=relaxed/simple;
	bh=9P8L6zktfOKz3EL8KfCBv9cGKTCt/+m8qNRUsjtZNgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2YLPxuvsunX+upjutp61fbBRBndG8mDRgvxD0YkElQkF9kuqyAM634Vq9m/rS7fKi+H2CoDH+UkROw6cV43oIRCs7LOn/iOzvGJQ0t2785o6U1ATN33XHPSOSAe+nDzbSwzRKfnOeqwPa6bFO6+WCMFeb8Z8uySktXWgT8pdYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaiFLxjN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFZ88bnw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaiFLxjN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFZ88bnw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GdN94063186
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 05:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	baY+tDm8o2ZpImxBsWJ9XvMvFUpL5jNCZK22pWwI8qg=; b=PaiFLxjNd9nfluAA
	hB2y4N/zJCI/Mu0sLyNFe7ibRSJWJP8rRTbo+RHYOboz9T3ln0omY6hQXhn51R0V
	ogX9vi6Nz2Up8NBRz0g54ftog92Ui35Z29dH6SQRiCe6gZlL8+ClUDpMRRFKWV1Z
	334+HbP8dOCIeZLkIJG3dOWpW+M6FQnJ7+JgFz9MOmKfP83xqskSLmiAye6WFABF
	1ovWZxMxnVIpsAlr2ong06KbUgyvmT4ikqVes48ZlSJfLU2GAHMiTk9/apXI/t8B
	vDeNCTseP+yzy9nsvummYjhkJ8QUIkv5ZoVhx5C4wL6KlECmmiqa3OCwZs7AWNSP
	spPkqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6habay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 05:46:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so6209278a91.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 22:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786081600; x=1786686400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=baY+tDm8o2ZpImxBsWJ9XvMvFUpL5jNCZK22pWwI8qg=;
        b=bFZ88bnwBkM30/iSCYzsv+Fs7HZ3F8ZWxQuPJW2iUDdigDV1Raq+Wn9BjSdEhDc9G4
         zTVe4JcIINvYO2hBYEgvOQKt8JoC9n15Z58VYHC4WJwnQtDZ7uZEJU4w7JChSSTpof9s
         G5jgpMWne1/J6xKoQUBYVGcUtJXfaXWExd11gi3uEMs1izIEw9LIBEjsSb48ijR+klFX
         UIr2RHABigdw2TDTDO/xMBmQQ/TKeQ7thREvHqexSIjv+T0a2itvcEkYvJ0n4+GkG3nG
         mfCqWIAISw0ZYojLcx/EeGW5mglPcGu8XfT9IZ+VnkHYe1O9b/6ylpVOcJxOmMi3qLKf
         4Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786081600; x=1786686400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=baY+tDm8o2ZpImxBsWJ9XvMvFUpL5jNCZK22pWwI8qg=;
        b=SxkFgYCuNWoEQBR6iY7be0iOQOWEp3tdwuMx2utoY+EL00yueWvw5ag7D45gaa62JF
         mEQd4o8tGfF9qZZhgo+nZislvBTENrzCCDXT+q3TqwoiGcNF+JDEWFP9S+YSo/uU8aja
         +w4Fz8VQSawelaooTwLN9E5OyKJZNm6WeKCdNdGk8sUirgObOJT0jSVKljiNz7Tz/9Nq
         XRXeRj8ortJM9Wpv/e5wg2Lu+vwvevoIqO24T1kAxlHYVkt8Zg2DHnpzrMNNYCH+4NlE
         Zet1Ld60/CWOfe9ru2n6EsDw9N4pEimEqC1qIQur6SOU/zTdJJRVlx2XlG8Sw4JdjCAx
         zguA==
X-Forwarded-Encrypted: i=1; AHgh+RoUv+wvFuiOV9uX9TVbms1F6gZyrfxxKUGBuJ809sM5ANAZANVNTq5gjYBKf8CPAgxjmFmWLupTYq4V@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp6K40HZo6qfW17+BbTNfclJpvBCZXX7I74l6nvc7rKCQ+gpru
	hagO9JLrodXB/u7Vntb/Z49mpw68CZoQrGmjYYH2xfLaVpl9OoGwEfEb0E3SBifiNnZY01jY7Xw
	1EON7PRZ7Uc94dH5VMZiKZGi4poy06FLoHyXIp7Y2+ZDKKnBQ0Y/JibBLI7uvCcQT
X-Gm-Gg: AR+sD13Pvcjq2r1uxMu719bTsWEuT8JTUcDSftCfbIch8pdjUX5pCVE4q1SO+YPFvHf
	h9TcrNiKbVXV9wd0JuShFG6iRHrpCOezOKp95SzQz3McubehYbSlkLp2FxVAejbZUR/F6qBVJ55
	vGuZm0I0u8ZwuQAb6pBBQoa3QlDBN4mwlXw8aeF27plLANLKgG7MdeHodZjUbxwNbLCzNl/aWQZ
	z42xyohj4SMn2T6NgI3VBwWlfszm+yTjLk0gXIlHPKqKjz3NRuR+R7cO7a6ECFKUrSKWTbHhggg
	YpmnLikSxdUoeib5vx4KGkDyeoIsrffc01a8zjyDbYHofthiRbeMUcl4OWCM9cZ7+1lFqexkWZw
	9hpRZ1Y5SHDgM420SRFhg6hHQGXCWrlS7
X-Received: by 2002:a17:90b:4c03:b0:38e:655c:6516 with SMTP id 98e67ed59e1d1-39261d10765mr1471139a91.0.1786081600088;
        Thu, 06 Aug 2026 22:46:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4c03:b0:38e:655c:6516 with SMTP id 98e67ed59e1d1-39261d10765mr1471110a91.0.1786081599673;
        Thu, 06 Aug 2026 22:46:39 -0700 (PDT)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de9c0fsm3310207a91.5.2026.08.06.22.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 22:46:39 -0700 (PDT)
Message-ID: <c5984b6e-488f-4946-920a-fdb170ddbb50@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 11:16:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Add memory-region for audio PD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com>
 <xbw4lpvqi2rev6ehypdng2q4mq636553ftcbcfm6wdj3aa7qfu@d6fctcmuxo57>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <xbw4lpvqi2rev6ehypdng2q4mq636553ftcbcfm6wdj3aa7qfu@d6fctcmuxo57>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a757140 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=l-7BTWVnJWc-EXfm3eQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: CiP75Hb8gb8BXUebpsvsh2ViNDX-DxI5
X-Proofpoint-ORIG-GUID: CiP75Hb8gb8BXUebpsvsh2ViNDX-DxI5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0MCBTYWx0ZWRfX0s208FP+LqEo
 +j5e2qlMfQ4MPs4F3anyojIwSffnpxLd84tJWvevN88p3Cug9eQ5vEfJkx06ypzr8N3i23WwOET
 /LruzBZowyxfjfDzxEEjqfBuJ92VQzk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0MCBTYWx0ZWRfX3PRzqY6fcjsy
 MIEOfoVsEPtHIAwd85ozLJ2zXoYjGJFZVqRRHAHqltj6GJa2j/SUnqU/gIDpBr3X1GGhmc2//O+
 T14dw7ShI4L31EJjzUjVBUvky5NsTpfXroUoVxatofZY17hxa9iQbq7MjVG2q++iRzCKqGcaVwD
 S3CL4m1WHjd3LD3x5EegK7G+vM/4eCwYFOdmy9SayB1t/3gQa/NN23HKJiV6Emw6W4ekMATJuyO
 1NXygGoOn5x9+PF9UlicJuTjqU57IiiBzBPmCnyYsCCkGAzo22xxapc3aifnOkAu8M1u/jJhmp1
 rRe8ii1BNtjgZqJTMvXpJQKCYmLVsDKPtrihJgPJ789lkjKXv1xgV7mDZpZad6jO/ygedlwL5Sb
 bX12Kfy4W0R4h1D0hYJRflweN7PP4CwWRcSvgksDC62+bbp2R+z2/lxBqrp2SwfZcDBoBL1rY7b
 cBpEh5u+BbJDe6ci66A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070040



On 8/6/2026 5:42 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 06, 2026 at 04:44:41PM +0530, Vinayak Katoch wrote:
>> Reserve memory region for audio PD dynamic loading and remote heap
>> requirements. Add the required VMID list for memory ownership
>> transfers.
>>
>> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> @@ -2348,6 +2356,9 @@ fastrpc {
>>  					compatible = "qcom,fastrpc";
>>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>  					label = "adsp";
>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
>> +						  QCOM_SCM_VMID_ADSP_HEAP>;
> 
> Either put it on a single line or align on QCOM_SCM.
> 
Ack>>
>>  					qcom,non-secure-domain;
>>  
>>
>> ---
>> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
>> change-id: 20260806-agatti-audio-357bcd74ae9c
>>
>> Best regards,
>> -- 
>> Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>>
> 

