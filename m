Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F691EB5C2
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569170; cv=none; b=DOOyO/H/wCFhOp8rv1PN4bbfzMi1nC1IZPp0jOPM4lLPmqeP2M3LdMf3/psuK2NbyUNe9dx3VXJZHpzc8dAcFns9IwUQZlh6AeP6LdXH2zRZ4QX5qkErlKpmG6gjUAr7uVTAT7CSbcniUPjtK7zeHRJjW0OyaX64OmZ7VkslkoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569170; c=relaxed/simple;
	bh=peBnrIwG8su5Bxb1yQHNnKYZ4q1gc/Q73SMJ4UjY6gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN58BY2ahGX6TE8VVQ9cbbpygpyaU6iqYxTlRjH9e8LTUQmWzWPbbaia1jfdWXlcnYybtsgz+txeHAdB49SksJgWKXDALDyCZDIpszUc69r5s7jJB5rT+KpU6X5wPJiahF4Z3KPhTgko1/fQV+LhqOxBdmlukBhyKQlcI3MifAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jx1rszsO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBcNTI0Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jx1rszsO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBcNTI0Y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ1LlA1433246
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KorrUBh94Ss7D1+qQOdc29iD
	hATuENeNSAm/3rBOeq8=; b=Jx1rszsO5ny/jhVDUL2G+0JMtZimuv//fL1a16P5
	NMo8DG5M46RUtxvGs5tsjIQ5IMfOIlyLPuK9elyHvX3Tn9WNQRWxOSuJSFj5ptnc
	Oc9IBaxYqt+KL3PN40dok+x7ja8tuSMerz0U2sUMHmLx8Re2oB9hYzNO/8epGdF1
	WSO3IbThNLClG7ggxmwQvjtcaQEUSLpNtuddg0OSOjFam8gyCqfC7+2gjv/zxdPW
	vzJ/d6Nmp1S5rdHOly7BWGVylQ9IxL90Yvo8hgdKWUcrQucWpufnlpbk7Cavn4Nd
	mP8HuetMKTzvLygy47Im/2copivxy2j/Clk4fVF1j5cruQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhk97k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:19:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91574ad6871so603107385a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569168; x=1782173968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KorrUBh94Ss7D1+qQOdc29iDhATuENeNSAm/3rBOeq8=;
        b=JBcNTI0YzS5FpK3CZgSntARiGI3OcjGyWJxB7oEi1uwHg/NomCUEaMOcFuUaAaPrN5
         Moz8z+EYt0CYcsF/+ffd9Lj/GOuPQvyV+x1tgBZ5y4ov0L/ZKQ+fYd5GEnQE2CZpVtK/
         mNm4iD6KTqJkP0CTKwyUjpocMnGCML78mZiBirGPPzbnHCtGYXLzbyUYXOPAI1PRN44q
         X503JIDXVodc51dEv8azKITOngcbuQ4CRRBA1gpnJg85HApbl52RVEBUbWNSegt6fhy1
         RyEikPWdCfKWi4caq/LDQOlC96cEAXTyLnaCGhJeDcFaQ5q2BxEwEbpoXPEg6UFP8hPj
         p40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569168; x=1782173968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KorrUBh94Ss7D1+qQOdc29iDhATuENeNSAm/3rBOeq8=;
        b=C3RQvLCmk21D430s0IDaMJZLyhYoBkx06AbUD/KZ4mQoO8ITuBE8DmJqwKBou2LHl8
         oJqBswMZQGub0UvMBDzDJGyw7GydpnQMM7Kb6RZdJIetUMg/rcqrZ03683d3HDzcIE6T
         7jCnC+bHzocw+nUQ/xcXijPjLkD1ChZxhtajdV0Wmp+FAx0ovJoUZ1Th0hK4+H1LBpD2
         40mguc7nfDQNAyMTQYngihfiVn85e/pm3O21tC6Qyr9JEgimTkM71Aq0ip38czcs+ROh
         tkc+WOauNzWv/MtMcYXNkPfCnsxewP9j5uu1PqhpjUwY5PnAj1k2nrbDnr8E5IdWloUU
         Fmdg==
X-Forwarded-Encrypted: i=1; AFNElJ+6BL0FCnM84gjxHq0m9agjqMz1CTR1x8P0RUC/gwSd+SdhafutsFf/vEi2U63MvfH1eGltiY4WkB5v@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr0kPpz9D2VcOOlI2yNew4x3PnaaDymkZgKmblleYQCMQBynxw
	yi9/HMlEjHiqoKZM61yUnOqJQY7k1ms7fgkPiNlcUjv/owwKsrKoLT6ZGEfh9bXfejWT294w28w
	83Ou405/AjjtMVT30OGDJd6H/LbCdU1QogGwCSLFUY9RdGeu0yeM9gdWhcmhRi9hm
X-Gm-Gg: Acq92OG1okoM2WwGd4tqPbA+keW/xf3SDlryGUo+q0BobiOa8Uamvtlro2NY42SS+Aq
	JbMgrlkPj0vAkUvjS4lT0CySTmb6l6G50GNJDzVFfLKA37J8BxoUFGogI7fGmZQVY22tfwUqeAm
	qMBAdIcEjfugBYHROBhnyCYexmwNBKFOPKxSW6rQW77k7F58bZEnVrHbL7MiQdr+r43XXUy+XYb
	7YQWkXDQ/wyFBL+P1MshczoOS9u6V2N2pHtZxPqE7ZA9L27jy7asRKZVi4wEhCP0subWMc6rrHy
	gdPObWXFDd3IRiEXfpl760ZwaWNDDbrmbg7WePFHNbMnh/dezj/tmB7BJCfDU6XFm/lnD6E2bUX
	0XumcI011q8DxqLL3WoSgzWadV5VROnnb7hTZgbAyxo1oEYXDYzSO+sfcwxSLiwQI2e1JZowVzK
	vd6d2xf4oVtIbPiHzxSzlLwTBOZ0Y0k2MYI24=
X-Received: by 2002:a05:620a:19a1:b0:915:7f9e:a407 with SMTP id af79cd13be357-91c42cc5889mr232610385a.0.1781569167571;
        Mon, 15 Jun 2026 17:19:27 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:915:7f9e:a407 with SMTP id af79cd13be357-91c42cc5889mr232606585a.0.1781569167101;
        Mon, 15 Jun 2026 17:19:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c05abe3sm2595591fa.15.2026.06.15.17.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:19:24 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:19:22 +0300
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
Message-ID: <zhdacu4upv5kyvyqx5hcm6im4p7r3z5bsnup7hqu2okxyxmeib@snpseurpvhtc>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
 <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfXyBuj+OxB36ar
 TV/Yzyw6UqU87uAH1nE8IkCf9b6KHAep/eOOKTpxR/JbrjBkcmflHiDLJPjUhpKU5urioO4wzOx
 oGjPxjit8qWeVo0X0QLn1zVVU1RsdwA=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a309690 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zWXYthO56evGz8b0qtEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TaYpeizMg4V7Q8J2ZwxFBUl8UNzv2Siv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfXzPVtWoaAIfqq
 hTJgdCFNtCB2Xzzn6vir5J6IRIm1BDeikQolrcRhpzBMcj/wXEeZXJ3INfs9gf5wiqDO/s0GHRW
 idZy66Tygh9GHwF4ZzIf48M/xGgpTzhwzwItu/oRAgp4n/XJgAqJTwrhSm2hAzqF+io/nM5aK9Z
 iZFe3P7o/q7Momu8I3FEVqUaxd452qwivTZN2DjX/7wJXsod43m54K+wemhVlYAqhb3Mir5rHzV
 KDvfhje8I4xLk1bFZwl5i3LpexSE3XrBKy1WrAEFWVv5meNiTtqiT5LrbY0IfAZ8Hq6Sj0xTEdf
 VwIILo8C90fzAzOLQTCyNGQDkq/D6R9nYxWFUwKu8LRxkTWoQGZhNvYVc4w6pvKjNr7UVbcGerr
 Abqbr7ey2u/PU1exBTcQ7ExHf8K7UER2bx0voKz2JtlpfA3X7urL5erqqZRiSOp3fpK+oOd5WVK
 hjtimcvIpJLCC85q5/w==
X-Proofpoint-ORIG-GUID: TaYpeizMg4V7Q8J2ZwxFBUl8UNzv2Siv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160001

On Mon, Jun 08, 2026 at 08:07:07PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
> > On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
> > > On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> > > the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> > > are accessible. Without this vote, the SMMU may become unreachable,
> > > leading to intermittent probe failures and runtime issues.
> > > 
> > > Add the required interconnect to ensure reliable register access.
> > 
> > Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
> > be voting on other interconnects too? I guess so, because currently I
> > see that TBUs vote for various interconnects. BTW: should apps_smmu also
> > vote on the power domains?
> > 
> 
> This race mainly occurs in GPU SMMU, where the GDSC can have an
> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
> already have been removed by the GPU (or any consumer of adreno_smmu,
> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
> errors.
> 
> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices
> moves to slumber/suspend state before adreno_smmu powers down
> and the later doesn't have explicit interconnect voting).
> 
> In the case of APPS SMMU, such a race is not expected for any known
> use case. APPS SMMU is part of a shared infrastructure block, and its
> power is typically kept enabled as long as attached master devices are
> active. Therefore, explicit power-domain voting from APPS SMMU may not
> be required.

This looks like a good part of the commit message. Please add it where
it belongs.

> 
> Thanks,
> Bibek
> 
> 
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
> > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
> > >   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> > >   			dma-coherent;
> > > +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > >   		};
> > >   		gfx_0_tbu: tbu@3dd9000 {
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
