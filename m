Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEB35013A4
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678997; cv=pass; b=U/rjL9op7JXLnXF7/l7b6HCKnwr6hI2GskGeUrVDnHKqdJ1BAFNkyC4V1w7cINoYs1/FYMs26SbTYYUDnawvmDDxm7tHTx6kUxBn7+v9CNw7gwVyE4Glb/V1dQFTX6Rfn5oCXyxYtRvxw5IN+m5aTSYQUiCeONap72nMU7yaiPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678997; c=relaxed/simple;
	bh=jusFXHQSwUzPgCyWA+EDUN4R6SZS9ccq8vL5Y7+Dcrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHD75zZt7Vax6YR5i2UaMBB7uaPiLbOZQDUPQmONC1IO68J3BBLvbNAqxsIYic981RnZAQtoopEryo6/JLxN81wHIJqu5/0INYEYTv1Va+3sBpzCq4Ua5o7IJvfishExnssY1QLs5XiSqqYjeBRjv3nO/oigRXuaVxz9zbdfTxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZw8GiML; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6aodkQ8; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZw8GiML";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6aodkQ8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAioj93655195
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=; b=pZw8GiML1qPDPMG5
	zudI4T4YM5tutdt73UHz/FWZPCeXfJuzD0D+1vH8Qo5cGNTtiX2l38i4M87uGuNa
	i2uhFjwGrtNw5AwBYbjvavIJy6VmWAGu5E2+r0LK64WSKWkhGay+M+UaRcDnH4OJ
	kj7RtBfnzPWocfT+Sllc8cPinbhkF8TIeDtgRbEIZaV1HYQEok6r0E0ttsjTs6+9
	9lzsU+9Ike3iqnqTqLaqPPiZAXKGo5S/fJ1NOyPlaYyZWYOqpLcX3ApIJc7F5yhT
	oyQFdwrjnNUXYJtAtSdQGxfCqD4M9dNCQlH+X5IWRi+1qLHLG3Kjv361v9EB/kin
	+e8hgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1g2gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:49:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3734d06dso40490755ad.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790678985; cv=none;
        d=google.com; s=arc-20260327;
        b=BbOkd1VlVMoJI39Kon6fWALjoWY9If1dlGcqy6RsQ6jys2YfYlEED2XJiMCBC0p2Fz
         YB8N19As/H1a9Aogfz3LjE7mVBL2yNI7gJJSbOljS5C5GhELhdAg+gX1cxCLrG0JSwfr
         vnjDFMIxaH3x/KeGiLbYgatABJ2enybKTusVbhx/FI2FOiMuNoR+FtmI3xwhGQBW5qYd
         wDBqqK52YaRw+tLemR9XK46tjpj9W3G+ROVpEuWxSQu+YA5skn8Mg6ZZ/zTkFCV/iadA
         2qhV/D6sHIS9srLAEeBSMmWD5nL9cV9qxiV7PP5PfSe7opUlpDXEFd3qiiSIwLXfSYty
         n2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=;
        fh=qyl6MQ6RdTR39rweL5yorJz4ILoADaqOCW/4hNMT5gg=;
        b=lgICuT6x79MssNfPs6R7tC8+4pWLp6lmhB1dOpuLtdTZOxWyhh5CfQbf//+ESEDkJx
         /BbsskJWEzKPM+YXJiAYI4bs3+JilbAy6T5XwB8yFd+fButulDEpkxqWOWp8FJljdj0A
         MnTgmTkn+VwFGkoOFzT3zaxN5HCVfV19+qlNacCn0XFg9HA/y5ECxViYuwPuun7UpNBc
         CWfnZidU30WfayA7ywmt6cpz99+7ttjPJXoZGWbxL2YmQv0czvcNPX0rbZ99pmIBcgos
         6Z472lJeAVZAxUm0dL5+1pvELhRVdyzYzvq7L9ZKbN3UXmMRfSm37TQqnrv9yTAv5ngj
         zRzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790678985; x=1791283785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=;
        b=E6aodkQ8wUIcr1wK1BZudsL1lp32m9PKLTzilkgA2Ez3UDOitOQjLbOtlfPKOkQn7g
         nzWRKg42ad6NesEHEy0xVoX/PhVoM+uWIs+JEfZJRpKfVGDJzmm/3jc7wGRqIFV0bbWz
         frgNF6gw4sbkAnCcMDX7outD/K4FltSqbOAPivskebx/JRT5Q6U/cuJ779Kn11gKj4jB
         ZQnSnmqUFBWfW5hfvxR7GJw9Wtj3A9j5Po5g/GLfcdkXPHs6nvzc+3cxqnE+9YfddZWk
         tHaJha3B3WG0xsUhV9TxZmJhjqVBlWZrQIAeGNrrF7D1/58/+Jtgnsg5BU7lSqiQ7y6P
         sVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790678985; x=1791283785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGYRi0hqFtpQeL566b6/F5werlBt/r9sl8eXWumcCs8=;
        b=CCSYhCN1Pf5R+iOvwRmKZU3/no/9go0LbeY6VFCWPpEHrnaoHvAcy4tgik8MUU7Jcr
         tMILkzx+D2aYAtwlJdbarv4inZvjuaejzLdAGcnhGeY0pb6HbX/2iWqdcB1dislaC7vc
         v7eeQ6qzGnHkXYHDM8XmsWQ6t90F9VSAymzTZfM/IsvolIGtPpt+q9LN9Ue6vUw6bd7J
         U4MmSwMwAkxLSVcxB/s+w8BkSQM8sEsSKU5Ist3efsRfwRz0GJjSC/ha7EuEqkFce6kj
         9NYdvrFJSqvAY4USL6WV9N+VUFQhc00sFX3SbIFTjX+hg2ZPFCsZkGbukUEgNhsnlZpt
         Lv+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlNO1A5I4dBoEfWldQghEpc2aH013KCEfmYwjB9TluJFYNML+xhYNdT8jybC5oztQENXuQ+o2uz7WF@vger.kernel.org
X-Gm-Message-State: AFq9FYIc7MBRdlbU8VRZaGXFhsicOleSupXfou/zdT7ZuASzPgoZjKu4
	GXJKOYyh8AiicXiMJltSkJwBEjwX0tT//m3WnOvh+5UDbQZfCAL0zwclIKpC4iKCGdWKLltnwZc
	Yk00YwdS4JGdeiM4TjEOq76KPAO7qi0tSuAyT7G+huaT5/LPC6lES7umXHYN/xdYHal+ear8Eo/
	2QgXChC1HIr43Inhnm0F86HwkDoPlXuT3nENxnhd4l9CNB2CXNew==
X-Gm-Gg: AYBFou3Xp2rAHb/zXHt3KkfpZ6Tg9Ja5gazr5iXZjeGxuCjHPHPCxGPT4mMOk6CDYtB
	aWSy3Vf2i43AyyhjRiddyPI+89g7/MCwSh/7khbO4BUYMyI7kr0ajMHX+QtUSEcn/XbfMU4LCai
	k/qfpLPPW+kaE+huTJpDXdP5ldC2BsBtSQ68FLRjECSfN21T6v/8KHRGJ0zQ==
X-Received: by 2002:a17:90b:4c4c:b0:3a0:c135:3e5e with SMTP id 98e67ed59e1d1-3a0c1355d67mr10311394a91.27.1790678985385;
        Tue, 29 Sep 2026 03:49:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:3a0:c135:3e5e with SMTP id
 98e67ed59e1d1-3a0c1355d67mr10311373a91.27.1790678984858; Tue, 29 Sep 2026
 03:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <CAFkd8hvoUi3dyff8w72pmRHce0XDNUepCsR=1gtimFMgA6gmBQ@mail.gmail.com> <20260928-steel-hornet-of-kindness-aa5e2f@quoll>
In-Reply-To: <20260928-steel-hornet-of-kindness-aa5e2f@quoll>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:49:33 +0800
X-Gm-Features: AclHuK8lK5qr26yCIDEnhIRFlV9znH4XanXV1TnOvthhB38ZY0UIVpeLTmtUFHA
Message-ID: <CAFkd8hs6H-WT6C2Nzns2jB1yHq1CfODijAX1VbMxUUAe7zH6Rg@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MyBTYWx0ZWRfX/mhyMHnWa9sh
 dWwIFhcHy4aMxuFfhDJGLmnKI8JiAppfT868u6PgR5uUBPt7F/owSAZ3WPUtkzq8dTTAi1eohEL
 OwkpIMEnblfqYllfr77v3T4wLUm62xY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MyBTYWx0ZWRfX0QP9Je1Eydxk
 DMWafgFYLjfUaBDqDZLHd3Rf45V+V1WP5lI0+HPjiHW/knIrP8DxMawuuBKfytY8CSwWuK5Q7Zp
 kw0iKMaKJeMzqdOTUg5l/S0BW+li1FTudmpEvUzvg/XTbhd3UfhpeyejGeU0dDxfH9//0eiiLI+
 P4Ux1MAvzgkWFEbHd74oBuMjWBCCe5JF0h5VQi1Q49pac2ngX22Tm9N24u8y2LW0rC/LoaN8fN7
 yL34dPHS51ocfCoWVpdU1pibnYHTF21fADqNBRW4gKxdTbAKmZIKgiDCphAXVOoby/sFRkOmRnz
 NO1lSTwynChhc6YBwltrZB1XYVqpy31fQh7ZDMugqMtvxzEhKAnbVIT9YD0eUj5/SSwMzxz4b8j
 64ShXli4gdwU44domWTXIu8fVreGaRovZhkqbWKAsBeF6/6qKRK/f+WHA/VHLsFJte5T3siUxfP
 /L+tOqt38qfI+xoH4gg==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abb97ca cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SRrnDWHc4gHVzc1XPIAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: -vaMqVMqfDuqMrsyBd2-jhsNhlZM3bK-
X-Proofpoint-GUID: -vaMqVMqfDuqMrsyBd2-jhsNhlZM3bK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290043

Hi, Krzysztof

On Mon, Sep 28, 2026 at 6:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Sep 23, 2026 at 04:58:03PM +0800, Zhangfei Gao wrote:
> > On Wed, Sep 23, 2026 at 8:04=E2=80=AFAM Mohd Ayaan Anwar
> > <mohd.anwar@oss.qualcomm.com> wrote:
> > >
> > > This series adds support for the Ethernet SerDes found on the Qualcom=
m
> > > Nord SoC.
> > >
> > > Nord uses a QMP v7 SerDes block, which is an updated version of the
> > > SGMII SerDes PHY IP already handled by phy-qcom-sgmii-eth. The driver
> > > currently supports the 1.25 Gbaud and 3.125 Gbaud configurations used=
 by
> > > SGMII, 1000BASE-X and 2500BASE-X. Nord additionally requires the SerD=
es
> > > to operate at 10.3125 Gbaud for its 10 Gigabit Ethernet interfaces.
> > >
> > > The series can be broadly divided into three parts:
> > >
> > >   1. Add the qcom,nord-dwmac-sgmii-phy compatible to the binding.
> > >   2. Prepare the driver for PHY modes which require different SerDes
> > >      programming and readiness checks. Existing SA8775P behaviour is
> > >      unchanged.
> > >   3. Add the QMP v7 register definitions, 10.3125 Gbaud programming
> > >      sequence and readiness checks required for USXGMII and 10GBASE-R=
.
> > >
> > > The changes have been tested on the Nord Ride SX platform, which has =
a
> > > MV-Q6223 switch, running in fixed link USXGMII 10G mode.
> > >
> > > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > > ---
> > > Mohd Ayaan Anwar (3):
> > >       dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add Nord compat=
ible
> > >       phy: qcom: sgmii-eth: prepare for additional PHY modes
> > >       phy: qcom: sgmii-eth: add Nord USXGMII support
> > >
> > >  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |   1 +
> > >  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
> > >  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
> > >  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 +
> > >  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 226 +++++++++++=
+++++++---
> > >  5 files changed, 219 insertions(+), 24 deletions(-)
> > > ---
> > > base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
> > > change-id: 20260923-nord_ethernet_serdes-c486f715f383
> > >
> > > Best regards,
> > > --
> > > Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > >
> >
> > Good Job=EF=BC=8C
> >
> > Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
>
> This has to stop.
>
> Why again adding fake testing to the bindings? You cannot reply twice?
Reply twice since I thought they are two different patch set, one is phy,
the other is net, while net maintainer said that is too ealry for rfc.

The tested branch is
https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23 ( and
9.24-eth), and may keep testing for each cycle.
contianing dts, phy, net and all required patchset, assuming one
integrated branch will be easier for interal track.
The dts will be send later.
Testing hardware is ride and rrd.

Thanks
