Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38BC3ACF0B
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733243; cv=none; b=QCSEe0MFx3JDo9aHxqTuToSNui8ovn+DDAQIaw788uiaK1zvPmWVm7oEO7vbx8bc2Q4UyezBDt9RY2eaw1DYhldItk8+aetH5hXOnhS7Un1gKq97CFYaRzry0WCZ+emTn9pMl6DahfuGP+5MxAja0Yd41WwqNiq7/sZKYPpHjDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733243; c=relaxed/simple;
	bh=pT2FbtXMab7KSZer+kiCDmrPcL5DRuMS5wo2LZH31j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MHT9fLcz+UpxUl4X/2RgVqbPQ2JOQJIDVj/mtWkpHeoxMkGhdpdPKVMyUwMQg+ujBTV5WaVZAtfYV4zEuWRih7z6+S5Pkvo+iGxi1YdvoiXBwex9GxBFt/0qD/CZ/liWmI68SQsP1RtwSy20nWe+MxK1KK9pUfAeSiMiArzhYhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3ZyL3k2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nj+NuXqD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3ZyL3k2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nj+NuXqD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATCxA2647678
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ez0q+tEhJVuFVHEx3WYt03klVltmnKN+zNXS/TELhgs=; b=Q3ZyL3k2iIBe/RCQ
	rdTzKslkbIY5291q+y4nabYuc331IKvHSvWTnI2N0XLS7jgOiQaXGRoDrzQW2ift
	0eLjCRMen4ks4rh/7/WzPwQhyepF8u43Mdg01XXrIitXhlSnFr6mSGc1/QoI74Bl
	/c/hpRY+8Wa57anjBvkMuVsiOvdThu8qJA9Gxd2qgHbPXznxSTDIwJkHcDjzmNZN
	vvt6Kow1M5f3F0alBTwOHU5r/tksyZdSV/j/ExhpK9AJjx5ZQD4n+lsGlvOQCtoG
	NesfgWWu3Kp1k8maoZl6Uxo7xzVnNVTOPrLx59hJzM1sMdf0gHmfHQGu3euPSevW
	4XlV7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjh2uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:40:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92daa1a0f7eso61835585a.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782733240; x=1783338040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ez0q+tEhJVuFVHEx3WYt03klVltmnKN+zNXS/TELhgs=;
        b=Nj+NuXqDBErVLkuu5xmLffWOCu/26W++pQHw7DCkJS6ogB6w3+MPlt8yEHHTqipcia
         aJ2KUWI27a0CzHL2Q0b0SQIeAbtmppgHHBv7xlBhlz9issGhYIv1a8WJ+AZSMqsXmQ7N
         tqGFnOhn7PrczXFJv6rnrLNnpKo1OKJZYQ0dW6i804clGG2d2D2zsur0hcI4tOhsQdD/
         CPwntXfeusDrNZ+LlBswD/VNp7U0KAyaeofSKynrGL0mnfRgd7xJ5LsU86W6V5Z75yrQ
         bywvqiA+gyPddNFr6QZ/emwP7DaM68msL6wPMnfXfPtaxnDj5JuvAkt3VBp5O0BeyHyI
         LFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733240; x=1783338040;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ez0q+tEhJVuFVHEx3WYt03klVltmnKN+zNXS/TELhgs=;
        b=k0Ll8KUpxlj/4VhSPZcOWwsoCz4stBkViJRxx7GNqbfj/f+epwS3QYv97VRHJ/ly0d
         AcBlgJAcEI1eowMiMoCYFQTrqI5nqrskUjEyrYYjM8Yr91SVHI2B2fuL7UlSK4pxYa0B
         2BoyKy6OhxWT7hu/wCsRtG1/8oolax9O5MIhyN0z3lI2/t1Exr0UjeJdbHKFb9Nb7XjE
         FSa3TFu/jKqGXIy8chDxu+rf/g8RcIaRGOQ+kk08aG36XGsk8HD0InAjblPnfHz8sGw9
         FEntKuxrYh7G3YY9YL/z+dg3w00Zl80DQONWV/bcQb1nJRBdXCrY8FSkaW0LW97/wtuW
         fTsA==
X-Forwarded-Encrypted: i=1; AFNElJ+gHaI3Eac2wKMTWLXNU2paPVnyVHyvoqG4IH8jy3chpAOi/xV1L4tfuOmccVIY5Xt0g/0Tvs8v3WfT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzto/rxyyMV6CQyX+U3w1OmjgYCO4AOkduxo/FXrtvw5Y4yNGnA
	q34HoHWuzYtlIwg/plGQTTGwwkdcGQR3xfkWNdfPbYYk5yKQ/mPioDleKKr41J/IfzgjwpjaDHJ
	0K3Y8niMojkJxGM7RAojFF0fhi2wDcjFmifcBYQ23PndMgPJIYHa3chuu7h/UjfZB
X-Gm-Gg: AfdE7cmeRbjRQPPf5XzQpN1YxsgzBB1c5612SiFiCeUA4PebXhWtLN4bgsBXa+2ZhUV
	s58qwp1Y0gIiR6WKVCq8YXOrvfD9afLcWOFsxDUzQ8E3pwXmpQTxBDHyPaJZVH5lrdGQFBL7XoN
	XtjC2oOKqg5r4Ncue7EMsB5uxgOmUoQB8e7lULemY2PNzWMalnUI/dp+R3El05RbEuTokVobNlN
	9qh3sJ9PwzCXIQ3KzJZ/+XaCeN0vM+27B4ICni4C2/rk8JuPZPd0ZAi1Rm2NJqHXftwbzub6Dlv
	o4xtMFIQbY11eEaohS65W6pe6KhiaaMuL5KiaygkGtvidoQ0MK9uC2mk/wYJE+eQ8k/s1lGdz98
	PUgSYf2pN7T4xwDi9eSJfDCMDwK2tsK2qYb4=
X-Received: by 2002:a05:620a:2684:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9293ccd5b89mr1538019585a.7.1782733240093;
        Mon, 29 Jun 2026 04:40:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2684:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9293ccd5b89mr1538016185a.7.1782733239589;
        Mon, 29 Jun 2026 04:40:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1271803f92sm88937566b.44.2026.06.29.04.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:40:38 -0700 (PDT)
Message-ID: <46005937-c1a9-409b-89cf-4b8f592dc5d1@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:40:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-5-0154cc9cc0de@oss.qualcomm.com>
 <enovafjkiuzr4bciu6bu6hh7h56wvnaq5fh7f46m4h7browyrd@7huwa5egaqaq>
 <55039d7e-34df-4f89-8188-fcb45fdea538@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <55039d7e-34df-4f89-8188-fcb45fdea538@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YlM3gACL3a8FcSzmOmiY5xJSeBtii4xJ
X-Proofpoint-ORIG-GUID: YlM3gACL3a8FcSzmOmiY5xJSeBtii4xJ
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4259b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ofJj2r9Jeah5rOUhSeYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NSBTYWx0ZWRfX0L6HWCZ4aYZG
 ZIqcWRDbOWT+GL9NrlhPgnQBbBNf9g/oYQbqgX0/dytKFGxIAzsMqGqQKLqM7qML+YhK/opa6Ba
 jL8B+3SblvzZaeMu6sTOuWXYlwAMrIo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NSBTYWx0ZWRfX+49J+OE4kSEJ
 lkvspNw/4GJUq5Mabp7v02r1tt2aXelGR7xd4QQ54DfumBjVV99cE9KMlo3b1GPdaAD6SlH7X1B
 4/Aznuq8ldA4Ex9umZg4H6OvG3CLzRrR7gUH7xeVbD0M33UpCuF0y/QwUYRINVLZIKXlw7RP47R
 Y2przEjdbWliDfX0xHKz7HdvttFrSaWpGioy5A3pPAf81dHfT9+xT3kRZJikRpvZFMe1xnu8wdu
 j3rK3Z5M3LWsDavT691wvOfjpZgDmTj4I8MiAefYnhAPsAhdy2jxVcRq27q9PCPbaelxa/BZ9YV
 F1D5snWyVcYeQXFgTpqHZPqO+zILEyvxbH/xKwC5/0oq8886GNArbuKE/O/9wMSrqMNUAkwqIn0
 iw0Vgp4tOeEpZmzye3/1JYgi4eLiUSC0g+jefuqHsiSZqX5JYLd0Yv381c0qW6rVaEgtzduuniU
 28ER/OxJ8bkkxh+hvjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290095

On 6/8/26 12:09 PM, Kuldeep Singh wrote:
>>> +		cryptobam: dma-controller@1b04000 {
>>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>>> +			reg = <0x0 0x01b04000 0x0 0x24000>;
>>> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +			#dma-cells = <1>;
>>> +			iommus = <&apps_smmu 0x84 0x0011>,
>>> +				 <&apps_smmu 0x86 0x0011>,
>>> +				 <&apps_smmu 0x92 0x0>,
>>> +				 <&apps_smmu 0x94 0x0011>,
>>
>> 0x84 / 0x0011 is exactly the same as 0x94 / 0x0011. Likewise 0x96
>> duplicates 0x86. Drop the duplicate IOMMU specifiers or explain in the
>> commit message why they are required.
> 
> +Konrad too as there was same discussion in past too.
> 
> 0x84/0x94 and 0x86/0x96 pairs are actually different even though
> resulting sid is same.
> Let me explain more.
> 
> From sid sheet,
> Description	   SID (hex)	MASK	RESULT_SID	S1 CB
> CE descriptors     0x84, 0x85	0x11	0x0084		S1_CRYPTO_KERNEL
> (for data pipe 4/5)
> CE descriptors	   0x86, 0x87	0x11	0x0086		S1_CRYPTO_USER
> (for data pipe 6/7)
> CE data pipe 4/5   0x94, 0x95	0x11	0x84(same)	S1_CRYPTO_KERNEL
> CE data pipe 6/7   0x96, 0x97	0x11	0x86(same)	S1_CRYPTO_USER
> 
> Qualcomm BAM DMA engine driving QCE has 2 major components here:
> * Descriptor pipe (0x84/0x86): This carries BAM command descriptors i,e
> key, algorithm, length etc. which tell crypto engine what to do.
> * Data pipe (0x94/0x96): This carries the actual data payload — the
> plaintext/ciphertext buffers being read/written.
> 
> The descriptor(SID 0x84) basically contain IOVA address that points to
> the data buffer. That same IOVA address is then used by the data pipe
> (SID 0x94) to actually DMA the data.
> 
> Since, Crypto engine descriptor and crypto engine data are part of same
> crypto operation and with the limited number of context banks, smmu
> provides an optimization to logically group and resolve them to same
> context bank/page tables.
> 
> Pipe 4/5 contain 2 SID(0x84/0x94) for kernel and pipe 6/7 contain
> sid(0x86/0x96) for user. Pipe 4/5 doesn't touch pipe6/7 buffers so both
> are safe.

I understand they are different from the hardware perspective. Are they
different as far as the OS is concerned? Will we ever need to separate
their data flows? (I guess that would require iommu-maps anyway since
currently they are bound to the same domain anyway)

Alternatively, if you'd like to keep this level of description, it would
be good to describe the iommus:items: in dt-bindings, so that one can
make sense out of it

Konrad
