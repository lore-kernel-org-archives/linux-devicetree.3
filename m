Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAFE329C60
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689124; cv=none; b=BNp3PcbqveCanflRwRegbMqMUzQzDz7/TLbE86shW+J/gUj/R0qH6DmtdnMAi0yrLobrbGYO7Blfi6OPkhU4F1qmX/mcOum56O79Gn0nKwGIl+SSqzktcF0u+DS+hcZ0MOW315zPQu1rh2d+DFsHE6RqKYHIBhqI1VvPONnSxPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689124; c=relaxed/simple;
	bh=aC4FPxDxzHdrM/prXjD+lyehQL9rsY0iUchgNtG/mfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pW99uxJpE9lYocYdFOhlQ6tmHlwukt4HpRdNON/mk+C4p85cJ/OXCbCAzTj2CCIjtDBcKJgEnpVCKouxhEtwCjaMU1u+mu17AFJv1T4j/2XszW5IBbD0m35idPbhf14D0yAIgAq4yFplDa+p+ruaYRbFzWCNAgj61M9YIMu4Msc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpgQS0iW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuohloA5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpgQS0iW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuohloA5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6P38871568
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=esnNNQyitugAKMlaLQidbpw6
	dVtFnR41VBfwzjsJV1U=; b=FpgQS0iWrTSwPiSi8AIob1Ty9Opqu0sY70YTU/KO
	xROVHmnMAd7DcYpaAoRP6MC5VLspCJo2+LMKHqR4X26xGjFOD+0/JqZdyNV905eo
	Ly9ujki0eB6ut62d/1zavw8jpQT1ZNKQ4QSGTHN192acJKqH+t+EK1M3w6NCxZZP
	ofagao00Lvu9XrLc7WT477uo/TLUOWWluR5QCJfgcNP7+cdEhl4NtBO1cERL/Mqh
	fpHjUBn6KNud4My4O7N6mW1R/79BjTPl6AhSc6cp5dppT+/sXa9vN1BGPvFaxAMw
	5M2Yp9YLcVFQzWF4U+e6N/4xBRce4myc9/zYO9/uBVMFPg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8j05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:12:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484f26852dso1037820b3a.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783689120; x=1784293920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=esnNNQyitugAKMlaLQidbpw6dVtFnR41VBfwzjsJV1U=;
        b=GuohloA5haMTdnh2w+CZsymv1RYzB3bz8j6gYvb4uwKtE1nP+WltVgFgCk+TtM0z7y
         0MHOkxc3MPpJq9DixelUaUp11XHA42jWIXrldACVH1KgkWWIOywW0RT4L8tTtfgFAS/Y
         D8yUESs7LtJSqsi0IFT1ifyL/mqZqjg6qVDIES305vEuZg6PVTkKvPyK4PacWm+X+0Rp
         PWbMiCJ2hVZIKB7HMQzeFawZQOzrD+9yz6igAFUcDEA+sUrCUWwUqisNSvf7iUC7WVZz
         gOyMdeYywA0oRhblPfzLyKB6/WWDZAlj5XN25LN4r0f3aRrnKK5N88JQqItl56XXqtvo
         XcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689120; x=1784293920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esnNNQyitugAKMlaLQidbpw6dVtFnR41VBfwzjsJV1U=;
        b=IS3ALl1fpTFztjT0/wqxA4gabSpgWS2K9grW30jtvxftwUGVGmGUUo5jbDM3emzzi8
         qbG3SRu3v2iLSQZQWvu9pa5Zb/0CS7kVC7gomhZ0ptgf4wVKQVzY7KkuI7uw+oQsR1YX
         GNx8B/wGGTm8rCfJMx+adwmq8OgzRw09cgc5BNy0FG44ZPL4fNmhJWt34CfiLYGPqpWq
         ROT1Xm3cr2J0XYtN00dStz5IB1Ngw5xGUiik3OtVP1ULVX5or1YVWdaiZUJpeMWSpkbm
         4H5vgcnGsFfg5SgNoJtCdRl6Z9pJMTOp7tfEkb68FuM/TD91vrkL4dkMYdsPD4Qz2iFv
         pwEA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5Gaw7xcS0zVDZhrvon5jaaMMZIgrX90qBu5dDjum1/GicsDO+xRAYSeMBd4tog3qPZJnEHPzR2AK2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4HsX/FREjo5Psh5z4j2ZiS4zaLs4y+EAp9AP+CgkfdvRmBPEE
	kCo7MgeM6NKhDlbmdNT1CdRWlZKNmSSSk43GfzOHDhVmrYwwosYodOiZ+XZzNi2Di7XdrxrxFdf
	T3+Yb985q6gxwqcqLnQqOQ0gCQQCxxOP45G2FpW9tN9Qf1ehwoIQS24QyV4EnZEgu
X-Gm-Gg: AfdE7cnxyFG525g/qo2NMecFiDXgP0hdOU4EukGgU6DZPwjYC6OlbeOhwHqOGKHQNqb
	XqNF4Azgk0B/xOsuymTfLoQAtkbVOMb0e8aLJtrMnE+UxAfm7hBUZ1ON5w1oLd+MsmZ6zqQdDsS
	6tImbUZ9ft+Q64cPfcpx+q6UPRclTRRSWYLI5J30uumNGbv9dwQvCcZ4gw6338plNC+fSTISfqi
	u50OLYQz36iiVnLmojzw1U1bsUnYqekX0BzP8buqa4unTgdedvNFwjGeoW4RzRojNyweu2H2i5w
	5lwAs4IHuIwAParYeysUEKBQnv+s+2/tPpqZ6mDFZc0pRE96YkRQvszc4t0J9Go5hp6xs34kLys
	IuTg04Uz9iDm1bR+WiN6rCCHAf3P+07ky5DuljY36v8dBAf7zQYT3RgSkJA==
X-Received: by 2002:a05:6a21:1bc3:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c0bcb7f146mr12783135637.42.1783689120026;
        Fri, 10 Jul 2026 06:12:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:1bc3:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c0bcb7f146mr12783097637.42.1783689119556;
        Fri, 10 Jul 2026 06:11:59 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c76dsm41245733c88.3.2026.07.10.06.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:11:59 -0700 (PDT)
Date: Fri, 10 Jul 2026 06:11:57 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
Message-ID: <alDvnSiplhEg2yhD@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
 <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
 <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
 <6802dc29-d783-40df-bbb8-8b2dbd94be29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6802dc29-d783-40df-bbb8-8b2dbd94be29@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QuI--C8NzWVALdIRruhCqCsylyqBdhv8
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50efa1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lFNHJFWHrmfUljyRrh4A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX8PO9z6j4BBGO
 wgur0Rv+N9tsPkXD1pproKer2C/1vVsmKvwmaa5Z0CVTwCGaDvGvOoszlYeUh2VLcFrPhClNLk5
 pJ1wfj8QJdUvsZwYqoUn3FoeCHVOWFs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX0bfCWTNOhMC+
 tkRh2JJEYWN55hW898YVAmue/D4WIMrXvUKNKnOZw8hNm3H7nNapU9xQj4qWIy6jC0NPiJr4orG
 rsGdKs62y75cLtRVJG3OMmIifLTlSHiHfdwy7GL4wQX4qR8oTRSkxdecRiEOoCEc5I06S+zAGBv
 EW36Y9nV8LG5VGumfT9iqx80+srf/SV+JMW2OkVfzOJhj6g3Guv0rKcWC1EYePsRnm8/7bFFCPE
 mwk2DiEZwfl8KmRxKIOEkjEgDXtMJb/lb88XvP7RqF5onUR7nGyyauMa68uZy0nCYrlVFvZiKgt
 bxKg8Ssqo4ccn51IpijvebQCLtA5xwblaVmVn2YjRhQLf+mnPec5f/qt3rS1VRVHg5muWIoW+8a
 4h0XO2uZrgs1IJ20GTyvKKAtdP6DbIIdZ+g1bdceX1ojZqpOwAnngfKlXQGetsP2zc8VC1+EsgV
 pkdJinYQL5oujDd5RrQ==
X-Proofpoint-GUID: QuI--C8NzWVALdIRruhCqCsylyqBdhv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100130

On Fri, Jul 10, 2026 at 10:44:20AM +0200, Konrad Dybcio wrote:
> On 7/10/26 4:19 AM, Qiang Yu wrote:
> > On Mon, Jun 29, 2026 at 11:20:07AM +0200, Konrad Dybcio wrote:
> >> On 6/29/26 7:05 AM, Qiang Yu wrote:
> >>> On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
> >>>> On 5/19/26 7:47 AM, Qiang Yu wrote:
> >>>>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
> >>>>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
> >>>>> nodes.
> >>>>>
> >>>>> Update the DTS wiring to:
> >>>>> - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
> >>>>> - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
> >>>>>   &pcie3_phy using two-cell PHY arguments
> >>>>> - configure the shared PHY node with link-mode and dual pipe outputs
> >>>>>
> >>>>> Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
> >>>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +		pcie3a: pci@1c10000 {
> >>>>> +			device_type = "pci";
> >>>>> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> >>>>> +			reg = <0x0 0x01c10000 0x0 0x3000>,
> >>>>> +			      <0x0 0x70000000 0x0 0xf20>,
> >>>>> +			      <0x0 0x70000f40 0x0 0xa8>,
> >>>>> +			      <0x0 0x70001000 0x0 0x4000>,
> >>>>> +			      <0x0 0x70100000 0x0 0x100000>,
> >>>>> +			      <0x0 0x01c13000 0x0 0x1000>;
> >>>>> +			reg-names = "parf",
> >>>>> +				    "dbi",
> >>>>> +				    "elbi",
> >>>>> +				    "atu",
> >>>>> +				    "config",
> >>>>> +				    "mhi";
> >>>>> +			#address-cells = <3>;
> >>>>> +			#size-cells = <2>;
> >>>>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> >>>>> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
> >>>>> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
> >>>>> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
> >>>>> +
> >>>>> +			bus-range = <0 0xff>;
> >>>>> +
> >>>>> +			dma-coherent;
> >>>>> +
> >>>>> +			linux,pci-domain = <3>;
> >>>>> +			num-lanes = <8>;
> >>>>
> >>>> Is it fine to keep num-lanes 8 here even for configurations with
> >>>> bifurcated PHY?
> >>>>
> >>>> I would assume so, given essentially this is a x8 host, whose 4
> >>>> lanes may simply be effectively NC 
> >>>>
> >>> Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
> >>> never enabled at the same time. When PCIe3a is exposed, it is always in an
> >>> x8 slot. But if we have a x4+x4 platform in future, we can simply override
> >>> num-lanes to 4 in the board.dts.
> >>
> >> My question is whether that will be necessary - if yes, sure, we
> >> can do it, but if not, we can conclude on this early and not have
> >> to fight over it in a couple months
> >>
> > I think we do need to override it in that case. If both PCIe3a and PCIe3b
> > are enabled in x4+x4 mode but PCIe3a keeps num-lanes = <8>, userspace
> > will see an 8-lane slot. If an x8-capable EP is connected to that slot,
> > both ends will advertise x8 support, but the link is up at x4. That looks
> > like a genuine bug from the user's point of view.
> 
> Do we know what's advertised on x86 PCs with bifurcated lanes?
>
On QCB, it advertise x8. On CRD, PCIe3a is hidden.

- Qiang Yu
