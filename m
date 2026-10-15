Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1082A4E13E8
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057504; cv=none; b=hxLdzlCJf6Xlq2LmNgWnVSNALCllHz0ButTrBEeyEY8s3aGprlmUTPsxm8ld580dsO75G9NtkIagjXZi8Kt2vkJSkdnDsYGDl4EiWORwaXmJUSNoyoIN4sd6I65/u6Rx1m/QxObX1Qv5xzKTMOJO4Eo1npsg+RqLbbI86ZKQdFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057504; c=relaxed/simple;
	bh=qtRguwZ4mlDCaVkmB0miTkMjt/Pa0fU+Vx0oFLYuu7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYydznIsmO9CwVC99KU7MP5YoCn21WmmaoUPUnLrhRu6MO3bxFE4x+RUViyb/cn14aGxRslbJuD7Nu0IL90V6A1gb/ACD/HYOnJHprRbjjN0xNg1sV2k9cRt6/tGz/LSTRoQ/lUfELfnuCYuXd9R6IRTA3PLmy6zQJTOAUANiJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMpA6lx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHcsm1YC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMpA6lx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHcsm1YC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9IqL71641368
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h+FgW93lIZWkl4JuJ0zk+Xr8
	VIgEcu5OQYc43p0CbhE=; b=gMpA6lx+13WJeyGV6JAdEeHHZRlhyfCnTSgbygGy
	E7mWXkhSxHSeaC5OS6wjiSmN2WJcUNy0Whi9dRNs92KmXQyuvpNFFlnBaK74ToLu
	6mZfMZ1scobI7uOLGI0hOkrJKxUGFUyMyGlbZk3B5lSwPr537MDbPxJAZjZah18y
	xYv8QJWXuIUZZaAnaDid8GGVoVERbXGF2e2iD2lukpEmJwleqBS6Sp0Vm1kEgS+G
	BSdxXIzlM6NWRLuJKfmTDCA2nAYCBXuMeALqVw2bMVcrbP30drh8WYqOoiLW37k8
	3eueEP/a0HH4PW1Ohmekrd4Wm3+4k9RRgQiX8BjeYGHY5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhe44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:45:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so379743085a.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057500; x=1792662300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h+FgW93lIZWkl4JuJ0zk+Xr8VIgEcu5OQYc43p0CbhE=;
        b=QHcsm1YCZQB6xOlWFQcIhF8l04L2fCtFA8g3aetCvvkQaRzpcHwTo6IFbmKb5SqMJ6
         eWN52FdxVdkAycgmhK4/dODtVuGEb7MfDVdF7lXSFdGslgE1TxuSn4FjiEdabVgDonIc
         HjWlqigyavcePBWtYN9TZyxygbDj3q2/thg+2W1FxQgVBC346uKwm1pWMDs1F4ZgafQ/
         rwUB9+Ag6MmyD+E6P/wzLUFYj+8R6jKMRz5NO6L+cJsOUtjbIvq8sQdudoczSAmkAl1D
         7AgY6g8C6IKPi4RUJ+8t0p1BE8sPL5mdTaVL46y3II1h+wPiaJhXcpzxK6o3LDzDRXsU
         geRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057500; x=1792662300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+FgW93lIZWkl4JuJ0zk+Xr8VIgEcu5OQYc43p0CbhE=;
        b=HAOVd953dexJJ7+TmkeIvXPOMDRVkbV0rWppHrNZEHSR0S2u4v0LDrXSP6+50z87xS
         1lyYv1A9+y3LJyvfstdW5BbraiHcKHLjFVeRscDLe9PqPur1eiUIKXESt7fionXBdxOG
         NcMD86OCNwjqobguI4pZcFtB3AX7LzrUhlYW3e5YzVwa3kfpzccYhWiCiY2tir9FWDfi
         fWwl+TLOhGfjQvkilZeqg8iMGhUQ+vOojdeXEtBvgOFaXQDXcvcdAG7LDyxMFVxvsAU6
         NxpcvZG13qotNrbY+Qls2RQnqp0ynQeZLqAloEcX/vIXlpIzhTt6yWQvlXOTsH14NFWC
         MyFA==
X-Forwarded-Encrypted: i=1; AKwUvBwayDMaFzQN8joQe9/pY8L1ORZptE1rHMUXBTXsOT2BzJwUt9+tpzxntPf+ljAHQ1Qop2C6IolM/1rY@vger.kernel.org
X-Gm-Message-State: AFq9FYLhxKUe+ojWouFjooP4V+CHHXGFPUD9g5hZLJdxWEO7TuuIWS/q
	t1IktBMzz0N/iBBO4f0680lyaqJuG6TLHYZmFcWlz2HkO3GbURWoWSSyDUxa2VvPsBuJ2r5imki
	uzzBFBaeEBKSR8Mge8RmjKqR/K8jkur5DE3a8iZnSwNUiyJefr0esBOmnFMwsGPrx
X-Gm-Gg: AYBFou2tWX53ixaxPhmPTO4zmcG8EXXCFGUhIlVv6kFPudq+X8GqIjBQPfuuDMqGsv+
	RbZtGyQV7qJDHzl6KMXSSSWm8NDmT7dxpNhX+tjNRuwozxhe9xgbFb3P/NAczMN8VjwdPcyWB+b
	fWJ1/AVoldRH8V4dVzwoCxRrFNKNMDfHAbzYF6HJWJzdeMqTYP05Yq/wTksP3GprOskBYEkjf3W
	FXdtZjrVatjJJz9f2LS9zSxNBHXMJ4dPqdTHYJza4obgrDd6xgf9x6LauPrd2YpuhauVDop39E3
	fUydZ67bBUW8vXVp5XLjsa6cR4m+nmYZFldmm8Y1KMDCb7IDnwD+PbuHptBCgfsONco/cvK9PVi
	6U8meS8Icor1IOCV657LIi1Lsjv3325adQe4Ty2zN1XX/aiNDme8/uYZaJ0gOyWQLeOdZpxD132
	9s8MP4Egx8yLFg
X-Received: by 2002:a05:620a:4613:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93eb95e3828mr2851432485a.7.1792057500238;
        Thu, 15 Oct 2026 02:45:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93eb95e3828mr2851429185a.7.1792057499630;
        Thu, 15 Oct 2026 02:44:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab1169d43fsm796131fa.23.2026.10.15.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:44:56 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:44:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH 1/9] backlight: qcom-wled: fix unbalanced OVP interrupt
 enable
Message-ID: <6x7y43ldn6kjxowm562icamjaajnxlgarzbelqg4wkgvf5vbbo@x4t3mu6f44wr>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
 <eda50ac2-bd4d-4151-b041-7f9fd56d9fe3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda50ac2-bd4d-4151-b041-7f9fd56d9fe3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX5aZBonbGSygh
 nx0/5x/I61NKBMjA6+EioUIiyAQo92XTzFZkBSHMiDZJkUWNsvsxs4TP+QK5JddlCM66PFzIRs2
 JtPtWVp0fROmmGDKKo8r15Ns1ISFLi/iPBrmjgTxiGD7BEL45AjkW/C+0Ofkr8u6cKcFPLgwqTH
 p0tCT1C1UNa0EEqlQeAjMzqfdimOmGVeJZNm9wXLuNrfsyjSPvlWBsSo80VauxsdYOdf6UbH8UQ
 9IYif2rQzYgz5AU6I88Hlbq8t0D1n/k1LSyJXFP62nnZu/AOu5CenmRBXLDZJCpg0GPE/tvn7Cq
 l2vuEiFUgE1RAwRAMmF6pkymqWUeGvIZz+5BBTc79zGdoLDshTn4vWslvC8N5yvSwZ1jCNcaTAh
 T4Nj4NPC4K4zsg6gh5h21grJLYacqrWbbDb9T/Pff1Rb69yakmgfNDx4SG0aIzxeMwrJDkcwL+l
 ONO/gQ8asyJ5BsdCLOQ==
X-Proofpoint-GUID: y1HBWzWdTpWtGZydqXlpqxDsc6ZG6L5R
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0a09d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DzZZqAc8IDjE5QScHtAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX4W+3y0zD8Nja
 jxh3cWI6vPVsersfXksR+apRouNKnjvTJMpu19baLwhv4n6xkWAih60NQP8aDwjhvZuoBfCV0z9
 shvWTfbk3LwaUSyyTAbSIZhZImCHf1w=
X-Proofpoint-ORIG-GUID: y1HBWzWdTpWtGZydqXlpqxDsc6ZG6L5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150038

On Thu, Oct 15, 2026 at 11:11:58AM +0200, Konrad Dybcio wrote:
> On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> > If the bootloader leaves the WLED module enabled, the OVP interrupt is
> > left enabled at probe time. The first brightness update then schedules
> > wled_ovp_work(), which enables the interrupt for a second time and
> > triggers the "Unbalanced enable for IRQ" warning.
> > 
> > Track whether the driver has disabled the interrupt and only enable it
> > back in that case.
> > 
> > Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> This was merged yesterday:
> 
> https://lore.kernel.org/lkml/20260921-qcom-wled-backlight-v4-0-bab8c7ef73cb@ixit.cz/

Nice!

-- 
With best wishes
Dmitry
