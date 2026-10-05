Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC50621FF29
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 06:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180725; cv=none; b=Zx9qS0GTxnn4E/+DHlYetjbypzGlvWfP1pkRavLeBiTTlnHV6IhNsqwyVpm6l53JPzqzDht+KXscyV+yzp5THyxgKSLe9IkxVuSxj60wvrqKBj0/At5j5IwblX0NwFcN873MLka2mROuEI3gCE6mWz41y8eDqv4tdM9BxDoDTWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180725; c=relaxed/simple;
	bh=evaDksZCbNvhc6Mnf4AYlqA1W+JNzFob57YVPbru158=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oP7CfDPipttTEFDzlm9kKCnARdAV89AQ/RdDiTRZFt5m0+W56kQ+fP1nM87CNrwgg3V+VIkBnzOKp56B5zMf0FemJGJZLbpcRQZY/GOYcNskLR+bZO2+Qi9dyfRaLXDJUaD7v/wtFgABQRRd+HavkSRQ4CX8M4WvftD7nNE6Iz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXZK+4GP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ioxMEQp8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXZK+4GP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ioxMEQp8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103WU1464832
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 06:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t7hb38lOShKOX4DAhIwGSWhb
	0M9uMInsEx4DUw+3QwE=; b=YXZK+4GPpzMCvnrdxr/eWpCSzCoK2Lg37phfzFk5
	zkBHHg0RCOAQ9RgdZfwxHuZRvGJtMuxw8BiPvOX5UDlHfo2X65BfVsIz7tuctDlQ
	WmPE8+lKb/pgizHDJKrexbNwQ4BKfMBYIUWfe0RI+fxJJCABR9epOgppauBeW3sV
	JxX6wGbDPkLo5GQst1OEUa58hKtkBIc9XFTRf/J3xaCY/nfHKSFJgm6xOIEIvIG3
	zuyOimWGNpjoKhhlhtafxUvdnxR2sXpilQw7ujwtM9PvqMuWxYTWb6d5hupo9pK/
	mPHKFLcN+BQB2YOgnt9eYvzcC//p5zczmmxbrGImHdBTMg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssmmyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 06:12:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1580372a91.3
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 23:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791180717; x=1791785517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7hb38lOShKOX4DAhIwGSWhb0M9uMInsEx4DUw+3QwE=;
        b=ioxMEQp8uL1VBXI5qM82m9Fj+nQnI/uEJBl4aXoi9uo+kGu/PPCrEIVlCGYfMQUKrs
         /AG3A0yOm9otvfRIIg64iTfShr9C2IDW9X5sAK0SCywoTficC4I4ixVTkTtqtTaR2IpH
         CGKWoIyLnEhMwZHIRd+dwYD3LlUMpLDZFni9TKRBFaj5Cv1C5Tg4Mhitg3pDOIkp7XQP
         MbEMpztViU5f+I+6vz2AetMGa95vafvMilDQFTfXlr3WN1jBcX3wiMdS7+6EsDxbB+SJ
         ETGhFEMkFetRc0izvGePf1c0RxyjSzX++k47VVsMz0PV51f5CaYsy+TV0wgXcYKNprGx
         MI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791180717; x=1791785517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7hb38lOShKOX4DAhIwGSWhb0M9uMInsEx4DUw+3QwE=;
        b=jHaBAuhE1pMHKkJj9TTUGPKPZLe2KiJEm7CiZ4WlsMUka9j8lCKy7sftSIhBAOlcPw
         IS4kJTwZcu/YLOeCzBcxj0Sey8qnberYh829x7KfEIuXvzxCXR4mEmcMvtlZhCBWy64D
         Ji718AIO1lcrKuag7PlCvQZrTONsYWcl77OVtYvjKyUcwTe0c/geAfsFjMumeaEwxiFG
         fu/5Zi4JVVfQA7qnEPX0HT+sp+xdyBR6PWYY1bUrJrY5zgOS05Fa0kY966g9hxLpkNHO
         9AawOkPxU5cTaRVF1rLoI++ixT0OWFV5/FbB7qAeI+5gYEY8SHnb5TUyv8VFjFc1QTfA
         an6g==
X-Forwarded-Encrypted: i=1; AKwUvBzxN/+FTTUDmFL27fITR2eI3w+4q/lkIZRqZrYf9F/fxOJQVuurjII2az2574ykIeIXTcn/nCd6TjBq@vger.kernel.org
X-Gm-Message-State: AFq9FYLuGjSMVRbmuJ20sBTel+tln7UEyzfjTT/ftTdezBa9spUQKPrS
	FwkgHwAiIhv5HFjX4sFr8mTvGUUx4SirLXqpEdzHKxLBByiPafm05sfYCZaq02dbA3xn3+SPgln
	kGnVPymFt7EfQdd4NJPuVIp3WgdAIaYAHkZKGSoyuGBedco/tWUvBQ2Knn0fHoQQJ
X-Gm-Gg: AYBFou03REBeZ8jJE1ttluzJeJex/X6C7ZyICNDL7ycR9pTfnofpEIo3oPCbk9V/80U
	3YtBPSyLBloW6LmeJqMuTIXe+3+oYtK2YZdDjxm8oArv66w38iNElE9Foncjs1WptsVx64CtR3f
	Rwdn0Jzy2AC89CLyqQaO2ZBHWtmo9aaOj2x6HVLD+Q5w+SFtqjI565W7LsRSmgY/1EMZ+KHJKoT
	5qF4eWw7ZE9qemzdzbGO0Z0AV6p99atiu4tur6BWsMMljXfezljLccVDxCcpFu1Ti3O9ixfguPz
	e909OZBkRmouk8a7uR6kvHWd6eGRRRX5o2qXCYclT4u7tNpcTEgXRm4jIoqnjBu2K5zV2wYCacl
	cGZhbIP+kyPQ2qDKzGtRDFyUSKYAEA53IVNNp
X-Received: by 2002:a17:90a:2d7:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3a6d02b0fd3mr4447669a91.4.1791180717177;
        Sun, 04 Oct 2026 23:11:57 -0700 (PDT)
X-Received: by 2002:a17:90a:2d7:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3a6d02b0fd3mr4447663a91.4.1791180716723;
        Sun, 04 Oct 2026 23:11:56 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e472b48sm9294888a91.8.2026.10.04.23.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:11:56 -0700 (PDT)
Date: Mon, 5 Oct 2026 11:41:49 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel
 overlays for Monaco/Lemans EVK
Message-ID: <asM/pR6C0RpmUR5y@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <aqLGFfQ20mCGFkfl@baldur>
 <aqt72zoSNVGrcY9t@hu-ssmaurya-hyd.qualcomm.com>
 <arsp-8KPqD_skD5D@zenbook>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arsp-8KPqD_skD5D@zenbook>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNCBTYWx0ZWRfX4IxIGWCvWT9t
 pQnT8jH0vzYF0x/j9hRZ2fxDzf8FS2aSVbL0MUpjQtC2KF6UXpV1JhWQ0t4OqU0vWTfWCJPD5Bo
 KvGPViL05fTqfWCyQWrl8fRHHUirFBk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNCBTYWx0ZWRfXxHezeNpePoV4
 PKxCBdUBt18RBHwlcaDSWdFcpV5coWS9+xiWooa67+0YO0MNnfqRykBCDL7OK0LW8q22m7B68pR
 5LoZJt6pAAIqNwo/IZQbc7O2zmcbddZeB9UJKA83nI+T0/EHkt+9gfwN94ezxUIkf+gBdnCv3W2
 3wCEID0J7nfQOCe1+v3n4Ym+IwqUxamxnUycv+QUS6MxAgeIRhoV5ZnINYp3DOuca+nM8aOMDNz
 Vh/lT6OUIFrn7CshO2WouWJ9C37yvtDSj0RGZmkzBmyxLSEJAdZ7Y282PC0SsaTpspym1gByRFS
 KpKIRb5t0jHA+JU0LdJ0exgHiq8SYpHdFeamHnuYyC+uOFZ0rRXss+HNQLUJn9J6uBHM7doZ7Pl
 hdNV0TIo8DbO5HAF3i3FGj4RXQ6SgcuhuinCZvSYrUQRn71D5iMHrd0HUlMaoUVrYfE4f9EREfl
 st9dEwoKCyJdjrFugYg==
X-Proofpoint-GUID: 7ukJupva1XZNIDDwOsZIc5fBx8bxhsQz
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac33fb2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=D-uZpU5vEzOSoVvPSTgA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 7ukJupva1XZNIDDwOsZIc5fBx8bxhsQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050024

On Mon, Sep 28, 2026 at 10:05:20PM -0500, Bjorn Andersson wrote:
> On Thu, Sep 17, 2026 at 11:04:19AM +0530, Shashank Maurya wrote:
> > On Thu, Sep 10, 2026 at 02:35:41PM -0500, Bjorn Andersson wrote:
> > > On Mon, Sep 07, 2026 at 12:03:52PM +0530, Shashank Maurya wrote:
> > > > Add device tree overlays to enable support for the Raspberry Pi 7-inch
> > > > DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.
> > > > 
> > > > The overlays configure the panel on the primary DSI interface using
> > > > a 2-lane DSI connection and instantiate the panel MCU on the
> > > > corresponding touchscreen I2C bus for each platform. The changes
> > > > allow the Raspberry Pi 7-inch display to be used as an external
> > > > display option on both EVKs without affecting the default platform
> > > > configuration.
> > > > 
> > > > ---
> > > > To: Bjorn Andersson <andersson@kernel.org>
> > > > To: Konrad Dybcio <konradybcio@kernel.org>
> > > > To: Rob Herring <robh@kernel.org>
> > > > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > > To: Conor Dooley <conor+dt@kernel.org>
> > > > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > > > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > > > Cc: linux-arm-msm@vger.kernel.org
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Cc: linux-rpi-kernel@lists.infradead.org
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > 
> > > > ---
> > > > Shashank Maurya (2):
> > > >       arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > > >       arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > > > 
> > > >  arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
> > > >  .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
> > > >  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
> > > >  3 files changed, 169 insertions(+)
> > > > ---
> > > > base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
> > > > change-id: 20260907-rpi_dts_overlay-58088ffce047
> > > > prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
> > > 
> > > The two dts patches in this series clearly relates to those two
> > > regulator patches, which has received change requests.
> > > 
> > > I would have sent the 4 patches together in a series, but as you didn't
> > > you sent this series with unmet dependencies.
> > > 
> > > All I can do now is reject this series as well. Please send v2 once the
> > > driver changes has been merged and you have validated this again.
> > > 
> > > Regards,
> > > Bjorn
> > > 
> > > > prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
> > > > prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9
> > > > 
> > > > Best regards,
> > > > --  
> > > > Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > > > 
> > 
> > Hi Bjorn,
> > 
> > Thanks for the review.
> > 
> > The regulator patches and DTS patches are targeting different maintainer trees 
> > and therefore were developed and submitted from separate workspaces. While the
> > DTS changes depend on the regulator updates, the two sets of patches cannot 
> > realistically be carried in a single series because they are reviewed and 
> > merged through different paths.
> > 
> 
> In reality, Mark has shown many times that he's able to pick individual
> patches from a series and the 4 patches are better reviewed together.
> 
> > I submitted the DTS series separately to start the review process in parallel,
> > but I understand your concern about the unresolved dependency.
> > 
> 
> Please send patches that are ready to be merged, and when you do make
> sure you send them in a way and at a time where they can be merged.
> 
> Thanks,
> Bjorn
> 
> > Regards,
> > Shashank

Sure, I was not aware that Mark can pick driver patch from here directly.
Driver patch is already in process, once driver patch is merged I'll post next 
revision of this patch after valdiation.

Thanks,
Shashank.
