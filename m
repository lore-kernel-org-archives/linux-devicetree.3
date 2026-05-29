Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15752383333
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038134; cv=none; b=ciUOxoImkipuESioHFPvWGumZYiDiN80ILZRtImegxkywobm9SgO+T3siv2/xFRUOazU0KyWRqdD3gORAoaGfabUWuH6RcMCtO8Ii124nrOb1sU0jZI0u3CldeqejxLz94rkobWC2uYHJFt/cxKlck6qCCsGXvHKQIGnURaxxNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038134; c=relaxed/simple;
	bh=4pD45lRvztNJmvYS/zIvzADo5zNT7W/KdbjrpZhEzqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNE21sKQVMr8umnkF1fnS9Y+ezUNcKAXZ3PajQomSJEkfunFL4lhUVYmHLHvLGkYzmvXVthvwLus5IXCjKb8VT0gaxGw/BFjwvFJVUQJYXlxmCtEmeqLcqejYjWqSTSx/BPDuaBa6rn6PeZ+b2uj/GnR7F6xSR3wNTgfCgns3Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eue5Lsf9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZZl6VkH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eue5Lsf9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZZl6VkH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SM5EYk1830114
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PtppwkbDnLXm5C93LFDp+ogllIKnh/APOK79feKM0VM=; b=eue5Lsf943Kr+vx0
	EthGTDnomIOolQ2u5G8a8unVbV8Uzv3HgUHCESGi7u9PbxWiFUf6FLdlL2+IABYj
	ar/OkKYhH6yJvSdOEPldV4RghZf7R54g5tmWPH15NANGuU5PkHTOAKcRUlRXn7jn
	SBY5zNef8DkuDFt0E3aia7s05Ed7AGU4tueo+qQgvUVxREvAZ5kxSLzB0IpJy8pQ
	AZXQy+2VyGZDMzH16FD0CZAfLdhl4C9FXPPEZOO/glrWUajaUMX8gdn4Bhhp2Jyb
	SMXWRbQldk5Q1ean76gP1r7AFNkNRuf6tgZSAUbjjYH1+i+qSOsLbwbEKUVbKNTK
	LvPy6w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m1xje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:02:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304dd917645so1216427eec.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780038131; x=1780642931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PtppwkbDnLXm5C93LFDp+ogllIKnh/APOK79feKM0VM=;
        b=AZZl6VkHeJ6Mcw8AzkBqYzpwHKckcdmr+WLF4k8uLxzjHJpK6+FzlbW+KO+r1u62x6
         2md6KD6yBGnnSapA5fF1P8GRDQ4OFr6KhTTfkvwtr8ZjNXj1oETgZ+LXxNqOFtxMKmSc
         IsYIUOkKp2ldwM08K55gv8jLlPiYBA03Aq2Dddu7Zu4TSXCV7xXextBRdp8aj+DAvut5
         0tyb2ZAt5rf0zoVC85PHc6pU01oLM2ecUBCNyLdrY3hYQIJVerm1WN3d95Ro6z5N8hRD
         hWgFwSKttcUITVldJMBGeVxObMNZNJWv+PGDe7YUThTGx/TCitVfGP1nT7mz1eFreuIH
         v9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780038131; x=1780642931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtppwkbDnLXm5C93LFDp+ogllIKnh/APOK79feKM0VM=;
        b=KhPuiJYEa9pNz8WPvYptgNee83KAeKEmMxMdAzuyQVXneUDAXgbZXx9nU1rwIAaz0S
         FuO9Ibm8hb6MGuhqzQVLCQp+8h0F2jV2Wu7HSIc5W8PXMFtxXkmVKMohMJV25EA8xIc8
         oGXmZB2LmlZkXbzmTHs8YMEe5U6KTvR0tuZ9dkF9uUdlYwEr1goe+8PjdJjKoEwYxd1D
         FHwGLtc8/O5FiuJi+bL0elQqNzX91TMIGw/BnjfddxLmtMxv1E5ReDt1ebW81ixiwdUx
         3gbrslKbtJeJD4TC70uwkuW/mLYENAoLOene28D7FQwWanKnQFhfQHLCmRfNTQE66SNr
         r5hA==
X-Forwarded-Encrypted: i=1; AFNElJ+DNWop2tneEb3q066DijbMnFeDf96C3W3pzxp94xavIZd+TGyV70xwAaX6t/t5p9PHs10w+GRuHKf6@vger.kernel.org
X-Gm-Message-State: AOJu0YxioTkLNHYlJHDIkT+Xh0JZeyKyEbaUsvvUXGnS0Xl0iYhgT//U
	s27vCeiEzSyCZ9RpkWmvucQTndn9Wf9D2AzF8fHzsD+0CQQmk03cSoc7THeqslcRbc6K+PD/fFD
	6Qdk2cWrfoYp8MTzF8E4QsZvr34Ecuxkj2bgZlvoPJgakCwXxgaHxY/3eJKXk8GQK
X-Gm-Gg: Acq92OFPZEKqCds9IvDNtaTaU/6Ugt78i5EVJe8zYslanzoEqoK7qm0Z3gDFwkkdM8J
	OlLraDWEZzZL4bhkBxM96Xml9h9N2ttw3/0D97sc7p6hgmrmJGJ8bOtmOwh39SoJis/r/sbQQ7j
	VrtY0FbkkAyyZp02BYNyQyMrpDOO2pC/0dRB8TIsru2ypD5z4ZhUqK9cZgKuIEjGJpOR6ZVSEG9
	QpHqH6fSatQC5H8qkks2tvAr7J3BSGIEHKiS+gGQf8puvh5jcpQYV93bfHX5lmjSNR8PEIUDps6
	yWPo8wdL7mCRcFCUeaDG5qfRa4RW//teuj0Ul2N0Ag67uTDQ8PJSxeynLHEXuBAbWIo1zeZr4bl
	ANwTYGHbQdqPdhxPB3kGVl1tSRgHF14H5uyrMAhyYlh1+twRsuWk/g96VRMHgtPfEMwMKo5eHh3
	XppL8=
X-Received: by 2002:a05:7300:6c28:b0:304:cefc:5fe3 with SMTP id 5a478bee46e88-304eb0d7e2fmr776893eec.18.1780038130815;
        Fri, 29 May 2026 00:02:10 -0700 (PDT)
X-Received: by 2002:a05:7300:6c28:b0:304:cefc:5fe3 with SMTP id 5a478bee46e88-304eb0d7e2fmr776872eec.18.1780038130188;
        Fri, 29 May 2026 00:02:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed3358b1sm746216eec.13.2026.05.29.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:02:08 -0700 (PDT)
Date: Fri, 29 May 2026 00:02:06 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
Message-ID: <ahk57lEoWQtkGsJt@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
 <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA2NiBTYWx0ZWRfX+cFy1qN4cITN
 aV/GrpfRYekQYSiVvtN2ZPT5EG2fhAegEhrjupR2X6H1NHY4InTREdh6O5qiqqcHkTrENi03Cjv
 8BmGQg0eghMmLEH4uQ5whc6A8hzoofmwxJ1DgQOqBX3m/J0CKIISu70lCt+vJggxSyVLTC9jz9L
 W4AteYOW927coDmp1kfEGdfqPouPGxcytQcCaDcxuO1LI4+1uA6sUyRievbe3cYC9Egn0wcLtdV
 GIkssjawecW02IkZAzcjL5H1NfQNozBUzWdUg/iLA6UOnzTsrbphhrtF1td93ScnwlafQpMI357
 pJGhQUdw63h4NmkhnBr5UZ/W0zIOUdV17cAN+ftjuGuuK1QNUzSsUnepNJ3GcmKy2p//34jkzX5
 OY2XuADl+w6K7YwUkHMbxevOr5sXJYuZopk7ifFAXN7XNKpVfIUoutJJyhzFZt+1Byw+QSeEhI4
 aBe81C3U9CZ5kAy+RGw==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a1939f4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=CphI2k7nj8PUyFDNSj8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: zEVnNst96D8CLCOKldg-bHSJbDLGwfCf
X-Proofpoint-ORIG-GUID: zEVnNst96D8CLCOKldg-bHSJbDLGwfCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290066

On Thu, May 28, 2026 at 04:48:24PM +0300, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
> > > On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> > > > Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> > > > under a single DT node, each requiring its own pipe clock registration and
> > > > DT resource mapping. The current helpers are tightly coupled to a single
> > > > qmp_pcie instance, which prevents reuse across sub-PHY instances.
> > > > 
> > > > Refactor __phy_pipe_clk_register() as a generic helper and reduce
> > > > phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> > > > qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> > > > mapping and pipe-clock setup that will be shared between sub-PHY instances,
> > > > with pipe clock names parameterised per instance.
> > > > 
> > > > This is a preparatory step before adding multi-PHY support. No functional
> > > > change for existing platforms.
> > > > 
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
> > > >  1 file changed, 44 insertions(+), 32 deletions(-)
> > > 
> > > I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
> > > end up having too many single-platform, single-device specifics which
> > > don't apply to other platforms.
> > > 
> > 
> > I don't think that's really needed. This shared PHY concept is going to be
> > applicable to upcoming SoCs as well. And moreover, the split won't be clean
> > either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
> > driver and may only end up keeping very minimal code in
> > 'phy-qcom-qmp-pcie-glymur'.
> 
> Then splitting makes even more sense. Let's not clutter the existing
> driver with too many conditions and options.
> 
> > 
> > If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
> > move the SoC specific 'cfg' structs into a separate file as that's what
> > occupying majority of the space.
> 
> No, it's really the 'shared' part.
>

To confirm, are you okay with some code duplication between the new
Glymur-specific driver and phy-qcom-qmp-pcie driver.

- Qiang Yu
> > 
> > - Mani
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்
> > 
> > -- 
> > linux-phy mailing list
> > linux-phy@lists.infradead.org
> > https://lists.infradead.org/mailman/listinfo/linux-phy
> 
> -- 
> With best wishes
> Dmitry
