Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829DC3382C3
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709553; cv=none; b=Q6MB/w8ji52SPayAQoeqaeB3Xn0jbPtYWF2XXtgKA2gKW8at+HIFkiwxCvevGprFbO7LN4gYVHnP9pg4R1VIdngXJE3LB9AcFeKmoDdWF0a464m6yu9h/C+DIYPM0CFMZLbRKzMETM4MbdeloAwSvrJvL3uhpNxRU184V5rJ9eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709553; c=relaxed/simple;
	bh=0UZDjBWwpZLsNJ2uJblfbqB6wdN21DW6si4zLBTKahc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTusMezcVSQD11O2VKh65Mua51xufY0NDnlWQUvEivnR/kz2rPkTqePh3H1tpIfVxzxBDINwrLV5We5Xqg96VG2OAx+Cjvsor5H/n5I+XfNE9qYZZLBPdnzzg8cEAdd5+Wgwk1CHL2ub/X6BvEp2Dr3xN6Yq+g+q8D/26oRMYNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqT4SD1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fimiizBz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqT4SD1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fimiizBz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4Nf3A1772953
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SphvedPAcYBkMmYiWmMFQ6HZ
	BK+WcQTpTR5JD7DeEok=; b=AqT4SD1czj6Rmf5HKmxAnT8OhcM+udBreSvm1L16
	OS4a7Z9ZNThNVM2O0FMMdEnKzbiGXloHUUFot6e+tY5W0DbIbpUN85cduySEU5ma
	1atSPNkA3qeQJfA87AhQl1xd0mIcLd1jCspNWmaKciaGpXYSw4XpkhVIGVdqi4sB
	Bi0VMRekZ0YGqYHDWnyY8s7cTniRm7onrYRZ0Y5QTjNxYTndx1cCVK0S2k67i26d
	qN0Y2/VKTxCQP5J7xQ8zsvotgNUHA5waUPtEJk7mZRo3fwD2UPBYfdYVTYxwu0Hm
	DcR9P+p0TuuW+PBZ5tsLBKvNkr9jKJnU2qBAS/sC2AHNIg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27084gm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:05:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139f5f5eae7so5991561c88.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782709551; x=1783314351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SphvedPAcYBkMmYiWmMFQ6HZBK+WcQTpTR5JD7DeEok=;
        b=fimiizBz2xK5IRhlKPEwqgCaitEkaYbmpUak3rBTpUUzCRZomWXzM+oogXBieo7rp3
         u/gUr6N/CNQDmhGKjcstadFsuPasqbb3nEL+NuzvAipgcqTFwyIxQq9Urwv2p0gWIt3e
         hh2U8h8lhm7lZdFDTJKZ+50QhkxbO9wTXicbC/+/pNxNhHx7xEtPbqlR/t/eHq/nu9Gk
         GCRNrpVk18SWMaK8PDvv9sHICcqy28RKRHqS6Gjh/NHZwpSxkPPbf4xtY2LD5BFqJZSj
         cOw86vmFtjCYPEPQRWRisPqvAk+lXQdmPt8M9kv77deZgeYVCY9Q1DM83ZGODam/5AOv
         Z3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709551; x=1783314351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SphvedPAcYBkMmYiWmMFQ6HZBK+WcQTpTR5JD7DeEok=;
        b=mxK366u9wWjvv550a1m4LxsutLwBUFYK0cio7vq/0D/9wDxtmjpe4GN5XuCDBjVQp1
         A99mp0mE/vqxuZEOalWytiYTlNQPprsPaHXgy16IrdRHtq54Zf2rINCYl/7vHxHKAWFl
         Ixyw3jv1rPvI9EfqXIeGv2nqswVpVBHMyeih1gzEZXLYyqvDQAkLg+4G75PsBJjgrQkq
         2eJuzy78Zm2mDyQdthR9LkdZCI6H/rv+vzzgaHJEOg5K9ENx2h5reXjInlJWdsGKdrqs
         x3UI1BTV1SFdZlbBVqsnatpcxs7mjuQ1VepHUrJg5M56Iit09Tq8GsZa9KI0T8EEFqZm
         KqTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8SPCXiBEIHymwvwSP7O2EWtGshrqnX2C3iuP6XJphY2jmNbMPCqeDuFWoSA0KFVxkLlAsxmREwLg7@vger.kernel.org
X-Gm-Message-State: AOJu0YzCjxxTwc/csbfoU2wuxDJd9Pl7bvLVtXzYBIo9x3WLvuu3Dfp9
	JOmuj3D8SSCAm2xe8szHbI+s2yUQaj/U2iWGhJz3GN458HrdGQK0xM+udTYIQJYf/clkGPRAGe5
	UBT0Pdb30Y40nQRsY5HNf1HzqV4gTYG0aUpB1FRePu/Zgn7wnWCZsCeuZDHa+nHju
X-Gm-Gg: AfdE7clSLz8YLV/be3D+Ptq65ltsaY3Do+1eQJppq7eo8FokKzb1ujLLhF5GYy/ZzH/
	Fpwipro8k8GWLn9/dAnkcCW6No1OcVxCMFrihvXCKpQaHvaMlFHMeO2E61XdB0vW9PY6HNUw6Wf
	59nzvE56pBDBQ526p4kEBpvA6GqzCx/rZ7/d/8ISFuWQXuGlG0xxtTIbrf/5DFveJsLIh5D5G0u
	xxDrUjqQ/y2iPMiLa6Iep+Uz/2fA6dsQfXUTpWuBQrw1Mmcr49DTCUgsFLyJMqLQz7V9l/iVa4g
	AT8GC/3g9ZJVGy++EJuB1k5dya4qJBLTk78ozjwwecQqWcrVNQ0cckGkjaC5vGejnEvaBdAd9xn
	DgBCYgrt4o5UiepgZpU7nYRpD5lHzpclpxEaRBYpRsPuCYNRQGByNM4HSZQ==
X-Received: by 2002:a05:7300:2203:b0:305:56a:c38f with SMTP id 5a478bee46e88-30cab3855f1mr9060490eec.26.1782709551111;
        Sun, 28 Jun 2026 22:05:51 -0700 (PDT)
X-Received: by 2002:a05:7300:2203:b0:305:56a:c38f with SMTP id 5a478bee46e88-30cab3855f1mr9060472eec.26.1782709550644;
        Sun, 28 Jun 2026 22:05:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ca5f14f8asm27950230eec.6.2026.06.28.22.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 22:05:50 -0700 (PDT)
Date: Sun, 28 Jun 2026 22:05:48 -0700
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
Message-ID: <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a41fd2f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4Le2suw5-MkOVKQ7DJUA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfX2K++mI+/WWRH
 9s6M1HSUd1+wJSuvqxrNKk532IlMlWvYjjveH/U1kuVmYV9XnNrt5wpM8ZyGbmw5ahYJDn6khjd
 ZeaCoKdAH1JZzXBxuTRNtcAh97VcyooDSpl1Sp6TTaJiBSq+zkmXPWZ4oOYJizYMCkTuDrJ6bBQ
 nClJLpUEn+8JryKkhsO9UYZdWRozj+ToNo1GpgXk+FvPDodE8Jif3q3V/AI4cGxFO5f9Rqp5eUu
 MXB9CZ7eA5OgjkRIflc/58pXQFXuEdIu1gaQgjzx76AyV1fccCc4Q3i9zBdfq7LCa4Cg8i9tqjU
 dX75V100GJjAyczSPSU9CWCJKME38qMmcZ+kXLH9XpuyUR/P60KrQLwfALt/syXXWFs4xREfpbj
 1Shxh/3bGdRTVaOJQQSvlAyCm2lSFVyY6eyXSwGCy/DAYaNDgURHvLX3q1rtBIXd/aTCNkWOB8x
 OxNZAJThH3kKPDSl/KA==
X-Proofpoint-ORIG-GUID: vAyy-BTbcUQE7gMPSH6gqQOWM-CcDeLt
X-Proofpoint-GUID: vAyy-BTbcUQE7gMPSH6gqQOWM-CcDeLt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfX3pYxEGQ8gFdI
 I/oLKkr+29uGVytno8noKzQvHsfQMbzkKKoIOCfvb8ILEpxSTIBE1s7ZKQMLNlcWcqUfzo2DE+u
 vkHVEZpUmJI2w2HRvvGdwAXT52+9sUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290041

On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
> On 5/19/26 7:47 AM, Qiang Yu wrote:
> > Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
> > PCIe3b as consumers of that shared PHY provider instead of separate PHY
> > nodes.
> > 
> > Update the DTS wiring to:
> > - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
> > - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
> >   &pcie3_phy using two-cell PHY arguments
> > - configure the shared PHY node with link-mode and dual pipe outputs
> > 
> > Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		pcie3a: pci@1c10000 {
> > +			device_type = "pci";
> > +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > +			reg = <0x0 0x01c10000 0x0 0x3000>,
> > +			      <0x0 0x70000000 0x0 0xf20>,
> > +			      <0x0 0x70000f40 0x0 0xa8>,
> > +			      <0x0 0x70001000 0x0 0x4000>,
> > +			      <0x0 0x70100000 0x0 0x100000>,
> > +			      <0x0 0x01c13000 0x0 0x1000>;
> > +			reg-names = "parf",
> > +				    "dbi",
> > +				    "elbi",
> > +				    "atu",
> > +				    "config",
> > +				    "mhi";
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> > +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
> > +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
> > +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
> > +
> > +			bus-range = <0 0xff>;
> > +
> > +			dma-coherent;
> > +
> > +			linux,pci-domain = <3>;
> > +			num-lanes = <8>;
> 
> Is it fine to keep num-lanes 8 here even for configurations with
> bifurcated PHY?
> 
> I would assume so, given essentially this is a x8 host, whose 4
> lanes may simply be effectively NC 
>
Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
never enabled at the same time. When PCIe3a is exposed, it is always in an
x8 slot. But if we have a x4+x4 platform in future, we can simply override
num-lanes to 4 in the board.dts.

- Qiang Yu
