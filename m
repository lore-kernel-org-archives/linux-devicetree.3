Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096823E9289
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369054; cv=none; b=k+GuJL7r1UskDuUQYELIdivarXNgBUmleX7cqfTF4DjHjbV/tlZwwHVvi1zoVieB9OI+KhlDtwDzjCbJg9nrioVjkEKaC6sGrmt6G75dre+OCgMps86IhArNtwDMTPczQ+N9ToI9ZmCMAMcqmc72zNE/umFu8WrINs7iPADy/Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369054; c=relaxed/simple;
	bh=yX/ZH3hQoxhONz/+TakCdkZaTGuaUEtsesO/EgiFBDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcTZDcV4x7wydBkO0qpfbfv6PHZ7qiIk5pN3P4nzgy4k5WjKTVr2xlJ/Y7v0nmIhK6UgjkQG6Og/QgBP12Cs7MGtPpRMJL6EndQNhlIzhqs1Mq5mlAaupPaLnHqE6ivAfYfDDHh9a96DAPhVKchOK0qhif5h/Oez00onKUahins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmldXr5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuXvjSbZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmldXr5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuXvjSbZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC38hd1817277
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oqgwSGDGP5+mYlE+BUXw0J3S
	9EfTkX6r6S6ZrZbik/A=; b=AmldXr5O7UsPWkOGNDAjpIJqjv0Cjpo5MrFUmS1H
	Bo5dEXGWpmCnX9pu14nYoIsz5MO9CZn0PsiC+IuVyIvsdKb7m83W36jQo/PtRXJK
	ihw0zUnM89X7mA2NtMJHzyUMDsRDkEPsZ3WdtVRzDdhIpsvL7mVbYHEnScxEqg7G
	hq8SPTNJD0OejqHqKvBwHrMysIRxx2YrFuTXkq4cU/QKEYQmS4KO5vCnY9m692hr
	ENC7yHCJRhINw4xbUvkWjC7lJlYbx8qrxnBJuY/FKaX4pQr4qXSRnVnRJhDSmc/h
	98uBy8PuWhVKrqv+3bqYT0um5O0qVmWp+eLakpZ5P/GP+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9eh1mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:17:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50925fed647so97620341cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369051; x=1774973851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oqgwSGDGP5+mYlE+BUXw0J3S9EfTkX6r6S6ZrZbik/A=;
        b=fuXvjSbZKQcgrqg9F/xNhOlaH++4M12ZC3vpF8XN+JUZ0ZjWRVK04u9kTe27dV5uE8
         oC0KurXVixNhNTj4gRRok30HYY/KlJgY4WfEGuJDgxjIb1cgLAtGajlYiO1+gLk21Xxg
         d9iFLqQu0FvEMiDufu7Gj6kJIGCFRCR0qNFBTgjabd/HVFuAChbuFWI9AOxxREIbqgq3
         g7Hbj5li0i+by1yCHFVAYF2OfunkgQXgHcAoQjWhRVztC1aqvPlrICgBqhwjpXIG4C8h
         fT/P4hH427QCf+casriH6/FgvA380N/QxaA0ASFh8sFqJwDsZLs6tLPSihkqy1Qb130e
         sg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369051; x=1774973851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqgwSGDGP5+mYlE+BUXw0J3S9EfTkX6r6S6ZrZbik/A=;
        b=CU2hnhZQnQBkt+BtapWlSh5ix6zI8Zy3lhW+dHCCxxBpnoKCeqSrK2qnRlNOjFN4Ul
         8maj+TEJZ7qF2GyHH5WRXCAAM4d0lYGwCrRB1E1+Kc/+FkjHF2If6mOiHeDQfYCpA31A
         KNSjY534iq4akn0FCbNqHPbRUq2BD/E9nUtokJSGWLFTKwwROKze817JlIScEfVHjeWJ
         /+HzqvuPGAwBsNXz3D0yZVNp42jEe5BNxSff2VaesSG3+28zvVfhR8ULUV0/UQRYWGGr
         7/sgu9Evo5/k3zV0F51JtD3rorNPIZLuWQ/ne0tFBDqxUuzdcdNIadOgeMH7GSAFfZCW
         gy4A==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1vNgNYl2Bo0BcaPdaiHRKsbu2AXArKXaMQ4YsBgAfhv3SHJAjZDe3aEpPCbt6JN0W/F1xzAmUuj6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4zO2qL6/GYTWDv5WdHJfEHNxgJQ/DQKqI1z1xEAOfKYz0U/22
	X9uZMLH1Zupet/xwrLUNzxNcOEnUiUrFBUG7T5B9YAfz8CRCdah998la5k9p15Lj6dKpcWVVVYp
	kOHkSYTWVfAmpBLq074N7ljo9wDcwSMggchpi79WX6QS0769gKF4SCDB9VPAGwEJ3
X-Gm-Gg: ATEYQzzApM5YkS3um7AapkadboU612n+3o4HlFlbICiKJUhHVarBlf/AUe+b1W4ALZT
	HQ7IciMS5USdyUqJ14RkykYd0aKoNNZI7/Vj9hS7dzVX6pxYbeNzyjr6fOK9f2g8ALKqdQ9USbl
	zbNuHCB+X8cT7K0onffsTcPb6NHhYQPUH+YmYFqQfZsirdeSmQnA2SWbB/gBSwJfIlbsPqGFI+B
	WTymTJmoAc3aGBMoPNE2zKYDYBHM4ALd5zaqrEFAsJD1sNsu59W5KS6lUmxPd678l+Q+kW9Y6xj
	IWuBkb+EzCi3eAm0DiC8dYcCXIc+7xK1cY1SBKSqGwauc3JbhYNDBb1lOZHMjIg/qEswSZOWiic
	AcG4l3mxz2Rj96MsOZz51NHhRhGtMzn/CoQ==
X-Received: by 2002:a05:622a:98d:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b80e8a543mr3066091cf.48.1774369051228;
        Tue, 24 Mar 2026 09:17:31 -0700 (PDT)
X-Received: by 2002:a05:622a:98d:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b80e8a543mr3065341cf.48.1774369050507;
        Tue, 24 Mar 2026 09:17:30 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48716547649sm316795e9.0.2026.03.24.09.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:17:29 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:17:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <45n6n3dbdcim2jzaflqr7yvyn3efkhi26dubnd665r52vtb4aa@565zb6kxzoel>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
 <acHxosznN-xbWtjJ@baldur>
 <qfaaehigddfg2mawxrat5fp25zu4ioo7ebc4pnojsrzwwx3kk2@4ke3phfbmk62>
 <87749d7b-b46f-400c-bc0d-932b15c7a75f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87749d7b-b46f-400c-bc0d-932b15c7a75f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _sTeCz_gOQeAR_hoZxTIRUTzkKr2YSR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyNiBTYWx0ZWRfXzCgYx9QglQEF
 hNOptY4r3kOREe/jTmDyn6bG1L2E9i6ArlbmnnqJgXtYtZFgcWUz/YrhozZgJW3xSFRi7fENlna
 F6rTX9D3LtbVO6tFXySdzSUDU9NKzqCfmi+7ZcGHFW+mowLij4Y5VvQ+JNOfnX2sO+wU/bVbi7J
 svScX7Q6rNygmUZchXMNsKpDtj63ShuBEaQEBu+u6Hq88WwGYzb/b+DCs5zXfBK8Vn3zCY8iC+d
 RA42lK7ovAForQlhZoeFOgkxqLKn+t9vocVtSpO3dxjhKTTYJya6E3+VAuJdVGola7kP2VUEMd0
 mjS6EovCHeylsVo+XHuHwF55O9CaM4H3OnkLHKqDNhMRcjQn3Vu4t/1PjbqaQwZ8/KQcJaugY72
 TF71iyNEzuZ3ixHPxa/WKJolF5VT9JMyBtHwzoILnNcugKPLR28r9W8D/TASui97Pm8yxEwC3yL
 JrEvE5/pPZW/YBsZ5JQ==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c2b91c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=HL9x7WhoLHLwXc8wI8sA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: _sTeCz_gOQeAR_hoZxTIRUTzkKr2YSR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240126

On 26-03-24 16:14:34, Konrad Dybcio wrote:
> On 3/24/26 2:45 PM, Abel Vesa wrote:
> > On 26-03-23 21:15:12, Bjorn Andersson wrote:
> >> On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> >>> Recent discussions off-list highlighted that the GCC should vote for the
> >>> RPMh CX power domain on Qualcomm platforms.
> >>
> >> Your commit message should describe the problem that the patch is trying
> >> to solve, not the story about how the patch came to be.
> > 
> > Sure. Will fix.
> > 
> >>
> >>> Without this, RPMh may not aggregate the correct load for the CX rail,
> >>
> >> "may not"?
> >>
> >> In what case will it aggregate the client votes cast on the GDSCs
> >> aggregate to anything without the power-domains property?
> > 
> > So my understanding was that RPMh firmware aggregates votes
> > internally as it knows the actual parent-child relationship and we were
> > supposed to replicate that exactly in kernel for reliability purposes.
> > 
> > Meaning, in theory it should know to aggregate proper load for the CX
> > based on GDSCs voting, it's just that it isn't always a sure thing.
> > 
> > Maybe I missunderstood it though.
> 
> GDSCs are fancy on/off switches
> 
> RPMH votes must be carried out manually and in the kernel that's via
> RPMHPD/RPMHCC/ICC

Right. Thanks.
