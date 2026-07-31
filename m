Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457D3ACA71
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485736; cv=none; b=ZXr9/wbDF3PsUt+xYe6u7h+BvKY6zmcawrw6k4qMK8UEG3wTJiKA4gJCYD7yeor+cK69z5rmx7vKmuwBmSU00qwf6nMp2saB8eJpqMMt25s4IakTCejUKqRzbGoES6znX8M8vGUtA2ya3H4c/GXpkeyQwOJt/M+4MEPLFut+ln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485736; c=relaxed/simple;
	bh=nBusK1UQgx2TmKkyBKREuUZTJ7HBNEwsnmUsSi15ul4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkPDP9X8HAM1MlaMiyJ9itMOO/YUsFYZ/Ln96MENRssSYvx9L7CwdMaBO9SAF7uM6KMkhisJ7fhuBjml2sdIOjezqkyL2bJL792vdCvJ7grCMSmf81F4MApGC/U+iyPEoWjItaWQE6DjVSrl9FsapCh7DmKq/UeCc6fsFfhbQWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1zZ+BBQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xf9xZ7e5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1zZ+BBQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xf9xZ7e5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7wmuC3694018
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5z8UmhS3RRs/4TQcJ6cyd27C0la1BIG6/MU62B8nfq0=; b=J1zZ+BBQhft0aBr2
	BAzshYiOuB5VvS6QR72CHXnDz8pQUJ3R5k+tbBgwdVbNW5iGwfc58hFFWDtnch2/
	6dMM78CT8oVJQno5q7vODjTrjK/c/XU8gVOIEp/2VJWCQrSrvlTx0J/bkZPPlKOx
	WQ5ausSl/O5M4/+mTd4RHA5/28LSYiCvq/8O+MBxSzL87hyDgV1o/dLtDa0meV3C
	/nDJyvIcA7u2UYu0sZ87dz4de2+pWfB/9rZe6x/28K0sziRPDD7bX7YpDAxCfE6x
	PxBMm5Lbt3W1IJYlhF6HFKpErP1E6edewVHxMi7PTtel1eyoLEh3Urvs3huQad+Z
	SfXkVw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqssr1ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:15:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f39a46efd9so14898426d6.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785485729; x=1786090529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5z8UmhS3RRs/4TQcJ6cyd27C0la1BIG6/MU62B8nfq0=;
        b=Xf9xZ7e5Tm71cfB9Vsnuw2V/gJBigyBTz7jj9xniDRic159ZRi6VKv2eQ4hgegGA6O
         gcrpls5kDwSrEodUGIgljXuLoNA7nhqAvoCBQNMdHZhdvdE5GVV+KwFhBUMg7pEIgMU+
         sBrSnHSeG6n2jivN4YalLbn8ymsBy2HTOX0VN/j637hfnAINR/2erzIwNopB+JL+wik/
         nvjdqi5Jv3aki1HTYvWPRBV1tkAUCel6Ik8v1/mtxyiHRCRLQpHBQminysgRVACbLvyh
         dRxI9T7VtTL2jB6xo7qBQGjsHl6jgTByYhFLX72o7Y/mGaT8ukARlCRLIqoyzrRu0pJ4
         8nIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485729; x=1786090529;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5z8UmhS3RRs/4TQcJ6cyd27C0la1BIG6/MU62B8nfq0=;
        b=UYIopSidpfO2ZLHtswyKseyphFH3KkyN3OfaBngvQVvChwO4Zqge/8H0WBgCaccAiX
         BZCvsxMbLfCrvmufCSaMxuqHfjWwH78kmSyw9m/B1htaeAJsefUatI4IerT1JFP1zdvl
         afGJWxc8O+RSyytc5YWsF1AAD1rPMi+8A+T2/RN1awrW65OEN+j3OPTqjapi2OBTH1pL
         LXsPUpSoSJo6WnAE8xXMroyHLWvxKGR1xnA1wYxlCi0SF1nlOuALRKqm2NDfTN/4iLz1
         hgdTkqbotOxS31U+wY9sWiZVhpTJvKXe8TC+nwzPYs6qwFr90hsR15dD+2f+PYY2s4Yy
         xbmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPLj9Pjcx8xfopOS9/zg15FTsgl9tAZxgNhYkYEcvRoAM5/vLJ/xh9hkqi5Q0bkoFThx7MwYrf17xw@vger.kernel.org
X-Gm-Message-State: AOJu0YxYnXZIjjtioKg47sLm4ioXXGJlkoGkmxCvnnSigmqUXG/+rrRK
	psRafEgg0ewyVizh0H+fUYUPSdbw8xdCfAlUkgIsKwP24mA3x/RYut/OkwzKvMLNI9PEm3VSpLR
	bovPFKkHiuT4DvWyAu43MsyvgQsXyicD3MvNEyJMUrD2Pr61TSafa6zYSzsZbjXmG
X-Gm-Gg: AR+sD10luWG5TEZsi35UrcRnJlM3PxiLpevoVT5r4M/IiilzGOZWopv6moJ/6s21vqk
	aVan2mVjaVSJC/6mmuTaWOLG7aZhTqOorHeHGkLfTyb7krOs8g2DlMVYMheHtiPIweK9tnAR+gm
	uILWDmKTF9AXB1o3H4mdMgQnz1q0ZZkjubUl1U0nrgWneo0aPApRzgB3ki8TZJzTkwLJZqcGuPs
	RdJIdVkdJO4BF15OaWiGYJBW9RxW27bzD1RIl5+h4o2VeKPsTL8/85oGqUt+th4KP4CG6QobvhL
	8PN2X8U8Sl6h+/kh99yd50FUhSgnn6um/qNtn6UDYfxNrYrAg3fia5sljJO++J9AvGisz6NiTdm
	UtmCET5VetEUzFrk32xpxCqZqRnaXAPxHNrr+PHMEAw1+7LEPOXQax0SExuhAgSDL
X-Received: by 2002:a05:6214:2021:b0:8e7:eca9:de1e with SMTP id 6a1803df08f44-9084355bf0cmr10263776d6.3.1785485728616;
        Fri, 31 Jul 2026 01:15:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2021:b0:8e7:eca9:de1e with SMTP id 6a1803df08f44-9084355bf0cmr10263456d6.3.1785485728025;
        Fri, 31 Jul 2026 01:15:28 -0700 (PDT)
Received: from [10.111.175.212] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908436071b7sm5237616d6.48.2026.07.31.01.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:15:27 -0700 (PDT)
Message-ID: <1b2952dd-e5ec-4530-a521-126e5d38385b@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:15:22 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5 image
 sensor
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
 <20260724-sk5jn5-v2-1-871d3b9a2e47@oss.qualcomm.com>
 <442145bb-9487-41be-8a9d-af5553e6fe8b@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <442145bb-9487-41be-8a9d-af5553e6fe8b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1OCBTYWx0ZWRfX5h9AjOYjwn/Z
 xiGRBn7csYWdzA692YcUP262s70tej9vy/rGHSj0kZPW2GzGQ+oh4A8SFvc71ITR1Qha2SP+7yD
 DSFbhXCwFL86KBdhmdgkcyKph6XM2oA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1OCBTYWx0ZWRfXywBksfk5sejz
 3/EEo9WJkITIE/Ub1jtiGRDw27GPFOEZUGEOclYlHYiaX+VIMgUBnOwGrJOs2yz89VyrOrIenYt
 hV1iVjs43vWyKGVD0v1/cQF7AIucoIiW5iIbEwVZhCX268YkzD2t1uzW/cUsbHl1qAcEtXRcrym
 4Ifxw8n0KwMU7yRa2gnzFPeBxXc879FZiw2GIH6BDSyEWqLOfGiEXbMaB9qoq5qAvetYZnRSLS/
 gDI2y68QhclsaSALyCCxETJQcWzDvEqjYQp6RtsucL3TIEofsNm3TrDfBxh36HfcGhSLae8lcnQ
 fh9cAoNt+bmpM8qOEZB6cHnOIQ1MweCJGBP+cy+SNGC7Vo58d/bmA77nxfkw0jTpLbskL82v/lw
 CElocrcrcuqWMnZ7L9Yh+Mu5l6n28prWjg2Inv2xWoyDJfHdMNC/Ur23phmiWueNny1BbGYC4Mg
 0IvHdHYOjKK1Q3/dEnQ==
X-Proofpoint-GUID: K8JmX-7N7-zcID3JYcMumH3mLVGUDdTT
X-Authority-Analysis: v=2.4 cv=QMpYgALL c=1 sm=1 tr=0 ts=6a6c59a1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=WTNl9S_qHYIi_GRffOAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: K8JmX-7N7-zcID3JYcMumH3mLVGUDdTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310058


Hi Vladimir,

On 7/24/2026 10:12 PM, Vladimir Zapolskiy wrote:
> On 7/24/26 12:50, Wenmeng Liu wrote:
>> Add device tree bindings for the Samsung S5KJN5, a 50 MP GBRG 10-bit RAW
>> MIPI CSI-2 image sensor controlled over CCI.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   .../bindings/media/i2c/samsung,s5kjn5.yaml         | 113 +++++++++++ 
>> ++++++++++
>>   MAINTAINERS                                        |   6 ++
>>   2 files changed, 119 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ 
>> samsung,s5kjn5.yaml b/Documentation/devicetree/bindings/media/i2c/ 
>> samsung,s5kjn5.yaml
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..9526d2bc5f5be236d7e3d0f1409df2ef991dd0e7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
>> @@ -0,0 +1,113 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn5.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung S5KJN5 Image Sensor
>> +
>> +description:
>> +  Samsung S5KJN5 is a 50MP GBRG 10-bit RAW MIPI CSI-2 image sensor.
>> +  The sensor is controlled over I2C. The full resolution pixel array is
>> +  8192x6144, data output format is RAW10 transferred over 4-lane MIPI
>> +  D-PHY interface.
>> +
>> +maintainers:
>> +  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/media/video-interface-devices.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: samsung,s5kjn5
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: MCLK/XVCLK input clock.
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    description: Active low GPIO connected to RESET pad of the sensor.
>> +    maxItems: 1
>> +
>> +  vddio-supply:
>> +    description:
>> +      1.8 volt I/O voltage supply (VDD18). Required for both 1.8 and 
>> 1.2 volt
>> +      I/O operation.
>> +
>> +  vddd-supply:
>> +    description: Digital core voltage supply, 1.0 volts.
>> +
>> +  vdda-supply:
>> +    description: Analogue voltage supply, 2.2 volts.
>> +
>> +  vddio1p2-supply:
>> +    description:
>> +      1.2 volt I/O voltage supply (VDDIO12). Required only for 1.2 
>> volt I/O
>> +      operation.
>> +
>> +  afvdd-supply:
>> +    description: Autofocus actuator voltage supply, 2.8-3.0 volts.
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          data-lanes:
>> +            items:
>> +              - const: 1
>> +              - const: 2
>> +              - const: 3
>> +              - const: 4
>> +
>> +        required:
>> +          - link-frequencies
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - port
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +      #include <dt-bindings/gpio/gpio.h>
>> +
>> +      i2c {
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          camera@10 {
>> +              compatible = "samsung,s5kjn5";
>> +              reg = <0x10>;
>> +              clocks = <&camera_mclk 0>;
>> +              assigned-clocks = <&camera_mclk 0>;
>> +              assigned-clock-rates = <19200000>;
>> +              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>> +              vddio-supply = <&vreg_1p8>;
>> +              vddd-supply = <&vreg_1p0>;
>> +              vdda-supply = <&vreg_2p2>;
>> +              vddio1p2-supply = <&vreg_1p2>;
>> +              afvdd-supply = <&vreg_2p8>;
>> +
>> +              port {
>> +                  endpoint {
>> +                      link-frequencies = /bits/ 64 <1248000000>;
>> +                      data-lanes = <1 2 3 4>;
>> +                      remote-endpoint = <&mipi_csi2_ep>;
>> +                  };
>> +              };
>> +          };
>> +      };
> 
> It looks almost identical to samsung,s5kjn1.yaml, this sensor has
> an additional vddio1p2-supply though.
> 

Apologies for the incomplete power description. My previous definition 
was based solely on the module implementation. The correct differences 
are as follows:


JN5:
VDDD -- 1V
VDDA -- 2.2 V (different)
VDDIO -- 1.8V
VDDIO1p2 -- 1.2V (Add)
VDDM -- 1V (Add)

JN1:
VDDD -- 1V
VDDA -- 2.8V
VDDIO -- 1.8V

Would a separate binding be more appropriate for this case? I’d 
appreciate your thoughts on this.


Thanks,
Wenmeng


