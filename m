Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E925847B439
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259238; cv=none; b=mrsWB99uGx47Ijh63o90qGBQYg5SUEUeVOqnEcdnejsdTxjxDqORRbF93LeLCbuGZFNrTxq/484XSbRnZsuckkSyXbMFzHiUii51knWpA8nK2dW3cb61FgpJt7co3skGBIl9hlEorcdf1bZvzUec71fDWtHTet8umHYT0sO10UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259238; c=relaxed/simple;
	bh=xszAzpPB/8wB2ZU3+7zZIkbSXKAfS6N15bO/2mtZhow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HvB2uqiSjPyAk6cTN9BhAmW+fU5H0rT3fTQXNS6E9avTQAS443mRcb+L20UoHfsmivt07qCJbCpZzPcUZy+FtZHFVDvDwzc0gK75rXwXvHIy8WRWjBVrHLcDoN8H36yObdYrMDtNS8u+N6vpPN1lkJjZpIwfLXZYBDIDWCbD6Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0Bzk9lI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdZg8kEE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0Bzk9lI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdZg8kEE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJCJ73406525
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 10:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hxDRBSBRVK3WBdeGvq3gY+7hIJoDgMgpm6vjxtzaRS0=; b=l0Bzk9lIegBfmvRN
	rZKPQjfA6NwTdYst3Dyzpn0f+0GSvY6sIKOx+JcTBR4ed0PrQP+H5Zb1irLgtTcU
	nORQScvNIMQXWOFpa5ayfOkLBjOvp2eYM9VuZ+YdTzFVHXqaWXEYx7STFakNPh3/
	zRfhLWNqULuIuXVg55bj+sL1YbilZo07CK7KDjnNl+hvwtKfKWmeVAawWdT8yMZf
	YnLwTtilfSdCFDPZJPxez4ALEA6R6exAQHrLzkSKfsvM1uWB9Zam4fobq3TjUlF7
	W0GKZAngaXOqeIWsCUioEQPvVEwbGSobv6uXVQ4V2EIMEslocxCxJj307tDZe89H
	jrsafA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu114d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:40:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1387500a91.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 03:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788259235; x=1788864035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxDRBSBRVK3WBdeGvq3gY+7hIJoDgMgpm6vjxtzaRS0=;
        b=XdZg8kEE6+QFbZO1v+EmgHu7Cn3um+8JT+Q1B0mUcBWIfWxQVsXjyO0HD5JusNQttG
         k/e5j3ZOh5dKNSSkANFdjBQ0yIL5MuRJGAxfysh9PVXjTkmoUlCXhAa78mRAReqN8lWN
         IPTKODE/z8ceTiKneL9g1j+e+juNJgbz2/XUQb+XLID3e6/26MHpr1A2MI6+S23GlMw9
         Dp7HK7oV3a2nP5Imca0pQqvG5FPj2F5Y396wz9faF85o97ngvDEtivQ7YpvM4jASecf1
         aqGVUmnJDX0rdOK7FHvZ/c9BM0TdR6Mchua2MHRsMO9D5GJFOf/DkJSi+Kou6C5fTgAU
         A4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788259235; x=1788864035;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxDRBSBRVK3WBdeGvq3gY+7hIJoDgMgpm6vjxtzaRS0=;
        b=HAQI6zUGBaSho7B6GmIHVvlDh+/sAv46BMSdOFAgFPjbHux5SFBabweJ4Tse8VuaaH
         9PxGaaDJLZMIW5SnDWTnCmuL6B8Tg5ybtz8g8NV3mn74JuutOkfzzvZRpuJNHjn4PSYb
         1nm8uBwRxUrqyRMFF96loHRnpj3R+4FkSoKN2n3Frc+YT5IXII2w2iVau3WBK4qM/sT3
         PMaQLvc2e06/rK3R1PihRttCzLBXwLBE2cl9LSATz+ksO6dDQNZkk8+RrBfHsY6JIxTz
         g3RTXHmZHKQ7o8a31+wXwhtpBbAhZR14wsKvy2apW8XsqRpgZKDQ0qaDA/euKWR62MwS
         p2rw==
X-Forwarded-Encrypted: i=1; AKwUvBxBXK3kFOvveqoduoEhvY2PDMBYbr1oXNpQwCeE78aEPpQEZED2wYQxwIAFRW6/ve0JSMyRPgeDFNF7@vger.kernel.org
X-Gm-Message-State: AFuF++kmnvI5UVro8z7rFebaukzO1Mi/ebv6U0kJF/6XiRJ5hfclNTYl
	PokT6aY3wWuNiCkevJhu12rbvf3+yEX/TSuW5pbe1+dHf4fVsLusaApTJzbOGfA6f1XHvpyIYji
	tumkOYCVC8AGTZwvvuGbgohGJAfMbuMvR9z/tanQ3aJPrkRISnndVyhTd4uJqyeHH
X-Gm-Gg: AYBFou0C3W5DcGxZecO/VKVkJxU9lZFRK8KStiiIbugGaYi0QMYKITY9mIxshupzPqp
	sdbHsC6Gq3C2YoulzskfDpOCW7hoP/gvTc75jY8tNQR7EN4ZDRE+X9uWdz30Rd1v1ovSyQ6gWbP
	ilkQVpRbaGZKxb+RgerMO2IDPqRH7uk8tneVciDfGtIPig4J9C/1hGJkyWoRA1GVnAkybsN83fD
	WvHGrVYoMtmVQK/o1oqK9HQwfCr0tBkKcJHMFZZfprSE36cOdzapmp0N9mTGVG25HJnI7B7Fbwg
	b9QW6IWUqT3ddLpauesCnJ3qYXYPd5ApQSLXy0G9dVtrjftlRNAV4npwZE8rmXQ7j0OSewjNvFW
	NbyX2oxqY5uHsget1HnJcNrOetn5WIMy0uPcpuil18kF2KtcZmIKWdobl
X-Received: by 2002:a17:90b:584f:b0:398:9beb:a2b7 with SMTP id 98e67ed59e1d1-3990f90df1bmr4602623a91.25.1788259235132;
        Tue, 01 Sep 2026 03:40:35 -0700 (PDT)
X-Received: by 2002:a17:90b:584f:b0:398:9beb:a2b7 with SMTP id 98e67ed59e1d1-3990f90df1bmr4602571a91.25.1788259234570;
        Tue, 01 Sep 2026 03:40:34 -0700 (PDT)
Received: from [10.110.34.210] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30690555eec.4.2026.09.01.03.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:40:33 -0700 (PDT)
Message-ID: <db1488a2-deb8-461d-b77d-849da2783edb@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:40:26 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/11] dt-bindings: soc: qcom: add binding for
 qcom,crypto-virt
To: Krzysztof Kozlowski <krzk@kernel.org>, ebiggers@kernel.org,
        axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827160806.1295313-5-linlin.zhang@oss.qualcomm.com>
 <bf36b0b7-d6c3-4731-b00c-c3a4c02ffc76@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <bf36b0b7-d6c3-4731-b00c-c3a4c02ffc76@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5NCBTYWx0ZWRfX4ZJO4CBI5LKy
 4nKa2TRB/fNy+gtFWimluVgZrn/YIPN2N8ZyygzgKFzOea4yOsFNsT4GMs4h8txVCBRAzOpmBnl
 jF+9nVXFvTxKxO4dtEzHVuJPKnaoDINik0vaZXz3a1KwgrJjWzwmp2c93bpAYvrQkYEV3O37mR1
 2gwDcOuvCqTaH9cETk5Ay4JWmoiB8/KuCNpZSCUVCxAU2SpGhS5WR/u+YSKUn4OO4PxSXpe0zhX
 LHWAO/a3Kloduu7p40FLlt5Qp6M9/j9/4zgPl6sMQF6t79dWSsDND3iPReFUxeLeYkQ4WZp2g1d
 Yr0XQva/e7q6OtW2lLIKctBP6I2SS+wjHuReSawK0e3vTxGizx9sAUHwa7Ku1I23y/FEVk3NDME
 VbTYbQXb926vJ9ZshQNhTlxmVYCwCyLzxENl1ji4m8uC6sEf9PhbiSfJZnojRENlLxfOAbefygv
 duv3wqGVbqLrsf2iF6w==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96aba3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=s59Ba9DYA-YjRSie7ucA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5NCBTYWx0ZWRfX4EVq1EE9owgC
 W3Fw8UtAybp9jDSb6oOcXsxfl12ua9COJrGLuVk/oz8dBmDSsf13Wx1o3sJxrgl0s1UCyVEAm7e
 4TV5R089ZNoH8WDKVApvtlbTzdxX7u8=
X-Proofpoint-ORIG-GUID: 9Ljv-42iforxHG03FNLE44ZLqhwuLdq2
X-Proofpoint-GUID: 9Ljv-42iforxHG03FNLE44ZLqhwuLdq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010094



On 8/31/2026 3:01 PM, Krzysztof Kozlowski wrote:
> On 27/08/2026 18:07, Linlin Zhang wrote:
>> From: linlzhan <linlin.zhang@oss.qualcomm.com>
>>
>> Document the device tree binding for the Qualcomm GVM crypto-virt node,
>> which provides the wrapped-key buffer size needed by the QCOM_CRYPTO_VIRT
>> driver to perform hardware-wrapped-key SCM operations backing virtio_blk's
>> inline crypto layer.
>>
>> The host does not report this size over virtio, so it is supplied via DT
>> through the optional qcom,wrapped-key-size property.
>>
>> Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
> 
> Your Git does not look like properly configured.

ACK

> 
>> ---
>>  .../bindings/soc/qcom/qcom,crypto-virt.yaml   | 39 +++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml
>> new file mode 100644
>> index 000000000000..5eb204f29762
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml
>> @@ -0,0 +1,39 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/qcom/qcom,crypto-virt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: QCOM GVM Crypto Virt driver
> 
> We do not take bindings for drivers. Follow standard rules for bindings,
> e.g. read DTS101 slides.
> 
Thanks for your comments!

I understand the concern about introducing a DT binding for a software-only
driver. The motivation behind this binding is to provide vendor-specific
wrapped-key information to the guest, since the guest cannot discover it
directly from the ICE hardware.

I provided more details in my reply on the previous patch and in the cover
letter. If current out-of-band key operation handling is approved, I'll
revisit the design and consider whether there is a more appropriate mechanism
that does not require a DT binding, maybe move the slot mapping table to
Trust Zone, Linux kernel only need gets them via SMC request, then don't need
dt-bindings change.

> Also:
> drop second/last, redundant "binding for". The "dt-bindings" prefix is
> already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> Just describe the hardware (not drivers)

ACK
> 
> 
> Best regards,
> Krzysztof

