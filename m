Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80977442FD1
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959821; cv=none; b=WLf6pqA2zsx/uIPqTvxj2Ho9j9lv05NvZs7PyQ7JzcXaaxB7Rbsyg7N2Eno1XpGMzttPPTfHeCObxnVy9RH6OhCSfcZ2BxIoqPsL+wVdag2bHq1WBR0WVuM7IEcmSgehsyia6Pome+NJe8LrBMnP18KEu4G/7fb8XGGxzPka2+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959821; c=relaxed/simple;
	bh=z42X+DIeWPFD5iqPawWs+CCgDOHjrErcNhPQWVQSh9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSAj1BTfL7SQcORQ6IFLUTRk3rap3cXQhXWr+zIqvRLzKAhiZBzxmyOYiQdqT93k8ruSzzi6P4iFvFfJUhJm0mOXyQ/xrmuuFFaaOLkjFpiVfl66CYAhAqYzK6sTwbIpoN1RVDUXN2tGnzL1EeqfohyMEddDJuCgE/wkgjF8cuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVxRghFP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWmK00ES; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVxRghFP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWmK00ES"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCjFH1400923
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 13:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X3YW3TLe4NcEgON6AYpHQ6p+
	Y8CG2QyzanrzyTddpsU=; b=eVxRghFP9+PneXsz2AktF1vwRi9Wjmh092xy7Zb1
	F3Hl6FdKv1EebNsXCianRC0z8XVS0xOom9v22gL4RSzdQq2f8mXxGk5HNYVwBG5L
	TLAhOlSQAaNeE23nxTYOZbDRhjPSOeiSrFOXWI8XOqPcARGxAmqcqMf7pvL/nGsO
	i+y+pvSlO1AbYctR3dzOultQUBGNTWHQCTFL5LQHun5EdgWAx4ieNX3FOl0YPNnX
	qbEEz9tW9UmVNVhQGzv31IcI2HJp6G+jo4CL1jWr16DT1yKglDUEOIk5ZgArwGiF
	hnQh5KIDAN+nCFsHk3KLlTJkM7Gs7vVojKEnOEAgQ3nCKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x07s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:16:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so7846475a91.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959818; x=1789564618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X3YW3TLe4NcEgON6AYpHQ6p+Y8CG2QyzanrzyTddpsU=;
        b=YWmK00ESvuCt5JtKboYSn1RrLcRZEo1JDCG5Nv45z1wnM0pwwAD3lv5iLsd5lhnT7T
         Qrp/Btce3f4ygcYedq6ExUO3BcPXmT9ni6psD/wNoHI9rVN5o52PzeuGezTR6CDq7vjQ
         7kkpZzABq5koEmz4KLNscaHzUl3+bqxwtItQV3abdSHGK/zPPw1WNUG8YkWVitzCb/CU
         BpEQeukHr0z86nmPRbttfImXPanz2QHz6ObscU7pfd3EGb2yPEtmKYCnLQG8+hy0DqKI
         NPuK9nKVnTq0Ky9XMUH+DPwNAgq2QGUS8b6GRdbN7L7CB65LJ8H6KejfOClTEWu5vqpJ
         1VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959818; x=1789564618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3YW3TLe4NcEgON6AYpHQ6p+Y8CG2QyzanrzyTddpsU=;
        b=HFRVpv2l5ujQGz2AF8VT+wN8Garj8si7QmjjH0KHrSQPmQ6T6/o8DXC7RO9UzpJScT
         x2w8jsmvm725YVy3zXI7YGE4buOc6JPFnWYK2ttILi2m99jJwbWNrx9Oj4wi63QkyRU0
         iBnsNyGOFIzy21y2i43s0p0bqGmwLCLsW0jYPSBjxhbr/CokZoU0ctuEQvyJcEpjmrAq
         FSo8RjgrfazmcAOy+6GfnNhY0dJU7lvHTtJ02/0mY8W81Sw0KAPm8X2E7rpatpruPIX4
         PbKUWbg/EGtwP6wfvePTyf+3dwh9tIxd6qUqISHte0y0XzGDHoM6k46pw+/Elq8t4gFo
         FtPg==
X-Forwarded-Encrypted: i=1; AKwUvByRJ+b6OfVns8wPiSQO407ZHCIrEiP43WHchnbV1ASGYR2aAG0xoG67045X0Kkif8y05RApbOkq7Z6M@vger.kernel.org
X-Gm-Message-State: AFuF++kWF/ZgmWTnbw6b20s7LtOgF+vqvjbPvS0Ykm2pJMcpofHKMWMY
	4lFIgUmgS1C/Il995sXbgcu5HI8OUE2VMoW7DqQ3RuXuKqQAbufCVrgLLvXJtd7SAgzn7F3VEkK
	A+cE6lr0x/iJJ1/y8QLI016bAtll2uK//yn0oXtS3wuaZoNe+ksRSzwQWto6aily2
X-Gm-Gg: AYBFou2GXLA9UdbnHDDvgXjt3eLPU8oitbOnKjeD2Os0u37NdOXm2gN43SqQVmB91+N
	oJ990SGZzhAKOPFPtlgmPidliGPe1q0SBey0GUf37YyvX3JcOWY9QD71UUxje+ObzZwVJne//y1
	KwqrLrkFDzB5+cTrGFYy89NIcU8xXguh3WQfOp+XSDjPhOk2O7M7DjYgDxE1fJNLm7ZsogUfTQ0
	46tuMIWTx37vjazlgIp75kiEzQKplIcRWj8QOB1+Wc8aPgrPdMGYGf7ys0lCn22Tgocy9WBgq+B
	ytZdUmzLNT3wdkTZojOwZKzRHWx516qbt0IWdnmLO4pLMdvGRSmTb3AjmuN230wz2vvrWIJYL45
	f9UwTAHFbjb0U4TNnh4EV5lSeqcAtPu7Qj3Q0bnONJCs=
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr53507890a91.7.1788959817728;
        Wed, 09 Sep 2026 06:16:57 -0700 (PDT)
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr53507818a91.7.1788959817093;
        Wed, 09 Sep 2026 06:16:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm38236827eec.4.2026.09.09.06.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:16:56 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:16:38 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
Message-ID: <aqFcNhB9ZeQlkOFh@QCOM-aGQu4IUr3Y>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
 <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
 <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Z_p1Gl7XcRSXLgBYjJJhp9iPkujhCZwI
X-Proofpoint-GUID: Z_p1Gl7XcRSXLgBYjJJhp9iPkujhCZwI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX84hHasVB+VKi
 yhNlWuS0rRaqZq2PYzfMPUqBdR4yAS+FCNND2RDTEj9sZon76+KsAJBeIFRB/Z0I3hCsjYSrnS6
 auN61+fsCppaSxc0/pE+aV78uaHABzw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX1Rp2psz3E0EU
 KhMxgHnhV08dXP9pnjUP+mz/nePX8q0+Dv+DBT0of9a9L7Etxij9rF8QTooeep83X8kVqJWVEL5
 je8GUZY7nsaHWbGhAhrOoIUFk3TQmejI4QQ4ea5+MOpCUHqYPw7XVUBt8fa0TC8oBg4UOWraWdf
 DaA+8yBzmZLcbBxCIZaaDoIRtXqDu1ozY2OpOuXymEo09YzWpi1e1kaAVaAhTgXhDJ+aN8YruAf
 o/yqIr8P1B2/6Pa4RWv/e5TBL0NqPEDnyabi2y5sWal+Y678GthXYowrXW0Z8ag7QIOXrFPSLnr
 6mMVxWR4cXHWl8XG7+NFVR644L+lZdJ99eMK3l2eyCn1rvPU3632lp35+NbyCkX9qu1xg6RzXiD
 XW7PhBQe4ks1LppUVF90qqgpacPkBOpgViZj7rGkgeqtbaSF4t+05KdNFlBZilpBj/D7MAacmeE
 D8TCQzGaPLHOdzG/pdg==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa15c4a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B_aPWRgbl8lC6mU0Q60A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090149

On Wed, Sep 09, 2026 at 02:13:35PM +0200, Konrad Dybcio wrote:
> On 9/7/26 2:06 PM, Shawn Guo wrote:
> > On Fri, Sep 04, 2026 at 12:00:40PM +0200, Konrad Dybcio wrote:
> >> On 9/4/26 10:16 AM, Shawn Guo wrote:
> >>> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> >>> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> >>> initial device tree for the Nord Ride Embedded board.
> >>>
> >>> Tested on next-20260903
> >>>
> >>> Dependencies:
> >>> - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
> >>>   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> >>> - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> >>> - PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
> >>> - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> >>> - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> >>>
> >>> Changes for v2:
> >>> - Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
> >>> - Drop unneeded regulator-always-on and regulator-boot-on from RPMh
> >>>   regulators
> >>
> >> It still remains on something like 40% of the defined regulators
> >> without any nearby comment justifying that - are all of these
> >> intentional and necessary?
> > 
> > Yes, all of those are intentional.
> > 
> > - Supplies of LPDDR5
> > 
> >   vreg_s1a_vdd2h_l  -->  VDD2H_LPDDR5_01
> >   vreg_s5g_vdd2h_h  -->  VDD2H_LPDDR5_23
> >   vreg_l1k_vdd2l    -->  VDD2L_LPDDR5_01
> >   vreg_l1f_vdd2l    -->  VDD2L_LPDDR5_23
> >   vreg_l3k_vdd1     -->  VDD1_LPDDR5_01
> >   vreg_l3f_vdd1     -->  VDD1_LPDDR5_23
> > 
> > - Supplies of PMICs
> > 
> >   vreg_l8a_1p8     -->  VDD_LDO_XO
> >   vreg_s3a_1p8     -->  VDD_PX3 
> >   vreg_s5a_mv      -->  VREG_LDO_MV
> >   vreg_s7f_lv_sub  -->  VREG_LDO_LV
> > 
> > - Supplies of Nord SoC
> > 
> >   vreg_l7a_1p2     -->  VDD_PX14
> 
> Does RPMH require HLOS to cast these votes? Generally such supplies
> should be taken care of in the fw

Good point! I just did a couple of tests by:

- dropping regulator-always-on/regulator-boot-on from these regulators
- dropping these regulators completely from DTS

Both booted fine (the nhlos software for Nord Embedded variant are still
under heavy development though).

So what do you prefer, dropping always-on/boot-on property or
the regulators completely?

Shawn
