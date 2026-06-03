Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFB829B79B
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492985; cv=none; b=QfIJFTzWMmWDGxiZO7mMKbcRmxy4rqNcDICJogin9CTpPMbLBKGORipIZOfwFhfTAyQRCyel2eCI7xWecWO0hz/GrGX79PEROKeL2lUQXe30vUU8yo7rPqwCSwHTTRZYDpDbNbMGH25jin7/C/GQzX9X843hSsq0uXI7mR9S+Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492985; c=relaxed/simple;
	bh=kLkExFe5rWVtSO1RSLx3uqGB2p+sNdY1TYV//EUnguU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzBQcGf3NjoOFYcHtlUOV/3oDrHe6Ngw2+sHGqNa2fPXPTe68EySuHdFITD9WL4t46jZp7kOPNw+0sUkFRieo94p3a8NWB+NOjvOODMmTgW1hXEU3WbP/jjTGTM/kc47/kSdYIiupBT+9ImC5E8DwYsSfmwgFoigFKcZX2QFHhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xxvaazd6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tv0PWYHk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xxvaazd6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tv0PWYHk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653C458t2077120
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 13:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MI7LNUk01Rjy70p+Xfg+itjt
	rKzVoax3XdU0mqcjMBc=; b=Xxvaazd6vtK5rDYftVZth/q+eFTbPE2oGSEHEmKa
	fTM+/PRb89WWfAhaz9FvuyDbalq4ltbniS7tNM8zyK3JWUrxqP37z/NmU9n8ac3C
	zr/zGBzeqN2u7lc8lfR8JlisEISaGAznb7bKoJ2t6a0kNoCn3N8rCrTvpxirNgGA
	ooRM742EKtxkn59ecl+pve9Md/nYVEvpkb2DWDSEBumWAWzBay0zWUfpfK79YPLQ
	to4G1bzryHUbFFsYyZEogMsjO2dFtCIM8rrmhI3mf8okKgHwbjGi5Xqi/ltDkeu2
	5daWQnFqEoPUSgfBXk0sOUrtQB86ACr78OU2v919DSg0ZA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev19pvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:23:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59bdafdbcbaso3724961e0c.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780492983; x=1781097783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MI7LNUk01Rjy70p+Xfg+itjtrKzVoax3XdU0mqcjMBc=;
        b=Tv0PWYHkaKoKHWykiOGvJshW/q/XpeWeSudM5VT+Ky71+iqL4znJJA+GooGoDciYIL
         Z/c1HHTctVJVD26ivzIqtqjtJ+zIli29v0M0VggKiKUkZI+kk2Kva+LCXATqC8z+0Dt7
         RupUtyjLxy4M87QLXHsyQs2n3801sIRJWGS6txxVE+GiH74iGPD4o98BO0lmf7DPS7Li
         xkkDss2FF+LIoKBeNr8e90pEcBuQJJLebuxIF0DUujk8ZzBZn14xHp8RNslekdt9Xfpu
         /IH1fD3qapxlq59PN/0ZNLZNFes4jMBlobWdTMR/VifY9TQaG+iR2pZTte8vq3EL/nHw
         82mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492983; x=1781097783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MI7LNUk01Rjy70p+Xfg+itjtrKzVoax3XdU0mqcjMBc=;
        b=dy7TUqBesfFdkNTKhZFFFwhrOIvpsPip77dtyIILRQq7m3hjR/O2ZSqChzxV5ic5Rb
         gbXUu4EV6PFsDy+2CyrPR7tkg8cNcZ3hrA+uGlkq/n8XFbZNruSTizal3CKTDqiHoM7w
         AgaFUrHemYaQ9HV60F/Qnb1baRZEJvZxcyxpljT9bYfBxP0b5bExqviMoY39VxpLgsWa
         wHWFEm53lwXsmzYpHp9dWuTEnkFM3oi0MtckzUkMMjKtgHzNtgsHqsf5RBR/rFsureac
         zVS6ETMn+9dWLqhHHN3PKnebLfkzkGNB9gFtREtKUCuAyEYlrogomvQvwlklDJKaQ6Ft
         kNLA==
X-Forwarded-Encrypted: i=1; AFNElJ/avdReMB2/owLmhw4LCH0xT2kHCH6w9xMIMbsMAW9oSUC8hMmCL1hWk1Bao/JL2oHVzZSH3jna5RE5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5tGE+fzmQq2lLk1M6Z1xcRboSWn4LZKfl6Qj4Lu4hiVhQDW3Y
	tnhDfjatc6J+QMpUeEC5KmQjla4u/vNKxu0usa0IefTgXl1zBaGR0J2/qgpVCAwzpLMlb01kWHo
	2uhCVqMvcZLgpxetK2Acjq9nbD7NS0zhTLbQyiqQ+i5cr0leozqXP1qlTijVpggae
X-Gm-Gg: Acq92OGS4nBUer5MnlK/NoqbNAEVosE9rlKoduY3KEiewE6RV+ickYHp90BH5Wpd//9
	RYhZBTwDBxzMcDLetX4HwcnRWe/n07GUJaoXM34eU0KkQDJrwn27rAhyqqjqPgtxwhyMc3VDOo8
	DBs4/w4TmQE4fn3eWsw+B4WZ9g8iOqmre+h6W3fHruKDL1Def2Xh1Yvpyso/35T/oJhwxTXIJVF
	2AT9HYgzKv0OuzMjXn5ayUm0akwBoQYWxewHCrvgJCFZuHlXOG54r6wl6Rf6UVraAc78ed6+2hG
	YTVJd42gBajQZfpWuOmC91AkwqRPxaM49nmuf1NCB6U8kDsDj1j8j7hcm7+S/oriX41cZSOgeQO
	MpzisWB4t7iBKsAGqlCl4LuUmEAcLc1Cb74jRBFNzgmDZj8BLL6jsqc5F3FE+XslqgGwUyQkmpQ
	F4ley+jshzNeK2++faFyq3W5jgdiXtnoG9R+C67wigTvy9AQ==
X-Received: by 2002:a05:6122:3d01:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5a6e40945f5mr1784925e0c.7.1780492982949;
        Wed, 03 Jun 2026 06:23:02 -0700 (PDT)
X-Received: by 2002:a05:6122:3d01:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5a6e40945f5mr1784871e0c.7.1780492982478;
        Wed, 03 Jun 2026 06:23:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9040fesm644860e87.31.2026.06.03.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:23:01 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:22:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
Message-ID: <xptdvm7h52675tjfc44agdcayjovwfllds2fusm4iamgofxtau@2p4bk3wppqk6>
References: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
 <hs5roqpupi7svf4pyylvseqx44s6jcwnb4he36psoijjeeizbl@aq3b7k3xffxn>
 <4Fnu-d1cqR09ASN7DZABvKUO9mibDR3sRDoETHQpnOhzFTdtp-QIjy61Xed2OMB4Ddw96NGv7a4pmLNFXQESxWfNCLv9xQfyeWqAi_IdGNc=@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4Fnu-d1cqR09ASN7DZABvKUO9mibDR3sRDoETHQpnOhzFTdtp-QIjy61Xed2OMB4Ddw96NGv7a4pmLNFXQESxWfNCLv9xQfyeWqAi_IdGNc=@pm.me>
X-Proofpoint-ORIG-GUID: RiPBgzHEKMBhQ4uT5Igg6rRqvAjarI4K
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a202ab7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=y2wCMltUePGyc3NnhLkA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: RiPBgzHEKMBhQ4uT5Igg6rRqvAjarI4K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfXwBLqjjsdTndy
 wlHP2+owt8xS/3Skxy66EPUx3z9UUREvAm59Mktsrpvlw0r/1/04TJRIsXjuxNmSwiKetxy/FIF
 8GoMXEWA05lqRSzbk4HsckkhH5aTwTEN2nk09pNaamDzfFqB+FTrvi6xUpBuWFM9acPdqAhxVlB
 zNnzXBcaSHssrCGturHVVMYmUDqL2yr/3lk5lH+KOahhA/7toYpOtvWKuf9VrDbr/+hg7c9Ol6p
 p22CxbfevtlhtwMXbKI0owBFMxzPqxVBTppSuU46l6uR5wquaS0pUaThkm98LJdDLBN8KBd3Y2D
 mabt11flUBBxzX4gAd/jqQ7y2KJe0+gSy1C+Z5YEp91ROQM/RwL/GSDi1rj+dQMStkxy1XnBYo+
 VBrLO3hQjrVZncYhIuFSLC3h1a3qf04gJNyvcu+U8vRSMQUPHpq4znsunkQrd4QL4DLXRP43hJc
 jWhRaM1HlZgbuKVZvLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030127

On Wed, Jun 03, 2026 at 12:59:44PM +0000, Alexander Koskovich wrote:
> On Wednesday, June 3rd, 2026 at 8:54 AM, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Wed, Jun 03, 2026 at 12:41:34PM +0000, Alexander Koskovich wrote:
> > > The dummy panel compatible 'boe,bf068mwm-td0' is missing documentation
> > > and gives a warning. The 'interconnects' property is also missing from
> > > the binding.
> > >
> > > Dropping the nodes here and will just submit panel binding & driver for
> > > use with MSM DRM.
> > >
> > > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > > ---
> > >  .../boot/dts/qcom/milos-nothing-asteroids.dts      | 38 ----------------------
> > >  1 file changed, 38 deletions(-)
> > >
> > > @@ -131,15 +107,6 @@ ramoops@81f20000 {
> > >  			mem-type = <2>;
> > >  			pmsg-size = <0x200000>;
> > >  		};
> > > -
> > > -		/*
> > > -		 * ABL is powering down display and controller if this node is
> > > -		 * not named exactly "splash_region".
> > > -		 */
> > 
> > You might want to keep this node.
> 
> I have it dropped in my working tree and works fine with MSM DRM,
> unless you're thinking of keeping it for out of tree simplefb users?

I was thinking of making it useful for possible future usage, but in the
end we can always revert it, if the future use arives.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
