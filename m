Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A25314A8D
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 19:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780860288; cv=none; b=B4+JRXJdD7E3zs3coRHeZ0Wpb+zt2lNQb9nIj/PKz5BnuDsOC6wRwewq1ViksOwX/sVJoykKfXpCimsB/M+befUZo+v+reN70YggbEJ5YvX5Ix+d1MeHQ6hoF3CwotJra4YjX6X5GhpC6CmKPzFrmcvFoXrq2e8vzMyDxvy19qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780860288; c=relaxed/simple;
	bh=uiZtP7SoGdmYWA+GnOlsHSRwOZzXjk9fopH0g7UL1V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXXq7NuzXHrFjRwWgwvjLC6ovOPcrE7MaQzz7dYcyfN9R5ox2GfvCQO7iLkS+A6G96TaAp2ard1G6DYEkLvqxcdOa2XH1XCNiSLo9GnMgEMhNAmOWD4JOLDG1VjBap1TCYhvbSFui38WfZDT1SHkSKP0xepSr7HDL46IEbXaspk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNlhldtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDvlCJo0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNlhldtX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDvlCJo0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElHHm886943
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 19:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1CKRv1lstnUT0kv9ube8Zp6
	dPQ8k4opd+3LtWXGqzc=; b=QNlhldtXJ0Xipzb+Bdrj+jsdRz5swXPXWySMAcgx
	DXPihSJ8PKjyFiryLodF1fhxnWKX7Q+ir92YJUV4OdhiOw4JGZQ4dhmlwniJtLH/
	rLbdHMlCkLQS8ZEKzUgSU0zyD4k/nSr0dZR1y5DUzjh3gi9VJIHhWG0hE33I/H9M
	a9NWiLutRcMLefALaEI6bnWSlviJNu/two6W33xxA4w227jvXV3hcZw8QfhOE4V5
	6RmLjMPPn3rQtsQl9Jk1EbiFtkHRKH5nV+O7og2CeNxcJ1Cjy5EE7/OUjHRnzeKP
	UsX+bVdi+vhC8BaTG3da7eLTIInXfU+O1puqfnHhGJfVlA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrcn0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 19:24:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a83b662fb8so4901857e0c.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 12:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780860285; x=1781465085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1CKRv1lstnUT0kv9ube8Zp6dPQ8k4opd+3LtWXGqzc=;
        b=PDvlCJo0oBnEUQ0FgDwFNr2VWP20ru5nPbxKpkFBEnqXeevRXDN+B93iIUoNIfPCYL
         M11Jd8Ukpekg7iMLHW4ea3X+r5IQcXqp2hxcAEut6OF8/UOhi8MAJO/WcTVlgG9h6ZOV
         ysj4xrS5rMNVy072Gt3K0e2+rWB2dFPNK4rzDOHiJWF3BDWi4UKVLH1QwhfOQ5IZ6n41
         CopCQ1jLi8OGf/NSzFN6DycwDzZ9uohzr6fT69iDc98qwztrczdwoiacGoxNFwnqm6ML
         yHoxhRjAmy57SXpxpjU6ovonH51qvBnwPZGe4ZzQpsEq1a+G4MVfcX7EKa+/+JYEsKkf
         A2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780860285; x=1781465085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1CKRv1lstnUT0kv9ube8Zp6dPQ8k4opd+3LtWXGqzc=;
        b=sP+aJrsbtGU3Aj4WZFw4YC941Lb0ZU5StayL3GxIAzAryYh+jj+cy+MAM7DBLGanEx
         MFVXaQGWp6hA3d9xf5witBzgaRlnPGv2ybse8Htp49+JwSitp5555fBf6txkxpK08Lrc
         WwTcW+oLZ4g5PFoEl7nDPSp/Hn2RqU3AX2oQqqjPnds6lwotSwtqFognd6at3JPQqviB
         SI1S7ECh0kg7SH0KgISFgnY5tHZtRs9A5ogWMLgkn6CC+/56sYr0AUZtEQiPhMfTcwNw
         i+oDcgRQO3zYi9AczLn9ogc55EnbXL+eoNKDx/cuRyd0zV+bW/OdHjljxdELVBMrtI/7
         qaLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qQClJtjLyb2AwTd2NN5UhfluYrPvopmZmgE1vW8OsgZm/KHwNIDpejh3eOOnw3v/KvCOc55EAMsRz@vger.kernel.org
X-Gm-Message-State: AOJu0YxJdfDvUY1/4FCD//cNj4GqMJ0gwFVKWfHixX/ho0KVDJRFGJw+
	TNGfDEFgW4d09sDSOlFjM+lBMPdiGJuWJFwnPvwH9r3gg9Z7UAvGE+7c6zU6uCyUqRZ9lXArhvd
	slCpFDxRWDUF8X0ShMCFY761i7LYNk6WMZRhxYXPTDqfv1arlL1WQ6f+XvLKgWt8d
X-Gm-Gg: Acq92OGrChLknMi5TBoPYou46/XoPtEE4J9haaECxDLcLCrB+up2xsXxvVcEquSQ8Kq
	lvw9IKFrC1UauwTOMfjZ3sr/CSKxLcBnkOZuO7KqgYvkqPeXCa9WspJUpEoK/QJELH1IS9btkyQ
	03L5L4r5LHPVqmLlsGdGJ/8wiE9VPuR0+JA9areVBLGYkLClenKbtlR3O2HkWVyPvEyDPLsiKLk
	aQhszsQ8yioUuC17IKSXekZr8eb10cYjHmXDWJCwii9tuhki8u26SjTnIbMB90dbzv7AkzV642U
	bwi3o6sNvSlS6Qsew9afeNNgd/CKHkf4/saoYlPAyYzfkWTioXXJ90qRBFOqYhtZSoKR+9p7mCn
	ge4+FGGg4hoGIB6cEkAulR3ET90ZQOUnG4RMqqam6KUxJo0P6nsUuE8NeR0CNNGg20VXU1S/LUk
	oVLHilVgDhvxYlozR+TAzx/pIm5TWBH76rDbp1ZICKv9R21Q==
X-Received: by 2002:a05:6122:8296:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-5ac4e7acf3cmr5447709e0c.7.1780860284916;
        Sun, 07 Jun 2026 12:24:44 -0700 (PDT)
X-Received: by 2002:a05:6122:8296:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-5ac4e7acf3cmr5447701e0c.7.1780860284541;
        Sun, 07 Jun 2026 12:24:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed718sm3199990e87.14.2026.06.07.12.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 12:24:43 -0700 (PDT)
Date: Sun, 7 Jun 2026 22:24:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: Remove the
 little/big_cpu_sleep_0 idle states
Message-ID: <qlraiygk7tcq5xvdxwp5ijfffhmn4akza237lij4xf65fmc3dj@33yozanoe4rk>
References: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
 <20260522-ml_cpuidle-v1-1-fd311cf33fb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-ml_cpuidle-v1-1-fd311cf33fb4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE5NCBTYWx0ZWRfX3ZkzXa4F7PZO
 PMgjAVwEeVDUdxxmv97U+RVgKYbwCjAIT3jYaCU1MxdqG3ZD8ruKxDTmy6zIAtsg2/saTmtbTjT
 lk+NXp6KTUa1PJQPVdssjSoB16icd8NWLSn7L3YMfbuEfLCw/68eVhCUJSxtsobvdcGotH+5x15
 stp03vesJy0pdOZQ+oXOZjhqorC8Pdz4KE80L2B2bJgfBVI/o+emy17ibFydPJLTyRP3oEmksaI
 2jfxOuMAotJcxTtpqHXpqgKK1UxA8tKTJD2I1ybH9pAP2OU7LGw+Qo6VPVL1zzsq9SpsP1RzK9D
 yA62Pu/OFRjCgm1xZQZIps9HZgticzAHi1kzXzJ/P/IMHf/tckeWwcEcOYrR5z7Wh9CWR1zTxWd
 RqeMiQdzcqiW9RXj98p6oOgIsSX1bZTZECf7o+oS8MC9kN69CuFqNdlxPhS7uHrV5z520mX9N3o
 7JVFzMe99o9V8zbQhjg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a25c57d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FdeHW23CIx2ZWAafQ3IA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: qCTC-zWh_kYCXdz1ge2uLcK5AkdzH-6L
X-Proofpoint-ORIG-GUID: qCTC-zWh_kYCXdz1ge2uLcK5AkdzH-6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070194

On Fri, May 22, 2026 at 04:40:13PM +0530, Navya Malempati wrote:
> Firmware supports both CPU power collapse (little/big_cpu_sleep_0) and
> CPU PLL/rail power collapse (little/big_cpu_sleep_1) idle states.
> However, CPU power collapse modes are often not utilized in favor of
> performance, so remove the CPU power collapse modes for monaco,

They are not used now. Will they be used if the cpuidle governor is
changed? If they are valid from the hardware point of view, why do you
want to remove them?

> aligning with SM8350/SM8450/SM8550/SM8650.
> 
> Rename little/big_cpu_sleep_1 as little/big_cpu_sleep_0 since it is now
> the only CPU idle state in use.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 36 ++++++++----------------------------
>  1 file changed, 8 insertions(+), 28 deletions(-)
> 

-- 
With best wishes
Dmitry
