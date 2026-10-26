Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015863;
	b=4Z5BPeGAaPeOfW7mral6hU81jgThRcZY8YdbMKgSyqXR3B6MTHTiMQNDeXY/vV7llQ1B
	 620KDRujdf/RjgdYeJtWkdp3WYBDyPRKSnFYVIX5EL0jsSvS7OfpfqQIc7EDkkn6qI59O
	 tDn1WSvuidp3ELgUAx8VeMz6SVV+fTI3zQkN3E/pTVsPr12S9iYkvJy/kOR6gOBmyOF5v
	 KVZUGrwugu9Wl6CYHqe8tX1UZwCZ1djR1OJwqUS+pobbsGtKpme/AZHl43m0zTrBM6sym
	 lNupwHt5mcGVFrflvxC6IURhO9+KfihSdld/tCcFMtMXjyQDoVoPKhWJdJ52s2OVMEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015863;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=8yn+f7/xPBR45GbhMRQUjqpcIdGoRih5Xrmg69vMj9I=;
	b=E1A4qVBlClWat7tNS9k/8a01BWhqV0wNNRsx92LmsWLi6VzMoGZjrSiz8hQmyqZ1D6xw
	 ioK8ZEV/wWBWSQlTQ7GRk2WzBjdva6k2efC3e3fc8y2XmhBqHgCZP6wHJ3rd0ufqZtFce
	 LiaArrHPSoSVE+rMPVIAKmap6y4oW4hK2FJoaVvWY7ZOcDwFoldID8iK2L2bEOTGmglmq
	 QANUtPWJrD03C9r6XcFhdESaafrXwV9DaIYHVGZDnNxQjA2g87g/QpQicS/Y3lVMUR8Z0
	 vVTrbYADu/rBEqrh0M5EV1Ju5bzcw3+tX65uALQPVYq7+wuAjhRhMGJQA4/WnVi4hTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dFtkNSjz;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A1D606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04A1D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dFtkNSjz
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261026115739epoutp02c6ce956a2f66097ed5e42ee8f351efc1~iEmyndtLF2597025970epoutp02S
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:57:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261026115739epoutp02c6ce956a2f66097ed5e42ee8f351efc1~iEmyndtLF2597025970epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793015859;
	bh=8yn+f7/xPBR45GbhMRQUjqpcIdGoRih5Xrmg69vMj9I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dFtkNSjzbIAbdXMTmo3EcYT8iyToFI0EBPZkBeG3uzAx4RsVzmUC9pPsmWingxIQu
	 Ji1FRqAL0f/NPoPuxh2t9CvHIUURD2hkoc0uRwBzg97dnjxJiaJ/rGxej3skOanJFv
	 Y3qVFvWUvTJN5XVh2bquDaDfpzuMUE/sMrRp0mbY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261026115738epcas5p18b2bcee968bbbf08476340af7da6ef1e~iEmxllekR1444514445epcas5p12;
	Mon, 26 Oct 2026 11:57:38 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jCsZ936YGz6B9m9; Mon, 26 Oct
	2026 11:57:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261026115736epcas5p399ee58609e8a2d9584fcd86dc1e5b852~iEmwPv0sJ0063700637epcas5p3T;
	Mon, 26 Oct 2026 11:57:36 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261026115733epsmtip16c43d131d64fca287f1f0c2545ded44a~iEmtNzYCi0993709937epsmtip1t;
	Mon, 26 Oct 2026 11:57:33 +0000 (GMT)
Message-ID: <1acd29ba-c9db-45e3-b7c4-49bf8f8a14b9@samsung.com>
Date: Mon, 26 Oct 2026 17:27:32 +0530
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
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20261026-talented-wolf-of-karma-8abbbd@quoll>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261026115736epcas5p399ee58609e8a2d9584fcd86dc1e5b852
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
	<CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
	<20261023131501.3157463-2-selvarasu.g@samsung.com>
	<20261026-talented-wolf-of-karma-8abbbd@quoll>


On 10/26/2026 3:14 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 23, 2026 at 06:45:00PM +0530, Selvarasu Ganesan wrote:
>> +title: Samsung Exynos8855 DWC3 USB controller
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
>> +
>> +description:
>> +  Describes the DWC3 USB controller block implemented on the Samsung
>> +  Exynos8855 SoC.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - samsung,exynos8855-dwc3
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
> interrupts go after clocks, power-domains after interrupts.


Hi Krzysztof,

Thanks for your comments.
My bad, will update in the next version.


>
>> +
>> +  clocks:
>> +    description: |
>> +      Two clocks are used:
>> +       - ref: Reference clock for SOF/ITP generation.
>> +       - bus: Bus (APB) clock for register access.
>> +    minItems: 2
>> +    maxItems: 2
> Instead replace all this with listing items with description. Don't
> repeat constraints in free form text.
>
> items:
>    - description:
>    - description:
Sure, will update the clocks as below in the next version,

     clocks:
       items:
         - description: Reference clock for SOF/ITP generation.
         - description: Bus (APB) clock for register access.

Thanks,
Selva
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +      - const: bus
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
> Here you have correct order.
>
> Best regards,
> Krzysztof
