Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81A257821
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774638053; cv=none; b=hVvxaap62Xg8HCWxIrl+U6edAufrCoMXjKWg4L+05intAdQtENzpdUMCgIhabua3+aUB8oEXHAtQduwA9lu6xPnNMlruPqPwUfM+5vmxBzda0O1qKw7AhwyjEuezdo2sZ0qvYL2ozL2NN+O1kIK3AWPXxOoNJv3OHTnB+3rJBj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774638053; c=relaxed/simple;
	bh=goHJ5Wk0OKXUZ48cCDhsqVe+PUtCgRNzbp5dbziuFgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Loa11TfHzLTDLktAHIa6ArBbNEuhq7wltli7BFxa23ufxHlc2gIgoseSimiKCuJR7S71t483lFzV4VxX6Wja1wrt1T45XZCF2OcrmgK8XaH6wjrSd0n0K2FPpO4/mHX1tUU2hqJe2K4BQ1WauRDVVqvwZLNgF4SQ4r+5SgZOc/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nggtBcar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjjvlRos; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nggtBcar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjjvlRos"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2bSD3659046
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4naHBC7JiAJ57JHk6oRYyA6ZTJaKGS/F14nGRxMoT40=; b=nggtBcarMbcfEOMY
	OXZba4AcH6TVA3XA0Y5iiGD4065H46n94pQ3010dGiBG5RtvbRpWatTgvnn8TA6b
	/LqpNNi107laLiAiBNA6T9UmgMTaEzOoD/jDwyC+hYw7Yxif8ecNaObO4+7H2ebp
	DCGe01gMxoQcIZogNKR9AlPJ4gic66/gRcgGUkqDO6y7v7FPbiyX59D5+JqALSq7
	t3pl7u6II2m5qYuecdKjTpoY7SBMgE5bappJHIntCuY86AmIgexUge+0XUbtRmJP
	+T5NJZX+DcErDxtAb4ExK9p+DonyNywXRbFnL4tONfJp7ndm1IOXcvk26j7CnLMg
	8JLOSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn12m5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:00:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091782ab06so117788391cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774638049; x=1775242849; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4naHBC7JiAJ57JHk6oRYyA6ZTJaKGS/F14nGRxMoT40=;
        b=OjjvlRosVpZuAnt1luaFPwlMrh18nmkO2HmVRAUV9ChxpwGRAGliGYIgX7JjTBkmlL
         SyGHwBY8CxVAcFCuPYScLt9L6MW35EBbffr7PpZOGhwUZz47yV3INE2oZHhq/T+uiYl1
         sWxJA9G5t7bJsp5m3BEMHLQqQhDAz5zLwNO222MwXKhAJIrn2ykTWloytuHBE8QMya3y
         nreq+epRylQ7wfI5bMlg0kFXSOxmaaLUJLxByhS90ofwnzcrMmZfnw5v0g9laf992Ay7
         1gPgusIjIZUCbdc24ZOPVJiSnwq40Dfjr70j4ULhYxChgO7FPsHQ5FesA+SPdBiBMCMp
         mWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774638049; x=1775242849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4naHBC7JiAJ57JHk6oRYyA6ZTJaKGS/F14nGRxMoT40=;
        b=fCqea3Y0885TmaDzPfbfsHA4OUNZ70T84XOjc/JPkyyRds9MKprSbKE3RDFsXXL0q1
         uNhPgw6YqZAr7Z8vBpC9kI/rKtn7t0RC88hcG9BOtDwS27750OuQCkj/N59+BGZFKQz3
         y3IWX+kzw5s/p7X6NVKVLvwALpBBNyIYKt3ig6BPHBqAGxjEo0MVlPmnAUQ6z7kUbULu
         1fgDTOXRV5jRnFMuWa4wM8DZG2E9WORzVzvGoyhxILaOsjexQSGROc0QYzyHS9oisT91
         E9LKlhDUUgJPKlEeUj8nz6KyyIKf5cu+eHIHDkEcp5rQWA/bqua/MW8K9nOBnuIO+Zlo
         2teA==
X-Forwarded-Encrypted: i=1; AJvYcCXW4+COc61azmtXM5uLbg6vPfyz2SrAO+MCi1ILyIulqRcDrDYlewWo3gKVi9BbRhReToMHgASMgemu@vger.kernel.org
X-Gm-Message-State: AOJu0YzbyW7uVGuUc7nvN3QdFaoH6FFgpYysyrxQByJ9xfKpRYdu24bJ
	SlHHGe/ZMs5wNmTlw+hWiuZFvwaVluQToKWjthVpcIc5GelVu0RQNzbCbV6AO/fA79csY78i5OQ
	7S5olSwqXB9MGGooaPNTN3NafCxapevuaLN7kw5wAx+3A1ERplxdfhL32msWVjPK3
X-Gm-Gg: ATEYQzzKaBkoIZ90tIPKuEGF4qzphvqjsl8jik/ZOiJ5nzdGk+eGCmFkc3KcG/lJ+pE
	55pRklUXCqQV3gD00wfgcdNPQNdCLPuczbBBqlNQxlrS7CXjvTCGRdTc0ho7a6hf0PidOoXizJA
	1ZVkbzXQL+/WcFuIGRrTSbbPkyjk4+WcNHDd9OEVmCpcGhzxubK+/6VCFeCtu0olK+XSGXBu0Gr
	mFO6XvV7EeB/a3W2bfnfoKbwdSJK2IZUMLa9uNcDSMKo+DpFc9b9lLPTE3g+afON8WIA+TWkf76
	Mr/sPRO5EgIAAsnl9dpFnM5ywBPj4RmGx9MS7izE0KD3ZRDrC5H+g2BkfRhrKJZvdWx8lMngCMJ
	waEu/1KAFz1pXu7WJk6kpToqDblozKHwcl9fCEC/ib2/3LQlduJVFOF4GLg2B/Oc1RbQkQHpPfN
	QD359sc7d6Jdgb84w7tVvCdq2K9O4z+fLmWDo=
X-Received: by 2002:a05:622a:1828:b0:50b:4ad3:a32f with SMTP id d75a77b69052e-50ba393e076mr51030881cf.61.1774638049294;
        Fri, 27 Mar 2026 12:00:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1828:b0:50b:4ad3:a32f with SMTP id d75a77b69052e-50ba393e076mr51029741cf.61.1774638048498;
        Fri, 27 Mar 2026 12:00:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931acsm68991fa.19.2026.03.27.12.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:00:46 -0700 (PDT)
Date: Fri, 27 Mar 2026 21:00:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
Message-ID: <xnkfbhfm3p7zjriu6qcdxo2ka6h4kvxvqx7tyhljcrkbqf2zl2@x2aquwtxpub7>
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
 <hrebrfsc4lcsrpk7thg72f7gdmi3btuiphdwh2ft7algej72xz@cijypbournvw>
 <acSZ8AqKC3hdaz2A@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acSZ8AqKC3hdaz2A@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzMiBTYWx0ZWRfX//AV/B97y9ME
 PezNmxGJcIfHT6k60YTFmhyu4D3qMZ1mSv25lZD1Umgsrp9ZfeOhP7LI2CPCZSWlxoLlxeKQ06A
 cSKTfhMV489nXdTdHiRbhgNkyWfGMM+T2il2w0iXJB5nkO3MM6hGyAMtnhK8g4u1wyAefQJ27fX
 e3SRCVPrBmWSYmmUFd/rCJ5B8QHY2nG38DvrO/fj1f4N8oGUPNSYhqXnefSvG5CzqE7dvNorsSu
 dJ5a+1ftGhcDIVuxHS3CsfjMNsJ47d6Pttt+zB5E6THEXRy+cUw68Ucb65N5Avc7hBEmkdlWrJ4
 V5GV2RqfTRTyObWfIJWe65sQ6zufAEdYUlblTLhvV4JbE5VEmen9Qb1uUDNCp6UeDaeayc9gD8B
 SeXpBbzZsV5m/b2OPFFmF7WQC/2im3CvOHS+mACp1/uEs7461jjibIWL4EdpsQDwvjCxhHeZiPF
 r+2xclKSXH64Nf7B1IQ==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6d3e2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2pzT6keT4olQg285jPIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: wWXsJYiKqY04fu4NYmqSKVB0dSqjapP7
X-Proofpoint-GUID: wWXsJYiKqY04fu4NYmqSKVB0dSqjapP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270132

On Wed, Mar 25, 2026 at 09:40:58PM -0500, Bjorn Andersson wrote:
> On Wed, Mar 25, 2026 at 01:35:46AM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 09:32:39PM -0500, Bjorn Andersson wrote:
> > > The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> > > the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> > > two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> > > interface.
> > > 
> > > The Renesas chip is powered by two regulators controlled through PM7250B
> > > GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> > > The Genesys chip power is always-on, but the reset pin is controlled
> > > through TLMM GPIO 162.
> > > 
> > > Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> > > allow it to be brought out of reset and discovered. Then describe the
> > > two peers of the USB hub, with its reset GPIO, to allow this to be
> > > brought out of reset.
> > > 
> > > The USB Type-A connectors are not described, as they are in no regard
> > > controlled by the operating system.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > > Dependencies has now landed, so this provides USB Type-A and Ethernet
> > > support (when renesas_usb_fw.mem) is present.
> > 
> > Note, I initially applied the patch to the bit old -next (20260317) and
> > I ended up with no PCIe host at all (bare -next would still show the
> > PCIe host and the TC9563 bridge).
> > 
> 
> Applied the patch to next-20260323 and tested again.
> 
> > 
> > ANyway, does this actually work for you?
> 
> Yes, I booted with pcie_aspm=off I have functional ethernet and I can
> plug/unplug a USB storage device and access the content on this.
> 
> > The hub is detected, but the USB bus is empty.
> 
> I've disconnected the USB stick again, so here's the output when only
> ethernet is present.
> 
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci-pci-renesas/4p, 480M
>     |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci-pci-renesas/4p, 5000M
>     |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 5000M
>         |__ Port 001: Dev 003, If 0, Class=Vendor Specific Class, Driver=ax88179_178a, 5000M
> 
> > I tried plugging in several devices (includin the
> > powered USB hub) and they were completely ignored by the hub.
> > 
> 
> The USB stick above was powered by the device, so that part is tested as
> well. (And schematics shows VBUS is always present on the Type-A ports).
> 

This makes me wander, what is wrong with the device of mine. I will run
more checks later. Let's not stall the patch though. In the end, I also
can see the hub registered and working with the driver.


-- 
With best wishes
Dmitry
