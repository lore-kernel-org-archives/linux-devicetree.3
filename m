Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1472825C80E
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613186; cv=none; b=uW8N6iynAU8R6k6CzlGFOdVhfkpThd6uPMqwn0yxM/7WBDvHa0cU1RB4BAE+GHRAG/lRPRoicKkIZaxx+NsN9L9VUyeoZSv8pQ+jjM5gGQhJ7lOE0ot1Kyn54xuHzjjuV/cMTW6E3S+CxikWSCEF/iAwt+NOU/ZuxKCdcp+P80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613186; c=relaxed/simple;
	bh=LC2MPRRKKi7YG3GvDn89rbcy8u/XG56ENIpxJdMr+mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7c4/kifIiKJ6fqlwTT4O4Zd1pK843lI9whduhzPtH1cE3zI7szPv8VpAqhqfBogfIzJP8DMf9Jbyy6Av0PPn30+NmOegG/fJleY6RXiajhc4Y0abW5dVprUbHyv+e+q17katursoY0rgjBavjwkHzalMpEHTLQOoyteF6tK7kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYIvM3MG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcS2Ssnl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYIvM3MG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcS2Ssnl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9GAf2893556
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uc7tBpluxfzaCIfWGvGu3mOj
	RdTPF+6lM7MM7zDtwag=; b=UYIvM3MGzNeen4q3DuuKHwU2zX/lU5rC4XwiSs01
	duIvyBgbad54lT6hxzWN/0HDwoISgADaphMQB4LrdcqSMA9AHwv9ALYY8oLOUk+4
	e08CLuPr+0mjPkICJ7mOU3gq7eBsDuEwIdZO6HajK6TRJP2HI+bXCfvmfD3Db1bp
	m7nSMt8FFY9PgJPgkx+D7jPlRMmVRQ9kpXGSHd+PUGEk70yEbxXahEJwJdjxXykp
	1wjG3eOCFmLdx9MnU+yh/V4RlYgz9boAkiX3R72tw/F3tkWkN54e+Z3W5jNTfLo1
	BjaoQGO01qnQNspCw46S7ec8vYNY6Q6fNi7vhLYlYYnBSA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253h7r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:33:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240683a82so3417088b3a.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781613184; x=1782217984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uc7tBpluxfzaCIfWGvGu3mOjRdTPF+6lM7MM7zDtwag=;
        b=RcS2SsnlZLmIJl8iYfUw+AVDLDLr7+cF896wRZP2P/hjVb5mCGeklXtd42BfgnMcDf
         uVAceFZjob/8h2hYcbubnelsMp1AEjNVUO4LVdsUukANt4cV/0FC6ZJNwQA1zKlOSLtl
         ayC2rjpHjGWhKQOfZsOnXg21q8YSTu8aSswOB6cCjWKIVteCWBgfEc8skDR9o/8wqKaL
         VDvwxW+fPZZOi8S4EOeLJ3pPtE9B6P1bVznW9GoG4lT2trO/5Cx0uK6sTkM5kgISqi+3
         tF2LtwGbZjMW7f4GFYJsfxdDz29S3iKYMGk94G92y1WGABYdEmsDRMRBPcTqpT8E0adH
         5VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613184; x=1782217984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc7tBpluxfzaCIfWGvGu3mOjRdTPF+6lM7MM7zDtwag=;
        b=EHge9TzvCoKe7SQ0EqSoXr9rDyuCht403tzkOn0O5FFBJU4n51tcvD0SFeGAgNIAg7
         I9z5z5I1nKz6nT7HNmbyECJN08EOQTcyuyCtpBmlPHAzJEK3W+j2wpHpEhMfumYMNNNa
         TVNVMVgPJssq6s6Vh1JmzduSp9/FCakHhP4lGfCdNR8Yi5rEeqGNFB5Izv7eK4O26w7X
         6qKfclhMCOvHUpzucuiMjEXBSqT8Q/+zaDjhhgIpacSiBj5l53ZJx0Hzl7XTvtg/qgiR
         Q2Mv/CaKFwSRhTSgHDoYfjgOvS1XnmkOoFqPZGw5lDqj28b8vIzsp7yLwRopapKz450I
         r3Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+aGYxjq87S6EEl1vWm8EufnQk1zlj6RfVg7pACgqUT3sWziXGnBdgjdn9mHBAUwdmiAuotrbs2nvNd@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYewoBZtYmQnFHHThbs49AQ+mJatQXV3jDe1KgkUzYtgRREIR
	YOY65zz+NGVQZe/Kz5Od1JRR2djmQlSkmeYOH06vFOAokqvPYYgWbS185X/rvt6e6BjzJThu3zX
	+Yg6BXSWesgQ0phvC6cs3evWuST6Wgacx9qYKzn0V+qgt18n2bwuJLW8b8j1LXnSM
X-Gm-Gg: Acq92OGvI2TOJmMSVZXlLB8MIhPoc+f3do10ybYlCmcWDKeJt2vBuF7CPlJ1jaz5m3A
	O8/2+saCyP7/I4kiU4rPAEPnxqHAqggdoo3AyzRicMny63gDKRQvEIQefDOnTQwR1JaitwxtR8M
	98nX0QsIqF8QkmYlpT+n5zB2kHJcU/GNjwz+1QIiqoNP/nD+WhdV4MC2thLGD+XorDa1o9yZnQ2
	wlbpFCC0Y16CSWHBDnCACpINI21yjyHebz2RAmZ5oEvhxVRhAymjU5tFkf+EDIbC2OqA6dkDayX
	dcaHeKvhYsObYUP233ReBUlx3t3bQSyiYw+OudiJDNhQym91YKFfRrkc6PlzS/9fK4uuWRVfZkd
	wRlTzZGAoylVGFw3viT3ux4TeWlE4Pgtx5Hm6EoT546tbbID+dzPiTI3i
X-Received: by 2002:a05:6a00:2d05:b0:835:3861:812c with SMTP id d2e1a72fcca58-84513f23f6fmr2896387b3a.23.1781613183538;
        Tue, 16 Jun 2026 05:33:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d05:b0:835:3861:812c with SMTP id d2e1a72fcca58-84513f23f6fmr2896365b3a.23.1781613183019;
        Tue, 16 Jun 2026 05:33:03 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm15663212b3a.57.2026.06.16.05.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:33:02 -0700 (PDT)
Date: Tue, 16 Jun 2026 18:02:56 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 0/3] arm64: dts: qcom: monaco: Enable SDHCI storage
 support
Message-ID: <ajFCeCEsNbkcGKo9@hu-mchunara-hyd.qualcomm.com>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <ltuoonopd2fmxhxnfmezflwqicyagha3jchxl3inputbtnpvhm@gsgnsccr62pk>
 <aaWgo/FYDhCVvaX/@hu-mchunara-hyd.qualcomm.com>
 <3insznroqfkpgdspe4wj3nrxgp4igeoyawr5udscpfi66m4kmc@brssmf6olu6g>
 <aaWnIrIMDgXAY7jo@hu-mchunara-hyd.qualcomm.com>
 <4gg2xq7mdx7bni2acicavtq3ogwupe4ok6tehh7rmjarldwb3x@j3cgohnd764i>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4gg2xq7mdx7bni2acicavtq3ogwupe4ok6tehh7rmjarldwb3x@j3cgohnd764i>
X-Proofpoint-GUID: aC6Om7JanJJ32oZ5w-dSwkC10EnnewwM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX4yFxfHEu6xgz
 LNIGT1bIS6eBdyIpnvkmT87+j5UxdMcxgLu1IGjXvYoZOTxCrJ5TRbx4yz4hRZ7Ddaz0GGlqtAi
 XAj5xLAozshrIpsiST4d7mGDdERlGG0=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a314280 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=T0vSrIAX6HVucII9xVQA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX5N1GogI0Gxaf
 Cgm7WxY0yObTN/bpD+175azS33GVLcuep3Ei1LyVsFIk/BE6fNkSwipBrfPq6IS5loi/DA4RtTF
 7ohcH/40Xto8U9cDDfZaH5xMGkgVMu6PPvVAJ1oJi1UHa3RG9WJZW7jr8MEdPALLp1YvDmCGBeM
 EUqx0FOwcGkBmbXnP40Sxbhzi07H5SoBI6hIftKF3U0Cmh59FWsGtfxoiIqdvQx/sA2yEVVnSpi
 Su46hYj8fM5YpMm91CKc/rc4LLr84RKdbv2vZtvI/3+s+bqFTbCPiuK9oUyeJf5pdf1yIA7X5vv
 Uk1SzaAyG1MWs097rZcOwGCH88n4WO0qdIK+Gchpnde6YuvmGEDJ8TYAqfQoYMxoaIOfNv8Eyai
 pN0lnCHwr0rZmBiJibtG+0sIHmm9PSpI5K5JzKiJiqrcC8AGj+GS1A1UHMxMNxU/WWASjqsJToH
 xrSydZJ6RcKUuCGeb9w==
X-Proofpoint-ORIG-GUID: aC6Om7JanJJ32oZ5w-dSwkC10EnnewwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160127

On Thu, Mar 05, 2026 at 06:51:09AM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 08:35:06PM +0530, Monish Chunara wrote:
> > On Mon, Mar 02, 2026 at 04:47:41PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Mar 02, 2026 at 08:07:23PM +0530, Monish Chunara wrote:
> > > > On Fri, Feb 27, 2026 at 10:05:32PM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, Feb 27, 2026 at 04:20:52PM +0530, Monish Chunara wrote:
> > > > > > This series enables SDHCI storage support for both SD Card and eMMC on the
> > > > > > Qualcomm Monaco EVK platform.
> > > > > > 
> > > > > > The Monaco SoC shares the SDHCI controller between SD Card and eMMC use
> > > > > > cases. Previously, the common SoC dtsi unconditionally enabled the
> > > > > > 'supports-cqe' property. This causes regression for SD cards, resulting
> > > > > > in timeouts and initialization failures during the probe sequence, as
> > > > > > the driver attempts to enable Command Queueing (CQE) logic incompatible
> > > > > > with the SD protocol.
> > > > > > 
> > > > > > To resolve this and enable full storage support, this series:
> > > > > > 
> > > > > > 1. Moves the 'supports-cqe' property out of the common SoC dtsi. It is
> > > > > >    now only enabled in the specific eMMC configuration where it is
> > > > > >    supported.
> > > > > > 2. Adds a device tree overlay to enable SD Card support (SDR/DDR modes).
> > > > > > 3. Adds a device tree overlay to enable eMMC support. This configuration
> > > > > >    also explicitly disables the UFS controller to prevent power leakage,
> > > > > >    as the VCC regulator is shared between the UFS and eMMC rails on this
> > > > > >    platform.
> > > > > > 
> > > > > > Validated on Qualcomm Monaco EVK with both SD Card and eMMC modules.
> > > > > > 
> > > > > > Monish Chunara (3):
> > > > > >   arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> > > > > >   arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
> > > > > >   arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
> > > > > 
> > > > > You are adding two overlays. But what does it mean? Does EVK has no uSD
> > > > > / eMMC at all, having both attachable via some kind of mezzanine? Is one
> > > > > of them attachable? Or are both cases present onboard with the correct
> > > > > one being selected by the DIP switch?
> > > > > 
> > > > 
> > > > The monaco EVK has both storage devices present onboard and the desired one is
> > > > selected via a DIP switch. The overlay selection logic would be based on a
> > > > fitImage metadata entry that gets populated at UEFI level by determining the
> > > > currently selected storage device (eMMC/SD) on the device.
> > > > 
> > > > Hence, this approach becomes robust to enable the user for using either of the
> > > > two mediums, without any additional requirement of reflashing any images.
> > > 
> > > You are answering a different question :-)
> > > 
> > > Let me formulate my question as a review comment:
> > > - identify the default DIP switch position
> > > - squash corresponding dtso into the dts
> > > - leave only the default dts and non-default dtso to be applied by UEFI
> > >   if necessary.
> > > 
> > 
> > Thanks for clarifying. 
> > 
> > Default switch position is on eMMC on Monaco EVK. But as mentioned in the other
> > thread, there are a few boolean (flag) properties like 'no-sd', that conflicts
> > with SD card use case and cannot be deleted in an overlay file as
> > /delete-property/ cannot be used. Also cd-gpio and regulators used for SD card
> > would be redundant for eMMC.
> > 
> > And similarly 'no-mmc' added by default would be inappropriate for eMMC. This
> > being the reason, two separate overlays were added.
> 
> This only means one thing to me: UEFI mechanism needs to be changed from
> applying the dtso into directly modifying the FDT in the DT_FIXUP protocol.
> 
> There are three options which needs to be removed this way:
> - supported-cqe
> - non-removable
> - no-sd
>
As per latest discussions and the approach finalized, will be updated in the V2
series, such that the default scenario is honoured and no-sd-no-emmc case is
also avoided. 

Thanks for the detailed discussion and suggestions.

Thanks and Regards,
Monish 
