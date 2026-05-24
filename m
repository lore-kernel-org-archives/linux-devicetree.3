Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153AA3932D4
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 16:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640988; cv=none; b=jd0cMeScgx5xQwf/WFhX8qlcj25AgpXoq4uMJDUwBMcHt39RQWVhF1/TZCycEH83yZZ91i0miyJjVhWLRfQQ/LAf9e4JnxwZ5tdjA4Ime5oLuAzMXBbfaZStoHP/PBYtiz1j8yGKGQxHVGadiDShcVpEqim5lw7RxAZ1U9Ew0/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640988; c=relaxed/simple;
	bh=MpD9PwLQ9CgXa4zGAjImHS5FY9Lr+2Ybi7C/mMlVGXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3DKQ+cj/gDIUwNijfxZwpUYCPZXjSEuQkE17Be69XIqz2Mr3ciptaX7Er2qEN0CZBSEnaLM3uaQkO67CVQFBXaeVrwWcn5MmGD6+e2xI0b0oRqcjBgB3N3gHLQ6MuB5/UzqyS11MVsO4W9xidQZ7Qb4BH4hDRaqicadtgCJWMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aC8AiQg/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWYcF/ng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aC8AiQg/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWYcF/ng"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O7no9G152625
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 16:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vfCAtu9YjFvfjUfjXckwcd/p
	zB82MK5Peh4a9ngumRo=; b=aC8AiQg/3zgWPCN4RPm2nA0QmIFWwQZENaHmsc5t
	Tsbu/QjF4LYwD0LQq81RVb2K+V5cERB1XqdtV73ZIwpOz5rnVqn1NBOPUBc2Eavz
	kc5mQ+yqyB1Yqk8Qhz2tFp/edMNe6LwxoSG+Dx6/7j7t3PDNinYxcmuQlaf0PcV7
	PGUU+IdL4KLjXfRQ20iFmkTnyQ/Bnq4KSdwbrQeIW2QfpTTB7HFyyi7kalI9wBeE
	fyjlmR/Un2Ch9ZWHclIzUg8hIgAMaSxRJgYFSlL0XpeQPcFsldZYGpgEaxLZP+VT
	m2ArzsBCd0UOBf/KA8HBbas3M86bSRLob9sxH3rrg0U+Vw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0ttk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 16:43:05 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95fc8572552so13191946241.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 09:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779640984; x=1780245784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfCAtu9YjFvfjUfjXckwcd/pzB82MK5Peh4a9ngumRo=;
        b=IWYcF/ng61hCWMhzyTg1ARiYeN+2jyaKaGhwKbvcwVckHXEGCubIXX85sMjb9fRQ21
         tJyoUQ1P/dcet/vACCZxjUArxmPpPWbxV1dXH7ycSuIpGnLkspCRY3EZWNlvYpiA9r/d
         /GvnC33qaQJ/Wp+2+pJIWzCTidJYlOEEYoF2JptbilzDNFLk7G4SKoxZOPpSP7lj5Nc9
         K+AYl9ERwDmniN61RrzORve53r8DgnOjGZcUiPwBWeQ62qJUcIicXqeCGyDDfAvxt6oZ
         oyWGzLYYjdaoUYx+ETQ8gwgmQHl5w5iP7xNaYcFW5bolRBjFZ7axIE4O+JkT0QdcBryl
         KZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779640984; x=1780245784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfCAtu9YjFvfjUfjXckwcd/pzB82MK5Peh4a9ngumRo=;
        b=qfFz/3Mka72CeyPOISdiAKp1R3YJcspK5QDonD5SRKF3B5Y06FtZW6TeOSY0HVsfoT
         BJYhp5URfsipIn5Hdmwkz8mSJiEgbs3JRr6sbhWIDjD8+A07Y/+mbzzSM4UpuQrYvmkY
         E1DVERnhXCFqaDkXGn7JgYSZVdqNKCl1sOfxC17mXj4kdlpkoa/lVu562EP0toTqYle3
         QsuFC+OAdOLqY2Sc1DNNofDPANTLpuHKDK5qra52hjaxIyTO2BfsCcEUPEJrQBlcfXHt
         EPsbc+L6LHsUqh0R9hilEhZ6X6BKN6lEYZrNEbXD0YT5O0ayW6r0DX0Z3vxeIbslVk2q
         l85g==
X-Forwarded-Encrypted: i=1; AFNElJ8WW/JANK4bCGiWFxCcMFAw+jH2pu7MQjfq7fadmFvwv32jgjX+mtn0Of+u0QTI7uoIRNoaW60aErbb@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZ2pTM07PXRnYIPFWyJrLk4dk255zuihEHf38hse6BtwhC7Yu
	+YVyJffdrVSDSPGNvxhTMmBensCU2Nx86dDmTjMWR8s/Uvqi8xVYjV3RvqZ1+4aos2WeoVArzB8
	v6IMGJbitNzojt1edbZusO68yCfyJLe8RzaE/RnLCgN6kvlMOwlZBzwaHbS9xHlPV
X-Gm-Gg: Acq92OGD7/ycpJsIP/Y1lyWJ8qjUDO0oBN1Zz5wv4tkf6YhIruORpDLQczPgtbTTuL+
	GjBegE5eYayv2cK7bhkqmp8h4ADdjwurmrUECjdfWcR/a6wMIhbms2zbapU68mDvb01Mf8rH3cE
	L8sQriOMlg8gFIk9UpYOljloMDn728bfiZfziD3sHDM4ahbF45SkI3VvVg3QmkWhWeYutzjDesy
	O248DHX2va1n/aw/I7uzdgc5YovEhXJn8i3+bjzlAEoqS+u2lqubtAfmJsWCMN36sq4/YtNj2NK
	EhVlLXvKeeQvS40whbKbGQvWOi7bUt0WSCZma6yABYECm3U+DTdN1ZtZ8tkqzjV1rlVE0hK989+
	e2zgEIKmw9mqK3rHiXpPYHLDEEjvKUY27Z129hudCbWTPj+uu+aFf1cQXTTYIXUZy8p8MgIo/VT
	V9RnFR4I+LELna8IQebibKiDVya5+87eDDfdo=
X-Received: by 2002:a05:6102:2b90:b0:610:db51:6f3d with SMTP id ada2fe7eead31-67c73e722cemr6301316137.12.1779640984351;
        Sun, 24 May 2026 09:43:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2b90:b0:610:db51:6f3d with SMTP id ada2fe7eead31-67c73e722cemr6301289137.12.1779640983847;
        Sun, 24 May 2026 09:43:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32ceb596sm2021962e87.46.2026.05.24.09.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 09:43:02 -0700 (PDT)
Date: Sun, 24 May 2026 19:42:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: demiobenour@gmail.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
Message-ID: <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
X-Proofpoint-ORIG-GUID: DAoNwI7T8-Xu55bxMVJGs_3sqGydNiS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE2OCBTYWx0ZWRfX6q5v/mRiFVIt
 i2DdtTKdCfWS1ozWCaaa9nYIZsOEUiEqTfLjfvMDVxyu9hCA/oOAbokizLXcW2jqBro5CJrs3xM
 oJwOBk92khT2dqu1e642+7S7Gb94pdYWgvTed1NQfRO7E+OLBU+EkKcLrMAP6mapzM/aEUqQnjH
 62aXQwwz4ue3n/y8oISB/d/l8bzpMOX7PBnpeD1fiZ5T0644oHHAxJIQD46o6MBCPyYA7UWLfYK
 pQHzj4BSPpCLzFqktE9NAtWsDnQf/x0Tw9MvrSw/QZbYFC8dSAiOlZ8Rhe58qOjIJoHsqBlXcCN
 8tNE/QioBUVf14Es3Ebkh1ONCHZAzXFGJdvDg+B2unqilMLlaYdqOMnHLAmmCQvGi2fsHWxPQNP
 k3hOJppnmuN5HdSuSwdF3AFdLiBfJZCMGRf6U2TUYzvdV4nHNJ7fx1+uVjkOb+zwHJ3yN6Qy8qE
 LV4uV2hezH/F7dSmL/A==
X-Proofpoint-GUID: DAoNwI7T8-Xu55bxMVJGs_3sqGydNiS2
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a132a99 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=f6XAlUmOwKfAZ5K3pb4A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240168

On Sat, May 23, 2026 at 03:03:56PM -0400, Demi Marie Obenour via B4 Relay wrote:
> From: Demi Marie Obenour <demiobenour@gmail.com>
> 
> It's slower than the generic C code and causes problems.

Which problems?

Also in the security world faster and safer are two orthogonal axis with
very limited correlation.


> 
> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
> ---
>  MAINTAINERS                         |   8 -
>  arch/arm/configs/multi_v7_defconfig |   1 -
>  arch/arm64/configs/defconfig        |   1 -
>  drivers/crypto/Kconfig              | 111 -----
>  drivers/crypto/Makefile             |   1 -
>  drivers/crypto/qce/Makefile         |   9 -
>  drivers/crypto/qce/aead.c           | 841 ------------------------------------
>  drivers/crypto/qce/aead.h           |  56 ---
>  drivers/crypto/qce/cipher.h         |  56 ---
>  drivers/crypto/qce/common.c         | 595 -------------------------
>  drivers/crypto/qce/common.h         | 104 -----
>  drivers/crypto/qce/core.c           | 271 ------------
>  drivers/crypto/qce/core.h           |  64 ---
>  drivers/crypto/qce/dma.c            | 135 ------
>  drivers/crypto/qce/dma.h            |  47 --
>  drivers/crypto/qce/regs-v5.h        | 326 --------------
>  drivers/crypto/qce/sha.c            | 545 -----------------------
>  drivers/crypto/qce/sha.h            |  72 ---
>  drivers/crypto/qce/skcipher.c       | 529 -----------------------
>  19 files changed, 3772 deletions(-)
> 

-- 
With best wishes
Dmitry
