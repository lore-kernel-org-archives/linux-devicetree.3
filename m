Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64130499F3D
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640776; cv=none; b=hMm24hEADlfkIiXgkcRquTOzD5fztsmaIaCE/xU04gIwXXR3VSfRdV7jbR+hkEIcMoZqJZ22eqwkL3sANEwN4YTbBm7HM5+TXE2Jbw9DvZo9ZiNh16Aq75W7xjZf+dPcRJjyBKAP+FyPn0o19hZfX/sLiyG+D17NNDt/s9A9RNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640776; c=relaxed/simple;
	bh=B36AwCUnWoIPs+VzBRY/WKH+1J5rKdSdeYvYsq0n9r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQgBCYoyZnpqg1srgn5fpTqi21qtr8YI4QioA8tmf+nQn0hEiAS9EPEE0I7RfgKWK6KJ/o1Q031jikyPaZc07y0tgS7TaA9Rum87XfE2v9bUdGjheBDlgl4/SvaqMdnb/1dQmrBZdwNvxTqoPaaFZZJSMf6pmqF1opHP3umqXf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3uV44kY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoApxam0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3uV44kY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XoApxam0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DGUvrr2076841
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cddrscBfzbjs0vy6WWXuqpnU
	tgMOMnWbwDcitMMOPPE=; b=X3uV44kY2i7QamZLhCDB4LKDftGTTFVNk2Zdb2dq
	qFC3OjKKltqMMpnF13ZIERSeEvwBJm65jqAS/KJZE5C3UqAQt1WWiCAKf+RWY19h
	onxZzvj/pQfLpVmhHyHcxbw4V+F4+IYolURjP2xhNswseOCwx2tjim544b3EFkKT
	gE1jeWJbrz9IR72nycjsaqobWZ8PZp4e2T6sX4KdrveK85cWq4FTDX7wLHMk8KWn
	sz82GHbbndhoBAKi2NICI4i8mZ1J+5V+HKFSTZt3L+W1/F5MmjDz7UriR7uYltrB
	Ci//flbJLfbI6Tn34E6B+S1MshRiEXRKP6t8wPXg2vmtMQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy058g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:06:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963d7c11611so104516241.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786640769; x=1787245569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cddrscBfzbjs0vy6WWXuqpnUtgMOMnWbwDcitMMOPPE=;
        b=XoApxam0e0Xd+BWw1vmlbJAb5DYOhv+bsCf6NKW9HmhIDyPV+Pal5vJb5Tob9u3K77
         u7ohqtilvCPX8gzPVAOWl+YvRfmC8z8o7GIPTKtn8NcyQN1MHF5APKBFpm/JNHWMhYio
         nbs9/cRRTiag4BWzBTuhx+iqDFe411FB0cKyqNkc2hURBWQ4WTtEr9/W+P+1f1lLFMWs
         2LD9DNaF5jGvVedkhs5rww3MTlgijzxEl0mRS181C/HgeAuxbf71iuaQHJDxSe234WsN
         g6wZS9nlszUpgNhX0KGBbKT91W0Z4Kh7o/PriH24vSxU15IGT/D2IiPKdHQpyuq7HP5k
         vvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640769; x=1787245569;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cddrscBfzbjs0vy6WWXuqpnUtgMOMnWbwDcitMMOPPE=;
        b=VSjDhlO/Kra+VgbxnAfaKS0stuDg5Z40KdCe8XoOQPZ2VB4GVg+JrZaMtlbLnWr7W8
         jbrDdQjbVUKaf9QGW5H590RO6hW22Cj7+UH4E/142AlBMHpO44jq3EODtGPMoScjTpfP
         ZxPe6rSWlf2CNHSAw3JnyzO15Dch62gLd+T0YbAwspBK1xwShgtndpXIWnbO6FvnPWUk
         A1fW4/g7HfCHnz6hiZgt+3Cfhb5WuBwDceGZbJx/i7g5KNLHXwN988Sm1BjqtHRKiGJx
         rKsW1Nfn1znkxTApeynYTohoH/1dwRbkq7fNfbk6jglKJUUWXK/HRBKde5Uu6A5E+Mke
         UiOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBgQxtHLGtzGLsXBBejXxIID2UlBSIL3wJ/dkcPSmNRW9DY4WA23LpiKnZPUi4CkL9iCT/y6ybRCtw@vger.kernel.org
X-Gm-Message-State: AOJu0YwYn5hY1tTUXjow7uToQdgCArodeOl2UxgVsCFNi2xCkBHGF7Pa
	x4jpn4Bl3McpeOe/x/4WbWtHspGmJh+oWBHZZ20xIhALZy5LgRLD1DF9hUWkmA8Q7AEAAFVBdU0
	8xN53zb0ne741Dlw1zFxP3f1oLYlguIaZH8KzPVKEMu0Mgo3g9Rdi6BKEgmYrVo2m
X-Gm-Gg: AR+sD129WDQ5GbsKbznqFywp0c2B7SjIInFQnih/d4xl9QMgdTLvRf+JJkXjb6zuRHW
	EwksjnGlMndiWDV8oEgZ7b0gqyvuhc9LIXU9miNEle2DCXjCQCO7wC3BiW0F6O8FPMRT7c18yFr
	nnRHhabuFs9YGfgvyp9zlvISgK2tLkxUksH0/ZVDxWJD+0xlgLyvZ8nKhKbHA74ZRq7ZcB2DyJh
	L01SJDt3yhKgr6ViEUEmazVn0pGasgJA0lslyvQ9do3nGunuiPPv8dIJWGs4PYxphwBASYc3Hgw
	hqEpnbD4lkEdryb/d3mTxh6Kiw7I94m1qSFQ8CYqwtOnr4RQ8R8HuA4SqsRBUkMmsQo0cxNpJR3
	K/2jcz29cHonFNlRsICDnXB/S8Q4AgEvUlUH+MEh5Um3B9ll6I8w5KMuJrfzESi3ZbaUNkvcFYb
	v5L6rufTPkDxYo
X-Received: by 2002:a05:6102:5797:b0:739:d787:be8 with SMTP id ada2fe7eead31-76db748fd89mr1667705137.9.1786640769370;
        Thu, 13 Aug 2026 10:06:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5797:b0:739:d787:be8 with SMTP id ada2fe7eead31-76db748fd89mr1667673137.9.1786640768831;
        Thu, 13 Aug 2026 10:06:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a8d4sm13061e87.15.2026.08.13.10.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:06:07 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:06:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
Message-ID: <kbft23c77y4ebuivd4yo6wspoyojcv4twhazaltjws4a2st4m3@ene2fdawtw5s>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <wjzyvt7q4vpirxclbwexrhsmcoi23hmsqbjjpfto26ofci23t7@uufz7ilar4qk>
 <20260813-generous-romantic-asp-be92e8@quoll>
 <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
 <7e42defa-f712-4d90-a328-344d9cee66fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e42defa-f712-4d90-a328-344d9cee66fa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyMyBTYWx0ZWRfX7kYcHg4thl1S
 375tFjWiucp0mSlStN+viT8+Qa2jAfKw+NdIx5LQ1pnwgX8qRYHiJ+RXhZqfRm85hjEs2j9rQxD
 LwGalrE3jl/qSo9vDZRRc9dJvq0cm133KjV5zFaMvM6lhO3F2kfKeIqF1ZK2dqpnzlFSfs3UqSJ
 YzWIuOU9klDTJnrFdKcl4czI4S5xBsiPX+Jq8OquIywO888hJvBaMmX0fbk4Ge00wP+9GWiUtCr
 6daiWNYuMwGYsbIYfLAGjyg2sO6k6dXGArbhsvEjuK+NnqJMMum8zX0+2ugKwgklCOpUENeZCBM
 PQCFwoM+M93x+2/3Mbw+aHdq343KRgG8wm0WCDq7Fs2Snj9q0wBTr/1P1e1gaXY8pFr0VuVyn2n
 /EwDPVWu1SEHZOKzBEaw1By7VXQBJ1fKdkxD+6q7x6MW87AsScM3glXKMEmWuVBhHHVKjcjP+Ve
 euQ3MG2TdQbREgQc0hQ==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7df982 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yeIXzWwml7xpAbmzry4A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: ro6uueKsnvtbwhIwcWN-TyC9q97X6Sal
X-Proofpoint-GUID: ro6uueKsnvtbwhIwcWN-TyC9q97X6Sal
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyMyBTYWx0ZWRfXySA9pwyZL9Mk
 t24dJnu4FKFpbhFsRd8J1+A1BVvKgJH+iGCboIUHdAvBjLPtcSMmNWoEs+nsdZ/E5DUKwojMT5t
 dJArRt+wHnd16vkR6lLq3AyHOFpx6IY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130123

On Thu, Aug 13, 2026 at 10:27:18PM +0530, Hardeep Sharma wrote:
> 
> On 8/13/2026 9:31 PM, Dmitry Baryshkov wrote:
> > On Thu, Aug 13, 2026 at 11:44:28AM +0200, Krzysztof Kozlowski wrote:
> > > On Tue, Aug 11, 2026 at 04:13:40AM +0300, Dmitry Baryshkov wrote:
> > > > On Sun, Aug 09, 2026 at 12:57:14PM +0530, Hardeep Sharma wrote:
> > > > > Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> > > > > (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> > > > > 
> > > > > Peripherals included in this initial set:
> > > > >    - Single Cortex-A7 CPU with PSCI idle states
> > > > >    - RPMh RSC with clock controller, power domains, and BCM voter
> > > > >    - GCC (Global Clock Controller)
> > > > >    - TLMM pin controller (110 GPIOs)
> > > > >    - Interconnect (aggre-noc, cnoc-main)
> > > > >    - GENI UART console (QUP SE3)
> > > > >    - SMEM, hardware spinlocks (TCSR mutex)
> > > > This is pretty limited without any storage. Does it NAND?
> > > It has serial connection. this is enough for a start. At least one
> > > communication interface is needed for early upstreaming.
> > Yes, but then, as I wrote, it is pretty useless without the backing
> > storage. Also, it would be nice if we new the future plan. Is it going
> > to stop at this point? Is it going to be expanded in the next few weeks?
> > Will we see a spread of conflicting patches 'arm64: qcom: kuno: add
> > support for foo' with foo in 'USB, PCI, remoteproc, NAND, etc.'.
> 
> Hi Dmitry
> 
> Thanks for review.
> 
> Kuno is 32-bit ARM (Cortex-A7), so follow-ups will be `ARM: qcom:
> kuno:`, not `arm64:`.
> 
> This series is the minimum-viable base (console + core infra),
> following the sdx55/sdx75 pattern. Storage and the other drivers will
> follow in coordinated series on top of this base.

Ok, thanks for the confirmation.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
