Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6FD3314C4
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122693; cv=none; b=X845s02f5BzXgog/ss8c0x0VC20WaqVO34AHUyzsDeC6Kn9E1ZVZwpHrTdIrN+oNoLj/koza5KQv5YnFBV2z1FJXCT7xrG0iy0NibNlTzoMaRun+fBMrbDeiRmmpAv+Ud3mCcP5qwDWmNS5JUTv4jtXIzlw+p7Cmwh2aR9HVRHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122693; c=relaxed/simple;
	bh=DXDmv3z9XWEDZtDR0RVBhsTnIBWRy2dBrp+wHjh3Dqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZ7OjxCo06P3+vrxt5ObFXsfVUg9mn9B1kR//302bPdORC1RC1V6/I/cLokrz/4Q8ERlPxsSkelya3wgLmu9lfEjBhiR3rGgc8AA5cLTS+CgRhaUMv7j0tkWLE9otMLg22D8kOkvTWZ2dsLLpOqAqjqA9PcSStY9AY4aDH9Ty8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISLzcZ3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9hDIR8H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISLzcZ3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9hDIR8H"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPTK81019200
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 23:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lAbDu3LgCPMIYNcgxgciKMjI
	K90fDsLAl1e42QECwAo=; b=ISLzcZ3ZH5GEtDNtgsEq2EjH1yP/cxtU0eZDzyCV
	bRAdMmF9E0Nrs7PIqQ2kc2dAipsBWCgbFiPk21PgH5FEjtciCj7e2xby4Y8cjJ26
	h62nDeBwyN9fLoTmiNpEBGYEqQndcKxIvqDIZWAn/3H70s7C4issU9dbv/oEA9Qz
	GXqtpEGHhskJ42SZFAXaUnNUgaIgHWr8oOn9QKrRb6dXkpENW3ufntQGXFyIn2yZ
	yMNbWPwvpSFaRVZAnadHiFYGaFtxHlrPFYWNJjaZR07YJs+URY4kfxMGRxhs7Ny7
	7WVFL2VrcT8FxBWd5jHjMe1WdYfnTC/2B8zUlFABeXijnQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj22u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 23:51:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so112787085a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783122688; x=1783727488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lAbDu3LgCPMIYNcgxgciKMjIK90fDsLAl1e42QECwAo=;
        b=h9hDIR8Hz9QtiVbcWk0eKl78IgeknkMVE2JfKz0m30LJAqnzgEQpCir+fsocbIFOKE
         uan3lr74I2ZHlUWqFk0H2nP1Px+2sG46bV+lUQQere251TjdpyvhTsEnU/s9RLRX+4Vh
         WThtBwTqDfaS3E4OfLtd948t04Y13ML2urrZLsPZP/Om82Ob1V6g858tjGOO5BMYm5Ps
         K3O8OkmE6KqKERy3QbazPGFQJ1YIpyOr5flSmQ04iSd2tNjrfFtKhgcwKWhLkkTEdark
         DtqP1PLKlkBttdprMPRjwlHUPV80IV4P9dWIq3AlzQU3MjjVymY5UWbA7bdet+Up442g
         i/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783122688; x=1783727488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAbDu3LgCPMIYNcgxgciKMjIK90fDsLAl1e42QECwAo=;
        b=M58wO6tmP/4KqQtqBx8v3Mye9htxNhtabOIdnD/9tTLk9q4Mnd+sDfJP5BHltC1Kvm
         Kx2UJKi3SwCta97da0yMLoxi8MVGkbKq2tQchF9M5StgBHyc8068hdUujzQap/QM1op5
         HjW4wqqwo+VLryiK/Cd5dJXxlcy2WSzynaKnTIMwfQq3/NmnV1PFmNhyNcXxYGBWqjDL
         el2SY8J33UBs/GSOsM3A7T25H3E4KYRWuBEHL6J9po9rW2rFogbpggdLOqW52CYng/NK
         nWzxvkyeqCsb6N3uB+TlZTmBjmmRKn99HCDawh7hI20nskjvv3MAbC7Az8/iT19cxeoR
         j0DQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vfdWaw0XfhHxdh3sQIx57dbojXhhif4y+8YMedx6PXo9S97gaaZV6EVVp/QKyIw+MTrNiGzY7+Olm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Oe2z+ejCyBzKpRr9D+XmxL0HTQUKg40LO/w/EtfDUxQCF2dX
	Z9iXKuTHHYjbbrdimJDje5Yu1veF2jsnz79C3yCRcAiR0ge4DEX3WoAseX+POYQ0Gui+wtozB8X
	g+yoFBj6q3M4R/pHO2jsr74D2WSBu+5Yxv68MahuzxsOfWzgAnJdgEJK+7mgtnPHG
X-Gm-Gg: AfdE7cmjvrEI59bFBTUsnSuQZ5dkbUkqH8TqDPkRvR9qBTZbt7Qut7ZthxDhtcgu906
	5Wtc6wFyFDT6bYeTcntbdwCKKPt5Ba4ftddz3WRgvW5VZOSKx6DjKJByYJBqVZjA0QWn0x3E7Lv
	FudMfuBtlmDCI1Go4IruW+gj/hLvjrUP9LoSucKmtVl6Umgmr43QoABXeM8WdWpFOd0LXf1oNyp
	QW5EuIKx6YEqH6Vg73L+oAY+6IMppssCcOsk2CtqBxziG4Xa+pvlTWR++pQfZql5itEXbTGksBk
	m8ZMIVbosCbMoBq+d+k6GBwVjXRIfeI3XdTQgjGwu34H+oPQtWAXg9Deo8K8aYigxc/CR2babiq
	bW7gwttJA3vNGE6QtZrWDgAS3EiIoDfbQCwq2MUmroq0E9yQK10fzmyRR7K6jIuwV4AbAfDa8IE
	7vqzrAxRCHdsNg+AbhckB8Rb/N
X-Received: by 2002:ac8:5907:0:b0:51a:8c97:938c with SMTP id d75a77b69052e-51c4c3615b8mr22471891cf.67.1783122687799;
        Fri, 03 Jul 2026 16:51:27 -0700 (PDT)
X-Received: by 2002:ac8:5907:0:b0:51a:8c97:938c with SMTP id d75a77b69052e-51c4c3615b8mr22471551cf.67.1783122687298;
        Fri, 03 Jul 2026 16:51:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5e87sm5234101fa.22.2026.07.03.16.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:51:24 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:51:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add missing properties to
 usb controller
Message-ID: <ht6l2idd2ph6xr6ycfg52255vz3f4dhniwdt7coa63jx2ex7ba@56unlus7aalt>
References: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MSBTYWx0ZWRfX5bgRnV7PAhTj
 sZQ13afnwOoifJ8DKECQaE11N2nA2Tz4AuDOJi5HUuWdxQREnXuKsWjGmaRCFiBjMUvkdZExJHW
 YiBiRZLDB2QRIzpYkJu+3STm22bJF9k=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a484b00 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Upnonq9QU9DbzT9GOcsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4v91_-3pZAGQUMipdxn_xWpZuY6ZBSIS
X-Proofpoint-GUID: 4v91_-3pZAGQUMipdxn_xWpZuY6ZBSIS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MSBTYWx0ZWRfXxYMEXc9UqlFR
 sHjKag9flMyXItr9qRdUvM3ItPa0CZ7j7Cv8mS738bmORadbOnblXo1jq/BSVgx0WjSWopJgSY7
 nGMvGbQq33ytAnkGIMqXFATjQSOfpwYPcud7kwPYEv6En1FresfH7xFiWb9pAiGm4k39US0RWcm
 wf+Y7MXa7Pan728SlLsqvmkoYled/TS+mS49M3UlRHa5xhkfxdpqvG8j/2LDH2HNDEK9BQc4K2y
 VAGKV9TnR0yI4/d9RSA+xFBlVBr4GiAMcjQdk3Eez8rtOK75d5R4NZAvzCScyV+6l5jInt+NqDH
 4bg0sykwLd4hVBaprbh7blAGuIAvJjefbqvqzCiNB72XRouBcCe/P0l410s8qA0Qg6u8FnVdi8o
 a1RZVl6jI+6sPr473u2FZzAEXaRY+KgCSgF0PriQiHuH8pnft5WCy2KHaICWFbUcMaLQlaNeDiC
 PQDpEy/desIdo9M3PRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030241

On Fri, Jul 03, 2026 at 12:14:40AM +0530, Krishna Kurapati wrote:
> USB controller on Kaanapali SoC is capable of switching role betwen device
> and host and also is a wakeup capable device. Add usb-role-switch and
> wakeup-source properties to the controller node accordingly.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
