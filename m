Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE5141BA9D
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013599; cv=none; b=sMShJp15vcis4wWvxPlygmDzTs4CM+Mg29leGh3AJS6IUFJ1F2nGZnHcInZ8SKPrP1ioCmX+CB41B4ZNqH4+oL4JUByK0Fn1Gq3g27hgRmKVT99vo35mEXmReyoF3wvubmfM2f2HlHOrFAmiHp569XsjpfCCEBW+6j7p2ps0DaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013599; c=relaxed/simple;
	bh=6kfvxPMvARACXuMOizxaC6XrksJkpRHPy9i92fK8whA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2BuWZhKZz0/NfwexKQO0Ouf10h4Hmwm7QGu9k6nCT9P9fVEEu6sis/8jSkaTJF/EZaAR3IEpng72USzW/iLSb+Oham/yyXNXyiC9KDQO3/zpCHcCtCE0EF9HO4Zznlgin4/yrk15qDh/dMG7oKIKIp9Y5JBM78E75ywtFBbdoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1FJg1vp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqGh2i8m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1FJg1vp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqGh2i8m"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nd8A1625667
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O6LhErayeVS9Tw5uX7z8/pZd
	oGU0JEh0a52vMwvH3+8=; b=K1FJg1vpgk5g/wO2pXWL7xkBjcNgRPCmNliyEDk7
	Vd8hdhvoS5oeko/9Dcg4A8GouS82qfUiVZEoPR111YRBHlBZEWdyzVEdWFWrNmW6
	+EIEikduia1hS8XCk3BwB+5lIxn99RIj3z99ZMfXifhAIqlwwoOATDUxn+SE/Kbw
	dOA/YHb7f9xRRToIjTNtdJvKe+2DbFfI/GLaqucUEMoBSPIfMsdr6Rz3kwjcMeug
	E+puXeTFrN9sFVGsXBBdHgaNJ5bL0X4+CftJ8vlWMufajroIWBk5OxQdoV1JfB5P
	JxQBz7SjXHBGCp1CP5nP+U7EfsehRX30dw233QblnRBO3A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntngup3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:53:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so21575821cf.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786013595; x=1786618395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O6LhErayeVS9Tw5uX7z8/pZdoGU0JEh0a52vMwvH3+8=;
        b=bqGh2i8mK+gO9pTAFZLuKPT2eqxeLS2JNT1ZhXoRgoMU5wJxtaKCWGio8IRSv2S/s9
         bjU+OoDj+KWQTY2/SJpJYVI0JHPITiqWECKrHGUtUVXHQj539A5qGFGBK7FVuNvCCB2k
         2+clbumuzstzvEZwYpCVRiFMwd0i7vbAIOKURhYhnv7Da8ZOyYUOlS9z5+e8+a7l5rD9
         110Ldn+iaBl6z3XQ6C4tZXOFIBVii8o3WiEe2AxeTK1GBjeU7zS27aLxuSUevc1QCy+q
         IUO2qEDqCuNwvV0i+lvOeliIeTYwbaecdso2X1VPL2LJOtFtiFEr/WlB/kcbqRMNO7rw
         nHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013595; x=1786618395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6LhErayeVS9Tw5uX7z8/pZdoGU0JEh0a52vMwvH3+8=;
        b=TWZRIcANsGxTGtB6aFThHPiNmyfKbdg5qZ65yXJ4mYdon7m6KgeRbut5mjr1kfTnLf
         a/KVWOJa9WooMAgMsSd7Fh6z7tFGy+NHUwvjhBSPegvrF+szMmh0/SOY7XNrrG6Aq/Jx
         9dnBt9KOOyhz+R1D2T0urqCYTeqDn30tz37ojQLDOssxWd7dZgmUzl+eZimGKTGgu2uw
         9gjx0wLx/b6+SdaJZ3LIRufCExFFCUPW8roHgbImcPH6h3VEvU1ZLA7wPBav1/ELKmVy
         4lA47yx+WIkltOKthdgpz11+r3jAJ5rN8Auh+4YOqjpbogPs3hnOKqjbk25mTg2lUgKH
         kY1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoX113H4rj+DeDNGqBZ+qzfQygRg1AHzb+zvwMh+O0+qksHNzkGlQeC1iQsO2EFaNGeam48oBYY/zep@vger.kernel.org
X-Gm-Message-State: AOJu0YwDulxyaLdvifhNtlQ00cEpp0Z5CtAZPtciD1m+DGxox+XeVwh3
	iiiNk8ZS+jlD9cFaDPHlD02PMt7JCdZkrmwvWci4vA9sle/1Pva40YXFHyh3bshxka0DSOjdNnv
	LicisaroZo//W1gJ8/l0ZZieK42/j5upBnNaG0Ef4kJi1sVrolH0bli+dqtQF1bSH
X-Gm-Gg: AR+sD10EDiS1Suj1c2aXE/ha2femuG4ogm9T9HBHC8bHb1UbBuDdT9g+ASkwYAzW2rP
	hZRmgFyvh4ttzOwdCDBGoz7Bp+FdxwpxJDYinCjxMRMLJAreRPUqDs3vDLwX/yPgBZLVv7YJDAI
	kPCL5uUipfXQxo7h/0Nx86BMER/AaCECM/2r8hnKP09jirmVy9AMZ5PwQu3or/28/d0jHkPm072
	lhYU1yMaVJakxL4uMA/rfGq5rjb4Kix/qkpuMcTmcyDHGtSjIECH+Gp0ayBjzMccVt/4jaFs0Hi
	0PdwKuuYBbn7Y9C0KQonnQFPylhu0E352P8nrXwOWd4Qeu+6okB7JQor029YbxV+gbD4bG8RSqK
	TA1YyY9y32SPhraVh6t995K892U1yR4dcRmSvZdYu8z5dHumhK3j9MY5QSL6mDf7CHJ0grvTjGR
	wX6Gp665ZsUsPc3w==
X-Received: by 2002:ac8:5cc7:0:b0:51c:709:b81c with SMTP id d75a77b69052e-52ce617568bmr143925251cf.32.1786013595363;
        Thu, 06 Aug 2026 03:53:15 -0700 (PDT)
X-Received: by 2002:ac8:5cc7:0:b0:51c:709:b81c with SMTP id d75a77b69052e-52ce617568bmr143924621cf.32.1786013594890;
        Thu, 06 Aug 2026 03:53:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62ba125sm628611e87.57.2026.08.06.03.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:53:13 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:53:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 07/12] media: iris: Create pixel and non-pixel context
 banks on VPU3x
Message-ID: <ivbpgz2kslg2es3g6y73ubiv2sxihcmqqwwcgsckgo7zxkq4ej@btb7onbtpsu7>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-7-da52b5228dbd@oss.qualcomm.com>
 <4lhoiiuaiathwqscyvm2ruqfqnz2bzjbfe7s7tqbcxfcqphjas@u7vvrj2scxi4>
 <639adb25-2495-476e-9b8d-d07d34c12895@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <639adb25-2495-476e-9b8d-d07d34c12895@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfXwWEIDLDfbvOp
 KtfJxdZ2ykIag6sP1AnmK3Tm3ux7+aR0Mi33Nrw86lyxAc25rQfPbDP8azR2QF+Zp3TB0LMAx0N
 wyks0ieKBE04MybzgWwuv9N6GVI4pR5nI4Z0pE3Yyke4E2APL5F/CyFiLVYKsUIu8HeePGGzts5
 qTotzOxRg6MgWESmnnANpKOcEMJtDMN0QSUm87Y8ptx6lzeVNwgQGk22+ii1i3ANfaVpLznPwEr
 iWopuMzE90VpNGwO8FlPrkD4if4smFoMcsfzi3ozaGDl8Tx7wmlLs8x999C2edYNuQFRae0ytZB
 4d02Edvjlh5xePpyxzQdYMKAds1fPYGcIFaXTCDztOiitHZT3Lhi67pxXYqgcP9O+AAc8KhQmYl
 61zG5XF06kOPvKM7x4OLIadoPiFWWoAfHRYzGZP277uVAbfh2e1z14RNLHNPysZP30n0thAZgWp
 LGdJhKttCmo5Dzs91tg==
X-Proofpoint-ORIG-GUID: pAieQoAyVkhMha8MMwzNlqB-zjZhcZTy
X-Proofpoint-GUID: pAieQoAyVkhMha8MMwzNlqB-zjZhcZTy
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a74679d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=PHneWq3mTtEDJPo0Y0MA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX6PmsrAEf83w/
 fFc6iyA/A0ufPD33AA9XXFTJPG/PxgmdY2ptARRxj465RAzGYM0q2Y9cfNBbioCXlRNqNdgtDmN
 uFjhRAlUIg3IeR5Cj5pthvBcaQaQXrE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060085

On Thu, Aug 06, 2026 at 03:36:14PM +0530, Vikash Garodia wrote:
> 
> On 8/6/2026 2:37 PM, Dmitry Baryshkov wrote:
> > On Fri, Jul 31, 2026 at 11:52:22PM +0530, Vikash Garodia wrote:
> > > The VPU issues DMA through several SMMU streams, and the hardware does
> > > not give every stream the same addressable range. The non-pixel stream
> > > is restricted to use 0-600MB of IOVA space, while the pixel stream can
> > > address the full range.
> > > 
> > > Implement the context bank hooks for VPU3x. iris_vpu3x_init_cb_devs()
> > > creates the "non-pixel" and "pixel" devices from the matching device tree
> > > subnodes, and iris_vpu3x_deinit_cb_devs() unregisters them. If creating
> > > the pixel device fails, the non-pixel device is unregistered and its
> > > pointer cleared before the error is returned.
> > > 
> > > Wire the hooks into iris_vpu3_ops and iris_vpu33_ops, which cover the
> > > platforms whose device trees are converted to context bank subnodes.
> > > iris_vpu35_ops is left unchanged, as sm8750 still describes its streams
> > > with "iommus" on the parent node, and the fallback in iris_get_cb_dev()
> > > keeps it working until its device tree is converted.
> > > 
> > > Backports are intended since the first DTS of 8550 binding schema.
> > > 
> > > Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
> > 
> > Drop
> 
> how do we backport these to the prior kernels ?

Point out a corresponding patch, which introduced the issue. I guess, it
is one of patches, adding Iris driver.


-- 
With best wishes
Dmitry
