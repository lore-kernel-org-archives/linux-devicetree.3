Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CC8301471
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149992; cv=none; b=bcGDEeUMfzSajcP+RL47ZDc5i33VcS+i4LN0I7RbIWfNc4xtBkSzKIeILXU2M0JaziZCRMx34sxDTvZWCpejTM5+33iFqTCbyolPNWUbmDoP5bs9qN5FounWl0RP+xM8XTP78K571wP+y45ldmwifchStnwEjL7teeTo0OwQYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149992; c=relaxed/simple;
	bh=303Fg0QMxX4hjVtM65FCJzlhmS12ypPaA+fXGiFZlRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abSR3krB84h0vwj0uqMXT87O7+VLhnbrz0GVGA3lyiKHOqWOh+T/zSU8/TnkJ9W5Tzlt+xQFIrq2fVyumrbhjqKdpvVN7RyLMYuu06AiAS72Bnla7xSx93hxsdeUIPiQ7BGxPQxT/ZKbks6Y4XxPDytoJXMFFRMHE+x713+OCic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELfYzCJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWniNTMZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELfYzCJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWniNTMZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6SvKX2633413
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+DOLJvJH/mXgJijyVkCWA54N
	UI8M8RWmKWaTdokGLAc=; b=ELfYzCJTyV+18YYYYGT+25lFve0ZtJ0cI/8d8wSc
	elStASSs8tVW/JMxSd2PyRjyC3371xnva03qvfwVWd9SAch54kq5BTX0FJBuQ8h1
	d4WrV6Zh1blZZaCUI1NQXsR/BGmTtHuNoK5EG7/l2ntqo0I49uWKwLEoH44S03TJ
	3GIEQNFVc5q73x9Q3qZsfG7o0llFXMcww1KSeEUfOqttbq+t0ySo30VQQBR7yDIp
	GQNJC15Wx1qCBBdvnGCwgIz6dXGg5QC4zWTxE1bcaBs2x1raZR0+ScnPRqFsAlI5
	4fDRTY1tgi8SXp2NHAKASZioJkFxtVVwQMOdyfsSUHniSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86c9fmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:59:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d9da2559aeso6274078eec.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 23:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776149990; x=1776754790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+DOLJvJH/mXgJijyVkCWA54NUI8M8RWmKWaTdokGLAc=;
        b=iWniNTMZC5Q6XVCdrC+CiZ114jHR5+jiFUa0Br6yNXqtAsQ5qmYkb5HSvHF0mKFB6B
         OczarIiP5cdIOmnaXslko5Hy11ieaXXOaIuU+TyJdRjwA5+i05AEOioHXPhgIVOacVia
         Mz3uU3DLYuxF4qEsqZ0mO7TsxrNVnqyEabkws5IwxdDngCRF6FhYrlNFf0yY/ENeXe4G
         dK9VP+JPsVcxrXceFRk76LrA0BpXSWiv3wjxvzaC9+XLR18L+aGzNzqVEkOiDFbU66uK
         tmQqC0UFYoGymZtGkjJJ0p9nXonyQ7ZB9QT7u/41eCRX6a4iWj2ln4d0a3DqCo786AEY
         2iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776149990; x=1776754790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DOLJvJH/mXgJijyVkCWA54NUI8M8RWmKWaTdokGLAc=;
        b=D9hOfh4x7BG5g/IIesurPc6Nwc9kSdo1ajy3fgsEAawYt0lu1vpZoWcl0rUhJrPwTu
         pjbQlNx+5DXAh33z02A5h6g9HuXa+LQo2AbM8b1A5lcl5sTXujdGjCAy7pUbO0M8SRJ1
         6UlSz1bpYeeRwe8bjiA0FnJ5b3Omwq33GMbEYLPLjYEUQLiLPjArNfgE8HmZgzYK+C6f
         I/EcZcmfG7sbXClMEtBfHnosGd6RWeY8U7r8dxaGHavXO1nWsH+0e+qVb95XXpKsVpIL
         rlzQ4EtyFnc09iCev1SG8ia5QHaZWB8tUn0ZN35oRcJ9a082VEq/zfB1E7KA2nGhM8qN
         D2Sg==
X-Forwarded-Encrypted: i=1; AFNElJ9bq5DRMTdbhFwx+WmZk0UoFwmmZT/SuK/0h9v+98z94I/656hsmMFUxZLwpb44xjrsJOm0RhKZJvdC@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKjmFGiRbo21byfOmhd6K9NxOSV7AoTVCh+yjxUw9fOjAsSeC
	TTmEt58MIMO+5WBAh2XevoHGo/xitzIu+Ry6pU5Ob3iW9TjV3Mmbz4dq3PXbDW4wMYQKsdUl+ZC
	NcFzO1ylKgOoDU6ESs8N8ZfGUQAJ/hGsrd6ftDi/BqmtWSfx49JWnhiwpSABuZcrC
X-Gm-Gg: AeBDiesEv71XrmaLMgP57t3MATB8omg/SONdpRv4rVJuo0julvsM+Fm6HweTTiqu0/A
	aKxsSWP3sgXnYiNpZOXLDCDzGOTd0eDa2WQO+DdRV1yAunjdoFitumkUZfpqEYyh8ePmDbrppiB
	pNhGziHmmUI84cljd9+qZ5pj8BPq2MZ1RbIqYP6iL2NnAb0mPlfHDrlR+w3ZvZWidxYXlX+U6Wn
	WhZXhU5tddBDmx4wtTqlL3GDnPbJK1TL2WtRTprUKhYXd8tS9U+OTjjxCRPIEmQz9tmAhgPBW1E
	V3Kd0ZomO06R2AjddUFk+CnHV7DfL6y625dxISGnziRIHNnUKz0j/Tttr1nKT21RwEsluYkrJPx
	g3xSk9wivItIWKBGJvHjjWzIoZjwZdaJw8hH3MNsnRUUVfFROvG67RaH7V5Ny8Fqk
X-Received: by 2002:a05:7300:320a:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-2d5877a7b8fmr11003069eec.8.1776149989947;
        Mon, 13 Apr 2026 23:59:49 -0700 (PDT)
X-Received: by 2002:a05:7300:320a:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-2d5877a7b8fmr11003052eec.8.1776149989391;
        Mon, 13 Apr 2026 23:59:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d8dee27fccsm9050136eec.28.2026.04.13.23.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:59:49 -0700 (PDT)
Date: Tue, 14 Apr 2026 14:59:43 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Message-ID: <ad3l37AXKvzRrafU@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
 <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
 <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
 <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
 <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
 <d671229f-1c9f-470f-b1d1-7d015c0721e8@kernel.org>
 <ad2WsFuUjtcjZ1wU@QCOM-aGQu4IUr3Y>
 <27f57fd6-71cc-4f88-9d8f-6c6fc778008a@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27f57fd6-71cc-4f88-9d8f-6c6fc778008a@kernel.org>
X-Proofpoint-ORIG-GUID: 9ym9OG3TlhvbZGWrqPDDwHjJv23CTGTL
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69dde5e6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=9_fcD9zaCt7FvQwzOaIA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MyBTYWx0ZWRfXyUZLBvAyuYmo
 RwRRAK2xyS0UhvA2Kb4IWjoLyFjQbiNm6tj8rhBqGwmQB0I9f9E9oKy/vdoNby0JVelCh9+tK50
 5DL+OKei/24tOxFeGaczyLLazlR7nwUhi9Lsj6ikQ0v5c+JOuu/Niu8Lf5n3A6Q7vX+1ISqVU2t
 OQFEEMsYeeTobuFgcmV2X/WJDjv1eO7HuGxbZZr50xM55GrTgxPiN2HnAvYTVda2b788Ql2kDIt
 if6cvG/fnJ6BGrlEJVMhgRmDxkjz/27nOgq6YRIPHEkgrTCgyIRFrR0GgWM+9B2T5ZRR4Z7gQ2t
 PzgLmq2Pt0qdKdv/AdDILasV6HUodAk+L1Hpkxzg9jo0RZ59RaLjDzAPiA69Qc+GHYoFJrm/Jp7
 GNGsl3XcvgPdmAVFJwpeokv7sYm+k9quJriXgJQ/JZ8hMzKQOFOzA1SV0S5lEbuYlbJKnVA6N2s
 FkvtsT+oaJZpZBpMSSw==
X-Proofpoint-GUID: 9ym9OG3TlhvbZGWrqPDDwHjJv23CTGTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140063

On Tue, Apr 14, 2026 at 08:23:12AM +0200, Krzysztof Kozlowski wrote:
> On 14/04/2026 03:21, Shawn Guo wrote:
> > On Mon, Apr 13, 2026 at 06:08:49PM +0200, Krzysztof Kozlowski wrote:
> >> On 13/04/2026 16:34, Shawn Guo wrote:
> >>> In short, there will be Nord DTS using the binding coming, and I do not
> >>
> >> Maybe there will, maybe there will not.
> >>
> >>> think posting them at the same time should be a requirement.
> >>
> >> Well, it is a requirement as I explained previously, said that
> >> *multiple* times on the mailing list, documented expectations in
> >> mentioned/linked email threads.
> > 
> > To be honest, I can only read the following from mentioned email
> > threads.
> > 
> >  - Binding and DTS should be organized in separate series per subsystem
> >  - DTS should reference binding series by a lore link
> > 
> 
> The links told explicitly to organize series per subsystem/maintainer.
> Who is the subsystem here?

Rob Herring <robh@kernel.org> appears at the top of get_maintainer.pl
output, so I guess it's DT/Rob?

> > These are what I'm trying to do, and I'm not just posting DTS
> > simultaneously.  I do not really read the requirement of posting
> > binding and DTS using it simultaneously from the email threads.
> > 
> > Taking a step back, even if the requirement is mentioned in an email
> > thread like this one, I'm not sure it's the correct or well received
> > way to define a requirement.  And that might be why you had to keep
> > repeating yourself.
> > 
> >> It's also documented in submitting
> >> patches in DT (although not with that strong wording).
> > 
> > Either I'm blind or reading the wrong document.  I failed to find
> > the requirement of posting binding and DTS using it simultaneously
> > in Documentation/devicetree/bindings/submitting-patches.rst.  Could you
> > point it out explicitly?
> 
> Rule 8.

This one?

  8) If a documented compatible string is not yet matched by the
     driver, the documentation should also include a compatible
     string that is matched by the driver

Are we looking at the same version of the document?  How does that map
to the requirement of posting binding and DTS using it simultaneously we
are debating here?  I'm confused.

Shawn
