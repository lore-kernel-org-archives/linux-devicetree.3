Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F64375ACB
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281671; cv=none; b=prL/w390oBdPcFijtUXpS2S2CobFaTs9n5+9iRJbysRxVK6wfXwDM2c0FVRSTfs7GkyG7fpxun4dTFdzshC6Of2vrkkpSRSJYgGA3VskppLLAtbb3ywfN6ozL+oea/O8J4Iv5L3z02SQOAk0GlRy9LOr6ENBwYtZqSpv4mmyp0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281671; c=relaxed/simple;
	bh=JMOHCzSskxk9SodFi+k5hXlCfeh6kYZnY4uBi7QGsPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evCcdxQ33Z6s1E0DkEUdwGOAMzcPE+/2xevDaxFx5qNT8iOf1b3Q1hBogyb/ZjBG0ulfBVvSEMXieW6N+tImVfGCsS3C7nnJ87OAd0D0k/aO7om+QCQiLuBlAnchQkDR/w43RqZvUJIMnMZt7aURo2Y6suwHs/SBDwpj8DB2bs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLRhJku1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXBR1HEK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLRhJku1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXBR1HEK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6wX882065271
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Dzs5PVghvmsHfh8+8zkBuOfRJJDmi8DS3v15nIcsg0=; b=MLRhJku1aJ3gq/oY
	mweYadyyR9zL/KTChTJ8P4QqqYv26Lvy6gpYAsML+RcW07POBE5pf9v/FQ7+cP4d
	SRn1BTNRxQy/GqsprlElfn7YLXhsuO+seP0KVIqMQ1kp2CmCibVQc3VGm37oYuny
	TSkE45EUT3FqKaUXS9zHTgLRORRipipk+S14Tz/hRhxcX5+A5yNLhc41J5ovh99g
	haXOKi4LGf9I2db+OpMES+nrRpQ5jpS9/ONAP0289OaLuaKzFyruUM0YGlrbWT9N
	Ji40TEFn1jIvxs5yOrs6mXyt2tihN567lTPiSH0wFOJqm/DN4yUh+X1tbQlXvpUC
	aCn9xw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4qdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:54:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827bda2e60so2741148a12.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779281668; x=1779886468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Dzs5PVghvmsHfh8+8zkBuOfRJJDmi8DS3v15nIcsg0=;
        b=GXBR1HEKONU+opCwizLLgNCh/ggG04MxUv860CWZYtrP0DW6oxXoNNQXhUxM3Qee29
         lEWxk+wTiiwyGrF7MoFaRZem38N0s8IT7srsCgGK1KO4AqPImf1BziaTSR7+hRDGvMKl
         GBJla0BomnmEm2FeDG+Yjyk5LQ+uRACWuMy5kkuPF6WoiQF9O0jBBR75j89Hjck0U7jn
         0xLdvVbf5X5lgjLOdlH6/L+BEqCCx6EKubocn0kqBrVsVLQcmKcVwu+GjoPEknJ1wWLl
         woeQQcSaM6ByvuaH0tZN5m4BpRTC+Mmr5T4Qs5E7EPPS3LJiCX4JbyqGiZ7L0oViuFja
         OyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281668; x=1779886468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Dzs5PVghvmsHfh8+8zkBuOfRJJDmi8DS3v15nIcsg0=;
        b=soWMdtet0pXPZcm4Jvh9DFXskoDIe6C+Vf7DWjgKLw1+uFxRECHcwgUZ4c2dXnZbpL
         8r+PJsi84evQ6nea413p9Bak3gfeXago5RgQKTSOSzVv6jHfzveQjblpqBzD0zhYdGPs
         xrr7Dv9Sx6JIe7qVMa8AEIT+ZG58SSG7khowC/cD368ARsLFi85B6QZr8ERe9nWLPApW
         sIlWBG3AAkxFcD61/5K1Yh/Zp1yuW+ebCIFIaod+zDKJkMyN53SLKmS3kG0/oQ8y+pi2
         mlF5sk/R/LXKwywDrop2EsMz4xiRJz7aGblWYw8KJgcuv14fspc6UhLEo7iUbalihNqT
         bl+g==
X-Forwarded-Encrypted: i=1; AFNElJ8mEhZy358L52g1CS7lnluY4BOsSpc7diDORc2XTWYgcU4EMlMzgtRnuDkV/LYmFsZOBMKRkJg0t6rh@vger.kernel.org
X-Gm-Message-State: AOJu0YxsuO64ZnPZnbK7Sm+9iECQO79H08ZS61i5kt2GdwuXSzc+JCo7
	VG8fg7T6JY5zLPu+UdSUBPQpO7lSYKRoaUGRB2yo5tEnC0IeGHCE7TMosyGPHaNcxxDeKigfHku
	8tCEKmR0f/sEqMx8ge8+OMrWjqE7U2CWprU4hrH0I2V5/yJ7dATUXy8DoO4Vyt6pH
X-Gm-Gg: Acq92OG+EQk6i0LJfG6y6ULbrZbQPeK3Vi8cBuhobIOxfIba7DtotDQM0jOKREomlT/
	FYfkY4yO8naVQOFJyHSWUiscxGo6HzIja/cUbibuOMjKHl+P3VHkzFCx6QLtPXy+rCoVPfY0VgC
	jTUfe4XqFOWGMjxDKMBQI35YXxIPgFcOl8mC572M+RqDmO4GSh2gEdN8SEIpc8/9uUtg5qkhc9M
	vkp5TOkj8MavTywmKjp357Whr/UKToXJ+dm4T1lyRxbtBlVZpAq2xCd+kMtCQyA7IYCiIVxTlU8
	A8o2boDhIML2qt8wEbUG3yRYNAnVaxampxdWQNdoLh+7YPZIs8Ecqa69GhhapQtboHREd5aeYYN
	RHsY7nEyCNIRF7A0DKBNnGYFcuZZqJfRVkKbZErn+a5gA9iEh0JQ=
X-Received: by 2002:a05:6a00:4508:b0:82f:3436:42d7 with SMTP id d2e1a72fcca58-83f33bcc799mr24430012b3a.2.1779281667720;
        Wed, 20 May 2026 05:54:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4508:b0:82f:3436:42d7 with SMTP id d2e1a72fcca58-83f33bcc799mr24429973b3a.2.1779281667121;
        Wed, 20 May 2026 05:54:27 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm21472794b3a.1.2026.05.20.05.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 05:54:26 -0700 (PDT)
Message-ID: <1ebc7c8a-b0de-4f25-b4dd-571909f9c67b@oss.qualcomm.com>
Date: Wed, 20 May 2026 18:24:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <ss3deh6wb4bjasig2r56bhl6opygpkid2ixztzdsegqgayuvdk@vgy4ytjzyife>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <ss3deh6wb4bjasig2r56bhl6opygpkid2ixztzdsegqgayuvdk@vgy4ytjzyife>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QvjgWDGi14st0fdFxxQvBRBeIf017x2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyNSBTYWx0ZWRfX2QVQ5a2JZvfW
 mvgNzOVb9W/jzvK7RvrrKbvuEKDRQ+ekoYaDaR92drRspqOJAJXLP3bBHALEiECXX9RaaGF+6lC
 kW6ud8srt1DRg2eCVt0/5YnrRlr68YuksPs25pou1kpfxDVjPAg/gYSBFDoI70BTg9oARW4LokU
 yiea6HhZs58jQhnuCKH4rvImHcpgbZhChvXO/+gXrGozpbjhma4Ov29ai4B5IWaAwaUeHCcA66/
 gHzazgwF5SbWCEGlOy1iTH1QrQUEjey6FKokWnNC8GWJ3M5BeFyn7DEbCSxFwSVx1w2vRqaRx1Q
 cnl0bxAjCii8CtrimK2SqTt9yNZcPW05jf9MFscB+/1CG6bMlD92gW9CXYjieg7lR8gHp+tzt1e
 p4mbj5W0iwTaxD6mEJQXahD/sOxbqVqO8+IhRu2W2i78Oq7huVPbDsD8ZTZlFibyic5oXvS2VA4
 bYJkZNpHlInV9ogIaVg==
X-Proofpoint-ORIG-GUID: QvjgWDGi14st0fdFxxQvBRBeIf017x2c
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0daf04 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6rjBTs_pIWsmsDHkzHgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200125

Hi Dmitry,

On 5/18/2026 9:53 PM, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
>> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
>> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
>>
>> The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
>> supply (vddi), positive LCD bias supply (avdd) and negative LCD bias
>> supply (avee). The panel operates in video burst mode with four data
>> lanes using RGB888 pixel format.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> ---
>>   .../bindings/display/panel/ilitek,ili7807s.yaml    | 80 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  7 ++
>>   2 files changed, 87 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
>> new file mode 100644
>> index 000000000000..93c511d03c00
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
>> @@ -0,0 +1,80 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili7807s.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Ilitek ILI7807S-based DSI panels
>> +
>> +maintainers:
>> +  - Arpit Saini <arpit.saini@oss.qualcomm.com>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - dlc,dlc0697
>> +      - const: ilitek,ili7807s
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: DSI virtual channel
>> +
>> +  reset-gpios: true
>> +
>> +  backlight-en-gpios:
>> +    description: Backlight enable GPIO (active high)
> 
> Is this actual GPIO or the GPIO-controlled supply?
> 
Addressed here 
https://lore.kernel.org/all/dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com/

Thanks
Arpit


