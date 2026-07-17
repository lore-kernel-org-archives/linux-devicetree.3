Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860A2E8897
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311367; cv=none; b=ZabjTo+mfwsXeVMCSGibODFl6lS+O0Xn4nmpmQjYS9z59xX+Ur3jhALlQizwgWvUO75ei71Uu0wyztWPnM506Q3G5zHUkB1XfmjHjTGpZ+OVIycuYkUe7Z1/Mst951NEqX0JDcTjEWHjQdjrUCnAD7bz/gJbWj5PH+2+X2ECRPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311367; c=relaxed/simple;
	bh=IVp6OxKPnY5RRxUc+Z+0GDhftR8+TVNhQ2/e2GddRG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=He2amMt/pHz09O0qFPCX2bwYKvzruc09q4KJ+hsj5K2E/13m6i0u7wchTTGgH7wDtBccJ1Tg45fwulB3aRXlZPT7mFUGaNlYs77saynRwIZee8FeSS4Ba0HDBUkM+CQbrrRyzyC5YJtjs8wctYXqXwVslpBTJVgNDlaUJQWTzhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mk5C9eQ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/z8vIwu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mk5C9eQ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/z8vIwu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HGoHGC2209790
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xJ763sHUzQ6G+X1IGzyYd0jA
	GypHFriotS7bOyxUKWI=; b=mk5C9eQ6Ycao0XoN7QPb1GLJYNsp25EBKechTS60
	tID5+3aL4/f3sPPE9zRMJSEYE/3cpn+AEnZPbZ5WYrTg0e7c8pdmKBzEK+roZkn2
	zy4dvxdXNj3gqatw2CnlfUUxuJAoa4b4p325WvwPw4yWlVG1e2RSySiZW6S48gRX
	ms7aVZos4TToUolaPB9/PjhY6374o20G30zbBN83zVR35dLJDHc+DZqjdCCp2ZZM
	07M0vEapqN6xYJtapjgMu0CpzBMyFiUAjFAyxw9VIov82It8TrPdvC55OQgdaFx3
	V/Jxn0TDjXpGeGRWFgxN/lvcGHGiDoZinFqrbKzoEGBidw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffagakwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:02:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce8a76df2dso142087115ad.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784311365; x=1784916165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xJ763sHUzQ6G+X1IGzyYd0jAGypHFriotS7bOyxUKWI=;
        b=H/z8vIwuzLZBgodNbDyrQBW4hvTFr60BixL/7rUyf/CXHVQjHOBo6TCr8UV55EVh+m
         wHi0Ht/XJMMkUJoJdjdzqzhN8FZ9YRtJNmdt3WEnLy7d59SR/OZoVASn5Z137924ULEI
         NzLfHl/ha3ZXzZN+GC/Fu1oQBVrHWH5D9KTD4MrxnB53cEUA9SYBdYQgI75KmLQgxi3F
         Nj9d7PkfcQHeJt35vOr0p50xvs2ggbKNXVxnK/P6qhhrFFWp6ZeAhlsW7mdVy62XlCTI
         2rdF9yHV8z205AbETHndPjYbnhQsVCImwqLllIajlu8wxXb6COyh4M4R43gWl/16TEuj
         bCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784311365; x=1784916165;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJ763sHUzQ6G+X1IGzyYd0jAGypHFriotS7bOyxUKWI=;
        b=W6YCh63mdBYt4BFUFUbAHgG8B8EIy/Gjiun/rWsSDZzd0YDDsQa0ZVyKE3L5NNRmdL
         PpIFd2wP8URKS1H3BHpoTuWrPsMwBFMH8FAjqZXXmxpYD7Dl1ynPXXpWtn5p/0xhLXYm
         QuhVFRusZuD+XcNao0b7XiNWrXLkuYkF+FdtGz6IYOt1NWyzn2GWHhf3RR05VLcWrWDc
         V4cQqYZ8yZUN9yVj2njWP2E7pgfVPWQNZBUMqg6hMU0DgNnqfmqoNRXVfCnsPsrMZYe+
         4fvy8Dtv9BPeeoY5pbcB4tZ/wQRzGHWNdmFVCq0kimGErzsW05dsyPis64tk24dOMJPe
         mDSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcPqtoJ4VOov1XrnwD7osw0y4VXBHZ9PKemlcdFQyzaYNaupv5QjFwwg8y22W2P/m85INr+BbiAi5p@vger.kernel.org
X-Gm-Message-State: AOJu0YzssmpPVbrU+L+2JUhNAuLhcXyD47UCWTwoxW/7/RKTqf4Vxx+h
	WocsWqVl2RkzGGVR+i7HuQCU64x1r8myJTPwtEQghAB115nJNm4HSyqck2yvSUVhYVK5jQ2crwE
	/++j//m0gZJfkWcDDxjZJZS4ccvl4h9UEZQEnIQehQhDqdyjXDWsFptogpaRQ2aRB
X-Gm-Gg: AfdE7cnPXB1f/NU3S4T938CDpxJdJ4BXowhTMhsndyTB08Rv+dbZTPESrsTt5ndvTkk
	/5ZH/CimnnIRfp3dBf5xkoKndAiFhUSS8BIv1qetO7swyJy5r4o6sC4dl7dpTs5nIurW9RJgHHS
	9ujh9k47w+BM6zUXXRFk1p/iiwB0+XTGZeZ+Gexm813LsLts+Y16HU94JfKAjDWGZLugbEI/0Oq
	gb2HoY46h5ICTe3M4492gGmmN5KGGPexuUWaqr/RoO6mmIU/R+DXFCfWF7itVZpR3vTYdtymntl
	VCWJfxF/jIEWHQyg7glYQWP1arjAt2PHGFdeoX4LED/ZP/sFEI4WHyof/pWgcCBAVywupnUQP91
	q3ljXF5fDvJtF2ZyUaPLndlKSJN4=
X-Received: by 2002:a17:90b:2e0b:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38e4b54c1d9mr4217536a91.34.1784311364834;
        Fri, 17 Jul 2026 11:02:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0b:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38e4b54c1d9mr4217511a91.34.1784311364247;
        Fri, 17 Jul 2026 11:02:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbab9sm10950517eec.15.2026.07.17.11.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:02:43 -0700 (PDT)
Date: Fri, 17 Jul 2026 23:32:38 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sram: Document qcom,shikra-imem compatible
Message-ID: <20260717180238.2dysmrp6wanewgmg@hu-mojha-hyd.qualcomm.com>
References: <20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com>
 <178425854616.1084804.7965648558976512392.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178425854616.1084804.7965648558976512392.b4-ty@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE4NCBTYWx0ZWRfX6bYAfMi0Iacd
 Z5nH7o7OEHhkdxqb/DS3/ZYdNM3/Aj2E8WP1KvwWMZ/b1ZOF7R3qF/DEBni+WiqM9IrO+mOHqnR
 N7dzP4qPa/NNWfF+mHugEGYzfBpOexwxsyWvQDOlpryvLhbrLm+Xhg3tInFQmQyXRrNKZdEoBK0
 CJ+GEG5O51FcexFmhApYevSw+mb3tKQabY5u+4EKNNn1sBfGw+c8F2EF0BhNHh6thpuPHmQLDB6
 u7QNklu4yiH1bnbNvgWhxP0Ze/Xy0zaKynzQ46UbbSgQ2uRGhWkjJIh5XUqxqwHMfDzLJcih48b
 yIgT1ZWWv46gEYmcyXOrHoTnFhW6DkQW7SwELDXdcWXXoK57nIyCnlrilCdJ/pppNj58xw6km+J
 NjKDxJs/aDZM3lcYqXlkKW4/I3i+ttgDXtWCOy62PPerGJPNX9C/tBGh9aDmMqR2AJWNLfpW2ls
 YWqLTi1x5J0sumyUIMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE4NCBTYWx0ZWRfXyGluzlJb5RZh
 NZXsq3v2O34Lgs/pC73aMO8Mki5ZugBicqVnmi2g6J5iHwyjlhOMW4AGvF8uirEn0jy2SCgHPM5
 FBcUXebtCmt9GAkJbemjoA2bVD12k0U=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a6e45 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=u-DBnAx98IGjIwESew4A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Z7yNvut5t1DQrPufIZenxz1TKnWny07d
X-Proofpoint-ORIG-GUID: Z7yNvut5t1DQrPufIZenxz1TKnWny07d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170184

On Thu, Jul 16, 2026 at 10:23:26PM -0500, Bjorn Andersson wrote:
> 
> On Thu, 30 Apr 2026 18:08:04 +0530, Komal Bajaj wrote:
> > Add compatible for Shikra SoC IMEM.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/1] dt-bindings: sram: Document qcom,shikra-imem compatible
>       commit: 26ead60b1a2722627759dc8c279ed336826bb5e1
> 
> 
> Please make sure to Cc linux-arm-msm@vger.kernel.org, so changes like this
> shows up in my inbox.

There is a very high chance it can get missed. Is there a better way, like
adding sram.yaml to the ARM/QUALCOMM mailing list in the MAINTAINERS file?

-- 
-Mukesh Ojha
