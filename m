Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C043AB5B7
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 12:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858471; cv=none; b=m5G4QuTiyVHdB/mDNslHvMZHhSQk43ygWzo9o6yaxeIeTNk56hUz1T9XbGvMZVzuFGuvDyKfJbYR+KaUEVx6kbb3fIUHAO/SShWxzFiVhKj+9tpMVVBwc2CwTNI8Yho/9wgbUsv0TcFrZkWNwqWFazX+ai2aI1ytbTAXn7Ras88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858471; c=relaxed/simple;
	bh=/InVEEvL2BDFOHfqag5PBcB5YAbkZtlMQjkqKfb3u/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGKsgYD8r0t6wZDTNw/6AOE20x8XDFmx0kuDkOVw2f697o60NQ/RezLlW+ObI6NIxgkZZok0azZx7NAu2KLCn0oBYrrCtf5d7UbMsdv3Uzx9VRO68445DmjR1iLOiqr1T+GPCQf7s9hi6Y4ZxQZruENV5T0khE2K1HkLMXemDes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DD0kkFjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3GuHJiG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DD0kkFjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3GuHJiG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAemm22391997
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 12:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HfwZ/Ch0hmCLwy9ZofNn28jc
	v2cqQx6opUokqQoHzlQ=; b=DD0kkFjtoZArhuSik/sHzOWP+iDteAm1clFv6Ujj
	VtvFP6OGrPIEVz/pCMHrCQdeSwCIN1w8tNSjDYiQucU2Q8wvdxdinhU6rQVbNlP3
	Xq2YYTrrJOXmUJgTM7yQQYqRnucX9dN/m1ZqKrbZ2myX7aFZ6hJvHDyJFOTEyl+n
	JWiSyV20zzt+KqmSQnixiTNpEHCZH+DIVU8Z287m3jrfqqLPERygvcR1yPAI778o
	fc41bngUh/jQQ0y4Q/wzW3CzwfrOvzPbgHm8PqFP8DS2K1j/YxAscFFsJE7hFC8Y
	FqVZeLRthBxB238HvrWWbR643TDQNVh6Yw6Up9qZCiEMwQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8vapq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 12:14:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec3314f65fso32873036d6.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783858457; x=1784463257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HfwZ/Ch0hmCLwy9ZofNn28jcv2cqQx6opUokqQoHzlQ=;
        b=O3GuHJiG5E5olREM3CtRGf7+3oSdsx9TkTJS9bf1XETYxvfQf1lH6iPV14udj5LEFI
         WcivMN8ckAMMqECik6G95ZobEIErwiDcFF+hT5Lz5jPQPQsU0LC+8YfG+RDeSiycEs8D
         utv0bsSxW0ttdftGC3dQx22MGGGQ0+DGew06MG2Yd9GWopycbwskJRJCNKuybJwYr3c4
         yhE8UGoDzIgsrlg/nX7JOtxZ/Uopy+t8M0hnxQvT4jaJDwiu4DKu+TyuMnnDE6gvkIG+
         AbC/mqM7Oyf4A4bOvayRTFsCdLjceks7SFA8v1Oc0Smv6lCOk7/vGwZDB1yFV2H3r66u
         EHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783858457; x=1784463257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfwZ/Ch0hmCLwy9ZofNn28jcv2cqQx6opUokqQoHzlQ=;
        b=Xzx9N7pDHAZ1Nw07C7Ck4g8Fuv+nzAOmIfZhFx3E/n1fbaI6iJsJVq4cg1JbYV6C8B
         R4xdUCUpOQ4pxalGkb/NP5P7ktCLS2ogUMnC2QQIO59rzVXoSAuUH6hDyYOc8YYMqGfG
         6E5mWLz2HDQ6PLHl83o2142J24L00zEqnm8bNtxagli3EEkLw2jqLJEBqW3XL4hJ/Qyb
         nfrqQUbtlEzk8uULRh3+iCfL1M33FUFEpCip6B1Z10rk6TWyV2IXFq6RY5giFUUcy85Z
         EQ252HQxnmjkOnru9hnCwU2Tt9rQQpMm6AswfqYOQI+7hyJjhvCJeHJDrtzMxpLwOHCO
         tyGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLQkqGE28R4GZrWcJFL/roMQADnv91bfbGTQpl+dm1WJ8LGAqt1e8nlzHMqjeT+QuaqkjpuzFEP0QI@vger.kernel.org
X-Gm-Message-State: AOJu0Yypaj3XEpmorSRlYxv/8ZrdCvO8kbvjLYnOcZn8+ZY9sL9K7CMH
	lhKvyjHJRqoPj7kzI3Yb9yO0Ev4+1t0YnY9H3AhR6th+TdhfngtXusi/yiJuNjrdcgg6xDzEaHO
	rSrRYryB0beq0HAYZQLnsnqzRtdDIbMwuRRGZlq8XBPb5l65A4i6IWlGFxQYs5ICL
X-Gm-Gg: AfdE7cnSEDi5nt+5YY0BB7RiAqzmzJ+v1sNToEja6LQRm7GoAjiDcYFc+0Y7Ub2ffP1
	3n2gDkiXRphE7nQiwN3XnFt9UMH1aTd7K3fCCoIgAVu0iu/VYJYTNWvPZhioozbkLa4H5S4pKhp
	P+9pRoKqWw6R0RjHqnQc7OUl3etUl9P7AEUIXVjz2b2ejse6KsnWlWjXgaF7Z/LQuU83BCYyrWs
	Bi1S+ftxjmcLWjSAK6yVzqrrz+v9v1XRBAJYxw/51uPCA/lVAZOp7KZYDxJlvZPJVW2FG3sHEag
	OUQmVTVer5YLfCcCtxW4VBtl/lLQ0Vrk6M2zA5Tor7vVBsR74+5pnqe4DikCtfKyRbc4gM/FI1j
	AabQaO3JE5D/+CfFccS9Vs/kEverkva56+tE24vOjbt8lCXSm2Vk2JWENTXcnyutGUfM297VUl5
	gflgPG/ARq5waHao6VLIKN4cbX
X-Received: by 2002:a05:6214:468a:b0:8f0:a2c5:9d59 with SMTP id 6a1803df08f44-90402369c1fmr71343956d6.21.1783858457540;
        Sun, 12 Jul 2026 05:14:17 -0700 (PDT)
X-Received: by 2002:a05:6214:468a:b0:8f0:a2c5:9d59 with SMTP id 6a1803df08f44-90402369c1fmr71343576d6.21.1783858457034;
        Sun, 12 Jul 2026 05:14:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4f901sm2091705e87.23.2026.07.12.05.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:14:15 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:14:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Val Packett <val@packett.cool>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
Message-ID: <zaigjwjpldnsrzsfbyolnlvblteav5esfstoib4m3eusc67a26@jotedakvvo7m>
References: <20260601041336.9497-1-daniel@quora.org>
 <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org>
 <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
 <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
 <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
 <ff3748ef-cf75-42b3-850c-b8742a814920@packett.cool>
 <519CAAC5BE344EB7+e6d7f90a-e481-468c-a987-dac3c69d7362@radxa.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <519CAAC5BE344EB7+e6d7f90a-e481-468c-a987-dac3c69d7362@radxa.com>
X-Proofpoint-ORIG-GUID: tO27jXSCUFm3rWevsMsKy6GqA5Rd5sdz
X-Proofpoint-GUID: tO27jXSCUFm3rWevsMsKy6GqA5Rd5sdz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEyNyBTYWx0ZWRfX7I68jCC/tzS4
 J/mPoeZ9ICllFgDMbeEOqYVXrnS0xMa+2PUCHUXpInrZL3qLLQWUy72US0cpSjnLfTmr5xVSLTc
 XKBjQFYmbgdQWNvmyXgFUZGlfD5sjDo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEyNyBTYWx0ZWRfX+156TYfNiXjY
 MNaGoqNuUkKo6VROm0BitCJ61eNz/bJ60Tf2CNBBKhCkBwzLKb5jnyR527I3jfKOnsmkycowIdk
 jcyD1EqNR+XR+oepyu/ilQiHLYYPUSsSa/XHn5QXOaXuiNepEjsQxrSvXCRkR/6UHJH8+Jdskn5
 yelEbs5Pc1UX8fj+tb/FhYtjF1PYCwPol25QjEkyTphlboJxK5S4FaIucw2arYNon/ofcnYmkZR
 Ivgkb3R0mDrDnISo/P8quBbijgQ+ovjjh0Sy06jFA55KKlZjVBlU8cve2L1mSE33haVi/q457F0
 VTxs26Yi2GF8WwvoWup4L95yp7zehA6h3liqkQcIJbPIQGKii5w/pen8MzrYlBwhYMxjTC2H0fI
 oeehi4at7+d/lNc+V00gbGObZRYGW8SjqbfRmUaqM4UeuXS0uz8h5l5rDhCKiuhvPxr3+Lg5OTQ
 9k6egkD+a1JDAoPjDaQ==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a53851a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=nl5WK0wFAAAA:20 a=VwQbUJbxAAAA:8 a=pLiI7BJ3y60Ur7kopoMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120127

On Mon, Jun 08, 2026 at 12:17:57PM +0800, Xilin Wu wrote:
> On 6/8/2026 11:48 AM, Val Packett wrote:
> > 
> > On 6/4/26 3:38 AM, Vikash Garodia wrote:
> > > 
> > > 
> > > On 6/2/2026 9:05 PM, Daniel J Blueman wrote:
> > > > On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
> > > > > 
> > > > > On 01/06/2026 05:13, Daniel J Blueman wrote:
> > > > > > On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
> > > > > > triggers unhandled SMMU page faults
> > > > > 
> > > > > How do we know that is a correct address - does it come from qcom
> > > > > documentation or trial and error ?
> > > > 
> > > > @Vikash, beyond your comment I linked in the patch [1] kindly cite a
> > > > source for the different stream-ID <600MB behaviour, and share
> > > > specifics, eg if silicon, firmware, or driver and constraint, defect
> > > > or otherwise, so I can include a definitive description.
> > > > 
> > > > Also good to know if my workaround is good for long-term, or on the
> > > > other hand handling streams <600MB is important/useful.
> > > > 
> > > 
> > > Thanks Daniel for raising this patch. Did you also try the memory
> > > fix i mentioned in the bug [1] discussion ?
> > > 
> > > Coming to 600MB, this have been the VPU hardware restriction all the
> > > while since venus days, and since address could not go deeper all
> > > the way lower than 600MB, the issue never popped up earlier.
> > > 
> > > Consider the memory layout split as below (Iris device range is
> > > capped to 0xe0000000)
> > > 
> > > |-----600MB-----|-----(0xe0000000 - 600MB)-----|----IO reg--|
> > > 
> > > 0-600MB range, VPU hardware would reserve this to generate different
> > > stream-IDs primarily for internal (non-pixel) buffers.
> > > 
> > > 0-600 --> VPU would generate *secure* stream ID for non-pixel buffers
> > > 601 - 0xe0000000 --> VPU would generate non-secure stream ID for
> > > non- pixel buffers.
> > > 
> > > When many concurrent sessions were tried, non-pixel buffers were
> > > mapped into 0-600MB range, and VPU generated secure ID for those.
> > > Since those were not associated with the iommus configured for iris
> > > node, it led to USF (un-identified stream fault) and device would
> > > crash.
> > 
> > Umm.. is anything *actually* preventing us from adding the "secure" SID
> > to the iommu node?
> > 
> > I just saw a patch for sc8280xp that did just add an "extra" SID for iris:
> > 
> > https://github.com/strongtz/linux-radxa-qcom/commit/
> > e92850f792498c3a72d72d667503a29bf6bb0a31
> > 
> > and I'm wondering if that's about the same exact issue.. (Adding sophon@
> > to Cc: here)
> > 
> 
> I'm not sure if we're having the same issue. Without adding that SID on
> sc8280xp (HFI Gen2 FW), it fails to decode anything and crashes instantly.
> From the trustzone log inside the crashdump, I can see that the buffer isn't
> actually in the 0-600MB range.

Hmm. The decoding is working on Lenovo X13s ([1]). It says 6.18, but it
was the Iris driver patched to support SM8350 / SC8280XP, which I posted
some time ago. For the reference, the firmware reports the version to
be: video-firmware.1.1-b158087140355883dc40b004032856a8feb5d565.

[1] https://github.com/lumag/fluster-tests/blob/trunk/iris-sc8280xp.md

-- 
With best wishes
Dmitry
