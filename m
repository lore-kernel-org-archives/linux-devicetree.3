Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13144EC649
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055719; cv=none; b=ZiVp+2s9PaI1+RVa/85TGLp0htKr+6uI6C6ABCbCKL18De3BOReC6minChIEJYNVW332ayeMOMDNOYI0QaIrxSNiDW9wlLAz9Ba2EI9/xfF+MaWNyGd7uJ9uHPPMGIOEMBhgYx5p+DfYZNXDefA6TNns+7vRvZKI5jN8VEmeazE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055719; c=relaxed/simple;
	bh=z+BWBGlvD7j43OYcW9UusO7ekWqnSZaJz9t8vXKA1yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9o+UxmkjPqtAROPnynUNv82X+iYT/aXjWOdOaH7GN7UViwirQLzs4+Kx3Ki0wI6i+7GOZjn6luEIVhP36MI9i2afLPL+I7NurjJiXRnXsdE3MOqo70PLfVDHYRGy2UWwhBB/x/7+4fLQYf5vYlm6S9javzANj2h3ayc/tnBhGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azbW2sya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/zDq3Qg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azbW2sya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/zDq3Qg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F8vuId2885810
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=; b=azbW2syaIxiAklhX
	1zIMGP1og2e4iIi9ZHhc/SANhUraFuOr+/DGkSZWHbqw4LDmzlIxtiCbn/myzXNE
	Mom5KNaGtL2X2o/go7Lrvgp0g5WCf1wRU7ZyWkSwHwdU7BRv/B5NvgaAZJpjygav
	XaOdj+OUU1WD873tYIT/RfH13BFNfdwHuiGF9xmzJlx3GFqfrd6r1xBrIJOgFAQ6
	pD9CtFp7+OYdltJp/tR6hsxrOTnzvCiC3jBVd3yr0PHyz76iURhXVed63SB+9C68
	LuAm+6Zt6ZZ/qn76rPwrvVQm+Q3lMLonpHqTjcLaiqi7yAZR4FZHtxUIuxmpYMX8
	4gV/EQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm02vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:15:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338bd59032so12258461cf.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055713; x=1792660513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=;
        b=P/zDq3QgtbushQu+9gMWt18bLnV5p42cAetdcCr5/m0UXgXhqZtvnKTxeEKCDVAmXh
         CmSPwCidmnApA6fQxwF+70a4Y8Tou86ytsMDP/CiQ1cFtD+kWCywqNikmSV3BWHJwarz
         fPtKesJ4CPgRMI9IxxkOP/6KsS5WEZrYZV601Nj/P6pMQRpufqIBfoDw58tVcfZ5YJJe
         5dhLpzOPYMzKK6Ab2gLcSFw3MIn7n5azVQABloHSrj0q0XJ6bnl/2JOYk/dhKVOpbjQ4
         KJOQRLBvdFqZ0rDfaABCvIc6nSr93K8MYhNS/BW5+r6aqGfbHJqtOSQl221CySE9E0Ie
         4uYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055713; x=1792660513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=;
        b=1hpusFZtZDMn1zXao9BGj/ZSHzNQneC9w+Ys1jE+TP8GTlkL5MViE/SIbgrhjRVc0s
         9o7SxID3mb67/1rwXoD+yab9b3+UA/B575i/b6vsJs9KydcnkhkcIblKv/LQ1nhYSVb4
         KJbfpgJhvY+ELkSIY0yqSqZf54ztobsrSXdbmSkD4PhIhrynY/lvgzFPW3KcgS/tG0di
         CUOVFCyZg8eyURaCLBmbFGLv3cb4gxRDTgAPDNNO4FeS+AL2VJr0wQnAb28Duzccn/o+
         UWm9tpMVtX3PHnJ/41yV9z5EL/207Bh7MYMIeTr2dnV/t+hXo73yHKgPFJX9b4pCRgJr
         zkHQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0e5VKzpm+Ykb+21Wjrr/dQat11VwobWdbRWZ4G5J95AvA27GkVcuZ2wcqGFuuJyhNN1XgllYGDhdN@vger.kernel.org
X-Gm-Message-State: AFq9FYKz7/i2UD2VQ7LKUMAlkqtmIQ0G5Nnb0xHMuDMyBqPJI2gQ6kCM
	6CRGlySTAD1h7VFeEJBnK0SwsT8tKsiLa1ekHjuJjzBJ0VB74jdCPWvVK21oSdDJ8D/I4+L8Zxl
	ygFMRyFjWrTDW6u2oIFYOUwI0yaq6rL7l78WFlKdcAR4CACMtgy003m2YHGmATzcZ
X-Gm-Gg: AYBFou3K/hVy1MnjItA4lRHqbHY6qu4tF+aULS43EU1LTe2PkLfQl1hLkeKrtpVvaRC
	XWDqcZkK/cV65f/M/o8i/vUzYb9l33XvaT5cVcsyQPHM1AvtxCj1FGgdbOHeKWTc9XZ+sDhG/Fe
	gDxWDm7VrnB+9GmNXCFaqC2EMOIIPRoTE29t+Dat8m4e3p9jDGIVxbZModt+fCpDQYBQKaf2Ijx
	yp33v58afhN7aKgUa0/hKdEI/837ptNw3O6+Mdr8dSHhNH4K8nOzTmv+abFXMrSYPLScSdVGhAZ
	214MH7VYOPkjbW9YiMkBCsYx31IJcmYcCcRKwBuSojzfc6Ff8Wd8/byuNgFs1kxe2noO/owbW5o
	o/gIySjlBc8cjARZMkOXOqg==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3410266585a.6.1792055713625;
        Thu, 15 Oct 2026 02:15:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3410260685a.6.1792055713032;
        Thu, 15 Oct 2026 02:15:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6f15sm101465966b.10.2026.10.15.02.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:15:11 -0700 (PDT)
Message-ID: <0e456ae9-7286-4c4f-b56b-9bbaf4076732@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:15:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sm8150: add MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: maHIFkh6k4lplLgrL_A8tRwzN-E74FEZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXzQNWJgqEl8Rr
 fkzgo2+xgxpJNhSy4gpoTkeS3yLkD19LF22wQnilPzHaBQhi3dalwrfzv81m+w1P+qFEGe7x/hN
 DHC6kuZ163BbxE5DA6L1bieDjd2HyAutSwu8jY5x95GJygQXHIU09g4a+9jhva9gwvP/xavDjI/
 LqK0leyX+7NYE1OvxaXsWYIjC7yVGD9wTb6Bb8GXf3jPk8klidFDXPP9H6md8dFSXG3UmhOJhTR
 rer6Sd1T2J88C0FZ55DeAkzpw19MNvbHWO7xnk1Y37TNIbAGAGU95jSM1+en6B6VYadwTkibP8h
 aMli6fllgwiKvnJYP1YBWYbvR9MSntrNYZir7gymFVy1uwRBn1FVMFwK7BchFM6MRsxaTVqMJcN
 A8SlP0xnsxR6cp6vVf+63vpDDJgmhh3pzOvqzSc5spds1hpOCtoA2Zx0GIi5DoG8iXhdjU3l52z
 C7CxfS78vBVU0PCbHmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX/Pw8s5LojWtN
 TBBy9vi+XabVkimZLHCSmhBjJzDvhN2bkd1LYYYZvhqrNtbXsGAbaUuBde03Qgq6FKZeUazptBR
 o9WPke+1wJVxI9tT/IVFGgtff60sO8o=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad099a2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Jhhi1Yo89JosEC0CkA0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: maHIFkh6k4lplLgrL_A8tRwzN-E74FEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> The bootloader can leave the display running, as it does on the SM8150
> HDK with the display card attached. Describe the MDSS reset so that the
> driver can bring the hardware into a known state before using it.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 293fcbacff34..a2d6e6947c4c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3817,6 +3817,7 @@ mdss: display-subsystem@ae00000 {
>  
>  			iommus = <&apps_smmu 0x800 0x420>;
>  
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;

please put it under clocks like in other DTs

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
