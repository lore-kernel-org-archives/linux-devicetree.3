Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6264032F765
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717510; cv=none; b=vBUgc86dX5tsB/Gqe3YZyCd4Z2yEG1bGnAtiAUPfxXedNRp0tRV3k0W7Wx+27eh3k7qtxTEzgV48T1xIdPiMKQ4YcQZ0AvUzavYmeCp13cDOZZHLe+qNBwCaegdN9xNbMwVuRHJscky5kLuR+iAX74h3EOLB4G4m+xW28sjfR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717510; c=relaxed/simple;
	bh=gE1IFtkeWzkXOcvLqsQ73tJs7dYxitmjzZU0BgU6gO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdNLhlysS76y0DcjAakSX0veeOnh2rdZS43r6bvFrfXjI5zsxBF262hvz1jUPOX0EBsvAhL+Df/JA39lj/rkoXBBNTRoHjguB32PAYTJxSyWxRbNMOyQbJJ0LwhVvUEfRjAAN7Ty/+g9Sx+6hMkezHAU+fUDRvwzyvCMjXD/By0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWjvz4Aj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoQKsaKa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWjvz4Aj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoQKsaKa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AK3j4E1648592
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dwt5k3fowZ2mfZny5OMNxv60
	XAgWL+172QPd+A4v3vo=; b=pWjvz4AjL8pM7/cnTiV+0dQT+5TJHu0akfmT0AJ3
	YGhLah7sU6PYjCvmYqrjCdkvuaTCG77dfHTy1Gh+ufakdnRO139G0PhVFj5DNPSK
	wnGlTbhMcOFfJx+YF+q+sbq4Z+7GIHGMnTagP3Clx1zAFSAHu99Gl7m+eIDl3nSS
	DnOQAEJKsXu4CDQcJqFtYpKRDGgRMn1Xs6uSkf0TioZv0xCr9GSyyL8fQPNp9Lrp
	Bb3GLd0qVPW4XLWRdtt+u/Giq6fT9KFlxObe3F8RbKg16JcRmuCRLXq0H68xFtGQ
	0c64kn9GD4xuoAZ0snLlIAvMl6ErzLt7cTT0YiVbezjVeA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb2txh9q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:05:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97316eb0a7eso1125241.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783717507; x=1784322307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dwt5k3fowZ2mfZny5OMNxv60XAgWL+172QPd+A4v3vo=;
        b=YoQKsaKauZCiF6r5h5CfAu3bPBm2WG2HmlLbHsVoC9mh5pe0dC85pVQjs1+OIIGR51
         spFKdEgWb49vo6kEOMjYwAU4ojRQqmH2onEwn8FlVZ+JM9o1UQoufjGwUC0+nr4OTm2P
         js9a8WK5I27K6mnQrczy5jAYSGX1Aw4s3LGuSeeUXLVfU2Rm7KOUByIrzWloU9dyHwUQ
         OxypPE583dVsLA9/QE9s54EOVHnmIzFZAsx56QAwmOhDUAqDBZKTx1t9CRkRtv/bEbmb
         cttqM1TDvnLaN8mPnPs3ruD1pEJ5bHCSp5K473xgyiUf2cB5PhwaydzbVbyDRrQu3Qns
         aqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717507; x=1784322307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dwt5k3fowZ2mfZny5OMNxv60XAgWL+172QPd+A4v3vo=;
        b=FmlZ3vu8KBad9hP9T3kVCeXFg/4frPd6liDC8eCwlUjk9s2kjwcn6NUVQUeOWeVmbI
         xI4/Anh12Z0jNpAzZF1kfJc5Ph5DcJudqe7hWA7E2eHP+FsWd/gzv3PZ+FovOG1LzTFO
         JKsglC31jtgf1C8EbWi8V66j7nA3z/IxbRvtlvgYovyJfD4bQY6UE/wWUmviTOgK+rv8
         khh7En1uPB1kLwcKDQ/tgNFLuAvsN+ZAnlGu52hXuRg2KpZehnyRaseOPGCOyjRQuMhp
         6jrdepzABx1zDa4h08SLgWww+JGYFTEGPjg9J5W7gWR22e7ogobrHwvje31ZiokZeSVL
         mLBQ==
X-Forwarded-Encrypted: i=1; AHgh+Ros/JWl+JklvW7d2fLJHRyHxgxaKaih3gdQTsOwNgUMAS+eStEKnVmMm2813rS2Xt5GxXlpu8K1u9E/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9IeTaDcVauxpy486faZZWzMfFpVCrQ188ClFRSD13ZBOk+qZL
	2tH7pvxAuZ5O2z3+VPCU9l77tr7wFRFF5SzTs0L8hLVHYjcYTygGodm7GVoawRTAwy7uLuoyo7X
	l8hg09t2G59fgMvC7HJAySeMbFm75pfkzvCKDRvQI9JXhDFYcJoOnedmwqZgFe9lu
X-Gm-Gg: AfdE7clW9U93MRWzpi3KiFzhgvANvO5b0lyLcE5uqTvGtxdXpXOz35uYKzHPCxDtAD/
	wQROCzEq81TrU2Z5S7jVR0hguNzy4Rt+0W8DqSFt/jC2oWZFd8afPxFrdTWG2pu4p5LVm/uNCKs
	b+XSCGZpnorqk9Yf3yHnhIYq4o/KxQDrhQrmj/OzJtoqRT6vjl2wludhyfZ5FR/Wr6kWxm3WUNj
	eig0/8Eo5rWMbPMOtelqcMFkMvAdUICWF17WUxNwYzMJXQ+ojbEy60rT6Llpgt5eM5kDspkAs2T
	TVaoCnsKeddaan/l43cDOodbtSmZ9ABMGvMw6nU3HcyUJ+BMrorTggE6hB5zErnlPkzVMg7TwwZ
	bXq5x4UCb1oPOgEySlp5iLakmI27TSxlIpsmuyy5Mr1BJjBBijhuMW/4PcYaoLjkIHifdQ9+Xl5
	7mOYAjA0uZsY/3zik4hiH/VRIg
X-Received: by 2002:a05:6102:5e8f:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-74533b6fc30mr636284137.4.1783717507445;
        Fri, 10 Jul 2026 14:05:07 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8f:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-74533b6fc30mr636268137.4.1783717506952;
        Fri, 10 Jul 2026 14:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab020asm883476e87.74.2026.07.10.14.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:05:04 -0700 (PDT)
Date: Sat, 11 Jul 2026 00:05:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
Message-ID: <7ftlpnxwpiouioppnmnz7mba3vmswot6hgjlp5ffudjcxohlws@wztskqyolsaq>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <3t76ahxtn6e7rhxzxtwhbgq26tdztgfow5kh6lxgtmtr7mucxh@dydqcmawo5g2>
 <ba676246-78d1-4144-8b8e-6d1bfd547011@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba676246-78d1-4144-8b8e-6d1bfd547011@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ELM2FVZC c=1 sm=1 tr=0 ts=6a515e84 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=dzjCRWAtPjgZTTrisiYA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: a5ZjMD4tVGSyDZUxLlaHr5UrEPVqHo6T
X-Proofpoint-GUID: a5ZjMD4tVGSyDZUxLlaHr5UrEPVqHo6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxMCBTYWx0ZWRfX6Ev8zCmWNhiU
 MI5+ZbEYXCHjJYpSt6+LPRFoHQw6Ymlj+O5/ipsA85OZ179+lhILYubPYjd+/lkw0wMYk1On52S
 oMjQnGzFmMepT2MTPpEDwhYhZ+i6M/5yreUbYc3Lswxh2/gPqqhandJyJ7TwWLzTqrp8Xm7wdJt
 pIXIE48AD01rIJ30V86yf+5xLC3ZqJbcdO8Xx0Ir7anC4yJZbWcRA8COl9u88SnB6eFGTgaCU+8
 lN48yvJTAee+kJ4xu/6cASToOPHOvC6Tmua9nA6KchB4tAbWVU6fROle4EDF00Jp1zJ6Waa8EMx
 +8jbX2YXqbg2ZifM+sNoarX3qX+Y6igU8PYkl3VhbWcgIPDqYt5aEAZPVEv82eTr9EAar14olwj
 3f5l4RpW+epP9mrDOwwGWf2SxVX2OW53mGd1w3Ojv7t6kyaLGQkX7D2wqBsTOkN/7tRamu7V3Hf
 6oMHh/1OSY/bvLdePhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxMCBTYWx0ZWRfX3v9Z0qDMHuKH
 yEcampNjGMUESpd5ZNnINy2MuCyPr5WYHL3Eck4aHN+IpGYtEScj2lbDsyiaWSqGrL87DTcKKCm
 FJM+HKHJF2ILCsV8blNC39XBs+yLWP4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100210

On Fri, Jul 10, 2026 at 11:35:45AM +0530, Vikash Garodia wrote:
> On 7/9/2026 6:33 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 06:05:53PM +0530, Vikash Garodia wrote:
> > > The Iris VPU has separate streams with different IOVA constraints. The
> > > non-pixel stream must be limited to the 0-600 MB IOVA range, while the
> > > pixel stream can use the full IOVA space.
> > > Using a single set of IOMMU entries for the Iris node does not describe
> > > these per-stream limits and can allow accesses outside the supported
> > > range, which may lead to device crashes. One such issue was reported at:
> > > https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> > > 
> > > Add non-pixel and pixel child nodes, move each stream ID to its
> > > corresponding child node, and add a reserved IOVA range for the
> > > non-pixel stream.
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++--
> > >   1 file changed, 16 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > index 60f485a4892e062980d01f0b930af4b02f36513c..a2baa2c9f46dc19c3db11dc784358223a035475f 100644
> > > --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > @@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
> > >   			hwlocks = <&tcsr_mutex 3>;
> > >   			no-map;
> > >   		};
> > > +
> > > +		iris_resv: reservation-iris {
> > > +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
> > > +		};
> > >   	};
> > >   	qup_opp_table_100mhz: opp-table-qup100mhz {
> > > @@ -5435,10 +5439,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > >   			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> > >   			reset-names = "bus";
> > > -			iommus = <&apps_smmu 0x1940 0>,
> > > -				 <&apps_smmu 0x1947 0>;
> > >   			dma-coherent;
> > > +			#address-cells = <2>;
> > > +			#size-cells = <2>;
> > > +
> > >   			/*
> > >   			 * IRIS firmware is signed by vendors, only
> > >   			 * enable on boards where the proper signed firmware
> > > @@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > >   			 */
> > >   			status = "disabled";
> > > +			iris_non_pixel: non-pixel {
> > > +				iommus = <&apps_smmu 0x1940 0x0>;
> > > +				memory-region = <&iris_resv>;
> > > +			};
> > > +
> > > +			iris_pixel: pixel {
> > 
> > Unused label.
> 
> Kept it for consistency with others, it can be dropped though.

Consistency would be to have only the useful labels.

> > Also, shouldn't you specify the IOMMU region for this one
> > too?
> 
> There is no iova restriction for pixel domain, hence region is not needed
> there.

Ok. I was under impression that SIDs are generated based on the address.


-- 
With best wishes
Dmitry
