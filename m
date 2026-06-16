Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547627707
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569497; cv=none; b=M6PpaQHBflaFxkmeDUJ7Vg7x7iKi04OFyzOaUp89t/BidRea+nY9ZSdy8MtCKtAyjHTdg/V99l6vx2j+JKSr6eTsyGImEJmXnZI6HGnNjlWzw9JjEkFbeMY1ZTAACKyVsvu22CnSBay3+SQtl89xq+FgpepnbvbcXzEL5Iq2mTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569497; c=relaxed/simple;
	bh=T/GAyTv+L7H8Foempyrb99XqxeTHKgF0+hJQyA//VUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djz1eUtWOiSpVWKsrO1gGsPp27Kp8P9wukedBRuPOXFZ04t4TrBUq1I5hLf8eNbL64rvTIAlzVlK1t5lZ+CdElPP1JjlzVsUhv4BPGhkHCCVXLE5JNGWpNfPXsHdJOus3GWQ9tIxpVCx8BJjrfzaKGnLF1bzq0YJnOBBDZu8mps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXew5V8D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIp3mpLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXew5V8D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIp3mpLZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0O06Q1584959
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2392gTfYaa/VkERgW+pSEbPnUObjwEuQbYRR5es+xjo=; b=hXew5V8DhYf+lndv
	z1mkdigZ1WnM24uptbXxOrBG74gSVaK+mUlB6RTaGpNX0GtgYDiMZWgj4H2EXatu
	clN04aNJAqePu/G3t/8QIqM7BrtvgofdKYI4/CKA2VnPr3ocyFJPpmryhhOUYl97
	iGTJAG+pr8ZcMq9TdpXcfwE6P+RUgHOZonS8bBiR1MlvwMBgSpJpyHZlRIIKpu4n
	dICtfe2jxRsDIkCWd5Om+aJHhJ3AmQ1oODGnV5+3C1qokRAQalBnZ7l1IfwZfXd8
	E9jhaa+j0rkTdhhmMXt1Pv3E0ZlrV4RxW6djhQ5+iil/TdCG/njFWHq1H09z04q4
	N1Kk8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0kspw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:24:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91578c374easo694175985a.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569489; x=1782174289; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2392gTfYaa/VkERgW+pSEbPnUObjwEuQbYRR5es+xjo=;
        b=EIp3mpLZ1n6DCnG0a6qabPpp/+mtDclMeI6rPf12aDlNErMlS3nICAp0UiELf4gz2s
         zxcxpMBlXsaRJRskaQ2NtMLU560MOLtSGzrlGFTGpLpSgpxjKeWTgRqdSuZPzzIq5TKG
         0PzJJmyJYTLOG40NWtnc29fLk0dAoch2FRjNHI7SswIC2jwn5s40OoIZophKUe/2ogmT
         Ce98W51K/sUg0cFm57jSBT5EsYS3vZ2L7Em3BXMWzKuXUdwoRc8WcSLbKotVZUMMGSw7
         ynFk9Tp/t1lFO0ripsnum8uEK2InDE8cKSFKnYmCGpVqKGk3GgJk/ja2u+0SET3lG/WA
         2/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569489; x=1782174289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2392gTfYaa/VkERgW+pSEbPnUObjwEuQbYRR5es+xjo=;
        b=Q6H3nEiMOr+xucOnl1HtnyzF44zB0KBB0WQVUTiS4zXd5jScKxU6G/jQgjZzWYs1mQ
         rMEZinY9JvT8jFhhsJtrQAkO1Q5ZsEbjKOYZCJbY3DqAGhTjmjDZ2K/A+WGca+0w0DRP
         5m1kMtgD3iJXCjYc+aHcjewTUydn6ZXklsb9mxwUAMAG/mWnUXA1O+HD44xTW+K+ROPY
         te58xaF8W8q+fgztJK9u/AHJ3iuCrhSpsnzLMmncwJ9bS1WlE3vVV3m2YkjIvdHoZm4t
         bc5tlxCvz0ix4zKDZewjyDIWIPAUmeiFaoLWI5BawF1KW9zmyItubdpIQ4VbTNOsh/Zc
         Iz6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8JIFaa5aMFwsWZi3hj+o24/cCkLS5X17u1GM4rbcSCkl/i6GWO8I+0tMawFcoCtbPirQEYksyN5dmK@vger.kernel.org
X-Gm-Message-State: AOJu0YwjQ4Gg4KCfpjBMcMK86Cbna7j4XCVovVMDtHGIdf0lHx55UKk2
	ZGjLunlEO+9INqgKXATOEHr/XrSboiGq/WxuPBYh5mhrpjgiJVMvhJmZN2e0pEaznfvth8Y3FaP
	4L1NVN/7YgXh7wbHZds3BQppJVBI/SSfPCU3l1gsHjSPzTU12jK8ts6LRniVWG/jsGb4bCSXk
X-Gm-Gg: Acq92OHXw0BkmiPWkdE3Lm5uldyg2TxUDLHL0z+sDY4C55lv2r8qVpyfiY8n56+8gw3
	MC2OtqoXoQgs10yQugd8lTYfF2jtAxXicV5cx9mrftY/NnJ7txWoM69Gu5GEjIC7tZ2K0RBysQG
	zfK1rkFLpOHveQkDPioMfqzYIOvo0Can8TLYM95zFFaJst2G6dS4b6D1abZZ7aApBNPtYIK6AgS
	0QqbtLgbcjkGZxTe/S9Yzrc6UpRrTN+dtY4N0G/qu5gZ4NkUiaQVq/MvsNOOzFpamgwG5cdIwJQ
	42+SQ6g0FhCPinnw7ZpqrFlbPsj89xV6pYWzz21GSuAFllPHlXC80tLg7jvnvahSZRv4b13ht+U
	GamdWLbzO2+4SdDMvFi21WH5AVOqhqxUupdDBWOvwMT9hrdUKA3yWqN79OWwtjiQOpIs5iN3mtP
	tjyMNMe/kE9OB4bXb9lVaXU/4Nxe+1ePC7hmo=
X-Received: by 2002:a05:620a:460d:b0:915:cda5:27fb with SMTP id af79cd13be357-917f30f86b7mr2234740085a.54.1781569489022;
        Mon, 15 Jun 2026 17:24:49 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:915:cda5:27fb with SMTP id af79cd13be357-917f30f86b7mr2234735585a.54.1781569488527;
        Mon, 15 Jun 2026 17:24:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a6fd9sm3097412e87.46.2026.06.15.17.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:24:45 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:24:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: github.com@herrie.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
Message-ID: <3vmdu5t4342pyx6etdtzu3wapvwncvue5nsg3q7jx3epnkq6gu@5dwpfn6egkqe>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
 <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
 <66905f4914dc022629158ac02df1c7df@herrie.org>
 <46lrfwoahgzoudq3afnhv4kxqs4fwj3w7u2dnx6ns6soo6pxt2@qkqbelan2iwq>
 <0f6ea4d2-3865-492e-ac6b-b008843f8d56@oss.qualcomm.com>
 <tknuizddyhfcyywmm36v4ok6idgpxridgur5qbowvmwhcbve5o@bp3z46gsfvlk>
 <0298e09a5b4497910c226269daa2586b@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0298e09a5b4497910c226269daa2586b@herrie.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX2aL1qx4eRW0n
 fddZ8Dm1pkUCVBN21WcpPEyA2/92Z9mcz9v8ugNc0Qa0mG+w3Z6gwVougGc7GXdDnV0tdYOlbR1
 /AtO/xBF36NGco4rQw0Jol/WC4dsQBc=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a3097d2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=cTwmTnRGAAAA:8
 a=7tWiRPGIeWnQM0iYfUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfXwBN/ZIVcqINk
 +d0QclvV6XvAj+8P3SDz+eIwJp6g1r3e3IQOI+XVms5rx9/a+FygLxWnKsBLtnr7UEU1UTzPkeb
 E7DMuv20kAUdZBG0AP6c5cRx0Bh1zc3Cd+P6coxJHJqPz2vqAPG1mAcghvG2PzzSVc9Lc84n4Qg
 nkr3LiLq6NVbN7ZQyvjjpjgYcP8Qha6MSP6zkDu+Oj0LeB+dvPaixm0lFNBFlrUxYyB198dKayX
 UJ54ju3gPLFp4JcwN25GKjIP5eWPPuvep0KDNmXuiemyOsR6WE4Zn419mtw745BOVmoyyeG3zUo
 Y99vF7ruq5US5Gy5HY6QllV/UhIALwEzBUOd761Y6w34npiS8BvCoF4Puu1oXfhueMZghE6O6To
 KwXyZche07MIScBR2YhI4XT2HSB1CsY0cGz1sH9/VXEg7wgKiWQxpk4EXzBj3ld7FlgWwdMXuhS
 vsE2k+j05btDwRjTUHw==
X-Proofpoint-GUID: Mivhout4WoVetEAfTqQeJKeglHgyfs47
X-Proofpoint-ORIG-GUID: Mivhout4WoVetEAfTqQeJKeglHgyfs47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160002

On Mon, Jun 15, 2026 at 02:17:08PM +0200, me@herrie.org wrote:
> On 2026-06-12 02:25, Dmitry Baryshkov wrote:
> > On Thu, Jun 11, 2026 at 12:39:45PM +0200, Konrad Dybcio wrote:
> > > On 6/4/26 1:02 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Jun 03, 2026 at 06:09:18PM +0200, me@herrie.org wrote:
> > > >> On 2026-06-03 15:57, Dmitry Baryshkov wrote:
> > > >>> On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
> > > >>>> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
> > > >>>> (address, value) pairs that are written after PHY reset.
> > > >>>>
> > > >>>> Unlike the existing "qcom,init-seq" property, the address field is
> > > >>>> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
> > > >>>> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
> > > >>>> class hardware needs this range to programme pre-emphasis, HS driver
> > > >>>> slope and CDR auto-reset bits the legacy msm_otg driver used to set
> > > >>>> via platform data.
> > > >>>
> > > >>> Are those register writes specific to the device or to the whole
> > > >>> platform? In the latter case please extend the driver to write them.
> > > >>
> > > >> Looking at every MSM8x60 reference kernel I could find (Qualcomm's own
> > > >> msm8x60 board, HP TouchPad / APQ8060, and some HTC/Saumsung MSM8660
> > > >> devices), the writes split into two groups:
> > > >>
> > > >> Platform-level (same across all MSM8x60 hardware):
> > > >>  - reg 0x36 bits 1+2: CDR auto-reset disabled, SE1 gating disabled
> > > >>  - reg 0x32 bits [5:4]: pre-emphasis at 20%
> > > >>
> > > >> Board-specific:
> > > >>  - reg 0x32 bits [3:0]: HS driver slope — HP TouchPad uses 5, HTC
> > > >>    devices use 1. This clearly depends on board layout (trace length,
> > > >>    connector loading, etc.).
> > > >>
> > > >> So the platform-level writes should move unconditionally into the driver
> > > >> behind a match-data flag for the MSM8x60-class compatible, and only the
> > > >> HS driver slope value belongs in DT.
> > > >
> > > > Looks like it. Please hardcode the value for your platform in the driver
> > > > (with the comment), meanwhile we can try looking up the actual values.
> > > 
> > > Do we have the values for a MTP/QRD (or whatever they used to be
> > > called
> > > back then..), like we would usually put in there?
> > 
> > As far as I can understand msm-3.0 and msm-3.4 most of the boards were
> > writing 0 here (although it might have been unexpected). None of the
> > board files set the hsdrvslope value (which means 0).
> > 
> > Please correct me if I'm wrong. I see that for tenderloin kernels change
> > that to 0x5, but I can't find a sensible commit message.
> > 
> > I could not find the documentation for vendor ULPI registers for those
> > chips, so I don't think we can identify, how to make sense of those
> > values. In such a case and having different board-specific values, we
> > don't have a better option than having a qcom,hsdrvslope (or similarly
> > named) property in DT.
> Dmitry/Konrad,
> 
> The bit-level meaning *is* documented byte-for-byte across
> every MSM8x60 downstream tree I could find: Code Aurora is the
> canonical source:
> 
>     arch/arm/mach-msm/include/mach/msm_hsusb_hw.h
> 
>     #define ULPI_CONFIG_REG3        0x32
>     #define ULPI_DIGOUT_CTRL        0x36          /* on MSM7x30 / MSM8x60 */
>     #define ULPI_CDR_AUTORESET      (1 << 1)
>     #define ULPI_SE1_GATE           (1 << 2)
>     #define ULPI_PRE_EMPHASIS_MASK  (3 << 4)
>     #define ULPI_HSDRVSLOPE_MASK    (0x0F)
> 
>   reg 0x32 [5:4]: pre-emphasis level (00 disabled, 11 = 20%, 10 = 10%)
>   reg 0x32 [3:0]: HS driver slope
>   reg 0x36 bit 1: CDR auto-reset enable
>   reg 0x36 bit 2: SE1 gating enable
> 
> The legacy `msm72k_otg.c` semantics for the 0x36 bits are inverted:
> setting the bit disables the function (see set_cdr_auto_reset() and
> set_se1_gating()).  Every MSM8x60 reference board sets both bits,
> i.e. CDR auto-reset disabled + SE1 gating disabled.
> 
> Surveying every MSM8x60-class board file I can reach: Qualcomm's own
> reference, Samsung, Sony, HTC, and HP: the platform-level values
> are unanimous:
> 
>   pre-emphasis     = 20%
>   CDR auto-reset   = disabled
>   SE1 gating       = disabled
> 
> |  Vendor / board                                 | hsdrvslope |
> |  -----------------------------------------------|------------|
> |  Qualcomm reference (SURF / FFA / Fluid /       |            |
> |    Dragon / Fusion -- board-msm8x60.c)          | unset (0)  |
> |  Samsung Galaxy S2 family (Q1 / Celox / Dali /  |            |
> |    generic 8x60 MTP)                            | unset (0)  |
> |  Sony MSM8660 (sony-kernel-msm8660)             | unset (0)  |
> |  HTC MSM8660 (shooter / holiday / pyramid /     |            |
> |    doubleshot / shooter_u / ruby)               | 1          |
> |  HP TouchPad (board-tenderloin.c)               | 5          |
> 
> So Qualcomm's own MTP, the closest thing to a reference platform we
> have, leaves hsdrvslope at the silicon default (0).  Two OEMs (HTC,
> HP) override it to non-zero values that match their board layout.
> Neither override has a commit message. HTC's value is buried in an
> init_seq array, HP's appears as `.hsdrvslope = 0x05` in
> board-tenderloin.c with no comment.  I've kept TouchPad's 5 because
> that's the value the device shipped with and our HS link is happy
> with it; changing it risks regressing eye margin on the silicon we
> still have to test against.
> 
> So the plan is exactly what you both already converged on:
> 
>   1. Drop qcom,vendor-init-seq from the binding (this patch goes away
>      entirely).
>   2. In the driver, hardcode the three platform-level writes behind
>      the qcom,usb-hs-phy-msm8660 compatible match-data, with a
>      comment citing msm_hsusb_hw.h as the source for the bit names.
>   3. Add a single qcom,hs-drv-slope property (u8, 0..15) for the
>      board-varying value.  TouchPad DT sets 5.  Absent â‡’ leave silicon
>      default in place, matching Qualcomm/Samsung/Sony reference
>      behaviour.
> 
> I'll send the new v in that shape: single dt-bindings patch
> (qcom,hs-drv-slope) plus the driver patch that hardcodes the platform
> writes and consumes the new property.

Sounds good. Please explain in the commit messages that you can't decode
how the values correspond to the actual slope values (I couldn't find
corresponding doc inside Qualcomm).

-- 
With best wishes
Dmitry
