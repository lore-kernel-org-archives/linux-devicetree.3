Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F23B3C10
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495032; cv=none; b=nwm6lkl5xmJrAPPungBeBrOLIIX4qih9rQRUaRSNKCpC+Aaxq+dAfptshTrYST+mqZgFQ3J6CeBnr4G2836KmHimuCOEbsj20FSKZVhT8JhacqGPGFqdOdgiB/QyPFu2QbbYFjkfW2Javoe+uarCaAMGSW3VqXbxhQ2KW773gH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495032; c=relaxed/simple;
	bh=BkjMKW7+8FnZOZD72U9LhPB34EKJWNTUQ46uB0uxy5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WO9c5iEZXS4Z/LuSrqyjuF6byM54Abs+Yt1SLxTc+ggl2qY4skwvtmJkoGpMEfHAbHQwbHRsoooA0TDcUdzTBea5JGVVgXO3KN7yGagwY91iStaKst0PpBWVsiAK5VJK5SGdoUk2UH5GCSNrHxar9CNItJk3GfeOBozfsNEVaHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6c2DNWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfdwU7M0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6c2DNWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfdwU7M0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653C1JIr873749
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 13:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KVLNU2hz7lrMuAYHKsdh7imO
	5qzntYmAuBVg+ugqAkw=; b=p6c2DNWxfGqwaNFrcIrbCkS+18fjdDPOk7lxocZV
	QyzHZ+81J6yNVG1oVmA++zJUYEa7q6t7NLDPQG3DT0xQPR9+HBYk22t2MW1bq15+
	7/vbqwHrfQDyt1MB1cKH6JvvLDcXgP4hkbzZG1X3KG6CT3fxeGnRaOQEDid2xhxw
	FaQq/0XMAiUEErslP1KUFnwntiAqswy/N5hDv/HSr3C+/ccP5hSUXZOGvlmiW+jI
	oEtJQDjkzPRLdGDIsfa/6BJA4dVOgpZnhMUwmmSSbn6vU54MNbnROQir5nj/uILU
	RR+hByJ7Phb6B7a3UUJwZZaNxDzz+RdD7oyv+YjpvteY8A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9kr6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:57:05 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so671336241.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780495024; x=1781099824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KVLNU2hz7lrMuAYHKsdh7imO5qzntYmAuBVg+ugqAkw=;
        b=OfdwU7M0xD/+8zwE41WmpnWz55yuhb85QSxtB9kx+Ad73ZSB9jt639PzEi++xnOdHU
         JjhNbHc9OH2rfaDWbM/Z5VDqM0i3ep0EAuF5AbGJAphd9jvcPEl/gAibc/QCt4vvs70B
         boeeoE0e/Ry/IAWricYxrPClySn1sQX812UT5Js3JMGjeLD+W8SF/HsqccXSpysuTidV
         L/+yiVWiuT9QTPu7cthRbIIiXcYtNTN+798DN4zHTt9FWcUJhWeqKiiIowTzrVT4PDr9
         sloXP2FfQWvoMsLhTV5wHgXakA+GMs9OAz3+3c33t201oPXKGlSjHj1CCw3R0uDR3O8c
         /O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495024; x=1781099824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVLNU2hz7lrMuAYHKsdh7imO5qzntYmAuBVg+ugqAkw=;
        b=c7L/n2P04QbUCOJv5ov9riO+MK+jo+EcFU5Xdodv/caaBNAAaL4wfr4+3cS4uuFWp7
         7BRaRM37jYuVAiN6JGO5/bTegI5lJEFnhyLvQHuCLle6mzBvmRqCsHve7C8QiELPiIfN
         GdMSl5bgVvHRn53mvLeRSrx1u/bPdgEqdEx69ogrM7yP/4EUzJpsF/gPeK8n5CboN3LV
         6VmJra4/sYHjfbROrJWLhAezgY1VqAZuzQmVjvQpSLrMqRp4osgqQ7REw+9LvH4c2xtn
         Y6SBLbTkDV6YUWGYzrOiyFERer+WN4N7EQfe/ZFjyf9pghXV0bmKPsFWTpQ6wpbXICFm
         NcOA==
X-Forwarded-Encrypted: i=1; AFNElJ9DAI9v97gh/ABRItwClGbMFwKv9o1/xXWG+QWw54hYPwmNd5QEcAhRrH39yhzRX7HwOtzPaA/bwroT@vger.kernel.org
X-Gm-Message-State: AOJu0YzokPDWeMcoFEDk/aqDhoFqqX1ScGjKIiadIXj18B1aiOhozxd1
	OojzANirsOnuzV/QyD2seKn/230tBShepCdDUwJ/87iO3UUY2W6xbdgr371kl5bSdnl8dNn+ffg
	BIXMrZqa7N1uDwx0t6pNbOT2solRet5ieX7JZ4Krjj7BeWpm+ZwsxMvoAj3/dVNTt
X-Gm-Gg: Acq92OEjicm/2hAPV3/Euz3Zg7iVppWrTDbTZOPmD+drFvyoakoY9L1SrIZ+x2hHvXk
	p03DEKGWA1hV+0anaXQSl7GDdZNzrsxijgop99zqWAFZ5Lr2oqDPVaJ2KmEMn/e6arpG6385eTe
	lkdHTTUjiHG616CHLI81kiUG6XkMVz+ZcGTMVuYK+6/Ah5GM99bpHh0yRmN5cARoNeuJtvyTAiV
	sK4v7a7ER99CEQNGzeYhXuxD170aHMQ2NbrVCfU6TbN7lbugMEn3PYt2ywpG0WTlYrP614OusJi
	kLMFaYHKLum2VFSmfPU974U2q6gJ7b4AfVLGANSgjOrn0zC/DJcp+dULxlizsKt+bk8T73db58M
	Sk9j420PRWdQP799X+EExz/+NpxwuhXt0Hx463/dKyObibO+H92OuX9lkHHCSBl9kuTnNC23JXI
	KnkGXhlZnokp8+dbksBjUtAETEpx8bktNLXqoz6C+jAH4drg==
X-Received: by 2002:a05:6102:570f:b0:631:2a82:111f with SMTP id ada2fe7eead31-6ec6efa43cdmr1764530137.17.1780495024102;
        Wed, 03 Jun 2026 06:57:04 -0700 (PDT)
X-Received: by 2002:a05:6102:570f:b0:631:2a82:111f with SMTP id ada2fe7eead31-6ec6efa43cdmr1764513137.17.1780495023488;
        Wed, 03 Jun 2026 06:57:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907a26sm672601e87.35.2026.06.03.06.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:57:02 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:57:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
Message-ID: <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603054809.565723-2-github.com@herrie.org>
X-Proofpoint-GUID: rkfoA140eJKdi9ZfVDEEIuno1eUiKoLJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNCBTYWx0ZWRfX2ZfnH4kcIOHe
 hZU9eOTtgLhVUJBnRcoRlfW1DTzxQJiksPE8QJeX58MDygD34GhMFhmyHWtXZeT2px6uW/+VCQB
 pOZHYcjStfyxTWRX/DMpcx3bljSiz5wCv8r6VQmvePRS8Z8P8MRsZCO0Zo2bVxVduE6JLWfFlhv
 RQl9xN/V4kpZexW/IppQejC/xvOPCHoZY5w+/8UWzETg9rldza4s25UHmvu4LNDBP3VDXg+1xsX
 igdTi3hB624dsgq6BC5X5IrSIyMCOzqcqxKpuEfB2rM4s3K3/JqPN924uVGPdl10l3WQLj2NeOY
 50axTaxLYm8wtt9RcvoQgUtmDg0sB+fYFvyvzhTW4boW6jPVFtkPcXMxFjfZ5BNP057gVQv4F9z
 PFwadqgk0WwCcsO5nPLFdNdKr67t8cPOeoe/5LEFLsbN/2IWgWX/QcDhb5rtRMyJMg6RxiXl7+J
 5De2tLdByTIPLWLxVwQ==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a2032b1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=DB10H_R-sGS9ZoZ16qMA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: rkfoA140eJKdi9ZfVDEEIuno1eUiKoLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030134

On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
> (address, value) pairs that are written after PHY reset.
> 
> Unlike the existing "qcom,init-seq" property, the address field is
> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
> class hardware needs this range to programme pre-emphasis, HS driver
> slope and CDR auto-reset bits the legacy msm_otg driver used to set
> via platform data.

Are those register writes specific to the device or to the whole
platform? In the latter case please extend the driver to write them.

Also please note that writing raw register values is generally frowned
upon in the upstream. It's not easy to follow those and not nice to
modify. Instead, if some the values are required for the particular
device, please add corresponding values to the DT using the
human-oriented values rather than the register values.

If you have questions regarding any of the bitfields, please ask here,
we can try finding the data for those.


-- 
With best wishes
Dmitry
