Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FB339B952
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690584; cv=none; b=A7B4bDmmRGGLYzU1d9k9qNpa//Y5E8CLfnLeJDcg7UB0KmU4sBSLpu9rZLEdzFEcOlbg7ZR2ed+5SPu+2PZTYe2vO1N7Kqvh+u/rbJMhp6LndhzZej9pwZN3XVe7+5raQd0/BJhs0mbEtkeR/8SRBIQ+9RAIobjrnK6PhvwDyd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690584; c=relaxed/simple;
	bh=GHwHM2Pf6KaA2vthdyaGDntjXWUE3ensLonH0SzHyMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFd8N3kKwrfYXC7fkl/6QMO/9eCuX6jbqH4ZUW0Kc5H5qUh3TQDJ6otsj73tg4xHJjmu1bYOUAZGLu4ZpkI4ZN6KjAetOrPYRDtJ4BxTuiPqYYTjMVUGxGpNVUdyak6rWppsiQuACJK1wV3wioehgIKek3++9mr2C8ND7XYhV8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ve7tV7mM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8WMtrkW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ve7tV7mM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8WMtrkW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OMo1x03019604
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FdIrsOqTvAtPVjBT+JGYNekw3r4qMnKczAPJbhiSasE=; b=Ve7tV7mMp8QvF+42
	6DWaCZPyb51vcb3OWG2A1fWxOI7zTm1jllpE2R+oh7ju7u1eGYzZDHQ/FpFuw9GG
	j/mVh9dlwX1EYgBDnWJ1cDFqK93XYHTAjvPUHTkPnGsUEH6jUzoNImm2C4uRNk2F
	xiebWDSRDrglWr+seh4Z7Iy6BPytSYpfPBAKEdV0gmBFlozxERO14Z4BEYd1LM1Y
	VTiCA1IvM1w+dpadbyrfUcFC9CfL/TvMflraVvfmFARIz93obC6WBcTJ3XUmnqPK
	p1HHxBKjMtzk7/O34VXU41dXUyFaS/M9XZE7y6zdmyn/YOy9eDEzCxaQyjrxFwah
	9Ky1AQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t5ejv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so8240139a91.2
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690582; x=1780295382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdIrsOqTvAtPVjBT+JGYNekw3r4qMnKczAPJbhiSasE=;
        b=M8WMtrkW0Bsd9iGbSdvTm/uXprAOyTD6Ukan7qsXFnsFu7LhMFZ9GcHei6/YdJHtrF
         ZKqDhFRWlYJUS7cAAZVSmd/8P/t0fm+VnIWxAcuN+bc24xfJNvoJnzNu2igqi67B9dKn
         3NX5Q4GI/wz/zOkE+pDE9PPbHcTWY5ErGs306XC2P9oA32D5URlvK0s97nmSdLuhXB7s
         iWoD6TDg/in25uzAqR0whpyRW+6LGOz/deGWDwtMx7T6Ak2RkecN1pfhhXudaaMDN2K9
         /h7kh0ODzCQ0dAMt4fDKL3j+rQkNOjmriPCc4XlmEI97vOnP9YqT9HlFOCX9mlOdAtAZ
         GFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690582; x=1780295382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdIrsOqTvAtPVjBT+JGYNekw3r4qMnKczAPJbhiSasE=;
        b=RJ9stFYoKEHm551SGh1gv2A1jQen+UbYsLhAYiF+9PwCC9i/L0i2mYR+WxcZWoagSA
         RC+Wj/+ZnmDO4Pa6/glKf4sYjEGHnE6MWHQ2UvsG2VcNYwgRX6g/xWpcgT59CQWKHSrj
         IgNwLb9FFmjdnyGKH+rGbis6v+TpKOIQ/Gb6E59cXuZMUsuyayadOYxEesgCiyX6ljMA
         L4WhFCfRPu0Ttf5BTi/GL8m0URigJte5OrQrtPotgQTFsC7axGOWeYHu4Mcf+gu1bGeU
         6zZ1wEe3Nf83gi5YSzXqpsXjI0P0WIC0ONSmGIGOPWUun/1ZTGHgzd55jj8+vTKd27yy
         MjaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JxkB7Ue0dAlgjWuqQufbiOYyItwTyWSGQ2I16z9WS4qKLV7pmkkvyFHavcGxJoWftKG8nF93z1ecH@vger.kernel.org
X-Gm-Message-State: AOJu0YxQEujC0SDHiJJHzaNAq5Xq1f3nYcsN0E9qoYrqDlKHiH7a11Z6
	f+9Dz/GeDCT27kquPlyKpo3vvDofAUGrybtm17W/82QiDpNT9MLx2pKgSoeBMr9D53ZN7oJtOwM
	zWfR57mbGeEcwy+lW1/2WWcBs5JZKjg/MTt2HujMx4RMQn4dW79qt/4xqwoONNrMp
X-Gm-Gg: Acq92OEQMgUyWS7kHBC1TqTzEMTdIGF87PIvp85eQzlbPCd2P4nYqfy6q/7qXsiV0ph
	jWt+wS9Spi2OV37KzwLI4c1WwqFmKdc5pDF3Ls1gqrfps8ZAJEWTNJFn/SdTw8z//UWiQxbwfzD
	3zicJI7zCBIJvSzBOComKV6Z2snV1j7aMuT1uacIjbWprftw0xaBu4ukdo/S8PicQPTAtVqHnTC
	G4SlYAT0D5iZE4kt2u9FKF7+EXHBumGGaauhNbmqygBNSdu3HDgEs/UIEYB2dBgUCVzq8fhYfRK
	STRQY6qPxWMga22v/kI6+ORPKtJemGsHIU0bzto7DhtCu7DvSfc0w3aPQAMYxmzdV2+SO0VmikN
	xNwwVYoR4ImOeuBgfz6LmiycAmI7xwxs4aG0TAEskXNih+qoqtmqxP+pfwiHJOCo=
X-Received: by 2002:a17:90a:c88d:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36a67693ee5mr13860548a91.22.1779690581716;
        Sun, 24 May 2026 23:29:41 -0700 (PDT)
X-Received: by 2002:a17:90a:c88d:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36a67693ee5mr13860512a91.22.1779690581236;
        Sun, 24 May 2026 23:29:41 -0700 (PDT)
Received: from [10.217.223.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4ca35sm8718531a91.9.2026.05.24.23.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 23:29:40 -0700 (PDT)
Message-ID: <e36172c6-4424-4b77-9b3c-47dcdbdff05b@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:59:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
To: Eric Biggers <ebiggers@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King
 <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
 <20260524204537.GB110177@quark>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260524204537.GB110177@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HzaJVsPxi6NGzJFHEypO7XNnOWlN9F-Z
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a13ec56 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=84HhrvKZSfYMtnHzFl8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: HzaJVsPxi6NGzJFHEypO7XNnOWlN9F-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MiBTYWx0ZWRfX4XCdX4ydtvG3
 1Zg51q9quE0Ch9eg/974HxUzODCKn/d9mxtLOIbgQoc+km67npiM17TCsS3/Tb+YNwYxJ4JiHB0
 pU1i/Yq5VR4EGaG9SpVjBovcCuEo0n6ZHFqXNVynMkSYB+E4glPUbtxO+csKWA6IBmgXj1TojKE
 KH0tmzHrgfPJyODbBdCbx8lFF9j2uj+f+f7s7ptA5CnZRalcQebV31B/6KLF61nhPTiS0NNPNnL
 Wjao7+j4c6iTy1Me77/gkOL4Yv55HYtVg+iTrT37T8KrNIAWNM9roN4OHgKs1QVHWL6Q8KlVfSm
 lU7RhgdNPD0JVwUCKWKqrVgedP8kqJLjEyEQWnZRm+E423DVAGWagv5qTaMxpTKHf+M8CcPfSlr
 5MSJcX3K2+BF01fh7I/iW9jK511Qh2D2KyjRISHfaRZGr7R634XdIQPAcDl51s4WlJWgFBnfwqQ
 LrrHZGU/wYHL6PGa7gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250062

> This driver is more than an order of magnitude slower than the CPU for
> both encryption and hashing.  See:
> 
>     https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
>     https://lore.kernel.org/r/20250615031807.GA81869@sol/
> 
> There are many examples of it having bugs as well, for example see the
> second link above.
> 
> That's why it had to be disabled via the cra_priority system.  This
> driver was actively making Linux worse.
> 
> This isn't particularly unique to drivers/crypto/, of course.  This one
> we just have data on, so it's a bit clearer.
> 
> I've yet to see any real reason to keep this driver.

https://lore.kernel.org/all/c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com/
Kindly check my latest reply to the thread. There are numerous usecases
like DRM(Digital rights management) coming up and qce driver is required
for secure content.

> Crypto drivers need to be held to a higher standard than other device
> drivers, as well.  The onus is on those who want to keep a particular
> crypto driver to prove that it's worth keeping. 
Sure, I'll be working on stabilizing self_tests infra for qce.
Kindly allow sometime to go over failures in crypto selftest and will
submit fix if applicable.
So far, i am observing 2 ciphers failing(xts-aes-qce and ctr-aes-qce )
with CONFIG_CRYPTO_SELFTESTS enabled.

https://lore.kernel.org/r/20250615031807.GA81869@sol/
May I know how to issue reproduce steps because I didn't observe
crypto/ahash.c failure with CONFIG_CRYPTO_SELFTESTS?

-- 
Regards
Kuldeep

