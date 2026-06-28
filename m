Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB8372B5A
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782651536; cv=none; b=jQXUj211SIqRQEoRPVzku99YBdD7VEe4p+qcMmGU6pLyOLxjrnSGxU5HFgWli+c6XKBF/tulA3WmwTjEWuwTE6tl13Appbx+KQrnhVfONnU9NxT67BJuIIqaBv1YMr65LpvvknT2imAHGRzn4NBZoV1exAcziE+/rlmtSQqSpTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782651536; c=relaxed/simple;
	bh=0wOUkTrLcwn4XQX9qdju4rgz1U4rhWcBCbj7l6bhaDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZcm63B4Ld0DuocoOZETLmZMi1B487LarNlFL6nGjBYThL1rWxApzHEgOxksC+FenBLXLvoywSEk1qEraOJomlCCP2PidoP3rvrZk6szbkECmiUfGwKEApOlCtEhfcJSdLaooj992YtSUCZMXxPuxlmRXoTXXCK8LowLG+3RPhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LT97ryoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSXgMjUR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LT97ryoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSXgMjUR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9PMeu3591893
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gpQasczH1K35L73A9A20HnaT
	X0LYp8x8agLaBKFU2yE=; b=LT97ryoOUGkqXVKm9Alyl4GmE4yzdK/J2LcveUcG
	pDNCnxTxq1yVO+mekILJnJ7xT/rvkraeWYmg/PHs++rk7zFAgLA2QOXkTyPCWTGb
	U8d2dAaDqdh3GFN6Y+l70ApUn4dWGdjrJHQSLyE4AFCg1uIS6wFPBF6IZMrkF3FO
	wanKRisjQBpDg4TJ06UQIbXIOW4bfgEFS8g80hc1yKWVd+jmuf+18hhoQ1pbeGHd
	J135XechAbSLRvAuyIlH0MbSQsxkWTF6hgXULcOZsQl62+8TRROvTomqzqA4BSe7
	USBMOAH8KUMs9Nzee561+NmZ+SsJ0b+m805b8BEsqPJHJA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf2t11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:58:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e0df2461fdso78353006d6.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782651533; x=1783256333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpQasczH1K35L73A9A20HnaTX0LYp8x8agLaBKFU2yE=;
        b=JSXgMjUR7KCk8J1izPGA5MN9EM7OD67eil8Hbvpdd5uTbJHlyN2QWyBBLzOdd8KDPP
         jRTpiSlvOgi6hSf0x5gxaqOfmA6SwMa8x/WzfcNJu+bRiOB0zmpCA8uahk+RHgPXlIi5
         FFnc2L7iUEH22zftYEwleDPvsl8F73s9s+MgCd15Kq6V1aCKaAcy7ujSZlTxhQpqhYH4
         yQyS6goggX/N65J2DD7AC4M/A0CoDQjbosspt1Ytovt4PgYkG0Bu+zjSUvYeqi26hT8u
         ZZyVRaZU1L74U115Fbc/23O21cVg/HAmyT/FjtVZENizr9AgQogRCB6nM71aBjz0+Lei
         WtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782651533; x=1783256333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpQasczH1K35L73A9A20HnaTX0LYp8x8agLaBKFU2yE=;
        b=EatQ3WXTU0eNntlUUqsOJ6oruyKINIZpe7g7V5HsYhzFcKFTwg28B+Ni1mpUmzAFkW
         R8vYmJhGthgVHcLH5BFm9dK7unLagNDSiQWqqwQ/nAGG5efvTmCseImIA7pkeGRFRg8v
         Mtx/iKaPXA0BduVU0B3HyDDLrnhyZ24Np5kWZ1CyPjPbP8Vq0BVJJeJDcamRh97eZlVt
         8DPSUeyg2/h7jjfqA6s4ZD63ZbXvuy8OnQhK7n7iHbNvHFm3aU1jiucqiR2wilNfprB4
         M9wzfrJjKiP9z1b/Lz+zPqaHEIPTtWlbUVCF9oiRht1zM3MOZmNy0bJKUAfUzbiuJ2V6
         gKLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/7F9xqPNlTiRdnoRpwDOmZaR+GRcnIPQBKC64rGsjHI8jz3hTXsLHfR3xRTJ5EH2/L9K0t7IHQdmM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/QGSjMmOQTC+nEw6bwSxuKFFddMP2g0kq7udBTw4rVMneXq4g
	0A/ki4fCzu9dy77nD7nF2R6eriiMdK96yAdOsFskf5dnN9B/Tyia9AiIGHD+ph1rs9eij5x2TK+
	7utbpoEBZ2bc/Biih1krbnO+2idvgazLfMYNlmUDAn/IuNN4jtpwkbxvQM1e7ZmWh
X-Gm-Gg: AfdE7ckv9KocBB3YACvqUYYVD5HyD2ef7afJPeR8EgimbR/mvY9/yMyiRf3CzyRQN5f
	yP/WlgI7PNCALk+qm3O8T4q9b00gkzFqTwz00JF0xbqMvk9iALK8+0jOmTkFbrJZPDi3AD5N6YY
	xSLawhPUMzTvICcPmfkUeV7oJkBkcSVmNPHIxpbovpucJkopdpoEvVVAS81kP3nLpYmwyQKHRYL
	BSqkljAYc6yGiVCZwt2nbiPrrHurS3KeKZLrO3FjOAE73jqAMtFo8Mi0GxyCkpe8ESP6RU1rgW/
	0+qIprqU9njsn+t/T7Xu0rk2GMh5aKpSPk49UcagWoEKFFU3pV2M+PhU4ZVu5DZItH9OEU8foPD
	9SiitXiTS1ZXWsnf6xhFUdpU/i0PhPi/HH65ZfXHhp5BWDw/pnDlT4pyaXzwFtqBvfSFyHEdqCZ
	sws0lo5o8nR8/BUxZa9/Swrs8Y
X-Received: by 2002:a05:620a:2552:b0:915:efa6:d718 with SMTP id af79cd13be357-9293cade740mr2223115085a.47.1782651533375;
        Sun, 28 Jun 2026 05:58:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:915:efa6:d718 with SMTP id af79cd13be357-9293cade740mr2223112585a.47.1782651532895;
        Sun, 28 Jun 2026 05:58:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999af9f3a9sm62931071fa.7.2026.06.28.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:58:50 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:58:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: fix QUP serial engine IRQs
Message-ID: <qp337vbbeah3fjpnpixqnftvxcsyxojnv5djdv7pycik5lg2zn@fpf2wlriviry>
References: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
 <hdq5iicr3sawlkhxmeut4ms4n2x7zocwva44lhnjqjfneqwtwe@3amlnfuuanie>
 <akCKUAa-Yqh3xEZT@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akCKUAa-Yqh3xEZT@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfX/BMNQFP9co6M
 iURcvQJnjd2lSZ1XhcPtRVpy761HPaDBsY7SztYhx5XXWDwXEqRENfREFN2MyuPjxzXmnJVtVzM
 STQSBz/gc2VhyXPOwCWZh/D0VkG0KLw=
X-Proofpoint-GUID: 0bV6qMwj_LhJudiS1xkDK3hliCm_s3RH
X-Proofpoint-ORIG-GUID: 0bV6qMwj_LhJudiS1xkDK3hliCm_s3RH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfX1xgkw1qks6i6
 ZpVgMfNHYG7tf95A8BiPhMTiHgNAzdGUZZyEYgmq1CvvEKQnaScImF+RO+/OMx6EG93tb2IUSHE
 468GknR90gXn+zbdag0iqbwH2DE0VfWs5AyjlVkOjQ/2mdwdKatAhXybPpoHKXdbqTXbvBBjmOM
 jIf03erq3HWexW7/00IkNcXzvuRxyeFs1UiHclJNXi41x6IYo1670ccF36xs6w8/qLa6zp+tUqy
 UaTnjch3b6YlXLzEgbxwjSn6kjM3Gng2iU0AnZW1kq+dsUk08bm5q/9KvzylA/VY73zBuNB63LH
 IpYlzR5jUpSEmgfuMRIhE404E5KROkIlQClpimFYCJE+EPHYboFc2Vaox22rM/8SBd6zId7NbeS
 mO3HdUrIYHF2VEfSDc13xmw6wSkkgvUNXzSFfHjC1L7W8sI8iUdBDDor0603ynh9CbIo/n7Cvnn
 8t1f5H9DbST2Bp8cTyw==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a411a8e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=kHK4Yh9qWnZ23RGlZQYA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280114

On Sat, Jun 27, 2026 at 09:44:31PM -0500, Bjorn Andersson wrote:
> On Fri, Jun 12, 2026 at 02:04:05AM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 11, 2026 at 05:22:37PM +0000, Bjorn Andersson wrote:
> > > The Geni serial-engine interrupts from QUP wrapper 0 all fall in ESPI
> > > INTIDs space. While some of the i2c instances has gotten their
> > > interrupt specifiers corrected, even the other functions on the same
> > > serial-engines are wrong.
> > > 
> > > Ensure that all the serial engine interrupts for QUP wrapper 0 matches
> > > the datasheet.
> > > 
> > > Assisted-by: Codex:GPT-5.5
> > > Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 +++++++++++++-------------
> > >  1 file changed, 13 insertions(+), 13 deletions(-)
> > 
> > What about the SPI / I2C controllers which are a part of qupv3_1?
> > 
> 
> They are well inside the SPI range.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
