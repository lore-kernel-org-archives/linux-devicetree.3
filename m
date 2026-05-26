Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208B334B68F
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808215; cv=none; b=GNSQhDNAgxwcyiLKp3cjCCUYa8PYcvOWo6QiFKiz0Zt94jPbMDmAOfKqRfHZ0ipGr96eN2TPP0omuR6lKD/g2omdHymVaPseClVPMFULZzekRMt8hdq5owMyGIFl4WADRVlTat9nISA026b9nAQ3q1Y1ZQVZC5UR4dP3oAxhwpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808215; c=relaxed/simple;
	bh=7aeYoqKt76/ZR5ZcS7e3mSF4EPdlyDaYuDVD79NSd/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtaOxXlOsHgo57P4RdxzYkyDz1Lkxr11G8rgazYYdRVNn3yQM0SXCvW7JynfBzQZfvjrOTUJo3n68qE7kblzhv4wZzZYIrP/zwyh5agVCpnfaXkoai5zi67rRPZia+zhOSonXMxRV2Lb3Qi7uHgwUT11U4SV2ODRTBSRbRl1ALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lxe5iINM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMwTyZ3H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lxe5iINM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMwTyZ3H"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QDhrA82528462
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 15:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2aWmmSBXTFnbP3WvZysT8O12V28D99uJNPbnyq4Q1M=; b=Lxe5iINMKZ1jgFFD
	3bNvNysOilVMr3cLFzyW0DKh9agT4Gy23puiujO4bxZ9jZYMP/HPVKNMOEnsDZiG
	iFPYprHolu6PfbWI48YG7qiQU/ncIahM/wY9Q1v6r+rz1OYFgK8td+CRdNozEOlX
	0dSdRd5FKRVq7e9YeHCpsaFxoYxq1RjquvIFfmw80b0wCcER8HFMvYYlH9QIThcf
	xfnSl44XoOGKTff6EfL3zWg0z+8dkwjdlP7AptdK/GW/JEBmeeb/RRCCyFH256CK
	sgi/CFwcsDhqP0ch8r4UQRFzAc92VEIv3BHKc3HAlDKurEK1D8VraOlaj9mTLYJO
	djjyqg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnrcyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 15:10:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828b1b7fddso6104946a12.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 08:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779808212; x=1780413012; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s2aWmmSBXTFnbP3WvZysT8O12V28D99uJNPbnyq4Q1M=;
        b=XMwTyZ3HZt2oqrXuNR1/3Gn61nASbFjsbW8yTZHiyeAcmB0srHv3XX1b9LGY4X7PTO
         6LNrBC36IbRI2jKsVpnk49BYSb4PcTEJ2QPOWtGs7gn0wb2lNYolnPba/5Nt2XnOXPHI
         eStzjozCLBFRzt8IEgHbJM1HpKRaNxBIkN6rbWcF6OhU8PZXZeWDsE+mKIkJZeMct32D
         sSCcJGYKrcBe+GO9zN/BmEmQnBiPgsUlDNjR8K08koS0zgSHBCseBn1MQDfiw9aQRIe3
         Gcq/plsEuE8p03f5qymuVoVqhEs0aCfJmj9ZuHajL+3sIJDXopOqdTUSKAXJJFIBH/JO
         EzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808212; x=1780413012;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2aWmmSBXTFnbP3WvZysT8O12V28D99uJNPbnyq4Q1M=;
        b=Bx54Lm5/UrecO01+DJSFrK1iA/EG4mtJqA8I1t3phiVFf2DPtS+L/DM9orXQ2xSk+P
         p/Yn2QGU6277+U+rKvU9+KjCMFMT2fsl1cK3K/C+LLczttNWnKHDdbOiZ3+f3P0U2H+y
         Hh21UOT5fsS4ov4hB2Bjp01vCYs6DaQ3t/POVEqW4us5urkx/7dpCa+VSr7Uf13amTW/
         vm1RuXnzvW13fhUiJExnrVDQyr2LQDSVpgdD/KGY6vcKDMcssQGS4CaXmfQ3kNw4644V
         FnlA7l5eEYNzt0tx7uH5MHj/aOPSJZABchPd+gGEDllJeuGdwUkzj0SGGpA9txbc87XQ
         yUlg==
X-Forwarded-Encrypted: i=1; AFNElJ/vhjHISx5GPPnPliVRO0PXexBFAvpJ/F1cuRQFXt/WS2MX/OD8P08eujL7NBOpdnuq3RK+13zQI85J@vger.kernel.org
X-Gm-Message-State: AOJu0YziJ6pX6kQzSXTaLYYzajM/uELQmU8ZKS4RNWVXoK09IDHjxIhl
	YVFjS2tIf51NhmmM+9FzCVPT7UWx/gyosXwwlZ+4IcGoZio0df9f2+Y1aAaD3NIBg4L4rSMEwDf
	p2qCKe2T4BE4Li2JqXiT0FMpEHMiDvc3SyRSlHjHwDxVlDTrwi9aCxSajmphNqn9q
X-Gm-Gg: Acq92OH7a19W7q0niP7t/wuzn3ErkieQmsiT59CCQHDTfB2usQ0boM92qmNw55xfZql
	tyza95T40wbMNXp9T2NWq4Tuw+FXDxNreKxSCRnRyEIDEp5vpPPx/SPMSuLcPCfZv/KFgnHUW+G
	mSm0F4VYXZVgXD9ypxhC5w0ku9lijUYattV3URG8vZHmU/68qTVwdxEYOr3lihG9AfAJPEGyZl3
	9dVKWIUQnkMzQA/XmcglStoBAnRn6qZNi4wlc8XbpJfiIM6xmEGstI1qArwhjLkq9jLwIEayCa/
	o9rhwdjNZhzKzHtrdSZzvM3q84J09477puWEylS3m4wkRgNTe0sbNkc2GizuyQEVgOHczIXxbko
	f4Tg2f5R6YFiFxzuHH4Q/kivon///q7QzQPlzBw2yXIPS6luZ
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2beb037a5ebmr208156545ad.17.1779808211604;
        Tue, 26 May 2026 08:10:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2beb037a5ebmr208156005ad.17.1779808210984;
        Tue, 26 May 2026 08:10:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591a277sm130166465ad.80.2026.05.26.08.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:10:10 -0700 (PDT)
Date: Tue, 26 May 2026 20:40:03 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: mmc: sdhci-msm: qcom: Add Hawi compatible
Message-ID: <20260526151003.p4kn2vek3hpv4gzv@hu-mojha-hyd.qualcomm.com>
References: <20260520075445.2146152-1-mukesh.ojha@oss.qualcomm.com>
 <r6c7sdhuziox2hsefxn7mwsbbhnkoi3ao3cko4spf3773whlmx@gdmzjievatsg>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <r6c7sdhuziox2hsefxn7mwsbbhnkoi3ao3cko4spf3773whlmx@gdmzjievatsg>
X-Proofpoint-GUID: W_zB0FRWLEpDHu1Jl8SNYuk6lRDMIqMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEzMCBTYWx0ZWRfXyDYJk5Qhpufo
 vrkdUP92xA5vfVlWP7/DguGoZEuA318EqOiNR9BDoULE9Uyje9PMjPJFYEYXazzC88IShmQHc8k
 GUEs6T7j3Xt8cmZk0rhCmYNMDMmaTgzkYn5Kbd5T1jy00TBfIw4FkUmQWLeYzjmWybQzqw5+2iv
 ZvoTDtCG3H0KlkUTwROnMmhb2UdtgCzvSzBhUKuV7WQUbfj+6fuvWyABSiYLSu8JRmrb2Bw60mj
 1FkgEiT09e0yqVEm/FJHqn+FbjMP+GTeVKsn4Qu8VK2wcPEMK1W7mb/RXsIROyOdrEagb32ol6C
 K35f0UgE1u+iL52JhFP1ZWs5Tunu5u4qbLVjGWCwBGd5J+1DHWdVyOW3WJpFqMRoz1PP+ltPNs+
 toUeX18sZVjBWK6RXsZ/B+VwIbKDe9lIdMwN5yl1rLLYwv2rPF2TM5SI2FOrTDDNgnCBP5lg87B
 9b1KamJrwAZLYQ43n9Q==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15b7d4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=doSvXZN1fV365kk4ip4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: W_zB0FRWLEpDHu1Jl8SNYuk6lRDMIqMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260130

On Tue, May 26, 2026 at 04:54:11PM +0200, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 01:24:45PM +0530, Mukesh Ojha wrote:
> > From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> > 
> > Document the compatible string for the SDHCI controller on the
> > Qualcomm Hawi platform.
> > 
> > Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> Btw, you forgot to CC linux-arm-msm list.


Looks like maintainer file need fixing.

./scripts/get_maintainer.pl Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
Ulf Hansson <ulf.hansson@linaro.org> (maintainer:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND...)
Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Bjorn Andersson <andersson@kernel.org> (in file)
Konrad Dybcio <konradybcio@kernel.org> (in file)
linux-mmc@vger.kernel.org (open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND...)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)




> 
> - Mani
> 
> > ---
> >  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> > index 695a95e8f35d..acbbbeb2be45 100644
> > --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> > @@ -37,6 +37,7 @@ properties:
> >            - const: qcom,sdhci-msm-v4 # for sdcc versions less than 5.0
> >        - items:
> >            - enum:
> > +              - qcom,hawi-sdhci
> >                - qcom,ipq5018-sdhci
> >                - qcom,ipq5210-sdhci
> >                - qcom,ipq5332-sdhci
> > -- 
> > 2.53.0
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha
