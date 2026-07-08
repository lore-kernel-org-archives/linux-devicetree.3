Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F5433BD2
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510432; cv=none; b=XlDcg4izJeAyLrUjCH3lq0DWhIOQbgU7FWO32/4dD0beFL0H1onF4w1tK6Yu9tnAX9HtxlRkuJpvdju1utj2mOlO/hIZ+hiU0gaEyRRfNpvOfAYcYp+p1bJZHCldXZiNrH7bhRCfWK+VnoGy4BcU7qt3eBpYzbgqFWIc0UDC2L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510432; c=relaxed/simple;
	bh=WfTaYLxK7jfmMuB95ifFmM7sae4YPR0LI5yVLCdGTYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjzf0xKG6D2HvPxF8j2Y1Mk0/h5SpSDy+9KAOUANW9SHgDo1TbmLV4zJ2vb5+kmTUD8j8Yx1AR/M+plHw3ymHEDnAOgSTaPNirggr+rHolBIv+K+3sKX5PJh66tUNoXjeFdRqYE69ycesmO/jxWZvMnQMhME/IHbkYn9+wBJ1zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo5/dN0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fycC4/JF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo5/dN0Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fycC4/JF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BSr0X2672587
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qtc7rp/gCFBd3NFusQUnJ7/sjXZcIqKr4x9KvvioeHI=; b=bo5/dN0ZyY/w/D7J
	OQSHL6Uyz1CRNumujBYga63rieFbHsELKU6lJi50N4kLA77WjZZml+OuaKUH5a7E
	VpAT8zS/Km0xeIfsQcKkWR1qw2TYflHlMyvLE6oOTg3mwdd/+KgIkC/Z8he7uF92
	M0zQaN74sBOZE3jZ+rmwrQMXpxlpYZ2JqBY2u7Q2rJi0ZR02e+W92wXI/LDzatSS
	RQCeimijkwl7IFwQXf8r2YlhPFaFvwzBlUpXDgxGZFKBYgM8MeRSrXJuy4kILOcO
	6IMdX7A3mvxcjcPj5ge0a8jDViq1kQXiHfMEvrHNCntgzZNpUMJXPXA2Iapicsyh
	aRPfWQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csst7kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:33:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845317fa7e6so1242112b3a.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510427; x=1784115227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qtc7rp/gCFBd3NFusQUnJ7/sjXZcIqKr4x9KvvioeHI=;
        b=fycC4/JFrktN1nFOZxF5By0ODVwjGNSW8ndyi+ir8ZVYOgDKEIxAStDiwInvm0I7wS
         MLUMwD6O4DqXPApcKiLvgxyik4Gsob48A6Z1YzupfmdEcx5maC8mtMDiSinIi/6ZEv2U
         E9aXIz+c7rns8p8H1ofBg9TFebqF/EwSBcWTUuiqdxdisWjLLlRIzXtcy/fpeMB1OK5o
         w4twKFR++gJ9pUZtPof4kzc4xaOWv9YIo5I8DNUNSirpJL8JRZJRi02eU+JTmkfPaN/e
         cJ2TRjckXorc0XUTEKGSSgD0pOE+FdGZmKLcRpvP5kgS4tu+uS3Iu+v6oihonKVptH9j
         ePMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510427; x=1784115227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qtc7rp/gCFBd3NFusQUnJ7/sjXZcIqKr4x9KvvioeHI=;
        b=UAMx8D9Sl22DwM7a5eYE2yUY7aQkmb7fcX1fK/Ncyn5QeU6mMR9g+3Ol5byqUP1MQ3
         Qv7XBEZLvWivII1ZjmDX1OO7Df0nWk5PpFCsXecSZJXIgWLvquIpDuJGGMDFUl1Bv69h
         t/TLh0WQk0sjoaZUN+yAQwLWrmGhZONfTuHnEhEKntL6m1fKFiqhfZBTeXIcRw56lrgJ
         BRGR1plxLb56LlzYcT7bod72+kt9y61ZVFwsomF1G8TaOrimXGWmUlSkoxLtD7KSq/0z
         Z4wEvThXBtqAxOxJGWrbaSDn/TAwdXWgkA09fYpBagLiA8De/t2tqay9e8KRm2bNp+A+
         ui/g==
X-Forwarded-Encrypted: i=1; AHgh+Ro8uyzYmqtM70UKMrGZMY9UoR1G0gt3n8UvZkprNE7EIstY/Va88PM/HlIngYZ3XuBIG+1CixQuNeKd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcmq5VdkWh7TObh7IEBzDZ3N4GJ767Mc/qvhEWGUkeXPsxdeoF
	ny5+YVYEXptSVqcCTAKWxsvyUnlRJfPQi5l2T5O1kVja0C9d5XsuNYvOU19Pstntwwb37pQrHMj
	B4/ks0L3LBHVLADSW1zLziGpW0Hx+1amzUBaZHXGLXMMzPMImKxkTWlg0hmaqRdqg
X-Gm-Gg: AfdE7cnTrW4Wq/Rz/HXlq/zrP0Q/2U8a7w27bFVwGjPD70uNsA6imcSUE1me18S5ec9
	hFwxQ4IU3QSVgZZwhOCU4M/I0AZny6e/w5hGv29qJhyexlyoXYFVtae4n9COp3e5ijvZRqQdXeD
	0p8XkxTGO8DxeIa4rXObYjLQY1AIij82rqW4b8XsQ94Mzpvhl6H4g9SlbBn7slt72RMpk+WYUfe
	hhscto/1JPJLpUf5LxfpXwfLy/X5YbtvuoGeE6+uoQT9SL7iLNGPUaBkqOckPxPmF4UVVVgv13E
	zh8Ua/BHvP19Np7lRdYtkKsEP6rLotW146ZIbYc1haQfdqe/VvmnnNFlBC6jOnsjXGOXvwQGW9m
	HvMFIRVR1INCUe4VZqcYFEMHqsLSjGD7Fl1EHaw==
X-Received: by 2002:a05:6a00:1795:b0:845:cb04:9cbf with SMTP id d2e1a72fcca58-84842fec8e2mr2468149b3a.39.1783510427511;
        Wed, 08 Jul 2026 04:33:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1795:b0:845:cb04:9cbf with SMTP id d2e1a72fcca58-84842fec8e2mr2468117b3a.39.1783510427037;
        Wed, 08 Jul 2026 04:33:47 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm693665b3a.22.2026.07.08.04.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:33:46 -0700 (PDT)
Message-ID: <6b42c4aa-bcee-474a-990f-f1fc2e77ae6c@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:03:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com, Luca Weiss <luca.weiss@fairphone.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
 <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
 <178343111013.2437204.2936966826993460040.robh@kernel.org>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <178343111013.2437204.2936966826993460040.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e359c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0awkmHLjsCMGZ7zvgVIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfXyT3ntS50wCsu
 /uv+VJmgjVa3IId/C1kBIcZNC33mnKR6/tnwYvL9dvzVFRitphwXxsVzrQys5DMzWmkEV7u72yr
 UDhMWUNMcirCx4sw0gUjDh2kyaoASBnRQsx39o71W/lrBVCTvtar9KGI08Xh3mtYgMruQveGFZK
 ZHaaJN7kMacLlwBxBW46muHXU88SUH+kH/343Te7hqVgRWPCrOPy1XTLxpYm0Sfsyhls5bFw/N/
 FG9NxgI6Ba2/VNSzU9IksB/Ug0fU8wNDJuwoRrIIVXynWV9Ud81qnc/daxTRumhvHlhw7Sxb9M4
 2wJ7nImh3XhkOBL4czRvdYyHpwY0nzommyZyH5Qhx2n9o5FXfGTw7xBlcMOZPZyfXx3tX0wtpj0
 sqGhHeSlJt0OEy+E2khUTfFf02MIaNaRDlB25mlHkmZPVKzlJXUx+br8N9wT711kB+mUT/xs1gU
 dxK1nNYHjWsDgkeHTTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfX4PpiPDCspeXw
 MDK95Y1ABQQkw8NlWbb6eCv6CXl7aNIkB6PVRT6tVfJ/7iijktPiMiGwDmfh7Rsi9s6KbkOFckb
 yQxhN0Sf+rJ2C0zohy3R0T/EkwmN9uQ=
X-Proofpoint-GUID: G_lu29xqD42z67-9wt4ISY3fMAvJEQN4
X-Proofpoint-ORIG-GUID: G_lu29xqD42z67-9wt4ISY3fMAvJEQN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080111



On 7/7/2026 7:01 PM, Rob Herring (Arm) wrote:
> 
> On Fri, 03 Jul 2026 13:00:28 +0530, Ravi Hothi wrote:
>> Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
>> Eliza has the same pin mux functions as Milos but uses a different
>> slew rate register layout where the slew rate field is in the same
>> GPIO config register rather than a separate dedicated register. As a
>> result, Eliza only has a single reg entry instead of two.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> ---
>>   .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 22 +++++++++++++++----
>>   1 file changed, 18 insertions(+), 4 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml: properties:compatible:oneOf: [{'const': 'qcom,milos-lpass-lpi-pinctrl'}, {'const': 'qcom,eliza-lpass-lpi-pinctrl'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
> 	hint: Use 'enum' rather than 'oneOf' + 'const' entries
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com
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

ACK, Will update in next version.

Thanks,
Ravi Hothi
