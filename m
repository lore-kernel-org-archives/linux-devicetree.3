Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683C4E80DF
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890750; cv=none; b=XZNAMGGHBwnxVVpZtBzCd77h5p/7I4NeCCTJ3ZOZMGximjOIPAZxxRNNYh/UWRzKKerEZGgUsokS+RAcCyieg5PKjqPkQ0FHM9Q4urZrAHcB38+OaTsV6imgzLHshmSRFrFSIPKy2KxEp0f3K5cybovuYN5WXsxz145gKdF80UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890750; c=relaxed/simple;
	bh=hi6zrpo0qMf2oszDVPessNqP8ZyikArUQ9QIvDYIY24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czbpMW1mUSVXcwu+gYMWYjATz7LymYY7LlAYAAzzrHFRXMjnrqfE40bFVv7rmXuSeF+3q25+dmFk3Ae502w1mQwr+x6BeDeOpBYq1R3ZpGUA1EeAqtz8mkht+tioBRxsliwbfpwqBW0MDhUF4GeTZp1qdRPp7skobC2cke/ltf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GF3xfgPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OhIK2y/w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GF3xfgPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhIK2y/w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CUWQ949467
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOsEth7Bogbq5lk7VZkPy+hxIiaIx/cvk7GoBqLc+eI=; b=GF3xfgPAA1j7eji+
	G0N/AFQJQU93vvRcT5peRua8T3d2STv0NQIS4dw62i1C1DuuUj3sMeDQZG8jHj1F
	Mc6TrzR6jwofrDczPxB379/NN5Tkj9TkGrRNitWNc/zSOnt+pAw/hekV2eJSVLxH
	PDtUrerHsnxxZ8U0vFyimkh4NeL/krMAlpKnCIqlJ7kmRJqzfURE79UiNyFhvy0j
	PE3anVrcp4e+sfZDslfRsmJg7ql6y0edOCKBc+7NEkn7SxR91MNhq4wPl1WpkK9C
	nyuGXQVXiFhjhQL31w2SLXoNDSxRn/6W7Qdz7hgxmgZFp0BMA1fA+SSOZhQYOS2G
	/kf0QQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f629abd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:25:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a89dd31fdaso2494029a91.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791890747; x=1792495547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOsEth7Bogbq5lk7VZkPy+hxIiaIx/cvk7GoBqLc+eI=;
        b=OhIK2y/w5a6ClUwmno9QO33khyWeaZ49Dgd+N6BcZQePrLdGQxvht+y0anbI8g9GwD
         zf6kimlJ0gVQOEVc1N4089SV0gDOHnZgfCj2ka82TemUIb9HJehi2FjX+zlhLOPXc280
         UlMYXkmoz5E1iWT9If9K327LkRptN/P6FrAGKeBbOkEuOxKmNMtQEOZLFXVQ/UkL/SmN
         WoftKunFDipIDK3ZNhECJ3PszyFZpnq6E4VbqE4L/5RP5ULonuFFO37lnoVTo5dylha/
         Z489VLzsvZ7zNCsCN2aZo1rPrh2ZgFNdRR36AarYmSHYky36MxRmAKdAtih6nDGtoMbN
         VOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890747; x=1792495547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOsEth7Bogbq5lk7VZkPy+hxIiaIx/cvk7GoBqLc+eI=;
        b=x3QGKwTlAIb/GXi9rm8cnw4oHz3XRxV2aHtCDy0XilRbPZobMGPbzGfQbnCQ7rqMOe
         x8zDr2krT48ol1UV9D848xP67GUCH9YMzH+kPdBuxXiaiNLoOpzC+Co+NyLtDWe2dg3p
         3n8gloj2thwW5s97DmpuY6Asp9Y8IdwIj9uBihYSmE/sy+5B5cgPUEy0U70Hh16qHuyj
         oc6JuRn5dnanfRMrBFr9YRSu/Pkzp8sa7v7fX1dlr42qSVNuMYwWbbj71oHvXTGvUw9E
         oDw3ygDZh/o9YV8JBKs/ozrSEixjkSeX3hWdbmn4xWOTdb5TuK4MPN6dVIQjSHX8sFL3
         lqxA==
X-Forwarded-Encrypted: i=1; AKwUvBydxYBhVX6pShnNc3XuA36clzd9jQfqTABCTwNVsJVWcWhicxvKJ7JGVoY+a8X9/v/AC1oUNiyclYNF@vger.kernel.org
X-Gm-Message-State: AFq9FYL4oX+5MGbKeXzVZsqtXa6TlCpKTouTdz19F3zlwpaFD0g2/ZaK
	15zQLNaOOh9UArDlDsOP/TF+k/lhWszecmnshp8lJxmbI+VixeecEXgRJWpsbD0H5mkyILrSSDK
	9ozIwTcu7G3pG/y/LNH2+1B/uTdw6opWK+EVGjvC6Chw1JfxOS/HC5T1RFKDbdowD
X-Gm-Gg: AYBFou2KU89gl3F6yJ8GJx51Vq73ePc4SJsAbcf9zi1B+Qzmj1MScUDAc6LssLer+9l
	zRLbVqjMROEEMf2TxMlpJyQtuApUjORMdNoAje8KHSG/ZqNJ51NbOfBLgMUgHG7W0NeZAvbMRW4
	yaCLYfbiV/N/38/NBpr2tmF8EmOzipezOP0M2FEUOHZrz4XjiA5t7/XipoaT+0WXiVLBEjJCxW1
	vQxUhXh4Mse9ydyXhtH6EANzQPK3kETncFsdx3gaEVNibSDVxYF/IphJ/blkTnQsLp+Kc5tOH0Z
	XPXLa3WI6EcGrsxnJYZWsZrA1nj4IYGmkI2Ho5oHt5k1MR65H5M25MNAR0F2Da1xV5sa0GJmMI7
	hmOcaB8E/C6nWvnqk7U2MqRdiBAnK0Mc=
X-Received: by 2002:a17:90b:4b85:b0:3a4:ba6b:cc24 with SMTP id 98e67ed59e1d1-3ab3ac87891mr8780859a91.58.1791890746550;
        Tue, 13 Oct 2026 04:25:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4b85:b0:3a4:ba6b:cc24 with SMTP id 98e67ed59e1d1-3ab3ac87891mr8780835a91.58.1791890745962;
        Tue, 13 Oct 2026 04:25:45 -0700 (PDT)
Received: from [10.216.22.79] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21634597a91.2.2026.10.13.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:25:45 -0700 (PDT)
Message-ID: <fc6a2d33-7dce-4b93-97e0-3ccb0795cae4@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:55:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
 <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
 <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
 <b2b51cef-cd88-41d8-b9b6-3c4f5ebf3d59@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <b2b51cef-cd88-41d8-b9b6-3c4f5ebf3d59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace153b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=V_CaKR13k3l0X16DQUoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX28EyYlwzb/wj
 veGJOcbuZ3LmgtdkPjclTDfQGZr5EzpwdWQmVv7L9MC6XpihKpJ+1eZK9FBohe7k6rqDGimLlq3
 0c/MYI567NMx+4MkugVN0JcZkosV240=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX92mvOPq5+dt3
 S3y4YppnQFOkSZQIWTYxiziG8w+MrkbktmHcS9SF9qLPPW/sMt7bMW0QupcxY/CcaMTwA+YHyUs
 3wxrGVbtOnZmpIQguc7AEkxdnXdlCklPr7Tt8tYZBNdeGMsw1IqxSjrUmqZLJUcLw1NnsX4wW9Q
 VR5P27XC7GliAtSG3xLiSFykP3JVf4NlPcozYGmVtCLL9mS02npknxFE3TpOJtbYalxT+Ko8jNi
 5bDr+Cy9jzkcLmqtrHNJUyXGCsW7uwY6TMvz7apQDKu5hIE6O7iJpdx4Y8On0dGU9Ibnl0Iz3fb
 goA2DBCgHaWNRYHfa8NbRq7FS6UwKb+ngF7YdGd1SFr5swFemm3knHDwb/pd+g0Najxb5QhQ+4t
 1hH5nWiDz5zgZeDwUzGxsS9vELCefPHebXF5Woo/rtRRwEj9FjNWHoKdTMnYnmAc4lo60o89+/8
 BcB74ob4wPL0qnykXRA==
X-Proofpoint-GUID: 2PraRosjnTVcNmQIn6Am30ZeJGwuTYKP
X-Proofpoint-ORIG-GUID: 2PraRosjnTVcNmQIn6Am30ZeJGwuTYKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130045



On 10/13/2026 3:33 PM, Konrad Dybcio wrote:
> On 10/13/26 11:58 AM, Anurag Pateriya wrote:
>> On 10/13/2026 2:27 PM, Konrad Dybcio wrote:
>>> On 10/9/26 9:35 AM, Anurag Pateriya wrote:
>>>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>>>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> [...]
> 
>>>>    +static const struct qcom_pas_data nord_soccp_resource = {
>>>> +    .crash_reason_smem = 656,
>>>> +    .firmware_name = "soccp.mbn",
>>>> +    .pas_id = 51,
>>>> +    .proxy_pd_names = (char*[]){
>>>> +        "cx",
>>>> +        "mx",
>>>> +        NULL
>>>> +    },
>>>> +    .ssr_name = "soccp",
>>>> +    .sysmon_name = "soccp",
>>>> +    .auto_boot = true,
>>>
>>> No DTB?
>>>
>>> Konrad
>>
>> The base patch isn't merged yet for nord-ride-embedded.dts.
>> we need to enable for both rrd and ride-embedded boards.
>> I was planning to send them together once nord-ride-embedded.dts is merged.
> 
> This is not my question. Remoteprocs on recent SoCs come with split
> firmware - MBN for the main part and a separate DTB binary containing
> configuration data.
> 
> Konrad

Ok , I got your question now.

For Nord, SoCCP DTB file ships firmware without a separate SoCCP 
device-tree image. 	


Thanks,
Anurag
