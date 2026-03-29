Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78156158DCF
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802826; cv=none; b=Q3pu5rc7WIPoZWCyTitr1JgqnG082wlJR269+zErb8Nm3knIn2rLsPKFFqjE38xiBVIRk5KFhaIy6sHSLy5L04DS7wixZqTLn58zWCv/65XFY2pFp79TX5jotQRtEaGnw1dMEPESXQ/NL+LbdXaGKLvi8UPuDhbE5A0Q2sN9xOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802826; c=relaxed/simple;
	bh=ibl6XhNqyrvJUsHm2dX6Kpy2F0XScMl6vUZncNTkLgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCyHCYY/tWO+J4q+4bvruUlGIEgz7jYFNBVphqZLYeTfC1tGGXyHE0JiBj/PeYz8HtQn2gfV52eYJq/b3zQlSGxWfPgpRAzIGT6YdolYCWR80Olw1aaE/jd4PkPvrGnX2zUbMOgZKWvtR+LAN2GwLhv0tuLdl/AzdL6gKRhONqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QubKJKJw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YaOhRGxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QubKJKJw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaOhRGxU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhopu201859
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BDN5beH5ZkYhpK3cKd98+k92
	0N9cE+eiBV71p+13/Xg=; b=QubKJKJwZC5WMGT6nmGtV+KoBK6tc3NQc8/X4BYa
	+isw3BgQEQCGEvf+/a4sLtHWAasl4HuVTQj1mFvjijnWGJ8OuWpvsVdMiOASKzS9
	moBN8R72m6ZPhd9Iw96bVsgRW9geUbvLNtVrcMdlZG9bN92Y8jejGyLhLeqrSXqo
	9xVQT7dOjK/gyywc03X06idlsBTEbRcOnrobc7vT1SGdQs4Om/Tz0ioTAa31buPI
	NUvmdG7FpL0XiMJKFa38B6Y0btxKiQvDp2KHRGwi7ePZU7VV7M5znb0r+kK5eSZi
	x/r1FMERyYjuZyPEjIVdnZRNdOaEXqdjUbfVjCn7BQD9TA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwk9pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:47:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509044f54aaso118336481cf.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774802824; x=1775407624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BDN5beH5ZkYhpK3cKd98+k920N9cE+eiBV71p+13/Xg=;
        b=YaOhRGxU95ObdC9bWv9VzMZ8ja6kidzV5ugqdI5VGlxCJ6RJ6YaJZq5KVPyCG+P2dA
         sLDw+zaqrsAkpvmcF7ANrP4S/MgRtk7R3G1gBSdH8JDgJMOwvkX+BFrrWjnsXkBvdT3e
         0oTPTrPcne7QAhc6vUkQ/qRJ7Dgy9ejmt5SLxsSrglVBGLdQ0H3HLWXsDw2g+ON2DC/q
         pnYwCYcQ2otDUtfPXb+3+yKceVjWqI+dnhQXHhXvO866X6K8M0X8JFTFPm4OJOnLFhlW
         nbT2AnwR1ngaiEjB7nMo7GOBfPwXc3uglAiQgG2RroZNcYGbcD5SQDmY/5qFrKESmBcN
         +Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774802824; x=1775407624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDN5beH5ZkYhpK3cKd98+k920N9cE+eiBV71p+13/Xg=;
        b=P4xUCCjNprhFkJzqlM0/ZJjFG/VsvteLHP8Pc61qJZY3n+UhpoPQuxfYjCFejYBL11
         wbFCE8b/H+IRXhhLprrZqzwDD9bACZ4u2BWqB2mGfBSC1i3rvdQO43flDnOPUNA/DdZ/
         o2iPvqYjzSVSUgqDnbsn+7yUvpT/oLyVkdT/8Qfg/IoPWTQ+z9NUHomHEufG3jeP4eBK
         WIXveIoVLQHda+N5j6FM1xq6YznCce0Zy8cEu0gMRqJ15ug2j2JbFGwL6UByrkr7h85e
         3wtdCiV9PMg1EORwboHogX+WYSGDqchZaWSH2AQ2RUTBdAnaMa+cHEl4V/HBZcrtm3Sr
         41UQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9gtYY///0dVI7QcCr8t8zEBP+9LAEnphNYnvcEbdY42xeX5rdp0V2NPVnqr5NiMNWVlgcCQBneCTg@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFh4rvEd1pVyKRSVKtbDLBXBWeQoneOUqqVyjwQWMruoLRqsL
	ppMdeVV38yLttptOxoaGQCSrmu8z14FVU+Xjt5Ferb9R6azXvoqe84hYYIdLfFgQSJBctfS222L
	UbHJ0A9aps6/PxB7jh9JVok+IoQeqIwi43sMiEzcrGB+ZaO8DvKfMhXyJa7BpWsH4
X-Gm-Gg: ATEYQzyt+kIkgEdcbwvtNjxlFMy2pXeFP2gfTnTWMWc3vFn/oOdnzR5wsDO3LRwbpKX
	dp+M5xRzcyBlLqxlRd6XsUufDdjwBSPn/lS3otJ4w/6f5J6uJNz5CN8iYDIvIWOu+qJpWfj4ejc
	uF+Nm4igoG0FOQYqTeyi1pDck3u36tqkMcqf+HEyiMF2sirPc7qyslgl1mIw9V8IKK/IQDBR4x/
	NtijKqOflkDczWgEVF4jH1zc31SGzmQNvyryh2rEM43riTUeVHmKh8t5uxtg8x1t/dZYIP0x3vu
	nAfxje7hecEt6bqIafRlYlKmekl1R4yaofivmrlAriF3iWQs6k35T09nv3rjHHXrliramsgHFzU
	2gC2PLWWR6B8CaG3L48S9smLdqiBnA45BIVVtEL9Ki1wMpltb87qr1xlvedzfVm2IVaLNa4CBrY
	hdm4Ya8MjfwqgtQJtytLVv5HYQBzE2RYw0XC4=
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr132832441cf.17.1774802823773;
        Sun, 29 Mar 2026 09:47:03 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr132832291cf.17.1774802823326;
        Sun, 29 Mar 2026 09:47:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm10094801fa.12.2026.03.29.09.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:47:01 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:46:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add blsp2_spi4 node
Message-ID: <2roskwzih3kaz5ca7hocew22jdbh5aqllood4urwqtfgt6wtqg@urzazog75lkm>
References: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
 <grmuh7b5phy6clv7izgq43yjtfxaulw3h6tqjenux35r5o3qnk@6q7nlgczigdx>
 <CACr-zFDv9mqZMOfHq+LjktA0DUVrTTw7-2oSxmu3U05ss2CQNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACr-zFDv9mqZMOfHq+LjktA0DUVrTTw7-2oSxmu3U05ss2CQNg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c95788 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=vpzSWxukCRzuXf_FP-EA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -mjQBY9CSmQAe2pvWd2DnpyU378vMcmr
X-Proofpoint-ORIG-GUID: -mjQBY9CSmQAe2pvWd2DnpyU378vMcmr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEzMSBTYWx0ZWRfX/dGJEPaXjkue
 OiccFXKWDLVXI8eNi0UaLVbrppi820Of6IL89U0gtNOviaBxnG/MbplT/F+08JP75DHkRyER2fv
 StrNkPUfpuBuruPDmxHbYe3qsPV3Amykax7E+iMiwe89LERzOzFF+tdy+7nFtZcqW1O454Fgt+A
 VXr4IAQYMbtu3LAuqqeLNsAXO4UkB8Fxz6jcTOFI4kpHHXlc/NffpZj6en2DSigfL7eNm0+dLLU
 dVYd6mI9N1cH6u0Gb/IxQF+Ag7BqCFNGnhrmhWGNgH6XEDPBx4s1LYGcVeIus0HkSgTEvRlMFfP
 9cH340G+68w9RJvOnavF2D0WzhHVvq8B82eYwFPI6N+nYBVUIuQRiL0XygPmBxtvieyOPg+teWe
 zBrdALnvxQERaiWCupZ0bITwMYGmTCSYkMsjP4+ova1lme9UDGl9fcq2pNY4K0DqU6GbI4gRC7D
 Uh4KgaWNYipvjenrg2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290131

On Sun, Mar 29, 2026 at 05:35:23PM +0100, Christopher Obbard wrote:
> Hi Dmitry,
> 
> Thanks for the review.
> 
> On Sun, 29 Mar 2026 at 17:03, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, Mar 29, 2026 at 02:19:15PM +0100, Christopher Obbard wrote:
> > > Add the BLSP2 SPI4 controller node together with its default and sleep
> > > pinctrl states.
> > >
> > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > >
> > > @@ -3417,6 +3441,23 @@ blsp2_i2c3: i2c@75b7000 {
> > >                       status = "disabled";
> > >               };
> > >
> > > +             blsp2_spi4: spi@75b9000 {
> >
> > This should be coming after i2c@75b9000 (which needs to be renamed to
> > i2c4, btw)
> 
> I will move the node in the next revision.
> I will also add a separate commit to rename i2c@75b9000 from
> blsp2_i2c5 to blsp2_i2c4. I assume the pinctrls also need to be
> renamed to i2c4?
> Also, do you know of any other nodes which need to be renamed while I am there?

Hmm, after checking. For whatever reason, the nodes are off-by-one.
Sorry, I didn't notice it from the beginning. So, instead this should be
blsp2_spi5.

> 
> 
> > > +                     compatible = "qcom,spi-qup-v2.2.1";
> > > +                     reg = <0x075b9000 0x600>,
> > > +                             <0x07584000 0x2b000>;
> >
> > This wasn't tested against the bindings.
> 
> Oops - I will solve this in the next revision.
> 
> 
> Cheers!
> 
> Chris

-- 
With best wishes
Dmitry
