Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A243E6DC3
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701854; cv=none; b=c8M8On3wRwRK5OayrCt6Y87gc8dkaFSkwbutyrXJ8IEfM3VYXinw6T//oB3QTiOeKMjQyYyCmt3I7npBPEHljz9zTghXFnWiHrUQT58nXepL/+98+0+phQvbRQE/20qpSH/flVd/p90vCExgQmASTpHH3H7LISNl8cBscEisgAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701854; c=relaxed/simple;
	bh=AcXHzPxq5UR5HDp0KL9txljJc46sYueXNGbCyEGAhBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfjG3Zxk+uUCXlfwxvcB/t+sIZJsaSzm/QQitd9j9TdZpVGrrnaaTkhW8fiqu5PCS6NTvSSVTJ90SCAGknFduRUlDch0nziI6QkALRyj96TdIJW1BdbkVlnL/9BIYAQe7bY+mYuEZD2+YrKXFBZfBaaeZ7UC7NyD0X4K20oAJ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQw2kWZb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGuTmuGk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQw2kWZb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGuTmuGk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7Fst3419389
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOQIvvm1gvabh9O4nNnnFAMEBC9uqf0uaqK5rtlsLZE=; b=FQw2kWZbw3beSEaZ
	5QsdI4wq2NGPeMRVlD4hEz5GazUuS4huUnsPmJdvHIRiMRCGL9ZSVwVB0NVmeHRx
	wVEMfDDjlNtE8vbCi6X16xfgjI4cfUCzPPzQJmBspGNKbYIg8bzOJNg6xby0OcPv
	HZTAoW06dxlrNnXFnLN5UtDo22m880Fij6WAFEK/YigLY+cL/0mVgxcjuoxXecmf
	ZJjC8iSpEKUOFvVlk3ZnhAd3Odiu6acPuazbbc/ZaZbo9jRkVmd/F6dh5EBvVdhL
	xqnuauzu761unPAlEXBABTjOhiGSm7PwK2KIRrMkz2zafgRmEG5H5O+w0UFV2XgP
	Ez55ZQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386p9hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:37:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c828cee4fcdso4446809a12.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701851; x=1780306651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOQIvvm1gvabh9O4nNnnFAMEBC9uqf0uaqK5rtlsLZE=;
        b=DGuTmuGk0r47y0nK8HkIgHQpJZiUa5wH2ZuR0yYpOliFsE+i/4sUycaYG39mFgm4Cf
         grTNnlDt9C/AeNDkf6BMbhFJGIj+D0NJtqEeQUD1B3Zv3436gxXQEjRmW2HxCUID0+pW
         Fw+Zv9g05flW05o755w8nsiYqd7fxAiKXDwX7CF2/0Fc4rBirdJAC8Z2rUUE3T9NwL2p
         d5uJPeOqXgBmPMq7DjI88LaF+Wvh41QvaPdyXxQR2SND5vYhq3fKEKwJSrpcyhrgOWZZ
         RFMJ3qff8EGTg+tTEyXC4sD77X2yxKEsFscl42gL+Np71xSxDT3kkU9zDLDKlI7ZAi6A
         yfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701851; x=1780306651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOQIvvm1gvabh9O4nNnnFAMEBC9uqf0uaqK5rtlsLZE=;
        b=JOujVoIBgdHoLqUIxM66OYOAj5JhGmuXy1ZBPeErx41ijPx3eE/KD2uvvSbZ2KxFEa
         okEgTI5uuU5mOiracOvhojZ0ImToYo3FOC+uLvqAEGOBxECTn8+nkXspKSPMNPcqQ8eG
         h0qR95PdgVQSODUH6jBw+vItAoKCjja3+Sczwq7PSD+VyYuZbnzlLUJYDYuV5rBUvdWc
         kemc4YlEK2GaTYUQ3jR5UZnqjlcfi5UDNyszxcg8mQQDSSoDU2SuSS8owIgprS95NAc3
         5cto+WRztWDv/9h2M0pet44smgA6kQn+T569euv0G2xC6gxoQMzuC53SGMHZEHCWr19F
         XAPw==
X-Forwarded-Encrypted: i=1; AFNElJ9EGPlQvb1wu3O1EES7AtgApqirURIsEuWct7cr+3kUkHsjgS4y3VQVDVE16VANJJzrRrrAKz98rmHk@vger.kernel.org
X-Gm-Message-State: AOJu0YyVifrfIGN7Hy/n5iA1FPB0Fe9xN2TALV2T6bxs0MJyeluOxxIP
	QyaK16K4Zk7Qgi/UoaE6O3GzRcxJVKGrXMQ1HcgCyITlzs1l+dn1btQNc+6Od7JaNRlCxtuZnGa
	NYuTSFZIdj1W7bkECWT5oa+9kwxqZxqV6+bF4auwEwkP1rCGMcx4cyR2pFABcxvdU
X-Gm-Gg: Acq92OGo1rzect0JgUq6pcfqQSFSRUr7KHrmp52K+bmmuzYMUwjmFLaSo7fijSsCE0p
	5ztJptQvbd4y+m3aV3ii1O9wV4HQliw0bvNAHd72DUGPVYaDTJktHfXon7OeKxGSBI6356fxwyt
	qodcMdSeAphyQdpnZ99PGCihCGSk+qq2lv2g22YODOVONfWmZkDB4qpgzKHbBk3jAQsif5O7PrX
	UHsZmcdKCJkHcSWFoo/25zOszi/yrmzssIVgNtdhxIrHSQwuD0Q4Zoq4lC02hhn2qqMl3bjSGIL
	c5gC1JzMz2iBWe8afenoZrvgOToL6hSJodb0F/WNaKvFNC9nIGpJdCNQ/Qafbj6QLjVuNdX+TCy
	2rG7Qkf9ZslS/kgP4NHSw7T74GvwJ4+tnxrhBOHStNlCNDQ==
X-Received: by 2002:a05:6a00:ad8a:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-8415f1a06fdmr12494028b3a.21.1779701850597;
        Mon, 25 May 2026 02:37:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad8a:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-8415f1a06fdmr12494008b3a.21.1779701850131;
        Mon, 25 May 2026 02:37:30 -0700 (PDT)
Received: from [10.64.68.239] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb3083sm8990026b3a.43.2026.05.25.02.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:37:29 -0700 (PDT)
Message-ID: <a7b4c0ea-0e02-4ede-8d51-a4c038d55a5a@oss.qualcomm.com>
Date: Mon, 25 May 2026 17:37:23 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
 <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S00mEAgWZf6WdCjHG6ZB0bei3fP5V75m
X-Proofpoint-GUID: S00mEAgWZf6WdCjHG6ZB0bei3fP5V75m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5OCBTYWx0ZWRfXxd4/pSKyy1/C
 wsjUijXSVav7WALVcxdGfSX73TvpmplRX8BijWwfLcOuxhR5asuth2lN+Ajz1JXCs4uw3jkZxrq
 BfJlOxtmifEL3KPG4+MCejxbseeKdOTLnD6y8OSSHYkYwulIszHpRhvouuGuakOnIB8d1uzhtwE
 sLwOZ5UpqPTgdbmIaG/U/wBUwCRs2OBogYlu+NYtGrkxx9TyRxm/iOIktjzYl1TFRSWtlmIhhhc
 baxcDpO2DqA+XmCNS2gomKAREaE0ovsJJ7a3T9f8RLwWRtJxU0viGZZaJKCxrWGnqO7PTEyTJVE
 +TtNQmK600rTzbgaQqN5hril7WUqupIOpHNwpTmOGJpcsKkSlSUByvvx7PipWBupJ/U+8p1C0Im
 wCzWkkfB80ek4FZ4ER+x2sw2hTpZg2EUcgNckU8DM52ajVxo55LclLlD/cqewy4xUYxQSNy+AWO
 1iS4Z4ZL+LaYQW3UIFQ==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a14185b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=in8ZqU4PNEo4w4k2-loA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250098



On 5/25/2026 4:37 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 02:21:17PM +0800, Yijie Yang wrote:
>> Document compatible string for the FastRPC interface on the Qualcomm Maili
>> SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
>> fallback to Kaanapali.
> 
> Can I assume that it has the same bus width as Kaanapali?

Yes, the DMA width for CDSP and ADSP is the same. If you were referring 
to something other than the DMA width, please let me know.

> 
>>
>> Assisted-by: Claude:claude-opus-4-6
> 
> Claude assisting to write a one-liner patch? It's becoming ridiculous.

This patch was generated alongside a set of Maili-related patches and 
was not created specifically on its own.

> 
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index 2876fdd7c6e6..afe52296bf1d 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -26,6 +26,7 @@ properties:
>>             - enum:
>>                 - qcom,glymur-fastrpc
>>                 - qcom,hawi-fastrpc
>> +              - qcom,maili-fastrpc
>>             - const: qcom,kaanapali-fastrpc
>>   
>>     label:
>>
>> ---
>> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
>> change-id: 20260512-fastrpc-9f3b691f8e2d
>>
>> Best regards,
>> --
>> Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
> 

-- 
Best Regards,
Yijie

