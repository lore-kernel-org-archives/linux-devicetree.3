Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5FD3CCFC8
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853214; cv=none; b=ihUS4EfCZmFPvWbiTvI++KASZsgnVCZfWOw68Xe0SDcPkG6PK9RJlbmzRd+KJPKhCjuZoy/gn+F3kwiHobxLj0aD4f10KaOASsbcX1Sl4aitAUp6hJ/ATDteR8AsY+c0ZPR6wy1xN7h4KS2yPXPVcTn3knFrzQ3Gy4eaMcJ8VSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853214; c=relaxed/simple;
	bh=hUDQ7M64JdHNrsmtirK0r1KpJORyq1HH8TrD5tkkBwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mjg/DpZ3VifvS53F2JAoP4zybn5FkyIVEcI16DerG1r4I3HN3CVbj8XEc014T98q/8vXRWPvLYUOtwYfxL36Ct676hxJ0XslvLIOvfLALOm8igtjvFW0MvPRNtL5EUPTYtXfRqcz9496iOSQ1mmW09RsEPx8DdVi4KlzSi9Q740=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BeELpqfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HljYoScM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BeELpqfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HljYoScM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAHFT04051042
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c1y5m2Brcj2JBYATctoKjn7e
	m42uhTmPGI6ylxN1t+E=; b=BeELpqfh+hY3QqVwDAjCGhUoHA4c/ObNXmPvXs6X
	qeKLOY9rby9/LuVNGmryN4SUE6bR9x1l52zCH3XU40EvTp6Y2zrvwruC9edXGP9k
	/+3NqG9HTdFHhAfx19Al56hbfgHaoqWybaSObh3Ry06GpffgE/Uyz3PWiRhES38A
	O5eAlGVRmsoQJSxi+U22F2eEOhIfSILLE24lRF/l0gjH9jAbTC/jWZxvOJk4rwyO
	3Tg/gEKcJG6IRd22X0ai++jHHyZjNmUaIHOnZb6tR+Cb5USRc0AckN3+Ingsgpwx
	uLMUniGHj2Z3PfSuzWVMvBP3tmqZMLdV/kjlICLWZOr6Zw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfk0d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:20:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso41169061cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853208; x=1777458008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1y5m2Brcj2JBYATctoKjn7em42uhTmPGI6ylxN1t+E=;
        b=HljYoScM4fO870wIojOjOSENSyVA9iqzvO9KwIfHzNslTHPyizWsvVLMxiAx5KW6Nm
         69Qw/3wjp1smQaV/b3k0wyGBDeJ/ngJwmcijtfn/JqSjaWIXx9nGGQjx2Rt15i712oMu
         LDLFzlZSXUNLysApQGmBazn9DScTXjZSuJOVfx4Vpl98zI5vH4sUiD1cAV6CJmYB7hZG
         IQoTpPlAQLgHmJ+HDvbjecnmLUvLSXO7eHGbBznLUYjRHBZ0k+7J2D/rvyNYXaT5bomB
         5o1cX9AzJysWFCaaT4E13pOUjr9eB6PXZyDfR7D97PsjSZK/p08m3yh6LWylcng730Hp
         HG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853208; x=1777458008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1y5m2Brcj2JBYATctoKjn7em42uhTmPGI6ylxN1t+E=;
        b=iOfv24mDLgWIfGiGtacuqOiwmJLfWOvxxTf9V098WwGgHRXJbqBIvZlfemZOmP4rEM
         M5Og8H2hPrnD3T8SXldsTbGhIVmpIkLqpkdUJWtv6GpF2Hg8ov6i0HP67AcnJKHNB1Nj
         vMvhp/uOb3wohw+vju+vuoW5WiclBxC1OKaOjqig1K3ATv+EGsgkbRBOqyXJ+HE5C41E
         kOwOixsV9IDYKcBLnc/qBi7JOYdRpRp3yX3OjdEnM/44B1BWgW3CMdcFD57i5Vt1dAhG
         JyWT4wL/fOOD6tH9dWDFZwLK2JPZM0qMyrw+yyKICUhFJcUv0D0Ci25odLr53o+qPN8D
         mS3g==
X-Forwarded-Encrypted: i=1; AFNElJ8m2heUgYjwZO6PqeO8PQFitcaqfRvJRE+DRGDOr87ep54fk/yAJyGcYNBzC28e210uVjeMnS/+5RQb@vger.kernel.org
X-Gm-Message-State: AOJu0YzjublIgZBqlsbGwbyst+QSBWV7nziWwQ9LwoEM32Ko3fcWWAzc
	A5m5zLJ/kcqjhMWWdLORyHr3xO/35WmdpAOcgxVccUt0TXjANC049nER1z9EM/ZGKamtcHkzJCt
	ZNy+btmhOGHyAQj5u46Hm9zfKiGARh3Pcvzf3ksLHVJ3NY4wvE1TruM4pj7OX6Ds54WjxykdV
X-Gm-Gg: AeBDieulAkgifW1R2Uh56erxOWQsPBpBAvbn4ZAUuGNXUAnEXPf4UlNmUDrwjU5bWja
	CuQcLLlQxYvHrFIKOWlS8sj0DRrtV/t83ZisvL6lK+LzFL4STkf+QrXraYIXUeYZGciEcb8sddI
	8MU0uHI6LrR9mbWHongQFvod3RlkMCS8aezlUFykWc3qRiTiTLgBLNDNMj8BB5iFEEvSHkNCqMu
	PN6sGNvU5o34hrG41800DpKPdAkFzyZdHEwh592PR2x+pU2cBlKytyNockIov/nKqwA9UEHtLrY
	/WeKF/TXlRu+tqwL+ortJ012UVj61vp6yVknws2vZEqwQBAZT5HKq2HdGlZV/S6Abu0MhEQrFkp
	8mvc1pL8X99WzrOUx2Ny04nMwB67gchJI+i9Tu35ce5NYPeY=
X-Received: by 2002:a05:622a:199e:b0:50f:b13e:b738 with SMTP id d75a77b69052e-50fb13eba6bmr113580751cf.29.1776853207710;
        Wed, 22 Apr 2026 03:20:07 -0700 (PDT)
X-Received: by 2002:a05:622a:199e:b0:50f:b13e:b738 with SMTP id d75a77b69052e-50fb13eba6bmr113580311cf.29.1776853207172;
        Wed, 22 Apr 2026 03:20:07 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55743c06sm38431795e9.2.2026.04.22.03.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:20:06 -0700 (PDT)
Date: Wed, 22 Apr 2026 13:20:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
Message-ID: <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5OCBTYWx0ZWRfXw+a3+1OJMZjI
 /uGSkBRBGOpai4y3mkvo3NXMSoTjMDjq4CbbykzN38kTt9yk8vAgfsE/fx+mopYovkC2EuGStcU
 SqKEP90ilX5H0F2m0oYaTtQFJXMUg4qcCBsVhVT44bMWxzNSznNs0ACbPS0KtLiunSRbC84lLMc
 W1jbkzGcA3zYuwdydAbBKCP6DpUtYPN88rIqrlpfBPSX7wiQx08SdILezjdKTgnAkHum5TV33gT
 p17gLu2vpht7sXsi2/qOO79xoonDqFvbbf3XX8yDVv17HMy7GVbfyw9We4VMlG6rBdUexMFixqy
 UnhTNS69zlkzgG0tfEh/e/JgsO1f63KSRNIsksGDmjOt5pAOUq0mc28R6zjp7XAfV9H5DScvbhB
 NkJRySbSaxUV/GzSyZJzqSMN/taiObWFIR+8X93gwCczmAJ9ATfWV0R1MO7dODcfUty/sZkCrjL
 2Rhob5Q0dI2yapS+LVQ==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8a0d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YbIFc_aPW5namLIE7VMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9pRqudivCqvdTrDE4V9BPl63LW-GwY_x
X-Proofpoint-ORIG-GUID: 9pRqudivCqvdTrDE4V9BPl63LW-GwY_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220098

On 26-04-22 12:09:31, Konrad Dybcio wrote:
> On 4/22/26 11:41 AM, Abel Vesa wrote:
> > On 26-03-31 15:37:08, Konrad Dybcio wrote:
> >> On 3/31/26 12:37 PM, Abel Vesa wrote:
> >>> Describe the ADSP remoteproc node along with its dependencies, including
> >>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> >>>
> >>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> >>> combo PHY and an SNPS eUSB2 PHY. Describe them.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +		usb_hsphy: phy@88e3000 {
> >>> +			compatible = "qcom,eliza-snps-eusb2-phy",
> >>> +				     "qcom,sm8550-snps-eusb2-phy";
> >>> +			reg = <0x0 0x088e3000 0x0 0x154>;
> >>> +			#phy-cells = <0>;
> >>> +
> >>> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> >>
> >> This is TCSR_USB2_CLKREF_EN
> > 
> > Good point. Will fix.
> > 
> >>
> >>
> >>> +		usb: usb@a600000 {
> >>> +			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
> >>
> >> Does the device suspend and resume successfully?
> > 
> > Well, tested with pm_test devices and it does suspend and resume
> > successfully, but there is this:
> > 
> > [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
> > 
> > But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
> > all platforms that have them.
> 
> Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
> some DWC quirk in the list, although it seems pretty long already. Perhaps
> Wesley would know more.

+ Wesley
