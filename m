Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A3B320CD1
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633213; cv=none; b=eiJ5iAV8x2QaAt40ZUi/M1vZW9le4VhTj9xVSDbWDMbCS6+0lQjGod8xfm8AAp9J0EBPJSzXKjGIMfEBsuH4rPzXUshC//ur2OXY82IRurm3pFT56FjBvQ5V4H6MNT86QE7J1PYXXZsBv3jOtaRYKM/spLcnPbUgntcmmbmEXgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633213; c=relaxed/simple;
	bh=y8BFkiFZ1bhHz5V26X8XbwaP6uDK/0hLwpShUEY/OhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJn2MmfN3CDnJtcfSGZJzhzOurdR2Ai5mnXu0E9rvI+2fYa2oE3ZmkjpsofCnN1fylqH9X5a4bGsCPwnZzjfYaG0cNfaDzfrGpxbhX0SsB5W9APsrFu/H2PQ1dCAGHTn1owljhtPj2FTTIFhey12Hs8yxcTR7M6osi8YQwM04VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2AcQIXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3xQ7qGs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2AcQIXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3xQ7qGs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCKFA21955907
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LZobNk5hrLgW88leDUTxSIm0
	cAW4Tyffnz+OKCklrXU=; b=I2AcQIXsgXsJf3tkSEfyStWQrSG7u8v5RysfEJYc
	4NUvVDr3HpUjIK/IK1WwSr/JVNTHxJ1gfslXy2A6CmnH+yP5HtO2PIbLhcrpX3qo
	utwY4WQe+0gNx7D8XCHJ3wQAoYAeN45OpwTFFY0IT4O7bOw4RmqP8DKIxjYeuIiO
	GKUhE8qS5u+0Y18k8eVLuGycdZK3JgHauVnuYs87SEqJMgR9IurXVvjKH3TWQC0F
	9yCukUz5TonoZwYG1oqVTlDDyfy2IECjla5vYQLq16g3a/ickFs+wKJwUBIbc7bZ
	MAnPrLEyLkjogUei7TQqnj61Nb8Ok4zsEKRW3n/XAJbJ6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14syjyqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:00:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso104081cf.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786633204; x=1787238004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZobNk5hrLgW88leDUTxSIm0cAW4Tyffnz+OKCklrXU=;
        b=X3xQ7qGsbW+FkVGVr6BKoZ3vd9RL8OHu920hNP3HmlTPqHvfPqVEy1AlnHzAYT6UlG
         Iuo8qH9Y323qPhOTJiwwYOCj7bPwzVcmDsTrF3CHUNXoXLxFmV0FjzaGnwb5BpndW/hc
         idvuYm5t7iZ4ZC9mgo9Xhc2nsEzJc/KrYTVJegsGUdhGRqkzZurhk2cP5zF2gpbV7czA
         3ARyrVW9sd39bJ0FNyuSWzIz69pVBYBjqHzYsyHg+oN2k+g/ub/ghDprBlhY1ZABGcvk
         QUJF6knqMSkwrtgo8fwI2qeT6Lz+m/CS/sUWlGAgLY2lsxRGzr5PXk17E0YxFd2oavwo
         ZxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633204; x=1787238004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZobNk5hrLgW88leDUTxSIm0cAW4Tyffnz+OKCklrXU=;
        b=c5xEKe/Kn6ksW6bOnFwPF3x1uCWiP6Z56kGf3m4aN/uODs/vQJklM/5X6i4sZ/vG81
         X0L8VDqBJskn8BNdfna+P1y3emcbn7TcjCKb0TaUbQs1YeAuXx3KhJvm7rsgD2BFLOfT
         MHrkpQVv2WcC3B84WiuIHBmYObgtzxSqBOx7+U56j54UaUfeVRU6hpO3zVaSfU99F8SV
         CcUm/pKuv7+cQjYWfSXt6eP7lYPxYWzW372OBWQQ3zpI2oqedErduV4Ai02S//7w8LWQ
         sqcnLCpjjLk4Wl1AE/8364rIV5daTknqaTkaun2Lk+qSSkYRji8VXvtr6XX8PZcPSqJz
         wE0w==
X-Forwarded-Encrypted: i=1; AHgh+Rq8pH26vESHxn4048Z+aF/isWQbAVeakDRgn/7DvdK/PV1/Jns1nflL0uAKTxpDxc3Dh6QuH/+6fgWF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf9JeUoGsjXhXKR2mg1tMkhq8or+bY4YBGRqflyK+x5ybSNgkk
	vZHqFXAGNZndxIPrrVTWghL4LQTrj4jyB8PlwHHrbY7zTOCaO9MetJxGGc+v7yO0TI+0zBKmRgg
	0JTgqYoc5bxoMhQlfshRkC3NWLy5XbUktpQkGKOO8FMacYz8SzaKTkYEIswTJMCJ7
X-Gm-Gg: AR+sD11kyXalexm4dGBahySQVdeIme5TcsZzFKb8muILpzWQLCsJFYz3Fen0bp42472
	as6JJp/vfFrd9zdwNmRWL02RKLYYnd0nQBo7cWpvqcST9OXa5zgPVh3LnC4FZW71dwc9rXyQMt/
	eRDjuRubB69A1Km7ovQasXIEeY0wJgnXpTK9RZyf5OOFtVoLFhx9sChknHjkvSK7KaSOAq+g4fG
	8/z0NrBwGnJUxn2+4omdwPDon9/34VxxgVoBUwerbEAqeiPWgipIbj82dS/y477Ofi6jdG7wdG5
	E1EgUObiunN26eLtCx8p4YwZ5oZh17RnZX348vlR1gq4uNx/CHsx3dip4FZTWHY3vQPGDrUiy8B
	TgO0cRAkyHYg7+SxIUefTBmTWTq8GPndrtxiU6gbu2gZAA29lcyrM4lWwdXaewDb15KIyqoXZxz
	OrvQzg0YrA6Fx2
X-Received: by 2002:ac8:7e95:0:b0:528:38b1:b54b with SMTP id d75a77b69052e-52d73d93239mr63800891cf.20.1786633203840;
        Thu, 13 Aug 2026 08:00:03 -0700 (PDT)
X-Received: by 2002:ac8:7e95:0:b0:528:38b1:b54b with SMTP id d75a77b69052e-52d73d93239mr63799871cf.20.1786633203231;
        Thu, 13 Aug 2026 08:00:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e1330sm524819e87.8.2026.08.13.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:00:02 -0700 (PDT)
Date: Thu, 13 Aug 2026 17:59:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <uo6y7zydgnxhz4bbk2bzlychhxcp3hbx23eqg4wihxkj3hy33b@h2pbeveq6tul>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
 <eblai4d6apohd43uvo4kbm3y6yfkso7rd643ijra2awyguve5l@j7aq2vzzwmj2>
 <an23eZWmtDVbfWEG@hu-anantiwa-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an23eZWmtDVbfWEG@hu-anantiwa-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7ddbf5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=ohoy1kE5jbgo51n5cX8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEwNyBTYWx0ZWRfX1F7ZO5zc3ZTX
 a3Dpnm4cqODfL/XtHLD/nvRvm63ZAbWqA/kRGeGY4lvuXBk2KOea48sbjabzu8y54SOvcLdGFF2
 TkSuWtEXiEwaSVkBUFyZi7rkL6Zitrg/GWrlQ7omcAIwT/IoWO632UmF+0dVg4GhgzYxd65jJIU
 7FpZ2J3oQ3RnuZp/btKR/hFYgL5oCcrsfPvLgQ+KBGxEi6du243cmi1tVTVebF3TRqvNZVGdutS
 h/S6gowq7v58W8NG5iDolOWFcsnFAkf10N0m1Zmu1DIpSVyAvuMMSaJlyLxhpV6F+KNlvQqbsAO
 2WfUF0vHqqSAKbGySQCOKKwYec/bi+Gkvbj0A8vO5C6BabmhoP6gOyyolw5iPZ3u4koGR/WCr6Z
 Qr1+0brn6dK+8yRoYezVdfQGbge/v5I7SlSCJaquIdUMH6PgFStdtzVtz92U/YFip+K1p2mfjb1
 rqbn7vm5DFcnf4b58ZA==
X-Proofpoint-ORIG-GUID: O_XkQe_Y96bZgmE0Arw9MgQDV-thBC4L
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEwNyBTYWx0ZWRfX4n3j3QYfUJEq
 PGQuUaNIoacs4jVcLKqZEZoftPRpem1Pr+fGqf75oQG4zygE6SbordLBdXQ+iKVimB0vbPJIdSv
 BOR35ez91kqu5Z9i8xh/ITCDHzPUIzo=
X-Proofpoint-GUID: O_XkQe_Y96bZgmE0Arw9MgQDV-thBC4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130107

On Thu, Aug 13, 2026 at 05:54:25PM +0530, Anand Tiwari wrote:
> On Mon, Aug 10, 2026 at 12:04:21PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> > > On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > > > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > > > variants and provide a composite DTB for headed variants.
> > > > 
> > > > To quote:
> > > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > > 
> > > > """
> > > > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > > > lines of a new feature, there must be an underlying problem that
> > > > motivated you to do this work. Convince the reviewer that there is a
> > > > problem worth fixing and that it makes sense for them to read past the
> > > > first paragraph.
> > > > """
> > > > 
> > > > In fact, I'm not even able to guess what the problem you're fixing here.
> > > > 
> > > > Regards,
> > > > Bjorn
> > > >
> > > 
> > > The problem is that the base device trees currently describe the eDP
> > > display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> > > are also available in headless variants without an eDP panel.
> > > 
> > > With current base DTBs, headless variants are not stable where eDP panel is not
> > > physically connected with board and userspace is trying to use it.
> > 
> > Please define "are not stable"
> 
> I did not see any crash in this case but in the absence of physical panel 
> logs are flooded with errors, userspace is trying to commit the frames 
> since connector status is always connected:
> 
> "
> [   23.499621] panel-simple-dp-aux aux-aea0000.displayport-controller: Prepare 
> timeout after 5 tries
> [   23.508763] panel-simple-dp-aux aux-aea0000.displayport-controller: 
> Couldn't power on panel to ID it; using conservative timings: -110
> [   52.143157] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for 
> commit done returned -110
> [   52.175662] [drm:dpu_encoder_frame_done_timeout:2733] [dpu error]enc40 
> frame done timeout
> [   55.351084] [drm:dpu_encoder_helper_report_irq_timeout [msm]] *ERROR* 
> irq timeout id=40, intf_mode=INTF_MODE_VIDEO intf=5 wb=-1, pp=0, intr=0
> "
>  
> Another issue On Ubuntu with Gnome Desktop is:
> Display's connected with other DP ports are only showing backlight since 
> login UI picked eDP panel connector which is not physically connected.

So, for the next revision please describe that in the commit message.

> 
> > 
> > > This series fixes the inaccurate hardware description by keeping the
> > > base DTBs limited to hardware common to both variants and moving the
> > > eDP-specific nodes into separate overlays. The base DTB can therefore
> > > be used for headless variants, while the overlay is selected for
> > > headed variants.
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
