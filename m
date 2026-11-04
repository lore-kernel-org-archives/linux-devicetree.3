Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781763;
	b=niT7M+vQPVTpo1pWKMJxCoQtpKMuKvjzb+wclR2t1v3Li2tu3xTF2HTNAU4cKI9VpKD8
	 rrvgcZNows6xEcD3jXqn8r6uCcLnErybiPWevO4pxbNdbT73rvUGh1vwbo6tBkxQYlYCK
	 wVib07YzBBqqcueeXuOTnlgvdMEM1/jSTUUFcaCBt8S0ozutoC8+dBJZ/k65h2TWPbBBQ
	 f9AXnIFFWsKNVt0EBXdiEn5CJxMOA3CWQVp5dCZtk9qE68uj2l24r9ZmMd++K3OWW5L8F
	 Gw8viZ+LczFgqgiOSGr7tMRgW0EPmyIR7JllSGT3yivJMv32FIzjsuInBoFaP4QwMRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lw46wr8RFUM11VZcrvo7hsTLHohV5xgIubBnDb9dNrg=;
	b=2ROlJH7A+djzxe4TCrU0EdYDKvBjjG/bDPSNnGoyrJWYYa5QQ0hSTc3dK8IIpRJsZhDz
	 3O+88PEabRmvn+RW4hgi8JWBIcX5Q6XGkHPaVFz30LwYzOT83mVLalQx52B66ezi8Nqt5
	 iJrRaeSLcA1J713yFTF00bFmWig9NOn2VhZZTiochO+lkt4Mon3r3aADZsb86r+F4THA9
	 2K2LKc7l6sS2SwNnFeYs2um8db1vSSjA7gnvgeQr3swYV7t3qIeq87nQG2yk7vpnonUis
	 Ek3mva1GMMBj3UEEFIDEXw8PUvqp5b/hdazOlqRK+jq7Z7ZUGCRFWgSzXHiNc0aEPEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQWXj3vO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er7oO4ag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA588606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA588606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQWXj3vO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er7oO4ag
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KYwX1874523
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 08:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lw46wr8RFUM11VZcrvo7hsTL
	HohV5xgIubBnDb9dNrg=; b=SQWXj3vOGaHUs3E1t1LtdfjT+Y+Vht8IOWIFNZro
	jIpCRcWR8St+vS2G37ggadoOdAHaTjjRNmG8Yp0A5xXmtV2UGGAGSlQK/uPLJDJx
	jrbpNgKwG6MecFYB78dPvarClx9SRaE56QTarE/i2zsaV+ZIOed5Ctedc6V+5A3W
	Bsewwh0mQ0DAOkuptIhAPA+7YxpGKpM3qm32gTJytzNyLE93w9NVqXt+3uppsCmw
	grq2hm982V0Bjimen7U4QjogHUx6q5BsN+JekISDQx7mnl/IZhsEZP7rlHLOuhRm
	VwQVzaN6or/UwGVgKFNKFN7fQeFHgsHtpBXGhCnVS4h0Qg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mtx9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:42:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea381ce04fso6235265ad.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781761; x=1794386561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lw46wr8RFUM11VZcrvo7hsTLHohV5xgIubBnDb9dNrg=;
        b=Er7oO4ag+ib81plkmsMXyJwxF76TMTKCmGDg1761CBbWdds4jxmNZKdzvy8czEaJzg
         hdPP/CPA0X5bBpkmtFfKWbrcoUV+PQBBuACnO+O2R4SnYWKQENWeOuG54fEIOc20oMPU
         e5ktAQfLVL7m9LohxI0aEGoefTnVfxxJBzvlN1qN4LIbyz1Z8Shuta15Fd2IUUb/HRtY
         kfQt8qT/Q0Io/J6kv3ICYG7YT0WRIng0RqyihkwbBXpeo6IXmBEIGN7E+Uet5ncVkG38
         9NgfIJk12NLo7U7nrLaAqA/CXExUPNucBdjumTcl8VtfPKHCcVrtqIzS23PYzWpVz04B
         SYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781761; x=1794386561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lw46wr8RFUM11VZcrvo7hsTLHohV5xgIubBnDb9dNrg=;
        b=M/DSiqLOf0udMMpaXPWCp9CbcK3K9ohQIBXD11rDHcyh58LjvxnXBOSWriCdjfI2rJ
         lhqREdGUeLg7Bga4Hh8jLjEEsSg3CwxpztJGsKZROi4mIy4T7UKM/815fDe2zVEfDx3g
         t0FmCKK2Js7P9b9WVfcPjRBcFP3ocDIqI5du910FLcBsFDzw16EmEjlhMSUkLp+LC7sA
         x+eX+cYCGtJeACCqrGmwuPzEshUsTRhBQ96qy01wOfBA4A47vPd7Mq1RxDKV6YlbAs/5
         hUzQ0LPZLMYDf5mNizZL+Hh3HjaOBmg6o0VbbIhqCZKYOZ+hht3Eo/rNoB9Pn3Etc6Yd
         o1AA==
X-Forwarded-Encrypted: i=1; AKwUvBw6lGoppwWrB6Jba1bVKuMmRu9kYJEmKF3m22A+5cxEQ+KhPeNXQBqS/xhCrBpNCa3XqCLK2TwTa9v4@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q+DuZfPytv4/eQS5H3B3+j4OVueJR8bS15+uFEBBZmfbfbTWe
	uQxgUNQUrU//b9dliWo76dtmDGmEtLA9WYE0m4z9hBwKmowJOMI5g9+DHSQGEYG6vPIGWCeD50G
	M6DdWem+xWuvdGLTggAJIjtFOQDJEkNvnyXFuVmldd3uPTda1NxXcfc+E+FvzBxtT
X-Gm-Gg: AYBFou2IlDWzZDmz6lQHOxeeHpK6Y29m9XoxIUAGYQjnzdkg6CuQGg3ACKuiKRWqew7
	8okIFukn4dNauskuU9pKUw72J7aAQGaZV+Ktm9y95kuRf5j55d1J3FDLjhgfEOYnLFaPkLp7bUw
	5wYpRPCi30qTChrd0avoxyHr/1UTFAKPQYAjNjkf9qate1nZPXD1and4Wj5QJ9ybJcz+XPhvMMj
	msWa1YT/5DoThkjMY8BVtOYYMZOWUu9KL8urXhR5O9tiLjty9TexyuXmyfZi3j5wCQ/57zvkixk
	J32xqA5umh9xJ6MFcgYdoE3PEPWxqt/Z+xhbMmg8+Ai2K468hOeviNnn6W5T0Ay1enJk9KSbTGw
	DqW0m/5Lgx2AJBh2IIFuVdpUSc9tSxROE8dSrhtwqQIgKt/Klw3CgK9PDUXzsn6JON+J6jl2odF
	2QEqgApZa4lzG7RQ==
X-Received: by 2002:a17:903:124a:b0:2ea:238c:4d04 with SMTP id d9443c01a7336-2eb364953c5mr105805635ad.12.1793781760758;
        Wed, 04 Nov 2026 00:42:40 -0800 (PST)
X-Received: by 2002:a17:903:124a:b0:2ea:238c:4d04 with SMTP id d9443c01a7336-2eb364953c5mr105805465ad.12.1793781760280;
        Wed, 04 Nov 2026 00:42:40 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed183dcf6csm126245ad.38.2026.11.04.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:42:40 -0800 (PST)
Date: Wed, 4 Nov 2026 16:42:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
 <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
X-Proofpoint-GUID: EIYmhnBqzPBXkOpjqOA57XAqDEHSX_9K
X-Proofpoint-ORIG-GUID: EIYmhnBqzPBXkOpjqOA57XAqDEHSX_9K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX/+Fx1eIuYGl0
 KaPOT6kitMbpoINAK/VeJg2PnfyfTPktQ9Gp+NJsS4S0KXO9COmXpJ84XpF+mHyjfPm/qzu6TmO
 hnVltw4lnquZ5i8DfCH6mfxW1z75QSHxy5TgksHlIK/10nAHqrvIxdpIKp2MiQlkI0YehykHgAY
 Fx8BGS+DZnb5GNP7owSH3cLwRF6U482ywn75fpfcoKO8z9VmRUy90v7GUGh91rALTuvejyGiIkY
 VwBzffa7dV1W//DACf2w1LMevrtshUmZ6itAUrktbUXACbYXOatA1O2mM0pcvCC3z65Hjs95rHw
 LHygqFp4TbY2G1tBtjwgVa9rY19h76CAFGiCmg9JzSu9JrG+MHGwCe4zvojImXjli5D9Ht0caEe
 QC3S103AQdo2CGDeIkaZyvNAEvnCD3c1ahdqhKsZxwj9NrxrUVN5iMXwSnVUqumuACSsj6B9iT3
 nboxpyCazXq2C0VnfXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfXw4Z5dwYagTAe
 upw0Vo3Sd5U+K3PYuCg92CE7mRjHaHQH8t2OFVdZ1HBXqMGKpzyl8DmE7RcDhWbmIzZ0OwO3Es8
 SsXtuVc0pLDkRQ9rrcOzET62eNbN/1A=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeaf001 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KAsKvIRJHMjLmqjOIagA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040034

On Wed, Nov 04, 2026 at 09:04:33AM +0100, Konrad Dybcio wrote:
> On 11/4/26 8:59 AM, Shawn Guo wrote:
> > On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
> >> On 11/1/26 9:04 AM, Shawn Guo wrote:
> >>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>
> >>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> >>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> >>> and DMA queues.
> >>>
> >>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +	phys = <&serdes0>;
> >>> +	phy-names = "serdes";
> >>
> >> I believe this holds for both GearVM and embedded, so you can move
> >> it to the common DTSI
> > 
> > No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
> > server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
> > PLL/RX/TX programming driven by an SCMI perf domain whose level is
> > the link speed.
> 
> Right, but I meant the assignment to the EMACs specifically

The EMAC0/SerDes0 and EMAC1/SerDes1 pairing is indeed the same on both
variants. But the serdes nodes only exist in nord-embedded.dtsi, since
GearVM doesn't expose the PHY to Linux. Or am I missing your point
completely?

Shawn
