Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163584;
	b=wW7hSa0KGDVfrt51CmDZzHBIgg5yfe8C1+pmMdSBUEPhauZho0CdEbc165MelNjYoz1v
	 zapiaEcEYJNYIoNv1Zd15x5TGbaDL2E3bTdruUcdG1U5LM/2D1ieccLSWt+cJAT8DhKdE
	 Pf4VnOiHaNvn1CLTX7qC6YXVhG3TOQIVMeZ02CRblUBqawFFEKJKLhh6tt2wcKpGEkIC0
	 /XyHNvV1yiYxfAxtPg7GNVVCQPxtbWFqDUajsgTKbY3QrRmdgx3mEb+sGHsnaWW8marx3
	 wubY2frtUFhG+U/opPq821a6zn93H+uI0jQAAl+WYP53aIybCr1AtRF3GCv4cH35j4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163584;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
	b=dwSfI8Nwt0xPpj5f3tTpcRVuE1dkaiTLS+DleMkyByI8VIL+ehGQ8DTaDhCcdleugifC
	 9JR8aEbHhW8s69VeGMRz8dZgOH65WXWo7atZ+OZ8Tjt/7Wvs9kUsU2woQq0sxqY6Ucawg
	 INBwfMoK6uhLwM4kHXNTZmPbaipJGr0BXyLyVf8mRCe8QpHLdqn1Ec+Vhv9jGp7AQmk+1
	 Z+oJ5oMCJ6bJhoKmoQ93L1onBhrPxy6hGKd3imvvVMTteTmPBaOQJk2Lr5gLCg4HOxcXe
	 wFyqHjhWCuoeVEERM77i6fVR4VmdzbwqpVuq5qHRHyNY0o3bgh3S8IGp5Uu+TRpXZGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AkMpuipO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjDUV1bB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B903606A332
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B903606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AkMpuipO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjDUV1bB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f0c21742004
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=; b=AkMpuipOaXUQtf44
	LKnET7leBzKWmLPkW706dCVmxRawALoP2UOII7YjXnYENh/C/2muz/3xSK7iiubO
	yja2NECnxTbE7LHzKVAWycd4APujSgH6EX+/5oUuHEzX3AKrM7Vl+T/1tE83qdKp
	su9E68arYKGVXgclpypqQAfb814KfdaIEGXdCGVV6m2BltnYz8jUNc17U2twrmjX
	PZUmDnRTbZTnM6EZetbXqpGTcTZkbhy2gIyiUUtJ434I1xpsYXH92uIlFRA2oWe4
	DCRtQZmjYg0ebi/RL0pimpkMXyYhDXUGxvLt/XYbmMfL793SYtq8ny0p6oKGBQQW
	exHIMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4ygwwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:33:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so120877585a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163581; cv=none;
        d=google.com; s=arc-20260327;
        b=gVDqu7MKQlm5eu3Xd/xT626Umqq/iYgvqMYeyEXnPeB3A07+LcNVEfU7MmRnm4zIYe
         EWoFkbjC02SC6GWSG8yLArrVJdn2EgGOge+52zajq7mqfgh4Fgvhbvxf3e1vnTyN5vuh
         pYKlhOUw/viMYpkfRrghdD5r4M1YFMnYRV+fSxQrJwHiV/P5iI1lseePilx92xugYkEk
         PKR38sKLp/+c1WZktgZRFp+WGpVks/yxFAcN48o0oZN2xvo3EOPyTQktubuL5Jp0dM9w
         DUO9WcsfNabtbYQIRZvYE6YuGu03saElHwCygag/H81DQT+/ehOHw1Zz7XCXKxCrkUPl
         WJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        fh=eMLOxTwxsji/Vc+NrMrX2Xwin5DrW7bigdvJUA2chdo=;
        b=FQsZxHnmEXBx4ehzjrR8ET80inD9j8aZakXvBKA6RKb9Br2j76893gUQHd4OuYn+sn
         OW6vpSXvM9RDD+JxEyYZVlLMeveSyQmqPOs3wQAjSxjUl4MaEnnbuA4MJFqHASlOMArR
         p+U720q86WcER3KNZK3FlhhqIMFDmzZVviaMQ8rv+8H6GvyanKlCf8WP8uJlLRsARBO6
         S0NwofRTE2KUBPriamqdiaOt7hbNjj8P1Rh+Whk9IlhjGD9j8UlwByf+uiSMAFTbfUJl
         t+RylNpokUBgWOBDHKh75iwXdim9a+riy8+Ase7anlg+VT/GVZadyfnKgTuULpPKDMSp
         tWlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163581; x=1795768381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        b=OjDUV1bBB8I0CX04/zVwdiDQ1C2NDQRiRf8ygTU6O+F8mTbckk61CRwJbBZ0Qlm7Cj
         ntlXbDp/oy2B0GZDA/JMesmMBsWqpIYxZAYKwQCdJ76H6bDVVWkjtwruwCYt1ercwpdJ
         NeX8SZLovxWyaEcRYGJ6CR7OvuY6FOxhHCqz1ajrLAuAIfw6srJ6K9WGH8HASjvwnEmE
         NMunR9dM/X+Wkqm71Z1fFWnuitdIRu4TYVQoEW8L1F0ntwPtMYC6WFNvocIrrWHpyTcx
         h20s4bi0iNveuwa0KGMlT78GYUm/DmrFe3RPPVQUReHX2E35kN2IRUDwf31TsaG8sziD
         +rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163581; x=1795768381;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        b=Sc2/utcfm4hXfuxE10MquiisOxMu4JJZPV8XmM505nOhV6fsVwjCal/+4h1PGRYRAM
         Fa+hNi//NGjO+J8RlzquQQyL2u3oWC6Ca9vMkUFqIgpwt1Txlgg5Hj8tklGqXfX31OvZ
         FLpwZR+262UorxvCrcxxus6dUG7R3MNY+I1psVqzj5FQ0MiM8qhMlPrm4BAH+kERDk2R
         IDi5fh5z7FW+7+ufuB2i5fhV6W4B7yIeHKpnYbW9ahsu8i0DCBJbLvi9EmDRfVGsHUbW
         Yy7Gt3jjdAlbG1ep5CoNhVjweWdLC32m6/ufjfJvVrjVYAlNBzF1L753QBy/7K8kZ6ns
         pLOg==
X-Forwarded-Encrypted: i=1; AL+hErFxcd5jqopLs18ffrhQRFf/u1hnEpUbY7mAa94Di/93/qLq9bWyuG1SA7Xi8rTEHGsTf1/mRb44HlN0@vger.kernel.org
X-Gm-Message-State: APuU4Z8KNsIoiBUS+IDmcmQwGH2tCBexdah7tcFd14EzseBcUmUViDem
	U51+WOO46MP0BbDJ9wbuOaWxBHJYw0UcW25icOKjvC0rp+9+mxhHGMv4bR07hDhEvbYbIfCnAiY
	VFt72/AyBcn6Kqb0dYIvppOsVY3rlv7+TKTulBs69JA5hXjC63Mn9XS8MACZUfDc5afAg1LgrVS
	tF7it47SmjGtYq2Sdx1zqMGlHaZKefoSzn+djy+rg=
X-Gm-Gg: AYBFou1i00x4NB1rl++iTIn7R9mfnAZUCYfJyGc2yhjDlUnMxkpjO1F5upmSn9mTsX3
	TKeezYjF6Mz7uQRY6z7K3chMxrfkFKPN+im5/bZWBrwxWhLTdqI5MXLPCzVKqwVkWthY/QdUxZH
	w+hG/AZxYPz4BNk0CLS7jQn/HMjO1YvK3HhxC/ReECbSBAkWG7ttiRcvdBeqr5SetOZwwwjzsWF
	bRXzEW9yMmQcksu+zhc8u0/yuwzuQugj6RBe1iM14FV3uNWDcFU1cC3YT3t29Zvad4bz5BJszXu
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr163124485a.83.1795163581546;
        Fri, 20 Nov 2026 00:33:01 -0800 (PST)
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id
 af79cd13be357-949bda21c95mr163123085a.83.1795163581044; Fri, 20 Nov 2026
 00:33:01 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com> <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:32:44 +0100
X-Gm-Features: AclHuK9d362EMFPFXhM64AVRYKskGoTlaSxy6WxsQcqESpcHzMJ2h3YDR0lL_Mc
Message-ID: <CAFEp6-3TfPV0iy3O=HKZXPhpDpRLffL0RZZt8n9aVBk-v_HQ8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        stable@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b0005be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=idF7ahqy7yQlu2L1qvIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=L2g3GqtBoyQv0ocsUjqh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX07UlcAZB8fD0
 pG3+Zmb8/s539zNgRGnTNJJJGnbQBzOMgCQhOvJStywg/hoVi7X1A8Rk30p843gy2FsxgeYR7rx
 kVgZSD/+NkIUwVyv+1rgwVeHXX1EJ9har09mtDhDdTbyFKbZg2RgB/qtgTYLhCOd2uU4UKdgmoH
 VndUQAishVdFYkxqkOX3iusjaUhPELQgG+y1PXLgTajovn+C9wFEgeFlzjnuM/X+9C2H++ibRba
 1/zxM9KNgqQqEEZyIco4ePj6V8hhEcWlnbyrck8zW+EIsGSFfpAhqVNnKth8hH586XMUXNNk16i
 n0PjvZM5vyzhLSsfWg/dNJwh3aH2Jw24RiOsIfKwWDCmMhQWP/5dVq6piIbdegxYeR0Hy9AdEke
 Uk/dxzo44W6Z+KP+a3Ut5q2XR5QAoKX1GuGhk1KOJVGiQSJ6Lc0jL7YFCp6Qa89W3fQ+PyZi3ph
 axjsDiOg1kAP82nRyxA==
X-Proofpoint-GUID: ftyHFpncRmpimRMC3JB-cNRQYYPSFNuZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX+1a3jQFCazn5
 /QXAKqdHiXlqVFLIGxS17f+wY+vRZONCTLMoiD7unDM309KoOsXH/ni79E/3jjieltHB1vnEtQU
 C32wG27WIXukze9CXeiNEnxFpwPXZMM=
X-Proofpoint-ORIG-GUID: ftyHFpncRmpimRMC3JB-cNRQYYPSFNuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200033

On Fri, Nov 20, 2026 at 9:05=E2=80=AFAM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, s=
o
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs=
.
>
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc n=
ode")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index f300de74c4..b9666feb8b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -814,8 +814,8 @@ bluetooth {
>                                         wifi {
>                                                 compatible =3D "qcom,wcns=
s-wlan";
>
> -                                               interrupts =3D <GIC_SPI 1=
45 IRQ_TYPE_EDGE_RISING>,
> -                                                            <GIC_SPI 146=
 IRQ_TYPE_EDGE_RISING>;
> +                                               interrupts =3D <GIC_SPI 1=
45 IRQ_TYPE_LEVEL_HIGH>,
> +                                                            <GIC_SPI 146=
 IRQ_TYPE_LEVEL_HIGH>;
>                                                 interrupt-names =3D "tx",=
 "rx";
>
>                                                 qcom,smem-states =3D <&ap=
ps_smsm 10>, <&apps_smsm 9>;
>
> --
> 2.43.0
>
>
