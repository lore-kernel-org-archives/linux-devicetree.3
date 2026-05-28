Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E624677B
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975987; cv=none; b=mDHy999jIJr/Hyq2W08KagChP4CNvvt1KvTc9/T1p8C1GfosSUYFNDBpwrpuA/mq35ArkLdCKiXzCGZ35fh2+pD5Q4vhlWPRsgs355lPqlnNuhm5jKjB+Ky50QL+HhMddhClnLwPvyvrcqxSHm/2tokIg5fBsgagggjrT9NoDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975987; c=relaxed/simple;
	bh=7VV/t71l+0kX09iU71UG8VmZYWugkTXL8rSSpmoZ2oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWJZweSCToxJ+KE5K3f3Xu2Lua98FunN6NJ00vGazfl+SgvXKb8mANJWwdYcKFO/FMpwyX6h2jUEK5oYU0DAUzBda5FbtdceQ088i8rv4bvNvtBrOQMWpaOY/9wa7hFqCdTv8AbI2WpB6Gj4AsCWWrWo7x+CrC8kz3LMA5cTJuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5FThEl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsZifynL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5FThEl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsZifynL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vUV04184511
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NpU3NN7FDiNcysH42nW1Cck0
	RUxplWQ1oX9H0ThuCGo=; b=p5FThEl7weuy8chHSPFuYlh8bMwcv08ebX0hqkcd
	UmfZ8dB5Sz+gF9rxD5ZycqOR6QqKn9F2tvcpEk8EIuolcSPySmR1H69mEv12aKKV
	emZhJA9uFAALV7MZ8cA5FoIk5cX7iRtAjxvQIYkNIMFL1Vuy5X9lfx5cEobM4QDf
	r68eNSBsxeT6HPW8Ap8AplawBQ/BIkbAQG2k7ScncV6ounta7CStnbppe4/EcQ2e
	z7g1yZPxVUI+4xMNsmX5Zbqf1AOHN9q1HAtiRUNUMtS/91hPjTe8uUFdAMH9p0+Q
	gRWFhgWm0QIDAJ7y6HMtz5nUxtiiTVoI9fiHxRhbW5QuKw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yf2y7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:46:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63144b84f14so16141372137.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779975984; x=1780580784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NpU3NN7FDiNcysH42nW1Cck0RUxplWQ1oX9H0ThuCGo=;
        b=XsZifynLGn/CaZVV5nXiv3P8mPsMLpOtqNvPaucm6iHmSX6yGkJ6XY5f6FO7a+TlhI
         4xJjumsq+MTPlwTPMnVBGJ8PHQKgzyH99gY4G5FhBKUTfrH4RNAHJ+M9Rmfmf2k6DlnM
         q5CS8c2B0Q939QAY9zAotREF6T6HfRGw8ywWaN+dyIFc7a+qzgXiXd6EG48j2yydSjDD
         +dar+zL7JZciN6PQwN87v6Msc9k4YNgxYedgQnC2MbR8PAIrKvSqhCwe12xWlt/mw58I
         AZ0kBUPtI1E5caK4hP2yNHbiaRq8nqPk9LL5/zOg0otZlYXL/uj5DYyvJcpU5DEaB5Ho
         4HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975984; x=1780580784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpU3NN7FDiNcysH42nW1Cck0RUxplWQ1oX9H0ThuCGo=;
        b=DavCWSKQ7vXuYmCQnOMnAQl9zjoWibDTEdaMXyDb8y1OJGKQTe8z+cI9Ud3rY4XvdS
         N2BU/VSPCfaahkaFAFOVT6sXw8Q8CeYxufJa33lTEEbfKgaVEuymv8RyhVVuu+e4iA9X
         u3iayh+6ny/7OeJTBc0Jk4Q83ByxikfFY/2KfgwjafrPkGv+ya4JMfWgKyBrb3P/jR25
         bEg+SMqm+MxjQ/5AqDhaTkDCMx+uEmyhAIpVLw9KSDANLXL8HwBm+mDZxkCoCGIbKMOy
         QLIEQuhlW9sh1YX/lSI3ewBxjqHk/ShuRAMVqnaixMzetKkos9UoKWri63E5W5kKOw66
         s6iQ==
X-Forwarded-Encrypted: i=1; AFNElJ8l6lBw02/kyecn/NRSY/C0fyBcy/CmVi2nmQjpH9G4yUao4MNuIy/Opz+r9mM38RHi9/r0HVjG2817@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ57r64EVHP4ivmedwhPbHwIora/kOfplN3xxzItxbAWxq7mEe
	K9S3HY5NvL/5Ik99lpQ7pxqUCSoE0ViqCfMpyq2UkieLHVn6ZTPSNH5NNIN0/eHfyIMLtW3xCYQ
	1PVH/C3y3estaF9Bu5rbGEMTSOeMkdQtX+eAYQ0hj2dgIDAIr88fZaBCAZQsK5Jxf
X-Gm-Gg: Acq92OG1ZydCvUqHt5H/YRtE+wC09ya8U3f9sLFc+VxRUy3XSy+1NrUhZddiHI6zolV
	8NTkAkpa40Q6XgtypM8OCyVX50NvKkaBrAZZH/Y1FeAZTUSbmV99KeTXjf5WyNmqsY4lvTsgDfi
	gYY6Cc5R6nFlEFHUsPOr1NjkLarjHfisbOj5eeuQCcb/4a7mM83VrbpExd+2h4NnTheOY9dOK05
	Ep0bgCSGvGRrlMV1RfqbF6OdoRLqzlZURXxaywBufW6PUUbruAG+7d4yVRpo8LUnJHB7ExQZt7Y
	eiyIWr/v/Pnzxvd6Wb8a+t2NkVWkpKDMvrzeYg3oQNtT8rRaoHLlfJqLcTIBoQ48gFYhlLRfiX+
	OrTDVrc8wSbLfwqQieh/O2hp9jhFnv8PJEfjBbSM9f0Ksrvs57MkqRFAvEaW/2iU9K97nV1yjqE
	IzoLtANEbdhd9oRYS5uUkQzvfeOBaWPIpbwm/M3lSyJBTcMQ==
X-Received: by 2002:a05:6102:2b96:b0:65b:47:2c8 with SMTP id ada2fe7eead31-67c80b74c05mr15133710137.10.1779975984264;
        Thu, 28 May 2026 06:46:24 -0700 (PDT)
X-Received: by 2002:a05:6102:2b96:b0:65b:47:2c8 with SMTP id ada2fe7eead31-67c80b74c05mr15133652137.10.1779975983879;
        Thu, 28 May 2026 06:46:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2c6efsm43049781fa.29.2026.05.28.06.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:46:22 -0700 (PDT)
Date: Thu, 28 May 2026 16:46:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Message-ID: <mnbrfojxfu7acedzvaxv3wpkcv6u4fhfoc5lh7xv24spm7juvo@srxwa6rnpje2>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-5-953f246a0fbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-5-953f246a0fbb@oss.qualcomm.com>
X-Proofpoint-GUID: Pay-4KLZlCHYdD5f-oxwiNVZta-A39Eu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfX0xKduj5wFTfG
 7+RReyGU3IllK2uj1zmRb0s/WyBEASw7UUZP5Nwl5DuOeivQafTWYxwpPFLG87xzAB/2Tr9BiFg
 xgHf2tznmO9LQN88N809yQM66MijSsviKADGjjiCEsjB143pdNzZBsJFsao5RJvo/KM3iadD+AM
 COsiDsTOKCRLjzGSOU68YihoGpjN6/539bCP2xQlMbNjBJf4RRo3yeM8SVCoyieywCtqOFXyhax
 0pMVRsPJFpWWNFS6oJtvlpdxnILhSnGM7DW6+yLbvb0k+TvdTonXHBmmkO34k9b093mo7LrDk5c
 yDFpxrXOJuSkmALPl/UOHj8Ky/FpKI+xJInRp7JSaap884kkZWYjPE/F3H1aqhmbACrdSfmvKvU
 nmHqu6csRYVoIMCl8Uc9vfq1OicWx58ZqqHDFfRkrbr1Rr8dZKnHSMam4BcOudjOCbFMVLMEkF/
 +VG0XwD3y4HPOpIyBVw==
X-Proofpoint-ORIG-GUID: Pay-4KLZlCHYdD5f-oxwiNVZta-A39Eu
X-Authority-Analysis: v=2.4 cv=G8gs1dk5 c=1 sm=1 tr=0 ts=6a184730 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=bx6E89HPZMyV9SPDFu4A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138

On Thu, May 28, 2026 at 03:37:06PM +0530, Imran Shaik wrote:
> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
> hardware block, with minor differences. Drop modelling of critical
> clocks and keep them enabled at probe time, update the QCM2290 GPUCC
> driver to align with the latest common qcom_cc_probe() model. Update the
> GDSC *_wait_val and flags which are applicable for both QCM2290 and Shikra.

There are a lot of separate, unrelated changes. Split your patches (not
only this one) following the 'atomic logical changes' approach.

> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 174 +++++++++++++++++----------------------
>  1 file changed, 74 insertions(+), 100 deletions(-)
> 
-- 
With best wishes
Dmitry
