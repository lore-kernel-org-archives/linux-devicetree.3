Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6529D404893
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092960; cv=none; b=OtpyU0TBrXPv8gMllxPg3cxwEUsJSAmMDyrEixHY4WYv5ZemSLcXK5kDRu/zi1j6UPd/95q3PRBDyEOqu+cDqcPRPdP8wYKYBVXQLrwH2GPqtIYN85P4J1h8oYjRGDm5kOLzsQ17TZkHzB3VkVP+iAIg/KqeGdBW/c0lf418CXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092960; c=relaxed/simple;
	bh=6N+clulkPZ4b+YW1h7cMHtrZN8QWlpzXaaiZ3uRZxwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCOwCBCas6mgOWJaiB4Oz9KogtXXOwNElnEyFNIMP52Qnb8xTLsTC3jRbDVB/o6TXx5zPUwR+oJ9/SmjqU1Wd+wT6SuE5YSEW/H8vR1lqf3RtW7+GPa3mJN2fpvlsn2nmW2zq+Ut1Dg8EcJue7x2YsV/33MZVL3a2K6vsw5oOeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUWXN/28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8e3U612; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUWXN/28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8e3U612"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ABNJlP1491255
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ol5IR1Aip1z35CTe1ZZdvuNeCl8yaycEOk4X8EMNnRs=; b=dUWXN/28H3Gtxug4
	ks41kiAke4JNBhKpMulTZDdrUnKYWHXkPzGTYn1fkasbP/PdAoYD5hX++Xc1kWwZ
	VMauhM3cYii9mZnp4PGhes7AfCoR8jGROnUt/GtpuDSsTm/eIMDDzLu5mtwrgVf3
	jPP+SCpIPoxKKLWeDucqIrr15Vn/9wVJo4VHekjxaYOMbZvJ+FSZc6dJPR9Dnhyv
	LlitetEZNfFG2feFczsldwHOu1lV/EHndPCsVzh8b+1oj6wIuqiMiD6EClifE7Xl
	SoSeMda94TdwCrgjgeuteZlc/LejPc07cqR9JY6GutmOO9K9zvOGCiAp5ivZlcqu
	em2RlA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2seh8uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:02:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso4502429b3a.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781092957; x=1781697757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ol5IR1Aip1z35CTe1ZZdvuNeCl8yaycEOk4X8EMNnRs=;
        b=L8e3U612DLvib8hEIzZGEapMpB6gGJ5HquQ8Kbq8k/RN3rtzn6QZsDZkzypFEoN+nx
         V6eWPZ2IPabAlfcYGOF0CrROOUHOGPmmWr+RpzamamwV2r36DLuGT1/C/MP5H2E9XRgK
         SWuPW2vb7RBcxkF16lO/7FHaiUgGAsZRxXqU4XCUTQJfAgyGOPvavQyfM+uqmTf/Z4Hn
         sUw9LakynUpv7ad0BRgMB0cmw9bvhCFwari/OQJOiJ/bwFtvLI5syqloYodwnjmiBJFc
         y8dUC5RYu7vlt64ipCPvw3M38LfVXgJK3TzQ52bWuoQqC7EojOu04vfEM+fqiyrM7JZV
         jjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092957; x=1781697757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol5IR1Aip1z35CTe1ZZdvuNeCl8yaycEOk4X8EMNnRs=;
        b=aDuimhLewquz/XNaeajf47xhcrjNDARpuQbSXaCA7G3JBO5U7yyIQqsF6sDOtjBctu
         WKHgJMGUBs6nFz2qnbYwDpdWmjcz7Y+0dng/dl5EmFZvIBSz0iUm/wd0Y9Ri2S0VBnWt
         QQ0TYlaxg4vAnKX1nAnPHExqVrwx7PMEGqMOV/Btj2bRUSH4rQDsnKSrZF2bsSXIzPGI
         dCGmtekbtchPhLBp/erOwtcfosR32sF78vIJ431Bjysa79SPc5sJbcc0rilk75Hea6fm
         LlN6cQCZ/s6VCWzUKwJhixDRfwTmfKqOKDYzgYiXcuvpqEox/9OkgxsUowmZtFPw7Ds8
         i12w==
X-Forwarded-Encrypted: i=1; AFNElJ88nOw/4b7jLkVVgVcSG+k21YtXFyXpgEbbVFum4XrKcOM4Chbq/Q/lQAj542l9Dhuac+0WkRqCzZdL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1TTVqJvMkmJC2YEe4l0esDpgx4h2OJD6IJSzeq/QXJk+nIdHl
	IOBFc8mRk0yEOUT4ljr85KzLyGLHAvekauOFjx8/xMvn3MCbsIMIUeGOigoHD/4lo9FRFz0Rih9
	u0aLscoTK0Dt3yVeqfYpSLKdkIaRch4ylYkBND5laTMZdnoyUgQ7nhBslMWo+eUzz
X-Gm-Gg: Acq92OE7v7/55I3YimqcppiZSQohXESt/1yiVIxroLYdJk4oUtWM26rKdduPbue5/t5
	PqOsamsaewixcWCQviCWR1T+9O9ZSlgqKlEd6fXITAuIP3DwG2KgZxUrv8z+TccqPh9sonllax6
	G5qPUBXlKMGkXTNUHR5Rn5EVZwyMklofchA+Eh0rCPSxrTwg4YirnDgawZnO95K6vG9LzSECmKg
	6PyYRCkvTY/cTRCBEhQMQqSRv68EJDxuDKYInvHV/PAOokenJ1IVy881oh3bYbsYz1nqULIs6x0
	O+mDLmr10l/GXt0VkMqREUyU3cSOXPzDezU7/O/ZMIvOHDbcVLEsIUIMhi2wpzyBooH3B8wIWPa
	s3N/DS7zhtCKgOfCG0/ejjMPGuYdFTqfXquBztu4RP+gxKi9YTBxxu89IiNCKfZM=
X-Received: by 2002:a05:6a00:c91:b0:842:4327:6cfb with SMTP id d2e1a72fcca58-842b0feb656mr25453910b3a.46.1781092957183;
        Wed, 10 Jun 2026 05:02:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:c91:b0:842:4327:6cfb with SMTP id d2e1a72fcca58-842b0feb656mr25453772b3a.46.1781092956257;
        Wed, 10 Jun 2026 05:02:36 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221cc3dsm24523372b3a.1.2026.06.10.05.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:02:35 -0700 (PDT)
Message-ID: <0593ec29-b670-46e6-8eaf-a146e96a719f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 17:32:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <ujf53zya6hes3hkddhsmgu4wyabodnyg3zdwarxmcsoy6p5h3c@ild34ppiyvre>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <ujf53zya6hes3hkddhsmgu4wyabodnyg3zdwarxmcsoy6p5h3c@ild34ppiyvre>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bieAiTM09x6CZ8c-0pgwq3ODQeUZAj_B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExNCBTYWx0ZWRfX8LFv48b+ABWO
 uKt9fiud5RQ6iufLdDZm2M8NfPZ/xtmQWEEx214NddKBMSuGz1RliZS7CT7kCwCV1xUF7TcTJSk
 EPkJ1lxGMhePq621hhKpJrXKcZwARiMF+S9DDlvdo3g4SFEojmJjQje4Yaib20zo8GE2kmOwgqm
 EJrCvCkgCYNu5llTJ+r4nbu1UvT3kHJRYibvGPepxv62OixPrKtlp8vIx9f75bxxF+V5rA8VGsK
 +k6kX8KBWBct4eYbOytKlNRnhSkF9NaMgYy4Nx43kvWM5CPDzEHxusdlSgbeXcfv9sgmcIhVArZ
 wFjjRaSwtFs7EzhKNM03bfhiX5EBBZ6wF8ETrHywfHNvcFmhg0anR9S73ZGfOSeSaGKejPVp3j4
 vA1x4TjH6RMR2cIO+8gxKF0tEg+ZHBbNS2lrAfSRPXLR9hCCIp9oXK2A8NPSyZwDanHbWhtXYF4
 oCNwYpyvg7lB8etbZjg==
X-Proofpoint-ORIG-GUID: bieAiTM09x6CZ8c-0pgwq3ODQeUZAj_B
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a29525e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AQWUehsJRALLLA6uX2EA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100114



On 6/9/2026 4:17 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 03:52:56PM +0530, Gaurav Kohli wrote:
>> Document Qualcomm PAS remoteproc thermal mitigation properties used for
>> QMI-based throttling.
>>
>> Add:
>> - #cooling-cells (2 or 3)
>> - tmd-names (thermal mitigation device names)
> 
> Describe _why_ you are performing these changes. For example. why do we
> need to handle two different cases for the #cooling-cells?
> 

Thanks Dmitry for review, Ack.

>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,pas-common.yaml    | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index 4607b459131b..0d07a0750762 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -79,6 +79,20 @@ properties:
>>         channels and devices related to the ADSP.
>>       unevaluatedProperties: false
>>   
>> +  '#cooling-cells':
>> +    description:
>> +      Number of cooling cells; 2 for min/max cooling state and 3 when
>> +      selecting a thermal mitigation device index.
>> +    enum: [2, 3]
>> +
>> +  tmd-names:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
>> +    description:
>> +      Names of the thermal mitigation devices available in remote processor
>> +      subsystem.
>> +    minItems: 1
>> +    maxItems: 5
> 
> Missing example with these properties.
> 

Thanks, will add example.

>> +
>>     glink-edge:
>>       $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>>       description:
>>
>> -- 
>> 2.34.1
>>
> 

