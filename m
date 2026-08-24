Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E849C3ECBED
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561707; cv=none; b=ji7zu4GqE/i902hCi6tp+rFP+YQvLz4tTZsf4xGfETHZ3BPyqxsxJ5EzH8emaqFE6aOtF76XZvYA3LaLr0Jb6AWRcmGde84QJqN2U+mY/BB8iCMDY5rRUbp5/w1OVrZaJgwF9SchlnJZwTywib+yCz4rLuUgobmwnKJi9uYmcnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561707; c=relaxed/simple;
	bh=L3zszI9VmVYHO2R1KbnqHE02xA967q25Wya8Ag0G9dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcAdTlrmkO73+X0l7uDYXbdxsX4FM0wmbZ0w+rPSC5Lu0oNo7fnEd+zH/6Q/LVPVKLbo7owc+015VnNUxDSDPId35IQBzl6vDtljgBEZrw9VJztikySKbHdHJFb7MwqM8vBgVcjYkf61fAXu8/y1VRQzPDSK88RloJFk7GyCet4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8M47/MH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDBoaYj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8M47/MH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDBoaYj3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RIZY1008546
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p6Fi7lyn/uGeuBie5GBvgAa3
	Gi1YW/kpjLBg0PGKlFE=; b=D8M47/MHIS0rHm38R6kP7BF4AXFctqEIu/lmra0R
	sIPso1t3e7jLgkRCRzgY7U5DREyOzw8H5HQTcfWVn55+4XWusJwkFRMEvdPlfAAT
	sDH99YEXnyi/OzSEpKD0+fDR73su2SWAatxNLWzvX5ZJEOMt6iVvihevRgpSDo23
	p29qOKGRjGmarcwcn3GJrj/27ZObI8oHpT9HP64AKg4PD2/T6GbAwz9RtCwl+u8X
	ORoGxJX/d++GlQtt4RrstmFRX0HM1I7ZJYZdpnm+yUV561+uzUHUGYbXY1FkznaY
	ESg0gfRJcv0J4Aj4HAyRUXp5vnAoUxKOG3pmqbVoY4YRWg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhe2yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:55:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-75116a48926so2679167137.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561704; x=1788166504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p6Fi7lyn/uGeuBie5GBvgAa3Gi1YW/kpjLBg0PGKlFE=;
        b=MDBoaYj3NStogoaMPX4uGN7zMhhaPnN470j6rSJyZTOM2+VraePACbFYSf3Q53TEBR
         ich85KCs7HkzEpMIg3SNaMxlYCWzmg8x3R0D85nrQxvXdzoOb7ZUiq+dP9tPw7zZkDM3
         Y7Ue2rU/q96Cx+h7MdLErqPIAtHwCZGNhOpSM24yrRyFLlyQbWO5YHm4QHr6njLNqO7K
         jMJ8Y2zCCy57gO0FRk1y+0Hg1MrIYKLvXDUwyHU7XnQtDH9m03ngk3ers7DbIdDhgGkc
         3d/zhvD5PCdp2HrHp+YuxSAcYrsJcjtuPHrwkuzP7Luh/pA7VwcY3T5ebWt78Wf7ahDm
         7ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561704; x=1788166504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6Fi7lyn/uGeuBie5GBvgAa3Gi1YW/kpjLBg0PGKlFE=;
        b=KjXs5yrhkLuD/YxWRHL5a53Xq3w4uX2ivGgbJe9bjUpEgLI+gPJKnZT5xd3+RUJxg/
         mpDjQubwx4lT5sapnlMlzjSxhWI4fMObekp/T6DgZf6jqIjdhLTmNioUquPYpln2GBR7
         6+W3bwGnHX5+f/CW6P7hbhpT9agKN5dkGCiARbgInTbc+Mh/U1YRdYapB8ds7vaupoTQ
         e8JYBxTpO5UpVEqFOpk/qUvZn/3iBHtZRiYVmo1h8w1VkQe4Nz5n+2FwAEX06oy/aEUg
         XLFkxIKfr28tdk8RriHT+YDMbKel1G8S/RuVG2daiwxCC9OFKdLMYj6O4tVrf9nA4Zkd
         uBig==
X-Forwarded-Encrypted: i=1; AHgh+RomIA9YVRzdXd/J6mTWBEWZQKn0yL0NgEbUwQ/K3A//1kajCGZlWfPvDtB24ZkHBWr4oez4XUmQSQX8@vger.kernel.org
X-Gm-Message-State: AFuF++n/Ij9IpG/oi+bI/6uPM6eGBWiGmh0Z2cpcTHmF45C8+cFldtuW
	BOIF0F/qw/O+kH+WiC0KVaTxiQZPOBcNW2IRtAs8v0wMlCVf67XOfe+pLtsW7l35dIWs6XJMCXz
	JKiwegIUxnUu9GaNuCa90Ft29bfEeHHpDcPFs2Fx/CPiEqZycP9egtabVF/p+hUTv
X-Gm-Gg: AR+sD10MdcBqsYWoVv2ong0Xo2CToFV2tVDcLJHYMbzmQs7Uc39jI+/xgM26DIGvVbm
	bN9a2hSU4oatPSxq3paJAWzPWRPo20tC5ZsOQCXhyN4i+04mKb9jn5ftaGFGeA5hOmjj2fJSola
	ZvshsEVc4nT0wGO0o6SXdmuWZgKbg9TS+nnllzvoN7vDqmgd/AGM0YBAi9AnadlFiZkhC/g0Z2H
	+llugeAxty2XjD2HFrmPUK/+0qUekny3sxQnE0wOiSxsNGdMfdq+N0dPv0LJ+OHJdtCdgdTwF7K
	Of4EBKPzPjhiw6+IbZf1mhEUVAGjc7pP/FRbmuMrVS7fcu7/UC+DqNDJNsPq6lt0EzxQ7SGnqIf
	TiyUGGEwfM3wwDb8=
X-Received: by 2002:a05:6102:849c:10b0:77b:f3c:2d74 with SMTP id ada2fe7eead31-77b0f3c2defmr4706082137.2.1787561703932;
        Mon, 24 Aug 2026 01:55:03 -0700 (PDT)
X-Received: by 2002:a05:6102:849c:10b0:77b:f3c:2d74 with SMTP id ada2fe7eead31-77b0f3c2defmr4706064137.2.1787561703372;
        Mon, 24 Aug 2026 01:55:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1abfa0sm7568717a12.20.2026.08.24.01.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:55:02 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:54:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <w2mcg6p7tu6vmv6533eqd6iegyerqmb2llcm7z7vlxinidpa5a@fz6tgbxmv26w>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
 <812d71fe-40e2-47c8-ac4c-ddb8a45f582d@oss.qualcomm.com>
 <306b2102-a7bf-4c29-b67c-df6ba5fbb7ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <306b2102-a7bf-4c29-b67c-df6ba5fbb7ee@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3B7DjkOKq4iSpCGA6q9UlQZwHwR2n-hJ
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8c06e9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K8JGY68o3Mja_1WIyfMA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX6ASHsOOyKqRC
 pu8OR5lY4rc25IdeuFPQzC6Botfw0+minP0gi1QzHVXHxF6c7TFewReFWoeJuAy6jTDyT1+ekZb
 FfegYr7mERMHLyntHOvSm6mjfuJwKT2V+qCPbnxMUAPK8j1tclfEVSG2o6n4r3bRMhqT0DVkVoQ
 Pb6gQjowr9oInM+v50DC7H7PMWFfpODpH0Ii4gLqWRUz0WvCCKDSD3CKx8lh+ZMzP3ivvBCV1BE
 WskFhjE1fn8vEesS91c8FBGg2yJGGDPc3STqoqT/3y10NCmWHbnORLOZW0g9WPW+wHNfaElHJs4
 qb1hZ1fw8UK5KcxWid9OBjq0/Qtd9prmJ1pyaDP/Dc2ENMSSPiYACInpXECU25vZ4zaC8BbY1oz
 q5xAqW/MFlfcmxU1sSZSvzXxgvbhNupU131UoMws6Y7tUGTX+/fzPxqglLAcDIuQpdAJsPzoTf5
 Jv+CBwlWm9+nJE/ITKg==
X-Proofpoint-GUID: 3B7DjkOKq4iSpCGA6q9UlQZwHwR2n-hJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfXxKYm8dE0o3Sq
 84jFdcCX+voumQiz9hgSjh8PheuILOjgS1BweWkq65BnQnS5QTFN1ATm39bflux+C4vqgHdgq3A
 iZfLoUFVhcN8TL9vxgzelXyskeihifM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240077

On 26-08-24 11:12:53, Rajendra Nayak wrote:
> 
> 
> On 8/21/2026 4:04 PM, Pankaj Patil wrote:
> > On 8/17/2026 3:40 PM, Konrad Dybcio wrote:
> > > On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > > > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> > > > > The suggestion of having the CX power domain tied up to the GCC
> > > > > controller started here:
> > > > > 
> > > > > https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> > > > > 
> > > > > and then, for Glymur, it has been brought up here as well:
> > > > > 
> > > > > https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> > > > > 
> > > > > These plus a discussion off-list led to this patchset being done.
> > > > > 
> > > > 
> > > > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > > > Reproducible on latest tag next-20260813 as well
> > > 
> > > Yes and the ""fix"" is to disable the GPU nodes because the custom
> > > runtime pm dance done in the gxclkctl driver keeps a vote online
> > > 
> > > That should be fixed instead
> > > 
> > > FWIW ath12k is causing some issues for me in this regard too..
> > > 
> > > Konrad
> > 
> > There's no need to disable gpu nodes for cx collapse on s2idle, I can reach cx
> > collapse after disabling crypto, camcc and evacc nodes along with reverting
> > this series, Specifically arm64: dts: qcom: glymur: Add CX power domain to GCC
> > Can you share the steps to reproduce? Are you running additional steps before
> > triggering suspend?
> 
> GCC clock driver on Glymur has gcc_disp_hf_axi_clk marked as
> CLK_IS_CRITICAL, doesn't that mean we will always have a vote on CX
> with this patch?

Marking a clock as critical does not imply holding a vote on CX here.

CLK_IS_CRITICAL only prevents CCF from gating the clock through the normal
clock disable path. It does not hold a runtime PM reference on the GCC
device, and therefore does not by itself keep CX on.

Once the consumers have been suspended, GCC itself can be suspended and CX
can collapse. At that point the critical clock may stop ticking as a
consequence of the controller/domain being powered down, without affecting
any active consumers.
