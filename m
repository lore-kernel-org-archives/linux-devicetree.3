Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12D130EF68
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774395354; cv=none; b=mtuXj2BDCmPZ3vrSOjc8p34G1IMUiZ0sQ7f1SalO/2DGqUe6axkvVKX6fZVLHWWzUlWaHRN8m+bHXoDyGpcXfAdJhwsRPyf7v5QCw9gEWfLVcWd2Eixd+d8I2RcsbK5eGbwUJ0ojczqdJlf085/tZ2eutUAzs185xe6hkPGTi30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774395354; c=relaxed/simple;
	bh=m1IRTIQlUehftEBclPk9fOy9/4X9f0ayizJagcEecy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+12i7ip5t8OGwd64Dr/1udRtJ/SAA9+Cx07Vqwu2F1wlwRAus4lvFgBB0XJca1Mky+bLYkbitLdqZKLIFF0vL+1Wuwr+S11+Qwm7GJf+VKnt4Q4Zz4LMJ4KUUJ2B4p5v5CX4AlrupukbQxCpkrl8e9eXL01kyWSa9Y+0o9n8AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLWDdRJg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNhsGz1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLWDdRJg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNhsGz1e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMhBW51356636
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXpbtuVjHzaZekfV5IcPlnc8Y4BS6S5ApQt4Khrvoxs=; b=FLWDdRJg6bhRwqsL
	JNW2fDOFCzWic3iLrSSboFvp/2k81TqXiMT7E8/Bfw/39c4KlyE1/1ILwjgmNSgQ
	mCInvSUu2dv6t80VtsvrTSPYY84PL1n27yge3fE9BZVyqHOnjfeeJTBRwTm3FRBO
	l447iqJHVdmvzW4uBmPx14cJJLDS8uOG6nYHvfQRS+H00SlekjiqC90O0dOMu9X9
	fURyN9JSe/CK92iBzY5gd0e5xiwFtVF3VE/aZ6aQluWiTgD8i5CLDDT3+bUdRKjG
	/KtzqvVxPmT5e/1etPrSFXkkx4tm7uUqWclrHkt1V5sqWrbMmW1umLAqkrwupJQL
	14Z0Og==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukma1gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:35:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091782ab06so277840591cf.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774395351; x=1775000151; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXpbtuVjHzaZekfV5IcPlnc8Y4BS6S5ApQt4Khrvoxs=;
        b=JNhsGz1eluZqY4T6plAPOCPQeR3scrxnUq+QdFR3Zl++yeBO5VOdMDSot+XloMHzo1
         p1nU32BAWsJvfXwmXh2qzOs5Szqndo9kG7zNm4snumc6va1aDz2YYAzvjjEjufcaFj2m
         yG0aPjd32STQK/4iSCDMhROZh3I5aoffaEFMpdhg4ep5KzA3fvaOvxiJd7EpsT2D6ZNF
         2atUmq4uD5csoRclPpRtpSI5rWwn1Gdse1sIOSgV1KXsNCD9FxvZb2fx2cCMuqiVFB1T
         eImaNSJZ6XsZmTdxM4togv5wzl4K/YgMXT+KDcOZPCyJyPWitLfZ4Yj9AjcE08iAZo8S
         xT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774395351; x=1775000151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXpbtuVjHzaZekfV5IcPlnc8Y4BS6S5ApQt4Khrvoxs=;
        b=G+74omoiybLnTCwy8qUKIlb/dFMaiI+RPUxg4EPPCUylapxs9PyfhqJH7v6qE2578+
         gAJgUdK1bKPdJGx6WkfzIyw2CRXzLkEkW7FrNUn0F+58J1CP7hAxwIHDRUs+fYc5q9Kl
         ZrewpFCnS/A7zbfUj5lG25ZxeJuPGqLFWChKoeSJIWWdCuQxfwJtJudFeOyvfhsr+NUl
         ZNrieFAivPKyjJJ5RMfFv4bt1g2a6BYgmzSxZ/Gkt+M9UqSfTxJx3X0mYJas79U5A0cX
         lhNCrx9ozG5fXrRkqP3wfH7WR39l/1J/T/LzIKwqezOOwP7HVXgoJSG8qvPGyeK3SMs9
         fxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwMCEdbtTUMX+ZzVyAKvkP2lwzlCSIjxR/vbah8SrqHoF1BgESfSqPESPAtHGc980arOaJWLxZLHkw@vger.kernel.org
X-Gm-Message-State: AOJu0YyMa1J5bQLk3MvgUK1VmZFPHOqryT/nEBSJ8g2nUJTFZXomzSmp
	1lixpA30YHTfOYbhmWbGosPGOu19gGCLJ4by862jgwlGxuth/plAENKkWuU8MVf15/0O3DkzyC2
	ibC4IuA4VHLUtcefjGHPtpXERH7NstPTimISYQFypcrWefO18hXm7rdBLnZhhUWrK
X-Gm-Gg: ATEYQzxC8OJ5LENCUptcaF3lreMoVRGk1mSTGwlUwOuaXgSm1fus5YtB8ntFeyVUmFy
	HI4u2J/T1FbxRGYkGKKw42xE5GuqmCPc7hkfKcw59//FDs1dAENa15k3s+O4RtJs6n9lFVf/84V
	SiG0AS1LPEiWo6uWkc6FiHXUaEKTE2NacHQkbNMVeVYfg7566IfRV+T8eaXFu0g1cPe3DomS6WV
	91GHC4JOmn4FPVg2qvjMPqB8L/5bTTTBqIrtQsX42bWQ4/Y/2C0pl5eaYNa20nvLiOmljduxK83
	Cimy6o9EeEv0mc4BIIfgaphq67IdRjr/oX94QYiPcw6sTVVTpP+Z84NIv56g0YRZkGJqZsAmxJb
	XTpf6o0pzZzhQPUFDCyvyQPSG7vWJrZy142bJRppWFpsWKe2iwRVgxF45cZi68jIYCyF+ATfTQv
	rJsLj8uXaSCTg1tKPzNG2FP3mxMr9fVjny0C0=
X-Received: by 2002:a05:622a:1981:b0:509:4198:546a with SMTP id d75a77b69052e-50b80c9bdd2mr23319261cf.1.1774395351219;
        Tue, 24 Mar 2026 16:35:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1981:b0:509:4198:546a with SMTP id d75a77b69052e-50b80c9bdd2mr23318951cf.1.1774395350713;
        Tue, 24 Mar 2026 16:35:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28520731esm3419975e87.45.2026.03.24.16.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 16:35:47 -0700 (PDT)
Date: Wed, 25 Mar 2026 01:35:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
Message-ID: <hrebrfsc4lcsrpk7thg72f7gdmi3btuiphdwh2ft7algej72xz@cijypbournvw>
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c31fd7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WPfDNM3sXuLfQzZvfOcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Dx6KbeuXHi7N3L84dBb7roOL4X41NvqG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE4MiBTYWx0ZWRfX4VnKveOQLC6b
 xmk1yNXTf9DrcLP/iNJ7qib6DyYA4w77jREViNGBFeJhy6r8LUOyQ2IqPJKAs1a8ftilzFWoz1D
 KTv0m+xwnrctz6Xo09KtEbDXGm69b1Pw20t14zQln1D0jrByq2EWZJGlihwk4tSNv/K2buauzxg
 tDTQYQVVQNDFb8DhPePKjUwVTXAuWhvzFacHjLIzLm/JewZJUoC6y4gQdU4yTI//ZdfYLCf8VPM
 BdE9NEttJk3dw9Hf3f8gegaMViTZ2PIYc/5U/etXq37JESrpGn9ZC0bB8uvfBfomVIDkRFQQr/e
 NJcEg83qFkFlw1Qn1fTIgsMsy1jedTLX+IemG1PaZJkUsttE2ejheIeQoouJz+4AboK0mEnKVfC
 gCAJp8mZ5MAOZoWGuGRXvg+R/aDsk4fnf/GcX0IyWqa++kG28mxPnP4ao8K3i2fj5c30hCx0jUX
 T0YsQx+OOvYJPvX2vEQ==
X-Proofpoint-GUID: Dx6KbeuXHi7N3L84dBb7roOL4X41NvqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240182

On Mon, Mar 23, 2026 at 09:32:39PM -0500, Bjorn Andersson wrote:
> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> interface.
> 
> The Renesas chip is powered by two regulators controlled through PM7250B
> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> The Genesys chip power is always-on, but the reset pin is controlled
> through TLMM GPIO 162.
> 
> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> allow it to be brought out of reset and discovered. Then describe the
> two peers of the USB hub, with its reset GPIO, to allow this to be
> brought out of reset.
> 
> The USB Type-A connectors are not described, as they are in no regard
> controlled by the operating system.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> Dependencies has now landed, so this provides USB Type-A and Ethernet
> support (when renesas_usb_fw.mem) is present.

Note, I initially applied the patch to the bit old -next (20260317) and
I ended up with no PCIe host at all (bare -next would still show the
PCIe host and the TC9563 bridge).


ANyway, does this actually work for you? The hub is detected, but the
USB bus is empty. I tried plugging in several devices (includin the
powered USB hub) and they were completely ignored by the hub.

FWIW I tried both the the pcie_aspm=off and w/o it.

> Missing from the RFC/v1 description was the mentioning that unless I
> pass "pcie_aspm=off" to the kernel, the Renesas controller fails with:
> 
>   xhci-pci-renesas 0001:04:00.0: Abort failed to stop command ring: -110

Interesting, it "worked" in my case, having everythign built in into the
kernel.

> ---
> Changes in v2:
> - Waited for dependencies to land.
> - Dropped "RFC".
> - Link to v1: https://lore.kernel.org/r/20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 93 ++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 

-- 
With best wishes
Dmitry
