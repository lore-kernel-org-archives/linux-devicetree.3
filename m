Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A872634404A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784257353; cv=none; b=POWfVJD1bACN7tdZ2QJnU9RlbOStXMuBer+5ttNnHN1HKleC3u1jDEblEkNbkebtuwWfCbA7xDueqK3IOmw2MImp1bbXfNGPeYPJ0Q2oa72iQx+8XVGTeTxmH11iwnC+4FF1KsdfCLC+mXW5qHqqhsTpvWQO+qUlkElFQCIcLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784257353; c=relaxed/simple;
	bh=EVFdOQcBCUSWCKMzoYkRLwEZ54RS0XimYZS8kpTkYUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvHh2MqQOhrww5eUxnIcjmG/FkKmBLrS53BpdnHJ1cAjp+Erh/093CBqnG+1e7r0Z+SjbOD21ncmcoJtksZ8Xuq0Ue/btm3xfN1nfRcGXlOSEHgYfidcvKCAaEIAySsYXzjJ9xmIOZPj2W49cqDu1liSH2ngn9nl0ukAnZ6XsGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+xO3t4q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irVNHFx8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+xO3t4q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irVNHFx8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIvDY011228
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=okulbd00eydxfaiTL/nAM2B3
	jvDdNW3YSh5leBM4+pc=; b=n+xO3t4qsPeC6rrx9GgP3CBI1bo01PCVS6kthSLo
	DuC5FEWWpxyPMvgWVupXD+VuNS1B67YFuUsyQEvVBcgsGseLrkwipaDXPTfbLtCU
	F946p6LxnHYx/KOYoqqyTBbjGju7onlVLXpC77oDjZzARIdAacepDRGvDnqnN/we
	wOO03JnYf+v+kIPiX80AKrBz7/MiAeWw7zRX2kJELT84RWUj6RwU8WXQvGY7Oinc
	Dedayg6y7R6a9rKOeiYyZst2EIHqI/Pt3Pd+t679Inh4DiVAZD9xFVGghvGFA+EA
	FA3yJj5X4iIyakP2NbDCVNK5zC1tQAdFLzI9wk8fzGXiRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex4a51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:02:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso4043243a91.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 20:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784257347; x=1784862147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okulbd00eydxfaiTL/nAM2B3jvDdNW3YSh5leBM4+pc=;
        b=irVNHFx837qfAuyD61dXjxGn3T8QF9CPQNfG0zWmcDv/CKw7160fZSMMBvC0vxzRzk
         dSdHmGQRkZzxQOsV4MPNPvi4A1mmcb+Ej3r/dEuOd8VOUjj3XIKw4kZUBnBT1rhfVOuk
         kpseZzlnnWeF+dz8D5Gk6zx9snPsxO1QZh2MqevJrn8i23Q9PapKobJyA1zEctSjaPFt
         XIaQUNf0ea79IQq6QUIS8e3rxpfBRZ7e0RQy5k6xzLD16jYGgmtXzH1MHBMGLVfqw3tL
         QrskxqIh+UAgOLLn8PS5eAzKPtfDaFTDtIpbh/2s/TogbIO2b1cXo2BUE8m9QO/YFoVK
         GhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784257347; x=1784862147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okulbd00eydxfaiTL/nAM2B3jvDdNW3YSh5leBM4+pc=;
        b=OBwbinjh11mA5VwK7AT6AwYw7rsN6AF3xigSVQOzsCbTkp7gV5N/TIbUF5W+M9q3Zy
         1G9RZr6XvtD8ur0S3ngsKpRdmUw0/LBg8aOWD/mm0U5a39Uh3ljhJc8M3zQUZ3bD9P1v
         1Cwhjl/YFxU9+XZ0K6tYhEnNiOduI74iSfUx4zuscu0AXCE+f/IMIbydZovhaDC02T0t
         Y050K4XvstPAR1meWsrlAdDlxVh6uMLHhCwBD+JFgYBEACkL2UiIB8AgFkdEFSslawXW
         FtQHKZVidn6/qq1VaKcA2zPo921OeTsWUzydoEH2GUWRMR2APQ13r6XP02pewXMNWpuE
         lKUA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1/WQ3MGSsjChzYrkSQWYbOMCVFZ0RJDeJdeUbiE5l+Qrn7es/K4F254dF5DjEeRzbwD1uwVyR7j0b@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi0WAx2XlXwSXbQ5UNSjCOjDVOTppMAh8/Twa7TSqV7zsnWLfO
	U0LX9jSacTXhRp0g5+Jd3KCSMl2PjxJ082ChMFEeoEA14gDZR2k2E+Hbq1MRRCPzDfgnV6ZeOJh
	I6q+i+L+FmEVdyeVsSBKuvzwLxZKRUdRwz7yB5QaRnmyZD7xvZJTCT7jiuvvp0cQl
X-Gm-Gg: AfdE7cm50jjQ4/32O/D2C+BjksFEACheglof+6XZns/Kiix7BZF4gn9c3X00aJZ6ouQ
	PNqaTTp0vjhgdrYKXSdV7I+NKVyInO7Nr3BX/CkTyUKZ1zlpGBdz/sYs43FXvYVhvp6pAnZBa+z
	HYeS8bIPn4oYVsIA9a12OWjg9Wrwo98oWH8zUJyMry4LruG0ZQBnuYl1AHvnm2JlGrCPUof0dbl
	IotNBUWTMuxq0DTUU03qINx43qCWo/znUCwg72hhvTQzt/CEikZEYuy8STzJXFUGeRY+mIIA+VW
	k5qoWcrGBfDkUI9aDIiZD8fO0ZpHhioUULwENgOFjLzuvrRhM4HtaPW9ueXL0lpXjNDb7byNpXO
	bfqKOxH2M0EdR0VPElrMzo4LZxModuuhNR1UySFtWGyTufJs=
X-Received: by 2002:a17:90b:3c43:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38e4b537ddemr669538a91.31.1784257347128;
        Thu, 16 Jul 2026 20:02:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3c43:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38e4b537ddemr669511a91.31.1784257346642;
        Thu, 16 Jul 2026 20:02:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de21asm1298743eec.23.2026.07.16.20.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 20:02:25 -0700 (PDT)
Date: Thu, 16 Jul 2026 20:02:23 -0700
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
Message-ID: <almbPzGy/G5GIctP@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
 <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
 <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
 <6802dc29-d783-40df-bbb8-8b2dbd94be29@oss.qualcomm.com>
 <alDvnSiplhEg2yhD@hu-qianyu-lv.qualcomm.com>
 <f83556e7-dbb1-4926-a2a0-4690cdbad941@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f83556e7-dbb1-4926-a2a0-4690cdbad941@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a599b44 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p66J1l9MvY5bjjRUTH8A:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: yV0CZYQ_ah_kSMqbrE78ipMbPFX_eNSN
X-Proofpoint-GUID: yV0CZYQ_ah_kSMqbrE78ipMbPFX_eNSN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAyNiBTYWx0ZWRfX19jBWy+vzr4d
 4RIfGjUDP0BUUA7AnTQCUUnVgX09pxniFlm605YqvGhqdjQUzoy3FTY+YyrbHW2qZ0TK98J0kEu
 w0ikk3TnhQoucUxfbyxoekrUQynOi4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAyNiBTYWx0ZWRfX4JKx92xWMzdC
 ij/RaKkk/Bms843VnbCpAS5KdYdC6EW7vhXPJgBYfF12h1SXztHSjk/ntJ9BbV0wc0h4rvqQiD3
 6G8pmNI6Hf7mRFMHGg/NKdmPaMXLiYCkqsAqsDCC+lpKZcwhMXUGrwo2Fv4L9fhAXbP9PDg0iCB
 SqLCV53uNv/tcvko62KonNn9bDJYIMTQioOuDr44V7olwKLlYWGlbD+BY3QxuJHEmwYJaQNqByE
 ghoGat4LwIgpdL3Gzhs+2K68Hd6n1AKiG1TVKaUsIxuPdmR/8rEGw/QedEI4Lzq4yibY2Y6pPI4
 7XYNp832pKOg1VPQ1bsIgHivCR1k6V2fSj8vav1GC0hs/lZhw9Tkqn48HFE2Si4XRkKlTpZqqKi
 ekwMfkde5jldcNedOPrO6Hi78KSNiZqvFY3BqZzXgZyn2ZcxUiD9WfP1iXz1XbgzGdNmq214ul2
 yLYPJFHeOCqxr6SQSOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170026

On Fri, Jul 10, 2026 at 03:25:37PM +0200, Konrad Dybcio wrote:
> On 7/10/26 3:11 PM, Qiang Yu wrote:
> > On Fri, Jul 10, 2026 at 10:44:20AM +0200, Konrad Dybcio wrote:
> >> On 7/10/26 4:19 AM, Qiang Yu wrote:
> >>> On Mon, Jun 29, 2026 at 11:20:07AM +0200, Konrad Dybcio wrote:
> >>>> On 6/29/26 7:05 AM, Qiang Yu wrote:
> >>>>> On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
> >>>>>> On 5/19/26 7:47 AM, Qiang Yu wrote:
> >>>>>>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
> >>>>>>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
> >>>>>>> nodes.
> 
> [...]
> 
> >>>>>>> +			linux,pci-domain = <3>;
> >>>>>>> +			num-lanes = <8>;
> >>>>>>
> >>>>>> Is it fine to keep num-lanes 8 here even for configurations with
> >>>>>> bifurcated PHY?
> >>>>>>
> >>>>>> I would assume so, given essentially this is a x8 host, whose 4
> >>>>>> lanes may simply be effectively NC 
> >>>>>>
> >>>>> Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
> >>>>> never enabled at the same time. When PCIe3a is exposed, it is always in an
> >>>>> x8 slot. But if we have a x4+x4 platform in future, we can simply override
> >>>>> num-lanes to 4 in the board.dts.
> >>>>
> >>>> My question is whether that will be necessary - if yes, sure, we
> >>>> can do it, but if not, we can conclude on this early and not have
> >>>> to fight over it in a couple months
> >>>>
> >>> I think we do need to override it in that case. If both PCIe3a and PCIe3b
> >>> are enabled in x4+x4 mode but PCIe3a keeps num-lanes = <8>, userspace
> >>> will see an 8-lane slot. If an x8-capable EP is connected to that slot,
> >>> both ends will advertise x8 support, but the link is up at x4. That looks
> >>> like a genuine bug from the user's point of view.
> >>
> >> Do we know what's advertised on x86 PCs with bifurcated lanes?
> >>
> > On QCB, it advertise x8. On CRD, PCIe3a is hidden.
> 
> No no, I meant to ask whether we know what the userspace gets to see on
> e.g. an AMD system with a bifurcated slot. I would expect that LnkCap
> may report a different value, but not necessarily. I would assume we
> should probably mimic whatever that does, unless the spec takes a
> stance on what should be done.
>
I don't have any AMD/Intel hardware with a bifurcated slot at hand,
and I couldn't find an lspci example showing what LnkCap reports in
that case either, so I can't confirm what x86 does here.

But can you elaborate on what is the benefits to set it to 8 in x4+x4
mode?

- Qiang Yu
