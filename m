Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743040;
	b=VOPhY4ca8kVUfwRdk4nyfYs45gNWP8q9+3oO8toKtQ+hxud4Z1gR+uyD9/EJo+yCQ6yc
	 pu5ua2V11bE8bnP3RUtQfrWLZStQTpUIHzjVvD7mQdZp7Hn9rHzkm0azaIIqcHM66l3iQ
	 hRAgiWPmTGolzOC5iWeHz6/n9AMiYOrbBzV0EndmTjitVRjEcZkmS8NxxzbDhIBF61KZ0
	 KoIHusLdDbOltcnqj4ZGD3KRKE7zb8xGiuzOiK6blpZ2a8dby3DkeATe/Fb81t7oEzDbG
	 KYkMWEUJ/AZn3smCQ5Rhtek4dH5dM0tfKxNeVxgjSIKdkpSD3Dd6l61CHBG31d+4zjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
	b=jJ+W7iL5B4gtgSOPVGcSeJD6k1l9u83Em/qt6TV+lchRFfHkn4D4NuJ84sI7MS7G0qIN
	 EDXlsKQEvICHpZmdNE+huooPNloa3mvLQGJY8Hx0/SxMJPxmqyWY3uVdAvqTcF0Zlhcvo
	 dVohu/o1XrWzx77ZMzDvbHTDFs1t3wAxDjXKh0fS3cPg50bEoQQ9K/0QWUVMrNBZAyMV6
	 QFQsJAERAvKMAiULM/VS5Ef8MtSA0zCR7MNIIrkqW7+eUwLYHNTiwVVAuYFXIHrtpccmp
	 V3EtnrwC5Jm5ox+8kzh8E1j0CNcEZWxCrcYUZclnpiWcTRGClgWHalq+bqMmr3joL3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7fHBr2Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GbMAcUv9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8213C606A31E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8213C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7fHBr2Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GbMAcUv9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FN8Y1552657
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=; b=U7fHBr2Zzr5BzR0l
	GZ4p+H51nKm9WVAQPxZtK5Fxkawu2eyIUw8uq1dLaEEiMmoXZzBSEOt1Ca9eoWJh
	Lmldut7xSV7XBgCfpN1LqCL+BlRp56ZaYaSsa4GwxE5GF1t7f/hD6UuuO/Nb3+Ie
	pzBPhe/0u5Dl7/AVXrCPWXw/OJQQoSxrCbRu2YwIGvD6Eh/ZW3w29qV+5Ex5n93u
	V0Ekb2Macw7YJI7/WfuTkPsM2grc2qboRWV1y9a+c6TX6khVSg8MVWZxO16ccf14
	DwWONyUX847Rs1JDb87TeUaYuMA/se/zirkPxWskU8S8qCLB8g+30G4DDdGoCCK/
	zHAsZw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttmyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:10:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso1216714a91.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743039; x=1793347839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
        b=GbMAcUv9rkysfCZ5kh4emmwdMqxoGV6TYnJqfhJNtBKRxqeO2VTDdS/026mXUR+xX6
         XE2Gmv2WULTsyZSw4ypzlLVqkD62W+Eey3YfN5S4MU3Ra0MUm8C7CVD9ygtIymN1smvi
         GQQTWpWvu2d8sOvcVl0kFJTcoUbEuzCb2uil97MjXFNaf68A9YYRotpnae+REzKfbs/G
         PJSGxDWzkgoTSe0b1tZkDFZwXsrC4X3b96DQmaa6tHfjz0lM2dYW9YC1R9kuqwGsJlnW
         iOUnhpFrMMjwMHKLtn8EIj2DKEDZoJLpOMq21XE/BIbKm7Ovn+1CmE9IM4engl0wVYQJ
         H8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743039; x=1793347839;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
        b=WMgMnfwv9hRsZoKidn1sEKT7TT1LTHeJviCB6ldfr2wg7NejyLslD9mWCH2hGMX8Bx
         VIUBeeI2bms9j+7uxpuaYEvc7exC8Zz1898UoOyyN/CvvDZuIBtz1+e/Dbtgo/OBNdNu
         5tLpQDKcg0ZYLgvbKcW+Oz4WvAgsv3uhNK9lc4H3p8bKRlq9H405DYXTad1Dg2op2eAW
         gvaOcL2/LGjN+vdzK4eM+itmcz0oZ48o92uaIcEeMs7S3lo6FBPNtWN6zj893RNKK59Y
         Y8Hmp/mY0RrGMsFHlERk5D1onM6bsD0NZoP+tq+SXFKnlT+EVpEEGCGZn5Dnz/X3v4tb
         Vpsw==
X-Forwarded-Encrypted: i=1; AKwUvBzAbbqrUMPqhwRd6fecLUx0rBRAu9FLfz8/jllq/7DU5sENNVTWH6N8E4wKCu1Di5x6ZAeu0XBZ1f2J@vger.kernel.org
X-Gm-Message-State: AFq9FYLK6uqQzPQe6priAhg/iG6nCycDhT99VIjtkZ2Dsf8Ap65kxGjc
	rSJyakkrcP1a7wz02SNd2fheR1IIoyNEWe3tPoHR6zSgeyxWyS1ndTNHO5mgaUECxA2c8xxVNQi
	/P91GEWfFF7QDKByVWLwLGOe2hEEo2xu6Fv8o3gpNa4GRo1nEA82AIWxJZjbtHqrX
X-Gm-Gg: AYBFou0AFQ7jk3WyepJ4AEB02T9i+dxVaAAqtZI3I4UouhPEojWQ+RJ1H+8t3Ova9fz
	TO2jzmxS3fu4mVKUII7BrW0zNCu9zJNSqGl7qHuIDXI/YRbcwmtHVu1CARJW5RtZzN6lHvM/RXN
	sJYVQK63aJ91aEbs+N/kZJWTpEM5LsxHak4jBDIdT+5KszjaGB8REI9ZLBF8xtqaPQHURn51CCO
	9XAoPrNa7S9kUwsD4USRxnbF3t2bsGrJqG7LxgCgB5ABsC71At0Wz4PGLVFr1bajEp5b4hRoXYQ
	Qlj5VA9uOXgG6hHeX1h9S7ZVjMC+VjtFTB2yFU6VeWV+h++KrwsYL2FTTz+ecxiyF9OlflTEbi1
	DXlgUaykXziNt3iy2GCc23nD3fs0fPJhv2Q==
X-Received: by 2002:a17:90a:dfc3:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3adce072ca9mr1162580a91.44.1792743038039;
        Fri, 23 Oct 2026 01:10:38 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc3:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3adce072ca9mr1162541a91.44.1792743037308;
        Fri, 23 Oct 2026 01:10:37 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb0a11fbsm2517749a91.4.2026.10.23.01.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:10:36 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <ae967eb1-cc54-4733-9e89-bc375e1cbfd6@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:40:25 +0530
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
Subject: Re: [PATCH 01/13] dt-bindings: display: msm: Add Qualcomm DCP
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
 <20261015-heavy-clam-of-sunshine-8fe831@quoll>
Content-Language: en-US
In-Reply-To: <20261015-heavy-clam-of-sunshine-8fe831@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb167f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CvYCOFMdU_owP9l6gQwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 9vt7yFUGv08McDQUHAfwScQMhZfF6r6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX1tOsdQNizCh/
 J3b9GTujQB6IDqKPIr0CHgl17D4ono1rNHrBm4bRHp3jOd8xUlAgRHiPqpEjMQSuij3fCp679tp
 YLd0h3uftsXkQI9CCvorxZ9y5r6RYbgInV2SWDDeTgAfOhDe+uD7fHzjvuBQN9dNdbe6wv+Au4P
 5vLvrTMpI8dH71qt8eS3e3Cx0lPY0AwuQ8fZAgQtK9R3Zk0oSQdpXi2mS1mtFP7JDy5TeVwyKrr
 hjxvQLhQpPq2lewgcdGEaappuEKEug0wKkYxKVK/3Yh54V9FqTWltJbXXVmYxwXBbRy3QKLMEKC
 HOTB6fuoa7tQ/O9Fpq8vRb+1GWWlrk+AQZhcWsnKaYN7QvLDdZdJJTwLkOwiThCpxZkGF86WlqQ
 NK/nyaDvyK4XtHSnsWwgmUErLactOb+lUzPl3x0nGTR9wOxFE2bRNTl3aY4xy7QQfdJNtNLOqd2
 Bwxp2p5KpnPYdfCSMQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX9pdOp3JgWbxO
 lVta+pwnHv7+wI2TV6Bu0+FgT0g2Sb9iVd8l2QVdsM6EryHGazf4s+HOrtXDeme2mrmPlH2lyXo
 sO4qoHYaVWiGmnWA4nMthHtn4p7bFTQ=
X-Proofpoint-ORIG-GUID: 9vt7yFUGv08McDQUHAfwScQMhZfF6r6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032


On 15-10-2026 16:20, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2026 at 01:08:21PM +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the firmware transport,
>> display topology, IOMMU contexts, and panel connections.
> Due to dependencies this cannot be tested, so limited review.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>

Thanks, will fix this in v2.


>> Add bindings for the Qualcomm DCP VirtIO display function, including the
>> INTF graph and DSI host outputs. Document the framebuffer IOMMU context,
>> IPCC power-notify mailbox and interrupts, firmware display topology, and
>> firmware-visible IOVA window supplied by the parent VirtIO-MMIO transport.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>> ---
>>   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75 +++++++++++++
>>   .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113 +++++++++++++++++++
>>   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119 +++++++++++++++++++++
>>   3 files changed, 307 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>> new file mode 100644
>> index 000000000000..f7178c66c09e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm DCP DSI host
>> +
>> +maintainers:
>> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> +
>> +description: |
>> +  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
>> +  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
>> +  Qualcomm SoCs, not specific to any one of them; Hawi is its first
>> +  platform. The DSI host and its connection to a panel are described
>> +  using the standard DSI controller and OF graph properties.
>> +
>> +allOf:
>> +  - $ref: /schemas/display/dsi-controller.yaml#
>> +
>> +properties:
>> +  reg:
>> +    maxItems: 1
>> +    description: Index of this DSI host among its siblings.
>> +
>> +  status: true
> I see slop, I finished here. Mind this maintainers summit words - if you
> use AI, you must use good one, not the shloppy slop.


Will remove this in v2.

Thanks

Jayant


> Best regards,
> Krzysztof
