Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5B3C4B88
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927077; cv=none; b=Zxx4jJ+l7BwsqBNMyNDJdjZkqqC/x1aS7bTZepQryOTWMV85jzLg5Xx55jDAv/M7GyMZknMEzVCJrYcdkPx0DLlqxi9dmsKCYgoqcxWrItupXpO34w47gJk5m0SqeDzMsribrKqf/kHmEaqSCouKnBFwvk2dRK0KcH8K66pnkBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927077; c=relaxed/simple;
	bh=2iG4kOLG80lHNE6HN05CA2qQtIYYO+IFPRLCITgJYKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ao70RxayNtLCMfFZU9ne/g6fl1yLkfNAjYnXpq0X7ziy7hCxf/TN1kPFQpTOw6IajU/I1zbr9N04nbDbh6aIrKAQUuOJl3k4j5RAgoJkTVgGCe3hZ8CYm6nCVUr/8jpyUURMOp3ytLWMEefVkFw9yD9Pse9E8g68bZZ20irvLzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUFTxF/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CB62tbbG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUFTxF/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CB62tbbG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRJTl3340238
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8cPA997XuE0awkGepna6I5ww
	w79fUhweZMaYVACJLoU=; b=WUFTxF/cBaRxHKYXcYN/1Q0/mU2fDC0l+9YpuUW0
	Fo1iwLMnUV0E35L8ARdTo5f0jb6sqlHJx2aV+375s7XORA/9/gmz8pHq2s0y51ey
	IWy0vVxk89vcAL0M0rBrW81qeZN6yAuCgU1UrW88wULZYtRzVGVCS+/ywUbb5jjR
	uiBM/bWx2XcrXelhI1nQpYgsjvpZj1njuneRDN5PSfwWg1H2RitPOwlrxJcrwCQA
	AZfv94gauqHTaK9U161ueHLvPBgOXbWBlZ64ndbfvL8cHVz4NhyfogDIRTF6yieM
	vTdPFwKw190P5uykNJfCnR3XZmJW4Xd+4+AdaemUc2gk4g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m0jrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:57:55 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963d7e5ac77so1738675241.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927074; x=1781531874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cPA997XuE0awkGepna6I5www79fUhweZMaYVACJLoU=;
        b=CB62tbbGLGv68bCeyJLfNj4E9a4wlQjggfPFuxiJ9zXLorqSfa2R/jaQvird5DHLzR
         eA34XjM89C1mZq5VW+eXaBZ71qYr0nOj2BM3fiGH4fcw0cp+yuyGL5q6HcMr0OkxVbpl
         Yf8UsMi/PwYKYbeTKYClF8C8R6eONOQ9TzH2JOpky1TuA4UcX7vZ55EhTJUZeHtnem5i
         4DRnCeuU6D2MUpzcatgSk0JCnqzqiWj3WMAJEgCv91jteeEHa1z93LDCUjCrsMcAkzm4
         EwduKdH+0efhzFvuUjYwhBm8ZUN0WL8xSxb+wCc7QQ0LhA2VYTVOlEtrH32/YjOVa20t
         FRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927074; x=1781531874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cPA997XuE0awkGepna6I5www79fUhweZMaYVACJLoU=;
        b=rIZjJr0vAAgTDvNC7vxoSymSeX4u/Bjbxlc5QC2lCpZQ1s/qX1/F8K0DPHgGJ/K+3i
         0+Pm9ZxN9zQ6COBoP5NqjiSLDfvrIqPlZhxvhyYj8BrBrIH4Qcfvuk6Uu+YQnn/1HTpx
         16U/LU7esnvHpTBjwrftlrPbJI8214uB1ep1zZH/YmzDA2FbZAj9zMmq7ZSHhE1kQuPz
         /Bs9pE8D+1ELXe03vxvgOVhSCRNqiNc6S9ujaLwus3/DtPlNWXjxQWqn+Vds7/Bq3DUD
         jfXWb2bALgTje5YAwdrrgUWET242fU9YJA8lQAhUPNyWQqPuGcWvdd6iOUvGhRDk+jAH
         dIfg==
X-Forwarded-Encrypted: i=1; AFNElJ8ePYyJ4bXNuSuYsdF9SMbfKDK2ZUo+0FlDHnXVr/b+kgRiSkpxCvQxvhNOShbWb60T9maSFccjkIw1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2TD9BVH6bhcbZnxeRim5OVTGW8Q7nso65Kj8N09wSqJn/3PcD
	QUdHvxF1NEgzNzh4qT43/pp/Sw7nPUoI8GrF2unxvq0g3qbpgHUVQIR6LvDBa3ZDezimo6eHAfj
	zWaA7maA9F8llnkGt9SnmbZ+fgleeM3PmuQMW3jrBkuwcZeJf1uF4glIxmdPjrBlx
X-Gm-Gg: Acq92OGgWKhm3RA8GekPjDvcpTvHXUDBOsRWgqigLMwo/gEBBc06vi5AoyoDpG3vTeL
	I7dmGw2Iu3fviqgAodrVI/CsmVSFxwSedRUlU2esH1pnYWq0V9SRokKFaZt+BEb1x8UZdHB5kEJ
	lYOoD7jGorZHKugQtUaFDXh4Qgw2mMSPcMQTpemTDn9zKCdnA6CA2JLL/bB/VwN1TTxKZRi+m79
	wRcTtpBdu0KRJqgqFTuGMA1l5d8UlvRKvGQ1CNjWAJJzIlQA2GW0sEhAj4GSE5NhbbGifOhovc8
	R2hZEIjap90nrBnVKtx8o1eBoRWakGixkx3DDu5UXwQSGSpHCYz6HYJgjpSThU9CM/llZ9BJGWl
	wUqY50Q1AJthnaXjbgiBoCBW5gTB0vdE0pBxI+ns+jPxHDXevIA1jgup3L9d53+T7L/oxI9F2mL
	WLgSvidgiQcV/JrKgj/J2+GzT6A4weJunpV5bKjyQecaSwtQ==
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr7169177137.24.1780927074480;
        Mon, 08 Jun 2026 06:57:54 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr7169160137.24.1780927074019;
        Mon, 08 Jun 2026 06:57:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2adsm3867106e87.1.2026.06.08.06.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:57:52 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:57:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX/WFmz39cNzqo
 7QTZNu8dLdEZbYvAQejBP7RDbaFqUAtqPvUZVX/nyubZEDOK5FXtR2ev2S6+QEDeGtndtDX/+VP
 yFVThdmYlRduc4Sxjif/9tSPgcIHo4AZ23VlO8B5Sl8+X6Hs/0UIaw56m7pEMo180lKW69+4EmS
 +wKFlz5MzQpC2CHI84tX24FhGcLLQQ3HIOcG9WGvMCOCh32b+QjbzMy5n/MpUbReS/kQq6mSOon
 p0vzlltnlIsrpqnV+JbDxq9Ajao3t7ZzNEKtDBEMjaavw59QXxT+fnCwlQ2D4oBk5zbScM2JpXq
 lwmStFuBuc1ZsxweHVnrnlD2BNccaetTstlw/Vm8IBRpXhJUjMQbB2oWjFiBzf3NP3v7lDOCY7d
 Yz7q0PB7P3E7egy9Niw7EBqkhR5ufTWrJFQGodxhIGgo6U4bLDknf5OTsXr52piZ61db00T0l+u
 MX+6AEAUZQ76zEiRGFg==
X-Proofpoint-ORIG-GUID: E9qhht8LvzbanrT6HFPJ6v3d3By-_QJR
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26ca63 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LVq_GggcSHk3DsAf1gkA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: E9qhht8LvzbanrT6HFPJ6v3d3By-_QJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132

On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.

Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
be voting on other interconnects too? I guess so, because currently I
see that TBUs vote for various interconnects. BTW: should apps_smmu also
vote on the power domains?

> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>  
>  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>  			dma-coherent;
> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
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
