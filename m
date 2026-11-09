Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794236770;
	b=Kgjoas/iNOKmPXhWZvpc+yMunkFh4Am/E8QUWCRolMYMMIw91+KCEkoLHQfgGHBI2w7i
	 CeYocX5drah9tJ8gJzeisA5Wo4X1JEq/llfQ8ybDc9H9tG3lTN0TIKL1GQxvSPly2scEz
	 X7eyIuSxGWDbJOv28yOOBzLma82vEn41k3K6lxCKCPXjSf+IQoxalJ9zXpO7YWldgFmtJ
	 IDkJsrw5mVrsZb5loc/fOXkLpfvji5uUNpU+l3OUH2qhsGHnGRKjLlDDAwu2aNBoau4ig
	 7tmAgGAFLbxqEEHmNqS8ey8+sqTRF4h+rCHuO6Zq7iFIG/GXB0PmBlKE46SHUt81jNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
	b=u3UArZh+ZBR3tMMiYOp19s1V3aIrvSWLBAuo2Yv0TssSkOqcJl+8TjPnMJRM2SR0PJXJ
	 S66TXyPPN9cykxoF38ANpUL8gVLALZ3x6MaV7EkL6CHb4zJLVJoMh3juqTWE62EpYRBYF
	 LU5DO0ienF9NRotay2uhILsHDo5egLl2eqgHDo3HOKV7DxAw94p8X+vRv8af4Sou0c2Hu
	 8+fczImus/AR4emgkPABG171EBiKlBAmesRct7HerNIayYhROPwDKYiMiOsV8jeeRZtjr
	 vAW9zlTc5U6M4iLqQN3kbqkQGlqJGIfrGepXWBngVS219SpMR22x5MSI87etWMOHcGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTuBisDp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFPP7ujN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1AF606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A1AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTuBisDp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFPP7ujN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFFI9971365
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 15:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=; b=mTuBisDpOzs/Pqni
	WxP8gaoajYwRE8TXaHfk1KU1nwzlAlbBKnoKLKw+p5iynqnJ8O5WCk3eFZzB37pz
	KCl4Gn+XmIcIioE+D2koa6f75VEqliU2VEoSwD7nzxCoWzsAxTZSfmBks65GF6L/
	7mk3N5SO+YWrv2MZch5sWt+/82q1tHCBtsLSrkIA3gjWzsVL0ESBPKgk+Nc5UD8t
	SRmJRnkaQfASQa8mUNX9lvEhKtJpGnosNe4+eDCn6CbVJgi5fk1VOlg9OP2UVh3m
	T5X2KcMG9fYTD1A7FoNheWHcqJNNWt8CJsFVrK9AU+qExEpbNWritCf8R2sLNXS7
	QU5RMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3pqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:06:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so1018447a12.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794236768; cv=none;
        d=google.com; s=arc-20260327;
        b=dJ9w+yAFlfSThuyNWA9ynCwEvgvyPEDQj5tHgbsPDtEe3C5LbucS0MHiymy7KdvdjU
         jYK1k3b4ppgyLN8x4MumrMi2doh0nnnjZI0+kW9v5R64A2l9pIILIqA2JPWmmEvuAi8H
         jOSl42ezGk6IUDm8idKFLzU8I0FrYzFd42CaHkR7y171BonfKQmm+Ttbp7lHGKzPC3tM
         F5mgAACTYuyhzMSvM8nRuw80WiVUUndxPLYth9KGm+IN/N4zh9Ad5CciD7AKeAbEWUrm
         cVz32/aMG0VDrfRhhynf53DasPjNEyGRWHEjAo6OWh0RehK9h0S+6of+gMzthiJMWp8d
         HQNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
        fh=vmo6I40CU047Vu1BF18pDzlZTdeTIPOvkQjWzwxJC44=;
        b=rbpBCuOFT9RGTd8p9Kqe/zsjFMYklMVKYhQV4KqgiuhWnZyyRc4ZZ/k//Y9UYl4Zqb
         7vRxkMxn02/LGCNwOLtH3xd+ky8p/pCTrwAAWIzM9ovETqscoPXLbeLjBGzs4UDbSsGy
         r6PfOvo/10MZiRDmM80vlqhb17dXeUplIBbronEfy16/xBSL7Rz19forBII7eg0ZAcbI
         J2jueA29bkxMpB4bCJyVZ1sxOykBZnCNgt0rwfFjvBQSxt4N3lYvMYanHqmhxO7S9mWJ
         JpF1CsizPOtG91cyiaFY+61JtR8zTINCxyFckLnti2riH4Ldx+atafyp9ZKs3CjY/qT2
         WMrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236768; x=1794841568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
        b=MFPP7ujNg/vMpIHHh51wPKSs7Nf2d5v3fTZd49lDI3A7uXPRuU7eyga0QO/fEexKlu
         p7PXE3pRqjpoYWGH9TEuKLp5hGShyVT3mi2NuHPDJmbQ7MsQXcsG4urybz4iyN02lfdi
         1Oqz7L5oABFFfVyw3hko3FAIwwL8qH18CsMll9kvP2P9tvW662Xz0ERvhF2asGBot7hH
         bWUztO3eP8EnymbdrIecB9At6aGLejM2d433vUv1Ek10iwRT36XEhha+2+g2oVIbRYjP
         sK8wIAogiBUOrMgrRRP8ggonQNFpXU7lM/JvNP6MouQ7VK5yWdf5az3Q+FbOCuAPcVXh
         DKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236768; x=1794841568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KArGU3dbS/GT7fx8YVHMeJYlc6IFiFJjR49nKEqFMmI=;
        b=CfsbgkLnLooMZKuWy0C4lxNE/7pC96p61fxSzE+0ro556bFEW3CInLBWeUKl02bKpA
         s5oXPS9KLygf5bbj1BODSXQ2VmjbcS3nnT42zO8QxzRyx5Wn4DFQpTvMiRL/G8SUScfC
         MNRmvIbM7rhxPljxOmvkyItVN2ZvU3C6V41fnWyZDogccP4BaRrg9x3ESPRWASY9Usl+
         6mnmblBd0XH8Aq8knPd4u6CSm4x3VcArukaly2wh5RWC1egyoDobH4X3/cVomhYXyHOM
         GZbR9VbAjAIOXU+znYkUKDEm0DFjFVwCNK0s4tn8m+GoRMRL1lQAktfBjDxwIBpkBAHb
         UkjQ==
X-Forwarded-Encrypted: i=1; AL+hErEW+yaSyGcFnfZ5jFKcReQvjo6w3q54/AU43WbjEA9FkjfrwKXFGbfRM1bpokNMSf/dCY7HuRY1LeFf@vger.kernel.org
X-Gm-Message-State: APuU4Z9ASJHqYe6fjFzHh+HJKTl/Yuayc1PyEMBTlfk/cBfEk892gqUN
	tqCoqhKwjHgQmKBpZHSitfQbdILsmhyVqKkLjWqfKS5199O27D3xvKQPIVPmZZhIBO0ac09R9A3
	tARG/gtptRIoGO8ya8LZ5VarqW/61UlktC0WLG7Lq/+QMKmKcri20b3rj5lAET0RhuVNA2ENOYB
	IpWg5cWxd6Gl+j9zGeWublKxUn2aTlQKUZD5Z6zRE=
X-Gm-Gg: AYBFou1CPYTCpuzfu9v4/2naRo8SE5qWjmkChOYrL8+DnjviFjBCW/Bwh1DDtoxVt/+
	yl+vuCZbzYGYxGVz/Y/rIK5MdoWuhHryptkZFeutUz3kSni7SPjA7TF3y9fFx3ORph02CbNWJlH
	4h/EsYg5Rnk7WPBSDhGfcJamqIV1V4MMdqNBhnXufuKdw1EgCg/gir57DtjQ==
X-Received: by 2002:a05:6a21:e081:b0:3de:456a:6e07 with SMTP id adf61e73a8af0-3eed36563c1mr4958013637.46.1794236767686;
        Mon, 09 Nov 2026 07:06:07 -0800 (PST)
X-Received: by 2002:a05:6a21:e081:b0:3de:456a:6e07 with SMTP id
 adf61e73a8af0-3eed36563c1mr4957967637.46.1794236767237; Mon, 09 Nov 2026
 07:06:07 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla> <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
 <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
 <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com>
 <20261009-skilled-mature-bittern-2206fc@sudeepholla> <CAPx+jO87gkTumF=Tg=UPWpJO6O-CRF4njT2KxQ3f=4nF5m7GiQ@mail.gmail.com>
 <20261014-prudent-mini-duck-377cb6@sudeepholla> <CAPx+jO_BOwbKeRytBezm+piLhb8Z5N2eQO=LRwBQoSZ3kXOpwQ@mail.gmail.com>
 <20261028-imported-pistachio-unicorn-2ecfec@sudeepholla>
In-Reply-To: <20261028-imported-pistachio-unicorn-2ecfec@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:05:56 +0100
X-Gm-Features: AclHuK8jpxK3ADXusNa2gKWHm_wiTVU05IoTbWbQE5kB1SpSxHfIgN3YPGrgsMc
Message-ID: <CAPx+jO-0Vmah=2mewp-kspV7Nqr+Ay_nnO9fTFB_TMbOoHJp5Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfXyO4wBE5W4/pn
 zxlyAPPmBf5O0tiDft5mGfWO3/FV3o4Pm7fJoSP4Ied1qIP4FugUisdRBXqzOd26bnVGFAaP5dq
 zH+i4HLdlzccf6DRew20uejW6xmd1oU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX/6h5u7a1quZc
 LdPGLPglxgJ3qc5hDYXQGWm9HpDQnqDd8mdRsOJvsMdvAb6/PnS2a+Ojny1nGMUlYD09dQ+Yhyb
 ai+4nfZcJb1D3Gin57yoVH9pyLxpG8+AvY3m5Fcb4RL5hvjxLTBnS3YFAYHT0vcMuj1xzq7gp0D
 pQLkGwv3S+/Mn6ejBZBrsQ51RSnKSFtbDGBroJZdw2azR6htn2Z9FSk9XqTUMDwbXO6tTscXxO4
 DqADn/AKzrOapbuklCWke2QJWfc+DdYGuWCQAx2oTUJaXq4oYGLEoAGR+kQWDzHeDnGo+6m3Fsc
 8h50/vWmsHI2UH45VaM+oQevMw47W6vDbsLwQFD3HP7bi6u4ulqfpHI81odtCCz/ZZXjYx85Gzi
 f4uJdiVGLXehIJUv8ZsZxlsMZIpjKrKpyvPeK7yAmh5O8/PyPCjWEjc+P2wXQuQEQ69Iilhfin9
 6+ti9VzgavHvG5FzjYA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1e160 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=dNvpDo67dldnF-GfnbgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 8hzMSHpsL-x2YyyXNRV0UTgQx1tYa2C0
X-Proofpoint-ORIG-GUID: 8hzMSHpsL-x2YyyXNRV0UTgQx1tYa2C0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090060

On Wed, Oct 28, 2026 at 12:48=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.=
org> wrote:
>
> On Wed, Oct 28, 2026 at 11:59:58AM +0100, Ulf Hansson wrote:
> > On Wed, Oct 14, 2026 at 9:12=E2=80=AFPM Sudeep Holla <sudeep.holla@kern=
el.org> wrote:
> > >
> > > On Tue, Oct 13, 2026 at 12:11:36PM +0200, Ulf Hansson wrote:
> > > > On Fri, Oct 9, 2026 at 5:27=E2=80=AFPM Sudeep Holla <sudeep.holla@k=
ernel.org> wrote:
> > > > >
> > > > > On Fri, Oct 09, 2026 at 04:26:38PM +0200, Ulf Hansson wrote:
> > >
> > > [...]
> > >
> > > > > > If that's the case, besides that the cluster PM domain topology=
 must
> > > > > > be modelled accordingly, the display device should be hooked up=
 to the
> > > > > > cluster PM domain it belongs to.
> > > > > >
> > > > >
> > > > > Ah, I thought that's the way the whole domain-idle was modelled a=
s we
> > > > > started this OSI discussion a decade ago with an example of CPU c=
lusters
> > > > > sharing power domains with some other devices. I am surprised if =
that is
> > > > > not the case already =F0=9F=99=81.
> > > >
> > > > It works fine today, I was just trying to explain how it works,
> > > > considering the use case that you brought up.
> > > >
> > >
> > > Ah OK, good to hear. For once, it sounded like that's not the case. M=
y bad.
> > >
> > > > >
> > > > > > Beyond that, it's the corresponding display driver that becomes
> > > > > > responsible for what should happen during system suspend. If th=
e
> > > > > > screen needs to stay on it may need to call device_set_awake_pa=
th()
> > > > > > for the display device - unless it's a decision for user space =
that
> > > > > > can control the behaviour for the display device via its sysfs =
node.
> > > > > > If things are managed accordingly, genpd_finish_suspend() may d=
ecide
> > > > > > to keep the corresponding PM domain powered on during system su=
spend.
> > > > > >
> > > > >
> > > > > But the s2idle and s2ram anyways suspends all the devices, so the=
y need
> > > > > to vote in for the power domains to be turned off. If they are su=
pposed
> > > > > to stay on, the system enters the state it can based on the other=
 votes.
> > > > >
> > > > > > The above said, $subject patch doesn't change any of this. It o=
nly
> > > > > > allows us to use more states (deeper), which are limited to sys=
tem
> > > > > > suspend (s2idle).
> > > > > >
> > > > >
> > > > > Still not convinced, if all devices are plugged in to the power d=
omain
> > > > > hierarchy correctly and the domain-idle states represent or carri=
es
> > > > > the entire system power domain topology, we shouldn't need this e=
xtra
> > > > > information. Having it make cause issues when it conflicts with t=
he
> > > > > topology information IMO.
> > > >
> > > > No, it's still not sufficient to model the power domain hierarchy c=
orrectly.
> > > >
> > > > These "system states" are special since they require additional
> > > > coordination in FW/HW, to take into account votes not directly
> > > > controlled by Linux.
> > > >
> > >
> > > But if Linux doesn't control, some other entity would vote and until =
then
> > > the system shouldn't enter that state. Without knowing that it is sys=
tem
> > > state, will the kernel be unable to choose that state as it hidden vo=
te
> > > is invisible/not tracked ? I trying to understand why if Linux choose=
s
> > > that system level state as part of idle loop, the platform can't down=
grade
> > > if all the voting requirements are not met. I am struggling with that
> > > and want to make sure we are not working around a broken firmware.
> >
> > For OSI, all the FW would be able to do is to return an error. But
> > that doesn't prevent Linux from trying the same idle state again and
> > again.
> >
>
> Now I understood the requirement much better. The core issue with OSI is
> that it fails unless the platform downgrades special system states to
> non-system states during routine CPUIdle paths.
>
> This leaves us with two directions for OSI:
> 1. Firmware Resolution: Handle state transitions entirely in firmware.
> 2. OS Intervention: Enforce the handling via the OS.
>
> Though I personally prefer (1), I don't have strong arguments against (2)
> now that you made me understand the requirement. Sorry for taking time,
> but mentally I was assuming (1) even for OSI until your above response.
>
> Since PC mode relies on the firmware to manage these states natively, thi=
s
> binding isn't required for it. Therefore, Could we restrict this specific
> binding exclusively to OSI implementations ?

I guess we could, but that seems rather messy. According to earlier
discussions, if I recall correctly, we deliberately avoided OSI
specific DT bindings/properties, since support for OSI mode should be
detected through the FW.

Also note that the domain-idle-state DT bindings
(Documentation/devicetree/bindings/power/domain-idle-state.yaml) are
generic and used by RISC-V SBI as well.

Kind regards
Uffe
