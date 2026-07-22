Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490C533D4FD
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725565; cv=none; b=JUkV8DNlUJszLKjKURfjlgexRLAjuJBsX6RhKaaCbnPncLFwlWbCPHj6rZPnOGdn5PLPqxQspe20bviS5W9r/le3R+UfpCS0Ger+ZfWEhHWs+wUF3Yi7lG8b4cxhBsZ+DJCDUsvZyw+r+XuV6wRxl1w1ObS9CfeNiXj2LBaZx50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725565; c=relaxed/simple;
	bh=Vk2Vq+VXn8LONW/vhgt21cIe52vXYnSPnpPTrDvoAsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdOSnS8EmxtcT93AoceGffjWWWw69mEBfhG3WEKXySlr/cSFThNrGrsA4lk69fBRrUKtyGB/82raUPEN/40D+AfVTURidpgZe0bmeuJZMe9eYy5uTfwKmIlwNqbiV9M8WHrRNgT7+G4XE/uXdKU1SUvU18yf5m+PAPBVhPM1fxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eU0wrTlZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXH85kpi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eU0wrTlZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXH85kpi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1rJk791790
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SvxQL0a/Xxqh7SF65Tm48k+c
	SHEQWzeDDxLTjplePxo=; b=eU0wrTlZRaKN/raHuNVHEcEvs0l0W9FA4qCFMwOq
	1rP4gwvDVzDP01wbxcmp1nLK3QPqCjZJpY4t/LDYoFqf5NgN6l7KgCokxMG5C1Si
	Bt8XVQlywd6iRdKiRtUUoi+2dmUIFKNDHpTuUQwrHvpt33H1pJvpwzKFvOO6knvR
	mDfnCPZ4f1D9HeMIlyoumLocTuFn92vnQaONFA6hQNbITDEmME41pRTN0HVdaaCN
	bmE8Y/c7ixwideqk79IrnqZkTdmBBbK3GwliJ+m4wtmTkaVu0JpdZPX5qLzyAbk0
	7N07vTH4rprNUyP2khh6dt2ktYHuedDZsaXTkQN+RaDxVw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn28ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:06:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9771a7eaf58so347267241.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784725560; x=1785330360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SvxQL0a/Xxqh7SF65Tm48k+cSHEQWzeDDxLTjplePxo=;
        b=TXH85kpiJzklN1I+NIz2ze8ewDnXR/IsyT/o/N+GPzGEvu5h2lwW+513gBPLcMumNu
         u4fT9/GWGV8OI6GCjCCHWr4TAvCPk9Dr0plXHRiEGBdjontiXpjIxP8xq8DLZ1gJZubC
         TcAFEuE7zxwACiHeoj+oXZhgNtDNh3jcHcrclNAO3hbHB8tVzHHN77/kPhxZcmUH5TzW
         02qf818c426wcV+XJSA1r1836fT80gs2LzUxD5LTbh9t/J5zZ0aEDAl93AbUbrTs48zx
         PucxC7/1YL9rQqdHN1hYue/aZ5womzF7XxvhQHc5xJezkgIxKZFw0ZCADp4p9D6mSqG/
         S/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784725560; x=1785330360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvxQL0a/Xxqh7SF65Tm48k+cSHEQWzeDDxLTjplePxo=;
        b=q6lQaUwQGoNpICvNSaIq6hbJEIAAkemxucRofgPcq5ktbn0KbCSm+pZPatijSoXomG
         8IXa70grudwMuAsPPqWpu+eLs8nsWCDnT2aYE6DRXku/pWJWm930Ag+dE199pfdKq67b
         vHnJ0He7i0gab9XLjnw/BO/LposZg1cFp14lYIcTlcyeOIAawudRorWG8Dv+B9B2n/BN
         gI9gqCvTJUefMwq//YSLiywnPNZdhBcyr7fOWtnywLDB3bJ0OC+KchpL3lq0xgdXRVXi
         j/+FT2lJFKEAECQtGbxviCiVOP4kQ9PO4UStQmuf+Zo0av21TUv7cRwKwkCzROs8NICR
         VGgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFWmYqMY97HGbAaxMtM4UUvVju0EYY27IbCcz7JkgwSnNHcC/t+YOL3lYbKDkZwyJW12RPtUYK+qIF@vger.kernel.org
X-Gm-Message-State: AOJu0YwgZJVcWCbmzvJt1hvUeEhWvaZJsQ7r7XP/8B98UTOpglZHfE7X
	mFOLmkLX3rHeZmKGG7WljfFsYECPyuA9fvYB3Ypos781uFoDnmjRwKX+onN5+d6CfNiSIzXeu/P
	eoi1IWR30ZBk4J/Mu7LNGVfSippml3NRrP1fhOH/455wqrTX18DC/2/cGH1zqdC8Y
X-Gm-Gg: AR+sD12kTE5AlwvDdXiN+NPQiDpZvTwLZNcKPny+VNqRSdODvN2q4XOU0F1MHR1lNtu
	Hhcxq9VQZdgaM7p7zkLbt75sSuNOtfqZW7lx1q87G+bei2UfLuLGHFGbRxodRK8N2RciCnFnUcZ
	T5LzcdS7LNsZnZslk/m/u0LtfnNIbGJQ6gnq6PHKIOp0tpxg43AgWNqZ3EVRyU7mqTKvAGPwDz3
	vjZLumR23ZtX4Ghy9h9iogMnQVSiD6JphmvtnERXqKYPLQLsbFW87hcOaXAOMf4/cb9DcFEcl5B
	uXRYfSRUbVZLo+hUi7mFSHc0LOmB8bHM36gDRRDxaZgvYWjaMPprwsqQb5Uxm3CsYQ0KtitmhwW
	0BJScXm5QQK1b3x/1DpQdox0M7GBlnqv1pBONYaAl0hl/aTZcOrpSjkuEzSMz+oE/GuO1G3mQ8q
	p2UhVaTX11T5hCFw==
X-Received: by 2002:a05:6102:149e:b0:728:68cf:c76 with SMTP id ada2fe7eead31-7475370d2e9mr6967689137.23.1784725560019;
        Wed, 22 Jul 2026 06:06:00 -0700 (PDT)
X-Received: by 2002:a05:6102:149e:b0:728:68cf:c76 with SMTP id ada2fe7eead31-7475370d2e9mr6967669137.23.1784725559500;
        Wed, 22 Jul 2026 06:05:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d433f3sm473527e87.55.2026.07.22.06.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:05:58 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:05:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add Kalambo CRD
Message-ID: <t4m4ct3dgqu7s7g4poc4uxflzxfqb466xckpodonrcb74n5rie@wixidwx3ohd4>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
 <20260722-b4-kalambo-crd-v2-3-32d4addc1ac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-b4-kalambo-crd-v2-3-32d4addc1ac9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60c038 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Hkh_rGh67Udisc0sesIA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: MdD-EeHO-9YkSvZNXctXc6ZJPUXuwuTM
X-Proofpoint-ORIG-GUID: MdD-EeHO-9YkSvZNXctXc6ZJPUXuwuTM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyNiBTYWx0ZWRfX79L6oU9ogivX
 KawS7BjrGBRZzAq4e1uHv7BbxJYKakM68aeY8zUaqV9KueDovYOcr+UXu5oafGXa/JFH/RTwSRT
 yv/imXEO261EuncP/Vc5NvN/sMQ5TMg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyNiBTYWx0ZWRfX0Vwmk2OiGo6i
 jC2nIu+aTEpXz8S6dGFXaljskjOClv39Dfd6HnzZRoxbe/g1XobDg+d5VeNiTjgDJPknNlByO11
 iePSXLQEEEfWZJ45E+ECGQOH1VEwLYuL8vTcIL+fUkANkK0fwbojU1kHkofFpCmQiIzVEV0DFHI
 ncOetGFKBwAUNfXZFauIWD4ejUxL/ZX9RBzqAhZzqPMqySESWsT8JToQwW6kX6OiQazFE2MY6mh
 mA0m6+okUBkInil7iSbFPn+3c5Ccok8uxy+nsxeL0EI0EqqPItS633uRNJICtj9myDDzPCddfFc
 v3gTS7OfePWr/e/Oj6o84UW4kJ8QLsJ4+pZFzu8csFLvl2eG+GYv+uTfOYToyhgmf/FVatsjrx8
 GAtMg7XvWZmZwJLmLOPFnp8ncEoNBicYbNUwxlC00KGyNP4GR6GuApTO5f32me5PqahPYMeQypA
 owwqTuLgm9kJkYYeYCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220126

On Wed, Jul 22, 2026 at 03:55:34AM -0700, Gopikrishna Garmidi wrote:
> Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
> to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
> common CRD board description and drops the PMIC nodes not present on this
> design.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  1 +
>  arch/arm64/boot/dts/qcom/kalambo-crd.dts | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
