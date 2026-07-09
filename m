Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C31D25B084
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602628; cv=none; b=FVt/HIgn1i2NJqm8RCmO/Q95uHyR09imKdIc/bLUT3Y9s8US8R/MEgxSVrvdTd2PpRiyjeJGgfU2FleAQ6kJumLaKi3jE2ttSlDG99frStvu9n784kpN8CsrVyid0cUSrLUCcPctNe9SIVLRBPkyt9poGno5DIOspj1DhpQKLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602628; c=relaxed/simple;
	bh=Dsq3lEQKe/H1TDvpwIi8p3lkCA8eeKfJkYNghRMhTCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRCGkFd2cnyIIZg+Ov37LNPyqirvxcAGieVU2M8zMpFGzaX0upCjMw8VcHRnq+L3XJNpURAo6v+c38PHbmkOV/JdX21nxE0LYY9xpxo7KW3V+ftOFSIf51LT+r5sWTOhracIl6gdhVt+RDs2rhddsYj98s2jVm9I8/FYUPTek98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCWIkrb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWQ0OwGM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCWIkrb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWQ0OwGM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNCjX1657916
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UDWMTGf7KjZRGusHUDteshd4
	8q+Vr4jRLBjONU3KsoI=; b=iCWIkrb37PF266Ll3VPm3Lwu03ymhFV0Ruct3V3R
	GA26/ju0bPQeN6Ojo9NlDVVz5FNBs1ih+eJTSquZIXOcTR05UYGG+Kqq5RwAzc4X
	ZovTlkq8DnJ0apRPykWox8tdWNArujDMWABNaZvEZSG6DElnHq0PrFamAWuf2a9X
	IjUtmTEIEyTp/nv0kqYFSL+sHRvhUFNIWQb/23+2tKZIvBfyfTbUUmvYllQPTMYC
	0FBx+AtugCPwb5Pic48xqpCCU4RSVAmNYw5UnVVjPt8N91uw4r7Z1khgmkKJr5mU
	U6ajA0fv/96xVkgGzAvakX2hircCWvK3ORWWk4tfaQs29A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3sqpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:10:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e806f474so349142137.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602626; x=1784207426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDWMTGf7KjZRGusHUDteshd48q+Vr4jRLBjONU3KsoI=;
        b=HWQ0OwGMdN3fiWVsxHkR4fhfhi7/GAl0XBzB2R3jA2gwsRFR9XMYxTRNaJgEnCM8bj
         kL3aKpQTgEiAGjKkmA9DezeCM/HoZtrcppAd49VEwuHgoGvd75jbusSq26Dc7u/fkc47
         jMNlQWxfUYozxH+NnJX8/nUxhkBJIejfyOECLORL9bPczBaUV9vdVgj+hJKAhjzbInmy
         CTPv1GWlTDD5gdfb1tJ3oA3lqJTCUOwuaOS2E3nEydfmm6j4axKf/0eCQhwB87zUZ4bI
         Cw60TkCailw2JBR7COMsv1lW3tCstRkRqpogDD38LabygFsCNJPUGaSlqYAebIL0aXGj
         QFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602626; x=1784207426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDWMTGf7KjZRGusHUDteshd48q+Vr4jRLBjONU3KsoI=;
        b=Gq2yti6JfqrvM2dLTD90JoaEQfgslYklsTNCmd73d1eFEt2dMFEZZJEkKI08i5+5Zh
         /2MHAdkwSJXoKZ3j6//ZKaHwOC/cGKdHA1RgjE/s94mW5C4HP4VCXJ0F0kVAVV1NJ0JO
         le9VSEOadhALMUIDyKGfIXNy4p32XB4x2ZvNfqNMyXRDO/o9eSqPkeedkmVWpeng2l+M
         qbNEAyUn0lCimAzWZrpoVGq8trcEvl9g0mU2MaQEAQbpZ4SqJKsUaWEFkiFnP7fhuiPa
         8Df0GZ7ko+2HRHHqMpPQyB5PA5OeSnIkh8/sym0OEuKl7/za6Xc4FDm9vglHaErTCrO2
         3iKg==
X-Forwarded-Encrypted: i=1; AHgh+RocWQpFXnUsrxp4M7zq+mMWTP4iDdtbSoOgKbGxfBSJ8ArnM2OKkr9Zb5eO/reQqQCv0+KAegEYYLOJ@vger.kernel.org
X-Gm-Message-State: AOJu0YztwGhfblpepY0dTM+IlGEiQzdtxRymeuWnBOMYHToYwwqzvZzY
	FYui1bP4oMpBwECSEQNpOjI6pZbe3pHE6peH6DXE0lYwMhw8eIZnxBi0/FGp/uHQ9vmYAqV6wno
	EK/vu/f7Lu8uC2hz2BRtufSMzCLDxq6lf6rOnYHBK6TSBtGILzVRePr9faACcPgXc
X-Gm-Gg: AfdE7clC0fxvJMmP7Ge9s7pR5bVAKy6vt+l5bhzCD+q5bIhisXe1RbJezKjVkJZddPv
	LnwV0OsMy5U7eLbW9fypaSv9J2VRG4ED/UYbHCwGa3tPrDX0Fvthbgm+mLnEarqjZ46ogbN7SqF
	oMp9kIiLAVj+MVb+wo5f+xcjt1s3LFkZcD4RcLt3BImGA39TjZK9hF9TkdDH/ezEUSYPYB0KFyb
	BMEn7etuVUPCXAxrNjSeYaA+oKrkdHv2pTCvEee98/Cnlrzm5rpA1gj8FvPbqRolz8oT3CYdkOJ
	dUUEsC5/aXbZ4vz8EJwpn5LK2rsVdhk8yg7AFzuyVicZvmd2zkDf4R52ODCrr6Z6F/dU8uytjZg
	dsELAU7poBFuOnVGckFNxiTcblMiQJunsAXmtLHu+Br9QOD4F+BAwZWYtamCvyt7JFmaXmiQXOZ
	o5zKJg4R8HYtr2YWFHXjM6iVl6
X-Received: by 2002:a05:6102:374d:b0:728:4383:c831 with SMTP id ada2fe7eead31-744dff87b7emr4185831137.10.1783602625751;
        Thu, 09 Jul 2026 06:10:25 -0700 (PDT)
X-Received: by 2002:a05:6102:374d:b0:728:4383:c831 with SMTP id ada2fe7eead31-744dff87b7emr4185807137.10.1783602625267;
        Thu, 09 Jul 2026 06:10:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839ccsm5284238e87.37.2026.07.09.06.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:10:24 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:10:22 +0300
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
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 05/11] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
Message-ID: <v7bvga2bnfqkqjqw2yz3u2jdkm3virvbmk53xpfs5podc7ulcc@m52gmkxxdife>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-5-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-5-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Q7CLRU2-qQ_oQtbwqL4jn-KJ76PMDZ7q
X-Proofpoint-GUID: Q7CLRU2-qQ_oQtbwqL4jn-KJ76PMDZ7q
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f9dc2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=F3pHQiHvqLgxLLu4WVwA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfXyqpn84irqqWn
 CKx6OszAq9wJT/4QacHBeCud3WZDxJT2IXEPlPLyfYgU+yhIOv8xC1uMW7eq/yGcs2k83mAyXF7
 B81juMX3OQtPtZivl/JiIqAqf1BRdrI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX9c4Td6WOXTQ/
 cGEi7hLVUhnktZL8yUp9XLI8Bs+54FP2u8txTxXUurjXl2reu12uipoWqwQybWxLVOlp9ak/sng
 eZLpUybSUG8nigUyDZtWJwWS6h1nlX4ktzX2RxnpIfg2o9MG2L9WEEv7RqFLro/KGXGCD/Hm8ch
 WROXp8NvKgX0OCbmeDeO//GjitPsznQL53TUpV0ITYjJMwKBlpDGFVIvLFaMGT+cAbr3DPLwmHE
 S2lMPJRkMpnrJ1I+NCIBEMAVtuuN++4HvjL6Qs3AU61NvbRpKvdOhIMnryi9eHaAf5NremVEUKU
 FFxsJ6OB0ct9L/kkoxJ9Q4splFpW6RoplOZrkvpVUfx7Wb7PY8DaOEyuonAj9L9T7UlFDFDDI+O
 7Og0l2OsNRrNQMP2x2z25YUHFcShxz5BqqDqyAyeOAPsOp/7PhCYOQuerucW+QDWuvzV5HQltdP
 QSq/DUs9l7x+Yz1WTDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090128

On Thu, Jul 09, 2026 at 06:05:51PM +0530, Vikash Garodia wrote:
> The non-pixel and pixel subnodes move the IOMMU streams away from the
> iris parent device. As a result, the core device may not have an IOMMU
> mapping, and setting its DMA mask is unnecessary.
> Legacy platforms that have not migrated to subnodes still associate the
> streams with the parent device and still need the DMA mask setup. Call
> dma_set_mask_and_coherent() only when an IOMMU is mapped to the iris
> core device.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
