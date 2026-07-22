Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FB234D90C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680532; cv=none; b=bseUQLhItY7WpVNQe3dJOJDTWzDPc8NkXJmiqaxuIJ0ikM8PhL1yD4XHjNYI0JagC9RxUj+x//YpiZlfY1EWwwCD12XwMMgVhKUetxo1OmRuSbziMJAQo4F2NjElwaMm42JGrVnpQac60uxmAsAVXvc3CTmLbBErIkD9CDAcAbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680532; c=relaxed/simple;
	bh=ZiPa5vGVE0Ss75ofMG8iEgYQ4iiyAKjmGWoImxrg5CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkYMmAPq1jrOOukY1wkMY6eKufoQiEqNN4lMonlA8T8yIbValtDGpLKfQL9lkvhSDKXU5SwfDhbb9TJmxXqhZ2rP5iZsWWwRYh8/6KX9sL8T7kjC9KEKMTZ2HIwfxQpbtjdah0JYCSmKkyRgI67Bup55AIOJIShhKDiGWkCgCT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGtFjSXJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kw2OWMr3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGtFjSXJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kw2OWMr3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZQSE2910867
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f0V09DaOcz09+t9yB3GnAscn
	+Wyme+f7EEbXFshnkFU=; b=hGtFjSXJcWYAewpEj3csLzDMonBIsp5X43ygTqjg
	TeyApyY33614BCpgbmMQIcbVf9CXn8APaRipjqESQpIaASHM/BuXAMtv+88YNwYI
	w0ALBUf2HmjP22VP3hyUizfMBuUpHaajrnM9pvSTl/pfVWxb575CQeBFY4Mzx+P5
	U1pgmOECBVfDe1mF0sbqbVpwU1H9E5feOb0jBWWlbpHED6E9YPgrWq7v1mtbMyug
	UM6M6j6Fsuqu5PZvar4vJItmJw5Nn+afHJ8uYK8ctE9no0L25AQoA+Inz8tfPU6l
	fMSQKhjmaNNqukcCCVcZcloH23e84soehSZlpSN44LKdBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c42qh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:35:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so288282221cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784680529; x=1785285329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f0V09DaOcz09+t9yB3GnAscn+Wyme+f7EEbXFshnkFU=;
        b=Kw2OWMr33q2jW5u/K/eh8O/tb6BN5P69nPJ8gmb7ITSNdc26rDW4fk12vTN+c27zRF
         JjI6j8LF/SAIN1Kn0g4itZbGu9i62BwkizivLB1QDtEuFzBg6CZ/Mt5MoshfifUDX3Ux
         TLYvVUfAMYfIXG828afCEoMeWX0zEq4ojIBdNmqr6R3wuc5GQYN0jW8NglidztFOlv0C
         qdD+ggQ05J40d8uVlq088pf72OjqrCNfZ5XAkk0wCFq+F/5gwqk9OuKkG6GESvMLrBuI
         8Wy2T2++WQ53tV/fxu6/Y20/04TUlw/UuXT4neejrlcWnJkEYd2kyjfUa1bzlzlIBezE
         Zoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784680529; x=1785285329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0V09DaOcz09+t9yB3GnAscn+Wyme+f7EEbXFshnkFU=;
        b=rnsU5AMbn+ExMr48XeaxppeeQuR24SYou54wpmmflZZ3Q4S/T+WkDVZsg3iBPYtXO6
         aeQj8TJTuWHiWlGzZf08ekNB0o9RZJaJOZul4r+q3MjhA3/PFnRzX6oHuViD+2T4OW3/
         o6wPcSkj8V91CVPg9B+EjYhafPUNTEbk0pJoczSS4bGey13bDtEwkFS/SbUhjJm/0RqM
         SyEVZ1LeHG1dYYweBI4LT7AxG4ksF20khK9DRLoDUgd6JnD3WF5q+FQH2yUzby8ZnwSH
         vsGB1N70Ypw9XlvHh2O2nsGN++B75jOkKy6w0/mDkUHfmBj6PcBUb3Fz9wfzpwknT2Ye
         RoNA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3UsaEFKy7wcYPJtp1VN/Dpe/X1Y76H1p32tftpsUxCOS0LQtaHbkEZ7ShXbrxeid3EOohZa1pykl+@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpIT3tp4zGi2dCWSjBhBPYFR9+ufTNyOG+iXEC+6u6tlZyJXy
	1qAc9vyhXNN6ZpCrUcfvvrM3a+oMxUeiHp12yM/pqESsuARJbZmEg/eZI2Qav3KrhCufacCj0ZP
	Ph4znt2NvN8xM3kuWLrGmXTkxZT+/Ti46X9w7wp9NChfEbGqANVI8xqsde/HUTzCD
X-Gm-Gg: AR+sD11XC5wHqk71Tqm0HjPL3nF0TRRB8Sfr2pV41++jTvr1CcXYkBgN+t3AkH3l1JU
	4vwO2aQ9T9SCsXAA7PyMEIes7xg686m0noSHe9MNMj7c9pBBBw4kfLy3rjL/EeRfsU1vyQsvt1F
	F/QNEE4XzlEhfEK5x6qgYdbp0UXjVmTC6h0D0RgvXweyhkKFpkyMP0b9HtuyqsD7/a8mzZAt86Q
	6iDl6tH0ECv8PjZuJLMhX2LYcVY7TtZ7H4oUSORemgV3DKztJTIObSjza10+fVHti/L+2VY7AIm
	hyMCjutcWWT/k9SA4TzrpO8fLokw3sQmiJ1nkDZCP4yQL25/lEPNDdrpqSPT833KMPPZFDG1mgq
	ezsTOeMYQ89+VvTtPucsAhQnrjD7eHZt6EkNnfD/vdjcqRx1u4MtwxcPrTAWEyTgZ4/O/pNMFDq
	qITTwUiWCCn82JYw==
X-Received: by 2002:ac8:5a86:0:b0:517:a9ef:ce30 with SMTP id d75a77b69052e-5213c8e2bc1mr196938741cf.17.1784680529161;
        Tue, 21 Jul 2026 17:35:29 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:517:a9ef:ce30 with SMTP id d75a77b69052e-5213c8e2bc1mr196938611cf.17.1784680528783;
        Tue, 21 Jul 2026 17:35:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f50b18sm179116e87.83.2026.07.21.17.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:35:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 03:35:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in
 qmp_v6_dp_serdes_tbl structs
Message-ID: <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
 <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af>
 <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a601052 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=OQN141zOAAAA:20
 a=NEAV23lmAAAA:8 a=JfrnYn6hAAAA:8 a=PhrSGFbiKP9hCI9xACsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=1CNFftbPRP8L7MoqJWF3:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: yGcIbOwlLNGB2aRp7Fz2DDeBRpJyXgU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfXwDAQF8m13Q9o
 LNZINEVJPEdOqWnRebcg1nyy2amQ/c9gRJbKrKEvAVI/xaXRiqoR7FLiD4nFSmL2oR8nQlOerWV
 Nv74HEi37IuYSHuwX8XEZ9SYLrkV0jPB0kjHaTmTgnYDSwGgYnZagvl0R+SEDkfUPHkVsmpA6cd
 POZzU0cRIF2+tTig93byNJvtLrXfZc+zyRD2RFAfP0rM5gUL4jpJHRayIkwZcxt72gMQSN6Cq0k
 veBqQYXncWlXpu+zt3jJvwjc3JDtlyU0PxnQGdu2XdxHrcXblEqnQ6eMffHtWf4FGcqAUDZsWsW
 o4uIA9w6YX50nm3GizXORmRu8emv9/cpaF4avcArIqXy06jbosDYbwyJG+r/ebENS5BzL/pY9iN
 7DuFxxDqkKpY6QukLWWj7NtswxSNjBa3JJMi8/jOlw4nOa8UXBiwolF96Y8aqwDfCbDnfFhmj+M
 mJK4buNxHKhwCpM8UwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX93FTKT3zDDPK
 aKi1vz9COGM49EOzJzq0fawTojMb+g2GLCmtpN1FGQ8ZtsxZRifA4d1dhXEHiJ8y30lLAQQy2rf
 WWzy6yyRhLsGQbN9N0hTc2YUXxbdPkk=
X-Proofpoint-GUID: yGcIbOwlLNGB2aRp7Fz2DDeBRpJyXgU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220003

On Wed, Jul 22, 2026 at 12:18:10AM +0000, Esteban Urrutia wrote:
> On 7/21/26 6:46 PM, Dmitry Baryshkov wrote:
> > Checking the hardware docs I see no mention of v1 or v1.1 for these
> > PHYs.
> 
> I got this information from [1] (SM8475) and [2] (SM8550).
> As can be seen downstream, SM8475 specifies a v1 PLL while SM8550
> specifies a v1.1 PLL.
> v1 tables are used for SM8475 as can be seen in [3].
> In downstream, the SM8550 driver [4] defines both versions.
> The declaration for the structs found in the SM8550 driver can be found
> in [5].
> 
> Please check my findings.

Quoting commit b5383dbae381 ("disp: msm: dp: add pll params table for
4nm PHY pll settings") from the SDE driver:

    Because of changes to ref clock frequency, few of the pll
    reg values are different for kalama compared to palima.
    This change differentiates between these two 4nm versions,
    based on pll revision and also introduces a pll reg table
    to differentiate the values.

So, I assume, that v1 vs v1.1 is a clumsy downstream way to specify the
ref clock differences (which affect those tables).

I'd suggest adding the comments about 4nm-v1 vs 4nm-v1.1 rather than
renaming the structs.

> 
> Regards,
> Esteban
> 
> [1] https://github.com/LineageOS/android_kernel_qcom_sm8450-devicetrees/blob/lineage-20/qcom/display/display/cape-sde.dtsi#L70
> [2] https://github.com/LineageOS/android_kernel_motorola_sm8550-devicetrees/blob/lineage-23.2/qcom/display/display/kalama-sde.dtsi#L71
> [3] https://github.com/LineageOS/android_kernel_qcom_sm8450-modules/blob/lineage-20/qcom/opensource/display-drivers/msm/dp/dp_pll_4nm.c#L195-L282
> [4] https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineage-21/qcom/opensource/display-drivers/msm/dp/dp_pll_4nm.c#L131-L152
> [5] https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineage-21/qcom/opensource/display-drivers/msm/dp/dp_pll.h#L104-L129
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
