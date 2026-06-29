Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1343E51F9
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724814; cv=none; b=mJUnt0/VilSHTfqE2wi+7BuyHnNjY+/b3RCNGVcN/fuYyArWvkSM3s4L1aRMesZ6A05iA8IawdOHJLpCyJMAlNi/F1/xSwwNrTgTTgf7Dmj9cxVgtrGGMkuHvZ6riqHFq+9q9ENytaCBKc3xiLQuiK+jQUljZLthluWRrRc76+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724814; c=relaxed/simple;
	bh=aeaG/C3wVAYl9nGzGVoXMOYhDZ0xv8ELPVWjCtzQ9Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZBJzTohRvuuarmyZjDODfipfUOQco4D6VG6uLDr63+4dCP841PJ+5+bz5XbQtyYJsC2x4K2TNt8dwP+paz/fk3f921H9zo/lKCPTx3cuT8DN3I0LevGd2LstoFpIC9hKNYU37zLj30Rc00F0H5xo/5FfDlEaos/rGtI1YYGyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWVUTR5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nv+xrp5z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWVUTR5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nv+xrp5z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8O9OW2348351
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lx5ClSQCx2d7oD0iKrRpdI3v2HOgXCbOYzofJpTEngs=; b=KWVUTR5j8fqWNzfC
	Dux3lXOXIOoYhOAOzal0/KsJ/tCmP0uxuABO8Yc+qAUlZQm39q1NZznBuH/M6QRF
	mRIYXZ1eFXsnOy7ofXt5IaF3dZvj0Rpsv2edaBqGTzkZX4wALsFEvz7ytuSrzEmT
	VT6AjYycmvwFwm7eK2s+NT9EI1L+W0PaRradhrHvgKS3l7CoozxBnE9DU2w+1GwY
	fsSzRcoXfGJQqGkL7aakidDDMPi56PDHczXO66I5m6JcKIp7/SMCZQWI3JL4zXNz
	00z03GEps6Rgz3neW/zEKJlGFbiFCz0hLkO8T+qRqQHfYAs6BP1KPK3/l/Lg/8PN
	gk5ulw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s08h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:20:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92daa1a0f7eso57824385a.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724811; x=1783329611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lx5ClSQCx2d7oD0iKrRpdI3v2HOgXCbOYzofJpTEngs=;
        b=Nv+xrp5zh84To4tRSvJT5HUNXc4rzQ7lXkOAh5I4MEyDDod0FTAm2I1Pe26cjx1Mk9
         V8ZQSKVTjoBh35eC3UBnr++C2X7Er52FBcWOOY8ojARlCfZS3z2gLMJ4c5bPQcAEzSW4
         o9pJQKpbp/j8/K61yrGHG4g6vjZSvclWwkPmudtD/BRQjo3x4m9IysHr1r7QCRQIzjug
         A+oa/epDc9kh3mlKha+g1NIWxbdU4oL9VQnKg99X0CU6tjs1FafuyTlgPW58CnKHt0B1
         hEi2vWWzgGHAQ8WbWm1DCw2XrZ4ALfwPHehq1J+E+vIg5qYRRMG9CRgsVS2PJo5W+bO2
         1qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724811; x=1783329611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lx5ClSQCx2d7oD0iKrRpdI3v2HOgXCbOYzofJpTEngs=;
        b=Gcvw1WQeVitk8SGIOy/p5CpbjtXWrRlq26/6dKZKDjLP2mRDSmQ1rtkp5qWHQ7TKoD
         rRnj77KyxJ3lXCbqE3Oih6QU85pLb3R52bewG8LytMKGafjkmMMPkC4up8XjSM8N9A8I
         P+IuR6SIRK10LRPW2Y5OtT2IDHVq3Z6FfAh3W1b02uGvkW4cwcQntOGDXO9J8AjM/fhp
         sLOflIuf/NNoKFC8MkL/NnJM9QvrqAf4CTrdP/GvSl2GnQW9sGYVSVGVYGQjq+57xcAa
         VCYbMflYuQRGLQJMigEV4zHY90KuWF+5qv54Ol+smismPft9W8jBAiiGi+oLmk96sLKW
         +mHg==
X-Forwarded-Encrypted: i=1; AFNElJ8U5QqyNMf2rdl70c5Mg+oz34wxjHGivo8oFE7/kJ6U8kgmCVbBa4rYeelowBCdP2C0Mr7YLZG1rMAM@vger.kernel.org
X-Gm-Message-State: AOJu0YxaDvRjlws2UDTeS2fRE0pPlRzNXJmD5ITHw+95/2Z/WEKZrIiY
	rN3YtcDeSUXafw2DIV5SAJ0ZclVAUkpX6pdPJOiuMcEfDLB8+vDSoWr29tXCkd6XENRJr/3SXrm
	kS/0uEBV5YC86tI6PESMCx+yq6skKOD9PE9wYSJFMRVcmISB5dqIvdvufHdXy0fwv
X-Gm-Gg: AfdE7ckRSHkY6f0qkhb78WMo2jzz5hrHAqzrqofI6yzl7TjqMGfNeyHT025n7gjNlp5
	fFP6P4UFk8WlOnzWPdIe0i2iqI+ABS4wJOvJnZYEt71GHQrlyPpLIjyCW+VS+kh8+fl20ZA+Uda
	dK1blQJWFJJi7G5JSu1falXVhtyitfNW59T74stHmSTWgqCQiks8nEXAlQbSkFHZlt+cBfCrQJI
	FCx3BGx3MiwPnnL7Th8EQmMkHgZ0FwH+TrIwLs7fsLCFoqkqU5QKbLTwIUWUPlNTdt99dbplN1f
	P0miWwrdq2KHANexvB1hKf3rTJSAe1PYa/+JbUAHbf1iqF/6lF/4Ildw1qwe+6c0W7CZUphacv/
	i0XunEK0ZD3N1GyMkasLOgGxSrxh8DRu1z8g=
X-Received: by 2002:a05:620a:2684:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9293ccd5b89mr1496330785a.7.1782724811481;
        Mon, 29 Jun 2026 02:20:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2684:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9293ccd5b89mr1496327785a.7.1782724810965;
        Mon, 29 Jun 2026 02:20:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1276ec6c96sm49387366b.43.2026.06.29.02.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:20:10 -0700 (PDT)
Message-ID: <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:20:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX9FYSy2E5a/nF
 tksVkA36aHyLE1D39kqxjo/aPrF4FfR9hPoJ9Mpl8TuNoFMW+StPFoT+TH5Q6be0pO+9WoLe2Th
 Sbeu3aUeupdvfgIKzxkrfL5/wtVPO7I=
X-Proofpoint-ORIG-GUID: B5qAfWcP-12L6STTk0TkHXxneMDE2qN-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX85zxi3R7QE9r
 XoJ47sOblswKog7oDS4A6mB0ogjHScNLalDYuGPSK3gg2NbICNfihEEgu/5Awum47yFwGhCPJI4
 HUng/flMmTqIHbAuMTlqajtgBSsUCFhKIg2EjNce5CEuRATaLUDTzp9Abf8HHXXUR5hIvhLMBTv
 KiClV4fBt/fnZZxlGIOURAPziYTJx39HotHhlGl1ALIy6Dq5c5p0ZshHzrfShnI53IcFO3QQre4
 5Zb6hEqHkuAcpXEr+hghfp3dkNwMnvQ6d8n+2vU7x6za+vc41n0Nc+0PMyzI68fa0zhgyJE8iB2
 r8Lhn2RwVVpNKdPOAEXOcKGxq4RfSXPXKyavSn1qfrDF2gtCMBhEcDpHsMd34NGPjUfTHdNdLkt
 JUIZCfkg4PK792lUQIc/FD5Ct/61mV8NCotsKNucskqbVVO4NNxpY2P68FgjK2W1SstZrl3HRbd
 2LaAP8e5uVssa/7LN0Q==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4238cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zBfHOgCXiaqlRJpMRBUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: B5qAfWcP-12L6STTk0TkHXxneMDE2qN-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074

On 6/29/26 7:05 AM, Qiang Yu wrote:
> On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
>> On 5/19/26 7:47 AM, Qiang Yu wrote:
>>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
>>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
>>> nodes.
>>>
>>> Update the DTS wiring to:
>>> - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
>>> - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
>>>   &pcie3_phy using two-cell PHY arguments
>>> - configure the shared PHY node with link-mode and dual pipe outputs
>>>
>>> Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +		pcie3a: pci@1c10000 {
>>> +			device_type = "pci";
>>> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
>>> +			reg = <0x0 0x01c10000 0x0 0x3000>,
>>> +			      <0x0 0x70000000 0x0 0xf20>,
>>> +			      <0x0 0x70000f40 0x0 0xa8>,
>>> +			      <0x0 0x70001000 0x0 0x4000>,
>>> +			      <0x0 0x70100000 0x0 0x100000>,
>>> +			      <0x0 0x01c13000 0x0 0x1000>;
>>> +			reg-names = "parf",
>>> +				    "dbi",
>>> +				    "elbi",
>>> +				    "atu",
>>> +				    "config",
>>> +				    "mhi";
>>> +			#address-cells = <3>;
>>> +			#size-cells = <2>;
>>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
>>> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
>>> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
>>> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
>>> +
>>> +			bus-range = <0 0xff>;
>>> +
>>> +			dma-coherent;
>>> +
>>> +			linux,pci-domain = <3>;
>>> +			num-lanes = <8>;
>>
>> Is it fine to keep num-lanes 8 here even for configurations with
>> bifurcated PHY?
>>
>> I would assume so, given essentially this is a x8 host, whose 4
>> lanes may simply be effectively NC 
>>
> Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
> never enabled at the same time. When PCIe3a is exposed, it is always in an
> x8 slot. But if we have a x4+x4 platform in future, we can simply override
> num-lanes to 4 in the board.dts.

My question is whether that will be necessary - if yes, sure, we
can do it, but if not, we can conclude on this early and not have
to fight over it in a couple months

Konrad
