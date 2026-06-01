Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6C03624AB
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 07:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780298412; cv=none; b=c+OvXGhrx1JWGERvCyZwAaFaLs3MTHetZaja4WJ3EWxVIn72FDEKunGCnxu7YiUHR4M6P/VpIqFP+PIXGdZHOMYndE5Akmr2KtoROc2s6lGftVO+n38NcjaExtgCZIqCLDDy3bP9KU1lbPinRW0oGgKPFci6CDOodGiQ+A36ca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780298412; c=relaxed/simple;
	bh=shKWeWBNqVXhBY78Tf+SHIB0H6ZMVUTB8vM7G1+QeCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asKLEedqiRy8bh0IE8RcjWngqedrKNCSgck3zDcWD/cgkqBK81WN5htSXWIVmqia0gsqyaZO2CS4+aSem66yk6WGCOETjdQ2XtJbhvaK/sdHc1s1P3oE3z8SJFwWslE8KWiHnKwKeO9QO+ANexzVYmU8vQddZHT5VXiuSs86fEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nafPpfUt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blFyrKim; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nafPpfUt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blFyrKim"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6515VQhc3221166
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 07:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J50RySh8GMKgXOqEW4ylYPugbxEDez5rKbb4C33+2zU=; b=nafPpfUtEhCuDlz5
	bq5pFqG1HLkseLeV/aLNDNvmMm7bdEhNaeixMXhfqBe84PdCisO2PhhUwiWqqUpB
	QL9WWQEhs2mj0BdupbqOR92Nd9lacVoKVMeuQryfE/pckDTRFxhsV3vcvuEqni9m
	p7WwZdlwdPIVdeGuXs3dwEQHvT1hZF5IkLV2/2e4WTP0pwoE1p7dUrXTH4RH4kK1
	hJTQyc/o/glDcyuSoYbKGPdev54egoOjxMAk7dH2K8n3ZQBHOF+DiwfOBq7ZqBB3
	Xjq59lvyeYxfyx5opbeoVdZQunz3cEjAqrHoaQbaKjcBJ1SLm/G6Jqav+/h1129P
	14Fvpw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyuxaqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 07:20:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84235f9b91fso970605b3a.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780298409; x=1780903209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J50RySh8GMKgXOqEW4ylYPugbxEDez5rKbb4C33+2zU=;
        b=blFyrKimj24lqv90wkcSsHHOfuAmat846ekSdLrmhtkUz3d8ZFbj4UMdjsAYIYk0tL
         dn09vlh+hK3H0iUl911El1mJzz9qoO3E/4TPpGD96/ryajupZS+eHxXzmgt1ZZC8dIx9
         33OrlOSeqBoETQTmRjEY9WBlUrTTF2Bo9Hopwtl0B4mqCrY4vq0Kobi9fk9ME6kCYhEe
         9G6WP0TOPdAUKnXeUimBg+zoCI+dOrdi/4WjHm8+0AjCDkyNfnkSPp33Q79c5QPf+O71
         t/klz4sfzwtJqcv05Hvb6Rt51zMuumfFX7vsiDsfLSGLvaE4z/VVBDuu19ax3Hhj9Rsj
         +WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780298409; x=1780903209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J50RySh8GMKgXOqEW4ylYPugbxEDez5rKbb4C33+2zU=;
        b=aZBoZecvtTRIJa1EV4P6wjAg3DNr3kXsLYH0faBHkAlGwIPdlOCr/gQsXVeDmn7ZbS
         Emw/qAeboG/zfF37jKxIxnv4TtqfeK32ttxd0DabPQ++uWWtGUdmruN6FMPvFD5nin6Z
         K7+mqFlhfFJ7i+O9seBvVkjnkjX1FsSz+KyUIcvMl7mtWnzcASxygQrFXvwIqhhSQ66G
         Kp4GtEKcG+5WzDPZW5zp/kQdqjJXg14l/+gzGW115IV2LbXdPn0eYC+OdHEjjBksg5ai
         liwU1c275S0CsVE/LwAI2/OX4sX9MMzL/tNEuJGl0mYFXjt1MKfS9j1Fsdwt2ZtyDMNe
         oRHA==
X-Forwarded-Encrypted: i=1; AFNElJ/SqkhjhJDCEkcrepZJosnPprZv5pOxySrGiOub3SBTe0Ymtf9T7M2a8eHM5wSmWKEOU/QyBNe20DlY@vger.kernel.org
X-Gm-Message-State: AOJu0YwtR23NuKru00Spbp5IB/4agi9nFqNXxnc3v4pF6lYzfdSa/Jmk
	QsPfLtcd9vv2Pdhf3Ac6J4P5lE5ufqYsShgJcbCFFvQLtkBlUoe6c9w8ZVeAHP6F7wrG3ptOxMk
	jbAEsoeal6YnXelrPZySLe9Z7aacZtl8dzzvvuhk2Z3kWYzKaJZ3f/l1jFVOBA0iU
X-Gm-Gg: Acq92OGH8kipRJiFx+thLpHuMcHXSBl/EbpAencpk1qCMjJEnWWdGOt4I49jEQx/t//
	/BtqhEilqYH8jNuLCONYp9syQ24AQ8+BW0a0HabE389CzpJAvX0QzkzO8CE7/wghx1rR/BgIwEf
	FLCxh6ojdv1PMZBl4csk0UfY4U4nRyo8sdON3xmfv/g9/YZnk+F7aoHYwyumRMJBazJBnj+u30C
	SCrzgV209j66oIr2DB2nAVu6opky28pzFkojTviwnzFSHomnIiB+QZ4Ws0xG/0sX+AQ9umokNPR
	J/blWG+9f5YIRN9lKm7duUAnQD0LCKiZsdsfLkorqg3RWbraB3z97EAlaAwspn3GmJZ0Vc5/L22
	6UBrzTpW0NZgsjXSNfZyluHaebNG1pJ5oJ9aA9IBCozNQV9EzOdiDRR+PLatx
X-Received: by 2002:a05:6a00:a223:b0:842:5931:7b8c with SMTP id d2e1a72fcca58-8425931803amr1870515b3a.1.1780298408604;
        Mon, 01 Jun 2026 00:20:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:a223:b0:842:5931:7b8c with SMTP id d2e1a72fcca58-8425931803amr1870478b3a.1.1780298408142;
        Mon, 01 Jun 2026 00:20:08 -0700 (PDT)
Received: from [10.219.1.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423bdd217csm4479368b3a.49.2026.06.01.00.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 00:20:07 -0700 (PDT)
Message-ID: <6c06e372-85b4-4207-9bb6-270bd654c287@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:50:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: bluetooth: qcom,qcc2072-bt: add bindings
 for QCC2072
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com>
 <20260530-funky-mackerel-of-current-878e2a@quoll>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <20260530-funky-mackerel-of-current-878e2a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3MiBTYWx0ZWRfX0wlpndKgWr86
 Un0blpyEvxSm/zLwfJqRTiaxNaXp8nFU5cFK95aedWs5crRjAsPdLBmftkJXdPtPF7W9pd9dLBi
 Ka6cMOGUqiAwN8c3DYqRfbsbJBrgy+j9zD6TIRBUa41BoK6ikUL18+kO8ZKXn7EYauHxzA2e71M
 QQ/cxD1lE3oS6fRaBAzLURXaaxZiPOrjY6Cjcg4wobmRFzumSh4CRcZDoqCw6+MCBr513tCOQUA
 +nMa1mWQKgS+X3pPObm9+Bmsnr6UiUCFG3UdtfdRG/aN3cqP9PUN7eIaHVAgdWYe9swXlAgDj1r
 oxHVxWXTDzQdRg6xGgMonMMZa0CZcomENbj0T2apCYG4+BoQKn/rBd0YDK97vogGQNw0Bqyx1Wh
 lrN8YkemS6xSsjPQPzQegb1sh+4YJdKg6X4gkW5gAtG7By1Jr2jXuNT498HcEakCBtbX6a8a4SQ
 DeKc8LhXTATtlhQNIXw==
X-Proofpoint-ORIG-GUID: hqExdm9Nn7kO4x2T78jlUqd2dJOCmc_n
X-Proofpoint-GUID: hqExdm9Nn7kO4x2T78jlUqd2dJOCmc_n
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1d32a9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Ey0t84Mziqqm43UOVh0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010072



On 5/30/2026 6:04 PM, Krzysztof Kozlowski wrote:
> On Fri, May 29, 2026 at 11:23:42PM +0530, Yepuri Siddu wrote:
>> Document the YAML binding schema for the Qualcomm QCC2072 UART-based
>> Bluetooth controller.
> 
> Where is the rest?
> 
> Also:
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
Thanks,  I will update this accordingly and send a v2 with the fixes.
>>
>> Unlike other Qualcomm Bluetooth chips, QCC2072 requires no external
>> voltage regulators. The schema inherits common Qualcomm Bluetooth
>> properties via qcom,bluetooth-common.yaml and serial peripheral
>> interface properties for the UART link.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> ---
>>   .../net/bluetooth/qcom,qcc2072-bt.yaml        | 38 +++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>> new file mode 100644
>> index 000000000000..8e2f15a75d62
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QCC2072 Bluetooth
>> +
>> +maintainers:
>> +  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
>> +  - Rocky Liao <quic_rjliao@quicinc.com>
>> +
>> +description:
>> +  Qualcomm QCC2072 is a UART-based Bluetooth controller.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcc2072-bt
>> +
>> +required:
>> +  - compatible
>> +
> 
> Looks heavily incomplete. Devices do not work without power for example.

The module receives power through the M.2 edge connector and manages its
own power sequencing internally. Unlike bare Qualcomm Bluetooth SoCs, it
requires no external voltage regulators, enable GPIOs, or clock supply
from the host, so no power-related properties are needed in the binding.
> 
>> +allOf:
>> +  - $ref: bluetooth-controller.yaml#
>> +  - $ref: qcom,bluetooth-common.yaml#
>> +  - $ref: /schemas/serial/serial-peripheral-props.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    serial {
>> +        bluetooth {
>> +            compatible = "qcom,qcc2072-bt";
>> +            max-speed = <3200000>;
> 
> Also incomplete.
> 
> Best regards,
> Krzysztof
> 

