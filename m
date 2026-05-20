Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC7030C35C
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245072; cv=none; b=FmeNa/yhugBPMmKvv21fYp37ILEU/nAMm1MYit3VBkky0Wc9O2sMGxCNpQutVWtXQgqAWgKHoc6lHaHT7yIBEWHU6mzf6XsisdRAphX8EIdMJEjkp9TT8e0GDCJ/LqfSzj3xl/gVBNfLLq5nOyGyYqr7N4tFRcA5h6A+PBzxrcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245072; c=relaxed/simple;
	bh=DaRJ3NNbsbZrzfDzFuZvPTcUEpD+OYjkRzh34FLYT9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikvJ7AYE/NECOorf3Uttj3sk1LzXIkM4R8wAoDbLi9SN6X92bFyA07gaZlhLtbliE7os1PfKZkaPVTLOO4xszRwptLo91SBPD+pc/dP9VpTdOUkH7gqcS4sMCXvUWbhiXbvRaqBa2Wjvw0nlJylu1WXx6OXEJir3QnIodap+T/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXSkq/88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9jG4E0H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXSkq/88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9jG4E0H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JLqRvF1739557
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olQmU444+iBh3uhTb/gQNnT9OSS2Ihic8JFh6v6izo8=; b=SXSkq/88Jb5NzbxK
	neJnSME7YELrLujNEzuYhfx4w2kuMBmxkg+MM8sTxXlhUV/jsFdiWTKzjS8PdOy8
	AY/HQ5AuuhewHNV3CBNwebxj03hzEeExVYSpD/Q3zuPO8kwCIdekqGvMLOxnxxS+
	hw630nM8Ln9D/8E8R269M7VrkM7wC3dJJMW0GRJCTPHKf7wIhsiQZThHhcscJ/Vo
	wgO1an0Qb17w5yT1jlIjwTBRRWGkYRnjkzBb8sUCCa5Gwzd9pk7WDnX0oKtRPBb5
	P7ZdRR1hZkfvzjUSAV8WrO7kBivI57/7W8OmS1LJVCJQqEu/WwZV7b29qjBR3Zlt
	XgCe4g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qaftp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:44:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso2212880b3a.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779245069; x=1779849869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olQmU444+iBh3uhTb/gQNnT9OSS2Ihic8JFh6v6izo8=;
        b=R9jG4E0Hd69+oUrVZkW29Z9Sx8cbn5nykVmVyECNQCdM2+xR8uL+sDMz0NuN6SvWEq
         eLk2Ib7Y68TBkkYILvEJvDkC1ZHuySquaZUiX9QzlWfgnFuoAHOp3ae/yORpWLyG0K8S
         EltkWZD77ntji5NWtcpxnVomfksXCmL64ySVLVKAyJL/hW+PsqGpuDgw8tKS3wu9UNhG
         8V62rnmKcphczePYgOxcYhCZTEkf9I5osAi388k8Rz3qF6HBV7+ZPDE3sJJ2b/vxaN92
         2a6tWGnLhuLpc3MGf3aqQgx2bMpEf4qiDlcwkCY7GlYWF7u/S+DTZpmqzwObKw/om63h
         Nalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779245069; x=1779849869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olQmU444+iBh3uhTb/gQNnT9OSS2Ihic8JFh6v6izo8=;
        b=CMe0iGRO369aecDU0wIyOpelsEPyZmqnNtOTWXSyn5ulqObiZeFy6TJbL2pnFGvIfz
         zGPdKl1SajkY/KIN74/S2oBk4xCb4CVN4j5EdQ8bVBR26KtNfHz6k5YLGnCJOX5UI0nr
         zPaDUxIGIm7rIy7TmXBhQ30AkCrLu/gbIbN9T+/CVJPs6jPGxv8+EW8+NwNl1HhFzXno
         RSi+11hEmzQrbWaD7j9qdpEC4Z79wim+aMce+R33NlA+vZZA9RfByUxqh16MN1icRUYm
         knt/zdqNHvBT49qeh2ml7TQTpDR2gdgSKOOQNpHTEjLbd6T+fkUP/KzX1aaMNQCdJtfJ
         nTfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RKA3Sk2dW3I6oB2DhU9hzrGko8NE6qmz7Qk4KVwM7A5yzC5l7nKdr5aTkzJUpxTxv94p2vioEmAuv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NougIelFEMpn8w3Yt+Hpybv9AoLn5I+S3YbGIxPgq92E9aD2
	rTEgcYYYjp/DGOrgsojkrYXh+sH4GnOr6iDB0ch8emg9gUyLEVxAor//nt71V0ukTnPsMZ3Jep0
	eEZU/jyX0i1RAiJ6C2ly1wHVQiP3WPkNfUWZ3A67rsECN+SJ/NYqWCYu8F/jXJoXP
X-Gm-Gg: Acq92OEHZeaOOhk7d4oyoQ4/VsqrOpyYku7W6EKqThhMAJsG2vhNK4s3osyG+NcXWcf
	8osx0RbeHHAbjvvxPIdxTxjMXfSgWyMYKITQet9hJ6n+6Lw3dUy7RY2+OCYc3Cw3MJBTdXEjVWh
	veYvPTiAXIe0JcLi8QitMuO6Tnmat+5aV8Hn9ggVYgJJa8bMcapgRcdYC0crS9ubJETlK21WleT
	9vlaIXti2sI+2rTFe0lnjT1q+sLHDcad/FMJQsd0Jt5cSzLx1E+pvNF4S0/E3Kxff+4u4QyxFzk
	k96GBNFXzTHtBV8h9NvlTblL00P90fuFkvSgbkWJ0HM7ZQVHjR0/sdzi8G5tBsf/dmAB3c0rq4D
	nk+cwY78q8Oef/7/NWRtqfrI2BQOnAwuD4k9QuRZ6/+E9zHOXpdT+qtrvj2V5iX8RHdzwIXHpTB
	5p2/j1QYIArgh2/LrM
X-Received: by 2002:a05:6a00:b4f:b0:82f:44dc:f85c with SMTP id d2e1a72fcca58-83f33de9efdmr23286787b3a.34.1779245069126;
        Tue, 19 May 2026 19:44:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4f:b0:82f:44dc:f85c with SMTP id d2e1a72fcca58-83f33de9efdmr23286747b3a.34.1779245068609;
        Tue, 19 May 2026 19:44:28 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c39esm22560389b3a.36.2026.05.19.19.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 19:44:28 -0700 (PDT)
Message-ID: <08f8e935-1c0b-4842-a5c6-60598896f07a@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:44:22 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-3-cf5d0e194b5f@oss.qualcomm.com>
 <agwjP2YNVeVtcYB3@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <agwjP2YNVeVtcYB3@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qBsg7vW26XZdS0EDA24Hkzma9wQUG_Dm
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0d200e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-51UZLpHGQMOatVTR-gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: qBsg7vW26XZdS0EDA24Hkzma9wQUG_Dm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAyMyBTYWx0ZWRfX63hMxqdXfJew
 x0B5iE3lKVG6PdMFmgUXxn134yEGjw/1Jjlog/hlL1T5Sw/6XvxUb7AsFFXSUG5xP3dQaJjxkk/
 8HkUnlYX7rQIme1fNCtJ8RO7Umranu6rDESMWU8LR81lKI3K+r4ymTFXTiRLqjXw6Iz0HcA228C
 aabv6IlniqTiklIfHGIIAL2vgywNXPPSaKFfG5b9oW1tE0+OpPzmwGL6xb5kmdHbJAO6OLO0sFa
 s2muOWpajtuEY/5m7tcMAiJ9AzqfKvXSZRwjoRW5xXmVHJ6JOsq5pXV5IxXIEdxwGEDThUNpAFv
 lweih9JO6gSTenkTHswNuwKonQRpBJd2iDlnY/A7JyrrKuhKICeI38qsKgYsq/HSSgHxS+HGocB
 K5i2WdbIJLH50QkC90IaCkX2t0ndpLN9P0D0v+irQCoXbWvfOYitNXdxSXSuBKd7T/L6AnH0mnm
 G1E7+ZvlrkcleqfvBMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200023



On 5/19/2026 4:45 PM, Shawn Guo wrote:
> On Tue, May 19, 2026 at 12:24:21AM -0700, Jingyi Wang wrote:
>> Document the component used to boot SoCCP on Kaanapali SoC and add
>> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
>> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common
>> and add maxItems constraints for SMEM properties in the documents
>> that reference to pas-common.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   8 ++
>>   .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,milos-pas.yaml        |   8 ++
>>   .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
>>   .../bindings/remoteproc/qcom,qcs404-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |   8 ++
>>   .../bindings/remoteproc/qcom,sc7180-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |   8 ++
>>   .../bindings/remoteproc/qcom,sdx55-pas.yaml        |   8 ++
>>   .../bindings/remoteproc/qcom,sm6115-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm6350-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm6375-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm8150-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm8350-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm8550-pas.yaml       |   8 ++
>>   15 files changed, 263 insertions(+), 1 deletion(-)
> ...
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index dc5a9981c12c..e81ef400555a 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -46,13 +46,17 @@ properties:
>>     qcom,smem-states:
>>       $ref: /schemas/types.yaml#/definitions/phandle-array
>>       description: States used by the AP to signal the Hexagon core
>> +    minItems: 1
>>       items:
>> -      - description: Stop the modem
>> +      - description: Stop the remoteproc
>> +      - description: ping the remoteproc
> 
> Just a heads-up for Bjorn, this will have a conflict with Rob's phandle-array
> change[1] on linux-next.
> 
> Shawn
> 
> [1] https://lore.kernel.org/all/20260507201749.2605365-1-robh@kernel.org/
> 

Thx for the info

Thanks,
Jingyi
>>   
>>     qcom,smem-state-names:
>>       description: The names of the state bits used for SMP2P output
>> +    minItems: 1
>>       items:
>>         - const: stop
>> +      - const: ping
>>   
>>     smd-edge:
>>       $ref: /schemas/remoteproc/qcom,smd-edge.yaml#

