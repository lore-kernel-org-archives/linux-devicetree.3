Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EA739446D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256325; cv=none; b=YJhjDBV8VQetC64Ns+vrHzNMZLM9pPHV7Oc6Te0lKMMuFQmO5yVoG2nfTGukEPfSNSiKaqgEIAUDDWN14uDvvw6nEmWFqzzBVFX6N9V/nVyomKxOhy7M2QqTmSyWD+YAUilpIPl4YEmyEMzOcr2qtML4WFAaMGpZtrUrYIHsX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256325; c=relaxed/simple;
	bh=+F+SQla3BxZLceuQ3pbmtj0WLzHI1Av3PT7HQH22Yoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiRTqPGi+f0NGzkslwPvhiBktbca4MhMVNsQF8z8aM3q0drTUSv9JUUad7YzqVPo0/32mtY+SM7fmt5NO4V5SuDJCSBvAT+cwHf6ts5X4RL4NAR6V/Fw/LPRCMZYDqKWVuVzfFK6Z8Jh9WKmQF1iVC9NffDE+oEJlOu7ZLa3SFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSA4uiDa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdKcGVtB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSA4uiDa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdKcGVtB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bp0R2505976
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86P90UhEAGLlR99BxWM0Y431niqx7bECQTX4+J6kHUc=; b=YSA4uiDahdSOpH5a
	KmBPpsXdPLG4TDwzjWTNN+K5wS+PBei5WY2sZd02kNBXKKoowNO9wlvIdY/cGH/8
	aqIDGyYZp9dJXed0RG4MOdb8LXT3MQGGB3Kh1FQhM536fsAEBtSge0XgPqyXK4XD
	Kid2DcSSE5hCZ8eb/wNhycpHIN+2/S9o2VgFN72qArlZsryc/KjqXJBhQRlsJhbK
	dZVfViQLBKUXD0z9E4/P1G95uhC+J+Yepz0m7VylzrbhkhK//k2Nz9L4kWXxL56q
	A+5Nh90tSSxtcRmmlc1g8k7JUHBcBpWFTW7wByS+xIGn5PVmnOyT8mS5Ur8M/Dt7
	hg+F6g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjv4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:20 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a83b662fb8so896282e0c.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256320; x=1781861120; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86P90UhEAGLlR99BxWM0Y431niqx7bECQTX4+J6kHUc=;
        b=hdKcGVtBFIRIGpf4sNpGbxaVoTksDYLx7aWj7Pbeh4wdw0WLN+2xJGzNtSXjf7NlJH
         OKubU7H2DXgHLKGmr5Xso+XAndU30rvw4V4KAW+gCH+uq0tixfFTTYi6CFZh+/gpqKyo
         FRsEXX2/tatwYfJmFyZ8xAncPAXxS7UREqm8oYgm9sZ0xxIsQsFxNa65y8dhimCwIOhD
         mj3JxaWPIHnUue82N7THL3VqyrDzDa+pp/bIknvX8n9dHfUVk8F85DoFmmaY3tST1mxZ
         G5jPZgZBEblXJL2DekD9SzsrGLdzWg1S+ghurRw6BIg27C2OQHLG5Oxms6uhvphX56Hh
         GacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256320; x=1781861120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86P90UhEAGLlR99BxWM0Y431niqx7bECQTX4+J6kHUc=;
        b=S0nfSkPVFxvKQjEYAYhPEq/NndAaTMmEosJTjVdyCpIQW2N6asl5MR11yRYyiXBVx1
         Go1FLeeHLMNWIMudDUR3FrxTvhyFEJqPq1dI8jvz3HQjURBHQHpeOw81kAU2HPQhxuYe
         crqRA/ecnUR0gN0+cFsnTjnMcwdeL3fV1KOrwtngt6hhUQxKa4KaeHff3E3PHLzq9Awx
         qhT9dblBkhLKmJTPxNzswvsaCvv+CvXflRnU6yllo6Bix3I1V0FCAaIvxCFZWpm84hlN
         Bp9F7thpaICuZlcU4aSFIMhsdHDXUtDTQp6CZEZnVZLvOfP0fRVskjxK2mLskUWxZ7xi
         vOSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Cz2fGXJ1qESebKHsQUJou5WjrFok+SjSFJeY67jQbE0mngoblJInVDXM2lnhqu5xew6ASOZVYbbdW@vger.kernel.org
X-Gm-Message-State: AOJu0YyAuQGSq7gq6ot1UhzRpRArylWeq8YIjhBqDP9Jt1OsjqFIcZUv
	/syzCOJWMLbhju1BejbE5ldrIcTUKP43izypF6+pklPVdGFxIgSDwGVb54M46SLCb14ZfB1EEUq
	ak6u65SzAQ4D9tY3yPGZl7L88LBwgO8clD483zFIzV+Ats/6lPwCzQkazIawbc0p4
X-Gm-Gg: Acq92OFlqAryUWv+57UZgLJr9caztgeUg6udVm5EqmctIj1s6Fb8bkMwL67zKp3+AQq
	dr01Ho3ILbY6q9s6gc+exAEhvUkH7TFXjQ1cBe7Dtyrf9DXM96BOhLvWrRLO2UUVisTuwvJjlsI
	7m5mwVTNkSmj48pnOjKBXavPFvVvMBlcoKABjOxqiRABYB+8QRrkzrgvu6oBSqcLHR+3GaYTXS2
	MFBcYhQnK4M52LjA1cFGEyCnQial61buAkwt9hZWBiInljYFlLi3JA2SI0rK61rbRBf8FYJfpgx
	gxnJS8dZrPMCpRgJTEL3CBPHzrq9hCOUTibubW5R0mbXaMXhO/Ntwrb++zaCCQjIa1N8ZJFvmBt
	n7SNV0HokYYb7ed/9FurGl+Ect+hXsF+IU9Vu45NKl46ClWvr8EoXDytSfjEAVlqLWjdfb1jaO4
	scaw6ALyXdgtx5Tk11+lwBxjp51a9cSgXTsfk=
X-Received: by 2002:a05:6102:c4d:b0:633:c6c4:b32c with SMTP id ada2fe7eead31-71e88c4e2bdmr759165137.15.1781256320198;
        Fri, 12 Jun 2026 02:25:20 -0700 (PDT)
X-Received: by 2002:a05:6102:c4d:b0:633:c6c4:b32c with SMTP id ada2fe7eead31-71e88c4e2bdmr759145137.15.1781256319706;
        Fri, 12 Jun 2026 02:25:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c4aa1asm4974281fa.10.2026.06.12.02.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:18 -0700 (PDT)
Date: Fri, 12 Jun 2026 12:25:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Message-ID: <nkv3q4nzsoew52ti32x3oy6tokjxgtjeyvq7kvwsyr5w5ztm44@kitmsxty4dqs>
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
 <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
 <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
 <574a1ab4-293e-4daf-bad5-8dd886a8178b@oss.qualcomm.com>
 <10f2cd7b-4f87-4581-8065-3c140ee473c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10f2cd7b-4f87-4581-8065-3c140ee473c1@oss.qualcomm.com>
X-Proofpoint-GUID: CViq-uLxagF0xIZ_29fvj6DX8R97KIvk
X-Proofpoint-ORIG-GUID: CViq-uLxagF0xIZ_29fvj6DX8R97KIvk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXzx81WtIUXjFi
 Au4C4VpxSbOWKKqOq5pO4+y/Qd+Qdc8qu0idTX9XBjdGS/FlZGN79yWquMCx4ao1xyuqLTOvOlT
 mt/DSzDswiKz+9mCjFRdglfYz66GFCY=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2bd080 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=crNuaYni8ADyvu1K6ygA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX30jsmgSHtlhv
 7MsdH0ahAOjQYN2hwstzU81KJvOFaMUiWU8tYtD2ktgEnXGv6oVn/U8K52sZ5POXIbLTV06bpL9
 m2ndLc7XBrbe1lvagnctZHilf/lYLePTLC3PdnOepjNq4gS14Gi5DYFuyHRXeSMQGqbwfcG/k4U
 gFezgsJtGdsQ4kWXhXG4thFXcSOrLrHzkLopng4oNDxt3fJagMryqEkeRH/+2fQFHnw+rkXjbp1
 wR6KrrhbSfZNj/EnwxwCkzttaiW+1YsoYr+q/WOmcdJl+c0CzTd69+2pNeSJInVVxtMqrWP5ytq
 dJW7t3jLCY8fQNwixFlhpkXEgcHYEkwELbMwxqSWAUehfpuDeeEkYeaGVW33xIWV36Lrfi8vvB0
 y4KMsJg6/OK/70EaIv8ZyDYYqoeevWki6t2im+1R8cnP0JZkgTPyWisPrCxunuVdcc1p2VOvQ+2
 R0iVcXkFzo43oLqoxLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120084

On Fri, May 15, 2026 at 02:15:55PM +0300, Dmitry Baryshkov wrote:
> On 15/05/2026 14:13, Konrad Dybcio wrote:
> > On 5/15/26 1:09 PM, Dmitry Baryshkov wrote:
> > > On 15/05/2026 14:03, Konrad Dybcio wrote:
> > > > On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
> > > > > On 15/05/2026 14:00, Konrad Dybcio wrote:
> > > > > > On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
> > > > > > > With the default PSCI suspend value for cluster idle state Lenovo Yoga
> > > > > > > C630 isn't stable enough. For example it might reset if display device
> > > > > > > isn't probed early enough. Drop one of the bits from the PSCI suspend
> > > > > > > value to make C630 work in stable way.
> > > > > > > 
> > > > > > > Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
> > > > > > >     1 file changed, 4 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > > > > > index e41200839dbe..e6c67016552a 100644
> > > > > > > --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > > > > > @@ -347,6 +347,10 @@ &cdsp_pas {
> > > > > > >         status = "okay";
> > > > > > >     };
> > > > > > >     +&cluster_sleep_0 {
> > > > > > > +    arm,psci-suspend-param = <0x41003244>;
> > > > > > > +};
> > > > > > 
> > > > > > Is it better if you do hack in a
> > > > > > 
> > > > > > qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
> > > > > 
> > > > > Any clarification? Then I can try hacking it in.
> > > > 
> > > > This will send a message to AOSS to intrusct it to prevent CX from
> > > > collapsing
> > > 
> > > This sounds like a dirty hack. I think, hacking psci-suspend-param is a lesser evil.
> > 
> > Yes, that dirty hack is supposed to help us understand why this is an issue
> > in the first place. Especially since it only came around at some point
> > (although I suppose you're not really happy with spending a day bisecting
> > when exactly)
> 
> A similar patch has, I think, always been in any laptop tree targeting c630.
> It could having been a disablement of sync state, a removal of cluster sleep
> or something similar.

And gracious ping.... Can we sort this out somehow?

> 
> > 
> > > I know that we should spend time on understanding, what should vote on CX instead, but having the issue only on C630 doesn't really help. Maybe it will go away once I can sort out the gcc / dispcc / mdss issue on SDM845 & SM8150.
> > 
> > If it's a "not enough votes" type issue, it can vary from device to
> > device, from unit to unit, depending on your luck in the silicon
> > lottery
> > 
> > Konrad
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
