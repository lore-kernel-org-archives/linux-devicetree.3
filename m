Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB241373BE7
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779250327; cv=none; b=CmPX0ik6mgAjZeJLQOvSncXJ3DeNWyrrXZJxoNDKTQYu3CAc0LCwb0W8Me15o/RJC74E+USCMbaQgWcEfS9/dlgyRdxyPhLn0+atDN0XZaNx/11+/tCP5PIywl/zG1oK/Dn1pq4CkXkrZJBwR8Vmxa4D9Kq4ONUuuTmjpbtAuzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779250327; c=relaxed/simple;
	bh=hRI6xWNJhE5ETvgqRxmnzoAXjP1dG9fiu+8Iq8NoKVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFxozK1Y2NoOrtfiiGO3OZg5H7WbIT2vo5BCTUBWJ2aZvV4xonfa/EH0Pj0KzflBUQ3oKDN2LOGNMXs8iiP9NthB/kP7bbMXQiURaOvyEf5jQiCyzzhzJAdopYGbUnqvNRYvRcX0YZJyimr5/HZPvkKaWBmWFwOHZVONMM2T5O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvNIbbCC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/W2xhep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvNIbbCC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/W2xhep"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JLkvCu1725756
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BgEDiQF38ipxx7swqVfhVvhL/Rs0sn4zwDldOHSa3cA=; b=mvNIbbCC/Vgc7nXs
	kN3VOfJo460AA0qwx/oPDrMtQUcpyls0+QNmcRhs/j9pOxxqnCPTPQhIoSZk+gMx
	Q4QcQiLM+Sc7Zk5DXRxDSWsRvvuKbIuW9pKBN718ZQYiTQYo/UvZHR31OMp9lDYD
	NCDTiOy4mhRRXqObO+SKjC9BYkJuA3wov+1+zUP12Emd1Pc3N3K4fcTQdVyMV/fR
	YLQQZxViyC03azYq5JdpkARKikuKTrwkHaT5e/iQ3EEM29tL50+ARFhL4PYZ9ZxR
	6OIiUxmWKJk/x0XafkrcBLNLlvVKPCaLfPGDRZTLfed5bq+5q9YjDRGqgVZKJtHR
	7Ercnw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qjv3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:12:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso7153833b3a.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 21:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779250321; x=1779855121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgEDiQF38ipxx7swqVfhVvhL/Rs0sn4zwDldOHSa3cA=;
        b=a/W2xhepNSCollPZV7nHb7NIEs1T8hs/wz+dNB6pbgPy0M/WXcP8M/sKCj8XFvYpcR
         aks66DHQEf+fjOE5yxju3I6ChRl+8PH6j8hFxc2IySponuQ7YTShfkgJQxXJbO4Doa2o
         5vmJzmkbFBlzR7irBZgjSbpzZD+B9t3xZ9j4ndmDAO8LpO5aqjBOejgzvctfh2APB1Vg
         g8Xogj9NwBEPCWLXgid3vUKx9f8O0kHIA/Q9uY80gLdAOn3oDWnMlaVZx2vhNEztjdkD
         cx8nhFoybNGORg1anFrnBtDGo/C4ywJ3GsvPNVkcsciU0AGzWSn6Sg51nwAmRAoMOEgz
         sU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779250321; x=1779855121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgEDiQF38ipxx7swqVfhVvhL/Rs0sn4zwDldOHSa3cA=;
        b=OiPOILh3JVq4LmfftY1w/OD/JZeZAmUMEPO2j6WnXQLSUNJNzHAjEXEMOGcx4O4KvU
         woWEoK6em9WVjCL4NA8sD1wQy3Ujio1fUOoG8QYUFzg/TDVed/oRFG13mF1M2d7QDdTq
         ZU86HEKY+PqpCASfe7iG0/zlFjrrfKAhrmQh2siO1jn+rTLAVywy805ySJfuliUEUEoo
         VfJoLZ+wGKLeP9ZcPOjxk+JCH/PRUQhbCGUzZ50z2yVi6feFAOot9pGjDt1AedeZCYac
         Efbb5+oHR9DjUkC4x4RZ6DkovcFmKpej/VeUdtaT5kmoW2ntIAh1lTTvgEdRZrG8clxL
         ULeQ==
X-Gm-Message-State: AOJu0Yzd1I6nF2rg8Uz4Zrw0tRPiwKs8fvsPzH8IpLyKfflmslCTxvWA
	AZZp+M+kM8oPomyCxz5Vb2sKdRw52tEuI2fymj1FahIZUpzS/KufOFh+3S+XWADaiSD81tVuo+X
	45L9XHB0IM0zZ+RovjIDV0HfyQvl0Rxy6ig49rTX5ppV+hVyAWuSrNBXkfRVGM0Y4gEdFg1I5Ta
	U=
X-Gm-Gg: Acq92OE6fs6gHK3jSfpzEgcX8B5KnMYm7zuzsBK1E9DQ9Yp5Wj0SoalFVgmKI9hpbMx
	H9t9JoI1oFRxZllq3kEbnemWFKQ3tDwiEE5kYhTdRqbzm3M1SOwfMJrMr+MDcK9oq+cMsIdkglZ
	OnSKKCAjJ6CHswONJB3nffNtuqNRQ/9qd1i0StWuxI5wLED6stjDe3JrhnuZWMnHkQiQEiRcQFt
	RcC+GRdhEhadXjiZ3YYPnzvGw6TBclW1YEevHxXfhU7oeFRtUmXBf2HdMukykmDozIv/MKXUrFc
	J3Xcxm9gvBXwMNyxVRIwurFZgz2cJZwNYVG19ZwkunNTKQq818ZU+U9m6pO0n3flHnwiLPauTfT
	GSxpMA+X31Fl3HeAftRv6Mchm9TV9tWnPbGiF8Gm+GB/YTbpXRoAGTijcHKXjvNhCqa3zLVnJg7
	lEwNsL8OiwS2EXTr+3
X-Received: by 2002:a05:6a00:448a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83f33dee8b8mr22252083b3a.40.1779250321070;
        Tue, 19 May 2026 21:12:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:448a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83f33dee8b8mr22252050b3a.40.1779250320584;
        Tue, 19 May 2026 21:12:00 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm18569319b3a.39.2026.05.19.21.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 21:12:00 -0700 (PDT)
Message-ID: <7724b8c5-3822-4b98-a29c-bb4a99dd858a@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:11:55 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi SoC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        shengchao.guo@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>, yijie.yang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, tingwei.zhang@oss.qualcomm.com,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com>
 <177918447247.2753487.2425115852853158786.robh@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <177918447247.2753487.2425115852853158786.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAzNyBTYWx0ZWRfX5CX5ngtCS9a4
 xbmXhstXQH2+Bu6/ssRF70Yiht9D1kh4rIoFSG3sx1DlK0g8j0iVxCXkOdleGSBJCnoPiU9YeSM
 Fim0Pd9ihgJNfyOLV2IiDLY3AULTmdajk8kxOv5SPgjyW2IOHkj3ppiWLcrg2nILW+SLeEN14pN
 fgUbaFy0g6f6uC8On9F3sQdO27C9kjA+9fiO3MU2vOMIKG+cWk1Vmo+iZjKWfFH8duxvUB+NWaK
 ujVKjDJogYKD6P7cqbxgGNO9DUvw7dry9uYwlw7ArKYnXURotpWbri3ibcSB13sWO66F1iByjJe
 EMWeCtn/l949pcNtJ8MmopAdg1BaZuKba4OU4qM6k2tlebyFinZeBl68Pr3fZEEJmJJUR4Rw0v/
 bOfzD8VlWB6HXCvO/CVhQm6jFhvWzAVLkz09VDLfE0eNe1SKQB0Z6lhBYDIxu0MwttZIGlBrAIv
 2bS3P69I99dEBaSqPPA==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d3491 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: HkHafrTHy7Hwby6kun7e1VK_rIoNgI-2
X-Proofpoint-ORIG-GUID: HkHafrTHy7Hwby6kun7e1VK_rIoNgI-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200037



On 5/19/2026 5:54 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 19 May 2026 00:24:22 -0700, Jingyi Wang wrote:
>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>
>> Document SoCCP remote processor used on Hawi SoC which is fully
>> compatible with Kaanapali.
>>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml         | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
> 	'items' is a required property
> 	'minItems' is a required property
> 	'maxItems' is a required property
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Hi Rob,

Will fix in next version.

FYI, seems this err cannot be found on the latest 2026.4 schema, need to update
to the latest 2026.5.dev9+gdf9ad30c5 dev branch and reproduce this.

Thanks,
Jingyi









