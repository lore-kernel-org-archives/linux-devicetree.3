Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC613440A0B
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623876; cv=none; b=UBVdoM+YjWM5hg34jHaX8lBJlfjZSuwrYThuhzHvuToETMBSjOdZlFEW8jdw+kd987Oop096rmEwe4HU3Mawj7rUXtcB6Un4wEsaS+FtSr2oJj7oNQSzqKJVQ3QEJc1POq9r+fY2g4Dx/hXM5RHGUeQQuj9gk3AdNckmMGu2Q4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623876; c=relaxed/simple;
	bh=r1lXpgScD7Uj6wGBac1+WChoSNoCqjdK3eocGD3WAGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gog60O4YYacM6XqKeBdVFvFkjixdWqjwUh+4K1kHQRC30zb5sIchS8Gn/c8c/h6vPuJOm72+MCXeKwjQiTMWhNJaFrV3LaOXCiesg9Ony/vtJbI98PRYb76QpiQ9jLZ6YiMKRAycjkdVJvmYzwxweZci9rzHdBq1pcDSofNV/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIKk9pXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=inHoac9x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIKk9pXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="inHoac9x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCL8pp1519925
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=70a5V58Oxb9EFDWPI7wl3gNe
	YE++PkOpB2yu4Gco1CM=; b=fIKk9pXCRSfzTQ4grazh2SeTE8+pxslz7L/Rb+Mn
	1Q6XTvd0VerTIPjs2oVnwoYq7zt29nbNIUIsr7eC062SXW4Sfiw9o+CzhaypdLBQ
	ggE7TX8egPFIYeRbZN8rxvcD691i5yez3ccZEwrQrO1FhNXntTFDVDJ18JCm8Yk9
	WDp7BtjhgUYq8FLfjxMP+uGV4ldX+U+qclgSFMdZbgN4wEOQYPvu8w9LZY8fwFcJ
	4KCV3SR+oLG/EVTcTvlffpizXHbTAMmDN5XH42MPKR8VSOJ6g8bMDzDllfXeK7IK
	4cRbVQ1Iv1o3YVamJPtOUnCMGz1KQR/e6Px4/rGLsplOiQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xsk3hwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:24:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc5faecf01so44475245ad.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786623873; x=1787228673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=70a5V58Oxb9EFDWPI7wl3gNeYE++PkOpB2yu4Gco1CM=;
        b=inHoac9xRenWaqKlzRADOKqtjzHG0TC9Pqz2u/KBxXpSoNzN+3ryEp9pDL/bOitSug
         tDCISBWVgSurjS6Ol/JwzfR4ylevffBQx4f5O41a5pxrUCTx+6pLyYl+8uTkxUfI0ma4
         BV69jILrH0K34XFVEbM87lSMjD9duWt835vKR5DApJJ4I3Cgo//0o/04yr7VTLFo+UeM
         We2f+NO3lLImJLec9J5q1WPGZNQ5vpb7oloGViYhj33/XM5q/X+vtjpvqLt3vcfJVxF3
         fzDwAsZ75SHRxUPVnSBT/rDqQJ+3WffuiJAzAQDh5EJswFYId3cGk6V/CZCVBKsoTYU5
         DNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786623873; x=1787228673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70a5V58Oxb9EFDWPI7wl3gNeYE++PkOpB2yu4Gco1CM=;
        b=ldKXE5FpUmny4ku4s7Cy6WKs5vQTCjgdCVdas07ebSPvcZb6oglPqyvcPdT76eJh/z
         4BGVaL0a0/RBmINOLnOm4TCT9RQ/gv4obmHeqRIEx4YboH3syUgfVQT9n3dMk6AZBo6k
         swWko09XufjMzynQ66boJqRzxscSiZNdiiGsJLNirTpj2n+ETyxaSWSbvVht3avA7E5v
         raMnqwRY8a6A5JbwMCNBkJrMwXk4PKgy0fHid2Ezw1TTI7qg6XxQQzy3Y70wyJgUj6+6
         73Odkv2pEnD4JvfPs15Lcn8LkQQ2qUsQFrOBp07lS5/dT6UFlkY5JrJmrEvfkDbQGdCx
         itAQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7x2x9v0FqwDM03HyA1LatQ9jo4gjkN2TSoIJyrLdP/7v6iD/AeAK6JuSMSOAyHdOXdElLRTJSOVzt@vger.kernel.org
X-Gm-Message-State: AOJu0YwcverpsvP0/VfdyKSFlJS/Vl50uIURsjNDgokbmlSrCQxj1OdL
	xgCtURRCfJZMb4fhDqANcAukumbt7LQkNSlO9qCl+sovW+e1xH7L1ZQxBa18KJndaxJi05yc7dZ
	JKduk3wol+WAuhom/P1ZnvuFNEImjq2XkNFHkkU+oMpxXTRVgy5bcUDyIYYUueVYJrpQv2AYX
X-Gm-Gg: AR+sD11ws1CQDqLISjNFsTM0Mn0rOO3UQXmWqaIRaVtZ7kroUGkrbnByU5gZtbvNSjF
	ukMncyIKcQBnJ+atKxX/kZcGdb8V9MsNzM2hopBrokCXyzocyWb3HeA0thP2mUExDBsR+IMyXb8
	vKTFFPG3ngSpavACCSWCxExYy+/NsWiEizU66dUAB3NifLcVhh+eryK1jt6epI5pFxqy3UcRN+r
	4UL0P6YqU6MmVihx3DXGEXpDDnA6v7bgBqRv1CySVkcZSL82bmHJEPIqEtoiw5n4WvdxBsrvaBK
	DxGBb1R7Vlw1/t6C+OLOcrmMHSGxvMHIiyd7UD3DSrH0H7yvn9k9+6oebfdo0HEOquQGk2D9vvh
	s2qE26gg9BJTC8T2xGfhlbZC8O59bZf/n
X-Received: by 2002:a17:903:32c5:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2d37d57a589mr58465005ad.8.1786623872418;
        Thu, 13 Aug 2026 05:24:32 -0700 (PDT)
X-Received: by 2002:a17:903:32c5:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2d37d57a589mr58464085ad.8.1786623871842;
        Thu, 13 Aug 2026 05:24:31 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c49cc32sm8602385ad.63.2026.08.13.05.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 05:24:31 -0700 (PDT)
Date: Thu, 13 Aug 2026 17:54:25 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <an23eZWmtDVbfWEG@hu-anantiwa-hyd.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
 <eblai4d6apohd43uvo4kbm3y6yfkso7rd643ijra2awyguve5l@j7aq2vzzwmj2>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eblai4d6apohd43uvo4kbm3y6yfkso7rd643ijra2awyguve5l@j7aq2vzzwmj2>
X-Proofpoint-GUID: EcQBlM4JWiV-1nHZgItthNfDlpwYDujV
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a7db781 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=6pqXqY8CpGGeIA0puCUA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA4NyBTYWx0ZWRfXwn7d9r5lJ+2h
 LSbFe1fc7KXI6c0tPduzIGc/FNxJirNmQRRNmdRyOEL4jYQhvSMfeiQHERtzIDcC+oPHE8JxdQ1
 yMs2SIVDLVnnl2MSnxfkYdzzPMJ5bkc=
X-Proofpoint-ORIG-GUID: EcQBlM4JWiV-1nHZgItthNfDlpwYDujV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA4NyBTYWx0ZWRfX3PalsGzENcTm
 anBOyBlejTjJWA7mRc3TKFqGN5G6xwHfVwvbfPdrb96+nxuiD63cfzWolj3N4gsFWEUFw/Nkzoq
 ky8e5Pz1gl0wK9jxWlG3FB7aEMqugNvcTUqaTEtB62idkc4lB1BxWaodssd9TdYflSdIHugpGNo
 AjJtfPr885GXiVjE1HMF/ppO5+Xk4vDOyzeu9y347xeWj6G/puVxoV6pFntElV6xmQg4PO+fw/i
 PJfwMleRdi63gxaOk9NRLvCeGahSQ6d77NBRfpqJqmQpNA6puG0G3KReY4zyft4xYTzXXehVZXS
 83wAE8TzigcPAAG0H2stP7mshJF04IkghsYOcryY3tpzzEY9o3w+9MbeCz7jAGTddJtTdkMlroR
 YawQ791aJLZHUexqJQ7ZbyM0ZCCulhWRbCKJZx5LEhBagGcVAQSz6sY94R4lNV6t8EwuIiWTuy/
 WXGQQv9IuuDJwFO8OOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130087

On Mon, Aug 10, 2026 at 12:04:21PM +0300, Dmitry Baryshkov wrote:
> On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> > On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > > variants and provide a composite DTB for headed variants.
> > > 
> > > To quote:
> > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > 
> > > """
> > > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > > lines of a new feature, there must be an underlying problem that
> > > motivated you to do this work. Convince the reviewer that there is a
> > > problem worth fixing and that it makes sense for them to read past the
> > > first paragraph.
> > > """
> > > 
> > > In fact, I'm not even able to guess what the problem you're fixing here.
> > > 
> > > Regards,
> > > Bjorn
> > >
> > 
> > The problem is that the base device trees currently describe the eDP
> > display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> > are also available in headless variants without an eDP panel.
> > 
> > With current base DTBs, headless variants are not stable where eDP panel is not
> > physically connected with board and userspace is trying to use it.
> 
> Please define "are not stable"

I did not see any crash in this case but in the absence of physical panel 
logs are flooded with errors, userspace is trying to commit the frames 
since connector status is always connected:

"
[   23.499621] panel-simple-dp-aux aux-aea0000.displayport-controller: Prepare 
timeout after 5 tries
[   23.508763] panel-simple-dp-aux aux-aea0000.displayport-controller: 
Couldn't power on panel to ID it; using conservative timings: -110
[   52.143157] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for 
commit done returned -110
[   52.175662] [drm:dpu_encoder_frame_done_timeout:2733] [dpu error]enc40 
frame done timeout
[   55.351084] [drm:dpu_encoder_helper_report_irq_timeout [msm]] *ERROR* 
irq timeout id=40, intf_mode=INTF_MODE_VIDEO intf=5 wb=-1, pp=0, intr=0
"
 
Another issue On Ubuntu with Gnome Desktop is:
Display's connected with other DP ports are only showing backlight since 
login UI picked eDP panel connector which is not physically connected.

> 
> > This series fixes the inaccurate hardware description by keeping the
> > base DTBs limited to hardware common to both variants and moving the
> > eDP-specific nodes into separate overlays. The base DTB can therefore
> > be used for headless variants, while the overlay is selected for
> > headed variants.
> 
> -- 
> With best wishes
> Dmitry
