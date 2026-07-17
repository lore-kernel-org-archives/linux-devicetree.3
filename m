Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CE9336886
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784259749; cv=none; b=gxRYkYaZzPj8ioLgZXeCQTCnmmtbV9d+/pVU1h7aryjDfV0vAo3ewzAxhjdV/lMuZw6+Tv6UDZrHhDwdag02Yyo8M6OlV9qZc4smI9vTZivAWCzD1yAjrCBSMONeMqbt74GmOQGmW8StTzF1IHB/uu0hA6uK6zeoIq1sS9/V6ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784259749; c=relaxed/simple;
	bh=PZLunVrkyHtC9wfdf+kbcQ5bdeFIPeDTlnp6w7k2OYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oF6dxJSr3KxjoLQifDR9EVP3kw9JX+Cbf1edS0TZxwWbXHVr0gT8Y4B9VqWokxDVSMaf8dNWUBx9zlLsiy9dIj/76Ow8HOd3IEfq8Ttfu61k/bhHEzz8NM2YAYDvL3mG8/deZxQnibdytTxgXH6Q27niNgR14UBjkkrthIbCatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdJmPiFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZ3PJlxN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdJmPiFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZ3PJlxN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33sGg1617291
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l5saWHr3dnLJEHPhwGPzYl0K
	X1zNELXP1BiUWCkz+mA=; b=bdJmPiFLP6nRbBRlNw19xZ463qICNAeLUdMVQitv
	j86NJrmzrC89aWZXPVwFKkd6fvSSBE5OEbbFA3dDN3oU74Q4/Bb72Al/XP+axYYA
	uSz8y7LO6disXMPVxTouGQnsWacHrLS3XrLGXVYROkT/vpnalhN36KAI2SM2quwk
	y+e5YuHpkXJH0XPUFalLjOPzFmJwIFc/Eq7SHal9VLGdCe+364DBp67bfAf0vs8d
	e/w7fUYEVDoEHDffFN9cpyUGlvfpMgODPa5QRgDXqe2mBCgVXhw9P3PYdPUp06dq
	tRA5/cHQ55v5hDjA6p2UILUi5Tv5EI/9kC4Re1Rec67p8A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6htug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:42:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so9727996a91.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 20:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784259746; x=1784864546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5saWHr3dnLJEHPhwGPzYl0KX1zNELXP1BiUWCkz+mA=;
        b=kZ3PJlxN1micX76bAvnaIOyf/69GCmwpcTqXeMjN4Ua6/GnB8T3w10OzD+6fQFxLoc
         5M3iB8GT7MUCMK/EEpmXzIACY0UElKr2GdDXf4GUzOKGWlnft5IFSHSCjmIzBgXHrE2j
         uvbbt/Ci7MYJrDx2UTYGF0vLixmc0F+nhbqfdS5v+Cs1QbRoYJig8cOdB4cNrdBG4mq8
         2fgxzNKHXtlbR0bq+FaaUgZdgN+sSeSfasTpFDN+8fkP/UJPSdiy7p3ABEdQjeIbDsxY
         Kw8tnz++GQ5Inm3kCZEuD0/SEiGlgrrBT0I/xjNV7AL6ifmvykGemgIN3TUN6PG/eMIa
         6lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784259746; x=1784864546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5saWHr3dnLJEHPhwGPzYl0KX1zNELXP1BiUWCkz+mA=;
        b=jAbYkjJKJSftFkS2yzT4QUggASDQVmmRuBZEP7zpyCDaJ9BsyBXucQ0inmoeU/hi0y
         KYdbodstcfB32r75HfdRGb+aNXmQeFlJC5xjb24CTmB2d4i5FI9mRRhG3m/zzz8tdAhc
         QEmYWPkpVJyzgolAXKhGp2gG+6tlepuS8SfWXoNjU0sQDcAMcVcKdOzXZZVrgUKBbRjk
         b+m8zmjA41eBgNLrDOsxa6lF5qzNW9mOLBl8XZ/a+X4xD8+0KBcuArBV29u+rO+ui+vH
         xDWLqQdbIeYQsiNX1r/Udsa7vOd5EWRNDrkGcYE7E7Yd20wkaEP3eGmLLUoUl0GLxD+V
         6afw==
X-Forwarded-Encrypted: i=1; AHgh+Rqmed78cOIBoLfR35od1ictClNr3ojZ0P0atDAIeuNt5bycGoWP1rq/oAmlAP/eh5Is8kPCICULI4cw@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1L1bbyZ3mghYImdUo7vgRGG3ZhzSQ3GZ110YJXjG/49Ujg+G
	fOD2eTQXszwaIUypLOb2Vlr9NgukoPfyK2IkYiywGNI0GuBJK25CDtaF5/ZV03jN3pwyz+O0ifX
	CPv8JL3TmGNEraHOSlGXlsKlCJeUuAwJL55sR8qzSawxJ6qDXIYq6INsmtGQZN3KX
X-Gm-Gg: AfdE7ckZNbEyZSvJWsh0VyALvNPjlfronOMD2j8yLA5lGZLtu1vFtfTZnkVM30nmIvK
	dqwkPB0BhFAxptfALaagbEiBjPnri4WeYhD3YjdSbfG9W0YMoiEH91/vFdZd/wujclYWSx61o28
	e5yjSmYkNZTWN3tPal4uR9hIEINX+VSlxbbVxw3QZdJM3w/vW8XupK/W/rCdDpQZnstsHcsnWNB
	M0dNuHQrpfl67UeQiUYAAfz4Z0wUX/nFP6WCIBhu9twlnKpKi6u5lf4GHa9ibnYl9yeHYYkCNhL
	9f11U8UmmNgDJN0aePVY6CaaCQHxXQd1xDbAruiXSybGlr5Ap+PDaqb8MR7j15Gp88CcT71TFUx
	ArjSfblK3zIMHvQ7plIx0zVYYQ+Z+LMEH1sJ5aiX+9e8fKe7cqQ==
X-Received: by 2002:a17:90b:528d:b0:384:d509:7274 with SMTP id 98e67ed59e1d1-38e4b448dffmr769090a91.15.1784259745804;
        Thu, 16 Jul 2026 20:42:25 -0700 (PDT)
X-Received: by 2002:a17:90b:528d:b0:384:d509:7274 with SMTP id 98e67ed59e1d1-38e4b448dffmr769059a91.15.1784259745345;
        Thu, 16 Jul 2026 20:42:25 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm1702185eec.24.2026.07.16.20.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 20:42:24 -0700 (PDT)
Date: Thu, 16 Jul 2026 20:42:22 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <almknp4Fx4EXqjm-@hu-petche-lv.qualcomm.com>
References: <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
 <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
 <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
 <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com>
 <allvBYQN_0QkI835@vbox>
 <almDYCfHf4WV-giY@hu-petche-lv.qualcomm.com>
 <almJeSq1zfcC1mjj@vbox>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <almJeSq1zfcC1mjj@vbox>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMSBTYWx0ZWRfXwmc/073AzO1E
 QVILJR91/z5x1tgkqoIyuIEjtmFTLjvtwLfiIsWTPXaQZdDOOMP+HGeRKKOJNCRLib1hBGJVfhl
 fw14bZxQPvcyurDFHKIxiAx0NDWjTN2mp6iO5Fcxmof1s5ooiEcaetn6cls1CK6tav0sgy4Kgb3
 kR7hv9KOrfMMyopZ2o5H4yySVTaf3MiPOQ2IfGsilFUZCgl6RGDoqfWXMMacT5CUHOLtYtdrfm5
 eo2PkvqyCGy8l/ynLFwa9se+upAKA3X8mfgs6RkpAWeMUO/1tW3rFJw6kmzkDaLKl+kTzM6/WHq
 /FzjL4FU29oXdOyo3/VfvIIzP3lW0hvwUyMBbZ2WwYuknNf62ZNp2FmyBxImKlapWUczRO9JNax
 BIljtG06DxXlF4SaDbWg5ogkRLT6RtT1aWETDg2llaijg3V4yCWm6kss+T2oeiRCFAYqRMiLYw7
 uBvf7D8C0YJG9wCkJ0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMSBTYWx0ZWRfX/3SsWud/sI9z
 wjVqcbGipDJEt5fWKAyrcD0N3CdU7BOc+JgI8KE0vEUezV5QjubdUKn3NLXQEjFiOqz1fRuYmqX
 5uWAdGB27fg1ArrblPFooSbYKQf+eO8=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59a4a2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=zDMlSImzIToMmpLGiZwA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 26zWZ3RrogdX78Z7WFXb12OYukQbFo-g
X-Proofpoint-ORIG-GUID: 26zWZ3RrogdX78Z7WFXb12OYukQbFo-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170031

On 26-07-17 01:56:59, Thinh Nguyen wrote:
> On Thu, Jul 16, 2026, Peter Chen wrote:
> > On 26-07-17 00:06:37, Thinh Nguyen wrote:
> > > > 
> > > > I have seen fewer platforms use "phy_type" at dts for arm64, dwc3
> > > > core uses it only for special cases and the code was added for
> > > > ten years ago. For the default situation, we may not need to
> > > > change DWC3_GUSB2PHYCFG_EUSB2OPMODE value for UTMI+, Thinh, is it
> > > > correct?
> > > > 
> > > 
> > > The GUSB2PHYCFG.eUSB2OPMODE is only relevant for host mode and mainly
> > > for electrical compliance. Usually by default, the CoreConsultant
> > > setting should have this set correctly. So not explicitly setting it
> > > should be functionally fine (IIRC).
> > > 
> > > That said, this is separate from the GUSB2PHYCFG.PHYIF, which the core
> > > uses dwc->hsphy_mode to indicate whether the UTMI interface is 8-bit or
> > > 16-bit.
> > > 
> > 
> > Why only rockchip uses this "phy_type" property, why other SoC vendors
> > no this requirement for UTMI width setting? 
> > 
> 
> Not just rockchip, some tegra and hikey also use it. Some old qcom dts
> files also have it for ulpi.

Tegra and old qcom platforms use chipidea, hikey uses dwc3.

> 
> It is typically set when the coreConsultant default differs from what
> the platform needs, so the driver can override it with the correct
> setting.
> 
> My point is that changing "phy_type" definition is more involved than it
> looks. I'm open to alternatives.
> 

I know your concern that in case the eUSB2 PHY SoC wants to change UTMI
width, it can't do that. Are there controller register know it connects
eUSB2 PHY?

For the place to put "eusb2" for phy type, I still think enum
usb_phy_interface at: include/linux/usb/phy.h is the most suitable
place, would you have any alternatives?

Another solution is using generic PHY API phy_get_mode, set fixed "eusb2"
mode at eUSB2 PHY driver, but it depends on PHY driver doesn't have
different settings for device and host mode.

Other solution is compare the generic PHY compatible string at dwc3 qcom
glue layer, it depends on eUSB2 PHY compatible string always contains
"eusb2-phy"

I prefer the solution that extend enum usb_phy_interface for eUSB2 PHY,
it uses existed kernel structure and device tree binding.

-- 

Thanks,
Peter Chen
