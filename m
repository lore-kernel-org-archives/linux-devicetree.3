Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB2C2D46B3
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972066; cv=none; b=Q+tRgl54gcDeagCrowmIDQY41k6aKaI7CDzaKcMPnYKjAjwfG0U34ZBX1BWbx5w0oGfO6uM12VL09jJRPTSrS9HMKYojQJvgfaa8vmaoe7jdXd5zjbwSGHE79tQhn0yR0BtZ6h8WmgCXArlaDKG1IMrW/WQiY4KGM/Eg1CTM6Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972066; c=relaxed/simple;
	bh=Gyg+X4oTM68MBPwzPDsOfJPQiDrapGPHKUYm2GSqCgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfKHnSKilKrZB9eYW8nMzmioaz229u4BhbBHh5V1lEskd3/gu/lqSaglyvnnGR1V5R36pMpYARkYrBpDpQO8u+mI1y99hugKBVoLYc+ytR1w1Bqjy0qc56MtevKoyK/qyYCmMRwM1BXz1UVyPw3I2I3tM5etbEM1Ai8POYzVSms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/gg9+NM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUROR6P/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/gg9+NM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUROR6P/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ99wc2519257
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsYB8yHPbPP+skFaM9JiYXJZSC7Kk8Ggqc+cNJG8mMI=; b=E/gg9+NM7cdqU6GK
	J1bGF6571fqlPr11tx0ljupGSTx+WHiufAYJ0CWbEGlT9oszrTgyU+z9FAknSGwy
	fG9jvps2RIE10yGfVj2sWn/RcY8J+JeBzsMePAQJVgF6/in5qK7E7c1fTkvv6XhF
	cSG2MzLBtd29VIrn8aHj7+wshe1L8u998/J6n1ewYeW/yUZ1r+nwS1ky7lk/74b+
	AdR2WG4PBFDPeLq3sJYZyGo3Z+eF9xf9+oRcovn8qc+W8YqS63VQisAf4yQaoOwb
	46FcO5uxfjisKfE5RqYIzistF+zZ4KclOKJJMXUzyENA2Vm344ngFQJMnXVmPosR
	iwBOMg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44crjvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:47:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c916d17dd43so6094091a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783972064; x=1784576864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LsYB8yHPbPP+skFaM9JiYXJZSC7Kk8Ggqc+cNJG8mMI=;
        b=PUROR6P/tEuPBKETeB4ibYNkd57ZFwYcu1HJaVUJ+OJmcbOfHB3tnFZVkeHz0pDYNe
         9FtXfewmjY9qrrVyI78WnEK5hML2dfXDB135D3EBVf+Eit2eui6I0fodQrNODee48xDt
         43oYGMX5fnowMIk2tf+/JRntgxXCvYmQm5L9V+OcPmFwdEMIwy3Z5WG3QJjg2Sbf6O7D
         01NvP7/ulDqkyk78qI35LMrnpeNU0HE7wgOqRB1koxRB8Et619VHnho17+ZqxPhHKgOQ
         DBsCsHpm/OxNzhrqwAjclcFnDLoTbi5ikjGWUoC4qojGha5YbnFzX0dJHO6S489zMDJZ
         HYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783972064; x=1784576864;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsYB8yHPbPP+skFaM9JiYXJZSC7Kk8Ggqc+cNJG8mMI=;
        b=f/JEDn0lLt6eTTx8vI8E9WtRlpIwKtLrJQmh56dJCSzOkvfI3HcWsZsGGzhB1ojS4f
         1AbyTZI81h/qKzyrt2DTj7DUZQ4+OxutzXANucU8QcYF+kGKhUGfOr9qhN8V1a42oRzp
         6DTNW2cXplKdDhnDZF6CpWLiEiYc02yNVlGnVJSnKot1vpavy4Fu30FoJeWaV5yzGXFm
         JSGAaXerXNuqRzy/6RRiHcE5oucQKfT0pH/1/cajI9Hlq3V2hV0VecnIscNCiVaz9TYz
         SM/oL37mAqCj7EbSGdnCAhBaSbMpJGhTxQzH3PJ9+ugNVdFp6zNUcqKhwMixHUST0m4Y
         88dg==
X-Forwarded-Encrypted: i=1; AHgh+Rp19DszhWsGxWyHGTOX+ODsO/sAO4Ke9hDg1/YR166nsv0g0CC5X/TZ7KrtT/D7J6sv1IDsvostYZt+@vger.kernel.org
X-Gm-Message-State: AOJu0YwYXmEHsij1kMQHL3AV5T9Ggx/iisvOut1mdV63WoZcrt+tdAjA
	ZXtQPFyWUUpG5ZCVwWtFqNOXS7fb0LbiRvaYsvJ7SjVpIg4hOHJjce9+SYOE3EOK9cIQ14Pmq/x
	XOvxZIr/yRYV6yadtG18urHIGWOHVjhBovPI3jdPCrUmSA/h9iTXrSA9gO3LJJDac
X-Gm-Gg: AfdE7cntKWprBRAufZ1c1bf2O5K3w1l8nflIkPu9K+zXQd3Cl/5nsBs7PjiDHq6vUyc
	yEw1Vs2BUdBJQPAyP1bmzaiE7KZMqFcUh9LmJwnhGwUEeVpDj3Cn0TiKMgyfU9XuXMgQrHNpjpo
	Dahpi1XPgP8CCX52SwlPBk7GDTixAIQYkwzEWJyLKX9h7kpj1epr2Y7rx/EGIbrhMlPhlz82W4L
	PM1mXyMEA/ll80XMxekJNFKj+yqaFqAPWxmbHSAdb9H/pY0tOff3bUKup/neP7wTDdrHgEKD9Ly
	kjS8zVopA3ZPCeIz5f66qzZHM+SUWmFnWlEg5onaEy6k8TZiFI/FpW1CqQOJIBJdaDkR087P/LE
	OxGdMTysPViFuTZl+hVpQ292WfS0DFHEnYNo=
X-Received: by 2002:a05:6a20:6a28:b0:3c0:9c19:65be with SMTP id adf61e73a8af0-3c110a74421mr10454880637.70.1783972064012;
        Mon, 13 Jul 2026 12:47:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a28:b0:3c0:9c19:65be with SMTP id adf61e73a8af0-3c110a74421mr10454838637.70.1783972063592;
        Mon, 13 Jul 2026 12:47:43 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ba45b7049sm6823350c88.12.2026.07.13.12.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 12:47:42 -0700 (PDT)
Message-ID: <e8255fe2-a67c-490e-a905-ed056c6af950@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:17:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
 <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
 <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1Tq4SMn3s1flDz1vEPhpi8yUolu9FHry
X-Proofpoint-ORIG-GUID: 1Tq4SMn3s1flDz1vEPhpi8yUolu9FHry
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwNCBTYWx0ZWRfX7KhyN2vbFMkK
 Okk+mVu1EDxCHVzy+oZ8ZZkBXewvsh9HgTVBhOgLZ+GoKAo9KZtmVyyaDmKzEP4maRZq4GK7thI
 HFlKrDPq1chGY2fVKKvJxP8c8cekE4c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwNCBTYWx0ZWRfX+waPZvbLmOLF
 1jXosHBboX/SkHr7BODFJlzlDe0QRv0kdpfWPs6tvrkl1ipNO87kUsBIQjHilXAmD2vMRRwiN+T
 YvEsfYaq6EGFGU7NgSEDXC1MVmXuuCYSnqMATxWf2woqF3MFlINLtCthvTEbl9pw2LhxGO9pib3
 0QKTBhx2JKSGL3XUMuPuJ38SUxEyyhlh8WfzMfUyt9cBBvc/XbYPqjT8ismDoKL2mdp/C1UC03x
 VcXc/QJXaAdQQfSGi788L/oAuK9VR7Vc2xh1K8l2WutvnJH+Ww9YKfdXLuyjJBk9ozhHcU0QGr1
 0KatIo1tb740yfLpAmwRVtoZs934bdlkTHUmDTfkIUKGijH6w+Y+FuhYc1iUBhj9dfLTTqGWA5i
 Zf/Leao0SKUAInzmmFmqywDr2mt7yRs7LcJY0V0ZY1ZjoUgXxKgXnZbT3FyR7ch4fvhk9dALOP3
 dS8Ne4mdpzGIFa4KsVQ==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a5540e0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=yNfbWwvibup9Ri9izU+P7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sy2TSPCRsGNh5uQNLmIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130204

On 7/6/2026 4:38 PM, Konrad Dybcio wrote:
> On 7/6/26 1:07 PM, Konrad Dybcio wrote:
>> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>>> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>
>>> Add the nodes to describe the GPU SMMU.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 38 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>>> index c5635f22e2a7..e5b8377e6c3a 100644
>>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>>> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>>>  			};
>>>  		};
>>>  
>>> +		adreno_smmu: iommu@3da0000 {
>>> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
>>> +				     "qcom,smmu-500", "arm,mmu-500";
>>> +			reg = <0x0 0x03da0000 0x0 0x40000>;
>>> +			#iommu-cells = <2>;
>>> +			#global-interrupts = <1>;
>>> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
>>
>> 674 is the correct globla
> 
> (modulo the issue i explained below)
> 
> [...]
> 
>> This list is not quite correct. It must be sorted by the context index,
>> to which a given interrupt corresponds to - the driver relies on that
>> to give you information about where a context fault happens
>>
>> Moreover, I see that the interrupt sheet has the bug where some
>> interrupts are offset by 32 from the base vector, and others are offset
>> by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
>> out which mapping is correct with the right folks

I reviewed this and looks correct to me. Also, this matches the
downstream configuration. Did you confuse with Dest Port vs Vector ID in
the documentation?

-Akhil.

> 
> Konrad

