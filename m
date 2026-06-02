Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254236AB54
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383821; cv=pass; b=UFCO0UcZlT6tY0CK9qa6XzTzYJJYJcx55awRqJ+zdgAhRXnW4r3vYo10K/LGRQZEv6Qh4CAP+H/aiprMmVgY9RSHxz2n/jnEHn5Vs+kEwEyGMyxis/IAyBEEfh+SD6gqwfQjF7s6wIVOjk9B9tutgLWpdXm2/u5eAx5feCknJuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383821; c=relaxed/simple;
	bh=+kILeqQm2hVQiQIYetIGkenme74GNpC/a9aVrq/8B90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B98jKQ5hsHCBuWoydtBf0NTknZBcohvdZ5DhMidnFeplnduSvzOESTK3fxRhS+ZLcNkv6oGCHT+e4v83787YCm5Rxqg/0s1g1zyVUf+xcyGDTlASNbAowxgp0D0QCN+WHIasX4FB9t/qv0siRnhudlTa/2TW1eryT74J7H7S0yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eA4cHd7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTuJr/FC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eA4cHd7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTuJr/FC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65245o2p2692313
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 07:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x58y+WIsFfSXaraVm7M5xhpsDQGPTgMhuGLPbBdvVTs=; b=eA4cHd7U5OASwgIT
	N89QmPFsmElwlL599Ip3cSw1knlbej5tprw1+HY5XtEux5exjnH6+uxbEsVfvC1P
	x/qKNZpLxKr8O+5+lUzjjbivx9E/KhO68bISX9yp2JhdhqY5fDYvmaeD+1qgPU3/
	VAia/kT/3nGAB+sPDvTmUx+Sbpgj3QHBDnUBslAlxIZTd1Zwev3fiP4Z6H8QV3hW
	VgUAle7AYwN8olEk1OvUzRchX0f5TP6BgWRMzJxiop10/iXvjQjgVrb+WHGH6/wV
	i+pvHvYTuixEUt5/pMmvyA6PfSx3HQkp+WxmaQPLKgFxk1opHB6JDBMd+axaFwms
	I7R4eg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumgmvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 07:03:39 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7dcffea7ff1so66765797b3.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 00:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780383818; cv=none;
        d=google.com; s=arc-20240605;
        b=WznxzLEhnCl1AFYaQmOc4HhqB9ckj0jlYIEnikawS0i4PoNoi7aRWeuKS2RCUS4HtR
         tZ1ttynl0zOvuf93FTyUh6uArhBunobbJ/lE1+ze+5+oqCCS7NIgX3nF/9rU+y40kzzx
         m0+GSk/xEbAy+7qDXXlvkJXBNF7c/DoY2nazRnq95DpB89rrLcY8VTH4EOKDCNwlIFtq
         lXC7BvYq82w3FOs2Qoz+wQNHliLlbVylgkkhA6J8pNztCPmwiGfOkUD+g1dFDjFncpi9
         gSjwWBgBQ2kDzzQeshOKfddTiSL0WJpbW64WP8E/XWwdjIEv49M+w4/dOY9yRW57npMS
         c0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x58y+WIsFfSXaraVm7M5xhpsDQGPTgMhuGLPbBdvVTs=;
        fh=qB5T7JEWMnIoxC0ajx/1e8VH6yD41OMD3lagg36iWfs=;
        b=YncruuCPrHXCp9YBgds5hDQBGP/1kEkNZBA5UodavBzdDRa6W5S69Ikv1IQFS8v04s
         ob+4FtRuoIqHFopbm9IwMCccA4PjVlHd3HFntS87ZaiCetzF7A/X2iuJoQj95EWoZd5I
         8BT3BT/K5DYNExUanCvGxwKQDDY4gHvd5hjiUZCw51mI7SJVa3tksKdYKQfGws4f7PIt
         GJJ01ECV5gEhBL3IFzO3i8K4dVGyl1NTmJlLjzb6t+xdcQtIUI4pEcoVKA0R3PgfDaqH
         IhwO/vK8FfXXWy74VQVXziarAqqFp9gEyZBoY2NJoOjmcmicvPLq2yQxId9WY/xKBpn9
         jAeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780383818; x=1780988618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x58y+WIsFfSXaraVm7M5xhpsDQGPTgMhuGLPbBdvVTs=;
        b=aTuJr/FCB1quQXvpAMkORV0eY5dEQLXPGhWyA93/CsxDJ3J3cppgjZr4rLWan5ujjB
         IpoKg8V4ODh8dmicK87xFCNno9HYtAZM6chDaZZjNbeLhkHI2kxRgtzccvFOlcgNaYUM
         2UsHP58EERwWBxv2Gde39CI+/uYf38qz/YjlTW9qxI+fD2FY7ZEfBLyfEiOeVaZQDIZd
         pEiFY8vyY3H5eaMBjETzeYVpkVnTv+lK/YWAZKgNOwUgfaYAmFKo7KAigORJOXtjc33y
         thFa7FcoLEvuqwH2Z9nJTg9VaFV1hM7r6zqL12EjBRuF8G5G54xoJBvm/SOrPBxvcte1
         GwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383818; x=1780988618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x58y+WIsFfSXaraVm7M5xhpsDQGPTgMhuGLPbBdvVTs=;
        b=NvaykmLemOUgBJ5dbwaEyMRhZX4cQGmrgotnFjduqPYVRsD0acg6kVxaXrC/eLJWoB
         R0wrYqHyv9ofhw+lyTKGGLuVtuMyyFjSEn8Cc8IGZatTEBRUi3s7m6VlOFkCWUHoPDcP
         KaTnNx89SN0UyvofcPdtN+4SmqIny/zqsmq5BcX8VzQD1gEqe/xdec8oHCe8QqDs8oJO
         lgu1qiqLVVlu0Suxv7Nj6ctdx9XEeMRpYDrKc7pE+AWbCK6YQhLF07v5JEA4DIXHj5fZ
         wkhEDDCKBUS2FNK8ropslGSj7JBpifASI7Ju2s1lRPP6Hta/yFQ8tojhOg7mZ9NJYWA2
         0xOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BeYix4IsxZRJnntwP8jKyPqHQKgzs7JI0M4HP3GTOLArBt8mzmOBT90laKLA8+K0Jwf0M9Ot/ovA4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1oafr3YNn8JWvAMOgv5Q2iASGLBeYW05CVgmRAAASYdFpnZw+
	m2WLR3ZpDokFY3qIfcXp+8C3OPhLsfXwxwjxnRhV22KcnXj6hLqGsAPZnrOzR8W58HXf9IP+1Gy
	C00sCjGONDjlrWjINd8pT5AUd7p6drWfNhps53NsIQ79XFG6Elw47QmHIG6g99KxelPp1IMY9xW
	ZVINB+0+5b6LsZeScMjR+AItspNjEI2rGwX1zAouM=
X-Gm-Gg: Acq92OFlm9mM0Ne+hErW2nS8C6+MKwfrmiTtf3mahWyZENams0TQNHJEMOR7SAA4I6y
	g3izg+qQQTtFcRuPZ8s5VQdEjgIMKbhiQzAexoezodlVZB8sfU3PTGtyx4QTOYC2nPrd57igUGE
	JN5SSvIIMPG/mTEAQykyfOiDYH8tKM5Bu73ucQVVPQaavsnIPAYJrfr0HRG60uw+VyjPBoHxHMl
	ra6Nx3DTCpMp923AQ==
X-Received: by 2002:a05:690c:e4ea:b0:7e8:6a6a:dc0c with SMTP id 00721157ae682-7e86a896220mr21369287b3.20.1780383818492;
        Tue, 02 Jun 2026 00:03:38 -0700 (PDT)
X-Received: by 2002:a05:690c:e4ea:b0:7e8:6a6a:dc0c with SMTP id
 00721157ae682-7e86a896220mr21369037b3.20.1780383818056; Tue, 02 Jun 2026
 00:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
 <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
 <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com>
 <hrqzdro3s75sf4tfphmbzswiwquflrj2krm7e4bkohn3zd27rv@mra5xbg55qqa> <CALC2J1PLbuL3dpkL8jyhchREB1d1Pc0BLHzZCdEjgfitQahqNQ@mail.gmail.com>
In-Reply-To: <CALC2J1PLbuL3dpkL8jyhchREB1d1Pc0BLHzZCdEjgfitQahqNQ@mail.gmail.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 15:03:00 +0800
X-Gm-Features: AVHnY4IDDGYAQdn1NicpyYoUK3wWu1NEGtuqenWpKiOxg42RWbCbTkDtKAFYG4U
Message-ID: <CALC2J1O1RRcKMp-AJsKkAvYR-gmKYmr43fNbVDONe-PQbXB4OQ@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2MyBTYWx0ZWRfXxhfbYlRmZCZQ
 DJMVb+iQ71ljKag9eU1C4DDH6Aoc9cfK+9zPj7j5xPTY+BabcVj+8ujq+f+bfLIUQTfScfDEo6y
 jLH1ZffXFT3EEg1rhiXM6aJyhbAAU22k9Z9Nsj6DTKXy+jl7xm5uQoOA0HvxYbfw03WgaV7/q/9
 BqXnHN0meYEmb16SG5pA8Mu84m4YNYse/KNzPSnyi03m/2fvlMe4wG6yD3STgJRfyx+Al7VmBzc
 NH9FEgrDrbNgRz+Su4ydtjPlts+wZgWUhjKzEsYodzsWIjvb39emnz04SIzE2Mb196Axf8kgABV
 4AaUTQJXBDTI9uxVPoSuQ6K5RN07ncLMUv2QbCxsRNWCM6kt1lMEdThbf0H/dRKo1cU5d8p1QKM
 GMMDTnHdOcbXrhmUT4dTdIlusUinF6q83KNr5EFeFDce6b2FjaBYw2NrgTQkAkWkm/xM4cRy0Uj
 whFzABhVVp9D50eyauQ==
X-Proofpoint-ORIG-GUID: 7rvbSapqDLRtYYV74fCTJGofNHLRQTE_
X-Proofpoint-GUID: 7rvbSapqDLRtYYV74fCTJGofNHLRQTE_
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1e804b cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wxse1RgU5JOuWK4XkC4A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020063

On Tue, Jun 2, 2026 at 11:32=E2=80=AFAM Qian Zhang <qian.zhang@oss.qualcomm=
.com> wrote:
>
> On Mon, Jun 1, 2026 at 8:39=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Jun 01, 2026 at 07:46:49PM +0800, Qian Zhang wrote:
> > > On Sun, May 31, 2026 at 5:09=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:
> >
> > > > > +
> > > > > +     wcn6855-pmu {
> > > > > +             compatible =3D "qcom,wcn6855-pmu";
> > > > > +
> > > > > +             pinctrl-names =3D "default";
> > > > > +             pinctrl-0 =3D <&wlan_en_state>;
> > > > > +
> > > > > +             wlan-enable-gpios =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
> > > >
> > > > No bt-enable-gpios?
> > > BT is enabled in node uart10
> > > https://lore.kernel.org/all/20260429103537.1282497-1-shuai.zhang@oss.=
qualcomm.com/
> >
> > The BT is powered on by this PMU. So, if you are adding PMU, it should
> > be used by the BT node too.
> >
> Will move bt_en from uart10 to here.
>
> Thanks,
> Qian
>
enable-gpios in uart10 is required by qcom,qca2066-bt.yaml
and cannot be removed to PMU.

Thanks,
Qian
> > > >
> > > > > +
> > > > > +             vddio-supply    =3D <&vdc_3v3>;
> > > >
> >
> > --
> > With best wishes
> > Dmitry
