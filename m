Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620738;
	b=j0lOjJWvUrpwteZ2U8IC+EHdKdhJJfJc6gfCmGe83r/jkMFm339kOYfHswpxeEJRXKO0
	 cVRN0YSGaqeCicBAX0ZwxWtsVXnrtbUrVQMt94vWZTNeZEUpke5slPQN+RTZf3rjg3QzY
	 JQ+XEF9JMMfatEYu7XhiE5O/xV3IR6P6MKlTRLSZvY/aTrdicQsQHF5Uae/Gj5fYbccE7
	 aiAbNMLL11C8pAPWst5gy5VGT0Ctdh/25+dcpFFqHOk3Kyam5EYBnsCIDwd2EUGfY0UoD
	 4C2yDhL9F/Q2D/hEzos9nuh3zOSyFbv1tQNeXM68h1ZZmHnH5Zxwd3nUMu2Xyv2OAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bUC8F3wPwRKVstO+kanXkCggIsRCOD4L4lrynOWzJfU=;
	b=sdIJnxNcqCRV/sSuTM4XSNNQubEtxg4ESKbp7sG3fkEIzNnGSmf+VqKcwSgghrV0lHLT
	 Pt7q89AuJ5XjffLckTaEgR8sWgSwAF4TiQZlr+JlSByE6woSLFOvKFNFsgPK27Tv3990v
	 EXaCNIMn+6osjHBRcW1LCQOwC1IS2zNhYuu/3q2grfMNLEXp3UIrZHJz2+oAk8/GtVR0q
	 PiwHSkmavSnv3Gy44sdsfseQ15RaYZWG3dHgZ2sNXKgRodYxYJleNSjLyy4MPd+7VrrGF
	 YITMlwrj63qG+lyYQ5z7x+lQ/1XEZlTd0oMcJMM0z9pPmKHkarku34Jl7JjT3RR+qng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IfRPy50j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DS1NUd8k;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49B8606A33D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C49B8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IfRPy50j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DS1NUd8k
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE0JaU8482734
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUC8F3wPwRKVstO+kanXkCggIsRCOD4L4lrynOWzJfU=; b=IfRPy50jd95DW3Bv
	SBCOOcQ8wGgPB3iSDr0360NmkoZmI1JjyXDEZAkj2AGjpE8Z5xRtEELF2m8UZ9br
	vGsXXOzx1rFJbaqr2p7Ko2Ct+CpvmVC2iIqRd3B0zs8nbXbD+NAcrdwIhvx4pg+S
	TAjHlomvWTPQ9W4Op0HUJS7gtDF/WCTnFNbrP1C1kBpOOSKdE/xe+beYFJur71Nb
	MRq2n53c+sooMZRAOeuUSDU5O17Rba83Qnmbe76OVXjpyerb2dCG3pceMeY+O0FU
	hY+fMQlCWeNsEVUhJ9IBCGwNgypo1uaxkBrPHcSLkUYRzGbY5eQGCy/GD5XxIv9N
	f+KjXA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxd0nr6nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:45:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so807439c88.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794620735; x=1795225535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUC8F3wPwRKVstO+kanXkCggIsRCOD4L4lrynOWzJfU=;
        b=DS1NUd8kLCC6pP8HLvXbsWX6HHGqa27EAL4mDOUny1dAheqcH7P5AWqvwtasYFqFBg
         KQJc6uHTuQ1NSFpFShgBSdN5BCBFXasgZCR1yU5A883r2SjQPWWCR6Nm5dvhtPW8UdJ0
         cuHDyHvZ+w4VpXl+oCI2JfkJx23DecpF1UL0lP4juwAe0d3kc7M8yC9OpvAONK8iXvEx
         Uo22DAJ/wUfbh2dU8N93JSOFYvZ9kJV3NhYB3kWRDRA9H5QJrV1BA5sVTHJCAzd/63na
         QURJ7FyW3NE9zksB+DBzM2u+e+cyYpHHtEtKcTK9FG6fVpmfC7GRZW37S3AXLxMqJxXe
         IW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620735; x=1795225535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUC8F3wPwRKVstO+kanXkCggIsRCOD4L4lrynOWzJfU=;
        b=vlzgxx97evZLdoqyfM/IZM1+rgYaIfVJddNppAebd/rc9k2zTkMc75PTXFGYua7zu+
         tncTvLG3AILfjMT/5C+Gx3ard0q5i1FrMfmTJkgs/T0Pcw2theEXpRXYbcqvA4MRK/dG
         qLaeYyYh57kRCzXTPHArK230XKfw/lOKPiE5m4sMwUKzU/oowp1dXemK4dHHKxJloYXA
         KZzK5BVAyoS/xeG7R23dEL+20Zy27Mp2hv8Dzwg5fl0ce5ZdAgh2eYvth/uZZ6WB6uXG
         mA5XI03EPgiqzVfDy1D11M8suHIhprMiIY3RPdBZtzJZonzsU3XOuSl88szVSN1Mln8P
         kveg==
X-Forwarded-Encrypted: i=1; AL+hErHs9jqQrfuPlRQYjwMAhjJOl7KR1h25+EWIv/D80dEo9a7QPjeoQ+glGpafZUdfHnmLeJ/0xN8bF+8d@vger.kernel.org
X-Gm-Message-State: APuU4Z9KDU26bOYFzMjMGNRjndp3xSk7SpNNU4Q1YvABCEShVevGYAFD
	7jj5lkk8bgGmjYuZaVRnqCmHftqV4zxFzd8IITqs0gElwsc7QTL7dT7C3Biq4w+mqbE/HLG5lyA
	3NZvDj2e9pYdBpzRy1HWpX3yBF4VBQspAM0b6ljx/kyn8jF4EVud5dN+yej92KmcJ
X-Gm-Gg: AYBFou2JnOKemtmRPo9AhCQa+KCk7nwROGzPFpedhavx/kCMLYbRaKMP2HxwDnkLBFh
	9B728g3Cpc//adTiStBpy1uDtIULTk1jfEHy86SQHn3ORag+LtpWET3UlWOP8F0urWakBwkAEEI
	jFmvHoD2iv2hHWPIPcN3/EkSQA9zPjnyEcmbJUThtEHK7MX+4wpZcHNZgZyEgwerQ3AJPK97aJd
	7+MP2R62dELeBAisny0HULfhC4cIL6cgySabJE0s4JIsPv02+dxn/zhKS/F13Vvh9vnisR17lTr
	6Y1aGx/2vZ1Eb5GpErDb7++93PjJ2T75jJF9NDEsdHKKVaA07CfGdG3AtucWeQI4fvJcBRPDf78
	KzB9Cjj8DIn4ihzUJz2MR0bSGKGgsrVe/o0xt1XI/wnzWWK92E4hJnTM68Fxsuja/8eH0tQE/Jt
	lR8rBolFnm
X-Received: by 2002:a05:701b:2810:b0:1b5:58d:fd4f with SMTP id a92af1059eb24-1b5058e03e0mr2577968c88.43.1794620734636;
        Fri, 13 Nov 2026 17:45:34 -0800 (PST)
X-Received: by 2002:a05:701b:2810:b0:1b5:58d:fd4f with SMTP id a92af1059eb24-1b5058e03e0mr2577931c88.43.1794620734054;
        Fri, 13 Nov 2026 17:45:34 -0800 (PST)
Received: from [192.168.29.63] ([49.43.231.124])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm15907935c88.9.2026.11.13.17.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 17:45:33 -0800 (PST)
Message-ID: <8b9d14a7-47cf-4020-a5cd-9d17d559170c@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 07:15:28 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: connector: Add PCIe M.2 Mechanical Key B
 connector
To: Rob Herring <robh@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
 <20261021-pcie6_fix-v1-1-ad37134c35a3@oss.qualcomm.com>
 <20261030174429.GA781972-robh@kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20261030174429.GA781972-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNiBTYWx0ZWRfX0kEUnVKwUS+x
 zL0wl1ttHH5IbV8KAjdp8dExutsNdMQij8f2XBi4RVk0CPDOMyrVrUhgWBESgxC3Kj9ZNuLQZBd
 MAxcOCKRskx8l5UTMXncQAj9J37K4Zk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNiBTYWx0ZWRfX6tEURbiBEcuU
 6uz8zmEY63567+90EyfrG07AXSY4Bd3pNx2Etj1VnCYaAz5ZuTAf37DVvvYRZeLi/y8ad7kEIHf
 EVi6pUH8xWaxbPsCKoXgatqYHDe7kb5/aUy2UGoKfX2gw9WTqh1/rpScWkR0RZ/v5VQhvNzMCnr
 zxDWk2ll63JNdz4Jyk3PeTr+arq37vQJNdMyf1FGGpo78Srhgcr1flyD2s4iFynBDp8MadU57ab
 D3+aJ2mumDdalzdLtjCoK890CT2pHnLG/1ExcplOmMPHcTcQa5dyVjVkoUnyxgPnSIV1ZoMUoMa
 DHEhU/kgAxiP4iz8DXz96IkJ1R96eB5Bg++exFj3D5TlN7Xj0GM0scilKGUZgX+TYDPD4Wzg7BD
 9Nn9I62vf25lYEPDsxGKxJvKhHzgynzQrvsOucALigZW3Q7V2ccGkf7kymcxuVj/v4mnjApJ4t+
 h/jXJYnwInF+lVhGxLg==
X-Authority-Analysis: v=2.4 cv=Zo54uN7G c=1 sm=1 tr=0 ts=6af7bd3f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=OgdsqUoHhxF4GfobPiU6/w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MaBVSKTy7IHi2HvaTlUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: BullnjS4BR5g8fa2ISNqHSUYU2p_aXPz
X-Proofpoint-GUID: BullnjS4BR5g8fa2ISNqHSUYU2p_aXPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140006



On 10/30/2026 11:14 PM, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 07:21:22PM +0530, Krishna Chaitanya Chundru wrote:
>> Add the devicetree binding for PCIe M.2 Mechanical Key B connector
>> defined in the PCI Express M.2 Specification, r4.2, sec 3.2.19.1. This
>> connector is used to attach WWAN Adapters to the host machine over
>> interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB 2.0, selected by the
>> Adapter's configuration pins.
>>
>> The connector provides a primary power supply of 3.3V/VBAT, along with
>> optional GPIO signals for WWAN-specific power/radio control:
>> FULL_CARD_POWER_OFF#, RESET#, W_DISABLE1#/2#, WAKE_ON_WWAN#, and DPR.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  .../bindings/connector/pcie-m2-b-connector.yaml    | 146 +++++++++++++++++++++
>>  MAINTAINERS                                        |   1 +
>>  2 files changed, 147 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.yaml
>> new file mode 100644
>> index 000000000000..a7f4bcbc5119
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.yaml
>> @@ -0,0 +1,146 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/connector/pcie-m2-b-connector.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: PCIe M.2 Mechanical Key B Connector
>> +
>> +maintainers:
>> +  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> +
>> +description:
>> +  A PCIe M.2 B connector node represents a physical PCIe M.2 Mechanical Key B
>> +  connector. Mechanical Key B connectors are used to connect WWAN devices to
>> +  the host machine over interfaces like PCIe, USB3.1 Gen1, SSIC, or USB 2.0,
>> +  selected by the Adapter's configuration pins.
>> +
>> +properties:
>> +  compatible:
>> +    const: pcie-m2-b-connector
>> +
>> +  vpcie3v3-supply:
>> +    description: A phandle to the regulator for the 3.3v/VBAT supply.
>> +
>> +  full-card-power-off-gpios:
>> +    description: GPIO output to FULL_CARD_POWER_OFF# signal. This signal is
>> +      used by the host system to turn off the entire Adapter. Refer, PCI
>> +      Express M.2 Specification r4.0, sec 3.2.13.1 for more details.
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    description: GPIO output to RESET# signal. This signal is used by the
>> +      host system to place the WWAN Adapter into a power-on reset condition.
>> +      Refer, PCI Express M.2 Specification r4.0, sec 3.2.13.2 for more
>> +      details.
>> +    maxItems: 1
>> +
>> +  w-disable1-gpios:
>> +    description: GPIO output to W_DISABLE1# signal. This signal is used by
>> +      the host system to disable the WWAN radio on the Adapter. Refer, PCI
>> +      Express M.2 Specification r4.0, sec 3.1.12.3 for more details.
>> +    maxItems: 1
>> +
>> +  w-disable2-gpios:
>> +    description: GPIO output to W_DISABLE2# signal (default function of
>> +      GPIO_10). This signal is used by the host system to disable a second
>> +      radio on the Adapter. Refer, PCI Express M.2 Specification r4.0,
>> +      sec 3.1.12.3 for more details.
>> +    maxItems: 1
> On the pinouts I find, I only see 0 or 1 w_disable.
W_DISABLE1# is pin 8. W_DISABLE2# is GPIO_10 (pin 26), valid in Port
Config_0..2 only and absent from the SSD pinouts. It stays optional, and I'll
document the dependency.
>> +
>> +  wowwan-gpios:
>> +    description: GPIO input to WAKE_ON_WWAN# (WoWWAN#) signal. The Adapter
>> +      asserts this signal to wake up the host system. Refer, PCI Express M.2 
>> +      Specification r4.0, sec 3.2.13.3.6 for more details.
>> +    maxItems: 1
> Don't see this on any of them. There is an ALERT# signal.
 WoWWAN# is GPIO_11 (pin 23) in Tables 3-21/3-22, Config_0..2 only. ALERT#
(pin 44) is the SSD SMBus alert in 3-23/3-24.  I'll keep WoWWAN# optional and
add ALERT# separately, since Alexey noted the socket also takes SSDs.+
>> +  dpr-gpios:
>> +    description: GPIO output to the Dynamic Power Reduction (DPR) signal.
>> +      This signal is provided by a host system proximity sensor to the
>> +      Adapter to trigger a reduction in the radio transmit output power to
>> +      meet regulatory SAR requirements. Refer, PCI Express M.2 Specification
>> +      r4.0, sec 3.2.13.4 for more details.
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: 32.768 KHz Suspend Clock (SUSCLK) input from the host system to
>> +      the M.2 card. Refer, PCI Express M.2 Specification r4.0, sec 3.1.12.1 for
>> +      more details.
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description: OF graph bindings modeling the interfaces exposed on the
>> +      connector. Since a single connector can have multiple interfaces, every
>> +      interface has an assigned OF graph port number as described below.
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: PCIe interface for WWAN
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: SSIC interface for WWAN
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: USB 2.0 interface for WWAN
>> +
>> +      port@3:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: USB3.1 Gen1 interface for WWAN
> Port nodes are generally independent. Endpoints are muxed connections. 
> As SSIC and USB3 are the same pins, they should be the same port. You 
> could use endpoint numbering to define SSIC vs. USB3.
 Agreed. I'll use pin-group ports with endpoints as the alternatives. Should
PCIe lane 1 be an endpoint on the 29-37 port,  or should the PCIe port imply
link width and leave lane 1 out of the graph?

- Krishna Chaitanya.
> Rob

