Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192CC76025
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096595; cv=none; b=Um3vAY/gWpvE+cnKgw6i6nqAkzhnpk1rUwBrlxlUnUZKV51PqKMHhZU78EZtQ804131bkEV+jx2OcCBytzrbkle0XhqpOuhD7Q5Dvak4kufQ2v20z6wMvNGwLIYzFFIdWqmTR5NX4nUqrgmjPvVf48H1R4yZ2uWnE6dD/M7oYi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096595; c=relaxed/simple;
	bh=B43OnpCrwYb/9Y8e7HSur6l7xbP6AiJRLg9q1JiD3gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXSSQmQesAWImnhNACFqKMqlKYADrcw6Zi1J8ZKG991iUjHUSRdH2q6bD+YvtmXxU5kgFQKPLmea4ZCDRDrX3pypcfJx5fqOAVVcwAIr6RkFoLaoLazpLYMC5lMO/jE9bekroIpbyV9a7H88DigkgJ3xXJtOsdh0V/ul03qIF0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwA4RDxe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZx0x5nr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwA4RDxe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZx0x5nr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCphF1598846
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jwn/wa90BPOcIqKLN5Sq1R2L
	JRfJe6BD4fgYbgN+wq4=; b=RwA4RDxe8USf5AbERFO6GipNWIo6GIdpPvSKgULV
	imCOzEEMGKH/5smQHlyJfR4KHXRLqMvEJ1C01Y6Be1xwPku2ObvyfsUSSqu4dP5D
	b2pHiA9J31rpyB4P89U3mtBvC24KpjPBVYVk2crNuGMVoyfsEo4s8ZKU6eakr6l+
	gGLHcq531ED5oZ5Unwqxw15jOwFzUFboIH9+buE/c1a+levSFyoPfvm4h71kztOO
	S75HbQbH1KXiTGciQucWUuJ486Pnd6tg8yEwKhol9XcTF42BscA9ulEwAUTMZiqh
	wZqjZ3MSvftDvPZ+7IwUOxR6Foe55cNPoPihWGGyiRDVIA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2sehfq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:03:12 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6fa8bba1dso11513457a34.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096592; x=1781701392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jwn/wa90BPOcIqKLN5Sq1R2LJRfJe6BD4fgYbgN+wq4=;
        b=iZx0x5nrv6OAPI3CJWbdXaVviSEGJR7UHafS/rHumVuMLFgRa78L2ShDFYsS2bQGkm
         PCwCHogFmP2aX+ZoKKY7I+7zJMWy+Q3/pIoIzFjDt3huJzS6BB4OddSQH2vQmGY8He3b
         RPoXcW/tI8RTIvgsUDhbnYoOA0MFOtIbb+FJFYeaI1uhSU/Phup1cVG9LBucq6dQQX87
         /vd7szmXukQPunXFANQRUHN8MEk8pfhd1OIFULV/c6+s4Rnr8/IGBo1H5ugsruDLAfY/
         lI1vYxQUwJZPHa1VldGcukUNP9g8EK5dgiTHyGzgrc6wk4sdITdQDWxF8az5ktfZa+31
         Hu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096592; x=1781701392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jwn/wa90BPOcIqKLN5Sq1R2LJRfJe6BD4fgYbgN+wq4=;
        b=VuhvttMNc1LiuR+vy7hNrSLl8kz69laAXSWG4qRPEF2TxgoENNrdoIASJQd7kCG0k0
         xbl4221rEIoUmUGBQPmVEcVVmCjnsS7QlUMEVkvqMNIx4/KU50z5H+l008dmXgyrKudy
         6nJShr1Rsi3We62/Dj+C4q8fJ/ZVA+oTRyVS4YnvKlwL43l0LIm3P2ApIXC0dKkNGc9o
         /mvufcy80SeI8vQvuPZVSUvJny4g1449s/oD9COqMf9s7N2NgOEzTRa4+O8Sd1V07SP5
         NzlCAi19329y7/Zb3G4KPbvv6jh0xjJNFeJ3eS4n8vtwNqWhiPGHUVHdpEKQYK3IVcUz
         3GZw==
X-Forwarded-Encrypted: i=1; AFNElJ9yLC3wTeg0XUZi9ktEw/bmhViK1HOP/aTdzCbxxzDDKHIFhOr1l5jBRl7aEJ6nec3Pfti5zntRK+Dk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvkjq7bssCYwpZgMrOFO8i69o91na7lRcdYWVunoNwOcbCiUpX
	njSPW9P/H04laazJAMg/1XgkUfE5Ld8cHMjEgTDlq4a2FgzxHNqiHwHfz3eG5pHkME8byrldMAp
	jz9RxwVIygiKA1fsok7uu8ZAG1kzqzH5CN+CjpLZeDQzKq7TIii/1+r+InTae8BsI
X-Gm-Gg: Acq92OGCgChbcwJpWhbZnjsnPUqE3n0Dni9qZ4F5sChclWJmwNKwUwuxXeuTFPqr+PJ
	p4k/ySPe2XlTpntFafb+8FKWYXChG3b/O9S3OVWb6LMNiBcWLPBknpxZvSpQ4QYQSCE1WAmhuy1
	X7drM0BeR5P6z4D6wVnwE1t8p/lhju2ZloLPw2ZkhTYg6giOdcYAOLtJqurym2w//TOj1aVF4no
	cIiJSICOVmTytxeSufgNpeaLsxdZi4vsI1wt7q1Yc+wvJ/k35r/otOjbHHGBwuOaDMK+gOSghBB
	KCJ1En+TEEXaf6TnVmTBg90IAZJ49alRmC6eJ2di0Do781s6X1GQT8lwbPmydh42vm2pC4VPDVy
	XvQRZNOt+4kmucxhTbQl+cCDBbIA5C4ERRYzaMmiruEX8eG65At6fkaZ+1GlH+zUsrBvLEMwLtc
	irAhQmzxueSm6xi/4sSg1P6E3OvOQoZ+k3yimoP6oAtoPe0w==
X-Received: by 2002:a05:6830:6d2d:b0:7e7:623:80d5 with SMTP id 46e09a7af769-7e70ca0beafmr15853450a34.19.1781096592175;
        Wed, 10 Jun 2026 06:03:12 -0700 (PDT)
X-Received: by 2002:a05:6830:6d2d:b0:7e7:623:80d5 with SMTP id 46e09a7af769-7e70ca0beafmr15853395a34.19.1781096591635;
        Wed, 10 Jun 2026 06:03:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed684sm5372422e87.8.2026.06.10.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:03:10 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:03:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix up QUSB2 PHY description for MSM8996/SM61[12]5
Message-ID: <cnyhnyoce6v4d5roijrceuzd3ujvvw7ozklulaxkibptvjancm@cqbqu2aa7bz6>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <b05e860e-ace5-4399-bbd9-493f7bbfe74d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b05e860e-ace5-4399-bbd9-493f7bbfe74d@oss.qualcomm.com>
X-Proofpoint-GUID: pvRohCPh3t7qJcJAA37v6VOCzuDDkOeZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNCBTYWx0ZWRfX4ZHJhpAOvJrP
 aHDPAtUeGlU+A/NhVwRy1/UsAAwgRuFuLVaBpTYdz1dh9Hft15YlE37OZvwVZKgjFwEQsjgNAQi
 CMwaUGbhgpfPSG1KFUN/jvZVR1GPl2rkt+GGqKa+18OrOJYqWRU3bi6ybgazNzDTRK6T6A4uuSb
 k3uF299KgkDsZuRFJ0Gjut5mHgR+ciGhds7c4nZQOoIOtaOSdCLcIC5TsFklu8Z2G1zSGcjh7Rt
 NkTm6oX5oZUanAOX2kpoj71IqgMrMJttEXJIzEIMs6mFr5BTbJyO/CATGxUNWyOOjN0YS/92als
 A96bd8jBb3OMnMKSlThSxdaN467QNb8sNNetV27x3LuNRJFYJv8H3xh/Ds8QRkhh77Uwu1hKWW5
 NLqYi//AUkdnPRCVHSRuMVxQgfPJaQtJcxZ/QrSPZUYv3Z4jNwddh3qsZEkERoRttHJbBlM6n12
 KFH2t5U7e0ypG3jJFKg==
X-Proofpoint-ORIG-GUID: pvRohCPh3t7qJcJAA37v6VOCzuDDkOeZ
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a296090 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eJTdUu5jCtrkvInlvksA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100124

On Wed, Jun 10, 2026 at 02:49:31PM +0200, Konrad Dybcio wrote:
> On 6/10/26 2:04 PM, Konrad Dybcio wrote:
> > The MSM8996 QUSB2PHY was not being guaranteed a power source.
> > The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
> > wasn't. This series tackles that, freeing us of some dt checker
> > errors about vdd-supply not found on MSM8996 boards.
> > 
> > Compile-tested only, but docs confirm my findings..
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> > Konrad Dybcio (4):
> >       dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996
> >       phy: qcom-qusb2: Fix SM6115 init sequence
> >       arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
> >       arm64: dts: qcom: sm6125: Fix QUSB2 compatible
> > 
> >  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++++++--
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 10 +++++++
> >  arch/arm64/boot/dts/qcom/sm6125.dtsi               |  3 ++-
> >  drivers/phy/qualcomm/phy-qcom-qusb2.c              |  4 +--
> >  4 files changed, 43 insertions(+), 5 deletions(-)
> > ---
> 
> Note that msm8996pro may need even more looking into, but that's a
> story for another day

JFYI, MSM8996 Pro is being used in the DRM / Mesa CI. If there is an
important difference, it would be nice to get it sorted out too.

-- 
With best wishes
Dmitry
