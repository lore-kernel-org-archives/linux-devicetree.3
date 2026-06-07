Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25E92E88BD
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780818591; cv=none; b=bTDeVO+LMKzqKZUv3PraQILmBdlbWXnoP4SuIoLjJ4zmiA9G5f4FzEocLX8eEY1Nmb1pmi4SMkN9pf9b57pI6HiMIYM5MF4fgynLMg2Ojrr3e821Msr6z7/KgvgTEBF2j58k9IgeMAYZRiwV75ERV1EJItwx1oTW9emIJTKgG5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780818591; c=relaxed/simple;
	bh=oSl2ogZNQGmd87ETOSzNSkSCh4CwHrElkWlKILloB3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMnJcOJfuRuUzl0GIY9jSL38G/OC+yhDQZZ5g3xGiibPKOcvMe+TUc3BbsJEknHVloqUJmu89E3RPp4p3QnMeGfgo45u5p0s1VBMwTlv2PTI50Z+7wHPorHpG2WIAY033eLgGF6+YzYSqu8tstf0Xbe+kK6rZnJu6dZIkZyyKZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsWmXFzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReLKv625; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsWmXFzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReLKv625"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6577BXUl4167827
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 07:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=teBGrABVhJlKOgLTq47ixTXW
	2t5GHP5uTDgWHbMXLYY=; b=hsWmXFzvIlp0gBkcRH8W6efCALF31zsiNJF6+8uL
	abO3VPCbK/ndI6+DlbNPt00iqcQQy1afr9/huMWvIUlRuSGEbV1spJsmY+tUq4Tj
	+rxWtGuSSsoxWXKtqpjPZjUR+eqlIUEXul1qAPJvBNv6T3COCixE+p3xRh6jjbXP
	28q3hcRBOxF2AL3Cmnu2R6HEe6j45Z7h21jxMQKPvCPgf0Zemuy07AgDxZYZRqZ3
	EH7BecnwOCLwjesTrxU0FnSZCMGQyJhrLKtZ4/vcnHDmNdz7tNbeDkqBsBShB99a
	TdP2avwVDOWCyZBXFTT4taqoTYx4sumz4o7eRlM1wlUytA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4ujxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 07:49:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6ee0bfb5681so3973761137.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780818587; x=1781423387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=teBGrABVhJlKOgLTq47ixTXW2t5GHP5uTDgWHbMXLYY=;
        b=ReLKv625itXwta9J3sb8DIvaV+9epxszzkczRB4vegDInMjKjX6DFYWn8FXObiYoan
         NovG0oZdM9VW5tN2LakxjoAZ11c8tNLfBic+SU+Bfbw+rKMTLM5YhbFQhNtIN0mPSu0X
         2dKOZoNeuJUlMCYrluMIx7shh8OSGV1GbiLKyaL5POE2N1UvbhVjnMK+FzMPrif3Koi5
         W1AkBk4EfX15X8NCNV+DU/S0xaSXEjcngFJBUoGSPAoA4a/X8NTbGSdfqeHBAIGofdby
         0oq5gRLMiQJyRNpinstwAnBAV39PFRT/5IGWO3DK47C1P4cBQh8PnILZmuzEe5WogmXL
         eogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780818587; x=1781423387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teBGrABVhJlKOgLTq47ixTXW2t5GHP5uTDgWHbMXLYY=;
        b=Z6i84kwA6kd/QfQuezAvYHtk4Lx6egKdcwKqhWm+Mk3b9NTniLj5WlgPVr44lEqVAk
         314gvXOHlnMrpa/uhhKQb1x16oEowKeIh+SarkqmGHepHVNGE+SL5W0aIic+6TaeOyDO
         sv12cRIMmmVAT5Ut5z5qPKY12x9MUFAhlViSus1+3fRKFlgQgB4cLCxlh7iDATHBUuS+
         dWB5JJxH+3fLXs4zGgh/MFwsW4hQXkddxgD8QNJbahNVW6Lb6IzEqqS49vDVbJXHPM6g
         ln2QzLnihDRlP+p0AfrqxEj80pkLffk9+cuGO2SNEqAa2QWIZXQDNpEIDisorJNaPHTJ
         S01w==
X-Forwarded-Encrypted: i=1; AFNElJ9FA8bluh+r7+/Pi6qTmbhecztzirIwQP9cR5+VBMOMgjeofsPh8lj4IEOVLt4zew6f+zcYZ/hTlTDy@vger.kernel.org
X-Gm-Message-State: AOJu0YzU2uW84jTyEHWoILnqBiUm6g4XrSV9s7VSxlxqONsmORuVCIye
	Ur/KFRZRrx6K5QR5YB5KCcO90goZpjxFHMQlSQSk0tYAWlSaByo4E11J+Y5GOxkHLzVDzvPOdDC
	6QxegsrFx+Qq+tuQZfHYv/gDBqaOQrkImAybJ+q5O+6B8wNIqxdGjR6jGKz/7AKpG
X-Gm-Gg: Acq92OGzs6ZKFE+hm1j6swpvXJozn65K/p4q+M2GjDzjbeVQQdqGKPVNiFC5p2PT3Ki
	5i3ysFRoBUBt1vUqWgG3m6qn9rv3EE6Y+E2lsbW5hP4EYSUZ0/AZn3OX9rQKgwalgnZSX8gsWAp
	E+7+UG5LYDI0nRsJQ9LI/qorqUOn1CmnHSbrMI8t7rPIPpe4aHlH0S2WIiDTjjEm2L34fKBYqJ5
	llu1D9+D7JYPk1iuuE7zZDcTsgtfZ77N1WuW9haHPKFnt6KznCYetMDKwj7YXjD7sgg/48+r5nD
	GSJ5cjIZNwpEtgjB/3t6SWda6fdyKI+XJCwVsENVClpKVm9vUbDAZWo9uXF878ZCzY4aDitH3tT
	1JN0xrurBx7HEr2z3Zq3ueT/2RBNgqcWtdJNw17Xjb9bQypuDHOxVhnEwKmJEdBbWujd+Kz31wO
	I/6x+CDN/JpX/C6H6+uN+kTRuiM8GlkBCZRPU/O5UQclg8tA==
X-Received: by 2002:a05:6102:3f49:b0:62f:5908:648a with SMTP id ada2fe7eead31-6fefe3bbc85mr5850560137.28.1780818587061;
        Sun, 07 Jun 2026 00:49:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3f49:b0:62f:5908:648a with SMTP id ada2fe7eead31-6fefe3bbc85mr5850549137.28.1780818586588;
        Sun, 07 Jun 2026 00:49:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm2915888e87.34.2026.06.07.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 00:49:45 -0700 (PDT)
Date: Sun, 7 Jun 2026 10:49:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH 4/5] ASoC: qcom: sc8280xp: Add per-card data
Message-ID: <t2vwes2xzruqygdjasgi6akwuvephitqbyz3dntiqidbm23bki@uj22cgv72ht5>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-4-7f334e16fea6@thundersoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-rubikpi-next-20260605-v1-4-7f334e16fea6@thundersoft.com>
X-Proofpoint-ORIG-GUID: CKtBYtnzbw5zKx4LMC_9YYbTzHIEcXp5
X-Proofpoint-GUID: CKtBYtnzbw5zKx4LMC_9YYbTzHIEcXp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDA3NCBTYWx0ZWRfX+aNgmDa6OvfC
 UE0XCkxNSUP2gTy+u0nRBmruDjGytN1WdCZ1LNgGdJECNYCRoaQH5IF+YKVgzs6othrtqoclKqE
 ivGwNwiAd78SgQqzfL+cRt5UzzAyHVkBmat7OISkNhPwqM0QFIQ/kls78aLHrQ4CVF0066fzUIv
 oaEytIfbSWM7xLeIA2Dtzq4+K/wz/4rtiWkv9znEvkBO/k0JUPbPJoeAQZPdVf/XTEyps2E8IzC
 rfPM34Fvrpwek3Lnwif5Aid4H6uTqjnc8ZeqKpPwygiyCJi/TBIRuvIJtNfOa77ukRmfo1HEhgK
 LC5kfvjoIvDg35FrytLXyodYSb7s/9ga3S7yAoVwnVuo81cyNRYze80X5tWNyPtr3+x81OBVax3
 5EYys652cNiP7giNr52SBaXvd0Xk6iCLjZbQUL2tRhV2zbsc3i2K4FS7xCqWEkoywK+nRmVgi7D
 vgMWr+GVrTGQaHKUlrw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25229b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Wdb1h0LgAAAA:8
 a=ucrSXoFAGfgxklnESFQA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070074

On Sun, Jun 07, 2026 at 02:58:20AM +0800, Hongyang Zhao wrote:
> The sc8280xp machine driver currently uses the OF match data only as a
> driver name, which makes it difficult to describe board-specific MI2S
> codec requirements.
> 
> Convert the match data to a per-card data structure and add data for
> the QCS6490 RubikPi3. The RubikPi3 data configures the ES8316 MI2S DAI
> format, MCLK rate, BE hardware parameters and headset jack pins.

Please don't mix refactoring and actual changes in a single patch. Split
this commit, performing one logical change per commit.

> 
> Add a common headset jack helper which accepts board-specific DAPM pins
> for codecs that are not connected through the WCD TX codec DMA path.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  sound/soc/qcom/common.c   |  75 ++++++++---
>  sound/soc/qcom/common.h   |   6 +-
>  sound/soc/qcom/sc8280xp.c | 319 ++++++++++++++++++++++++++++++++++++++++++----
>  3 files changed, 357 insertions(+), 43 deletions(-)
> 

-- 
With best wishes
Dmitry
