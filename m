Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCEF3BF68F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235336; cv=none; b=khWtP8xG0V/g2mSbYc0fn0nDTrMj2z8+5MWQPqUvQMbIkz38pY9EhChK0Em+qAIYLgl1v3o30hAUEuzD1GXmxkdAGCq0V4MRjnHHvLFutFadpggaW5EWzOkIjmPysz4A9jwUpJHvFXBfP5ZvoLRNDvNmnnZ+0yuw/4R3jL6Wv5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235336; c=relaxed/simple;
	bh=WLedKuZPuDKCqCqHoINHvHjza8SW+YDijRmxrez/934=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYjcQkDuh/cT8yQ6oFWpmeUOl++X91mDpDq+1+A367rJelfuvy/pq9RvGmrf/H3ayOtyxCtCEdP9vGO+2+YjD8LOR4fHxWxsiJsv3lOYO3UhYGS4Q24iCWS9nBLeMTIJfuFRo3Bx0jsksZSnKkfTdMQnNdJoYBv4hiIaZ1DljdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEoyoHA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W19Kmw9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEoyoHA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W19Kmw9e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6488mV9Q1417765
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gWBtzZ/qvxKX6nOMhDTeyvxQ
	OevmU9VUTHONpMGN5HQ=; b=nEoyoHA/lExsH8e1z3rol6owxcE4E4og/eNPM2lC
	AR4QLhhhw1QDR1TdShUBb7zgmjsykchu1gxkzj8qo9ng7MPK3SX1iLNsW20J5Bcs
	G7KrFeyvJ5eSp3tSg23pImazd4UhCD++SKuNQcbaIRYZ3jeZWD98aIyT8rVuL0F+
	MJJmm7kwrl7ECCDjTC+rbdwGSc5NqIqTui8e/kjKIIdIRjt0gfSfAegWIsbkFIjA
	q5xShiYgcKo1VViSAW4YcXuLlxZBmSF88P5Y9FXOm3PF1OnGEvpg1hModbUEZ2KP
	51GN2yv0tCELqNsKEidveZt/FsLRcCfKh+hDVFrhQut1Lg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhk3t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:15:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1320f2754d0so7476497c88.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778235334; x=1778840134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gWBtzZ/qvxKX6nOMhDTeyvxQOevmU9VUTHONpMGN5HQ=;
        b=W19Kmw9el+MC+HqFVjhQ7RTId7Ur/xVK0zVpat2jR+F+Wl/Wcf25Of46WBk0yfPzCm
         3tMKkoSMIU8mxGEdU411BBqp72oP9iRew1WGClNtKpZx1Zmce2+vH+2I97Enr67NO/HR
         xhUg22EVe8qYH7ZGJPEOD1jKAJIcSRpPZ0s9IRO71oR+QSB8ao9iBubxNEXxBqf8Hawj
         aRBhDioElIVPHxEuMuxhNSUtvWHUE5LLHru8S65JB7/CGCkLWJQbB96oQ0GdJ+vtH3vI
         +WCDq5oAzMxKjVzniAX6PGf2zeH3wSsLQhkmRTAdrQu8vMfSAcjdITUQo7YFbDlIqNqv
         0Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778235334; x=1778840134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWBtzZ/qvxKX6nOMhDTeyvxQOevmU9VUTHONpMGN5HQ=;
        b=rznrodYiQabxGeLbeOpwXj/91/cG84L2ly3BqBSGhwKE8PvpKJtdO2uZDADGitfQqi
         4V1cNy8RcZ69Yyy0LKMiiKJi+AujFXVKIa8BrweCiUBWee5AFUfNd+uvU0+cxHLJMAho
         +yJ3y0WoQLLznX7xwK9k2idml9EFkqKLXrt7jciD38cxVzAkWG81rUgKHUS6eNEhmUvj
         syCtv0w+9cKvVbt8W2me6dSEy7dyU6yj5atB3lSJPcK76RGTKM6wnzvBkzzCdzpFC65e
         pYhzv3tY/VKrAS/KK4CkrXnbgWW7e0RCj4jhQMg/qtTOAnYCnB27zfi5ZI52cbcU7BKx
         a2zA==
X-Forwarded-Encrypted: i=1; AFNElJ+5EBdfU4bTYVxEhfLRCBLDF1FsyE9S1zrXGjT3NUkFD32dnIp/aYzE3B4wsXZiYYWhFf2zsJIHnSu4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8KDIJr9zIz53tlENyx9MZATMeqe+cHhynIyEVL8WqZ4qrvCM5
	LGZhNLC3ogPBeX65YrKrg8/wHs5bjVEDd61MBwYjw1rA7tqBkle+P9jz+ErBsU3JQTX4p/G04iD
	BT4DJEtfRSbgDXlE73QWmX4HD6ojWgVirnnmUuHUlB4wocfyfqMEq/Qplz2GoCsJH
X-Gm-Gg: AeBDieuDOQinSRphHSioso9O30Y4J1NG111G0xmAvIi61EMUmBtHEfLwWK3OJ08dkpv
	R6teqgnPBF8M2xWtiOhtM0GQbVo5kUIjIDxo+R/aO0XUjussAzi6SABT/sw+FNDKKaw3TiWG1aJ
	lWgQtQwC+paLuh7OTQZVlQlXvJ6rJaDpGQih+pdxsMU4KrWDVT5jmvwOhATXKoKZTMAPQ2rLZ1M
	4aAPEtiNdrQlqpssJxOGL0OlsorYLLPI4Dz9Hqh/+x4M1DTJCX9Lfbz0FgO+8tfdqr3AsQUxXsS
	obyK6w1JGq5uJkl9uQbEvOj/t++1WMFKsZOSuieLOXSBNMVdug0px9khaO18+oqXihZkogoZNb+
	N5RaxFnvgwLMzYdkyZxrzXInS4c6beZ7x8ZtwyveiowVWqQaX+ehuOSFrNEywSXFC
X-Received: by 2002:a05:7022:ea22:b0:130:a479:7995 with SMTP id a92af1059eb24-1319cd3ec60mr6486682c88.33.1778235333550;
        Fri, 08 May 2026 03:15:33 -0700 (PDT)
X-Received: by 2002:a05:7022:ea22:b0:130:a479:7995 with SMTP id a92af1059eb24-1319cd3ec60mr6486653c88.33.1778235332920;
        Fri, 08 May 2026 03:15:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132787673ffsm1942800c88.15.2026.05.08.03.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:15:32 -0700 (PDT)
Date: Fri, 8 May 2026 18:15:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
Message-ID: <af23vhe-LQvW6lco@QCOM-aGQu4IUr3Y>
References: <20260427010527.230473-1-shengchao.guo@oss.qualcomm.com>
 <20260429-important-panther-of-drama-00f5af@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-important-panther-of-drama-00f5af@quoll>
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fdb7c6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OgxhjLVz-CMH9HgEXFAA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: uTRwdaaIk6v2igVfBT5v5VpQe_iHevBs
X-Proofpoint-ORIG-GUID: uTRwdaaIk6v2igVfBT5v5VpQe_iHevBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwNSBTYWx0ZWRfX2VK+xhMuHas7
 VGEyeCK7LdoBn2grU4j0SNYBT4o0nbjyQ98rlUIQkZqnItUA8jmjPxefCkzxfJakVdCk0e20Sl1
 +3tWZD5tXs91/4bCUUHs/ycYHOAHj3QB072wKexGgnLiegQwyzgoq7GCl/N0HjSJMcyeBKXJoAH
 nTc0l7/bJtblgC7gvKy/50gDJ+i5DL/EsP4RG8t8PZLPsps8vBnBQ2zjPa2pN6YEm/cbsAOopWW
 UrmQRtbds/WLDO6EzZ4NCwomQ8aPmwrRNpeH6Yaix0usysTGJ0UXdV5UlvggkCOIO0Oggnn6CEh
 /gwqOC3j8nXeaRzebYLZX5cp0a+3mqq5VzR5YdWhDvCUqY4j7RrEI5xzlOKsiiDp2fpoKSbuCtJ
 J1mWQ8U+XEr3BdbvF+aygzSMOiZmBMjzcerdUCaYwLtWBXs49DxW5q6WQJd1O9//+SEbu4MtplT
 U/N2ClQrQtNSlMwXNTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080105

On Wed, Apr 29, 2026 at 09:15:35AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 27, 2026 at 09:05:27AM +0800, Shawn Guo wrote:
> > Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC which is
> > compatible with 'qcom,inline-crypto-engine'.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >  - Improve commit log to make the compatibility explicit
> >  - Link to v1: https://lore.kernel.org/all/20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com/
> > 
> 
> Same comment as for SoC patches - do not split patches targetting same
> maintainer - crypto - into separate patchsets. It's one patchset.

I will have to resend this one alone due to the request from Harshal,
rebasing on his ICE binding update series[1].

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

Shawn

[1] https://lore.kernel.org/all/b8805117-d54f-4e42-a7d4-6fa18af63e69@oss.qualcomm.com/
