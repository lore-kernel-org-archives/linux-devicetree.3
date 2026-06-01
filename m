Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73683361DA7
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314450; cv=pass; b=pa1q3AhanJGA2oW4NSvgktMQhgOtWnnouKWn0asA9amIssW/YwOzX2AzlFejR4ggQIB+wxVWtLWp+FTG6sOqMyRmVnHdJU/AK7IYKhG77WUkPJHDWmrs0ZtvdpVl00jk04y9ufRjCfmAJ1dhz55XU+CL6V3yrZDJev3tqJcE+hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314450; c=relaxed/simple;
	bh=fF4GQIj+h4QEV66Ie1KKtCnLCX6GrHlWzUyOV6OxElQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOwQTIvpvsyui3fWln0vLXprfDtEl1BwHB1HvzK1fg6vu6+NBN6IrydhIlqS5IWZSwOqqK5v4hrhJXyyoSkO4BOl+CoGMkgBpc6BGyqWFyc9pZbIzAgVVgvRnCMWqMRFOvPYnpjA83YaOBXJvvnhg9Z8qZMKMpitn2datXvXPN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkcypWr1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRa1eika; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkcypWr1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRa1eika"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518f7cU2740401
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 11:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvqGEC6ifzGkUuGzpUjIx8yhUVpMPtXehYqxllG6p/k=; b=GkcypWr1C92z7v1E
	1I7279dSLlvFBs1QztnbbnkrZpL8W3yW3LefP9ga3hBzApBOGKAc1tezdbLNvz3A
	DeIIwrZ5FV1ENsTDahaqxUUMfRH5RJDoI2Sa1m6jWlb9agkC5gusvDGzgYttjGJI
	ocoColh3GX4BcgeUOA35BnlLot2lt+Qb0e1oLiU53iVdglzkqeR9mowRbexZrDtp
	wxmrVii+N7iLtTO+vZcH7SQ6AM3KeQnvnzKc4mtlVrjyqKgCuG7+HKepy//28J91
	phM1Fiuw8voIUZqFqI9IKvueJq/8UdYmvCMmG6gK5+KtH9jjnc5eGfyn6C5S2/4l
	wf7Ocw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqgrkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:47:28 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7e0e7455e81so26406477b3.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 04:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780314448; cv=none;
        d=google.com; s=arc-20240605;
        b=i3tr46bZEsS4H36Vd3OzbPNc+D7uTZZqY6APj9jJpHigrk1JknIOvU3aSMA/HtEyYy
         BGnJWMFlfiTJeTkvxMMbu9X2sj3uG9xb57mMk0se5VMrozhvfZ2ld/uALXX8mC3wR+LT
         MJf54+cPeGGQFQIlYrCBTHqpGyQ0IWmh0yZSUnlbKKzdccPtA45AT506cv9z6kSdIrOz
         v0xQ8MDGagX4juWovAlHhTYkBnN9XVu3QoaO7n7160MY0gAXVELbu6oBjLbTNwMw+wQ1
         Jyl9bufuY8QedClygyNGnW39UDcAnVF9LBstbUyaM7RO2uhZTQpzH2F0sEFFs/QdfqpJ
         NzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvqGEC6ifzGkUuGzpUjIx8yhUVpMPtXehYqxllG6p/k=;
        fh=L/wulp2J73lIYgDg3x1L8OgriQJgcoHJZ0RaZsVk1TM=;
        b=bOp9w7Xq2B+kLNk9LNonIUHaBnJkEvvkdFhUn7KoQeFPw7kl9JYStWLi/ONx8Wxow9
         rYvhTKOuOZ7ucoPIc920fa/TNbfDm6MoYo9IWj8yKbPEHDDWLXORyoWZuhtC34cd/WiU
         fsvr5CBot1WKbu4tB2muBKhIVmgl07vZXLP3e86pIRxjPXDCMmiRcXsPYWCYURC5lgRz
         HXklLWs49rLXuKk4jRJ+s+rQVAmKY+qBaUwPtyJySesVF7Bdv2EHTjvNVUqFsncBCGFP
         j9kiW7y3JUj6DLgvb9BIh3GJ0eDQq0ZWEhs6n3hiXFSLHFlDU1ArFdLG/kknJXAQc38s
         dUsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780314448; x=1780919248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvqGEC6ifzGkUuGzpUjIx8yhUVpMPtXehYqxllG6p/k=;
        b=RRa1eikalCMRfUvlz+pHuNCbrl918c6xtqUNKov3jbhP9PW+lET5URs6YsIhR3w762
         6Ui96SgNIP0Z8ffPSljSkdWJNuhA2RqWUwWqOL/Rw45bfgRC8U2aIZvL0fw2PwVwOWS5
         itlIo7f0Ej/vgfHDuh42eUnjGJjIYcktBpKXniyRj2fel6mlVt4uQK0ZwaTDoFJj+XGB
         IxxI8IhSYqqHoA38qTgsU9ibb8fkMEWumXbd6s2bATOATHvwgcOFE7Mfo9T9keQew1Uq
         fGjBU8tSxbD/We6DZ9wfEAkf4tZp78VoZmp27F+q3rjYbsu1kR132MkVpI5JG+E2GUGy
         4Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780314448; x=1780919248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VvqGEC6ifzGkUuGzpUjIx8yhUVpMPtXehYqxllG6p/k=;
        b=mHc90zJ/VGKa0+ruzgrK4y+wV3RDE8OGRTcIop8B3UIg2FpMfZKKwsEg5hLPw+RE5M
         6Exeur7qbcqSz/qanaB8lsANQTN6vwgAvPmk00WlgLvCRNP0SRYDPYYO9A2YNoWtW9Ii
         KlCoGs8NQ7u+/pwnV+VVXGfDYXP0RChKvZrdPhek02kljgJG1DqEArI3DK3GxpbIcArX
         prSV+yxzrynl3EbFSH0p2w7HF20ksdo8/JgIra5e6i7QNVFctq11MM6FnR8dk4AB0GLM
         9e8TodeU50bEOMQhdKrIWXAARyD0iQOQznPBuY8cdY37tACQazPDSoeyenOEFbR0xDPG
         /ETg==
X-Forwarded-Encrypted: i=1; AFNElJ+/53Fj1/cAkcSTsgYFxgEQv6QbDm0izvqg7yz26J9lxCp51vEB98ejYt8MSn4koa8fJfeq62Uxrmv0@vger.kernel.org
X-Gm-Message-State: AOJu0YycvEMKSDOMeo6bkHFYvqB314j6U69gjCTojGNShw9Lg57A50eU
	8gsutRUaVu1vO7pqU7I97HSGW9u41+TJOVPMbWJXrcAXHukPsnrVCVDQXpobGhs9nl6sf0nHKQG
	omjj/HV/rzFBULByIIWS4GkgoO/pS0FZyLEzYmVZhtithnV2p2uZLZqCSYFCXvESWZP0NravVnR
	KVEQ+DJFhSC4s/luKUzyJerIu0X9jeY47N3X2QPCI=
X-Gm-Gg: Acq92OGn8rFmUQRVHpydyDizN/kaqwM9SNzPZymcHLMk5fi5M3QPEI+5PTCQPIkon3f
	G51RZfNDOzPhfRWFxeZ73aWpepIC/5hlg16+ca8zXw1OVUBWQ/OXemoKPZ0T8RsqiJ38pgIZTHz
	CJIq4mWqtD2IjTpb0b6h30eA0yg4udkbNZ80K1DZU1ZHPHf5tasyKKrxYbI2BMjFiBDoqqloVTg
	eBpfrEZ10YRdaVylg==
X-Received: by 2002:a05:690c:4443:b0:7bf:107b:f859 with SMTP id 00721157ae682-7e05bca9162mr99548337b3.16.1780314447728;
        Mon, 01 Jun 2026 04:47:27 -0700 (PDT)
X-Received: by 2002:a05:690c:4443:b0:7bf:107b:f859 with SMTP id
 00721157ae682-7e05bca9162mr99547967b3.16.1780314447242; Mon, 01 Jun 2026
 04:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com> <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
In-Reply-To: <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 19:46:49 +0800
X-Gm-Features: AVHnY4J1p8F5jsFZwifVV_h24EYqL4UGX7pK8oAqWncPXMIfn83MqsJ5ey2uRcg
Message-ID: <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: yjITMGinmRS2ynq-oFuMUlJLaCCqnAlc
X-Proofpoint-GUID: yjITMGinmRS2ynq-oFuMUlJLaCCqnAlc
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d7150 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9GHLgsx_nEScqj7CA7cA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNyBTYWx0ZWRfX/Yqlj5eU1K0J
 dFqY0oWDkxRt68L6MSM7FYR7HPOfPyIOsDOBvFjIDGmIrNqdaM3TS+AvaBFQ+ZjeCOOfLE7SeL+
 hPMgITkkZPupT1ZdTpTIRA073gbGfwACvvR6GliAHIkRTwxmzpDTrp2yG8w7JQ/AnE+Z3PX2jO8
 t4et/SPR5sTbhdNgFe/1Py4Y70WJyJ+jPM1pf2o4UvS+6glURPDCS2JReoe4HdI80UjSQ/1hhzt
 5nveiyLod1GsKT7Xv5Y++zJClKDQHJn891eLsYVHWp/FijwZeWuBVjXB5jik6Xj2ed5ArOfb9c5
 YKKDi1J0guNasWBd+Ghw/Zrv0fPJq0R4M2XJdEodUOEjP5dlIJl8YXB2giCoa0aSItyOkxvqh3X
 x5LC1KF+iQIgpjD2i9ja0V/YB0m1qDEvmKf///rnXUR7xt1hyzdyZPqRpIJVLpIRAWecoV8uZRD
 DHboJ+nvtxT5sz0CiiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010117

On Sun, May 31, 2026 at 5:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:
> > Add support for the QCNFA725B M.2 WiFi module (WCN6855-based) connected
> > to PCIe0 on the Arduino VENTUNO Q board. The following DT nodes are
> > required:
> >
> > - qcom,wcn6855-pmu: manages GPIO56 (wlan_en) through the
> >   pwrseq-qcom-wcn power sequencer, and exposes the WCN6855 internal
> >   LDO regulators consumed by the wifi@0 node.
> >
> > - rfkill-gpio: exposes GPIO54 to the rfkill subsystem for RF state
> >   management.
>
> Instead of just providing a summary of the patch, write something
> useful. What is GPIO54, how does it control the RF, why is it rfkill?
>
Will update this
> >
> > - wifi@0: describes the WCN6855 endpoint on the PCI tree.
>
> Drop the useless parts. It's obvious from the patch. Try describing why,
> not what (yes, AIs are bad at it).
>
Sure
> >
> > Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> > ---
> >  .../boot/dts/qcom/monaco-arduino-monza.dts    | 108 ++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> >
> > The Arduino VENTUNO Q board uses a QCNFA725B M.2 PCIe WLAN module
>
> Is it just WLAN of WiFi/BT?
>
> > connected to PCIe0. Two GPIOs are required for proper WLAN operation:
> >
> > - GPIO56 (wlan_en): The WLAN module enable line
> > - GPIO54 (rfkill): The RF kill line
>
> This should have been a part of the commit message.
>
Will remove this to commit message
> >
> > Testing:
> > - WLAN module (QCNFA725B) successfully enumerated on PCIe after boot
> > - WiFi scan detects available networks
> > - rfkill block/unblock correctly toggles GPIO54
>
> Drop.
Ok
>
> >
> > Changes in v4:
> > - Replace regulator-fixed + vddpe-3v3-supply with qcom,wcn6855-pmu for
> >   GPIO56 (wlan_en) power sequencing
> > - Fix module name QCNFA765 -> QCNFA725B
> > - Link to v3: https://lore.kernel.org/all/20260511-linux-next-v3-1-3e22=
737e71eb@oss.qualcomm.com/
> >
> > Changes in v3:
> > - Replace regulator-fixed with rfkill-gpio for GPIO54 (rfkill)
> > - Reference wlan_en from PCIe node via vddpe-3v3-supply
> > - Fix subject prefix
> > - Link to v2 (wrongly named v1): https://lore.kernel.org/all/2026050105=
1918.1990713-1-qian.zhang@oss.qualcomm.com/
> >
> > Changes in v2:
> > - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
> > - Improved commit message readability with bullet list format
> > - Link to v1 (wrongly named v0): https://lore.kernel.org/all/2026042503=
1712.3800662-1-qian.zhang@oss.qualcomm.com/
> >
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/a=
rm64/boot/dts/qcom/monaco-arduino-monza.dts
> > index ca14f0ea4dae..bd5b8a161e7f 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > @@ -153,6 +153,78 @@ vreg_nvme: regulator-3p3-m2 {
> >               enable-active-high;
> >               startup-delay-us =3D <20000>;
> >       };
> > +
> > +     rfkill-wlan {
> > +             compatible =3D "rfkill-gpio";
> > +             label =3D "wlan";
> > +             radio-type =3D "wlan";
> > +             shutdown-gpios =3D <&tlmm 54 GPIO_ACTIVE_HIGH>;
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wlrfkill_default_state>;
> > +     };
> > +
> > +     wcn6855-pmu {
> > +             compatible =3D "qcom,wcn6855-pmu";
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wlan_en_state>;
> > +
> > +             wlan-enable-gpios =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
>
> No bt-enable-gpios?
BT is enabled in node uart10
https://lore.kernel.org/all/20260429103537.1282497-1-shuai.zhang@oss.qualco=
mm.com/
>
> > +
> > +             vddio-supply    =3D <&vdc_3v3>;
>
> Please explain in the commit message why 0.9V, 1.3V and 1.9V pins are
> supplied by the 3.3V supply.
>
Sure
> > +             vddaon-supply   =3D <&vdc_3v3>;
> > +             vddpmu-supply   =3D <&vdc_3v3>;
> > +             vddpmumx-supply =3D <&vdc_3v3>;
> > +             vddpmucx-supply =3D <&vdc_3v3>;
> > +             vddrfa0p95-supply  =3D <&vdc_3v3>;
> > +             vddrfa1p3-supply   =3D <&vdc_3v3>;
> > +             vddrfa1p9-supply   =3D <&vdc_3v3>;
> > +             vddpcie1p3-supply  =3D <&vdc_3v3>;
> > +             vddpcie1p9-supply  =3D <&vdc_3v3>;
> > +
>
> --
> With best wishes
> Dmitry
