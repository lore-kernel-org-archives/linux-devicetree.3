Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76733C9EF3
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085869; cv=none; b=p8d3NX+f6Lkl5U+AS8gogJUcKg5Q1Z8rRBhqkMj4c0HsZxWaYn7sESIA0AJVZbQgJgFygprHy6QwHGWdOozdJSpY2dKPXJo5aU8m5uD0p5dAPg0iRYI+0vtLh73xAM6eCkKfP6SZx3MNrPgf+ZA7KglUIYGE2v4fZjNK9YW4YSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085869; c=relaxed/simple;
	bh=evUFdVyHsW2Im7jjoa/gFza/lMdE0CYcZcTm5CpWWog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjoafvWgA/OxuJVANb/RMC7qig14wRwfoZZUYsOvuL23mMUnKGOFr8XKPBTzHCi++pD2VHv7kxQb2xMRKtKknLdvnCriLmIH23H92TPSQUy8Lx+yDlBYg+xPzP07htIBHw9f8kCP5S+TzFMG4Ax3h2nf4ustIiaHzLTKux/eoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoKfm4WH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeyWC02R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoKfm4WH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeyWC02R"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DBQJPt531170
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 13:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eL2JulX7UUraZHdWoZm0yJ35
	QzbgHzWQBoCIvD75HHg=; b=AoKfm4WHLuTtcu+GytWlnh7dC5icj5ywgqMlzyBO
	GagqiMMX0BBNdiQH0UHlzQaI3x0Ooi5FESmkPswfHXZWz3liGhJBQ70+kkltXeb0
	6lbQy9+O9iCbMSa4XVKkhsSujOMyCWw0q7bLTnFMCe561B6GD22gPI2LT1rnqS3d
	D6706IF4NO2SOBHIJC56dbIbRuv8h9Bk9f8ShKYfc720UXCTeIU8Ke8OUAmL/Gah
	KTfSseyTS0XmKF43aaJK6+UPl2Nnlr1HFPixrjxBEOVWHvYK02Gg9/4CpjdllyvN
	msmm6sYicsbyYjKw6KYCN4hWQ4a7dWDcVov2Z/SMdbzCmA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2bdcw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 13:11:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so8612698eec.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776085867; x=1776690667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eL2JulX7UUraZHdWoZm0yJ35QzbgHzWQBoCIvD75HHg=;
        b=NeyWC02Rm7m7YcieNgbUXt1KBJWhnFksXJo48+Y6PxanNUGr6Th2c15sQykja3RSTQ
         erVyAfAVk2MpvM7u41f1dUY5tTRzb7YlaYaZ7JbTFMu5HbTHv19dLkTCJywI/G3vNPIX
         8thPBykwt+KuQdidZCv2yxisMJWAvxb2pOmtRtDh3xkSc/6GUgkxdbB523qAuTItpAK3
         YxyvudPw8+wfCbyr6zwLLLUSwBXehMtXNCNGMVHoos7MVZZOzUqw8FBi8Q9v6zvGp8Jx
         2n7cKa7zJUElNJyBkbNrY/jCYBG8u0yRimgl3B3gEhVFBDp5iDqBdPGlI9o4dh/uNaob
         h84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776085867; x=1776690667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL2JulX7UUraZHdWoZm0yJ35QzbgHzWQBoCIvD75HHg=;
        b=LIgjKjhg0qQTKFFQ6dhQtKfvcW68NnWH4F3x8I+Bfn+tQ/g/l4/EiqJh1TgGcIpExQ
         kQIAnSilhpKPFwUmjRw/Q56+6NThMaZ86cTggxZj+WWOsgwwtkaKQ3yJyTBcWbiE2R0n
         UYomeTyQqhGWUBOnqeNQ8RW3ZrqAScxAEKM0nEz8h6KjRmUKcw1AqBt5EIU0oDDQyreI
         p+Xnv8v1VMGUOGK3nhh8rzQV2NxURK9uQWL0XZR2jD25Iz9j7rkQrpjkxWnht+CqlsUI
         e6Z7xfwXfxIlVm4FWOly4ayfxyIQoAEcLIJyBgnbjxDPkhbtDsVcVta1JLmeQX2P0QzL
         WJGw==
X-Forwarded-Encrypted: i=1; AFNElJ82FMutJBJv8awFd/Y0ErYmAn3J3jGj/uDQFC34SKDLtOu7ULrbwr//aZ3OGmTtXPqoGvyNSh0iGbml@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ95Xexu20o90OGCtiP6vuHuzQAd6DRAgmIgiUHfme6GjBOi4B
	yALhlmdVPWQkmcdZBsUqT0byiI11sNRCdvDwyRx+kybuZqDY779lRvHlH0BJPN5QI8MOUBoN44A
	wG49hp9gJ1UsXbEg5TKVEe2CqrMU5DOCZgk1Y2dQLkSZ7Mrd54topX1RdAvQG5QXn
X-Gm-Gg: AeBDies+ZSjkx2aefsn88TjUP9jBeMWkbaTSR5wJNwjsuWYRD3D/9l9HgBG3/7cG7TW
	fxIO3p1SHP2uqbwFJR8N3xxJwkdvvO5lmgWbXaE5fN6ahU1htNVK9tN+OGINl/NA60ypC5KBKo6
	2rqbGyzfwEIU67aR+DdQ2YsKF5uAqmH2KboDI+wJ5q+dJZG9Rao/TTqJpwWWsbc7YGUykXqjKS5
	zt/L/2NoXYup5Urcw0BRqtT96YuVura6VZPZ+OGNQFJWPWGmBfpEfdA896VkcFPYDO6s1luIUaX
	VuDt5sWdxwk94uHktOr/bwzybrzT28/1tzJwYkTWpTvcSPHLMF9+4PTzwvqOVT/z7TuTOMdKaz+
	5nJEo3arYBjJiw5xgvH+/T7GRfU4h1aoBNjUbk3G3Y8EqzPjxZEkW8ysHH9NKh9lE
X-Received: by 2002:a05:7300:7495:b0:2ca:e4f2:31ff with SMTP id 5a478bee46e88-2d5873adf3emr8307092eec.6.1776085866531;
        Mon, 13 Apr 2026 06:11:06 -0700 (PDT)
X-Received: by 2002:a05:7300:7495:b0:2ca:e4f2:31ff with SMTP id 5a478bee46e88-2d5873adf3emr8307052eec.6.1776085865994;
        Mon, 13 Apr 2026 06:11:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2a4esm20589691eec.16.2026.04.13.06.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 06:11:05 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:10:59 +0800
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
Message-ID: <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
 <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyNiBTYWx0ZWRfX2KARRi9emSYe
 yj7uKObaGx6aoR87G8HDjjcmAGWtAHScH0yeFHQRT40pspWgwo/NgbsNOPehzFLnZGMTcYluiXa
 5V8CpYhIEnNlmLGKu+cACQy1vHDk/HndkfxK6FiCVu6KjeixMtlKpWNHpwoq9QPo9TjgB3Uy3va
 1xoNYQ+MiuW8aFFSueSofBvA5+qOxrNXYj8foGkDiAxAYzwoUcqKDvvkM/gaZ/z6F3jgLPgzaEH
 DJ5BWIdgEBcTu1EsjJHaG8X28nOBk2dNk1cRNUyBqbp1/BpBPjcHZPGEtmvUA/5YPbemtVwPzl+
 nykYvMp/R4VZfbZ28EqlidwUWUq+77Pbw17q6Clth7VzBnWSLxI3y61hEBj7z9ACLqz1moI1krr
 quxAJr+iINhnTjb3XbskwjB75QYnr9lS+ccdSPkpBmz5k+W2UZThvB6GSHzwj8F3QYGcyrvd1Kr
 awr8UWZBwClAJEoZbwg==
X-Proofpoint-GUID: Y7h-x8ZkufnXa277w6MeHV6FXpTNn4xD
X-Proofpoint-ORIG-GUID: Y7h-x8ZkufnXa277w6MeHV6FXpTNn4xD
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dceb6b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=nxruWQCVwtlmZxb2w5cA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130126

On Mon, Apr 13, 2026 at 02:40:18PM +0200, Krzysztof Kozlowski wrote:
> >> Please organize your patchset correctly.
> > 
> > Are you asking for a big series that consists of all the new bindings
> > used by Nord DTS and DTS itself?  Unless this big series gets applied as
> > one-go, there are still chances that bindings get into a kernel release
> > without any users, e.g. subsystem maintainers pick up bindgins being
> > reviewed, but DTS requires more iterations and thus misses the release.
> 
> Please follow existing rules, communicated multiple times on the mailing
> list. Qualcomm also has internal guideline clarifying this.
> 
> Below are some upstream discussion clarifying this:
> https://lore.kernel.org/linux-samsung-soc/CADrjBPq_0nUYRABKpskRF_dhHu+4K=duPVZX==0pr+cjSL_caQ@mail.gmail.com/T/#m2d9130a1342ab201ab49670fa6c858ee3724c83c
> https://lore.kernel.org/all/49258645-d4d8-44a5-a4fc-b403c926a5d1@kernel.org/
> 
> And how to do it:
> https://lore.kernel.org/all/20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org/

That's what I'm trying to do, posting bindings in prior to DTS, so that
when posting DTS, either bindings is already merged or we can refer to
lore link of bindings.

I still need to understand you comment "Bindings come with the user".
Are you saying that bindings and DTS in different series should be posted
at the same time to show bindings has an user?

Shawn
