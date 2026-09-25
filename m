Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DEA371898
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351300; cv=none; b=IE6iUUUIItagt4aEk8ioucCF/s6zkTZEqPwTbdw+tLj4LtjYsYLnM0aeYh7Q/xNGXDN/NI8XFocv2DLTM5/3SuYI6yzKEZ2HCsYlIre3zQhXltnDNHLV5iz6xvjQJWHPJp+7ufBxhVlqL2FEn2K8A6HOwcimPZksIcPbY87PWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351300; c=relaxed/simple;
	bh=E6UApKjAeeqjjgPV6hxBeLGZLMyNRKBoW0DejnovXWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCYEkQ7SZ1rtOwEmHFgPr3zCf1REDHLyqkVrHR0cn+qMsL/3YoyL0sdSkwgfAH2A7vBqdJRpat9fKgg1s1JbfWmwLWRItaxeTb830QzPwPU5jILSTlPrGBgWePFstdghpHJ08tMs+dK3fcwTgip/6MfG6SrVFFOk4lCGal1KWKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBYdca9t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXDXfhwa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBYdca9t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXDXfhwa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDuZYo600490
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HAa88aSpF4m0kFUi9b/TWtPC
	p4mBS3ICVL49YXGHL6o=; b=UBYdca9tEP4C3BYqzKZOolTWCDauaoaFNu7I4yVA
	2yldZ8WfVua0cCmqqNa8YO2GhjSf7ydaFXRd4/dS9C4MH/HSZ765xAF6efVrQD90
	OkGGK+ve0mD9aUNWfapsqPwU6aVRU6diSHe1isR27aVeHvrzp4t8miG3typaB0p3
	eNuCSHyCyR2Sd91HnqxjWHMNhQWpM049/932E9Y/NVpnxWEhFby8yhMJsqgAJHrX
	7+L/PhcGgkvs8QtTrtOt649p0e9x1I53g47l1mujRyeTGDoEjPYfwlUov5i8dnP9
	eXEbYkq70NWVJ10Y8+DKCJoksrdg35QcUuDbaNgdDdYYTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvt16t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:48:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f3426a7cso250705985a.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351296; x=1790956096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HAa88aSpF4m0kFUi9b/TWtPCp4mBS3ICVL49YXGHL6o=;
        b=hXDXfhwa84DmEM6xMi677Ncopstxw4u44EseMCS1uQ8qjTWovgtyC2oWrogTykaBYr
         CWAnn11bk191q4PChftslKeAY3FJ1AGZY2KxmIivo1kCmQM1raQpOJpHwDbpT+5Nh5Mw
         qWWlPA2oW/aqUSF1Z3a+QcElhlQF0oj4O1wB/7dgT8fCuEVKNo0FvyLaxc8zXYlYopr5
         bdp3E7/Ja+d2UNTI0emZMZLglFpchnhK4qcl9YVTm04/hYFM4ZUttQPGSJ/zUmDVVtTP
         Yj44GKZAjQ9rG8qMD/lDsveMREuEjmQJmqXjKAUHCTJRBuRQats/L9pXJUL+TEF55sVR
         w/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351296; x=1790956096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAa88aSpF4m0kFUi9b/TWtPCp4mBS3ICVL49YXGHL6o=;
        b=Mt17Mly6V3KVMQ3Rn6/x0p4ADBk+NYwiY7/BzH6ooz2sxFd/DGSR9ZzihWfzO7rG+u
         G37/oaraV/XIKxJcgogg5UpC7kGVItA5mSA2Fu13BZL4cID5tYK0ZSBihAGjCSPTyN0u
         IXg6NlKt9DwAotJMSXqHBPjDQZPqxrgYNP0VXRN7VvJQrFAi0kgvAFi91w+EYi3kDZD5
         32CEG68z6HqgjwNf9Kr9ozWfwZEBoVw7G5gv516aMIM1Q+ceqQ/LyxSJRMG3S1lHd1eb
         iHPp7+1e4Igld8wi4NxrXcV3p05mNLm41ieEbVcVY+muBQpeDRzV5xeqy16pov8sdYwC
         mBZw==
X-Forwarded-Encrypted: i=1; AKwUvBxWNxQmWjVjWOF97l1cBsRHsC0Y7UqbMOtXabzExqkbOsk/zGVlStvdeH5QBfFD4bq52JNql8d9Eokk@vger.kernel.org
X-Gm-Message-State: AFuF++kN0hf2/XND/MdvBsC+/VN/bDAF3pUzQX0tN4XXq0A9xNmgibcJ
	XI4xzZvbwerpFQh3EQzv7mXn7qrWhYWDSBcOyo+vwDv6PskkppUcDqpIFxBbKhVlOQnyID4EkBD
	j/6ag3UlUbE6hnP1uToaXGEY1jVVvE0AsE0h15lGYMOFiSyDMw8Bb48eDOK5Nv2SG
X-Gm-Gg: AYBFou0531BkoBKp9Ol2owTB/v1VTOrTUww17IUMvCkEuKuvxYxVkpZ1Ew5gf8vq5Jc
	Mi3CKkgnjO+2UZwHawczhx1eADSdCXpwmMeoDbug1NbZ9tY32hxQp7ke0MOdIgG5wkjF1Ot7xNz
	J33aqYh+9JXDYkJvI5Jh6OsZnaE5EtJhHojEBdGrL5kt3KU3kgvr9biArKLWj0BOzk6NWF720NH
	BbrCRWzPiSQLnr2QwN29kVjq6kVVMPVFT2Dnb6BJy295eGM62M1HxIXe+MhPAYcGr6IRui8v8p4
	1njkTTDD17Z4GWHz0s4TQ+Dao+3P2pBpQerHZ+TZusCPsgy7dNSmAQu30Q9aM5LopvEaPUTdjaF
	tt5XBeXClps0pe8E=
X-Received: by 2002:a05:620a:40cc:b0:93b:c025:8508 with SMTP id af79cd13be357-93c43b83ca4mr500335185a.8.1790351295730;
        Fri, 25 Sep 2026 08:48:15 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:93b:c025:8508 with SMTP id af79cd13be357-93c43b83ca4mr500328085a.8.1790351294927;
        Fri, 25 Sep 2026 08:48:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3627a8sm8907573f8f.23.2026.09.25.08.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:48:14 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:48:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 27/42] clk: qcom: gcc-x1e80100: Tie the CX power
 domain to controller
Message-ID: <yttdmfzfkzu36vg6gkoapd7q7e2anhqb7wlg3jalj2u5xiwcho@4nje2faa7uly>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-27-38732033e5b5@oss.qualcomm.com>
 <20260924110809.244D41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924110809.244D41F000FF@smtp.kernel.org>
X-Proofpoint-GUID: UV0DxignBUGD6ufx-0ZN28D8kAM6gJp7
X-Proofpoint-ORIG-GUID: UV0DxignBUGD6ufx-0ZN28D8kAM6gJp7
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab697c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lRdF5oBOcDA5qlmLtVEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfXz2EORx89orMD
 uBHSuRedGBNFG3q6QCZLSEobju2w32ABc+hslwZZ+pBZU31R31UXvQnw73bOe+99/t9qNgE9zqg
 99N+I2BI3ttfFCiOqk+HFbekZ/gPv+M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX8zxjM+Km3Iyf
 mPjqcO2DxlUIrCLx/8lAe2I0pLBPPX+q4HbjGdMO1dzCr5DtGT7V4NYVVrLbdyb47YvYDoXF5Nh
 U++Pf8fkK16noBFxQb+8WGLZXXVnVZYig5+km2c8aDhIXuzKOrAdmDmM7ky6G+ydqw1N8h/eJcy
 9BwUB25q4JwZbu6YwzBoEdaoWCyIKbuBJp7XjFZuDI1fOsmcFgJydO/IVt80g+VFmaISrbddgrU
 yzATleybz89CJgB5oQE7L8RFj6zHD5wqzeax6vFtoRry5h4yX6O1Jm73lykvfWUnnqru5vDUz4O
 nDr4KIC4FLIFd5XeI5UVk8+A0jf5LFy2cvzY2ZgZtlpQeCZEJL3NyaS4BgjG58pdqKsE2TQruhR
 1VIJnmnPfHGqUjny76pOYAoCeVkIVF8+O548dkwsLeft6ASMPrMYNEeQI8kIsp44RJm9ghvQdeB
 yOMo8w9X+dwhA8JOb4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250062

On 26-09-24 11:08:08, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk: qcom: gcc-x1e80100: missing register restore after CX power down
> --
> 
> commit 4516f7fcbae3fe60975d4e2ac718022779543d8c
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
>     clk: qcom: gcc-x1e80100: Tie the CX power domain to controller
> 
> This commit enables runtime PM for the GCC controller by setting use_rpm to
> true. This allows the CX power domain to be powered down when all GCC clocks
> and GDSCs are released by their consumers.
> 
> > diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> > index 9402fd7fddb8f..b979b74153774 100644
> > --- a/drivers/clk/qcom/gcc-x1e80100.c
> > +++ b/drivers/clk/qcom/gcc-x1e80100.c
> > @@ -7449,6 +7449,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc = {
> >  	.num_resets = ARRAY_SIZE(gcc_x1e80100_resets),
> >  	.gdscs = gcc_x1e80100_gdscs,
> >  	.num_gdscs = ARRAY_SIZE(gcc_x1e80100_gdscs),
> > +	.use_rpm = true,
> 
> [Severity: High]
> Will the manual register configurations performed during gcc_x1e80100_probe()
> be lost here when the CX domain collapses?
> 
> During probe, several manual register writes are made that are not tied to
> any specific clock structure:
> 
> gcc_x1e80100_probe() {
>     ...
>     qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
>     qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC... */
>     
>     /* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
>     regmap_write(regmap, 0x52224, 0x0);
>     
>     /* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
>     qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
>     qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
>     ...
> }
> 
> When runtime PM is enabled, the CX power domain can power down during deep
> sleep when consumers release their clocks. Since the driver has no pm
> operations to manually restore these writes upon resuming, and
> gcc_x1e80100_regmap_config does not configure a regmap cache (such as
> REGCACHE_MAPLE) to auto-restore them, won't these registers revert to their
> hardware default states on wake?
> 
> Could this cause dependent subsystems like the GPU and UFS to malfunction or
> crash after resuming from sleep?

Nope. Dropping the vote on CX does not lead to configurations done on
probe being lost on resume.
