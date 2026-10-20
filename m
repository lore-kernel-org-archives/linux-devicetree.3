Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529959;
	b=vTn5sq9zsu779mDVcFFtgR79v4BDoOAMaPQY4iJOjmvCb5clIpocy8sH5eLXVF7JZEiP
	 hso7W1wEMLmSLa2tquz0ZIQQlk4RievjJaBUecm8xC3h3qgLuLn4gNAj0jiiE6u2ApsPu
	 7syyeICLvkP048V3lSMjUUsonWYFQD1C9MPJYsznmj9G3SGDs0lfVveX34KnVXCL7kVZr
	 MaSqmwwUdib+4/ICWN0hTL3sGZ0EajZiqOHeyfkj7TUe/qVvXw6lqb1INy2KNFgKgLfnr
	 fQhBJD85PHNMjTs10WIACwlw1pwQ+a2zKf0V0l3727+x8xEqSPy4g+CO4lhA+Zd7L0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m1sqo/ZVn+VFxfXfLlBZ/RuAV0Yoz3eQ+nWIZ+yIl6c=;
	b=KP401UthiX4BFbJJ1J5a/Yo1S3rtElKR9c1tqqMxkRNv1Iw6AFXgmg0C/ntIHr2In3I7
	 EOcp+wYM7VKBIHq288DB4Jfhr26WSnLsFTxtXAymVHtn4ysDoqvDwvGgA4cbs88nhoQLt
	 09Xk9rOop5h/aRKru+rbZ/7aQWljopU9bElMBOmcx3SBSOAvRc6ukUdeCUtqncFGYowa+
	 +FQ3hxPwIalWj5c6Mhs5ByoU+CcGibezm7I7HzrVZGVQB94Ve9Jfha1d7TS7W2B6Pyey5
	 b6NqJkYcoiYlq3J1W8uhXp9KDgCQiF4Kc3GCBkWMDkc+wmfTD7MyKhZbrF4clH1HP0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWqblDYl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ErqIz2mM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A7606A325
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 20:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0A7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWqblDYl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ErqIz2mM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtsZJ3229645
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 20:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1sqo/ZVn+VFxfXfLlBZ/RuAV0Yoz3eQ+nWIZ+yIl6c=; b=lWqblDYljlhYfnv3
	omWHIPH2Wl1zbWIomVLAWQRdiGf0v0grw9XZquYiqVRrjmYi9EvWlL+GO8J+ap6y
	NprW5AY+7yVRTVMC+5mhJXzTFeEPSgX9UEgz4aHE/Fbw5mzv8h8uJDo8QK8jJn6j
	yJTCeGpoIA4WYyp2OY39oJjrZY/V4qpOHSJMG4ivXO92XLW8ycFQy1MOhewNi6VM
	7tbn1PP8AvKT5gZVAwyH99DwCKePz7vFDsBB5+PB5Aq2egDBbegI/hew83JGxS3W
	30nH2T6XeQEBYrpWQzQfk74OM3ZieJXuaYE9GwmfIcLPQeXRrrePOsROLuSvWK0A
	qPksJA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nvc3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 20:59:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so6086571eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529956; x=1793134756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1sqo/ZVn+VFxfXfLlBZ/RuAV0Yoz3eQ+nWIZ+yIl6c=;
        b=ErqIz2mMNVe7147LZ7MwidLgqPYBwE0odRDghueEuxIPflPpdWfkJSt33p1om0IIfP
         rV9Xq6YfYsxzD9OFGSZW9ky1ZCK0TGZdcbjDzHjiq/c6gTWdIQFtGJBxiK5neN/NFpju
         KyP4MefQsVirvCez6Poy7jAec8YXZY9M0rELYwfr+GLLbiPeCd2Ybm5rGHzg38RaTxly
         9RWZbKvdiz5HakQPnrSgDGgDkGfEcwRAYVmhkNDWHUVYmdgFtj3S0s2j5dHydJUgHQQq
         miaOzkMKOjgQoUu3gdHmcxEl2A/U48arQPdzNJw0AHxMTkkCtXv3Wycn1RuvpV9G7u+Y
         7jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529956; x=1793134756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1sqo/ZVn+VFxfXfLlBZ/RuAV0Yoz3eQ+nWIZ+yIl6c=;
        b=uuHggnyGM4qrk9Yf8YTAsECLCEFY8lSQTh+itpUxRkVtv0SLazGTonJKtLaIJ9h/tO
         uKqLevq390/2JKJsvmnOcXK/UgUSTE+3cwCD7ccLvJTxzqabymawkhpsVIwlXFXBhLre
         9Iisrf+7NxMimYG6elYVWoGictad3AHC3cCKljEbcFPk0orM2p2UoGJuX4CAO3fZK86q
         nP542nVjcynPjJIbmJ8i4Z2l8Lv3IouU1W3rXIU/wvp7zrH5geoeDQRmS1J2rwo7g008
         np74Z9pK6xIu1fCEoCKFK6lu5+U2bR4Tc07fvMOEj9rnTSwa4DuFhKrZQG+cbEPxnDmo
         fszw==
X-Forwarded-Encrypted: i=1; AKwUvBzTpqu+KNcCuGPobJEmkb91tnZ8EKiFQcBQiqPeswphi6g1NDorWWdmwpb59bAjxx/IF+kfigobR9qG@vger.kernel.org
X-Gm-Message-State: AFq9FYLD+hg6s6/hmQQjO7/NP5RTjDM9BDI60S9CeOhfJc8L70BcuS7Z
	ZFEQ3jDov4sENK/dBjpe8moMhoYs7WjJKlwzisz53hRsXrQ8+Ju5J9+jVv8JPBLg5n4WzBGd3dB
	oGRbqsIvodDYrm5bzs+yxW2x3i2AzB7Wq4wJiPR5FGD0Pf/iKjXq9HYUIz/NZOMCs
X-Gm-Gg: AYBFou3IyEGApqxBITfixvYWEToXA92VdEbsxzhsM5PM1hOEvTDZ+9KXEfT0XnVL4kV
	x8S5S8XLC1k9JyyaEmQnwFrlod/OwM9kP06Z8XkweDwH62yTyGRUcJEVB2l/Qck4qgBJpDM4Xai
	GSEV8UyBIf5T1NReH7zGW1Jb+uZpHc5nw5HbFlxALnEVd5zlPQhsKa+F394hFZzS/wvkk4nuRAZ
	YPMBYkNnuFlsH5jFyCXT0sa1+9XfplDa/oRgExX3Sm3e0fiyn6qLfIM948L4WuEXfxJWfp8IwzI
	TtV0koKaIVfjQ9SMqsiOcW82OKZgsCslStA9kd+S2jnaQQWyr2dwIGdAnvR+85LNNo51BDVODO5
	abWXHVMT/K83shGtxCa1I4UbdMYvmgcEaaomO2iwB0wiKd2nEKcV4nyOx
X-Received: by 2002:a05:7301:160c:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-3674c63d927mr549905eec.11.1792529955654;
        Tue, 20 Oct 2026 13:59:15 -0700 (PDT)
X-Received: by 2002:a05:7301:160c:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-3674c63d927mr549854eec.11.1792529955015;
        Tue, 20 Oct 2026 13:59:15 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm1247328eec.5.2026.10.20.13.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:59:14 -0700 (PDT)
Message-ID: <51147489-a26b-480c-9d33-a09eb858fbb7@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:59:13 -0700
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
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <20261019-ninja-velociraptor-of-gallantry-2efa3c@quoll>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261019-ninja-velociraptor-of-gallantry-2efa3c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MyBTYWx0ZWRfX8H27uqwLTp9X
 SAkpTlwm/aQuyGf6KsrCYHHHakcTNvxxvrPYgUPj0jZBv7NuPONwQM7FlMIMDzcdeGxOTuSL8sL
 c0sBEA0AtiYJUoDKKUokHJYuhWe3Z9Q=
X-Proofpoint-GUID: SCCtxRkUxuyQZ7Rv9cQzmXXEWIdewgUw
X-Proofpoint-ORIG-GUID: SCCtxRkUxuyQZ7Rv9cQzmXXEWIdewgUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MyBTYWx0ZWRfX5UxGvJd0CVbZ
 fLhryv68fgWY86SvlnpalQlPkbgW4ypLYB/77HHpqRjmEriMcv5z+LXC889JZkomyURUy47fWK6
 4ypeYhWoh5gsiQvbXhHhSgfAvWu1YGt3MMIMabJjasbYcDBbmMDq5uVd8opDKhDdOin+cRUyCMW
 aQm+S/FVofH7Q3C21QCE351DbXTiYdvy0uFO7hD1I09F36Xg5ESQsnYRmP8Xaw9RbpFcJIOtEfV
 apYbmUK/D7EpwYvWrlTPGcOn4tCCR2mnqhqENl5ws5K9iNxRqwgPE1ayNXA/E3w5dDktA9pWyv4
 SFSwPqMwEj05iNtanYW6xJteUd+Fk+8QQruzf6/CS7Lh2bYcIjgEKFPhUdpbVDOSWtXJ5gxbIdp
 RFSqIyqo71WCqz6alswzvtfCy6uoKaGBiW7IIl6X019qnjRjhlqc/yXjzV8/moibtNzyEap9q44
 e8N8YDapc5KALUDT9EQ==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7d624 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=sn4hIavaYfXsKkgl5soA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200083

Hi Krzysztof,

Thank you for the comments. I have replied to Bryan's comment about a
single generic yaml file. Based on his comments, I will drop the next
version of this patchset with these comments addressed.

Best Regards,
Anusha

On 10/19/2026 12:16 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 04:54:57PM -0700, Anusha Arun Nandi wrote:
>> Add a device-tree binding for the Qualcomm SA8775P MIPI CSI2
>> PHY, modelled as a standalone generic-PHY provider like the existing
>> qcom,x1e80100-csi2-phy, so CAMSS can consume the CSIPHY through the
>> common PHY framework instead of driving it in-line.
> 
> A nit, subject: drop second/last, redundant "schema". The
> "dt-bindings" prefix is already stating that these are schemas.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
>>
>> Follows the qcom,x1e80100-csi2-phy schema's shape: a ports/port@0
>> sensor-input endpoint carrying data-lanes/bus-type (D-PHY only for
>> now, C-PHY bus-type value is accepted by the schema but wired up by a
>> companion series), a port@1 CSID output, and a mandatory
>> operating-points-v2 table plus power-domains/power-domain-names.
>>
>> Unlike x1e80100, SA8775P's CSIPHY has a single power-domain: the
>> Titan Top GDSC, matching the legacy in-tree CAMSS driver's
>> sa8775p_resources.pd_name = "top" (drivers/media/platform/qcom/camss/
>> camss.c) and the existing lemans.dtsi camss node's power-domains =
>> <&camcc CAM_CC_TITAN_TOP_GDSC>. It is not OPP-scaled, only kept
>> enabled, the same way x1e80100's own "top" domain is.
>>
>> The PHY takes three clocks (core, timer and the shared CSID CSIPHY RX
>> clock) and the vdda-phy/vdda-pll supplies. The core/timer naming
>> matches x1e80100's clock-names convention for the same pair of
>> clocks.
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  .../bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 172 ++++++++++++++++++
>>  1 file changed, 172 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> new file mode 100644
>> index 000000000000..b66ec2f14189
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> @@ -0,0 +1,172 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SA8775P CSI2 PHY
>> +
>> +maintainers:
>> +  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
>> +  CSI Decoder on the SA8775P SoC.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sa8775p-csi2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: timer
>> +      - const: csiphy_rx
> 
> You just named it basde on clock name. Instead, name it based on the
> input name. csiphy is also completely redundant.
> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +  power-domains:
>> +    items:
>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: top
>> +
>> +  vdda-phy-supply:
>> +    description: Phandle to PHY supply.
>> +
>> +  vdda-pll-supply:
>> +    description: Phandle to PLL supply.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description:
>> +          Sensor input. A single sensor is described by a single endpoint
>> +          with one to four data lanes, numbered 1-4. The clock lane is
>> +          position 0.
>> +
>> +        unevaluatedProperties: false
>> +
>> +        patternProperties:
>> +          "^endpoint(@0)?$":
> 
> so not a pattern really and just endpoint.
> 
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              bus-type:
>> +                enum:
>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +                default: 4
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +                items:
>> +                  minimum: 1
>> +                  maximum: 4
>> +                description:
>> +                  Data lane positions following this endpoint's clock
>> +                  lane. Positions are a per-port logical numbering, not
>> +                  package pad or ball positions.
>> +
>> +            required:
>> +              - data-lanes
>> +              - remote-endpoint
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output to the CAMSS CSID controller.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - operating-points-v2
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +
>> +    csiphy0: csiphy@ac9c000 {
> 
> Drop unused label
> 
> git grep csiphy@
> 
> Don't come with own style.
> 
> Best regards,
> Krzysztof

