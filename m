Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC0741F5F6
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784209060; cv=pass; b=fhIYr+o/+U5CUxqO68u60pAP45y6aJ/RjkkO6QSVwS7WGY/gz4kuw9llr/v+2C1rKRJcE7n+b2Xe4Td3rrhkZmXO2wcur2+Dg/TstFWcOUYMEgaTi8AHh4D/qeCg11exeV5VtyStwTsRbqYs05R083/LAwh2U8oQKZCnBAxEAf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784209060; c=relaxed/simple;
	bh=1aXnFY53krYuOZuQpV2j2RhkeAvxCo1KAwi0UjQa3G8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMmdhdyAD/ARtAMhJWBgxsd/9ITMh10R2Tu4xgS87Ub4oRNZAjhff5/kmAfi679r8qBv8UposVLCKIjWy4UjTNJ6o3D222KrUm6Xxpw2SqrXscLshUiqiqstldmXc77tC6nDYAoUe49T63yYlYlTZnoiS/kCd3SqP8IyZ15uT5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koBtFBM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOqklBCy; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koBtFBM+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOqklBCy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJslu2734773
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 13:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7wiIfj5l8bSUfyQ2Jq7YXo0v5uKuE1RL41eHyKAd4Y=; b=koBtFBM+1qmC14tw
	RzE0fIEWxqBlfrZmmXzos5RSoSBfxEXFDu8S+SI+370w6MxHy5uhEeKOzBoQxryq
	gmcXaSTPW8h4k3LNfY1BDTVnseL92z7YcD6Mp3B6ebRbY96bDBZDrXHVZKqadwwM
	6x/r/dXYNy6I+py8B37LcOLwZLgbtyT8mgJupAnGzRG6/nT7d0kX1qhkFdJ5eEk/
	Rt8Im2df7hlxAzdqxNjEvWfhyhZkVKbdU3ZrwF8Cs9UV6fwzCVpa54aLTIACV7Az
	HjYt0V6NDCIAXeMSVVxtBp5zZsIOpQF3fDvTwzh8fMKVQCWByyb6F3OP3gLQyEOc
	vrjHZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv13fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 13:37:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e61b38eddso1183831385a.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784209056; cv=none;
        d=google.com; s=arc-20260327;
        b=ZyvFd9ryEOU/PY9Emf+2irDZWti6LPCT3hoHCQdwNqKCX0Y/NqBjCQZTnLg00rMoOg
         gJ5lCnWBvZDF5w7GOyLkJGzqZJn6ZZidrG1Qu2xExwbI18qo2ftCDPxMLocAQ1wXqA8i
         caKfbYVKhnshW2vM3EvXbdXBWVRD+T3XanSaFQIr4lLVOzJaCGd1UCgWmTiFTlSfTMZ+
         FLpylIrl1cvihV7anl+PJRT27ARmBY+D37IHRvOS7M2YWnqEXE6GVatS1I6c0K8mtAP4
         +QoS+bMzpN3HQ7sBIKtUFKImmCrU57VKygrSCY/wnnYxkxgMCQNyn4OqizIlK5CFJruu
         5OTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X7wiIfj5l8bSUfyQ2Jq7YXo0v5uKuE1RL41eHyKAd4Y=;
        fh=gU3dDyNt90r8W2w3ADYOUQaM0qBT2kfiaO1RCZ7UX+Q=;
        b=N4EoAVlb2jV/Mt0SQYLnK0RzTxDiBPx51lPPhYR/Gbpzey52FjSP2kcyhqySQR8QiL
         2R8ScGPFlXjQnffN9fh2m/c5YE9K0r8Ume0SEwgJRg8IOBU3B/1hzJ/IYCC63ttkohtH
         RUWjlQGIKwep+9xxklbcZgyUJLvzINiCHg7b0OsRk1NXKKfGtpZDBNUpuWpPuWTGEO/g
         KKx0Hn/nHp0aFNZVBArTgYkBnBhJxwCkxWVJNlQykTSflX6jc0inhzmaSZvMiXOwL2BX
         tD9scgq702EedpMCOUovfiB43ltWclkduVyEjoJDjg2GcoJo4+rWOCVMOEBubNrYXT24
         m1ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784209056; x=1784813856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7wiIfj5l8bSUfyQ2Jq7YXo0v5uKuE1RL41eHyKAd4Y=;
        b=BOqklBCyotuyFPc2yE+ZJSoE95q1kkRzY7/iTValDJw076wHbe7PnNZGu8KrfTdWhV
         WvPHI8RGIsWCjyuU0EyqWXKp544iNwPlJC4oAJmYbgGiKL7CJv5yyu0fbtIosFf/bROh
         Oet+6b+ktVQKUPMxNBbAAUDCt5LWM+MDOc/U3lMYdXkXwoqWrhcd3SWDGW/HTmBuliw/
         SaKUIyycPKLC5TE2zz1Qh01LrHq1MDkObinAf0noYpdF/XxR5GoOp/+nSaNEPXJxPc/k
         pI5RARRMk1VfEEDYCxE73RgVBdx42CeQRXS/DF5OI93pQk6zF9pLgYdZqsmKUy4o5ZR1
         h5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784209056; x=1784813856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7wiIfj5l8bSUfyQ2Jq7YXo0v5uKuE1RL41eHyKAd4Y=;
        b=MV2IdRgJN1QBjfj3W9+JlS1+78IYWpaFM/X1ykNsbEQExIrSws8OKHfBNBDW87hYGp
         y/deo1DZvEvowu15n3YuUTO2tnqbNAxaraUfMozh8BaHCyPOIwSqbGfGr3ts+u79ZJ9k
         8kGkEFArYuwQtoJxMPHuRs0xJhAJFcduMINXCSnHBQUKxSziQbHfyEoLaqcWvMTSj2T9
         6F7khby2jurFPQ1mwE1V2ZgNoCbXhdFYAr+G2y6b5To0yPmKrISqXUeS3CnnkGxFVepn
         //u+VkP9FMfFnramKTLs3o7wZ+Hvir5M5evmsLgShe5UNYfYBwzki7zmnuPpA6No+FkP
         qdHA==
X-Forwarded-Encrypted: i=1; AHgh+RrHMaUigqHfGEKxMwIKMhMMfObRheYnusCCn4asS5Ew8oJjrheyNjZPz4XD+/NUhMLRQxe+LoWc2G0Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yxukm1GX96DTfheALZZmeangcPEQG4fDKK0OvSHEmeo70j70VDB
	wn5JD33g0kkjqKp9iNjsLfqKEn2rjRjGm++eFrfMyJ0AhHP+tX8ltJa4c5z4DSV+X0v+FpWhxRc
	5yNshdDatOHQmw8ZXSkvNTfotLTA8nv01gYgUlibUxVSR2c+ABazRhuD4R7uSPAA1qk/BQ4WI7V
	k/zI+XorISNjVEvJh9WBplD7elrHmoW0ch5K0E368=
X-Gm-Gg: AfdE7cnt8vNzyJwY01rLm4B29OcWoGksdHK/dAuykP0MkpP44orP9+2nyE3LLh1hNqW
	0UD1IRwSf7bSlx9QQmb/LGACyIV4yKYxbVDpeXfAbmFLOc/+rJ/vjk8Z+FtGbniqCEzhigyjyQ3
	KjHvS0BhuxrptbzfShy1+h39rj4vPrr7uLuvmJfZSnb+7lt9Sbty7AoM+nrC4eqYuduKGxdfx7s
	lJD4+t7cfNR/PQ7gaU4pdVekmZyITvJvsBbmGiRyAzJ0p+zOVIl2SHpcachl81zz/hkNavEw7Ki
X-Received: by 2002:a05:620a:2a09:b0:915:94f7:55df with SMTP id af79cd13be357-930961ec42dmr789767685a.20.1784209056490;
        Thu, 16 Jul 2026 06:37:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:915:94f7:55df with SMTP id
 af79cd13be357-930961ec42dmr789765185a.20.1784209056076; Thu, 16 Jul 2026
 06:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-1-98ae32bfc49a@oss.qualcomm.com> <CAPx+jO_6KcZyp=4HuJqnYY40VKt1ee+si0BEpxUE+1pkMFtvCA@mail.gmail.com>
In-Reply-To: <CAPx+jO_6KcZyp=4HuJqnYY40VKt1ee+si0BEpxUE+1pkMFtvCA@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 15:37:24 +0200
X-Gm-Features: AUfX_mzUGsJpNZbOCbBzK6qgEgvOrmyZdlmDjPAHBJOztrU8oh-UhYCbNKmWFvI
Message-ID: <CAFEp6-1CXaOHFnbSZ=ijwSi-nBnZXv1v+DhjT5P3GQoB+zB1Rw@mail.gmail.com>
Subject: Re: [PATCH v8 1/9] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzOSBTYWx0ZWRfX+4AIZGXWI2B1
 mNiZnPLXDKT0lQJGHn5hhIHaP7IwtAL5y0mkf6u/B8rmnUWbOg3Tw1gYfnM3KR4SurP5J73bN/n
 sC8xGWWc39LswI8NraPGo6Q7E7YgjF3xX9J1KF4NIfpdX4g5U1rFx6HAuDVFK454IRUz3vViygQ
 HcYPReXnYu+J3k4ZfYs4/WUz6gQYU0LyGMaUJ+4yI363+SZvjnIHyH61D0v2l5rSLw0e+ZxMR1F
 nVzh+tn56R560uWqVzZiq39VvavFd84XAj/l6R7YiPNgL+bL6jJmuMIRqk7PqlWLMUToHm5SWBa
 lQ4b/CtQ0ElCr5x4Txvj1xOlTdCHBtZ4JYconKede4LhX4TTdn4L8wQNBWsqP+wAvffejHOTu2P
 YFZYBthq5zECskWu7V1uRPYOd13gwQrAsV71RbpySyEpr/KjyMha7DkRgAaKD3n8enSt+ZPSX/W
 AJ0CldoAseBV7K4A/AQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58dea1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=qKCy34jk-mlrzchimWYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: SB-E3AvSn7NsGBDVzKn_ZZ6-PY4PSBm0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzOSBTYWx0ZWRfXx5n7wKfLFkVV
 7piID2QACWOuvxP0+m68yzChjU/ilG2ytl94Uh1GARw8KrqJD9rHJ3GApmV0GTRieDr14peV6nT
 cEnM/XFjaCd75Iey+k+WQ21+i3KGch4=
X-Proofpoint-ORIG-GUID: SB-E3AvSn7NsGBDVzKn_ZZ6-PY4PSBm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160139

Hi Ulf,

On Thu, Jul 16, 2026 at 3:16=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> - trimmed the cc-list
>
> On Fri, Jul 3, 2026 at 3:45=E2=80=AFPM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
> >
> > Allow an eMMC hardware partition node to describe an NVMEM layout so th=
e
> > partition can be exposed as an NVMEM provider. This lets a partition
> > (e.g. an eMMC boot partition) store device-specific information such as=
 a
> > WiFi MAC address or a Bluetooth BD address and reference it through NVM=
EM
> > cells.
> >
> > Accept "fixed-layout" as the partition node compatible, in addition to
> > "fixed-partitions", so the layout can be described directly on the
> > partition node.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> I think it would be nice to have some version history here as well,
> for next time. I noticed that v6 was reviewed and ready to go, but
> then something changed in v7 as those tags were dropped.

Indeed, the changes in v7 significantly reworked the DTS and binding
structure, so I did not carry over the tags.

This was called out in the cover letter:
Rework bindings/DTS so that the eMMC boot partition can be expressed
as an nvmem fixed-layout rather than as a child of fixed-partitions.

This change was made following the discussion with Rob:
https://lore.kernel.org/all/CAFEp6-20FXTOKQ6EPuR8OUDkqE4JXcUbXaFy7kRFt4fzsz=
PQCA@mail.gmail.com/

That said, I'll make sure to include the version-to-version context
directly in the commit message and/or when such changes occur.

Regards,
Loic



>
> > ---
> >  .../devicetree/bindings/mmc/mmc-card.yaml          | 23 ++++++++++++++=
+++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Docu=
mentation/devicetree/bindings/mmc/mmc-card.yaml
> > index a61d6c96df759102f9c1fbfd548b026a77921cae..0422894508478c8d0ca6829=
2b58a5fdbee218358 100644
> > --- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> > @@ -38,7 +38,9 @@ patternProperties:
> >      properties:
> >        compatible:
> >          contains:
> > -          const: fixed-partitions
> > +          enum:
> > +            - fixed-partitions
> > +            - fixed-layout
> >
> >  required:
> >    - compatible
> > @@ -86,6 +88,25 @@ examples:
> >                      read-only;
> >                  };
> >              };
> > +
> > +            partitions-boot2 {
> > +                compatible =3D "fixed-layout";
> > +
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <1>;
> > +
> > +                mac-addr@4400 {
> > +                    compatible =3D "mac-base";
> > +                    reg =3D <0x4400 0x6>;
> > +                    #nvmem-cell-cells =3D <1>;
> > +                };
> > +
> > +                bd-addr@5400 {
> > +                    compatible =3D "mac-base";
> > +                    reg =3D <0x5400 0x6>;
> > +                    #nvmem-cell-cells =3D <1>;
> > +                };
> > +            };
> >          };
> >      };
> >
> >
> > --
> > 2.34.1
> >
