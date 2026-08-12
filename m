Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A5474258
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552499; cv=none; b=ovGOeJh27nby+zJ0GJS03+IRMDw9+VZqLYSJdp7KQW+h/l9amkKdqoWSeaGj2OoAMPC0o9DGxuivhC14NOrA+dsOyHhP2d7CAhRtVesJ6QyEZwoukQwnE8kSmiTmN6h5aSjE/W87sBVe6Dh5kNPsGsSgM/rfrZ23IiqGpfbaO0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552499; c=relaxed/simple;
	bh=gA0lORcd8PzgzQRPjvcSZ8SlhYNfUM2OulIiqvoMyCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3KSVd0oH+f4DYhVL/DPjP4RHT4zlYoNbvxsb9rbSciiJ32SOFjOnafzTF/2uWWQFOAtU+JuMFOwmlGU3o1KP3ch/jaL4XNPy/pJJZGlvJZn+FK/pjWELOW+8BqwKe7byjBK0Tq8M3FWDyTBk1JXYmyyHlYxq+xQOOzy6CoVRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtPhXVz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HolamIwD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtPhXVz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HolamIwD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbUC7320239
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 16:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HidDxqccptEjRvOvXtg+GI/B
	TnjMVm5M30ebJJ0kgIQ=; b=DtPhXVz2+0m/R6csiE0wGrnIsFPodPamlwyUI6pf
	zhlldQEOuJ7nDYPJKChetqocP+ZHEezY0pFdP5YQ8xqRgyLQy35Rv5PHHcVo/0jH
	kTzTmvlhPi7xrG85rZ4MvUXQq13X38FVm+ARtlyjUHut8tOJ/ykvGHUxEk82j0GU
	njjDyif9U6MCd6RJzCAwlJzYseugPR5COfRV4jdrEnReOlc9rHg/YL6S3fWJdMCI
	OZJUJph4OuCQYU/3XVwN3qniFArxXKV7AUfuTUOA7aXb7PI5FbxWqkIySnT2Oi81
	psONeFFgEbwA49HBLcfCUbFxdwoSqP1eRugJQMnLQ7b4WA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk411c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 16:34:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d28f8737eso22202071cf.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786552488; x=1787157288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HidDxqccptEjRvOvXtg+GI/BTnjMVm5M30ebJJ0kgIQ=;
        b=HolamIwDNiGXNcvRTiOZZ6o29xaDl/CtoKyXBNjMGx62qMOGJX592t3VQN64OhpmEi
         YZdeGgJiULre6xS1f3Rt7A6ZHrdPycjSr7tjpV+dZtgExkNC4qximtiLCpr3vUTzbulY
         ZTs7aQ7AjEA8Jm7u7d2yN+IED5+HNktzDq7MJv5pD8ShViZ59PCBItLUlDE4YsVvbM2D
         ++dJELpXI25UZ7gVw2c2J6d6gc0HuXRBaa6AC/iTBl1qvxG1CRTYfjTwRkI3pttCCbtD
         ecGHc5jvjWjSq0zdjsxMXzGwMUA6x9kFTUIsAxa/qzLKu41LDPDo/dDVgJfzKP8q3DEK
         HnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552488; x=1787157288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HidDxqccptEjRvOvXtg+GI/BTnjMVm5M30ebJJ0kgIQ=;
        b=UysJRESnhtSnaL0r/nQJpybQ1aExvznR3/lJqqTjJRpAZ1fHGYFFOOIT/lVxVnwKI8
         KaMFXskm2+DYMxcMIMB/7wtrvGCTbwG56QVsy9AI/D/jCdBdAZRfze1Y0wpPjbe+dO18
         R6AC3IFOCYwgtlpUCrVI4O/CpZUzclYPMWro0CouC0TFetWGuLeOxaAo2fHUz60FR0kL
         HWBbCpCHWgZxLoUvwHQaZJ/qqY3aMVfCzD5NW2MuGu0A92WLgDH7tQiieVo5ujSaZ9Rk
         4SQNGVd1C3j6h35ff1oj7drNEYHcp6Wc/y7TxTL5qrk6WcXYiHTMakvqFnoTKvu+QQsl
         GAIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMOmr7MWWGn36J0YzvgLi2QnDHXhsVr0GdNdD/V7lPEM9NhP85ap2M0wC7TnyQW3UmHr/xrIijH0KS@vger.kernel.org
X-Gm-Message-State: AOJu0YyhAuYxzx6vCZ4m9Kj4Up3Nq4DL8yVhmqGcBJ+nh5tl/OtCs4GW
	Q0QxP8o24SnUx1FWfu3qPm4HqcukAnAcZnFWMOmyWq3rt3YdK5wd2358Ohxe+HFDLhohHfsAcPg
	sYrS50pz6iFSCf2gDm2F2LOdY4kl6e9JWvfvAXngkuk/Waa1wT130srt0MnTcCgzx
X-Gm-Gg: AR+sD122Xszgi7Zt8rSflZXTXcGq3pq4VKBZ9u6giEUivLeOBNBxThSvArWHX6vDbSV
	CQeWBjwPB2KYQF7b3tCKjpdDYw09LNmzKxpzVdH5bFoMCw7LY4UuvIWSxq3VFBNuLsQmHg8CEmY
	Spv5E3jqUbloGMT8QxmNfx/GZ++FtgSILUknJhYTFvtVDZB7agZ0qG9RniZ8p42AFblak/MmZtf
	B/nNlvnBv7FkUxrCr4uBp3J1jN0NwzCBurkllW0jIsS/+5GAcSxLSmgBYHG2y4PGfH8t4qwaNdA
	qohTICM8qfLqAF3Wr28de6j1hHwySnXICEY7lnhCfmBxHpbaW25V5+KrETnX/kurXlH2/+GBkqY
	i9wHq51eWnP68urrwk10ffMLB7lfOK2jmwEANSe1wz+mturQae3dKrq4iTNvNn6bLYSDchgMdfI
	JBHZ8ZyYVH3cmY
X-Received: by 2002:a05:622a:1349:b0:527:809c:f9cf with SMTP id d75a77b69052e-52d647ed01dmr52949341cf.21.1786552487579;
        Wed, 12 Aug 2026 09:34:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1349:b0:527:809c:f9cf with SMTP id d75a77b69052e-52d647ed01dmr52948811cf.21.1786552487064;
        Wed, 12 Aug 2026 09:34:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44cfb2e5asm609335e87.6.2026.08.12.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:34:45 -0700 (PDT)
Date: Wed, 12 Aug 2026 19:34:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg Ociepka <greg@ferrisoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Mark USB controllers
 dma-coherent
Message-ID: <5wnlpg5pt6la5e7fgd35nejmnh6iudemlriiubm2amg4qkdyj5@6p6iakiik4wc>
References: <20260812154014.123315-1-greg@ferrisoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812154014.123315-1-greg@ferrisoft.com>
X-Proofpoint-GUID: MgogqNTOlz75Ddc8PzF2I_eysdD2ZN2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEzNCBTYWx0ZWRfX6X+YEWb3+iwc
 o8tSFqIwmO2A2bsq38R1fmx83P8U8/1HQreT0WQ7zOxm/7y6z3Qc6WULILe7pteHaZbZRWMtGH/
 7qEER4piusbR26rVKea9RbvtXn8q9YeYIZPPgxTv7h0gtrewwM8QtYa1sHwHVTYKpTJFA5XQ4az
 Pr3zJXm4/Pd+6x1nZSREGYTngsJlyIUmPhEP4kUa+GTx/17s9F/yqGnQeZwEpODmTaITlbITRI5
 +tTRqwipezbidnYru7j2O7QSE5KxiTy3VIFsgiqgBzCHEdRby36NTf5g13jOKnS15LCyJcLXhDU
 VYj2kEGpQMpqgXAUGHp7XUPdpK+ty2rE2BKubrTNES/OqMDyutPznztddcpEdspedLJIMUq4Mz0
 jH/8PftZbm8FGrJN6yPM3BociUEWKOEX6hKa4OGOyTwYNP+LgXVMSFWrjzRw03Mdgjp30nJ50q5
 e6v16DFkO/DsPPmvB1w==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7ca0ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=a8UEx8NLAAAA:8 a=i1Pha25J8sJlEzR877YA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEzNCBTYWx0ZWRfXwhPkgUflHU8R
 TuKIm7VbAPBF9RpFPr0Wdde4g/NPT8L5kJ46vTkbswwJI6SX63zHlINSFb+CEVyDx6N3iL+mDR4
 TO7rL9PKJSyA7+M24wr8L53r23bvxr4=
X-Proofpoint-ORIG-GUID: MgogqNTOlz75Ddc8PzF2I_eysdD2ZN2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120134

On Wed, Aug 12, 2026 at 05:40:14PM +0200, Greg Ociepka wrote:
> All five USB controller nodes on Glymur (usb_0, usb_1, usb_2, usb_hs,
> usb_mp) are missing the dma-coherent property, which Hamoa carries on
> all of its USB controllers. Krishna Kurapati confirmed the Glymur USB
> controllers are dma-coherent [1].
> 
> Without the property the kernel treats USB DMA buffers as non-coherent
> and performs cache maintenance on every transfer, which coherent
> hardware makes redundant.
> 
> Follow-up to the clock/power/bandwidth votes patch [2], kept separate
> so the already-reviewed patch stands as is.
> 
> Tested on an Asus Zenbook A16 (UX3607OA): all controllers enumerate
> their devices as before and a 64 MiB write plus two O_DIRECT
> read-backs over USB mass storage produce identical checksums.
> 
> [1] https://lore.kernel.org/linux-arm-msm/f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com/
> [2] https://lore.kernel.org/linux-arm-msm/20260812083522.774711-1-greg@ferrisoft.com/
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
> Assisted-by: Claude:fable-5
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
