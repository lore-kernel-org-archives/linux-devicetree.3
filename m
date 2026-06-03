Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90235382F26
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 01:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451523; cv=pass; b=Kl4gRgqbQVnRtre10DgFA2sKYiYU5+nZArRG8bjozY8Og9xXknBPvfzhqZF5p2kADB2vAFnxMSPuQRBKNmikxislrVbKWYVv7lrjlUPAlnqz3yVRZp4VaT4y0/dS2Rg8Lzvsf0vRktSKlT83sp7fGrsq4W6gXmwPTQUzee50Gks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451523; c=relaxed/simple;
	bh=xwIME3S6OO3qgak0rq/F0HuR0AkmO+y8l9SetKzATCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0dt2RKJH5LgNrVzGU7rClcYui5XvNyGxY5I0ROiQf6ZJNBM0JkzS8gqJDxre+c9a+3GPgTxOxE1Ltd1Szx0tpI4QMNGvatqWSBj8L94rycTquUvZPnsNURzwOa2WqNfI7wi4ciQlKChp8vTBifGHkg76jj+6nGapuCvBE7RZhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZchJZLSU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MugJsiYR; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZchJZLSU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MugJsiYR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652LA9h32767181
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 01:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cb0fWCu9Q4l+gOHftS8EITUxP/rLzMjQwTCSAHVbICg=; b=ZchJZLSUQ3sxzDPl
	1ay8RsFoUcrNffr5wshTn5HXM7kcLHfGkTqbJMUi9iPPSwliqVWwcV7uKhyrV7qT
	zoD57124YkHZAiyzLZm3zB1YK6iuQ4a3oak3Dv2x5XqpOAxjuHyFCJwh4mZRus2o
	opTPkeTw3MfX5YdNCYALi3QEtNrTfKL4SXS3tW+UukzBy5/cXh1F076VhSRoHjqG
	79jrvu8K94ixRryP8HUNLTwlSXiZ99bSkXUNuPJRiPNA7WMKzSpvo0T9H8AJJ7qt
	729ypC+gee8rkv1SQSExEEDMegeZRejPCchVmn2bXnU4IW0wMOY2FzJ/ksA9xYv6
	hkTTSQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus4k3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 01:52:01 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7dbd4d8cd75so123595817b3.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 18:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780451521; cv=none;
        d=google.com; s=arc-20240605;
        b=QpoxuIt95xOLzt5V/6oL3tfqRQtM6DPTw9T/8t32/xYIQGTaaHCh7I4nuWdbaNP8OJ
         YgJncf7cLb44qMk+VrDyTuOpi7CdS8pWB0coHWEhCwZjPLpFU8geTsiL2+lbDDYVeHw2
         bRO4kXgFNnUun+jhF7kWDIImjTLDhrnTCZEOP03Olf2y1n3x6lS5IO6dPMct2xVU5k6m
         Hi7izI4a3MCRgVr0E652Z3mD0MgFqHth6d39YVfqSdU6G8+QYuZeqsAQeJuIasU/BcXs
         1XO28X/90fo8rlFYaNHKTfPTBOu9Rhg5wXApn36wH0/jS3IUxYxYbIdKumlz0bPrzvqU
         Yz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cb0fWCu9Q4l+gOHftS8EITUxP/rLzMjQwTCSAHVbICg=;
        fh=DwLqgKvLXGBHBtq3n0HBMUE4MyoGTbDcPxafLgsLWeA=;
        b=aMBoorz695Bsr8iBHWmY96cSvQnaO7f0+3EuKiIAXKyyg6FOvFucx50rlyeTKouzkY
         GfZlL/ieuraRWGcu7bS9LyZsuiBFtX752K/lvRGBo5OfQRxmFMOkP0WYC3F3flFR11vt
         xkeRSzlWV8UmOKeTr1Mzdb/YOYofq3jJOrjzQ/qySNCm7ojM5DliAeBA1TGLr1Ra5Izb
         r/HlSsZaVcZysMZnjtf0Z8yiHzcJuReSuD/sLZxyNpaFjCB9nlZWwGaHjNsdlPQCDGzc
         w1ut6cY1lx4L4yHpVImbM6QPDrt3BN99IQnl1BniF/ScK1OvdivXX3DxICQodAenKgqM
         KBVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780451521; x=1781056321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb0fWCu9Q4l+gOHftS8EITUxP/rLzMjQwTCSAHVbICg=;
        b=MugJsiYR28Ytl3Orw/j23/kvBstrc4R5EPCVcJUo1weRQj/r/g0cpXVs54jZ5INyuY
         J2LZqjWO0XVd9QT0S6+gxWLDrzyv1xmv61XgImnZV+g8uHyw5r7xOtnJgfW8fEYNM2/Y
         5nrO+lGub0GjMl2TrhOwoMKZRJp83uRsVKstBahWhXkXSnB4ED+s6gJsFtrOuZbJm1N6
         J7Dnwz58NdDmCjN4tlE4Hht+trP7rzZVoR5CZbeb6rDh/u139znDqK0KDKmX9f6rBAbP
         SKszqkayottwyuy/xvV+KlUMmmGobE6iIp1iyo7cCGMQyCi/QRLnCQVq//vRrS6b8+e7
         jStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780451521; x=1781056321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cb0fWCu9Q4l+gOHftS8EITUxP/rLzMjQwTCSAHVbICg=;
        b=NvMfyT4yb55gAYDQbpELPkw2hAf6tM87m0X6q+R+FyzxqZ+AvARJkY7h2ewWY5iPA0
         CIvE1vrr41ERWn0cCDE4OcdVmsJU3gHm65yR7wLBzYSfzixwWCDpEq4y2gVu20b1Skzc
         tGA0nTjUFHaKj/S052GtAWHP3GIMdovRDQW7lmEmF3XNvGMwuliYluvMwRERVAG74lly
         Rt7JfSGZosvab7RAxr/6uil+oAet+NM/97w6wLTNco9D7DQJu5jUCkACBx+LX0ZjFUv9
         w/Ijzym/RC2l2GABpqU7WH7kV4JAU6HUyVbPp2uAOAOCZsDDPFSHXnpDgHIPBPdUjrJD
         jJuA==
X-Forwarded-Encrypted: i=1; AFNElJ+9PX5fvmyiNvzXe2jO3i3kjy0UY5ZSPk/oVuXn9Y11mBq3TFoC63zUyFsufMgQqAVLHAMRntBBtguV@vger.kernel.org
X-Gm-Message-State: AOJu0YzwpZgdidE2fU8TCCMobvbHESQI0EaH/UHIZc3xPvzA+6h4vNDf
	kPE/bolJgryTrDpftTkuRWJtDbJZIL7V2e2/FLJ5b83JtCPWfNKeCyEVEMnFvD/criySzvZlhHn
	6N5HyV6MRf+54lev5qhhkO/ye+80R0w4ZLGg3EYgJgXxqvbjWPGuuQOHag26PBkUhzwpBir02Zb
	i+M93XH7Jtl+6h8WoYg/Xn3wW8NlHM7slXMSndIfQ=
X-Gm-Gg: Acq92OHU42t43PBIhtcH4Fye8IewmXrS1z2xTgJf0NO9vqAovbG8NgC2T24gWf1wFMw
	IjCuArR2zJs7nQeqN4mcPChv6O49AQsykWdqvB6EDGddxQQhHoWRcGuMUuvMVmwkB6kzydXM/py
	bacwK97Ld7mPcNHIEB3pyxMsYFuOwQFqi8lJFvMycmwfhNAEmVB0m52GXjpe0vvgxgasOK6SoMR
	f1geWmrkrgcAPBCnA==
X-Received: by 2002:a05:690c:62c8:b0:7dc:8dc5:debd with SMTP id 00721157ae682-7ea4730bd83mr13875437b3.8.1780451520721;
        Tue, 02 Jun 2026 18:52:00 -0700 (PDT)
X-Received: by 2002:a05:690c:62c8:b0:7dc:8dc5:debd with SMTP id
 00721157ae682-7ea4730bd83mr13875287b3.8.1780451520191; Tue, 02 Jun 2026
 18:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602071028.3810-1-qian.zhang@oss.qualcomm.com> <20260602072153.338AA1F00893@smtp.kernel.org>
In-Reply-To: <20260602072153.338AA1F00893@smtp.kernel.org>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 09:51:24 +0800
X-Gm-Features: AVHnY4LUiDgPjO83-ZR7PtFItOOqQIQFyDIil3QPK_fcYeVD7ZGpDCeT8J-F2do
Message-ID: <CALC2J1NuM8XnytwBNtXuZduBUtmqzS0_WDOk0HK6xsiX-pAKAw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: eeoENZlJZ4g2W7sm1yVCS2tjO8N_u-Vv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAxNSBTYWx0ZWRfX2aC+82nx+cCY
 8i2WZzbRcQU2P1RPwfZ1dn0TAwD9i7k74cU+jJNMNqOz6u5FGrARgH8VcDsTj0Yzbijdn4iSwPs
 7zC2+aC3WJd9lJC8EsRhjb+DXPlK7wdf4Sp1jjmklG/D+U1GoNP8zjsY1hrTFTurlJkEKAdghDq
 ClCf+QJHnr+rxpBIiEllxopZwfm/eK5uX4HbTn763OS0uJqY+J166KQZCN6avQog6tEiXw6dU27
 GANbYlHtCR0Dg36NxeieeX9XHyji31vY60rr2sWGmXkbYrr0k6libH65myMq33+LXCj+rqyMOge
 sUhwomfWe2H8o0l227h9FaHRN/juSo7Ec4lh2nqCdvCOEU6teubfVD2Qft0FLR0kPRomsWF2cmN
 ELpMGyL+ONFKsL/j15uDBzPi9oA3svHt45frAp5J6m69WwpNazia2GUbkwzZiK4nJVbmc4f7Mp8
 kJD842W2mtrD0V5WkdQ==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1f88c1 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=g-pP9vhoa3iisoDEgt8A:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: eeoENZlJZ4g2W7sm1yVCS2tjO8N_u-Vv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030015

Sorry, the previous patch is incorrect (sent wrong version).
Please ignore it, I will send a corrected version shortly.

On Tue, Jun 2, 2026 at 3:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The `shutdown-gpios` property for `wlan-rfkill` is incorrectly c=
onfigured as `GPIO_ACTIVE_LOW`, which will invert the rfkill logic and disa=
ble the hardware radio when the subsystem attempts to enable it.
> --
>
> commit fef17fc3948ff81196d4df1a40b32c0d905e0ab7
> Author: Qian Zhang <qian.zhang@oss.qualcomm.com>
>
> arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
>
> This commit adds device tree support for the QCNFA725B M.2 module connect=
ed
> to PCIe0 on the Arduino VENTUNO Q board. It configures the rfkill shutdow=
n
> and wlan enable GPIOs, and defines the internal PMIC regulators.
>
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/a=
rm64/boot/dts/qcom/monaco-arduino-monza.dts
> > index ca14f0ea4dae6..b90397c7000e3 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > @@ -153,6 +153,78 @@ vreg_nvme: regulator-3p3-m2 {
> >               enable-active-high;
> >               startup-delay-us =3D <20000>;
> >       };
> > +
> > +     wlan-rfkill {
> > +             compatible =3D "rfkill-gpio";
> > +             label =3D "wlan";
> > +             radio-type =3D "wlan";
> > +             shutdown-gpios =3D <&tlmm 54 GPIO_ACTIVE_LOW>;
>
> [Severity: High]
> The commit message mentions that pulling GPIO54 low disables the radio
> transmitter. Will configuring this as GPIO_ACTIVE_LOW cause the rfkill-gp=
io
> driver to inadvertently disable the radio when it intends to enable it?
>
> Looking at the rfkill-gpio driver, it treats shutdown-gpios as an enable =
line.
> It calls gpiod_set_value_cansleep() passing '!blocked' as the value. So w=
hen
> the radio is meant to be enabled (!blocked =3D=3D 1), the driver logicall=
y asserts
> the GPIO.
>
> If the GPIO is configured as GPIO_ACTIVE_LOW in the device tree, a logica=
l 1
> will drive the physical wire LOW, triggering the hardware kill switch. Sh=
ould
> this be configured as GPIO_ACTIVE_HIGH instead to match the driver's inte=
rnal
> logic?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602071028.38=
10-1-qian.zhang@oss.qualcomm.com?part=3D1
