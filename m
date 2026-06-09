Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F882374190
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022322; cv=none; b=LdXjC0AiYiZOAz+jPVdVcsfKipW2OqgsJY4QCRavUnpO5PaJcecTWf7yF9cMkOYtd9jJ0NXPKgMJF5+X+/TVpvXBe5m8/n0LrA5z0Wl5OvB2oLvoitJpC8h0EzyJy0ojp7NucFI4ArWA4jCV+Y0OK9c+mt5t3kYKt3FajMXf5LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022322; c=relaxed/simple;
	bh=zle7y3M4QVODtmVpss10Mqe3V9cSUnTbYMWNvBDGhWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbTlV0tc+I6H5wl+Nz+T5bSxcR81y2Ef10JB3dLuogT1faFKWfEuU2f+zKnJCoaccpLiPL5CXd/BFRtpABhxdnCPVoV/sKEJN1BecIw7FppMXBrpUYFn6SQiZ8SF9AenaCYg84Pa8qYAxC58b7KdqH6DkWTqV5G9Gof1cSit2qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2VCpcjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtlNUipg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2VCpcjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtlNUipg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOZ8x2746336
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 16:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XMoLKRw5r6fZppx05VZeAYkl
	8r/wHRIiOFUZe20opBg=; b=d2VCpcjMPL29RzdhADlJJFcHK5ZHD9wjqNuszUYA
	QZO1+JS3hHEwkypjo/6mnEtnvG3isDt8fiW0R6DR+zEpre3CFKf21jHGHu9oVeaj
	5L4oYZIYbZ8w4qX++9AqPR44qOXfhI0IhPZf65ZWkgSKy3PlT+6lrclFefVfLQ9F
	ajLGuUlQgiVw6JXjNYKiOJKpfDFDADtttZgisn8iouNkSTwQ9D1sAtJVLxKFAl4u
	PpnkKi0zNSviSLXIPsUrlTSIXzsGgVOUicCKundRma6OmvVJU+NNLZettNbo+o3H
	F8SePkB6FenZcYgoEFOD388w2pwk31nNMW8fl2PhreSuSQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wj1bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 16:25:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84240b58211so4065511b3a.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781022320; x=1781627120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XMoLKRw5r6fZppx05VZeAYkl8r/wHRIiOFUZe20opBg=;
        b=AtlNUipg4DjdLAy4wnp0xbGkubOBZ2vEw2WKYjQ9/Iek0HeTrnOa3PdvHC8BZPMGop
         +OV82JCy4p1HHrl/ZucrD7ZoW0xSWaIb0J0Rp8v5cVo3EMjU/sXYU7ZNbhOschZ1wq4q
         AHHBx7y5GbcQnQhup8yk7DW6jegqlIR7k4jyTYLEFGuW5puC1VIUZ13c4uXF0pdFZAdC
         1eBdetaGiojfQ4anE+heHG85Y9dl5dTcMLuRuqOAMgm4W+i9e4UqVWNXR7mM9oQcr/z4
         azGH5coz2+2QzgRVML+5wxV+fxIXscQTr7h7/jF4w9JGatbMYMdFGUIISGa15AVY6xqQ
         RUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022320; x=1781627120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMoLKRw5r6fZppx05VZeAYkl8r/wHRIiOFUZe20opBg=;
        b=d62UB2slIxbvAonRJK1AES0VA+LnjpPQLw9EV4UqBA6GWZ0KfNbCGpBLwxk7Dpxq9U
         ZKyi7GUFRNg25sa11V9+dH863+SRF0yZgdRnjJsSpMK9PAuv3hFZqcM4GHd49+oSs9ce
         SrpbmsG3sQGs44kuKXz62bD9cUL7CnPeP5zAn2sQWIFt/65FIVhkc6WCtpHDs45tUTOr
         nVqH5LRUMmE4ew5bECylVRCELjVGGJE7EgQqzhRNMIRSY20EZHgg0+V2oHogAw98Lkqz
         9OOEF1kCu8F+6B51JRrc4o4s3//BY74mZmqBCCqmedGUlwmOUARP9TcnkWZE+nZuSsQc
         GY+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Iz3to7OxenNEDQrew4fz2MnarSdXIHFIvPMTHuH7M7+3Qxv+wjtFLvWZreUfrY+GA1JxAu7lZFWav@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24+9FjVD5+25nFJv30VoLjk7jXu9pEyJ108eqmd6hYSkvMnYj
	aOXlVuZQ8VW9VkzcX+JzVMWcFFQQ6R50UyhM+joCWIg1htmvrUI5b3YdtgPIHKEo1szacX5YNLn
	pNjXt9l9WahuOXw5UD1rgM4sK77pqxOW4vx2w3jYeIjErBOqTfRXz5ExOtNNkUuAj
X-Gm-Gg: Acq92OH9U6aBMCixl5RwRJhCEVMCuLmpfg6vcrCFoMDsJcSv+E3xe2sbzfzvEFfJXRc
	S7SlbI4y7FXoxHUmr0BG0muqKbOfoSlaUsq0jctWu1JOcx8qwHm3NwedAufrRGh6zXTVfrcsHH8
	RF4D1D2PrFv4Ls8vYLJLW091Zgo5QCpNWuDDKi/tbndNJT4+etm2ZVKAsySKmzz7vMrvIVy2YII
	kF5ifNBgrW0ANXzJEHANRwdU5V/nJc5MOojQhobiwD4NGwnNcFQzmAzQSSJcYdpSGv0majvlEcN
	dgjKtqxivMZqnKfaTNeC6xhOBVVwu22UVNfqhS2v7WTN78TqeA0+H1b76UFBX7iDnIUghjLRdp3
	x0B3V4BktM3+F25OClbgxn9XXJZO1peklLzXW/pIvuqtD5lvzprICOIA2750=
X-Received: by 2002:a05:6a20:12d5:b0:3b4:895f:6ac8 with SMTP id adf61e73a8af0-3b4ccd1b4f2mr26166672637.3.1781022319973;
        Tue, 09 Jun 2026 09:25:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d5:b0:3b4:895f:6ac8 with SMTP id adf61e73a8af0-3b4ccd1b4f2mr26166599637.3.1781022319240;
        Tue, 09 Jun 2026 09:25:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm19162834a12.17.2026.06.09.09.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:25:18 -0700 (PDT)
Date: Tue, 9 Jun 2026 21:55:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2 14/24] arm64: dts: qcom: sm4450: Reduce OS PDC DRV
 span to 0x10000
Message-ID: <20260609162514.2jwiar6wodlyy6cw@hu-mojha-hyd.qualcomm.com>
References: <20260527094333.2311731-15-mukesh.ojha@oss.qualcomm.com>
 <20260527095343.9192E1F000E9@smtp.kernel.org>
 <20260602163821.GA464439-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602163821.GA464439-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NSBTYWx0ZWRfX1A8CFOSK2atM
 pS1aZ8PbZBKw9jgXEPNcWJAfoSpwUVbZj9dlIYpAnjzApZ2o7SnrD+ckCylr/cyFIH6S/wXuWFt
 rXH1vIZRjojr+XXOJKk+10mPUPfMTRuooVJFyHAm4VFXZUQOLnma8KuGHyuEXkY5IXNwCRx5Mo4
 IchZS2ZsIbhDL30GmGJ119xwKMm2u7HgWL/4p9B1uiConn948lrtcWeOZiL3z8qX/mQO+YgvJDu
 63k16LkHnosq7Bhi1DgehRiyq9eZlqMQIJKPMbc9upXD3I8XTpYM06CKdF0cocPx+Ds8kdfkDcR
 Bdm1G+EniJYXh2UfzE1EVZQZRflJjDL5kfVKQNXcB97t/Xv0KIDTRdBJeE8Wvbb526Tf+Yq5icZ
 bhkfdijTccQNWGgDfWauyBi8vL1EdMMipxX7M3HQW5uWlqyO7ny6J9W1uaTGJwbxcZ4J5KkBSu4
 rVsu0w3X2Rr1hQ3tXcA==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a283e70 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_blq5yYnQAhNC7mzMlwA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 9robNiRx4RrLGRz793-gKYhI0PgbpGqo
X-Proofpoint-ORIG-GUID: 9robNiRx4RrLGRz793-gKYhI0PgbpGqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090155

On Tue, Jun 02, 2026 at 11:38:21AM -0500, Rob Herring wrote:
> On Wed, May 27, 2026 at 09:53:42AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Reducing the `reg` span to 0x10000 in the device tree is futile without an accompanying driver change and will intentionally trigger a boot warning.
> > --
> > 
> > commit befb5e3c3aa5e0f54a7fff3d0f4a5e96013f4a7e
> > Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > arm64: dts: qcom: sm4450: Reduce OS PDC DRV span to 0x10000
> > 
> > The OS PDC DRV register window on sm4450 spans 0x10000 bytes, so this
> > commit reduces the size of the first reg entry from 0x30000 to 0x10000.
> > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> > > --- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> > > @@ -464,7 +464,7 @@ dispcc: clock-controller@af00000 {
> > >  
> > >  		pdc: interrupt-controller@b220000 {
> > >  			compatible = "qcom,sm4450-pdc", "qcom,pdc";
> > > -			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> > > +			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
> > 
> > [Severity: Medium]
> > Will this change cause a boot warning and fail to actually reduce the mapping
> > size?
> > 
> > Looking at the qcom-pdc driver in drivers/irqchip/qcom-pdc.c, it enforces a
> > minimum mapping size of QCOM_PDC_SIZE (0x30000) for all devices to maintain
> > backward compatibility. In qcom_pdc_probe(), it calculates the size as:
> > 
> > 	res_size = max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
> > 
> > If the device tree provides a size smaller than 0x30000 (like 0x10000), the
> > driver automatically expands the mapping back to 0x30000 and logs a warning:
> > "%pOF: invalid reg size, please fix DT".
> > 
> > Since there are no accompanying driver changes to gracefully accept the smaller
> > size for newer compatibles like "qcom,sm4450-pdc", does this patch introduce a
> > spurious warning on every boot without achieving the intended mapping
> > reduction?
> 
> Seems valid to me. Even if you did change the driver, it would be an ABI 
> break (though if only introducing a spurious warning for existing OS).
>

Yes, it would cause warning but I think, we should correct the size.
there are multiple SoC like Glymur, Kaanapali, sm8750 where the size is
correctly mentioned as 0x10000 while for all other SoC it is 0x30000.,
it is inconsistent. For Glymur, Kaanapali, sm8750 as well existing OS
emiting this warning.

> Please reply to sashiko reports because the maintainers are not going to 
> analyze them for you.

Sure.

> 
> Rob

-- 
-Mukesh Ojha
