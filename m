Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874276;
	b=i7mp3TdaOWQDk1HEaAb902iOGCpOP/cIwlswOkGZMw5ZwqrIuUdUQGw4L6qiPbp5fu6x
	 mmDphXOtymBKkVWawsf7OYqYa1eg9tuFIk5W+Wf3mlo9CkYcpGkxCmWExJrFjn42Roged
	 jO/NZAi4Udm21DKU0+AnmmoLrplqNZ5V1lxZNrHLGDLtncDO0s/sX3BM88qO4VHE3zPav
	 jqAxb1MlSciSdc47Hq2TP+VYJeAwg4VDcmkSZshxTxaXQ1Flfuk1QewErtPJYZwoyxI4/
	 6m8LdV5u7tdKWYj1/DyXjDv4LfXcLT+1BcPOqAamNJd/Q4WeZzM/yHd5d40p4UUbZiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=;
	b=dDo2y3LrE3LvPd8+KvqAuIQHe1EuzecWn+NT26r++yrQELL5FbliDuP1ZDIkYFibBX/X
	 HKvuSx7h6dNfvA+7fUphSyIkswwqSlWun+JJgT+D0JjLBhbx3KFcCRRt/hDXHtCniLCoE
	 Up8QALjVVgqEizl41VUmhLMf4aL70bmCGcJbzcGWhmJSY1XThi0fH9geAW7zQWybHJwJD
	 y5ZnDhf4GjnV+DGcfkoq68Ac7FOGtp86B3kirlSPJkXWsurB7mmKXm6KwfTd+HWBsCBwl
	 Ujx8D05S+SzA8bvM0KqHnBGU0gwoMGbaeyTojmSjqDgWAKH4HYxytf6ANDcCQFCzrHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z/iQnr3E";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bz6OHamm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE28606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE28606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z/iQnr3E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bz6OHamm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tIgG1477093
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 10:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=; b=Z/iQnr3Ebg/BdsPe
	DTEbDUq7ZhblP5itLN8zCYipNOVPYLBtvUgL4Qwb4/fQ+5r4iKwFweRFJow18N//
	Z36evofEUlMKD+o+mrQTuE9lxIXuWKaq+wyBDTbEC0SjHvxg13uQ7TmW/h8bos0z
	O6jvZuL1B/Kc2sqaVcxNN41Zs9fh8GN/a0qgmnSFSUBYcvb5dARVgnALkafLEZ7n
	t984WvUmsRio+BQ1PwMI9YbojqiV6Ea/6TGJm68xjE3+/iviRy3xn1Ec2IGjl2JU
	J5yrZTBBUGw1DTbHLUkxO7nUqsub5LwmkA0wte9ML3/vgx4z3In9fjIhTD2Oh9Qu
	ANP73g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnmhnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:24:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7e92f36f9so1395976a12.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874273; x=1794479073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=;
        b=bz6OHammfDyiKxPV+awfa6Ymy9wV+R25RoZ7Pwd0LhAMsPh6JE/duJ8ZX41TzvaM83
         HqPK/m9uXF1/udEPkSFk+TAF16XTxi/EMQF7dP9PY135KQw25uvsUHKh1pht/voiru/5
         yIIrZ1SiC1nlbFYNEy5sy2qPgvgdytKRIcbjf1LG0Vsdw7px/7qkuXUUu5mdB0gMy6hd
         s2Ok+VTAvGet1kcWwhaMNmxJ0z411FW3vu4AIj+PLGa3LelLPMCr4kqi5h6UKmCPg3p7
         f1jcwAtRb+tlIU1JLWbr8s9JZJseKURVCKUAlDyg+RQiyieXWkeKqCocZG2tt6xRQ7h1
         Xw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874273; x=1794479073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=;
        b=L0aqBPf/c/GS12mLZgYGjaMX+2pJWBmV+HpCgjjG+mvCU0N3ud0qVGNNqMlRMOBPQG
         jvHfWbqw4JfEpvgxwNDxSby30V5BbSzaEwCkSynbSO+EFZdl9iAM6SfxOplgRDGMY0qI
         y56/vYY9ucYJRL+TZiQQJERAz+G5R19OjzxrCNjfQxoQY5zwsqkfbA7cFDLAk9ZJwKAr
         1vQTNFAkbgL85Zk5V3CP0UH238X4LFIxSH3rjPYhnnFrOXb2773TtORPHpZ3Mx4yVMPM
         kbXMyfi5pJHrliD1jieIvYySgJ7qpJveU5idCWjSWZrAEo5KMd0UaE8b5vO1CRNC2h+J
         rlTg==
X-Forwarded-Encrypted: i=1; AKwUvBzYI0KYx/DRjPZRF7DKYIsVI60wv9gFA1XfiMrkTYlau6P+ZkkhfDSl0C+qhU++KNiPFmwGdPHdDxJp@vger.kernel.org
X-Gm-Message-State: APuU4Z9LTf8zAj5txbvoHFYMJOEoP+CeqsP5s485dwqYm7r9l+fQhM/4
	oFsuz3M1BEgmzYTahLL147uuhY85MJxKT7wf0CGivDJvq3T4UdR2DXdLWI3kgSaRa5T/y/bNKRs
	fhhIybhKalXqwIb8AARTsPFijgbKbYfiBy+LuZ+ajororE3/iAeNWl4mMZr1KmRdH
X-Gm-Gg: AYBFou0vsTESNtYFDoDzBRijuqsXyejZWPFtSnaMpau+7vmaP2hb184mLRzetlWQrA3
	TkdFaqMhO8wLQ5Zl2IajUdWxVXu2liW6dj+E+8jJOT6ZIiRHi7lmjRHDzStiEEbzFi5xXB7NNcW
	TjmrOnqA72imPSClOFhTkuVcKNdg/zkoyKqJN6SKq6w2llq/YJGzpo9uXZJdEteTZn9pV9oAvvY
	w7RKU1dFDs7J5W5J6/qA1jKoWi81woPjXtuS0vaEqRdRSeQpSoMrkPF2Rarsg+ZQq0uzVc0bKV3
	NSW8lKWFy6Z4edSK3SA7EiSVGzBSa/8o3NzegP9AGan/spAVIUQbvy1dCZrQaKQn/ERoFTIBbfX
	m8nn52vABiY5hozI26u3CvfwbkWiBILuttlasnfX601KMnS55W+HDIswDZst15IiwtU0KqMg+An
	hQvp8=
X-Received: by 2002:a17:90a:cb18:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3ae897eb520mr12487837a91.10.1793874273389;
        Thu, 05 Nov 2026 02:24:33 -0800 (PST)
X-Received: by 2002:a17:90a:cb18:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3ae897eb520mr12487817a91.10.1793874272947;
        Thu, 05 Nov 2026 02:24:32 -0800 (PST)
Received: from [10.218.25.112] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094dec0e3sm3488352a91.1.2026.11.05.02.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:24:31 -0800 (PST)
Message-ID: <9a6c67a5-cf3e-4ddf-93ed-87f0d3dead70@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:54:23 +0530
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
Subject: Re: [PATCH V5 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
 <cbca4156-a461-4d01-9576-352f719016eb@oss.qualcomm.com>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <cbca4156-a461-4d01-9576-352f719016eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX0CnPhvNqYMb8
 ErLU3nWTFlsc1R6Fs4C6ldfczqNRcY+6jhu61J+ZBqo1uvqHG033wOwsElWzTonUo9n7agN8sdQ
 kqLofLPLO/lLez8of/v5bOKluQxF/G4jRoY9I4jkTd2BK/DpQVyIvvL2jbXZVPBF9rNoMMLEiWx
 ZgzT6WWq65oNzYCAi5l4rSGeq+q95Aq/xjEY+qRT+q0qJCgfmYSKhu3PWHOvTfJDRYqP2/1OgSq
 viuORHaWpxlLO9GQbjnpJED5QYPMPQIGHrVk7hi6b+0SX8qcXgKw6jH1o9hMEB1HR+XxT6hQvXU
 7vgnicxAYqZOrzQAXccPrBzrs64uVsUqdBh/z0Fq8T/lae20vUHZauMSuRu8eO8fS00x0FwUGiO
 WMEULzpT5Sz7h1N02/BM6ubn0wI1w+JA2oDI7JX0xHv87KeYz8KYULP5QB+MAzAQ81NVNphlKRV
 xGcYf4GKLoOIR8I6/wA==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aec5962 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7PiysLyHAn3Bg6R4OYIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ouCH387at-U1h4L4G5BPUua2NTBhsTW8
X-Proofpoint-GUID: ouCH387at-U1h4L4G5BPUua2NTBhsTW8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX49JZURWDzUFq
 P6GiINaehTAy277YQr+54id1/iSaSeP5sLhWYJ+ejQu+/XSIfEkD5hob9/uAcpWLvGooOsbVd22
 5hrkSXe96v+7cavI6vggw1jNC7hPCyI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041



On 02-09-2026 21:59, Konrad Dybcio wrote:
> On 8/26/26 1:24 PM, Monish Chunara wrote:
>> The monaco EVK board supports either eMMC or SD-card, but only one can
>> be active at a time.
>>
>> Make the base monaco-evk.dtsi storage-agnostic by removing eMMC-specific
>> configuration from it. This allows storage media selection to be handled
>> through device tree overlays.
>>
>> Introduce an SD card overlay that enables the SD Host Controller
>> Interface (SDHCI) for SD-based storage on the monaco EVK board.
>>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&sdhc1_opp_table {
>> +	opp-100000000 {
>> +		opp-hz = /bits/ 64 <100000000>;
>> +		required-opps = <&rpmhpd_opp_low_svs>;
>> +	};
>> +
>> +	opp-202000000 {
>> +		opp-hz = /bits/ 64 <202000000>;
>> +		required-opps = <&rpmhpd_opp_svs_l1>;
>> +	};
>> +};
> 
> This only adds to the existing table, not removing the existing
> entries
> 
> Based on the previous discussions at
> 
> https://lore.kernel.org/linux-arm-msm/de10ed05-a0fc-4f84-83ea-8810270ff2d6@oss.qualcomm.com/
> 
> I'm not sure this is intended
> 
> Konrad

Yes, this is intentional. SD card only uses these 2 frequency options.
The remaining ones in the base files are for eMMC and woouldn't hinder
the SD card functionality.

Instead of maintaining two separate tables, the common one can be 
utilized.

Regards,
Monish
