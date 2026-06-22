Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010DE19CCFA
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126164; cv=none; b=Gv66CAS/gVJywdILOXK7YphxVeap3Ri8mLO3/gR4/bmPNGkD2gvvUJufFBqF0hTl24NzljcbIKvv0cg6rOVNsuwdsUQB57zSjq5uHH205GgFMQdeAo4BqyVs0UaRrb4HVVGVZrqFS5VQ7g9CKev6yIIGc8428t48WE4iWhbFpls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126164; c=relaxed/simple;
	bh=BizhfnJCvc1hwpxr4UCjPSeJMxdZf0AOEqU+ZpUG4cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bncqy9tJ+Ro8sXxTidvCJAs8A5KpKKDsAsD+J6w6NlhO8Ka6sfP01SaBLBBNzfDdcoL+qXwkTzFOM3KZ8LDHE7MRIXWpW/tixOkq6vimVE63+/dEWvffoM5UMLnLN5iwM5xMjux99baISigVNiYkhMTqXbqAgqGRT/Qu/92hbpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNgRdcHs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEIpNHgB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNgRdcHs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEIpNHgB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoo8f1043537
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrqKexHGAJvP/Ujx2c0/m11d5lUKuqak4XFL47jwQd0=; b=JNgRdcHsurmzSiOt
	+k4FFN7bxFE8uWCGka3H2jlC2t72I8jq88IzeUVIDE6yXLAjE4d6ql5KNzo7rcT1
	x4Ihms4PMctnBTKxGlSF0wWAE90/uVbww9ZFw96YLMGEK+M7mnWOeWUr6d62tf8J
	b3FQhrSuBjcFZvFCiA6/fuggKXJcORIDtLe79LsYn2mc6UyzntzLMkQeaE6oBSaU
	dZJiV+WOoUTYIsc4bikDnFVDn2pQqrHL4fjpoZQ2LlnLoUwgYZEZaKs8ClxcnpvG
	aKpbOPG9XwUB1lwDuOpdxQum+z7pVzRktmrvWspBb3g+Iz2pZSX/HmmZClByDBVk
	VKOkbg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5pa4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:02:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ddecbc403eso9137286d6.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782126161; x=1782730961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrqKexHGAJvP/Ujx2c0/m11d5lUKuqak4XFL47jwQd0=;
        b=KEIpNHgB1Q4vm09MxCvgynj3M52DMFEEsv5pfGrrDnigqi93UwA/7oqr16DRL6UmZB
         /3mGz5DeMJnYoMjn5T0cY90r2fF9Pj5/yfIL3yg7LOMKXngIb3J8jA94T9BpSljNEWXU
         1bshWHSEgYmctqGv6GEgS5+fO5ZGBkxqbpR7G1sFDA9YhwTmWrpgIOEJVqHvgbsXAuB9
         5oh34RQAyMSMPTC3rxT4EdlFLIXJW2iqzv5lzY67cQ25LgAaKTDmWIFj6X1eMKbd9qGa
         tFfPl7SVLFjroqaECpFU3uL9b6sWQEW4Opsv7vofFqMnnRG7b+5gd2qBKzGkGB7ksbwg
         xrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782126161; x=1782730961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrqKexHGAJvP/Ujx2c0/m11d5lUKuqak4XFL47jwQd0=;
        b=etG76vyK7qd97foL6S630/Lrg4JBsiSVJlAINZoWSOidBbLjIkGnFs9c2SDOrnGkcB
         22kn52CAXNJ4n6n1JTeIh3J1lZ12EerDaozAZG5gVFF40ZWg+MkNo9zXQl7aq8helUdR
         apfIcnMUiUQwU1GGqeem6N19mOP29Y4d/w0DYKUDNCHqpLfWHj2XbO3e1PZ6grpqtVzJ
         jsByWWcEJtDyuipjkEYmJGTwo9X6oD4PfdqenjYNYnEw/5GUcd6+shlM048j8hiOGXdI
         dtCEbtQkMF4hrKvqjn3mU43uQ4NuIJE76jYF5NuElVgYvV2SchhzwQkBBDySA9hsHQp/
         WEPw==
X-Forwarded-Encrypted: i=1; AFNElJ/2QXWGsS2G/k996joMPFZyyueXbynEbWNZzVa8gGSuMYPnoct+LGpp/RC7h5GwnltSn3lB2EyMb+lo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+z7Ymyw8EyNEcdAsXomq4l/NVpi2eLM4MYUzdn6jV9ofFths
	SHAkyRr+fTeKq7F/xabjkfKzCxoVMNIRz0xzxxm+ugvZJneXxyj/5ZBIiEruNm6Men/FoyNCXVG
	rvqgsv9I7guRMHw85wFrdzVMoYnRWQi3UUFrh+84GZfuUE2IYo2skTXBDKaGbEA5S
X-Gm-Gg: AfdE7ckie3tVmu2LuJCx4KNIbhgcYnnDj+CjYnzNPq4of16K1mRdxN+Dq7ckcbiGYCy
	XX5aqf6xx+/Qdq0wqZmvILeNogG8EdHG0/+KoBvXHFTWKmu7DbG97Py9FdWZ9wA1fdBNZbcaCU2
	KYgDvKwMh2CtH6vGSPCM/Y964g9M4GyVZg7VjQauQtlu97YHTjgdJZliZdSajIA29Ovg1TdHaQC
	m/3VhdnuNSeJDe6XHqWs8NAZHJ76Bti96s1RHK9y2hWhNQVpFiI4B7Ih7UO9gnrbvA10VJzmT8p
	6ueBUshsLmcrERj2W6jL7YOJMmwl5wu1TbYZCLBxr4SuHOP4ROleDOLCiA2otL8EJl1OTyNPDrV
	YbhKwGfcaMM5d2T2ZM6qyjaF2udqkYwFXZCU=
X-Received: by 2002:a05:620a:8087:b0:915:769d:56e with SMTP id af79cd13be357-9208a8c06bdmr1415067185a.1.1782126161115;
        Mon, 22 Jun 2026 04:02:41 -0700 (PDT)
X-Received: by 2002:a05:620a:8087:b0:915:769d:56e with SMTP id af79cd13be357-9208a8c06bdmr1415064085a.1.1782126160580;
        Mon, 22 Jun 2026 04:02:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5ef8eb38sm335761766b.28.2026.06.22.04.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:02:39 -0700 (PDT)
Message-ID: <50d92653-b403-402d-af82-a037114c3aab@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:02:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwOCBTYWx0ZWRfXxAMnApfODnPM
 m/U8XKwChwCFwCbpKIYu0OVqdD832v4VcIyYBhJXClKooTKhAQbRQbN52MaeIDMrv3+pw/Blxdt
 Ks7MfveESAGpnLdMnUDz3gXmUwMnRJmLTyqegS4OqdrmKeMD8++wKGMtZ0Y95jm2dq7EYXyrNoZ
 L3Az7nfivcgz2HastGcbfUfiWe6JGvxbdjQNcaoWA8EhUnj5jULMnlYRgfD88Y5gXiIP7BacBiF
 60HHu5j8/yjfjauubzZivEUUq/5PzHxJ6jqa89n9eVdhrPEzIs+BWJWcc8Yrd0qCCIj9cpe6aMt
 CiKUvlNaJRingKrBOxM8ycJtTQqv2MFHrALXkRWATpoVAghUuvC5Qw4Oos0Fq81QcWytAagQnNK
 LZ3WuGwNYDrrzhMjSLJ1x2rtDMOw5KN7/WNS7EmQ87px1CuwbZ3xTKZhrObG6G3QhrfvChxctEc
 4oZkaGlr0+ht0NkjWHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwOCBTYWx0ZWRfX/VlYqwI6csNH
 fBiR0IeYjLjen16Bh3+NfxUj6gvSlTUGD52SYJJadMj+i54dB4KhA3M/DuYSbTZhcWsKYOkoOoL
 5XPsYHO/z8H/hqS1/Eup3MjH85jPjT8=
X-Proofpoint-ORIG-GUID: Fl6qeashBQaoYUQEhJvOtnAU5gNT3DMf
X-Proofpoint-GUID: Fl6qeashBQaoYUQEhJvOtnAU5gNT3DMf
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a391651 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=_263P9KSp_576IJaSfIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220108

On 6/19/26 10:39 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various domains.
> 
> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
> new file mode 100644
> index 000000000000..4c6e6cbfbfe4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/limits/qcom,spel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SoC Power and Electrical Limits (SPEL)
> +
> +maintainers:
> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> +
> +description:
> +  The Qualcomm SPEL (SoC Power and Electrical Limits) provides hardware-based
> +  power monitoring and limiting capabilities for various power domains in
> +  Qualcomm SoCs.
> +
> +properties:
> +  compatible:
> +    const: qcom,glymur-spel
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: config
> +      - const: constraints
> +      - const: nodes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    power-limits@ef3b000 {
> +        compatible = "qcom,glymur-spel";
> +        reg = <0x0ef3b000 0x1000>,
> +              <0x0ef3d000 0x1000>,

Don't we need the range inbetween these two (base=0xef3c000)?

Konrad 
