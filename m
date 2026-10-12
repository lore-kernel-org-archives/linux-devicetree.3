Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2F383C86
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791782998; cv=none; b=G7F+Xi7bz51hqRMwhdiY7J0oat3806ErURlZVHralVBYgJOuNEJ+x1LBBmqlmn+GbosfFoVkyritfXWT7y+LaWgV/vZGTOzZ2Cupxd5nFTF7fcD19basw4Ok6qwWq28y33GjFPUNmdAoXhCrctalgbhixzJwGzfIliM9w0O2Ghg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791782998; c=relaxed/simple;
	bh=f59aOPOcbraWpl2EgIj8/jIf9DjGC5XVFOte3tulvao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LcKNybLP0T2zjtv7trGwpKoAgP/TqXbLWvxceqqFPKmmIkTY8WVm+0W/XAaHoXR8Zw+T4VcuUxE39Ue8MlskmIES/wxwrPakoF5Wu3DoAp23MVWBfFpNFN2ykuv9vtD9Ya6zylkNmZfFIJiz43U5kt4eZYt5aRZlkQzwT5E3zcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1vQINFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=glwNEaQC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1vQINFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="glwNEaQC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C56IQ71003060
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSZjEhlxbRcj3QUVbZ7iwR9kQWOUQNpT+xsX/Nm3vFA=; b=H1vQINFX3P8+fun8
	9jdru3hI4pQYT27qYUBkB4m9EFQo+eDE2tlE9b+S8MiorSDWSh9pBWcQDIjdZkyc
	IhWKKXMHB6mZMZLYeM5hpwL2KmMgiV/tH1X3XwOPlUl0eAWqIOrjCK0Ix8Zg7AbC
	EWpWzdsSXusMv+Aossir0oIDj+ckbv4dTMmFj9IHoAjv8fk2RpBhG00Aypms7/Nf
	4FFG1C9jz0RqzUKR+zPGhNRjEhh3Oc11d5Ehg/AyT9p1VFPaht621tj/Djf4KZJt
	xI5RCdm4fyTZiInQiAITkXQnPUHJtbQwu6h3Dk97FiqTL2PxV8j2v8PsgI5JPBeb
	0ItC+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkga1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:29:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e80f7acc67so15433195ad.2
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 22:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791782995; x=1792387795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSZjEhlxbRcj3QUVbZ7iwR9kQWOUQNpT+xsX/Nm3vFA=;
        b=glwNEaQCMa2pHrNo+7ldbzN7bDSF5lGsnBjgWwDnx6h4TVfcsi/qp6TaZeltz7xFYj
         9UNO07P9Z2XmT4wGqimFGKoP9wFO1BMr3rgNXgw8jbBfXaB/FgikiyXw4grJgqUvuPv1
         v/oLZRTSdSqKVHOz9js3EU8GQX9TQCFPAf1R8kxQRnMwniCk3xEsG5GHZOAK11vplZ7f
         12K6/JyuazOgYL10rAim9JtaTB41h7TZpf+CUz+nI9zbksFr3cWOkQSJXPY5NLqZOWQE
         uidjITF+76gM3EN7L1Mv+R+z6kupZnXdQ78VJlCNVzbh4tBQ5MsQQz9pif0Yxhsox4xy
         Snzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791782995; x=1792387795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSZjEhlxbRcj3QUVbZ7iwR9kQWOUQNpT+xsX/Nm3vFA=;
        b=Dx2+BU+HlsXv8HtVt3OaAeiYMMLz/sX637usYrRf49Oe/C+h6ZCZKojE0Bgvuc+1wj
         hrAyYr0QykC1Gs9i8eVJbAefM5ODBwSjz710TmoLManSJPKo+HPd+LZ6mbgcplOlKd+C
         WeFk3jAByBCbEY6nGZ3xHWUI+noU+FMFN3yqGM2IMz4AMWTJBTCzSUk1/foFec2f5Ute
         10i5/6GVjWvPGj+ZvQnVVb/5pxiyWLvMAkZfCJ8oAlw+DvPOTWgrHjT4WHEnDudZHIpn
         c54aSmlQsl27w3Ii7injC+qfU7EaIhafMBYNy/N8shnwhuRO6Mqk6pUrvTSCyys9orG9
         EjWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMaiBLa1/K/BXoPsaXHqHAVOD6Ej1v23Dn2+NfZCK7EBDWx0JeNxV2unuJUR+ivhlzbd+iKI5V88cT@vger.kernel.org
X-Gm-Message-State: AFq9FYL0+p35cogH7aa8o8YH9NwzPF2bWBCiGaQ075sAWkRntTcyHJcV
	r4tqeXnuo3Y29veDK6oP6Ebt1eqMTG5PQ0Q29Jb7UXSZtv5W6/4LkUAXc0KkJo7JdhtWEijLLy2
	KgzQUoHJjRS8Pfwpkr7+uEGkUNEzIqzvTLE0+Aqr+6X3D7HIykFGeEI2SsO0yltEy4UxwoLqj
X-Gm-Gg: AYBFou1Mg0n4l56RNbi5BCieaM5MfCaTe5Jd1X1g+Xfu+cdVPy43MbeX8nL4FHmQSTy
	Vrvl3UFDIcJMYJuLcWNF/JAfRaiN5//CU1ksRX8/mcbqZ9xsmMVEDHwa6GnVVpSVZYgu73TWKTN
	HsqihLIRHO8apkE3QomXsDvxdNd8SqOxMIce4TluPG5kUPrXnbwf4nj1I9KtvBjjaYSwGB/5S5T
	X9LMOQR5qQWxnuYQFkqJr1EEH2+h+vT/gCd5cU6VeDAjP6wsWn+FMhOw1tGZU6DPfn7zCDSCq1h
	c78OXSMOaSC71iNHHU9cydZcbr3EoHx3OVO0tLOEvDimz8afkwKEuaAOkLosSF+pSs/IPUriYut
	Pr0K1PmsA7cfTRvIDtcselV9lU700yBNYvA==
X-Received: by 2002:a17:903:2309:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2e8427f7723mr67059875ad.9.1791782994663;
        Sun, 11 Oct 2026 22:29:54 -0700 (PDT)
X-Received: by 2002:a17:903:2309:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2e8427f7723mr67059825ad.9.1791782994200;
        Sun, 11 Oct 2026 22:29:54 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e171bsm38699445ad.73.2026.10.11.22.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:29:53 -0700 (PDT)
Message-ID: <fb81a042-82b5-4565-9a5c-1a3c038a0d14@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:59:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-1-2c5797b5e4ac@oss.qualcomm.com>
 <20261009-brainy-alpaca-of-focus-31fbbd@quoll>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20261009-brainy-alpaca-of-focus-31fbbd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMSBTYWx0ZWRfXyMNXudDJ8uir
 c7VKUcVx0Ayh3ev/1g9XN66wYFD/AdzJV4+J5FC88kNA3fMnebcn7FDU6gy9AXSyXXAHuIYYHoI
 I9belLhp47FWqIuxq6qfiJ02JG8NOnLIZxvksKcR+9nlwtWpDP8U3PGkpUVXNCqtq0o0lmE8tzy
 5po8YDRZQq2ZFNM5+Mc/zC8mAoyWvYzjkQxtPdLthWgLHfa86G7hZH3rf1EgyaR5kDssA52f6ea
 HVSChoqrS7YGWT1Ln+lGBsm/+84XLjJXliGl08On1SoaFDUFSV9C4flY3pQbdAX1iDt8oIDV/2k
 lYzIuCGBGjC9ZjUdK/XssQMmqThKvpvuqHVeKDAbKtkKtxJYazQ4XMKKhTnpCgnBrwI3vH3OQqQ
 7ZFbRxMxwBzOCwjkKBdQCmwpUX8SH8PbWkoPU6PvGj3f+PAJAAjTtznH9+OOtLvf6bRH7+P0EUj
 OgT1GPfrZ9NcL0anjEw==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc7053 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WLwc7mworHJoPNN1NUUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMSBTYWx0ZWRfX0YLT9AnmY/hI
 AOmUtePZXIfddPRNvZ+63aBzjZh9FujQX/cYh4tUP6W9aH08bQkXS7ieL7GUT4+8IBS/ryK0ruA
 6lrTiMkx4JgipldtGMIzBWgRl/uuBDE=
X-Proofpoint-ORIG-GUID: p-RPjgEogYifEPg4WaKj80WBsbgelktO
X-Proofpoint-GUID: p-RPjgEogYifEPg4WaKj80WBsbgelktO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120021



On 10/9/2026 4:00 PM, Krzysztof Kozlowski wrote:
> On Thu, Oct 08, 2026 at 03:53:57PM +0530, Aaradhana Sahu wrote:
>> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
>> wireless device.
>>
>> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
>> platform device, even though the Wi-Fi hardware interfaces over PCIe.
>> Document the compatible string and the resources, including the Q6 remote
>> processor phandle, MSI interrupts, SMEM states and memory regions.
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>>  .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++
>>  1 file changed, 149 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
>> new file mode 100644
>> index 000000000000..97d8885333fa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
>> @@ -0,0 +1,149 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/wireless/qcom,qcn6432-wifi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies QCN6432 wireless device
>> +
>> +maintainers:
>> +  - Jeff Johnson <jjohnson@kernel.org>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 

Thanks for the review. I'll remove the unnecessary | from the description.

>> +  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
>> +  associated with the WCSS Q6 subsystem. The device is represented
>> +  as a platform device and uses MSI interrupts for its Copy Engine
>> +  (CE) and Data Path (DP) rings.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcn6432-wifi
> 
> Is there qcn6432-something-else as well? Neither commit msg nor
> description explain that.
> 
> Best regards,
> Krzysztof
> 

QCN6432 is a Wi-Fi device supported by the ath12k driver, and there are no
other variants requiring a separate compatible string.
Hence, qcom,qcn6432-wifi is used to identify this device.

