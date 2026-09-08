Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBDF55C1D7
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873210; cv=none; b=hqLMIVnvCbHYFGjE7QUO3Q1qRkLuuk3W76kJt0BvG+OgK0B3yluzb5F2qgcV9od0YsMe6EViT0I+fu+9i7n+zUHoMLVe7j5gZuKkO9/I6ZFKmFwpAMycXkIp3W0KjcTwk9n9IKSPLuk7LAUpxlzTkPTpIhztMNPQUMhDGzgsmzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873210; c=relaxed/simple;
	bh=O4eWR/JZXniI+aAyv6RxYHMmagr/ohwcESr9x210uog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvxYfwG3XV5W7Uee2Dm8kckoaa8xXFapAaicn3Y0hiMhmXp8l9n4kKlczuEaJH2HSHQ6SyKu+bVAqBhpa71u6AqjcaRRzKWIbnFC3bNvUpIHyLQxsi4x5Vwc61U2CriRkqUIXrgN1jHU0bif2GpwIaUbMx1UnBVbBs55fBhbCr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmcVEQhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZzx0YyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmcVEQhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZzx0YyG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkepD3033380
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 13:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1ORZ0DU7gdTxBLmd5domb93b
	jts+JyOZJlFH7aI4M5g=; b=JmcVEQhTCjIF51uHnasykLN6uOSl5V4kIHwHvPk8
	FSWtLcx1Y2R59hxniQXE+Gq++vAZzZfvydE8P/acM9upqP+0TfmUZbnPJC7lJjs3
	sYhWCFTdsClNayrm52psoGOzwX6JPFK8b2X2PcO1QkbMua7gBOjaVp+LlQun1jye
	+lONabZHtQ0Up4oPDPXnV5LPrBy6bUd+ivO4kqIKQFGMw4HDWSlGjy2slHeqoYJq
	uB4Uef/cwxUR11gR+Jl4oNTocNoSOTNy9rvcFe+5JXxPfTOX22577neLOcpuOAm7
	Ag0vMZc/IfUdOyUJCqPB1MLYELFk65kqUZJHE91syuFiIA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjhkj0bs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 13:13:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso6533013a12.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788873198; x=1789477998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ORZ0DU7gdTxBLmd5domb93bjts+JyOZJlFH7aI4M5g=;
        b=CZzx0YyGMo3pfk3jLIHitkHT6R+HDaJvsosJ3RsHEH4Dfp4yy6IoPPhzRVoAgAia21
         2eB7DEcozR3mmrMMFVOyOmCsAclEiypEPVHQRoi13mZsPw/K49CuV5Wm0qD6i+G7Qhpz
         jQ1JtGcYEMcxjrIEyBZu+SWl7wlSrmE4Pr6RNSmNujgPCBftnCtSxm9XPkkmJhTmDwyL
         rJizJuWreHNfWiK5Hl8vawQZTsNW62O1M4ysWkmyS/yeULlKiUtFFaSqX9XuvCLXA/Yd
         K1K5TMudRDzsP6rjUT7vPX8Ku/ElAMzs08gzibUkjALnkhT5h5LjdJOsoptE7e/V/4sY
         WDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873198; x=1789477998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ORZ0DU7gdTxBLmd5domb93bjts+JyOZJlFH7aI4M5g=;
        b=KnRLZQLXTPTkKzIeq3jmbQ4Y9fHHt1++hdasuLF/BROlT1nYyPcFGCJwllpuctdJr3
         G1CUTDpJ+WhHdW6REdyD/Ti2q7lEuExoYhjYQxpFB89FnIgK2gw2OeyzR8UNXTwT3Oim
         92BgA28DTpmQitBrWNwI5as0zEo0hj8816P/A2rwi7+azas3+6rxFlhjsiGQi/+qese4
         LBWo/ZOlr0N3YUwv4M8kvlvWE6vsmXBd88qKMX6u3EhrUt1ubuDNladkxgykXXp8c9n2
         1rB7TNbRhKMVYB1sNzYJ3a6wp1FW7i53QDTTZZUIWq12c9Seh0fylV50Txf/rNZ7adml
         FPlg==
X-Forwarded-Encrypted: i=1; AKwUvBy8f7ETA1gsUxsg15AItS3Burpc1XUakFvjt4jCTYadFbe3m8OXWEP78tH2wINRQF2PtCSuaiiRdcU6@vger.kernel.org
X-Gm-Message-State: AFuF++mWOG5JsHBF+Q9ckAe89Ssz0IAX6f+/1QiusXzspyrClWJSopX0
	o7+/CZpRKWQYT7yL4yoR9xAg0KagbAOOddeu/rS12oB/httyX5X7LjaXmQyrTPwR5tEr7ErwM5M
	JoohxjSRPKhVilBudAZLh75fGNEpzW1fEuBMP/sxUMKfhr663qq28OxKx7mK3PXUf
X-Gm-Gg: AYBFou3EQK13X31cFt08R6MqpMaO0Kcb0mVudr9S5wCtHWhGcnnHhkTZF2DE0/xW5j+
	KQgF0/zSE/m0q/aZbcZUZA/KnuV6yO9i3JFq3UefWX7OU+T5X170Ch5f2UWqRZr+1yOW8ZHklfP
	zIIlYr85qHRhIsFpWKzNVGvxKchYD2XP13kHPNwmaJTZBea9n3GL9ZbA0f1VK/ed87dMcdb65Ml
	q+Ohk13o24ZAp3/M/v9VOw5r/GeLcTgIuRqV3WmaZmP1MwfgGHsMFb/7ejlAkAVRFf0Bvc0fa2U
	3EZMO+IgzIrYSuzmCEs2zSxkvMJxOmozkTQvEErwRqYvS8e9Y46pf+v2Yi1GfWkz4eI0PdB0waP
	ej4ngoOeS5MH8I5AfGVdl8RoJ67qhvA==
X-Received: by 2002:a05:6a21:3117:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3da39d147b5mr45941814637.9.1788873198121;
        Tue, 08 Sep 2026 06:13:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:3117:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3da39d147b5mr45941710637.9.1788873197460;
        Tue, 08 Sep 2026 06:13:17 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm36266788eec.19.2026.09.08.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:13:16 -0700 (PDT)
Date: Tue, 8 Sep 2026 18:43:09 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, broonie@kernel.org,
        robh@kernel.org
Cc: Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org,
        monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <3pybhkqdvve2ct6burnhav3utis6nljz7ncheqcrs7v55ullz4@nek57empeoca>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
 <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MSBTYWx0ZWRfXyMz1rOlm4rLz
 4Aqp6IHCO9bLRolkq7Hee3HpnSv+DcTHH2kUGxyAEJhMM+vw1dfbMu2lUZtW5hlWJP+a2kaAYPj
 Bt89TijmGbUL4Itcn90ztnYWGhVcKZg=
X-Proofpoint-GUID: SE68hZwxjkxj4_U5i_6Hf5YKHM80DqZE
X-Authority-Analysis: v=2.4 cv=VYjH+lp9 c=1 sm=1 tr=0 ts=6aa009ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=bvrmFQN2d7YouEhKHLAA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: SE68hZwxjkxj4_U5i_6Hf5YKHM80DqZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MSBTYWx0ZWRfX8raxR+yXrN4Y
 wzTk9jhlGXi8GpG4PI0D3zkmh1Xkioyw1t3PVeEdYjWCd1P4s0KMLWDtkkzKz6WDiDM+fvELOce
 v8f2hju55jip55uSfrabchazAnagnusrQC+v8z1c8EPmgEBN0IT0mwtvBD/8YSekd1OdjdpiXA4
 8aDtbi2+tPxuFIl+y6LVv4NIB4hbQOSa+53N6516gtAtayfLkSNIsgu435rblE0XcaL9KRkkfKt
 SooT1TeoB337esDF68zAr0hdyBtCsIdUOkXHia6N9Y5fQiKjABv6af7CY1MTn3nuMI1nUJVldcE
 y5T5yj1D0rfbiVB/mg0RVgUiM2EMWF52zd9oQobya0S5gjT3OdIXKS1h4ULeP1ZIQohu7652GgJ
 EO2ZHdHIWd5c/Z94YQqJuDkzPb97eL4IHPi4Tajv5WHi5BMoEMvL6WfefBE7zOx4vgSHCRprXNd
 q/mrVhiNkmsWQV8qaFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080141

On Mon, Jun 29, 2026 at 02:13:00PM +0200, Konrad Dybcio wrote:
> On 6/25/26 12:16 AM, Kamal Wadhwa wrote:
> > On Tue, Jun 16, 2026 at 01:48:50PM +0200, Konrad Dybcio wrote:
> >> On 5/15/26 1:16 PM, Kamal Wadhwa wrote:
> >>> On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
> >>>> This series adds support for the standard `regulator-off-on-delay-us`
> >>>> property to the Qualcomm RPMh regulator driver and updates the
> >>>> corresponding Device Tree bindings.
> >>>>
> >>>> Motivation:
> >>>> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
> >>>> (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
> >>>> When these regulators are disabled, the voltage decays very slowly. If
> >>>> re-enabled too quickly, the sensor experiences a brownout and fails to
> >>>> initialize.
> >>>>
> >>>> Verification:
> >>>> I verified that the core `drivers/regulator/of_regulator.c` does not
> >>>> currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
> >>>> Therefore, the driver must parse this property explicitly and populate
> >>>> `rdesc->off_on_delay` so the regulator core can enforce the constraint.
> >>>>
> >>>> Changes in v3:
> >>>> - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
> >>>>   for `qcom,rpmh-regulator` (Requested by Mark Brown).
> >>>> - Updated Patch 2/2: Refined commit message to explicitly mention the
> >>>>   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
> >>>>   (Requested by Mark Brown).
> >>>>
> >>>> Changes in v2:
> >>>> - Moved the motivation/context from the cover letter into the commit
> >>>>   message of the driver patch.
> >>>>
> >>>> Saikiran (2):
> >>>>   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
> >>>>   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
> >>>
> >>> Hi Mark, Bjorn, Konrad and all,
> >>>
> >>> We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
> >>> helping.
> >>>
> >>> Issue is seen 2/10 reboots and it happens in the UFS probe defer path:
> >>>
> >>> 1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
> >>> 2. UFS probe enables the regulator
> >>> 3. UFS probe defers (due to some other dependency un-related to regulator)
> >>> 4. UFS regulator disabled on probe exit
> >>> 5. UFS re-attempts probe and re-enables the regulator
> >>> 6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 
> >>>
> >>> Issue Log:
> >>>
> >>> [    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
> >>> [    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11
> >>>
> >>> NOTE
> >>> - Issue is not seen in first probe attempt, because UFS regulators are left ON
> >>>   from bootloader, which gives enough time between rail turn ON and UFS init
> >>>   sequence start.  However in issue case, it seems re-probe is happening too
> >>>   fast, which causes init sequence to fail and UFS brownouts (similar to camera
> >>>   sensor case)
> >>>
> >>> - Also, we compared this board with other RBxx EVK boards for UFS rail, it
> >>>   seems that this board has more caps on the VCC regulator, as the board is
> >>>   designed to have both EMMC and UFS, and we have DT option to pick one of them.
> >>>
> >>>   So for EMMC those extra caps were added and they are impacting rampup on VCC.
> >>>
> >>> Since this is not entirely a UFS part issue, but a board design constraint, it
> >>> seems better if we handle this in the regulator side itself, as adding it in the
> >>> UFS driver may not be acceptable from UFS reviewers.
> >>>
> >>> Please share your opinion, if this seems to be good reason to accept this patch?
> >>
> >> Is that board in production already, or is that something that can be fixed?
> > 
> > yes, it cannot be fixed in HW, as the board is already in production.
> 
> Re-reading this thread, RobH's worry here:
> 
> https://lore.kernel.org/all/20260129174829.GA1324020-robh@kernel.org/
> 
> seems to be misguided - AFAICU this property would be set on each
> regulator separately, not globally for all regulators under a given
> PMIC - is that right?

Yes, this is per-regulator and not globally applied.

> 
> In that case, I see no real downside in allowing that, especially given
> it would/should be used sparingly and only in cases like you mentioned
> where the board has some quirks

yes. we can use this sparingly for such board issues.

@Mark, @Rob - can you please comment if you think this is acceptable?

> 
> Konrad
