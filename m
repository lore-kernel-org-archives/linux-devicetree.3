Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B334BC017
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785463; cv=pass; b=G5LTYsfxnD5cOf7pnt5o+nvUAVA1/x/uLCT7UA01gd2adhyQpYbAaBtfkgsAExQf4g22CzlM6qhYTU0cPcTLSMKmjsBaK69vZ5K+Zm+6ZsXKlXX2EktkfxBz9kwVQ6WWDVvC1YAkcmGfeWkoUQMJE/QT1KxJPi4De/5FVFcIAL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785463; c=relaxed/simple;
	bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKzrFK62ibzbZb4qqvrog7lxWPK4/y8oK56R50XHA0RI7foYu9FnfSJJ6FvdcQx+I5pkYDMaooWxhslgFCifYvVoCMzc9iRYcHpblKeI0hWGAsYjzXxvvdj9ctkBZjUCghQtR1K1iTYT6ZdycEst9JBK/yVECn6TwqFILNZCeuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U04jKatk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7S/LEd5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U04jKatk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7S/LEd5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnDpZ004211
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 12:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=; b=U04jKatkX5/Of0Lk
	NmSq95IrJaz5jcdpR2S3y2CdjZZrtZ5yoWV23Nl9G6UoLVXFr5aJFDMsoJi9WX0I
	nscIDNxtlNflYhFNPAXMWADWfbhGH4jyE+UTB9K4qxcPXD49SSYVfWcrjguxeEIT
	5YxVZHRqY0IiHKiufD+oEu3sQ692rdNZR0iwB2iLAudyyGRUXah+yzW/eGC/j5GV
	OpNpHAZsAMwSdDV1TDRFnU/WVuXH2wSDuQRWd50xY5EagiCkjIaZj703b4cFmVsP
	v0sXaSQuO7cUCRLl/3/CJmTrcuN6JvGiwTM4bqVg0Ec4ccJogB1oAkJj0fPshJKx
	ZHO2kA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg1268-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:50:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104215fbdbso86355536d6.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788785458; cv=none;
        d=google.com; s=arc-20260327;
        b=PoD/ismbTZBTNV/RXIvLyocVCp9BOiuFhBlR+ot0OndUK7ePokj2U+AYEL4dQI8hIW
         UfUZb72T5mZeE97BVF2nuVnEzff6RU6BLGgpcvdOF8VW8WcJkxXV6NLkpMFN9tzQzs/U
         P7HSLdF6xTsOH1nF2HvDhYihj3rVJWIR1pLtF1B9OmC2rlTdyJxvzzrfVn3iMdn/V/tY
         aP1DwH5PMFgdEACLCNJ5jKeCDBfK6lABvB0vYUTWBsc+hmjZ9vyVuqgnZufCqrTf/ulz
         lVAxetc8+kVtO+ofXArvHmuNsbGWvy02vWzvHkRwM3RqfJtajWwI7PpdEc4qhVARVp9n
         U6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
        fh=QaHpIyJShiueRBLlLgPP4VtjmKJcglvjkZfw/Zj0Oyg=;
        b=PVGmkgtKiE5s5BCpAkonskJi80qCCpUKCRpUAs9J5PCuznj4TxBrb9s5QYjMcRmJWh
         qdUhyT12x1/D8hAQLrnwgev+zy0DO37DJCNYRDNlVn+D2WLKpJ/9DE4uJTHULIc76DJf
         J2IMUgCSW2fHRzXzMsobBbqISfO2St+ITqeAKNe35hLz5zrrmUIIEsg5eL+a706PQ8to
         L6gKz8M99cFdpIx2W4vCDBcun1LAJ2d93TmmfbgdZclQNokffjA1x6SrzHJ7VO3WwQ7v
         KCK1umNk1jkiwBXMDcUhf+gzxEtpZPe6j/YHKysBG06tnm3jFXOI8/Vee9g+wHDKzKfn
         sxrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785458; x=1789390258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
        b=D7S/LEd5tfmtAEoVBVUlbGFPQU6VKZUF6Je2YKaHzboMgG4c99XlJi2XdYmYUTlbFV
         2jcTK3II3F5K7p3rCXJWuLbI23ZM/zO4YMK1gF9S98VsFnH9njBf9UL3qWHYCDrC/iQ1
         P8KcfZ2fjjnCiuRCybfFhjBvFTifik1vvY70WK7D4A0dSmotItmcUZ2jaIxZTkqcH+cI
         ry4v9QNHbBpTXQGV1d6qic2TEaPCOCzgTIgVv1e80EnheXyqK2M+eegseltrbo8kVYvN
         yVWdPTTYKtR1xBSXGe0YDdvv6hpftT+suysydKLOpr0WFpUIcKyWHWH19noPraGnXB8j
         +9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785458; x=1789390258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
        b=PrEVgT9a01+Lq0KqjMoHhH9+Ip7+bfQ+uwGcPXoJPeDmdeG0oPtoGsTolQhCVB5du1
         A7eT0r5CTbSt4G2RZv/jf0wnQGoPE2DANmALC3WIrViMSJGJ04xz4+fTkLlm3opP1Nn5
         2/dPGcTEOB8d62irNIs5yBoquf+LCrZ/bNtSS893QPCdOk2uVNfYECRMc6AFfc6Z0iND
         l3odubDcPSUlkj0TplcwsosreF/w3/mUqQsIVTLm1pbWuyeeds7RyG3Q6MG6D3hTXGDI
         GOHz2du4UcGsWcmwDOs9ZgsdtM8OJ0ryq2GeS/GCnG4pnfoXgg7VzLkLxPL3IVYG/ZMl
         flkA==
X-Forwarded-Encrypted: i=1; AKwUvBxsF9+pgYBY3WuFW7Tmm7/CYi3knLtOo+yQKNjXavPiGtUbp30KM5OAEJollas3qN6B9wpeweZDn5Id@vger.kernel.org
X-Gm-Message-State: AFuF++lSf7047NkC48AqYn3l2HPQ0u6ZdnEkXsdSB86LBSlyGBTxR9rc
	J/SZ21fsFNJ/rKReCp0Ifxm36B9o7QPU3Rg8L0zaSIHGPRPoPf+2yucYQGiIa9kd6h6j/wNO9Fa
	UxRqo/rhnh3RwuwaP5NSO354P1RZDN0I5op5LLQtCPM5/9kQRUIgIgZDToM0b9Vuc0aMJmBnpW0
	CgUyMQMg4PUHGWtvhimev8MAzZWAxOn6pz1uyBzFY=
X-Gm-Gg: AYBFou0p9G/S643DOCUV9VOJj/vzZ9ZbMM44g/3G89aXXnitLvk9cIduD88eedyVrwM
	gwZ2BNb2pN+z5UCXDFCkcZMyCImYVPbwCRFZtKAJrCAQi3vUQh4/d4qy1e6VbzrgfiISU+JYTma
	HsHTy0i+B936koh4rY4NbNdg/7v/ZcBeJHVcI+hiqN916hWpXDuRx/eHG1weuOCVrCpyk9diUKG
	Y5z3TyenFu7KlMQGWglubFIT4eWe3Ihrmosor6xET1rVPlki45dGWwOfpNoVzW+TgXXfvof/ZI=
X-Received: by 2002:ad4:5d67:0:b0:90e:84e1:8b93 with SMTP id 6a1803df08f44-9103efbc676mr253793486d6.16.1788785458362;
        Mon, 07 Sep 2026 05:50:58 -0700 (PDT)
X-Received: by 2002:ad4:5d67:0:b0:90e:84e1:8b93 with SMTP id
 6a1803df08f44-9103efbc676mr253793026d6.16.1788785457864; Mon, 07 Sep 2026
 05:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com> <CAMRc=MfDAiUMzOYRWioK2NDM37=yQqb4pQ5ETZz1PVOKQhhdug@mail.gmail.com>
In-Reply-To: <CAMRc=MfDAiUMzOYRWioK2NDM37=yQqb4pQ5ETZz1PVOKQhhdug@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:50:45 +0200
X-Gm-Features: AcwNN1Uy8Dv_z6eHdNiSSHvTLy1MMXc0Rh3LRZ3dI-XaUt9s5OrddNB4Kn5BgT8
Message-ID: <CAFEp6-1PuGMGkdfWYiUQnYffm7en8b-DQybg_4M9xw9MVDNRsQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] arm64: dts: monaco-arduino-monza: Add support
 for LGA WiFi/BT module
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MiBTYWx0ZWRfX3u/QLSs1kuVQ
 tVi/ceqWpX2CySFIkzkoBhdEfs0bh6oFuuvBCmHkrp2PZJ1OIsTd7lCOkjSDl9KhGyUnZA8couK
 oJxpJiyObVvs2VkGeamVGaq2Hl8+bwj22XInSpAUU7hgHEaM9i3D39qbho3wpanPBxDkiPCrZyJ
 C7v41rOylSO6XyIAZHIHs270FqIBB+gJVC9Pt77l+a+pjF2wJUgc+2SmvPvSTMvUoN6d9/962sd
 MrJ2Nf4Auk6jCS6Nf8rRF7XFeyngD2mKZM3N40m2dozO+C60HBB8Vza/tMPzgq0oLnAMkCAeWjx
 txXSZ82fBWCANa93KRmge1pb/V9TiMqPQ4o3DaXdnl2UQsbRu+nvmvYiJw18D68ZEQSUDYZW6lH
 2tQuIXI1o+rKY27f6fYtIfVuHyATTPlu7vqwTgmosN0YlMP1FbQWdqiea1ctbJtRNasB0WpvxV4
 Aqmx3fgOopDfY7bu5ug==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9eb332 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YKo8iWYt6ehE2M1v1KUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: xkJQE7RgIo9E5EZlt7r1u5PhvbCu3syI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MiBTYWx0ZWRfX72KDEyzt3Tz/
 UOokvdJqEIWkGGH/szDukpoyygt6Bmb2n2lGz9CXIEieLqiNLHHO2MPzlnHoyqMlLIa60801Txh
 9HQCUybx2D2I6EeDmdUmKviHqFzRSfo=
X-Proofpoint-GUID: xkJQE7RgIo9E5EZlt7r1u5PhvbCu3syI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070142

Hi Bartosz,

On Mon, Sep 7, 2026 at 10:24=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, 4 Sep 2026 17:42:15 +0200, Loic Poulain
> <loic.poulain@oss.qualcomm.com> said:
> > This series describes support for the onboard WiFi/Bluetooth module
> > present on the Arduino VENTUNO Q (monaco) platform.
> >
> > The board provides LGA pads for a wireless module. On the VENTUNO Q
> > these pads are populated with an NFA725B module featuring the
> > QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
> > the design is functionally compatible with the M.2 Key E.
> >
> > The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
> > Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
> > signals, as defined by the M.2 specification and handled here via
> > the pcie-m2 power sequencer.
> >
> > This series models the hardware using the existing pwrseq framework
> > and connector bindings, allowing coordinated PCIe and UART bring-up.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> What is the merge strategy? Do the pwrseq changes depend on first two blu=
etooth
> patches (I don't think so)? Can they go onto an immutable branch shared w=
ith
> the BT tree?

The pwrseq changes are only a dependency for the Bluetooth changes,
not the other way around. So yes, they can potentially go separately.

Regards,
Loic
