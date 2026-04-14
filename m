Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C29238B13E
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776153671; cv=none; b=SalcuEKnFMNIYSSdIA12ELPU3IzZRhQD5nRYAMI7uI4bUSijdsMoQ8S0FtXbsY1amilkmC6hvfDXR1D8dgBFYkoKss5n8m47xMQ7yURHlbj70Q9oWchkRzf+Jj+1RcTA2QrVOY1ffaEk0+ZbufdT1UWRRDBGtqlCPk7S2OtVd4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776153671; c=relaxed/simple;
	bh=s/9uwUT3Y3TIoPKem95eIUGFo7ju5xH38LWZqbfnqNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDT6+gokhT/YUj1Ae44L3R1B6YdmQ/LfSr2RqFaUGkWjE74e9ZwR2tPq6WcGEnA28Ozwfbx9AzBDXAQGfDBl1SovlJOjEddWGp2cDqwhWpyjEMU3RMEZadUJlDBAgEnRK+nh+UdjMdfbWwddGQnKlZFd6Io9d5L9Jyt17vxSJhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFeukI85; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVY9j1uL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFeukI85";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVY9j1uL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XPqj967332
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1xuLm8s9vE/9k7EaKH7oJwTI
	LNIKZni0Y4sEIKMAt3Y=; b=aFeukI856vdAfDIu+zdiVLpSdB3htmXuddwxnOFy
	ZmGzeSPOz3usOMtHhbSRGtpZ13JhlDz57m8ff5MgKMTZBH7EhFPfLR8lSy6Mm1iF
	fvU1h3dDBqPFsQJwtM2Gvhmq9qkNKOxgFNbmMPNauf+G6LYKxM3Acq15nlCI2oHz
	cOnlX0XV31gZSfcAwDycXe76uvOtYf1kSuR0AeB9N90FLWoJb5DIoQzh3gC9a78/
	1SwzyyKBtxn2C65wCUFW6As5fYYoHS4RC8cb+acGuMd/mc0H+iyO8UtvQtfWPgpe
	1VmVXpC3DdPPIz+ncuLAcwJOjqgUIf6U3iVkw88ErA9grA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v1msv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:01:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so7371644eec.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 01:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776153668; x=1776758468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1xuLm8s9vE/9k7EaKH7oJwTILNIKZni0Y4sEIKMAt3Y=;
        b=EVY9j1uLIaV7mm2lrfHIZuwNXQt7cSDVthNW6yhDVmuT2SbZbXNIYDJ89vjEefZUmc
         yNZlBIlJjK5/mRz1quHE9PdsCpud4r1rRsXke+M7/1NP6DV4B3gZTFN7gwPzOo4a/8vt
         E2IBP4PrZaf0HNF8Rn6vj1rPAvytloFu6njzOtfOBSo+2PYZSk4jP5KyefcQMGPOOlDW
         hooY78o8+rcHNvz8vq2oc3w4re6AikmI6m4ZBvCPk22lCXgDnmV1yhA5JSvlnodg0u0/
         hoKhZYHHBNTwGpliWsj8y1XMcRWNMsK6K8Z8QKO2xfcHwHPRZpoffXh7G01TFSvX25ry
         S0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776153668; x=1776758468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xuLm8s9vE/9k7EaKH7oJwTILNIKZni0Y4sEIKMAt3Y=;
        b=cIMgc3bPYH+Un/EfyV4bX5C/zyFliwvSntJfSICxIrI4ngxnIUgyumZCM5cl0rzCEG
         S6h1Ezc81qiKJVzgfUXha8Lbsd/UoCznMhIB4oSpGADWmvvHy+2n5AiWrMtaP2IQatcR
         sQLtSCqnsnlNDcviI55Slq6/zB69gOw9VABw3es4ROgEzcwkt6NXCqjr4Ctu5xLNy5Ax
         8PF7vRU1B0czfefn+f/Qi80XyD0z4lW9VF5j3SY3BEYPoaXQaG3tQfwB+//LLS9YbsJc
         p1jarraSMUxXpntQHNT7IQdyAYGasb5RrHxTQUE75VwxB9DoWM6GJknNifWjwZBfXjzI
         t9fQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eTKXvEHPLjiS3NSsr9lJWM+Gu+/b5DrEM9mfUyoiXbl3o9FMR0yE/Rd693uBHkieWyMzWda4+OEby@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1snhRjeLL31LCTbLtIjWWh/TP8qyoVw56bb4h8tw0LgHjm33U
	RNBzffIISld1nEsJUU3YqpBZZXkVnnpCocIOl8Y+gCssWLush90xHT+b0ZwN57JIfRrquOniMQN
	qjDlbXANBCidAT8/MfUR+d4OHJTqIg3eySSRVcc+f0u70z1VFCU8u0fQLAoqTP8AC
X-Gm-Gg: AeBDieunDDTjjeI7uroxNuq/vEAE7Sx5tgZ0pMF1Cf7XqYLdaxDQvJmmzRJybohm0hF
	Qn96zblPfKQn7MMSqNGLTISLgLeo1gUoMXogN6gB7d1C3ZT9cTyeLCzSVre1gGYfItMoNL2HcD7
	ZkQo10ATKvFe8JHhIuLP4i6Y8ytV4VjhciE5lmWLldrXoxUyNncpbwB/X9pbA9qswWzpyRId4MC
	RbQgvabaT6h4bmIUn1uIObcVtrTOTIavoTmV0VQvufuDuAnsK31z7sItTQXwlBl5RkV5Yq4rasI
	Gy8RmYqpA+SLCPAMg98JDlqvUW+5NzWpipg7uLRDqUsi01uKUrzSlh33wE7uwzgxvxdRqS0mQ4S
	4VkPTZAcKqhHOfNUszf76ooDsEGb685GXChl16yvc+dLwohkg1n5NJVw0ZRyfrd2N
X-Received: by 2002:a05:7300:ed0f:b0:2be:80c4:2c8c with SMTP id 5a478bee46e88-2d586fa6021mr8938096eec.8.1776153667683;
        Tue, 14 Apr 2026 01:01:07 -0700 (PDT)
X-Received: by 2002:a05:7300:ed0f:b0:2be:80c4:2c8c with SMTP id 5a478bee46e88-2d586fa6021mr8938065eec.8.1776153666670;
        Tue, 14 Apr 2026 01:01:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d944769298sm7724195eec.5.2026.04.14.01.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:01:06 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:01:00 +0800
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
Message-ID: <ad30PAMHxq5QErxx@QCOM-aGQu4IUr3Y>
References: <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
 <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
 <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
 <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
 <d671229f-1c9f-470f-b1d1-7d015c0721e8@kernel.org>
 <ad2WsFuUjtcjZ1wU@QCOM-aGQu4IUr3Y>
 <27f57fd6-71cc-4f88-9d8f-6c6fc778008a@kernel.org>
 <ad3l37AXKvzRrafU@QCOM-aGQu4IUr3Y>
 <e80cbf58-3701-48fd-81ea-2fe6007221d0@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e80cbf58-3701-48fd-81ea-2fe6007221d0@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NCBTYWx0ZWRfX7AWC0cqFIV99
 XOk/oViRFLTORR5JRZNWQEifp5s1r189C/N4lyo4aokqL0E7Hv8PAj7c0mK+cyXEGg5/p6kDjiF
 A4i07W8KdTmSE5XyBAzuVYLdsOEA5UdbBdkR2ftbg3g3dz1JTGW4amxlPo4kE3dzg0fR/3o+JBk
 sjSsv8hpAHoHScHNkrGt+ambjF+hmNV5ultIObEC3ZvCQLJh69Ga/68zOHW6IIOQZOMbi4grySk
 Kw1PobMuR7gn6mJJIg41sXY/jW5MMMggvfuE2O7w8RbzNYFlDEuAEr9rLt8uCGJp5WjMzz9zbk4
 xo1zfSmCgtlsyS8TidgmXx4X1k8gFepk7PNn9pomiEgfVq26hroYBELwfWSYApN/FbcbpxMV6d6
 r8+hdEq8/FuVl48PtT/uXBRmJmvPjxVSPJ3ord6+PT0H/DW1G6LfvT2bvMXWNuW1LF7oRdCaS0A
 CntL9bKcKrb5OjcjiDQ==
X-Proofpoint-ORIG-GUID: ijJ-7VslO1oPaW4yby2pEwojmMaBaT0L
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69ddf444 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=M1xjTVqJwPd6Zf73j48A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ijJ-7VslO1oPaW4yby2pEwojmMaBaT0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140074

On Tue, Apr 14, 2026 at 09:11:38AM +0200, Krzysztof Kozlowski wrote:
> On 14/04/2026 08:59, Shawn Guo wrote:
> > On Tue, Apr 14, 2026 at 08:23:12AM +0200, Krzysztof Kozlowski wrote:
> >> On 14/04/2026 03:21, Shawn Guo wrote:
> >>> On Mon, Apr 13, 2026 at 06:08:49PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 13/04/2026 16:34, Shawn Guo wrote:
> >>>>> In short, there will be Nord DTS using the binding coming, and I do not
> >>>>
> >>>> Maybe there will, maybe there will not.
> >>>>
> >>>>> think posting them at the same time should be a requirement.
> >>>>
> >>>> Well, it is a requirement as I explained previously, said that
> >>>> *multiple* times on the mailing list, documented expectations in
> >>>> mentioned/linked email threads.
> >>>
> >>> To be honest, I can only read the following from mentioned email
> >>> threads.
> >>>
> >>>  - Binding and DTS should be organized in separate series per subsystem
> >>>  - DTS should reference binding series by a lore link
> >>>
> >>
> >> The links told explicitly to organize series per subsystem/maintainer.
> >> Who is the subsystem here?
> > 
> > Rob Herring <robh@kernel.org> appears at the top of get_maintainer.pl
> > output, so I guess it's DT/Rob?
> 
> If you guess, then why did you post it separately from the other patches
> targeting Rob?

I should have done that.

> But you mentioned oryon-2-3 compatible. Who applied it? Rob? Who applied
> Kryo? Or Samsung Mongoose?

I was misled by commit 96e71f817b02 ("dt-bindings: arm: cpus: Extend
Qualcomm Oryon compatibles"), which should also been applied by DT/Rob,
IMO.  The merge conflict where oryon-1-4 got lost could have been avoided
if the commit above went through DT tree, since your commit 0220405d7e09
("dt-bindings: arm: cpus: Deprecate Qualcomm generic compatibles") already
went to DT.

> I explained you the rule - bindings go with the subsystem and you post
> everything targeting subsystem in one patchset. This was explicitly
> asked for in my referenced postings.

Being a platform maintainer for 1.5 decades, I knew this pretty well.

> The SoC is the primary subsystem here.

The same binding switching its belonging subsystem is a new thing to me.

Shawn
