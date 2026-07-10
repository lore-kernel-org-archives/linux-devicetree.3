Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F779426D09
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699982; cv=none; b=IiJk4UOJIS9uC9nPKMYHdca3QK/WBQyj7CgHoOs44PHoKxJZCnzn1MgtE83E4Uxc+VwdIBiQKqrKqCfwSIn6jXkPu2+yTXZjcibVffYiQ6CKdrMVeHtGLcwm5Hmsb2fOzDz7eGWMwHp1hmInW64ZcwGa8ntIAdlnZCHLc+gJl68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699982; c=relaxed/simple;
	bh=eL4daYMJ6yxcHBISM4TXDH94SSluJkVFBsRnypd75sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uf38GLm2On7KrNGXCBCqZDU3kjEql/jNGf5irJsOyGBftvinwyW4GFaxPvq45SNpT/DpLVE0JWjN15Di2y/JAIIvOew87zhKj7PXcxVjmXKwJt85Low4qW12m6TrLA1nJE0W290pQcRt5X03q8vA9re7QDicJq6Z0wz9xxE1Pzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQYjhCco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bG/GSfuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQYjhCco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bG/GSfuw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEchSw1123507
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dSF5znS/Q3lVyRs7GUlKV/7p
	8jhA5H6nxgUveBPbv2E=; b=SQYjhCcozFuTgko/+VsXG3KSPX9UcXujVnXmDE+a
	0ttR3bpsJf7RyZaIj3f7ZnHwTuGA7W5JzL0HkL3KM7iPcknR2W52SQFPpzOIPPBx
	eFtVVnzTcTNoukyygwY/vQ38v4xr1scDLxKHOXrfOGovAeclMg2TD5ourmjO+qAT
	/c4xbFsaTpBETtb+OFEv582BHpYGBfsHulzh5ReF+PqBiC5WZ+fAypvk9fASot8Q
	GtBiqZqlklMFUyg9vCEmxj3K62lnZIUvdN4sUh8S2IGYiVn2rWKAKOwk0acJ7BH0
	yXFKohuRPKtG/DEqMgKTY/khnA+GdYns5PEgIikEh7Lb7Q==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n2q55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:12:51 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f5b54da461so17685677b3.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783699971; x=1784304771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSF5znS/Q3lVyRs7GUlKV/7p8jhA5H6nxgUveBPbv2E=;
        b=bG/GSfuw1C0mvLgbtQ0XFmrLjLE24UcH9GqfHmUXUCgmglNU/EokajQleCdz0iGmk2
         WYsc0d3VIfQLlL6VfIZ6j2I89Wlb1Qlaa0UWaMy3TQ/cu5K1BRZuEQzUccNAV3QB8djD
         3sFC4tnHSkd+E1xYFHxlHTp2jn7wq8NJTOTG+AfcjCGcXRaq5u7oQDnyrSaZ+1oJdQtG
         8cv+tJs9W6vJERyfQQZfqE1612fm1a8rdCfIkWUCwFvIn14l1qW1lU2/H8uq8KKoHxR1
         2afJotAiLgdtvEbKEuAFuiYGlvD0uA2jSp8Wlu/80nUfGD7lZ9T8E3/WroXQwXh3pm6R
         znJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699971; x=1784304771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSF5znS/Q3lVyRs7GUlKV/7p8jhA5H6nxgUveBPbv2E=;
        b=j6y8yEPjia86EDvFExb5igTVm/Z/mbToI4jhrVt6Y01JGVV/kmy+IRieFrp7k8lzSW
         cum5QOy/1TRTrR2ilU8rcEvWxeCdpcUnabAfBdCrGdnnjwEI897GDEGIcSIuaj/nWJlc
         L+wf1QVs1V1ej4OH6A8/69+YThhXxMasCRnAHumh7VnlthYQz7vzYuM7n4pgLLCqlred
         U/z9OxEUqrCd0jVum2ICUFufIEzYBoKNoQm1u+e2DwpqGCeRtMTW+N5I6sJ+lYQrT6o8
         4yy9kQcUIE2mFpo5mxrF4n3MoA8avezt6IYYasfGdvKJmNHStpGxBz/XRtOnKXargE8V
         RNEw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8A5nYAICDNqShlgDBuTe+Y5S2mc95BAc84KeOVkQkuzUeOWf6Hcq9nthLD38S7yKjNN0ex5JpmkE0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Fb4DlgInQPD895mtP3RFMpQbaE3+TyTkTwog88KoChaeMpd5
	Vp7hM1ydKymWWZgnFCyn/T3kJeBiBxwDZrpSvcAiMWL636YEmvqXU0N7jlGfs77B9UG9IhPzkvV
	TSoLuUJfgZ/1nWIuWtNLuHp0Hg0K4xh/iEnj/wDbnnvdlwYXTk4TNRc5KM/jMYCmv
X-Gm-Gg: AfdE7cnZuEmNDFb8XIWU9bNP/UNjoQsbdWEOARBZ6MJEs42MAZGhKgGaYJKyRNqaqy6
	dOo4vvpWlKBuOnPBCK5WXQTq1rvVK+fm5DxZbmZmnSjqVvpHN9xCh5mAHGKQRLMaJ76eNrQAB4q
	5DyIJnM74FS7vM4B74nOz7zLssu+HAZdG3zwv3B+ANwU4BzNcpjAcWD8jX6etgg/4mH7xd9H3vr
	7a6W/Uoz7TRH9wi/GgqODXtaizacnIy9nXr+aAR6TkkO8jxo115wMvD9VBkfuxaA9MAMOLW7NL/
	3aUlKWVku9rhq7rHRao011fol/qQsVr0/HGy5gipwAsPPEGrP0MJd5JxxSJZoV94sNe4XxP3kmq
	XSWFK4w3+BSvwSrvt0QYxUUOG4r4dEqNFwRkaHxCMSisrHJunP3LJ3nEDJheYRdUm2++ytzy36J
	WEn/d65p63401KhO2mRj0jIyoK
X-Received: by 2002:a05:690c:600d:b0:80c:ebd4:762 with SMTP id 00721157ae682-81dbe248d3amr92630727b3.7.1783699970952;
        Fri, 10 Jul 2026 09:12:50 -0700 (PDT)
X-Received: by 2002:a05:690c:600d:b0:80c:ebd4:762 with SMTP id 00721157ae682-81dbe248d3amr92630467b3.7.1783699970527;
        Fri, 10 Jul 2026 09:12:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84917477sm10590821fa.8.2026.07.10.09.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:12:49 -0700 (PDT)
Date: Fri, 10 Jul 2026 19:12:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
Message-ID: <slmagkascgpr7wmuifdrkhhbbiceqqvfqg5n4boqui54sbgzwi@4sntjn2rddu5>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
 <20260709135418.9421B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709135418.9421B1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE2MSBTYWx0ZWRfXzImoS8hmAohR
 iKlrZkdwEJnsiQ1Hqzclq5+p8dz1V2jKydsIiGFDbvBe0sIBiUwcfUWCTTCU1+PmDoSIIVFNDJM
 VdeWIuYXKCQksNPbdSWyERYVVCvNlZ8=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a511a03 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=DDwluHWFvHwLuo1iedEA:9 a=CjuIK1q_8ugA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: cmpW6mi_dBgpbJfeK7PEydPNJsVZvBXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE2MSBTYWx0ZWRfX4VC9hPeZOuBu
 fYA1ei7xhNCTrR6fAU4dmKCjLJuQSYK9bkcRfwVt/vJoBmsy/0U2adckKOPZCwyOmra7gDhLjZp
 MJRhTEZk6UIrsDvZ02QT7459gJ/pkc7aTyJXmVPct1YOR3ERxs3t3hDRkyp+aaGp9k+p0atooLA
 eCmH8Dv7/N0K98wA9gmGzxcnegQPmcUiB0x60JW0UdcYwctv3wvHp6ajdKKvIS1rEw/xAjbYBkp
 H74Mqj/cMyBLxVxl0wSYP33zyhW/wmJ9vD6IbSdPd12Wx3nnN/ZuRg6KJqJ0CLyK0vE/thcMO+V
 EKNiheIgiKnLYY6tsAN9pv7KSTqZ/KoJAuwrXm1HgEFmSroAlwZ/xzo7T70cnxADWZN72HCOTQn
 QrXPgVDDf+71x9VUTK39HkpEU6FhSRa/4pAAj+mexx2P2evyfvQUOFR+JNmesDsiRAI7Kiv8Gvo
 zBQJy9tqVOrhr6+NvgQ==
X-Proofpoint-GUID: cmpW6mi_dBgpbJfeK7PEydPNJsVZvBXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100161

On Thu, Jul 09, 2026 at 01:54:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] Unregistering context bank devices in `remove` while V4L2 FDs are open causes DMA API mismatch and IOMMU faults.

Please fix the runtime issues. It's not the first one being reported by
Sashiko. Please go through the previous reviews. I think the nature of
most of lifecycle issues is the same: corectly handling device removal
vs userspace lifecycle.

> - [Medium] Hardcoded platform device ID causes name collision if multiple Iris instances exist.

Dreams... But using PLATFORM_DEVID_AUTO makes sense.

> 
> Pre-existing issues:
> - [High] Missing cancellation of sys_error_handler delayed work leads to Use-After-Free.
> - [High] Use-After-Free on `iris_core` during deferred V4L2 close due to `devm_kzalloc`.
> --
> 

-- 
With best wishes
Dmitry
