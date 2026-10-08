Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328C2C87F
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432815; cv=pass; b=sT4WMepaSaUU1YJJrTI0W7uwcrlcQbuA8PJD+pzVVFmpZKMb4TIzDWU/sdV88AG++kiUqgLsVkMOUBFNjlyQfMitM6WlFc7oO8H9Gxa+2Pw5yzQXWG0l13j5qJRgHKpYHnqBr2X3D9mcfr6Bn29/GVPdC1p4IDojJNOJf9uou9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432815; c=relaxed/simple;
	bh=7n8n5op5cfw35RUI8xfY6ZFnQUUxNNoloaYlLatrMvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFzAGzRS3ECy0vDSdHLCWk1F8csOqWQ5JqD+HOlTkHbkgqbQrM0ex0943xBfKDCq22ShSZbSnqkdZ/xjwEFq2VhvXk9J1+aYzh7UukKAtbQrX3P/LH122SwDh4GolJltJHKn0cLuv3EcQ/Ru05fUWXV0Olv8bSCJ9x24MUWXeA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prJP00kj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdNda9TY; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prJP00kj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdNda9TY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BnXZ1752716
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 04:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=; b=prJP00kjzEXd8a0/
	+BH0YUhaZ83tX1bSGFz9j3BKLxAox5jjjG3dcT1WklGPwUY1PddfnfOKuwJA8bU4
	QFNOpZOgDozqIkX4ooV+2Wryc7+23YEqpIr1i90Fr36RohY06Juc8Q7cc1r79/zj
	eWOKNWV52TH2LJQdws1xqmzL25cd+NmX92gmYz/vArAeo9PQV8ME4qe9UTWMn+XF
	2yomndHqUEMVFYNgfiK/DTh4UDijVGgRD7WKBY9337b/VPJtYILM9hQSGzoeQlVj
	Uot5k/KNgIkKtVOjUEP9cuq/fwZNbzsTS92+AljK/1a2CIo/Qe6uFtDsL5sW5ZiD
	D1dyJw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2s5q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 04:13:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e605efae40so18827695ad.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 21:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791432812; cv=none;
        d=google.com; s=arc-20260327;
        b=X39Xuq5cI/HR0GlvtekMr0qmomLm0Q36LZiiXPBPwGm9HxNPS2Wv6xsPnpAalGouAd
         44iWXHfPyO4z1ekCPcGMw4odSa2djNdk+48vD1iuNWH6eTIXCf7ZcxhwPAclmqIIf9On
         yLjd8AA4a0WEshbg0YQMVR3JvlnR5350wV28Yff7iLvXeZo3fm1elkqeT2WLEIPKXhw2
         je0VUjliLwKBj+WGgXrDtHB6YGwV/BZVI1QYNS5LhmRZwzBJjTNBkrmldLUnI+QAqHYn
         c5jTIn9+voj+d1oWvTtCRLoEnhA/DRo5nkIswIm/Qp3cf77ckbeXVYS6Et0uhWNnpQSv
         wfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=;
        fh=brcxgPHblx57Fnm7wRJaxZoOw+iDmN14CmsFlKzJFy4=;
        b=KMqXiEYpLpiS/WMzH8begY4hbQDi6n3RwFbrEWaxzZiKkxAIXYZLIHpK6GYzmtueDL
         XM6s54zE6Gw7GlY0Uy75bFhGj6As/ITwoQ3DyfS3YXfl3vbSzQezk1zFUOMAOr6AdxzT
         8kWpIG6hhlyCBsSM9BxXxCZ2hk3ZJ/X08QpL9LWKKzILUdKUBM2xqSEkBn8WO40PyaIW
         qdtVbhNXk/kI53NijdWwmWB1G8vHSZfDbhmCA8vVZkEyvE+RLdBJFjr56qhNBA5HfnrC
         ufl+SqyKTh/ffXAcVBQL3yVjX8KvUbu+mrQpp1Wr+dMclmpDbzuLK5XTUSiQXFkVuOVX
         Ux+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791432812; x=1792037612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=;
        b=TdNda9TYs/H9wnd6rL7daIb4MX+cRAf80KQcM1sgZlr6m026aFvoVi4/UYcwyjSAqP
         wzHEnWZQseuuPKMIkmazA69LslSPuAX99r75P/Lyi9r+v1PcrP1FReKjtuUpEsLrK4B1
         tNIJ8eJrAGD/3a823hS4EpoBaLDaFg4/EcvjkGA3f7AIQBJjN1xaMfuji+SPCDFSIiwp
         ZOAVZgkR4hiBn+kQzvoz7ajK5uzNGk//xVzApuuTVYkz7kdYK9r9ED9hCSxlnU2Y4oMd
         WIfaWlbe9FxBYWR1Kodm8YIkqpdSc1+Bxp/cCCPalJ+TOBHV+GI34k0vzeIRUwjnA3ke
         J/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432812; x=1792037612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nt2x+jEs12Lf5eX1DXl9eLI48xHiZT3l2Oh8LjkTB8Q=;
        b=xTYlbhSjOjGSDvwKRFB5Y+oq6xjLvhA5oB9J4IZyt+eHIYdKlBeg3TyXLH2pRc69NN
         8ctGCYqTTcbbLmvuqryr+wHLv/33pitDj80aPwm1NdwpzPaoGKXb24oL7jXerd8nMOf4
         xFbP9QA07X4rhOyhM4SVbUFsgzEPVCzz72atS+XmPttyEcryYMImcXNzV0l4rWtSeJZN
         5fKBVptVDKqUZ77Rh8WbyNj17slnUS/7c+KkBKCG+A9iL4R/Lg0S+Nq8AuqdHSriGhAS
         ZA62jDSWFszNWkTBmyrOkTsL0OXtWOd+wBrSvdDL27U0hLjdIeju0MQcSprM/gS5zh1D
         QT9g==
X-Forwarded-Encrypted: i=1; AKwUvByht76SRnZoU/jr9kixhZQMLijjZuKmJS1d8u2wmY7CfZREJJIyGGkg3cy8tf9YjQSnZ6s06Ro+fqjk@vger.kernel.org
X-Gm-Message-State: AFq9FYIIf1ifFxATGPMnPJis90V4nwN67SrGD2GnY/vxYYkOEU1LHTVf
	DwtkfHrNBrtTFD9ab57PBWfSFpbsx6zRTipo7ChQ42ioXhTE7yPqGp88WMrxfGkUoqHFU9Qb2vb
	GKfUJjsYfku/ybhoNMQIFa/+qfnHfeV6QsnMXwPZmrZ+EQCLnz2qQVirOPFdE846JaPndiwb2U3
	xlRc0y6B2cRo8ASCiNpV3DiwXlN3VlAkVoAoZ1aPY=
X-Gm-Gg: AYBFou0ByipYCzmQ4myFCqTaNBGQE88IBt7HCxgWZMpqwgmRwS2mLiNb9VRAipIKpBH
	Ydy63REJ/CgaBU8fdDUT8W7BTjEntwAZczG61zJLI3wfRtH41H0zI5IXMnL0tOn8TLrnpJ/KYHs
	hSUwf7UF7CUEwWugZ0s4nuaqFTiBUFIpenK/spB98ASuPOCf/LuSoEJDcwfQ==
X-Received: by 2002:a17:903:388b:b0:2dd:76b1:34f0 with SMTP id d9443c01a7336-2e6003b68e7mr37860475ad.11.1791432811895;
        Wed, 07 Oct 2026 21:13:31 -0700 (PDT)
X-Received: by 2002:a17:903:388b:b0:2dd:76b1:34f0 with SMTP id
 d9443c01a7336-2e6003b68e7mr37860195ad.11.1791432811391; Wed, 07 Oct 2026
 21:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com>
 <20260928-steel-hornet-of-kindness-aa5e2f@quoll> <CAFkd8hs6H-WT6C2Nzns2jB1yHq1CfODijAX1VbMxUUAe7zH6Rg@mail.gmail.com>
 <e4a07d79-199b-4998-ae2d-a9e8b91a228c@kernel.org>
In-Reply-To: <e4a07d79-199b-4998-ae2d-a9e8b91a228c@kernel.org>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:13:20 +0800
X-Gm-Features: AclHuK8QBXqkiOqYuICecJ7KFfILuZyxlgsMgUrPOb-9hebjAdLP4OyLrmMCzjI
Message-ID: <CAFkd8htKJO6rd4EnfjwZ7mANU4n18WMtBha=ZKS+UoF-4gT4ng@mail.gmail.com>
Subject: Re: [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac7186c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SvoBQ3C05wZ_be5UkMcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: kY2Pc42bvruDhX5KFiBortIg-7JLISDc
X-Proofpoint-ORIG-GUID: kY2Pc42bvruDhX5KFiBortIg-7JLISDc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxNiBTYWx0ZWRfXzgtVT2BL/c2w
 lOdhcQlKnUkSaSkWC/O8Jb0E2r9AFW6rtl86iTr41X/iMQqaFRglaCRROw5LPHi9vxjUU1hzWiN
 xpVlGcnlv8zk0HvNTfWXeZinFtT+oPk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxNiBTYWx0ZWRfX+KNN6iRX2x+M
 TBRsoCC/kF4HqF6TsGF0Y0yZ1xSCmeoM+qouJjIJth0dS1z+FLMgPNtHVoNwQBCzJ0Wcup5bVm0
 6WBoh/7c6paovXotL0vGoafCj6FesVczHqpBufs7KiHyHHrSmlgzm/ZW/QADJvoKPXHeUPgtqHO
 pH1bnLCENTo7gGHM3j+YlgEUlwY906334kNz0cy+nbePGfWXBlSLdv0sDzDCC6lsznusfV+7r/J
 2koFQyrhDAzMcnME9ocov5WeeJHTpni2RhhUXoF1j12i3hDF6A9AgQSg0WUBjw7nypkK/cEXSHz
 f4spfzJQe4dggRNN4axmeYW5pTjDM95TJnpuvodTOuDDAW7WRiSKJ3ddhT9j4m+xiMLXhtMrAev
 oBBeoiM3i+IcOboxxplVwEtNihgc2kr8AnnK4leKyVsK5uo00mgtab3/6AbhjqmJy4FgGrvGU4q
 a0U/dOfbXQ8YHgJNTig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080016

On Wed, Sep 30, 2026 at 1:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 29/09/2026 12:49, Zhangfei Gao wrote:
> > Hi, Krzysztof
> >
> > On Mon, Sep 28, 2026 at 6:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Wed, Sep 23, 2026 at 04:58:03PM +0800, Zhangfei Gao wrote:
> >>> On Wed, Sep 23, 2026 at 8:04=E2=80=AFAM Mohd Ayaan Anwar
> >>> <mohd.anwar@oss.qualcomm.com> wrote:
> >>>>
> >>>> This series adds support for the Ethernet SerDes found on the Qualco=
mm
> >>>> Nord SoC.
> >>>>
> >>>> Nord uses a QMP v7 SerDes block, which is an updated version of the
> >>>> SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The drive=
r
> >>>> currently supports the 1.25 Gbaud and 3.125 Gbaud configurations use=
d by
> >>>> SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the Ser=
Des
> >>>> to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
> >>>>
> >>>> The series can be broadly divided into three parts:
> >>>>
> >>>>   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
> >>>>   2. Prepare the driver for PHY modes which require different SerDes
> >>>>      programming and readiness checks. Existing SA8775P behaviour is
> >>>>      unchanged.
> >>>>   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
> >>>>      sequence and readiness checks required for USXGMII and 10GBASE-=
R.
> >>>>
> >>>> The changes have been tested on the Nord Ride SX platform, which has=
 a
> >>>> MV-Q6223 switch, running in fixed link USXGMII 10G mode.
> >>>>
> >>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>> ---
> >>>> Mohd Ayaan Anwar (3):
> >>>>       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compa=
tible
> >>>>       phy: qcom: sgmii-eth: prepare for additional PHY modes
> >>>>       phy: qcom: sgmii-eth: add Nord USXGMII support
> >>>>
> >>>>  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
> >>>>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
> >>>>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 ++++++++++=
++++++++---
> >>>>  5 files changed, 219 insertions(+), 24 deletions(-)
> >>>> ---
> >>>> base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
> >>>> change-id: 20260923-nord_ethernet_serdes-c486f715f383
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>>
> >>>
> >>> Good Job=EF=BC=8C
> >>>
> >>> Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> >>
> >> This has to stop.
> >>
> >> Why again adding fake testing to the bindings? You cannot reply twice?
> > Reply twice since I thought they are two different patch set, one is ph=
y,
>
> You don't even try to understand the problem.
>
> > the other is net, while net maintainer said that is too ealry for rfc.
> >
> > The tested branch is
> > https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23 ( and
> > 9.24-eth), and may keep testing for each cycle.
> > contianing dts, phy, net and all required patchset, assuming one
> > integrated branch will be easier for interal track.
> > The dts will be send later.
> > Testing hardware is ride and rrd.
> >
>
> Explain HOW did you test the bindings in terms of Linux kernel testing.
>
> Then explain WHY you cannot give the tag only to appropriate places,
> instead of blanket one.

Oh, understand now.

I only performed hardware runtime testing,
which did not validate the binding itself.

I should have provided the Tested-by tag only for the driver patches exerci=
sed,
rather than applying it to the entire series.

I will run and report dt_binding_check separately for binding patches,
and dtbs_check for the corresponding DTS patches.

Thanks for the guidance, and sorry for the confusion.

Thanks
