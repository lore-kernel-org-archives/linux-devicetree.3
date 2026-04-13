Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AA92D3A69
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082004; cv=none; b=qEIt3SABcZZmeKxYSvJ+Am2F1bXidQryHfJaeG7jfnN8lvp2E0l2/yf8ox3Lso1HBDSZC2m6MXlNCc3wIChbyBIHATVYzFrZ4C10wB+FwceSzj4+QFg4JjKuy5WrB0wMCrb8/Eh8WCqWrEPj/c0cJWcPwfwd8c1w5pISX4x3xyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082004; c=relaxed/simple;
	bh=JjOuypucc+oAH9f3I54PR6Y2kju5pK0Ot9QKV6MQZBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJyB1smhxFvQ5WYGyMk51ZNZm4jv8UU39DQtVFbpX8ZlT4oHwlJBplqQzQD75x/LMxg3kdDpbxzTHn1qVzX7KrOhlxVROEZljlIXpXzx/fX4HZ/26RmIbEdy0SZzlwgUFsva20QaJLEbe7/9/nfwt1co3s7W5OqFLp2QnnpKlIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZaidiXAD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBJX52+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZaidiXAD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IBJX52+Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DBS5ml3560579
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 12:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Y9946GL2rljH3xCRftmtO5s
	cdnSGW8EjB0hBdNVjE8=; b=ZaidiXAD3zZ7CIDtNU8+XV8Qpf6+5eHj+1GvOE+1
	Ln1Nb5ARJOswX3IvEBYm3Wrz0yGOJ93UIXwXQE8xQiQlpXt1wTI9npI4rYvkAFZ6
	HmPU2eUtu3rGDWukkWOAoqYhwcPZu/domyBkxLyH98lxayLo9pH6qsSgjVbLVNdA
	OluqSheqGsd56ppcXxxgcKsSrCCEd3KAAfgNRbT4JOZ4gzrq+qN1SUUIJsbQZgME
	9NcTigZGYxNeTjYvz5nef+IpSDQYWOyMcaQR1atgZqkFpMpByI5TN2w/p1gERIEH
	blzhY/265zkvg93x9G+IneEawSI4UIhNRRL6g/z8uwfoYA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0n598-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 12:06:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso5463380eec.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 05:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082002; x=1776686802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y9946GL2rljH3xCRftmtO5scdnSGW8EjB0hBdNVjE8=;
        b=IBJX52+Y2vIvvOG+u+Y0O/gCjQDcdzo6FHKfkTUft/OgrC+yGL2bX7DR5ja4GHEGHL
         xxaykuJuUG3aYg0ALHmKu2FHNpOh+34JV13LB1WOqQyLJ9UJCwAzuA0OcST6J98DDC1e
         WsGHvhqGCS52y2RoZqF/8FQOAaVOj6o8HBF+ZKADkvRl0TJ9ziNLiY1jWrN5PnLSSdKy
         SF6KLGIaZFc+RHRN12i51jOE84ejhoUNkunuzHwM1Vdp7g3dsliipZOMvFMJGZ6naEq+
         pkGhZ8y/g1mhpY84zLiz8NXCgjoWv54D2CHkA7e+gyvWMzIZIanOmeLxgxLHVaylc0iE
         Zr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082002; x=1776686802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y9946GL2rljH3xCRftmtO5scdnSGW8EjB0hBdNVjE8=;
        b=j6yyF1xHKhkIZWryfQVGAxNoc70lhsJahflpFWcC46xeHU0QnEUvowzL0fA7Qwlg7r
         VzdFgb7joubzzRxwHt6JK/5vlm46Bz4sE2XvDOnQ/7tNlkt00eFjvQQPCyMtraaMhogT
         EAZaZcZrec/UL/219BkIqDdMrDp+QCQkAc2S8C401V6H6yRqTud8W+YTSt+LgakEG/U/
         BomcOqkpmmcUxLHS6xo+qkn0Tz3vLon0F1qZtqZjFXGceDRCx35Cc6QrJ8W9yyOOwk3/
         /zDqr73MWIvgi/1/20u0XEF/HExMbkpIeW2F+u/JRrh+CobcxQjPTbQZczdOQBBkp0yL
         uO7w==
X-Forwarded-Encrypted: i=1; AFNElJ942FRUgF1MvcKJWSdzFA5zxxsENLGS9jXz2dqsmNPP62tOiEBlsbcN6LOLN4DB0/Go/w+KmraoNf9L@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdy2gViWW7IOQ1z90n5KVVj2TMrKhU8pI3ePZw3ulXZZfjgaXx
	FpA7kKhIgYnrw8ybPBgqb56JvVNnG86XqeFm+NwFPL8ALqsMXh/BM1UU81eEbwkoti330SroGJy
	genijH0y2XsmXsk6vHGlJW1vkV/gaRvabQiXHH/Ey69gvgxewjzaiUG4afTB894DW
X-Gm-Gg: AeBDievznlyNNfjwfomHQs0rvrIagPNtxP1fP9LYQwuytmfx3/9MY4NbJZFHuVgutpE
	qmSqeWOA4lNSe0f+dXFSiiHJDsnWTqGoVs19a1amOLpgvV1UakAZ3wyxRe6zaCi9tiB11vt480P
	3MiMaCvq92krAj0gmTt1s/8YsQB96VodmXn/k7xsFo1FxpWa8q2I9ktqNCX3qLD5TDQwOkFSB7R
	TsD8eaLNqXUi0MVK0wINNPyy5epfRbvXDfCvOdSN0qH82V9xASjcxCIMrXXpEb6HeiMJgL6GVu1
	Z93pNShQZ8c4Sa+ODyLoSp/ZIo1m1hiqbnTqxgvzkpukSM/cE/45SPGJQ66KFYHovp6K2m9V43n
	aYMayHmnFc1xI/0ZlUnLy6cQ49nYY8D4FPk0UUV5XzySHpw1LEJ7Ha3MLD6AawHTR
X-Received: by 2002:a05:7301:1e85:b0:2d9:6373:ad09 with SMTP id 5a478bee46e88-2d96373b0e4mr1468025eec.25.1776082002079;
        Mon, 13 Apr 2026 05:06:42 -0700 (PDT)
X-Received: by 2002:a05:7301:1e85:b0:2d9:6373:ad09 with SMTP id 5a478bee46e88-2d96373b0e4mr1467997eec.25.1776082001418;
        Mon, 13 Apr 2026 05:06:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm16163467eec.14.2026.04.13.05.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:06:41 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:06:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: cpus: Restore qcom,oryon-1-4
 compatible
Message-ID: <adzcS4loKKXGBbga@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-2-shengchao.guo@oss.qualcomm.com>
 <21b3eca0-c8a3-43c3-ad61-f15abedf5c7e@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21b3eca0-c8a3-43c3-ad61-f15abedf5c7e@kernel.org>
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcdc52 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8ZdYE9b5z-9qtW5Q9UwA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExOSBTYWx0ZWRfXywEDIE3qBOKi
 ISFZFh2aHvSvH9lNd+V/qX7E6awtecfYIaSQg8b4JI6MWBcSIb6JPHPl2EW+OU+2BYUY/HnRuVv
 dmJXqilTpPSF8M+Z2K0rrMmhydqRgrxB/z+JAWCvJ93K72z0wgheIyuqGsM6tyJYJhjU0fqFkHZ
 tNPfawoSch5vHGKvu86c/ViAnMmzfLbEc2kielBt9fu972NMZD+iVO14fEfsX2WVipioWUZUods
 NazGxNtxh9b17iXr+m9AUwMDmtun+UwmDXvYJ/sS5T4q6Owi10pu/Pi2YH5reI1WBRweHJzCC1r
 wuMUvd5wzMwf/LEHeSP1Kf2+iwzycZdrS6UO8MxWq8IT+Xqh9FRPcs485JJAFUOdxlcyBycPv/g
 hlQclhRNMSn6BsUcHeWKRThUFtcYC/GvjmNrwp2OJK8iBi/Sp8bxXDRiYPosN8LyMdna/325n2i
 1acWqY0lx3HvFZc5suA==
X-Proofpoint-ORIG-GUID: deslyLLyzFcKk4cRyk8NZWb0JizCnvSb
X-Proofpoint-GUID: deslyLLyzFcKk4cRyk8NZWb0JizCnvSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130119

+ Mark

On Mon, Apr 13, 2026 at 12:01:06PM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2026 11:16, Shawn Guo wrote:
> > It seems that compatible qcom,oryon-1-4 was accidentally dropped during
> > the conflict resolution in commit f6935ae6147b ("Merge branch 'for-next'
> 
> Don't reference commits which will never make to Linux kernel.
> 
> > of https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git").
> > Restore it.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Well, I said that merge will be difficult but Mark was sure merge is
> trivial, so here we are.
> 
> Anyway, this cannot be applied. How do you exactly see it? Which tree?
> Try yourself...

Ah, right!  This can be applied nowhere, as it only fixes Mark's merge
commit on linux-next instead of mainline.

Mark,

I should have copied you from the beginning, but could you take
the patch [1] as a bug report and get linux-next fixed?

Shawn

[1] https://lore.kernel.org/all/20260413091625.607976-2-shengchao.guo@oss.qualcomm.com/
