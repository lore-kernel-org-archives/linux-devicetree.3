Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680420;
	b=dZnf2dOoU9TiUNU00hPNEc8MROZwCX5wFHBvT0rWWfUq/dWipp8xDOWB29fxuvy/5kgD
	 Vq52xwShaEBXxmGotAqy6MdD2opWPcxw9TEgr8fynhRhrZc4R5+7oWX2Lr6VHtRt+5vSg
	 Yto0T3/elJhW+LH86QXcEn3r3CFiPJsqLmaTaaUxxtZ+kaTlgmv8R3zUn8qoxNtA1dnor
	 to5H3t28ayjrawCvM7Sq6tGVVXf7PQZQiHrRzlUUvWZi9xdRzde7Y9wVsTIj7+Znzz4wV
	 QdBxVcT9Z8oIHodbj54w2qAkwrC2keX7khNi5Ch9ov8N0IcQtlMtSIQ7Smen2C/kquw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
	b=QhBfP98DHD12YuSJ3ay3/4RCQiUXxBTe/YGOqjZTKgOqq4tzWsVU32l2fvwWaWAanF2N
	 9myafG/EptnaE3/MdwVP6DAlN+qwBBfmv6Cmx9yievgq5tLU4OkTVqXZ0qWaK6bHjcIoT
	 KE8GQZcarCYGUoCjco6CCFU5s8kOBsz054T3fkcnKJ9FW5D6aNJIMIJBs3zwlqey84a+2
	 iiuUzed99mncZ+kMkicgXyfw3m/EzsvKGOLRY/5WtKNFMvwnB0RB/umMH2O4uQjzPebab
	 z7WHH55+PHmKpzH5Zb0pyr88IHCCHFuWrZVoARZqarVozsD0Bqsfbiw321mkr0lV0pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuTiIGuk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRGxNSFW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A04606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A04606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuTiIGuk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRGxNSFW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7j2B8131497
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=; b=cuTiIGukxXzABDFq
	jqGVYJsu0iutdk+Aa6KvmZuc0na2hHus0NXjieEI2uymsQsFayLc+UEn2Gq1OA/s
	sdNInMq9wfq6081GHTNTicfbLgYlVLDjnr+q7nElF7hoFnmuVYxn7c71tk1MXwA2
	umispOJGej+tL6KnYZcx/bRG2Cclgt7WYRUn7WFF+3CicgoQLPSLQhhFMi0oH9lI
	xtptUzDZRGpCe0WOmX3s8MaSlLNJUxJOYNNuPJhLuh+bv4kLdF6kJWGNmcfmjKpy
	3em34HXZB0x2cFpDQ+DhqplC+xYKb9FfRw/S28Rf133ijOYCYRx40PGmMDCcdwFs
	ewBrJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne02hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:06:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92137a593c3so7322796d6.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795680417; x=1796285217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
        b=DRGxNSFWBGOg9sPyUtsxLyaRPwh/ftLTEJb9v5yoKK1HPhWb//hEygsEosCdRQZJn6
         6foNLXPthmcj79cqGnpuxLDRlPSU3tWRedK8vPynAhyXWqZEskz+bbcMDgXEzZ/CUmJI
         Fzi9HEBWbha22gRJCX3nIHTfkT3F+b2hd03bJIYXLFakPvmGKKu314cNdq2C+nyWnl6a
         KQbvGv/TJbfXVNDxO7FogF1cG0Oi+HE4Nwnqxw8GGX1H8hLsGd5kArFcyREAo1KSopq2
         pAIK6Qn3XRO6iub3eUbLOfe4sZrpUVXHqmEOE4EOn/z1lo1Yzs8EFqMyytGomCUZklXr
         G5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680417; x=1796285217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
        b=ez3SUil7+89SjY5yLc2s20GqilCnPhoFHkDUVvPCZxJHPtkBcOycGx+fci+lA5t2ZF
         U98KniglQVcn8Hnf+MY6KupuNjG68R7Tm8TWlveUTpFOrknWXZhRr1vTYX10VXi0uw/y
         znSDuhBzEmFLpnlRLrYmGuw0yg5++H251oJv8RMxNx05KWI6QVmsrBCfaummr9KmR1fX
         wfg7Wa6uxoVM7yyLLh26EZ47vLcBhS0EkPfyFaeVXW5K/9ViJamNXSO1zWaZeKQ6FqWl
         2ehKGDpjdHjYSSdrsAKsg8bEL/tKi78DVLewyO+o7Pirl0ierWpu+im5BUSxO63Je5W0
         aXvg==
X-Forwarded-Encrypted: i=1; AL+hErH0sYqEMlETSqOgVFHAyG3APEMrFdOlOn63EVHgYDFFSuAMZQUNeXfENKps76RNL92vHmAuTvS+1cDy@vger.kernel.org
X-Gm-Message-State: APuU4Z9MJmxFw798tTH69DGCOY8+c64A54NkZLV7xtu0MZQ5hLJl6YkO
	CUotpCcl/IJ4zY1LQOIsrkyMacaT4u70GPtzQo6chcr0Dbr1+U8IcWJY1c0n281WDbiyNv9HXPv
	ke/2zNXfnLGhoUcb2Ymu/RMIq0t+Bii55SP/95cvpWvzi8BwmvxhPpVJ/oZM7zfJd
X-Gm-Gg: AZFdTZdNutxw6o0b3I679gUxLyOwIDQC3dUpni6sbWV7xktV10pzhHEFkNsaBFWWZuJ
	vXs+vA+rzyy8TwynMxlxmy9cUhKjOgFo/RYq2d1SHA2jUg0fmX18V0Dmv+Y8mmg4TJSOqlVtyVS
	rTGBluz7NMz2Cd93HcJmlwE9oVMQGivJ/g8w7MmxgsHXtnP6rmbd9s5EFP2YOwFYo0xgXP1Woqs
	xEDoVCdu7+9SPv8cE5EuubVCT7MZihTvtUxRl4pKFMK3uwH9m9pciP0DfzQJPSmnubn5OlL8CUg
	Tstbmu2uHXj4yrIjzLZvb4n/gVAX5WCD7F4Qn1K/W64bBj4qlgoM2J0UIjGLcxL1EVRJhIhihU1
	WvtEHW3hbvuMVZVmeMMHmp8PTAxAYGR1VKSFZowmoczxkEFX6umumYdVMxTJsQi2ZU57AU9o=
X-Received: by 2002:ad4:5ec8:0:b0:921:223a:fb7c with SMTP id 6a1803df08f44-92134773937mr464759606d6.0.1795680417015;
        Thu, 26 Nov 2026 00:06:57 -0800 (PST)
X-Received: by 2002:ad4:5ec8:0:b0:921:223a:fb7c with SMTP id 6a1803df08f44-92134773937mr464759006d6.0.1795680416471;
        Thu, 26 Nov 2026 00:06:56 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm743942666b.20.2026.11.26.00.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:06:55 -0800 (PST)
Message-ID: <9c634c3d-0d74-4ecf-b9e3-180c2d602862@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:06:51 +0100
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
Subject: Re: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>
References: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b07e8a1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=QI7CjI1Wg2L04FBskPYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfXwppeSuGa8Bdc
 VmzTIKprhpSoiXLEVqzjZoWUREsK0HRbFiRMPVgy50LfTEN8L6zI4r1ExF20z0JBMbmfyXQ+7aO
 aBrSCAlf93khBA8m9NcAXNHx7drVrWwrRkiUdjk45olvG/t0a2x8z5jztloyxJOvluWsVnUzvPg
 b7XfH0DEEsf79+jOnEy1E/zGPL0yRjrO3QwJcSJbFFd3prxdrqigJ2LDdIuEcemvBkBUNmmYsk0
 tPQd1JAMRMJ/F/PiOinDKoPJ3xdnDjRIkZCGHDSt2XsnXhIh21j4us9keguu18QIY7lou0VtjHg
 r1LHZKaRtj1N/b10S6JjmmS8T+KjcsVmu7WLxph8wMWlBXnYvNUzIuiIYebRM+vIMtRirFMyuOJ
 JblA3xbj1rtd3JIdZHn83dn9Y7XgcLY718dnlrfmJTZ39uncI/0+B0fktbou7Mt4aYWaXteMIvu
 +QFzBQbeIurkKTz1UsQ==
X-Proofpoint-GUID: tQLTIC6hLbEjND-T0BlWslphq5JSZs0p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX1NvY7BwCCbY5
 ZcTUNY8hjtc2Npb4pKIHf9V8sGe9aHZZOTpIBrT70TiSyjOVePzjfFAgqnnuRo1e43sHb4iUfGL
 MaB7/f/0/mw05Z1rHkzxOHa41TG5TgY=
X-Proofpoint-ORIG-GUID: tQLTIC6hLbEjND-T0BlWslphq5JSZs0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031

On 11/11/26 5:15 PM, Hardeep Sharma wrote:
> The /memory node has no unit address. The dtschema root node schema
> does not allow a bare "memory" node, and dtc warns about the missing
> unit name with W=1:
> 
>   qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
>     node has a reg or ranges property, but no unit name
>   qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
>     {'device_type': ['memory'], 'reg': [[0, 0]]}
> 
> The bootloader fills in both the base and the size of the memory node,
> so keep the reg = <0x0 0x0> placeholder and name the node memory@0 to
> match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
> msm8226 and msm8974.
> 
> Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
