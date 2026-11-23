Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413570;
	b=OwH3lGiAdCWpTwL8QkW7LzV5yM/ODa85QiIsaF8HYnUCLETNUHwfcidq+xFiZMyRW41x
	 /d1tEUFaMskAzzVbO9JAEvEW6WLEd5nwG0woNNaqbN6QXOO6sCUHoHAk9tKJvKWPKuMrN
	 BDxeIXSHsNEDi8oGiIkdBvjL0EFlFmNdIZBDs5f8eRzYw340yjStwdgS8QEvtggz+ezE0
	 HniQ33qDrtdwoxhiXsMomf6vBj1BXoMqttXelJvW78/nIjCzDNAltuZg3OWFOVGJGMxSB
	 O2rz58iRYekvo704NrARdF8t/3JCyOkbwQVctfBkOmnSagzSSqlf9OKTNIViJajkJ1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
	b=ijcMc5U6mO/8RQy6jOlD1o5R/duOuld7tSm/S6sZCPzrixwWXz3DVWFFGacQBrFAxMV/
	 7IBp4xAf3fFLSSLOp42A02iI6yqe53/tkICu3oN4tXGqB1YjWT+lrtr4V4M9dlDChhj+y
	 dIhBqlMBtxr2qJMrB7otTPAiWNSEcyvIDKpZhDH7wTsOUJsDElcZsa7eUz94QGldqQMlv
	 gxmi1+mjKYqlPiVwYUo3aM1suLJVAeMtbItJpGZgHy9RKlfxJi+69bnpThc+lsaVQJ5A8
	 TP6jENy1bBTDOuBlNgMrloweJpO9x+7qkEHzw406Hp2gbARDG1/PWTmpxFnbDMgGzUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YoIom/1Z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJ5IQ1Mz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB201606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB201606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoIom/1Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJ5IQ1Mz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50xqL1960992
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=; b=YoIom/1Z1MBYmvzp
	3BMsq0z1iLk1XkSMylQB8BJDr8W/SHfvjDeinB3Sa+RcIPuK1dlfmsgvwKezUOsr
	LTkFy5XBtTgJLXFD9364c5JKNR5/T/HHVxGbgegXPON37xTPOp4H6hBwgTYp+oHA
	h58C2HFLUnRNkL+vfam3HrfO2AFPIr3X56cCzXnuRdRhdFxq021EXFFggV7DX+kS
	TugRHt1MNeOTi5UZUl7YJUPoVJeFs1M/kgIown3oQrsT+sGsgV0mfLOq4SKJ9SRM
	Gk/JRNtKrc3N7e9FIQV2ZtBduvB2XV/oAlSGmBVXk13FNUle+89JvOtYYxx1Q6CY
	R22osg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6nfkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:59:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0717e54b0so11325005ad.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413567; x=1796018367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
        b=ZJ5IQ1MzRGXyolWOHhlCeBx+1W/gSzvm053Lnu4zMrStjSgJcIyi33dTOi27SradxC
         R9uh1rr6111Tt+CGuRSgS8IeqkcMoWhiGCRaHMvaKwtZKko8cSPGuMBUtISVa6qINige
         11UKDGUOaCYh+4zFP9mBDWKSV/h0sElUzimrg3XXYKFyCf0GrnwWlIMG14KBGfL0DiGU
         PtFzgas71MEHWeVflSZw4a869m4xfw4xrl3ZsONjzlyMQiiMuQ0rN2wVe9re3XesGIre
         RHBUCwQADy9VtZxT6K/ncoot91fGDHKTy+2RrRXJ9ilvM/VFMgxdKWFAcTnqmnCBzC6k
         28wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413567; x=1796018367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
        b=RPO7Kvr1Tr5Y6X0WsmBY749eQi2F62TNz1pddstkUfMRqK7WrYSeeD4JThUnSKUFyX
         Hylhq+Tv9vVbfKZ72J4TkE5ZyB7RHpb1/DrbtbbYmK6o13zw5GWI2iFaX23GEJ9Zyv2s
         fFdB31XvjDdXzg1D2lxi01M2C96KtmUOhseBEcGBgnw3qK4vkJ7820PJIynKWFuZiUYP
         yQD19jRtInqllf/moJg6QhOkAUXU2eaZrua/ALDZphdX1dauxf/0fdrR5YqYl5bbAqCu
         elEw7snQsN3vPzuP0l/vIVK0qqLB7jizRlRW+BPuJOKNoIjwtCHtzfiLcSnmX/MrU64C
         oSrg==
X-Forwarded-Encrypted: i=1; AL+hErEcMZ8nB3wQbvKp3Wryc2wqvQXqQCRzfx3mfJg0yzL/9V6MQPMnmsSF7m11Uxe4LBWeUF7EAR513IHI@vger.kernel.org
X-Gm-Message-State: APuU4Z+UXQRVrU3L6qcV7Cxbk8lnfzNV9kzFFSZkkUq4FJge8Fn33e9R
	SE6tGdXCmyu5WjNVKIk0q9BmEsU++0CLGgAzqdnlXN6qbwv6l1MG6pHaoSdIzmHNt5KhfSoyi3b
	EUxbme9+9VKcchKdMn668uBnnRMrmw92tImpNf5DQcBD6bjPb+E+l3vHTZgQevcOT
X-Gm-Gg: AZFdTZf/oW3ASzfj/vP2SUKUJUjUHgJfyZghz0+b4PLMsM8K+jMAb6KxMGDFK/1qDPH
	2nPqNNzw/d5PRVowYtzinfaQieRFxxPqQqLrQC6NGxaVqmCw5uFNqtfotrbzvA1K876L3QXF703
	2lHuf7uQjuGFoRmk3zWn4xJxqwChez8C0ghXFFtXAJYFPnQhy6BG+Nu2V4hu9glAuTAdSjxpzOQ
	YFp+lZccWx8Y0vBqQUYMyPCawq6Xi3gCgKNPOolPnI707tBUQ83YPGxUJCGo84EbzEAy5WznEjL
	cLmIqH475V5SOemvi/ftq8LBvC1TFht7wJ0BocTHACIqVwWWNDkHdHJXFR6FKdl20nu+JVrRNlm
	qPojmg9nQuVa2vGOpgkxgVZ1LhIRcw2OToDrmooCSgMHE6uyo6CMpr4o15PqHwA5FJoZ9IA==
X-Received: by 2002:a17:903:228f:b0:2f0:7707:2294 with SMTP id d9443c01a7336-2f077072a3dmr45183905ad.22.1795413567525;
        Sun, 22 Nov 2026 21:59:27 -0800 (PST)
X-Received: by 2002:a17:903:228f:b0:2f0:7707:2294 with SMTP id d9443c01a7336-2f077072a3dmr45183525ad.22.1795413567022;
        Sun, 22 Nov 2026 21:59:27 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm46286895ad.64.2026.11.22.21.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:59:26 -0800 (PST)
Message-ID: <81dbfe3f-c88f-4fcf-a460-ba3376d736e9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:59:18 +0800
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
Subject: Re: [PATCH RFC 1/6] dt-bindings: soc: qcom: add QDCP provider
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
 <d0dd4fad-2f56-456a-91ee-737af0f3b4e6@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d0dd4fad-2f56-456a-91ee-737af0f3b4e6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CIMe438haFcNabWOg-EB4nRiaVv71goO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX2iaJn4YJdCgz
 5ZTWBIRbdNicsKBZXAiM6bBFDXHJOoTgf2MlVOZZtVsyNwNnrcDhLfF9Wp6vyTDz9mF/7AisLS2
 YJguQusToU94ptJ7Dnx5s5suFoIvP98=
X-Proofpoint-ORIG-GUID: CIMe438haFcNabWOg-EB4nRiaVv71goO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX7tAPzth1vN97
 ZIDLBWy9g8mXVKgEvnoqJwLRBfb7T1sqzyRlH1tftiWm64v9Fu2Sq+DRMjgHAp7GE17kkYCWdhz
 wvICo83o76tcVANvMJBbG6N1RCZ8nBkBzXokC3oZlq1dNvjkOi8Vc64ofpcr7j8I5Zz5QJwgBVQ
 mK41OUFow0vHGGlKgldzV4Uq2HkPvptIJvASCwXTwesxi5aF4V+TBBCW/a4crR+VP18NXu3caIR
 4VEV6TsFvosvwjjfioIbR5tvgwqJ60wAM6GWDaweKC6IDBULSys3LEI9PbK+3fsrsR6XvLtlr2l
 wDaywDaTFZ9sW1ugeKWFt1pwmuAQdyP5MgL4ripggNQeZINSkH3kbucwes8OwLRIN96gy3oJEvO
 xSFhc7u7nSRxH9JRxQqWrFNxJLrAhuPYcbnGTV8ENyb6QsktadC+49R00pFW9CgzfQSmES01WtC
 t46nYFTHPaoj4gx+kJw==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03d640 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=uD7aXjGElm0TJE3nPE0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 11/19/2026 10:00 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 10:01, Jie Gan wrote:
>> Document the Qualcomm Debug Control Protocol (QDCP) firmware provider
>> node used by CoreSight debug and trace blocks that are owned by the
>> Qualcomm Embedded Co-Processor (QECP), a separate on-die processor that
>> runs its own firmware. QDCP is the QMI (Qualcomm MSM Interface) service,
>> carried over QRTR (Qualcomm IPC Router), that Linux uses to ask QECP
>> firmware to control those blocks.
>>
>> The provider is a Qualcomm platform/QMI service node, not a CoreSight
>> graph device. It exposes the qcom,qdcp compatible along with
>> per-connection QMI service/instance identifiers; the QMI service
>> version is the only optional identifier, defaulting to 1.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,qdcp.yaml    | 81 ++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
>> new file mode 100644
>> index 000000000000..ee0a66b12dde
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
>> @@ -0,0 +1,81 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/qcom/qcom,qdcp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Debug Control Protocol (QDCP) provider
>> +
>> +maintainers:
>> +  - Jie Gan <jie.gan@oss.qualcomm.com>
>> +
>> +description: |
>> +  QDCP is a QMI-based firmware provider used to control CoreSight trace
>> +  blocks that are owned by the Qualcomm Embedded Co-Processor (QECP) rather
>> +  than the application processor (AP). CoreSight-facing consumers look up
>> +  the provider through a "qcom,qdcp" phandle, naming a specific
>> +  "connection-N" child node rather than the top-level provider node, and
>> +  issue typed firmware requests instead of programming registers directly.
>> +
>> +  This node does not represent a CoreSight graph device. It is a platform
>> +  driver that establishes the QMI connections used by consumer drivers such
>> +  as the Qualcomm QDCP STM source and QDCP-backed TMC/ETR sink.
>> +
>> +  QECP exposes more than one independent QMI service (for example, a
>> +  separate service used by remote ETM/diag sources). Each QMI connection is
>> +  described as a child node of the "qcom,qdcp" node rather than as a
>> +  property of the node itself, so a single provider device can establish
>> +  more than one connection. A node without any "connection-N" child is valid
>> +  but provides nothing for consumers to reference.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qdcp
> 
> Standard comment - compatibles are not supposed to be generic. That's
> why you have entire commit msg to explain any oddities or deviations
> from common rules.
> 
> 
> No resources here, so this does not look like separate device.

Thanks for the comments. I agree that we should introduce a 
device-specific compatible string with the corresponding match data. The 
instance, service ID, and version are resources specific to each device.

Thanks,
Jie

> 
>> +
>> +patternProperties:
>> +  "^connection-[0-9]+$":
>> +    type: object
>> +    description:
>> +      A single QMI connection established by the QDCP provider. Consumers
>> +      reference this child node directly via their "qcom,qdcp" phandle, not
>> +      the top-level provider node.
>> +
>> +    properties:
>> +      qcom,service-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          QMI service identifier for this connection.
>> +
>> +      qcom,version:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        default: 1
>> +        description:
>> +          QMI service version for this connection.
>> +
>> +      qcom,instance-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          QMI instance identifier for this connection.
>> +
> 
> Please don't describe firmware contents as random integers in DT.
> 
> 
> Best regards,
> Krzysztof

