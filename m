Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69E7492187
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999365; cv=none; b=nEx4Za8Fr0UAVCVaZK60M4663lXWEbDAC5fabLpwMNXU1uqj5qEUsX4N/rhmDXWk4IAUa137UV/fZdpC52ACJNb02E9xCMqeVZH6EDwJYRIvx1KA0qnjko8z68FTPYyWwJovEbL7KwSHU6pOG6Pws+g1BVGRYxWRMFxWfdpxDJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999365; c=relaxed/simple;
	bh=XWisdthpXEsZ1h/uQy51Wp0h5gBanWMeshjhe0Ik7mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYPaxLDEqsfVx6wEYOiyi9dkC2HT6/+4m9pzHqlfem5L2EnEVRYblhagdnPI/P3IR8+HUvmnSmciFPP3vL71uRzYs4OMCdYZEJ7XBWadKkdlDvgR0kHyfUCZX2G6Cdz/vC+DWd9NIZHEZBIe7a1fE3IDR3dtFduXRkk3yjo658M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjftXHJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R5W2uVyS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjftXHJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R5W2uVyS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645F1aIb4028276
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 16:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iAYFcoBuVm/XcG40EG9yN1cf
	01dwHoZZydGSBQe+fRk=; b=OjftXHJV19fGxCUgY3Jz9FOUwuFlMyIvE2v9eq/r
	Csyto4GYkW31L5U9eST4MIKUcvENbIA8pp6Ma1FUOidL0K7MOjMfgjXVL/i0FnDA
	XphMZ8h4+N/0ZYpTL2BPZSQhxPzFo/K2KcmPT6DYB+4UKJ+dwRrvZoCKCj49KgJH
	7c718rJcgmjNAENjF1HDZTYX7JCdBHeSLp6Nn7tv8gPxJp0fMji/WDDx6CJCZaYB
	pu4dUwRprcupX2wyhzbWr/F8IvsWvCJJjOU9ScFdQkHTZVUoPg4jrN1N4dWw7f1W
	YfBe34FRZkVd/mj00lulLO0reQND555HWK3GlKXbsaM5bQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6sus6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 16:42:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba718173d1so5116065ad.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999362; x=1778604162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAYFcoBuVm/XcG40EG9yN1cf01dwHoZZydGSBQe+fRk=;
        b=R5W2uVySS0pmd5cxcj13xoQMlKnhDyhJ3FyNH1guubs+B8FKBYog6KjcGw8GLymdfb
         q+idn8NadUnJen/L41Um04wHtGUv2qwV+gSH0fQM6xFaiWPdSg/dOIRMp3sTQ7P6PkpG
         Z4WZoTpMTdnjhnoLeiBFGG0/YOsq57ydnFt5Ilsf1ar+IUM6zoF+O2bWQr7O5/Noum/R
         uZcxOiIrlvfm95YyjBHOElvpD9ij0tS8siU4l1GEKhND5rCVMQdRd8zxzcfdincFsna4
         VRt14laUko8d+1WHvHwWTmOsbIL9Ui3LLiaLy5FrCSMZJ5uQb7aDh5BoKya64zoo6J9O
         5aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999362; x=1778604162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAYFcoBuVm/XcG40EG9yN1cf01dwHoZZydGSBQe+fRk=;
        b=F+50WVAlsUIyyxHu8Y2jR32VqB0CRcpJ1iimgEvq0tGyAwhWNq2oaBzodHWviMuyQU
         d6tQnYKCCBOeQuPpA0zoR9kUPhJ6rJH2T5gf+QyuU1lJl1X7Z0OQMxjflgLJqJ6YnGtr
         HsKmnnyVKdUYnAmZOeTTY6Z1Wr3dbgIfErnmnEji8XMkik1xI/JloyEcPA39J/yVbmrS
         BrAarElHLoqhv+aiM2DGyCnnC+s/M0vNU+nUvuP2f7mbYcctoFkvOyHbaexQfx5ZKT2Q
         gUwz8TL0Oy8ZzLcM5nA2iGlWhlp9DP4kNu09Fv9FBGg5tVzAJKlBhSw2JENz+bZqaPmH
         yutQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8kcNJuSb5JKlfHy1U3bfVdGLKuqy01+1QKQFrKMRWLU2YrzpwUCAq+mdYK/+q2afP1K8erwnUzzsb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+mDS1zqtVN7YFsuvj6tPXHNxUe9XAaqsJ9BdbyiNFWrcpxIva
	Sea5/3WbVT8MszUhnSMIbu2I1hxDiOl+iysoc2cqAuIuwTZ7Kbo67GyOWAKLufyPC9RPx3oYjjY
	bFIQU5+L1RS880ZP10b1kmhMNsllq5mYvToLUqxPksCA9mf4+7CLYlrS33ISSBWA0
X-Gm-Gg: AeBDietn04ga1rG05KNIa6XpWyjIriHeCasyTJaJlrB/bR8DHT7WhLFsEbQwlXp3jbk
	z4hqD+J/TXbTqTKaM+EOHMDE5ttT7IXJrFWZbHaujr9jjC+ANYNQG07zTP9D2vyP4XW+MqEIotN
	/tUNTSlRy/HMDNaG2kCAYbbwqq0WmjE2mMn4c5FJ5D4tlFahhbtVvM3YGq6+CmUUINs2R9q+WB9
	/EGCvmfjVFqcxv+UWQh078DXJ4NYkooTNgzVsiIIbUu7jvyBQlg6gwnd08gNnVcYNHXkI7r/GOQ
	T8boREyh1BTgK/nB0OYgyrimfDddyGgX+MnXgSbqUtqFyZkRei0XbU8tcNrrIMWkHkL2CSncKkC
	G2U6a2+TUs+X/Ywa4zAqpR3Wy1oHbpKM7db+n8ILu+GdKpQ==
X-Received: by 2002:a17:903:2ecc:b0:2ba:15ff:345d with SMTP id d9443c01a7336-2ba15ff376cmr108941285ad.35.1777999362287;
        Tue, 05 May 2026 09:42:42 -0700 (PDT)
X-Received: by 2002:a17:903:2ecc:b0:2ba:15ff:345d with SMTP id d9443c01a7336-2ba15ff376cmr108940885ad.35.1777999361838;
        Tue, 05 May 2026 09:42:41 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae0f6d8sm144847685ad.39.2026.05.05.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:42:41 -0700 (PDT)
Date: Tue, 5 May 2026 22:12:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
        rmk+kernel@armlinux.org.uk, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>,
        a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
        boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
        chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
        julianbraha@gmail.com, livelycarpet87@gmail.com,
        matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
        rohan.g.thomas@altera.com, sdf@fomichev.me,
        siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
        wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
Message-ID: <afod8ot7xb+g0wzN@oss.qualcomm.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-13-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfX6MqaEPrxRMQd
 67E5vgVnSWlmkJv/hn1prUsDEsg6KY6xpdxsjGmVkYikzGjfEwN1jJjCV8dy21dG5Cn04c7k9vr
 Gfcn55/hm4FJoqpdihnC/s/1mje7kWPfdrpsPoA4kICsDiHSFvr6ruvt3cfhDdzTOVoAA2xY108
 gZOsMLMZJsrvxWlAU/iCmLrRLPp71LSCFd9RgcRu4MA6hYgTaHdGnT5ADFvFnWIXJlNDgbtfaUg
 DsLeHZ3ITTiGqMQGj7p0MewYHGvb+rwP4u19tAM7VGKUENPe7na9bzm0j5Tgm+kxCMwyouBMana
 dPUHY9eHSq5kFikdDAGZ9DkZJ8qeRhQzgvM+3x5yAMLnLHwhpsay1grNIhZ1rP69x7rb/WdTIpI
 ct7jOHwMprHMfcf5ByrGTE6njXoIHtGhfwPLtKV1SnG4uUGs9vACRJ/1zOV/3xmMA1jkhFXt8ne
 Ej42XbQZvmgQs5u0wPA==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69fa1e02 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ee_2aqc6AAAA:8 a=lW0hg0oAPnnF6MRRTAsA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: eCvC25ZFKXFDkbPuW_s8W8NKvYCyipo_
X-Proofpoint-ORIG-GUID: eCvC25ZFKXFDkbPuW_s8W8NKvYCyipo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050160

Hi Alex,
On Fri, May 01, 2026 at 10:54:20AM -0500, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> 
> There are multiple builds of RB3Gen2 with components included/excluded.
> That means whether or not there is a phy attached to eMAC0 depends on
> the exact board. However all versions include a TC9564 combined with a
> single QCS8081 attached to eMAC1.
> 
> Add properties to the existing PCI nodes to describe how the TC9564 and
> QCS8081 are connected to each other (and to the host SoC).
> 
> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> binding, but checkpatch.pl doesn't recognize that.)
> 
> Co-developed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>

There's a minor typo in the PHY name - QCS8081 instead of QCA8081.

	Ayaan
