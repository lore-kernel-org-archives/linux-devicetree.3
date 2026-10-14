Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B5B4A5EBA
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963851; cv=none; b=TclruZmsA0K1A8czF2oMZVvL665O7Xcyv08yefHl4Xa23Sv8uIG/FCiu1GAGuP8q1+wmrYVbK1S/jxKLdodhcWMd9rRoTaQ/UbVQjiYJXRHSujit3QTUAM4S+0AHhb9QLuku2ONOkwxY/gVVxoncz86CRWIyrSNCfiDdKuvWRNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963851; c=relaxed/simple;
	bh=R3DH/W8/F1I1fomUgkc5UfikhrAkhPlZqLDVrdjbMIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqZIvu0lERU3DGjYBtlCb+D/rIhmvAPFTGhzXYkXsz5k8aun7NVPxIka74SNeLPVvxwoNN9NJq6+htBuKZsydyZG88DrbNu1yyHScDpB8Q0RivtoY4twmd6/XJyMnvn+3R/GUpZx9X5fMJ0Gxow9ugBX17K8seUV6yJwsWBm1Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lhcs8SBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7oDsdnA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lhcs8SBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7oDsdnA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E5x4pH3952148
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTOjT4OUOzapuo6XNz1VJi2V1U4HM1++DKOVSU+njqk=; b=Lhcs8SBC/Z8xXDm8
	wb0Mku3t1BE/Vmb+aq3adm51ngjgKzsIBNnwfILHQkXdYMwiBV6198agU4EhpK2c
	LGbJPafhSczm4HnJp+jHGC8Jhm7ZDsOVyHSqBHszolA1I+eFSZyJ1YbzeLHUq6lJ
	3L7ouQuBy3UOp7wSfXRGkQuY7DL4o61npICoB3p4V8zhc9dcqYZK0e9Xu7imZQO6
	tmF6unthzf+Cgarn90hAQPsg0ef8Ej2zGk2gmZXbwuOUullkdG2o9PWi1/sQJMo5
	y6Uhj4pSKPukdsFyCbq7XaFjq5U1K1IHSZZ4e8O4n/SkJVh3cu4vBTop7Fy7UE8E
	1iq2dQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p0dfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:43:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c76888646so1289517b3a.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791963835; x=1792568635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTOjT4OUOzapuo6XNz1VJi2V1U4HM1++DKOVSU+njqk=;
        b=P7oDsdnA1vpe8FiGcIotHirs9bnzJhQrwZpt6ApfNHSIiHwSHye/U5KVIcRDDwN1Pp
         yLDZhe1S5+5/Vx3yxE80YtCo2cWmFncKsavHgdJv2v93FjdTQRlVMWkQJ9Z6VFD0LWEn
         ENzGc0aePHXVer1N56LEZyWdBAeaDdRPG3OuFs/AVc0QBWYHdpF/SW7Zfzmmn83ST5v1
         TZL2/64L6Vb76W70lzzdzUApUCg0tYXAldr4N9N3/APVd46UGl6RX0Qyq8ijijspN3wF
         nkShJH0S4SPEG4/Qbg4ev06rDS+3NmiVe9Dmr3OX9zHnb8HUR7qSebBh/reI5DCHc7lW
         ZBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963835; x=1792568635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTOjT4OUOzapuo6XNz1VJi2V1U4HM1++DKOVSU+njqk=;
        b=2tHKoiOX6JOOAr4h4MxMR0DQkjmK/pwiYQ/HlY6pKAVflDwbxyovSOzauxzwf1zuLK
         att4h9JR/8ytUa6MkerhsOusdsTHdhOTh1p7QW/tygOQegj/L+RWdpD0kDyc0ez4aw1y
         Az35z8jBU8yV3PwnepBXJnePVrQuiJL3p/sn/+pS+UHP8neZRLHLf6Q/9x85MCn16JYQ
         6lwTdFswEM5zGk5IOS1ZBsHJqA9ZRHsxevcRMmtUxBxmZ9oNMe3IDXLWWopg6YRy3dPn
         XwwdYWxKgK8jDPZ1zpruZEspacUj8Gw6JCk9lTfwwK69H+tw1575g0eR9k3LdQRzg6p4
         Z3sg==
X-Forwarded-Encrypted: i=1; AKwUvBxVI6F7sMjDLpiZeMiSFqO7d75QsEN/f6rE2duF6xCmwFhGKrbxR2vlg/XXq4j2FT1Rfm09S52y3Xr9@vger.kernel.org
X-Gm-Message-State: AFq9FYIpX7coMZEFhykbNWqSLARUtt6lPIY/lkD6TuIoqloMcwTfvlYe
	tbtXHfIzsGAiZiICjvgUBXRgg+2zcGo0imfwU9mE4WqhGgBY4gjjkH9tWNG6ESMGdNOsQcEg0+G
	LKKdR/fE5Ang7VBlNDxVOzJPneBXzK549z7y8m+1zhI+eDQBS+Vkblg4Y1Ho5AixX
X-Gm-Gg: AYBFou20fBe8yOmQtLTfQ0v+2v8wfEtDCJVS0eB1BL0KiTOXv+T4ITmGDzQq6gCVtql
	nqn4qDXgV3LZ/5ZKUsypP4cf1PJabNdW6XMuGi9KvYLbeFQCn3sO0OBUHCbDsk/Q534OmFFKoxi
	z1FTivCmN9pNzTBmvbh+AHdTEOdNtZmyaTlAf9ZW3sEew6G0RELK2D8vyPcHjf7z+k/ysnoWw04
	JGD0Cx7PPZbdS7g1rAwZz1b+L8c5dwJpSylLR63TzUi65os5vcEQR8eid0T3GVZio65Orsqhbqw
	zY+w77tMGXEiMbPicnQSEngmsMpATZVMBwGv2nGko/SNQyCD87CH0AFG3ME03XDcDDNTGj2WOP0
	uToAo7JbJ0pwh9coy3L3WehX3ouyzq0+xRQw6e/EMaNbeQy5E1dQzHSzAe39bkjnJDQ==
X-Received: by 2002:a05:6a00:414f:b0:87d:e8a0:2389 with SMTP id d2e1a72fcca58-897c6a2ed8emr11225895b3a.21.1791963835208;
        Wed, 14 Oct 2026 00:43:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:414f:b0:87d:e8a0:2389 with SMTP id d2e1a72fcca58-897c6a2ed8emr11225878b3a.21.1791963834667;
        Wed, 14 Oct 2026 00:43:54 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm756056b3a.43.2026.10.14.00.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:43:53 -0700 (PDT)
Message-ID: <43e6dcb5-9735-4e1a-87fd-506ee431fa2c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:43:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/11] dt-bindings: net: qcom,ipq9574-ppe: Add
 IPQ5424 PPE support
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com, horms@kernel.org,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com
References: <20261011-qcom_ipq5424_ppe-v2-3-8c7b057e2c43@oss.qualcomm.com>
 <179181021174.434549.3754588049756407155@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <179181021174.434549.3754588049756407155@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMCBTYWx0ZWRfX2mFnf2ysY9ep
 X/cAG2dqfJrhhnSdmh+T6YukCmA2RttqyF97/vUWQXwhsUkVqixKML2VSXMtwcJ3NeMKvTYNlfF
 /ikMXkXbT+jtQ4/mZEGhaNYbF/PKMw0=
X-Proofpoint-ORIG-GUID: GjnD8gN3mjCo5HtLJTTUr7SiGXFsqjyY
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf32bc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EH141z8j1nZSuVZU4S0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMCBTYWx0ZWRfX0BcA4nixCB/l
 9Jm8VKbxHZ5o2d87hFMSPXJRUzmjy4GWgU7vLfBJ4cmQ3wGlXi6KX9ClSi7P2FoB9CZYg6BEuMc
 QWtqCLqCu90idUjTYAHlAd3KOF1+dE+D+j5dhoYYrWC0PQY8HzLMhsCbvURPVnCq2iLqdFEHSTM
 woj2CNhwpZhur5DaEo3y+oeW0hDCapkbi59YlfAHN3R7VhTG0Yq9KzaAE2sUxE3cx7gpfkvO3Z1
 8fUh4SqyS1gdFonHtnQmVBnfELZOEHLMEv6hlGK3gCaqDK6KEwvL6JIjrVeaiUV3C4mLmeYxA1M
 Wk0OudEfsvei9CxtSx5IaiuEs39U321vF6/FnP1u/YDAbP6jJ25NWGsnWyIIEzIHixV8O5YSdn3
 orzyBCK134WkESimgIxvL/tLcuX+qb0beXecACU4r0HcVEuKIBkn02+wBcsELrOj0iqD0f9kWt3
 o7L5B7S9xmTNNyQWKvA==
X-Proofpoint-GUID: GjnD8gN3mjCo5HtLJTTUr7SiGXFsqjyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140030



On 10/12/2026 9:03 PM, netdev-bot+sashiko@kernel.org wrote:
>> @@ -182,7 +179,7 @@ properties:
>>  
>>    ethernet-ports:
>>      patternProperties:
>> -      "^ethernet-port@[1-6]+$":
>> +      "^ethernet-port@[0-9a-f]+$":
>>          type: object
>>          unevaluatedProperties: false
>>          $ref: ethernet-switch-port.yaml#
> [Severity: High]
> 
> The commit message says:
> 
>   Also match all Ethernet port nodes, so that ports out of the supported
>   range are rejected by the reg limits instead of being left unchecked.
> 
> Does this pattern match all the port nodes the schema accepts? The
> referenced ethernet-switch.yaml accepts both spellings for the container
> and for its children:
> 
> Documentation/devicetree/bindings/net/ethernet-switch.yaml:
> patternProperties:
>   '^(ethernet-)?ports$':
>     type: object
>     unevaluatedProperties: false
>     ...
>     patternProperties:
>       '^(ethernet-)?port@[0-9a-f]+$':
>         type: object
>         description: Ethernet switch ports
> ...
> oneOf:
>   - required:
>       - ports
>   - required:
>       - ethernet-ports
> 
> Take a qcom,ipq5424-ppe node with this child:
> 
>   ethernet-ports {
>       port@5 {
>           reg = <5>;
>       };
>   };
> 
> The port@5 child seems to match only the generic "type: object" pattern
> in ethernet-switch.yaml. That means it counts as evaluated and passes
> unevaluatedProperties: false.
> 
> None of the PPE port checks would run on it:
> - the reg minimum and maximum
> - the IPQ5424 "maximum: 3" limit
> - the required clocks and resets
> - the ethernet-switch-port.yaml reference
> 
> A "ports { port@N { ... }; };" container would skip all of the PPE port
> checks in the same way.
> 
> The new IPQ5424 conditional in allOf uses the same
> "^ethernet-port@[0-9a-f]+$" pattern, and only under ethernet-ports, so it
> has the same gap. Later patches in the series don't seem to change these
> patterns.
> 
> Could both this pattern and the IPQ5424 conditional use
> '^(ethernet-)?ports$' and '^(ethernet-)?port@[0-9a-f]+$', as qca8k.yaml,
> mt7530.yaml and lan966x-switch.yaml do?
> 
> [ ... ]

The PPE ports are Ethernet ports, so this binding uses only the
"ethernet-ports" / "ethernet-port@N" names, as required in the earlier
review of this binding. The PPE port checks, including the IPQ5424
"maximum: 3" limit, are meant for these nodes.
