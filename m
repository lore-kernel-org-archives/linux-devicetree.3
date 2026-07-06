Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6F33B7778
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359750; cv=none; b=G14ZjSF7UOA3HDG1Mv1+OraTO1b2ylDKkKQWQEb2S+COGpRyuT+PTEUvNNl3KxqdM16nd94E0rmFCHh/Y2SB6jRHgi21bjoct5Tl9mLSHZe3odGl6HXldyORet4u4O3pT6RouyT8Go7G1dF/9xVs/PtntzgORz1nrgeoJbdF+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359750; c=relaxed/simple;
	bh=Q0hgKfMIGJ8oQlA0BCvlI9Wzx1l4ehDdzg25X2t6qEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oV2UDjZrsiEJ+IsMeVurw5q0AQ03nREFUPgQi1yg2BJrnHsW/zqk2F7dbEWs1TrHU9RkSntIjpdh3JLG5OPiekD8vljY2YY9ZyiJfbkdyJklFWkNwIkWgtlP7ePpZE0bDxiAeE6ts4b6ZPvazP8frOmcI9+Ibx4yV7H/JEjV1u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWSQ74IS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQqr0oHM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWSQ74IS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQqr0oHM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7h8990240
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 17:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wZzheGRlsfoWHphf+vMzevyb
	nf7yYRErojFNsdmSejg=; b=PWSQ74ISsra20N0G3LSYA3WMfBSwhAUFaTIdS6Kd
	s7b7U4sT9uJgx/4zLi6Gh+/pDZeAlEpdi8DxP/0Ag/rvG0QAxqFyNzgsvelXXUBl
	KacXcsVNei7i3mZ6PMzcDyCT07PKfl88Y6vHgIOfT/pglQWDqqXV47vP/g/g+8o1
	zGDFxFHVSMPFDOLslQH3DFqD7tD1BvBUnb4MW99E3JRC1Zct9fOgJjhHyO2w0R8p
	4MeC/MfzDfQwCCL+q2dINDgbKX4SfVA3/SPer2vel1P2vzpK3x87pmADDeL9go/l
	oAyLS3PI/H5ImY8q7BmgOQeEOf83kFzBZ0jvrfhTRcPBLg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gt696-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 17:42:28 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdda66a906so4650862e0c.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359747; x=1783964547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZzheGRlsfoWHphf+vMzevybnf7yYRErojFNsdmSejg=;
        b=CQqr0oHMBKAgkshrXeLNbiJS3nxMA9rta79B1bqvyjvx6tXpgNcUcISxIzb8etapJY
         Vhv9GWjIHgA/ZWwIvAATvUXBCB4QPasDlw/xvNO2wblsZfmqMfzRolPHlBH9IzPkOFRy
         yLWhgnD9XCbbxMY1Z31BpySgXcf3TMKiwEa3Ud94C3w5yTsJj4KAJxHabqzXn2Ojo6tZ
         wISNwYXvwaJdfTzM9FWwWdVhtmy5uGwsTwg84vrAEHuVaIzLdJACRo/G+D+WKCqBqjYH
         0Vpd5j3Run+3KhdnC8RO4maf2yb2sk/tJlDRwpMhWgJE7IWv1KnJYHiXCjNyRINOxZOg
         2ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359747; x=1783964547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZzheGRlsfoWHphf+vMzevybnf7yYRErojFNsdmSejg=;
        b=nLok0qXPIfYEwd64dka+gKcujEUPCPRqARqxzumttERnbeCAqLKNUiikXa4jqJ/GCT
         jSvQXR+OQv/orIVZRpJqUJ9YjEy5K77HJn5s/bydsEuCgkbYE/UHgL4EeIRmStomO4s8
         tYH8IPRlO+9IIi2nwkdPouZz/b7ATf9iBwJ74ku8d+I3sDDto/bILq1cUJlDqiZNloXP
         HnR0t/XLW/EDjKYZvr3YwQGgGczW/+utYdpSv88ktJIzSSSKCR/ycod1gjIf+ehfiDHs
         GMDAilPN2sqZ8rKoY2OXkx15uhK+L4xIyS2wur8PDCs9I6HGiCoAVmlXyBQw3fE3//6b
         dBMw==
X-Forwarded-Encrypted: i=1; AHgh+Rpq1G9Iqectx1562/JOYSnJJeyz5Jz8/ymjLu1KprN5p9MGMWdE5nhsYHqPUvQ5o2akDC2zLdAqDM4J@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ny4UTEedw3jZpVDdVspCeiQE6WWIOVWtu3wq/n0cWkDd4epU
	QIufCgx6S29lte8FoxlWPTrwyuGwk/QVw2+3wkJXzwAbVtGZVIjtCowaNVG2Q9Ec7eTcNTjzaUC
	2IAcimgSlCCl9m0C7YRpvm8EGXxHn6d3SkCnD9P/muw+PSVI0bYeRDqG0tzxdv1BiDzrSO3pT
X-Gm-Gg: AfdE7cnIi3WHWqFun0XAIudYR0OePtqAs9qFzq3MXcnuRwXQHb+3Vca1T8WeT3QWRDk
	x7Er8TOh/zy9YJxlSw2vbtZXCz9e/9StOLUhD9KGbwo9hk08YFIt7ipDB1ukpokTVuLOteqsCKS
	t5/KK1s5zwCmwxFEnz05KCCvHFxmEnCz/G9AbiEZqlGkkR9ztSSQYI/UAg9/Y3EUQK+V09jhO7l
	FpnHFKAji/5OtLel+ScUIATrERbT07Gv3rOs/yk4zmSxV0jI+ksNBYbhNlhbyFznWCnOPK+a8l+
	/Aw+Gl9CALsz9MLRhxsC9FrdsyyBCJ9GpxypfQaeTNEj61uv/LJZLM3y+QHX07fq2v6WwME64Tz
	zzmxri6lS/K6VSBP/zsl4JC6lwEHc/JkxQLlotirJqhb2N2mMXD0DECn6vDqOrfKwPQb6fOrsP5
	TTGOKd14/BWq0jbEWOLn7EPWmH
X-Received: by 2002:a05:6122:32c4:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5be8953a62fmr939548e0c.0.1783359747090;
        Mon, 06 Jul 2026 10:42:27 -0700 (PDT)
X-Received: by 2002:a05:6122:32c4:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5be8953a62fmr939531e0c.0.1783359746659;
        Mon, 06 Jul 2026 10:42:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c1asm3007595e87.81.2026.07.06.10.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:42:24 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:42:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
X-Proofpoint-GUID: TyA8wZTi-lqTx5FIHvGIVosDhX-nW51s
X-Proofpoint-ORIG-GUID: TyA8wZTi-lqTx5FIHvGIVosDhX-nW51s
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4be904 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=LVq_GggcSHk3DsAf1gkA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX1Vq5NY9XC9vB
 0YROax5Psmq5Unn5/S/nCLwBxs4Pyw4FtuvdWxr4/V3TtS11A/mUiQdKBLSWLzA6Qqog1sCc23/
 7x9Qt5APqBzp/+q/DC/KPIbW2XnGGNi9jGD/qkCxN7J99nJQHVjsbH3xhjIZyHrqapOJf+3XbEc
 bh3fmv0GzCZGjTUWOqmb84JnKYBqOrZp6hcwThZJeExNhESOt8Iz4140IWiNmnNCMsPTf0XakF0
 qb5r1BvHXkm3kM3Y9ZlABrVkf8feHH3wEuI8jk9K2MuHyEgavrLlY61InWKrJXPKCsQeKV6v7lA
 VeMohdC3SgWSHpLoJB2XepeE53DvSWmFobo8I49URS/SoN+e/A0X41hYPmTyzxdZKBAJoACvBx6
 pWQZ4qRB/Wpb2B/GvEw+rcZkJ/hX8TdtJg4492VhB+cF+ZcfoMNo+gTfuiNkgicoBX7hLxpk9Tj
 Oelgwr+PW3fML6RdpzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX2R9XGw2iFA7Y
 TXYtb9Q95ETUgeOYvivXfIdMH6TT313oqWIT1DWU9uVfa1UX2qPZV40TUPq9ulKAvz1dKaCJcAE
 HV+fwRe4rtTtcStBEoCWwZNylZh4Lno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060178

On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 90e50c245c0c..721526f023dd 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>  
>  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>  			dma-coherent;
> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;

Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
then drop the extra suspend/resume play?

>  		};
>  
>  		gfx_0_tbu: tbu@3dd9000 {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
