Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D7277818
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224695; cv=none; b=ATuCKpE0ajYiUcJPKlJ6lRxeeWD0vp20VKmuDoh8DcZRoWWUhWJl/+XrLG+2IBqrDv7WNgPFtlquMXJAhR9kNP8Rvjwdig8A4Ow7nYejrPc3LCZ8x4kR1+/SwR9Tye4n+y2r13alWs/HSKPtzJrAL0gOqHeKKd47w2W/WVppiI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224695; c=relaxed/simple;
	bh=SJBiY+R3NXDIgUlBkgFdlQY+VmNVDIT/j3xZbSG4C9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6f7GJZtlso+f8rgpx/N8etSrCVUNQKt5LRZq+GFrowLdjTlVPLTKRwJpQjVx1LoUo3FHE5Wc64vEpDVKLrF8EgAcK5AjpHX+dwlA/9T6QCC01/nRWqWc11ZN313jo/c+VzQormQNfgnXpDnefapOcqihQDtQcJE+27bvnji3ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCmmIV4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVS8qxZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCmmIV4B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVS8qxZA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C00FlT2132623
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nQPjr36R0KS8hFdJ7HPSGHpY
	gXxnFZo7pMmgrnwmFuo=; b=VCmmIV4BLF8HY/vWbNEV6J+0AVqn10FwRTWIo+mm
	HPSKgfgWVz3+hJ2eTEUYbB31bDPe78d+vftTYa61YEBW01t6Dd0fGYLeH0tLov6A
	8CaumGG/UMGQ2vnm6Xq+UGE0j4MGab2UH5WauEkbsi7kuyp/48n55G/ux+2Xw8gs
	jvb5p3M3MmYdMBwzmj3rLxCEgpXVA69Uu2oqaaJ7HmXUh7Cgzid7NWQu4Y4dAPdt
	m6xj7tSNfjJKVw2I3PalXlG2EMWfAfMu3LCETcYTZC5Y37ni+dfO7wuMDAmWs/+o
	yUw2ogUHEUDr4gjdwMW+yvYkWNv/WW3FCXHyp6VYDanO9g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76eg3dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:37:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-307fd7138b1so777691eec.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781224675; x=1781829475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nQPjr36R0KS8hFdJ7HPSGHpYgXxnFZo7pMmgrnwmFuo=;
        b=YVS8qxZA/R+NnvsK5YznnPx+FZcvraaYb+t3UKlL55rnRsoonvNlVww0u/20f82HOF
         zcooXczzPWPeWAIp27BPcsffFEkYLezG5C5gfSJ+aDVbj0/aGWHDwfvSUVI3H2iRdAp/
         x1TUp6zJCAhcBFuJEUVVCiNKQWK19mo7nip9bXXXz2Q1nRCMyyknZg8w8SeHa6XhlFvA
         kCKhEwPCki6z1RdtY02XUukk77y+ddXgZ0BhOHnA/AMcFozk5EcQ27YW4sV9TRWzRXwb
         27fyk69Z6nf00nbIiZz/2BPf9ChtMPIAU+nKsTCNgl2/sAFG/S0SRzz3b3k/pPfBnrjO
         g9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781224675; x=1781829475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQPjr36R0KS8hFdJ7HPSGHpYgXxnFZo7pMmgrnwmFuo=;
        b=RhRaGo3tA1uwy/fHhbq0RqXGg7edTkLLQE5AQCU3FamNPG7hb6T6w4yGKqzfRBpsCc
         T0vekXODgizumIXT8n2CLJncZUwIzpF/65Da+c7QzT4itc5uXfQst62Ed0p+wkWxhK2b
         B58sPC8PNaGKxj/FagsjH4zIfFYnEkV2oOO5Npy+b978yRhYMIsESyIN3Ny88JjePIse
         bKAT2XRqYe1lPyC3Nnxq1rR/RiStniiWi5/yxm65FvOLinV7Q5k72M6J7r+yRSvnaB36
         +1d8D3lxrt0ELDUh4ppgYfh9f5tFJLwz+ZKs6HsGJUwmzQjuPlpp7jFQ6zex7f2Rx74B
         a+yA==
X-Forwarded-Encrypted: i=1; AFNElJ9STVs2cV6Q6eXcsQTQSm23gx2R8pYYZ+qv6kb4dtbkmWu9k7fH6BXh4cg02Y7QuLJS9c0gI6mgxcg7@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhBzPYlTs9vgbWzIBibDHkpcjHEnhDf/zo6XZdit8XgpJ/Atc
	wf2Cidn3kcWdouyTWDVAAtnvRSmSvA6hKcZGP7aHQmo1nvI9y2Oz3g+sygHQY3xeSiasg1PePjk
	3cSiho3C0tDGuzQd1Ye3hMFQiLPDDxBxIux/Fk5Lq5eyXsI1RcL8utqNMWEBS/Fiy
X-Gm-Gg: Acq92OFQxk0+OYjkpiAolxHSURP1VSjij/uf21fD6/BXJyoK8if3bINRgdWb02I1jwR
	DGgzzTOu9pL6C9H1gofBdlvofBL0Wuqdruz12xlqb7TbCSqDvi9pVVJR6E5bE4SNhqOvYhtIMk+
	dQR1vEx52nq0374T+gUKs+WmkRGEJDteKc8wsoyWJp58VleMsbW+MKHiCENdId0cPZsH2atMDy6
	f/WWzpRpErfJd1nGIHsLKAf5aRMCcRPWoWfSuPFzpw19kmMeMeiV4JKH4WRE9ivxZR4KCGFsukp
	+AhurmwyrmaYxMhDreFn8J8Dt2O6+zekQnZp6hWPlLYLoPV63RPyBOe5XJMPCT9wH7YmtNMqZVv
	9j54uzqhctSLGXbr7m3MoZ1spwyuh6JFlem9i0ecP/QymErw/20aAJMLwiUiWgvuLSpRj4bllHc
	QDUg==
X-Received: by 2002:a05:7300:3202:b0:304:630d:e4ec with SMTP id 5a478bee46e88-308200c90a3mr404666eec.28.1781224674627;
        Thu, 11 Jun 2026 17:37:54 -0700 (PDT)
X-Received: by 2002:a05:7300:3202:b0:304:630d:e4ec with SMTP id 5a478bee46e88-308200c90a3mr404643eec.28.1781224674095;
        Thu, 11 Jun 2026 17:37:54 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48e412sm1125354eec.4.2026.06.11.17.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:37:53 -0700 (PDT)
Date: Thu, 11 Jun 2026 17:37:51 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] phy: qcom: qmp-pcie: Add QMP PCIe PHY support
 for Hawi
Message-ID: <aitU35BP+hnMlOx0@hu-mattleun-lv.qualcomm.com>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
 <20260604-hawi-phy-pcie-v2-10-be908d3560db@oss.qualcomm.com>
 <h6fbnsqg3gcobkc6chzehy2ew5hczidzqulr3xh6d6u5kazjhd@ygsd26b3neyo>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <h6fbnsqg3gcobkc6chzehy2ew5hczidzqulr3xh6d6u5kazjhd@ygsd26b3neyo>
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2b54e3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3XJrFejPlp7lr11Lrn8A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: qGYF709lyIohfqRIyznTarYU5H6hZt3D
X-Proofpoint-GUID: qGYF709lyIohfqRIyznTarYU5H6hZt3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwMyBTYWx0ZWRfX8f2fBKyftdDH
 HP6PTbuxkdnw3zRqT4gni+0QRN/oMtMqp+WRPKq1xZKn630pQkcaf+ULgtcF06P63R1HdsZ2bU3
 1glx6Cy7yIPezScdZtpfKl+BQP9NP6Iq7vsiK+SWvsm08oCcixcY0yUAplgwBfmCIUYgFGwx2TX
 xWf+6zWAxg3IGlpVpwgzYRRVWXs4dht/Ciu9Wzpgxw55Sycu/TYKN6KMaCyv/1QoLR4VA/g2asC
 BUTodTAbw1PFFL8vyWOmtDwKyz5foZEOGUk750TjHHLeT4nXlsxb2wH0fru8xPpl45H1zPqaiSZ
 Og7MfzZJcvebWYdU2rcAOxK+RtC/KZfR4KsucGZ64WvC+g2hSraGBZ/oshWjwymFF63LgJ7SwVb
 euKLyYZgTa3zmiYpOE2/VZOyyKT+p9bTOq/ZmQ9AxEkr3m9rEGn7lfTy5zb3HIZf0HREBpndCDv
 vKIYzjZSxKQZkL5UiVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwMyBTYWx0ZWRfX6DM3miJjfjY3
 yYTvRopuayGI1Xz846BljGIpB3gqHTDWv/McrKDMyi7X4zMoSV7yVkWKh/Gu1tNM8oE2FX7kiUk
 cqUCrTTuCmrXOQnv+235c3lymmiuwe4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120003

On Mon, Jun 08, 2026 at 12:29:54AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 01:33:04AM +0000, Matthew Leung wrote:
> > Add the QMP PCIe PHY support for the Gen3 x2 and Gen4 x1 PHY found on
> > the Hawi platform.
> > 
> > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 380 +++++++++++++++++++++++++++++++
> >  1 file changed, 380 insertions(+)
> > 
> >  	u16 rx2;
> >  	u16 txz;
> >  	u16 rxz;
> > +	u16 txrx;
> 
> Can we do what we did for QHP and reuse tx instead of introducing a
> separate txrx offset and data pointer, etc.

I see what you're saying. Yes, that method should work here as well. I
will update in the next version.

> 
> >  	u16 txrxz;
> >  	u16 ln_shrd;
> >  };
> 
> -- 
> With best wishes
> Dmitry
