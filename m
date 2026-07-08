Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E913E32B138
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516965; cv=none; b=NOixbWPFMyBoqKXmTGX66ejOBnrDjDL8TieE262p4JjCv24BWfcldO1ec/CDBOUooWTHr6y2Q+2D4dqJPIvhQh8K3oOgOKv24r2uaoZLVhG8x5o/EP/F5/cmzg0i2ITH/dllWSxnjbPCIWKchu5Q/Tz7hd+oKS+vFnZiYGq5bhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516965; c=relaxed/simple;
	bh=ae2MNSIMqAaSSXwecTZylqC0qS6/V2QGOXxmoclr/6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4OR6qRBGE36XjeRgOQFv62Ivlie0KTZGUi8tAOwY1wClmxdkFS0Quhh3qWXqskpnZUFB0o0zc29Ij/dRoa8gFA6NQ6c/KUMAl5EMmsGTr2aPR5qnTwD3rIwfZgkb/q/16iReoq4Bv1pe/JCnp9loEJcNDd45nPUxM2umDp8HnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyDsjExs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8OljxJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyDsjExs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8OljxJt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3pOR2715673
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 13:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0BRE8p336WpW44FCc/nZ7bMg
	3LmDUeTyJgzMvG1SbVU=; b=DyDsjExsyxp/jvYYrS33Px3eoFUhkMknepstX533
	C9/vUKNVvs4Tc1plK9YD3s761n2ToqpsKYpuJ7MU2kybSxBRP9bMTSvEyrsEGG7s
	QiREpVhp8sDX6oyInTeMsz/CcRmGccQIQoFPAlXDSEHzE1ZUDnwaxHWIfTApz8Z0
	uePkPFJ5UXh0GHKmp8C0iMpcgOXDkBLDKenw2oelhZF4F2TWRsZQs2GgXo7dVtc4
	5ocDC/AquJglitI2x6CAKfsbdBcUMFfjG28OsOkAd/gwXLnAs+7pfPOnikUtD148
	hXswxA2YA/B477Cw0UsijzL97VbB8OiKQIPQWJy0MjY7mQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd4m3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:22:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e7c36621so86199137.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516962; x=1784121762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BRE8p336WpW44FCc/nZ7bMg3LmDUeTyJgzMvG1SbVU=;
        b=J8OljxJtmiFCqUZyyeyEV166AiYS+e/7cD4ZVmQrIgPJdPrnBWVRZFiOQkVpfEyVzU
         /D3VP05hjfHnIp4sn0PP7nciMDx5jUlg7pn/6+iT69XTu/TglRf3EPdwB+TBxIubBa7Q
         fUmb0OOBygVpy16izXxyEvalUFuD4b+mBfn2vm0KxKFqtZxrMkhxCfT+zHzIkxL184aF
         fYarDSJkFFeZ+ob2EI0goFvkkh/IP9tlPlyzc63/ADvztxM2HBxSmLQE97hKH14+GAeh
         GVYb1dco8k+Oju0KPZs8isZinCxPkH6i0zl8wrc3b3GC4hpvWTyrlY2EVqnFlr2cglmR
         5ATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516962; x=1784121762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BRE8p336WpW44FCc/nZ7bMg3LmDUeTyJgzMvG1SbVU=;
        b=rCUk2LjeMGbVUktjIQ1O84hx7KbcLQE6gvm7KVo3Nf22yIajwIPd5aVylbhCNdKo9t
         dDzmdKofbsV8BU5r1YKMTvh++4HL8vBCRFCDcdGe2E5CHup3ul+3xeGNtXY6yhwEbuys
         g82ilVkuoa5x5FAbfS/cGN5Cy4Gl04WaIXT1LmNCmYfHTEIYLUkChGbHbUIdCeLOTXQk
         2hwEuN6ExusUfZSqHWtTx5ZNYLHc1iwn45DOGKoJH17UrTUfAF43HDceB9D96ZDe+mR4
         JiCpL7N+wG05Uc/5we9VbH68OhWKskSXnxKukhWmwnqYfC88CEKiX2P1srqniIDQGE07
         GB9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpJ6LFAlGpwbkTXakl8VLYteRm79XSgQ0JxMAOePuYqgbuJVTJm+Unav7M3qpMuuOmlp9DKibRa4Cr4@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcLtOIGUBtdcMaru2Owk4njeV3T+TMlEflCDQDOAtM1ayycQu
	GL9OvceediyjCKrj0JqW6UXHz8L4cuyeu4ZhQJdpJhLxHcRbZcVz5oetAluJVfqhkxJi/bmqadJ
	CDhAZqbjEy2tupdRKtxO0vcyMVmsD66ZlsWyPmVAAuB4jSu2cuvG5Aqer/rbXgsDb
X-Gm-Gg: AfdE7cmC+Zq1qUi7jK8FxEoJTuqfU1/4/vO7HVD5hKx4OhRmqQfCHgsSaOxvHcdRycF
	fuxX/UhghekPeevktij9veSGL62Re4NODDrU9ColMipXJTJqSXuYYnGg+cONoNiIzG1VjVHtQsW
	OY7ySsBx0PHh4HQglt5uxstLrF2v3wxgZar3hLaS84STfbYkC0Usk7KhmJoV92dw9bxvjQeV7qw
	mxHII/Ys8lRAOF48MVUvCDagTDlJIBcZhqoK5wFpsIkSwr7TDS0Gs4Ri1YHtR3/HVOuLPibQ9E9
	GPvafdErGldJbOMBX6HIlsfL9K8qYmaYiWVKnSbswZYrK5ItuNkfGJwhGpyCpi/SynddqkFF9+G
	Jb3VKyBkCvDVtMaKQe88nGa3GXHcxrbQEl4uCKeipPxTPPz9bh8FSvEMKDkjdGPtX4ynrCueFNx
	lTR0NzEFjl24JhPJ+KsFU090At
X-Received: by 2002:a05:6102:1622:b0:739:d787:be8 with SMTP id ada2fe7eead31-744dffa30e1mr1127775137.9.1783516962004;
        Wed, 08 Jul 2026 06:22:42 -0700 (PDT)
X-Received: by 2002:a05:6102:1622:b0:739:d787:be8 with SMTP id ada2fe7eead31-744dffa30e1mr1127753137.9.1783516961459;
        Wed, 08 Jul 2026 06:22:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c5c11sm4522013e87.77.2026.07.08.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:22:40 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:22:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
Message-ID: <dcsmckzwoeuvhx23xks5piydzdi22t34nnubrp6ix3ubxmzqnx@of2tksetosit>
References: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMCBTYWx0ZWRfX+02pRgeUEPNA
 MHBdSi7CKBfIYcSCk0gVirrIgITSeOgcdmYcFXnLq1/EIihf7fpM2vJqja2tPdscaYMDyj4onwd
 tHY4QQhk0Vs+kO1JTwJMryQyQ6ZttOiSx4oLVv9Df+4bTF2ZWOMxlu8uXqPLoTaDc5g8+Vri2Ro
 HG63Md1OuvKxqsHXg0afEcGL1bUJmVz78YmJvrDqk4ZqYLkYT1bkuSvmrUuPl62cZ5MhKwZdF7G
 sr4lBpr7p7oGTs1LJJfgHcYnEe9Yaoq6cP2JdFzmy4xIzlPiny7zbmMOXWhcpR1aAtnI6l0TM1e
 WaRjvXnYix5Ia59TbhYdztkDdqnnxjBmTWXXPm1aJqdgaQW5CjdxbVJ8jc1ONmWKXkifz8JXc6J
 dqI6tuuyRSIFFB3GW6t3Xv5vyApi5arqbmAsYsdDuih1RJDzBV9sR9V0Y02ZB1gzq5bjgi7+Eur
 tcPEz9iDi/l5jgbVj7A==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e4f22 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iH0RECKdEw8CTonVGlIA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: n0EJLGHMeffSglmu64PDFD3WmYxGQbEd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMCBTYWx0ZWRfX/+D4JhSYCtt9
 SdeMnNgg0nWdw6TkfR8aCmwaYsXSoCHblGrg61YgaGFrUvCGXcJ34DjF+wWhAjetyBEiOSnyIDg
 2vdXMuzt/c2/P0gW3ufvSiZrThmxqXU=
X-Proofpoint-GUID: n0EJLGHMeffSglmu64PDFD3WmYxGQbEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080130

On Wed, Jul 08, 2026 at 03:29:23PM +0300, Abel Vesa wrote:
> Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
> with the corresponding OPP tables.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> The bindings are updated here:
> https://lore.kernel.org/all/20260708-bindings-llcc-bwmon-eliza-v1-1-3c7dbcbae87a@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 96 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
