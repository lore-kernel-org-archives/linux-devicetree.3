Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301337;
	b=DQ1aGxoNWeo5IBStXGeUz3kLgpvsdneVeHRYUHQmgLFFRUe44nSzFROb4rIBI3l6m36u
	 yp5VjPAaPe+9aUWdmveGwwxKly9jwBOmT9lE5dGf+K1O93XfCjEls8ee6RpF5D59909Qo
	 MSnrJtNNog1nUZOZI+DZzSQw7P4cINP+sl6QcRGjaib+sCRgD7CyUxloUFGwFEWrZ7Sj2
	 Nlfz597JkahepK0+arLxtaMm2AJuFT6XKfZLGg3ol6hZTqsEx7k2Lu2unHEFu0mEGc190
	 ngKv1c3gtdJrIaehXin8a2RNglAZeR1TgKRET/YZKr2ZJDNBZbza1FSL5vX/Ci/YIOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fs/m/EMOa29tktMuh2e5+aE5N+/Z3wgwvBQ/4dk1bZw=;
	b=xXJByghoiU+9HnJ2tbGoldK9IqMWDma0EPEbMbVjYZiupWbUpU8s0QkRy4eZ3eIDHb4Q
	 C94Ky2DWZWbdGTQ6BIMPQOKOg64LGZwFc3qo916kb0i3H4Y7V62Dg8OcoxSHV7TKM+JOe
	 tqCXgER011APcrXrpC/48+CIzwF+whVJnt8uzWl0Rl4irkQRSVm5m3rLh7Ckng1nEVVuE
	 Dq7BsfBvqWbLu+x+KRLi1vgq3viI406Ydq1D0t4fuVRsymg0hpRc1L/pBogsybPrRa0yX
	 UY83onHfDuScPf2z5U7Azs2TExq4OguhkjBSysp5dpIrh0gbwHgkD4hpLSkdYUMJwbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GJ9bJ7VF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jbvOTw1J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E53960A2607
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E53960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GJ9bJ7VF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jbvOTw1J
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4HJ1155022
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fs/m/EMOa29tktMuh2e5+aE5N+/Z3wgwvBQ/4dk1bZw=; b=GJ9bJ7VFGz+uzvSN
	pfVMEAaW5baybuEj/sS4w0AK71rT7RTuHCDoROOZL9b8afwN82vA1YEm0VId4c+K
	3mcsw67J2ispsW+D3LVfsbYp8ne/fxqQnXhzcLMchuzobK7/m1LOBN/SRj7dnXOq
	PI2Y7mFqxeeEBgtJ6HT8plGaz/O0ZNzWSGxthOdg0Tbo0yp4eDbzIJdwJqkxiq7d
	veUUOSZ/VPNdeqDL/SCDG9zWqRwJYmQU4S7f3NIc1/awpDxondAZN6b7cV982H8e
	lxS5kD43EKVTuT8uXUpdNAE5IMFc6JP51Afifumv5kvMSy5TPrtbNJxBlVyEmygN
	fb+aTw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49bxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:02:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so2292328b3a.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794301335; x=1794906135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fs/m/EMOa29tktMuh2e5+aE5N+/Z3wgwvBQ/4dk1bZw=;
        b=jbvOTw1JCLlWoCKEJLFV4j36xmhaYdyqWWQ1GvVxx5+OpVS+gmeSjCIDVlcyZvy3sB
         oZgPKZqP1bf6Ev0PRwe4+cz/BwPrqusWs1GD1WP7ecTte1hIpBGLpK81rsLVMWLQyTzr
         gbIFx1vGaKhQm6h351U5dCMMGi/xGhScqB23IfIhUuQEfi1g7k8bd+Xfov64YuRRdpuZ
         BKWw/qAuLqzzQxIdMcUwnoNjUbPh1kSRPF4aGcEv4J5Ihdi/WUCNJaEnZEsXHOO0wdME
         C02joeyEtGP+IMNINxfMK+IzRGY2trckwpMTifc9R5yLCk4gv7t3mAuBEpwljLG+QI5D
         NodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301335; x=1794906135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fs/m/EMOa29tktMuh2e5+aE5N+/Z3wgwvBQ/4dk1bZw=;
        b=cGP3OGuLM34KJtoxB/iw/V5rPyRpV6tbxiK+PJJmYiTofuZwjeeh2GXsxyoGf2EjY4
         NTZKgRa1gD4hX8HLC5l31vsxfplI/yQ2OQckQ+zcBDeLu/J09plWImIrarpXp+fFibiZ
         +5C7L65/WNOjuZrne1RMVP7ytZbHvG8R8h+IwDNno+4iQsaKXGOg8ndVAYQOyefJJo9X
         LzCJg1OUMmTPaLMo7YUdb/+Ol6Bt4gZVqgoS9QPffOvMm4QQFNTQDnUOYhB5BBrDPSav
         EalUjXGbixf9exwrohzUITQ0a5w/UDAL2B2rQfBxEiqGv3VzPJYI6UehtLfCUi7Kn+jJ
         ktew==
X-Forwarded-Encrypted: i=1; AL+hErF/anHdXKOyOKunqlFlXexitnYtyd69VgIB1+h/Xd6FSX9wWlf/+bsN8pQZoqt9p7e8HdT9KnJ0BCFm@vger.kernel.org
X-Gm-Message-State: APuU4Z92iSMgeUtEmunW12XmkDgLNKGgcRsYF/sk1T05JjdXD9/76vvO
	1tMTb5OK9QtAuViJ3hFfHDaPNNBq87wJWfmqnyKlIUcoqPLU/NLu2AFs9Vrt1YuqCKje87HhJR3
	bY/K4nbSH0Qd858NDOnvN20OyA0WlF9ooQXSxOfupYtJ7gaxESWX2+Xi+hG0bxzCgbdWui30S
X-Gm-Gg: AYBFou15qDSvRCQw75sbHJe3XwW/Qr4LEVOqKsBfnBF3fkU8RJ8X7ZtjAw16+O4JvBr
	m+4+m3dsWZTMY2o9ZyJ5qzqRZl9K1PvA1LHk4jPaodyP7gpt5CPK73Lcc3z3i2nNR0GgN8VTUTy
	odSz7OpyMDb4auugmN5roMupyfG6J0rhUgh4mxcY7CIWoreCPmoxWCgzRsNbQbISfNLhhmI7loa
	peN2FMNs27r7RLdUwPgdGnSt5r0TveCh0VoAaVuFRjfwChkeU2oZkniGAq9L/LiaUHJ8QBbEo9D
	vjZZLhGKPCjAEgz4pSQwVP81+r4ZCMFzXrkSWbp1yq34pOVNMdVoUarGkGqILvHWiMdYIVQh4wR
	vF6DBpzgNbWnISl/AqwDqAaq5CqfBT8W3FaxzaENOJfjJ9OzTrKQNQ759Glf+rAZt/dAq1ZY+Om
	u/
X-Received: by 2002:a05:6a20:7490:b0:3e0:f07d:a73 with SMTP id adf61e73a8af0-3f18f0b850cmr2016594637.33.1794301334998;
        Tue, 10 Nov 2026 01:02:14 -0800 (PST)
X-Received: by 2002:a05:6a20:7490:b0:3e0:f07d:a73 with SMTP id adf61e73a8af0-3f18f0b850cmr2016550637.33.1794301334523;
        Tue, 10 Nov 2026 01:02:14 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab4fc2b5sm597115b3a.50.2026.11.10.01.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:02:01 -0800 (PST)
Message-ID: <c204d6d5-a8dd-4ee0-8519-af09c231a4d7@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:31:47 +0530
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
Subject: Re: [PATCH v4 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-1-97e7019debff@oss.qualcomm.com>
 <20261105-cunning-whippet-of-success-e4fd3d@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261105-cunning-whippet-of-success-e4fd3d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNSBTYWx0ZWRfXy6Da7cER5ueq
 2vddmWQwMtR96ULYBaMeXqLQGRGYvX4DejudAiRxQp93e4G2p7EVOMYN+yURX+MiZ9YG37lBoSA
 U3vnHkrqemjMIgCUUFxNN4+9124LVVM=
X-Proofpoint-ORIG-GUID: pNpluHD2oWrXKf6IcKWlEdYCzwWGN4No
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNSBTYWx0ZWRfXwYErff5OVBn2
 ackQMejg/5h4969emDbIZ/h11E6GtFVfQ+MobkflE9Bc4bYcdeOWHQu0vT1VLr2wi5EPY40Pl9o
 z8SNCEsvOJVh4edvAy5C+DroIevLQfzkQfuanwIxQqIGcZnTIH0IlCMYh4LUNyBDJrxOZhFO3EE
 bLaZsLNN0yNomVoxmEmpi/bWxIrLOLPgnK9eC+mick2l/HemR51DSXRBmr4ucLfa7OkUl91s+lA
 KH3puikXHKt/p/zpdXIYkDhkhhvp2CfFJ4N0A/DghIaBv3Mql1X0uC8erll7RAInNkZXTyEwYog
 uB569Kf+LZqY2s4S9XnuTXd2kvlASDtE60QaWcV+jCctZS+iyxFqIek18s20EX3QVjmEuTKAjEC
 oRI9sRTCH6VKjY9AXCuLBEfmSpDNLB/S5nn4Nj1msZJ33RaeCUsP/o6z7Ca5GNBwgekEVkhFUpm
 WDYL85fPRIyIsfCgWug==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2dd97 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eWDS80NfvEsLDdy5rmYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: pNpluHD2oWrXKf6IcKWlEdYCzwWGN4No
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100035

On 11/5/2026 7:05 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 04, 2026 at 07:33:30PM +0530, Komal Bajaj wrote:
>> The `iommus` property constraint in qcom,pas-common.yaml is too
>> restrictive with `maxItems: 1`, preventing SoCs that require multiple
>> IOMMU entries from being properly described.
>   From here
>
>> Remove `iommus` constraint from qcom,pas-common.yaml and add it to
>> SoC-specific binding files that have EL2 support and require IOMMU
>> configuration:
>>
>> - qcom,sa8775p-pas.yaml: Add `iommus: maxItems: 1` for all sa8775p
>>    and qcs8300 remoteproc compatibles (lemans-el2, monaco-el2)
>>
>> - qcom,sm8150-pas.yaml: Add `iommus: maxItems: 1` for qcs615
>>    remoteproc compatibles (talos-el2)
>>
>> - qcom,sm8550-pas.yaml: Add `iommus: maxItems: 1` for x1e80100
>>    remoteproc compatibles (x1-el2)
> to here - all this repeats the diff.

Sure, I will drop them and keep only the reason for the change, and why 
the SoC bindings now need to declare iommus themselves, in the next 
revision.

>
>> This allows each SoC to define its own IOMMU requirements while
>> maintaining backward compatibility.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,pas-common.yaml      |  3 ---
>>   .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml     |  6 ++++++
>>   .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml      | 12 ++++++++++++
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml      | 12 ++++++++++++
> While you are not answering the unknown - what about all other devices?

I checked all users of qcom,pas-common.yaml, including DTS files for PAS 
remoteproc nodes using iommus, and ran dtbs_check on the arm64 qualcomm 
DTBs.
The only affected user outside this series is Glymur, where glymur.dtsi 
specifies iommus for ADSP and CDSP nodes. I will add the corresponding 
constraint to sm8550 binding in next revision.

>
>>   4 files changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index f75cab6b4ed9..4662fe4cff62 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -32,9 +32,6 @@ properties:
>>       minItems: 5
>>       maxItems: 6
>>   
>> -  iommus:
>> -    maxItems: 1
>> -
>>     power-domains:
>>       minItems: 1
>>       maxItems: 3
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> index dda2d144b720..711c2f723b17 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> @@ -106,6 +106,8 @@ allOf:
>>             items:
>>               - const: lcx
>>               - const: lmx
>> +        iommus:
>> +          maxItems: 1
> Missing property definition in top-level.

  Agreed. I will define iommus once in top-level properties of 
qcom,sa8775p-pas.yaml and drop repeated entries from allOf conditions in 
next revision.

Thanks
Komal

>
>>   
>>     - if:
>>         properties:
>> @@ -126,6 +128,8 @@ allOf:
>>               - const: cx
>>               - const: mxc
>>               - const: nsp
>> +        iommus:
>> +          maxItems: 1
>>   
>>     - if:
>>         properties:
>> @@ -144,6 +148,8 @@ allOf:
>>             items:
>>               - const: cx
>>               - const: mxc
>> +        iommus:
>> +          maxItems: 1
> Not sure what is the point of repeating it multiple times.
>
> Best regards,
> Krzysztof
>

