Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA0C3EA94E
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288093; cv=pass; b=k6CI3340PEYv7Bq/Y5518inYqA172qgRZTTwHYkLTPMaTsmOFnIa+AY744VD89kAwdVgbGt8MqUTOPcbAMwQJY10qU4teXeUO42F10zu5xnAI+p0IvQV3gINpmQFzDV26UwIiSi9u5LJdv+jy4Syh6h6MywXZIMh65fqa2nFbPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288093; c=relaxed/simple;
	bh=xbUg8Tez49Qym/fFbF+EEOQeWpWM0YvZSTU0Ng9IgYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuB0x4R90933Hr0atm27YwQckYd+9HXwaJMW45b3Syv67+idJLB5ObQmJ8Q/0XisbMhNheJkAGNedfzfA1VMM9FDgTtXEiH/7y6YkIwl/XI8buOFgSngHhKTNkJzj86rmB4BboZZoF0GsldH/QH6Qo0a/HH4juTxbyyqE+SAS+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gx9EpT+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+upmF5H; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gx9EpT+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+upmF5H"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXvEU1798612
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhdQb21ISCuiB6+7XVLpKLvr32coGHzkT1dS3Rn5t40=; b=Gx9EpT+xa8pxdOq0
	XNYzY8kOQM/Hr7PLVClI3TM+OYCo0nTMERSQDLo1l0XIQ5UtfJCa9gm5SY8Y/toD
	GJf01zTFg7pUDWODu/rb3SNSx94qWl4lvo6jSUNerqpbaunNf/SZaPd+nDYOcS1X
	GEXzuRAith+p5H1MSibwmmth5SpzYTLEEjrlfrEU7DdncBJ7wyM8L2Lic0+MZq6E
	CLMVnqOsRNHgkveL8IzMTePUzoFN5jt+izlZdzmb3RNJV1+swrowgRodrpcq1Vmu
	nMyAxF2xMLnQCG5Du+CNzVR90Xcc3Is3KADZK1SOH2BznSu2S6oOHJVvboRkd+is
	XoPjZQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu08ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:41:31 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-43a356e0119so14055048fac.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779288091; cv=none;
        d=google.com; s=arc-20240605;
        b=I8Qa2ftF5nTYmxQOcCrR9MC0G4iom49M0lt1S2C0pKmUT9grQ23ucqaLnkgd49zXOW
         z7ovz9qOOWMjKuFhbZVKedUYAjSigt2telxlDMQtSBgJ/Pv0S7DNKPSqCWBiAebjdqlg
         1RkyEOVjBi1gkGRCf4qBdsSqtE6JXXKsvZzSixRSRNZdanrt0HZyIkqkLueC6nO/M7if
         CZM1oafBW68pEEcauDnBS4elJqt2h2Bn+oGQ68ByYpj5hwTYTV1FbDjKYSiPs/vO86g3
         Ga3Spnc/M8GddhpENssRoB93aymFs3a9NsvqzgfzC4z5Pg+VCcL7/HN7Bz1qzUhpsil2
         0I7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhdQb21ISCuiB6+7XVLpKLvr32coGHzkT1dS3Rn5t40=;
        fh=1x2dme79MtGq5ZE0l6UjHMFzbLZnXuCn4C75moQezSQ=;
        b=R+Tr5KBJdMSIFvR/KJJXs8vp88qyF2cpamaq8hy+Cjr1ho7rSsIuFthRu/Ihwnu+JJ
         Lq9tjpc2SuQE6tQmEkx/w+D7RWad0KNLY9hfHUVtNEV7lUvqa4xz+rDmQhX9AlB+0n8g
         2E0GuMPa0gO5wafoelM65qTUBEbkVLQ9t/BTLeOfeOR3ME2pWLBVgR6CqIwvilLFIKOX
         B4qn/9+ZLLexj41VX6PK0Y7PaH1dGTD1BIQpTkAI4vFC706toErQc+sx4Ikqeg3O49Z4
         guVDkuSFrxYEd3DiwAtaFtpTuKjwwQqhW9uPmfQBQql5nlu96Su2tVWwB1SpfV86Q6Ji
         EQpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288091; x=1779892891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhdQb21ISCuiB6+7XVLpKLvr32coGHzkT1dS3Rn5t40=;
        b=C+upmF5HsRq0cE+0KO8ZioGMSW4S9IVDtTUGzIAf4rCG20ipjBP+gjvObtW5VLZ3US
         RBf4UmQ2MnFgCZDQJRJO7OP1aTaEHO8PbpOFTC6fkW2m3EgD/AYG0H+c2/J2H5MJTkOy
         uT9Mn2mao2yyae5E7e5J8O+yqumrVBpzckZ5j+vHPALrdnStgyNeeJlApKMdUmW2NqIl
         /5s49xjgaIuTaNNym0QoN9Zu7wjKiJDvpI4NLfBupSqiTAUc2U7Lqw+7fHF8OTBb9OuC
         Qw9mbGoM527Ry6lecomVoErt7LMN74vNaUdrISWXEbYYWae/TLDsTVAiBfI70mZCnYlM
         iIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288091; x=1779892891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PhdQb21ISCuiB6+7XVLpKLvr32coGHzkT1dS3Rn5t40=;
        b=ebZZMCnCpIisBF6XD3k3S+Z15Vtsu+Pc3IW5smVWpVW+PcW/8QF2vTfDSQ1sGnkLMU
         JAg/gcrfIDAT/j+NqwDMgVTRRA+DnDLMEOE4bZ1HUdaY7FoBtAPkhpWNsg278jgUbULi
         EHpefBjjXmEJTYLJ1Mg3Ji4ANS/vEKR/iZQwvZPgC4E+bVAD5JLxS/fEObbhFVfgBkRa
         XH/5vFKgub56zAzQuEXgt9aP2uFZQsMxhOUc9m/bRIVzCwdIYDDlWVJzUR3xIguTr66T
         Qgy2UHDeorH7iw2VKR3LlbHkz7cdMGzDNWjog03jvrPDoGFfhJGgVFgywHEBuZehk+ed
         +XUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/H+lPNmmCfdU3hMr1FUk/7TLJF0uBPIBqKGkvi+ORBEaSejCeTKIT8CX+3tCHvWeHUdtnkwWfPZdlw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw08kFFKGORokldZBp9j1wKndxuLbWlzIkIMBJ4m3YBKGn/Cbo3
	iniRCvAHOzBbnfn4INLsd1uyjArkA/ufrX/oJ217naw570pFRzEGk9mxn8p5rPnkFIkR0tcKFhS
	3uqoV53wad/uc/WBBqEUoQMfPYHppmQwJcwQc1skdfRnSL4OoKEN8RYH7cNUBkgdimtmB5Cyb9p
	22sJNDebB77NiNIAPFYzH3j644mWUKu/PulBqf6zdCRB+JJ28=
X-Gm-Gg: Acq92OGbF3q5oYovZ9PFdytARk5RicX3OES/xjW+P0tPS+bA2pbh7GAxBePCdGF33/o
	wsqJrF8wNoOqJ8p3jSDVs7cjCuh75hgjirR1Jh9eUVq0fBIjMCnx2vfedCLESvh2gPdb/TKCnun
	erP2OhfnHAZMM0bsEN50ewjlVEWlFv9vIg4t3tM9VNNmg0Ctx2KW8nGO+VatsFsGJ1QDBf1QCXz
	McgEgYP32dhaHc5YlLhgqY2kJqYipxW8oqMp4M=
X-Received: by 2002:a05:6820:1c02:b0:69b:85ba:bd4f with SMTP id 006d021491bc7-69b884ac83amr13326875eaf.33.1779288090703;
        Wed, 20 May 2026 07:41:30 -0700 (PDT)
X-Received: by 2002:a05:6820:1c02:b0:69b:85ba:bd4f with SMTP id
 006d021491bc7-69b884ac83amr13326862eaf.33.1779288090260; Wed, 20 May 2026
 07:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
 <jetl37zsfcs5kl4b7iarbngrdu4ebp7ag2cvpqvkku6tbl6r5n@qozh6n5fq7f3>
 <CAFEp6-0A=LrU44pu2rfUqXW9k9peSu=b2qq_FVs4WZUj-g4pDA@mail.gmail.com> <n6kl7y47hztf7tgtdxhakpekwkxlleggv4sbzpsd2ncpill6ii@bdk5esjubv4t>
In-Reply-To: <n6kl7y47hztf7tgtdxhakpekwkxlleggv4sbzpsd2ncpill6ii@bdk5esjubv4t>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 20 May 2026 16:41:18 +0200
X-Gm-Features: AVHnY4KjiuGhKKWHmCXQOioTVfBJ-iXDUnzJmiSH1aWxruwXcP1EGQFS7-tjBSA
Message-ID: <CAFEp6-3Gbd1gzfeu5xdfBJixL6JXaoSFkRUsBjOji0ZEOHHyvw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add QCA2066
 M.2 WiFi/BT support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MiBTYWx0ZWRfX3myrEy1k5h68
 iHkqnUugeqNzCkOm1ABO+lMVRlVaI6I5Iyp4TkdgpH3HHVfe4BTPAcU9h0hbjyV0wjxzRLLDBL8
 g9nhP1ft5gn1f/RSlOblWsOYTAe5dB+aq47lElhTc3BOQF7c3oEmtHdxXQU09HyJrb1+YgvDvYf
 o5UlyJMgNp1g7T2P4HKS+ip564Eq7XAaRTGwxr///2CYEu9ZG/fx1r4ohiUheu5BUQ+KzWcdJ3o
 GRUsrPzZenu7/OPsXJWdbVogvHSMhLb4NdNDiYj8bGVAWz2yJo/om5ar9LUjUuNEEAACGpsQ7Yv
 985OL1TlvFdUbve3dox7KWe+gwCMaYfznaXt8RtKqrOO3usPrk+lfKtMDihKL2tD0PQ/O4BISxG
 f7BY3Y9LATL9xGWX9jhi5sKlRc5qmucRPjBt4QKXlHYMjyeyIZuJLPIaqgqF2pivGDVQ4DKyWcW
 GQxczw79cBIRMRD0s7A==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0dc81b cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=QwjQxBKOi-_Ocnt6GWoA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: zigMCKoSE7XssiFgrXdCEeR8ZpqS1Ala
X-Proofpoint-ORIG-GUID: zigMCKoSE7XssiFgrXdCEeR8ZpqS1Ala
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200142

On Wed, May 20, 2026 at 4:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, May 20, 2026 at 04:29:40PM +0200, Loic Poulain wrote:
> > On Wed, May 20, 2026 at 2:34=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Wed, May 20, 2026 at 01:01:44PM +0200, Loic Poulain wrote:
> > > > Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
> > > > Arduino VENTUNO Q board. The module is interfaced via LGA and is
> > > > compatible with the M.2 Key E.
> > > >
> > > > Add wireless-lga-connector node using pcie-m2-e-connector binding,
> > > > connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
> > > > the Bluetooth interface.
> > > >
> > > > Add pcie@1,0 downstream port node with pciclass,0604 compatible so
> > > > the pci-pwrctrl driver can acquire the power sequencer and enable
> > > > the M.2 slot before PCIe enumeration.
> > > >
> > > > Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
> > > > (gpio56/gpio55) used by the power sequencer.
> > > >
> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 65 +++++++++++=
++++++++++++
> > > >  1 file changed, 65 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/ar=
ch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > > > index 93ed575817af1c5e903662c209ead629fe202ee2..6fcad77f320cb82eccb=
6f07244d185abfb1976d9 100644
> > > > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > > > @@ -154,6 +154,39 @@ vreg_nvme: regulator-3p3-m2 {
> > > >               enable-active-high;
> > > >               startup-delay-us =3D <20000>;
> > > >       };
> > > > +
> > > > +     wireless-lga-connector {
> > > > +             compatible =3D "pcie-m2-e-connector";
> > >
> > > I think it was discussed that LGA can't be an actual M.2 E-key
> > > connector.
> >
> > I am not sure I followed this discussion. Do you mean that I should
> > introduce a dedicated LGA/vendor-compatible string in the compatible
> > list of the pcie-m2-e-connector binding, or that LGA-based designs
> > should not be described using the pcie-m2-e-connector binding (graph
> > representation)?
>
> I think, it should be a separate, vendor-specific compat (maybe using
> m2-e as a fallback).

ok, understood.

>
> >
> >
> > >
> > > > +             vpcie3v3-supply =3D <&vdc_3v3>;
> > > > +             vpcie1v8-supply =3D <&vdc_1v8>;
> > > > +             w-disable1-gpios =3D <&tlmm 56 GPIO_ACTIVE_LOW>;
> > > > +             w-disable2-gpios =3D <&tlmm 55 GPIO_ACTIVE_LOW>;
> > > > +             pinctrl-0 =3D <&nfa725b_default_state>;
> > > > +             pinctrl-names =3D "default";
> > > > +
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
