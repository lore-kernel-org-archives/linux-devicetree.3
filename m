Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D473AE195
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238908; cv=none; b=cEvg9lVzAYm/N46bHaRvBjqDxORYLdGzF1OQiv06VG/SXEcn+wYs3ChrlSRP1cGK9KFubaBJPrbWVS0XbFDybw7otU9ZLcFcqDhfukfav4oA5EVvCWSbdtk8/zmio6TdqoHYiaPVRJ5cPR/7CDT91GHg/M4sBpmtSa3qec3zaYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238908; c=relaxed/simple;
	bh=VCea4C6LXiOaZFCLAYLlRoTq4wvPccpuGXBEWLukmbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDhIjxqGs9VWhEe12U87O3LHBgWg98o9sPQZ8Ij5X32jZ65F5LNHAeXV6w1eQ2X8lFFyTgnaQbLNmZpyCYMvorjCx0M5PYDrWOsLS6mlxeCORDPJKJHxRMMme7nijB/f8LErVmRvg6BG0hR2H04hHmzAa2M9606K7fcDEI73tN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1TR9Yqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ki6vNr2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1TR9Yqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ki6vNr2G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eNSl582521
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fiusfjr3UFxgxhx4glhL1gbP
	6UTag67/VUw+fyZmqmY=; b=L1TR9YqkktSYGkF8AQGCFauiFuQr9PIF+59y1pND
	QQIOakQToFGK4orxDX8B+TtYZBCVP3tHMuS4bnyS2hRXEwDOHKDhKqdQ0GSM98bc
	78BIKq8DsoTX/3qMhq0MjQenWALBsn0CDexQ3Fe3dZ9zKK7aDlMhWtHasiM8RvoW
	A17aOSoLq7mRiD/Kko29v13r0u+HghObOGUrKcSz/nm8bYyMJnqwq7Sd5zP/j55A
	IpoSatvHV1Cb56xURILgBZlUrJ/xmQwXeuUwkqqp5h51WseHL2/zzx7j6xgMiE+P
	NnHnPzVj29KFk+wXtUpX8QsRvvgAA9mt7MfogtaINeUtiA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwm4cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:35:02 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438492fb40so2853666c88.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790238902; x=1790843702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiusfjr3UFxgxhx4glhL1gbP6UTag67/VUw+fyZmqmY=;
        b=ki6vNr2Goed2VrJ6+XWR9jcPIepKn8Hkf3P1t8v7EJqUVMxsBMmwIbk8qwf1rc0v+O
         YAhK7zwXz/r54hznnDRBgDz9hZaj2aEydp4hHXPbbO3FMNSFHNOAG8W8lT4uQFpBuc3w
         fY1RklcfAA/BWXDQFJoyRJoltvEFVHAPbSSVQgbe97+N0jxOrf7pPLB4sMOCbgsBvG28
         ekTtzW9LqKf/ajAcPBcprwP/KDEn0LORxc7SLrxs4oeUQwpiwDUKJClvzbxQAJwpcZ+i
         9b/cTY+XTlIMVAg56JJ0j2gFOf3I4GUGx2nvB9SlUa8+HrDA3XwTGD5JkeG9bRlCsb6b
         RhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238902; x=1790843702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiusfjr3UFxgxhx4glhL1gbP6UTag67/VUw+fyZmqmY=;
        b=GDWk419/KJ5F9Bx8jRTI2Vcr/IzCxFk0jTIbSEU03tqkmHZ866n8dfX/PNVWbMi/ql
         Zhm9FTo2rFJbRPrGyiMlANWPO8WN606AWHBgKLvAlVWXdIXjPhJT8tf85YOEflADQrtv
         ovWJ3NIhreS12+lyZ53UMIezCI1raQNZqLVR522MUlMOkbBzbx+ELN8+6bpx3IP4fx7z
         ztXGTc2bPsMb+09a9uQmWH3ax4q5VXJjINMZLjTZfArSrN3IrvF1ktVssDypuVEGooXy
         aAX0aGeW2b5J8sJfWQRFqnqyoVBXZjATyCw59nL9txoO8BtglEnIGfXrOQSef+8PuGc2
         F/MA==
X-Forwarded-Encrypted: i=1; AKwUvBysjCVRLmcjVfnI6e3JEr6WzyyO5zqc+GQzhOEoavqlzdryJoGMKwPLINOCnv1vXO7UA3xcxrUxeLtm@vger.kernel.org
X-Gm-Message-State: AFuF++kOklLRho3vyFH0U++p6qmUulq6Z0gkmh/RnKK8V8xHfw+m97Xl
	6eqia+dswYUV4FJFee1vEaKqOArCF/s1aqmEMlkLdk2g27pJeinYucS7N3IQJrpC4GlCMGGxn31
	lGKv32kEt+1amXRlHLA2uAecEI8/zHqj8GrdeWgpAvRccUop32CcjUNPbzjFZZQQU
X-Gm-Gg: AYBFou29ljm+XgkZImLu8VaZDMBxGjo3H+QdOLDJ7AtFPzIC+se8RUjdXlH7pzuCnRe
	fxf0IyT3pdsVLAvpQME2G2WH7MO+deOL+EMFFk3OOt6Gdy4Yc5FMiJGbz2tTQlvkJ/GC0+MPJO+
	pGWGv/Vl3ST2/PD83s2lUwVlYjM8V3llr6iA7nspjJL6P6eIoOMThp5IiAGCZyfdMD7fxeldIE9
	Hr7cT2T3TZjJl4C43D3ue50mPyFy7vCGq0SRn2o0XtezSsprhk6uu1EDWmGL1vucQ6Enmu4lMvr
	KrqSHehJh0j8V1HBKWTNuCvkn20nAgKKi+sRr3iCskL80RsmAtR6Qg8HT+32OJ/zYKUZzc/MCG+
	lFg9/g5jCWdStjjhwmmGT1T4+2Syke8L8Punj52zynw==
X-Received: by 2002:a05:701b:205b:20b0:143:34d4:c3e0 with SMTP id a92af1059eb24-145040388cemr1139189c88.7.1790238901527;
        Thu, 24 Sep 2026 01:35:01 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:20b0:143:34d4:c3e0 with SMTP id a92af1059eb24-145040388cemr1139175c88.7.1790238900948;
        Thu, 24 Sep 2026 01:35:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e60dsm10612441c88.2.2026.09.24.01.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:35:00 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:34:54 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add adreno SMMU nodes
Message-ID: <arTgrn0qyd1oay_A@QCOM-aGQu4IUr3Y>
References: <20260922111354.533902-1-shengchao.guo@oss.qualcomm.com>
 <7a3d3902-c557-4058-b806-d24b3888ffa6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a3d3902-c557-4058-b806-d24b3888ffa6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX+EhvKT6Lf4Zx
 Fvi5/+dpEH1hdXEqb+h7yC9STOQlqjBPUGjQxnazBhu47735dyri2IQtERLilzP7nyODPGk1Qw5
 p2cey+bnGgd/eZDgrhMlmuhCpiyGTVP9kTgz4fbu/f5kqdxQA/tS14tdeovvVVQ4a0Jhbf4QnBS
 XIs2rgtUmDNAD9+tQ9RLzwL/Ln7+xs6q85o9ZfugYFTQtqA7TYHcUqW0LuTvabjI5kriKeLZuD8
 hDf4Amu+jc4QQFWR7CF7hNN+xaE8ETwvnI/wVkO4zUuw5+mRgwVnP5XwpnHmcVlEIluwtKOB8jB
 NSeniEOm7eLLTk8ZMfpGNHdFOC2awlJxFF7/VGL5eCw+z+tCsFYX3ZnMy7A7hpmZg9LdHY/vOpK
 7i5PsKhlQhmgkUvpi5qQHnWeCs/dXeHCzY5QQaJLa+y8qxV+Vn4vtjiWttg/pbQDl3OMImLtDvW
 x38kDISH+N3RpW/++GQ==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4e0b6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EtGqZHvEnjToqAua8RgA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX4DwWf6TKhJQn
 mZLIGXse20lhUBEPcMItSUnqHgUSm9v72xRV4JQMAAR7Ybj+to/rH/ZGDEB+YM30u2S/QmJre3Z
 RNbQMY4COvvuWSFBnERdF+qa8p1AAFM=
X-Proofpoint-ORIG-GUID: ZTxY1p0XmsE3mJ2rsOPC58cjJn92d8ZG
X-Proofpoint-GUID: ZTxY1p0XmsE3mJ2rsOPC58cjJn92d8ZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240036

On Wed, Sep 23, 2026 at 02:37:18PM +0200, Konrad Dybcio wrote:
> On 9/22/26 1:13 PM, Shawn Guo wrote:
> > From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > 
> > Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.
> > 
> > Wire up the gpucc clock and power domain on both adreno SMMU nodes in
> > nord-embedded.dtsi for embedded Nord variants where gpucc is available.
> > 
> > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Dependencies:
> > - SMMU binding: https://lore.kernel.org/all/20260902013858.130887-1-shengchao.guo@oss.qualcomm.com/
> > 
> >  arch/arm64/boot/dts/qcom/nord.dtsi | 74 ++++++++++++++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> > index e0496fd40c30..6c53246d5ad0 100644
> > --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> > @@ -1518,6 +1518,80 @@ tcsr: syscon@1f60000 {
> >  			reg = <0x0 0x01f60000 0x0 0xa0000>;
> >  		};
> >  
> > +		adreno_smmu_0: iommu@3da0000 {
> > +			compatible = "qcom,nord-smmu-500",
> > +				     "qcom,adreno-smmu",
> > +				     "qcom,smmu-500",
> > +				     "arm,mmu-500";
> > +			reg = <0x0 0x03da0000 0x0 0x40000>;
> > +			#iommu-cells = <2>;
> > +			#global-interrupts = <1>;
> > +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> 
> 674

I wonder why you are always able to spot such errors. Thank you, Konrad!

Shawn
