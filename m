Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE532B9A8
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871770; cv=none; b=f3fpF7iw4xJ597/9Etfwdt1gPotjf7UOIYpVS2srzI+DnueEQ4eCRBTuGgX8VM003mqL+XSP1MIo2PoTgdgJnPOEv7r3spVu21RkPXSRgFG4K1QkCPis7Xb+zc0FCkr5d+nVHy+e4sMXKv0/zW7QaJoz5ZPsSfFTx51kknZzK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871770; c=relaxed/simple;
	bh=CdRMxxJhqXyKUurFEc019GhT9+7D4FmZqb+enKXrILg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnsAvbZzBeRElTWmDWoZ24ObiItD6OeCGJAjhRjL3pfx9Z2SGClELvQ2ZKm8Zmj0Eo3FoDs57lu+XsJZf61m7jPNvlS946XQjRteBcwlPSdgNvog6/GQTGY1U1yLIjc8RzsgtdPSdEhUGKzP+r1DysN8B1Eyjoj8xdy8UZ1YfJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDvEzbE3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KcbAtjOt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDvEzbE3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KcbAtjOt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAtoov3083046
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gz667Q+iRVsAFcsm5jartEDf
	sKFXucp1huh8Y+6crxU=; b=WDvEzbE3LXpZ9DP1+prVK1VZpX+2ExaYiMDn7T1r
	MZtnsfWy0S7tuwYJEv0ktEZnURhBlSbmVgtl/1YlRvLGm4Nf9B2X28QgTCJMaqYG
	SVvIEKB44Ag/4P+puI37FHj5iW/JWzsI4goa5ivXa1htB5HF2IC4svx7nzBP1dhx
	I12H1e4/+EN+WiyQmg08UKaPbLnWptmMv+T4pTb+1TRzgEJlW1NYFFqYgg6FSi+2
	ky18fzVCZ68fbJHxKuxkKd3xLPso1svDSFLInB/V1XyiunCd5ziAybO49seJAa/6
	P+jZZq7WWV36wmqS8m3/CEhBPtsldsKFWFrlnf0gsnegtw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmm5tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:29:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e2592ea3bso61679331cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776871768; x=1777476568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gz667Q+iRVsAFcsm5jartEDfsKFXucp1huh8Y+6crxU=;
        b=KcbAtjOtxTjzpl7v6UDr5gszF3GOdJMW+TGONsp7CYFLMF24uPewRCv0SnLidmEycf
         QGGedfU7gi0o7PJ8e23k0jig2ukGZoTiJ5wJOAPYj7jzplpBAMYhETKug0aW1cNEKEHj
         16K8OLNggYvO5mkiEFUZm6VcIX5j0BxHkWF8083+rZf3RVuUUoyg2Oudw/P1TvCLdM2r
         PLbjn+jCZkYGykJnFDrSQRSh0LfXzW7FSgKQ4vGD6p+IVTMQFKLQV7yG6EIJ/+zznkZR
         tljGSXNxKyjNBsipqrQbdVL4ATvsPk/m7canMYu53GJDSHaaQHO4T41bmbJ7xeHr9thb
         t/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776871768; x=1777476568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gz667Q+iRVsAFcsm5jartEDfsKFXucp1huh8Y+6crxU=;
        b=RdlapegdBkJbXlcvlSRGca3dE//U0NGd9G0cnL660H0BLW2MMvy07M/pk9fXT/tFk8
         V/5+nd9U5yFPh8KlLobMuDJDye4DHT18IchgwqS+dGjSWwCxNHC2GANkXbGsot/bLHS9
         q9UBpcJq+YbuJHg6qW59c3PfBKg55rR+pKI+a6ehTXXvjO7hCH1iKDIVwc7O62mtiQI5
         sXOEB8RKXwEXvbRM65YYmXtIvPhjdfD9UGp0ue8DTmRMsXJBlXqOubeclrY47D8bHRv6
         vkw6NyAjibxBNoPcwB+3Z/sP3dP0Od1ANk4eHQXzC25PGWOXje0BlNMhbdumGumAYZ64
         1gKQ==
X-Forwarded-Encrypted: i=1; AFNElJ89rKNZ8dY+Ul8XfNrnS/pP68R6fV9X596RJKm8FaYTZDp6oh9vasaq5islFWcU4Gfo1pnXgjYsG7yZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt2L0Qmwdc16hMTyjuhYGf5scnyHYrURdFVmIyJ9N4HlZAstcS
	IC0vFx5YBUDCS1JB6ga+jYvNLqe35jtMqdT/TMuZCdtA36DzqkMMFp+f5OO8QtoL8Pr29kuiVOM
	6ErOCyZNQ0RPK5EpBPMvHQNZ+vg0REKyZZ57OxrxrvoEcId6T5q4wCsbc9Rze871N
X-Gm-Gg: AeBDietPtdLCJdbQKKT+xacQ9/gpLuiAWVg9Lq7PDMSxZEp9LYLDHlWT/jh2G2hATWO
	QheF1hpo8xs+AEFaM0laarpYGa6AGM6qMh+yaRhsYHzaJqZg9Ikn6sCWyhksSXafixXVfyyS+cY
	qZUKqhmRENfsqYU69cZMFONuDOwEoXpcY1OvAWlmkaLay4OY92cqpZ7IMiq8dKsLZ3qGnrKGmX3
	BioZdcBazwdeebDJjxAnkD/F947B7u2ev4791b1PCY/PvTfVAAqZurdsK1dWT5xgcXvHJPn6fU0
	qNQyoqO1EiJ0Cz5jWmOzCWws7ZLutZ4lC+VpsxndmMdqHlYXX4HDSICTZA6k02Z0gnUXIyRk+i5
	XuDDZ154vf8csR4IOXWnJhM6J8ApiEIrQssYs6mwbJn+sLkMGbzW+5cXFHM9afl4tuFK1wHD8uA
	UnaEhREacAp0emCfTCGrm3vg5vdhGwN3rxTzVNfY3CKiuR2Q==
X-Received: by 2002:ac8:7d11:0:b0:50f:b821:9c3f with SMTP id d75a77b69052e-50fb821a068mr95722471cf.60.1776871767582;
        Wed, 22 Apr 2026 08:29:27 -0700 (PDT)
X-Received: by 2002:ac8:7d11:0:b0:50f:b821:9c3f with SMTP id d75a77b69052e-50fb821a068mr95721771cf.60.1776871767000;
        Wed, 22 Apr 2026 08:29:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm4554946e87.30.2026.04.22.08.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:29:25 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:29:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, quic_chennak@quicinc.com,
        quic_bkumar@quicinc.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
Message-ID: <pbcoz4acox5ifkopf4k42jcu5cw4ppcvbizrpnpkkjbbyedwj6@vvk3af2xam5k>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
 <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
 <905374e9-1d90-4789-871f-f28e5d7ff8b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <905374e9-1d90-4789-871f-f28e5d7ff8b1@oss.qualcomm.com>
X-Proofpoint-GUID: 4iPu4lOi6LekfR4J-ZMek2c804lNQwHp
X-Proofpoint-ORIG-GUID: 4iPu4lOi6LekfR4J-ZMek2c804lNQwHp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1MCBTYWx0ZWRfX1NVcbiMSec79
 C6kywDi2/SklHDh9E8vVefyLTlsP1jsULK/yGhJwLcr+ERrlVv3jzPbyye2aaNNFQwLoIz1UBF0
 4y22E6HwvWltFtBHqZweeHWX4IhqfBVP6cPPTi4Vn7iGVKR10qGg5/QcWZjJcWg87tcyoCAEqTX
 peAo1jJV+R8ZJjWo3lW/9o00rQo9IN7NtvQ1TvijTyon5lLQ+JU7N93R7uNUkTUCqTqmr3vrPO2
 1zxr5eZQwacdWKihkVGn+rQkLJAqZ3RN8fXo3s5WwaIuDIfky4YS0z5lUFIZ08Dnzgz+5PYHttH
 9UufrBK/wLg609qKHBugCpDA8RavubCDT5qhF6nN2Tvr+Hoz7Cs6C5KkOUUH0CsKQqBSsg1DIGm
 CoZbAF2CxDbDyxvxixg2+m0CxVXwBp3JdXNRirPGsM3zWwMkPT71kEaptVino4JTBE1NuwK8ZQE
 Uban/nngvKOfou2b0mg==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e8e958 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Gv3PURsRAAAA:20
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=OuZLqq7tAAAA:8
 a=HyfyWxjmqhP_gXxERdkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220150

On Tue, Apr 21, 2026 at 01:59:23PM +0530, Ekansh Gupta wrote:
> On 17-04-2026 20:45, Ekansh Gupta wrote:
> > On 15-04-2026 15:22, Konrad Dybcio wrote:
> >> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> >>> Downstream [1] this region is marked as shared and reusable so
> >>> describe it that way.
> >>>
> >>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
> >>>
> >>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> >>> ---
> >>
> >> +Ekansh some insight, please?
> >>
> >> We're giving away that memory via qcom_scm_assign_mem() anyway
> >> and I would assume that making it not-"no-map" could introduce issues
> >> when the OS tries to access that region
> >>
> > With the current version and the upcoming planned enhancements, I don't
> > see any major benefits of making this as not-"no-map".
> > 
> > With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
> > entire memory-region to lpass VMIDs. and un-assign it only during
> > fastrpc_rpmsg_remove(). There have been implementation in downstream
> > where this memory is dumped in case of SSR or audio PDR using minidump,
> > so marking it `reusable` might make sense there, but that dump logic is
> > not added upstream.
> > 
> > Upon checking the DT, I see a bigger problem here, this memory-region
> > looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
> > Please correct me if I am wrong about this point.
> > 
> > [1]
> > https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/
> > [2]
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500
> Just had a new finding on this. There is one more reason why it is not
> added as no-map in downstream. This audio PD carve-out region is not
> defined for most of the platform's memory-map.
> 
> With a change to qcom_scm the memory during boot-up, issue was observed
> on RB3Gen2[1], where EFI firmware was loaded in the memory region which
> was causing boot-up issues.
> 
> So defining it as no-map might not be correct and it might need be
> changed for all DT files.

Just to point out. By removing the no-map you'd hide the issue instead
of solving it. The region would still be transferred to the ADSP (maybe
piece by piece), possibly causing crashed once bootloaders / EFI tries
to access those regions.

> 
> I don't have a history of why it was added as a "no-map" region on
> upstream but looks like same has been followed for almost all the
> platforms. This needs to be modified based on the memory-maps and the
> region needs to allocate memory in a dynamic manner.
> 
> [1] https://github.com/qualcomm-linux/kernel/pull/487
> 
> //Ekansh
> > 
> > //Ekansh
> >> Konrad
> >>
> >>
> >>>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> >>> index 4b47efdb57b2..13094b5e9339 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> >>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
> >>>  		};
> >>>  
> >>>  		adsp_mem: adsp-region@f6000000 {
> >>> +			compatible = "shared-dma-pool";
> >>>  			reg = <0x0 0xf6000000 0x0 0x800000>;
> >>> -			no-map;
> >>> +			reusable;
> >>>  		};
> >>>  
> >>>  		qseecom_mem: qseecom-region@f6800000 {
> >>>
> > 
> 

-- 
With best wishes
Dmitry
