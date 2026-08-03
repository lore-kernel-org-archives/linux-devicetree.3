Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4C8401497
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759281; cv=pass; b=sd8BMGSSmYS1zlh5LCKxNz9LdAE1TqycG9mwUD5sxcWuFN1YpdJB9pXSWi1IJ1Z8RaUJmwWyKd8CAnnLF64cth8vNtOe96cGceiEi0kSp5KjmUX0jCGPG94W4PU8Seb+/aLSWvEzT8/Th2y5WFaouWhBuQs4cfV1axr6iggUigk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759281; c=relaxed/simple;
	bh=N46OaCTnuU9L+JwkzNXlmEiTgMNWR0GrcZIOoWyazLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opwDVSnco4nzjQPhkbQYRPXAmvt6A8jLlpzAxOzdQf+ko9t6MnSgEH+tbGfpHM7k85dS3LgvPEOz1NoDABANAJLE2gJTIhsR/nWSsLfIBek44JM2l3CoBLWeZVxrbyeLKVwinUGrDP25iOm3EoMEN5suTTEjLaLx+cEVQeeRivw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEtdT7qh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AqAplncu; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEtdT7qh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AqAplncu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4ihM530299
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 12:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z68BIXPiwwO1+VvUJNPr6amEVLgz2i8l7Jipl5mMv2c=; b=KEtdT7qhAr0k6vh1
	ylMdesdvqK/magq92A/fxayeDIYDcNct3N+AEh1GGpWCXRHdj2jxa/25feUeJkeV
	hm2wLgVxre3LLcCJSLSlOHF/FuedPVCO0X3nGfsWwWDJJCRLAFU4S/d1G/B2qc1D
	14Dek0enmjyM0lmL+y8heOAC4ZK+5H+IQmDJMRPPPT+AoeT9aDa/WiEnEFbmlmZk
	t4/0JV2F8Cs6Fmr7Jf5oRdgMIx/7pqAgJY+TZoixRyeWVBs6LKKkpuJSE+Oy/KCv
	uKMLtsernE2uC7I3ALBwjbWi2stusp+7gqbJ5KPsGnuLWNoW46xO0GU+Ok5EiZRf
	Mvqplw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkhfvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:14:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f08560ea44so35901316d6.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785759277; cv=none;
        d=google.com; s=arc-20260327;
        b=abcyPM2E5Jy5SSh0myJBteM5OuPzmbUoG9lMNIRhxfQDXKBPVFZegNB8UZVaQQIMAH
         zZcEeLTFLjQTnzQUmPknJBRSIa5JGkb597Eg5AjeCQVaYhAEZT6BHEJGUE1W/sWuqhah
         2tyhB8SfATdN3vykS0AzyVTAxrTQ8J49W9UFB++94mPvzVPKl6Ac0PrPl1UMWyLi6Djc
         +zTINIXuu6GYHG9wJ9/XocMzigGRWGsIokqbR1lJabj0/Q4UtHIszas73qqns/XY5Pem
         hPHXTZPDrhGnn7cPi3vKNp8DgmArp5zd3Sc/XbWZab1CC+FQwfmQFkukD89EgZNsOSX5
         u7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z68BIXPiwwO1+VvUJNPr6amEVLgz2i8l7Jipl5mMv2c=;
        fh=erZ4Up1BrApK43t+M9/STRd0lGmnSw9Wsrjl9fZXcd0=;
        b=QTKXO8QFCovgAJAnzdixb8o6acrIdn+y5DIhz7MxOaC9MlGAov+N4DT7ePopanklwB
         ZhAJXJCcj4cegFzWX5G0C7hrTTKAaV5KXHaa3C8xs9v8KSlMksxEAGctIbxNH9mZwaiR
         55uyF7NU8a7nDQWra6/a1lks655c3OsveTixCR1ekX/MPQa2TIXYGjJDJ4HGC0ipcIgl
         H1X/osH+A6e4HPpIpwMDiiGuVjpA3UegjH1kgSRWKYymcy30x1zQBmNF1+rT5v/6QYhO
         YIgSSP430/o0DDEL5IFli0BSuAmXToV+B0kX92G9EwfESLW+BbBu7bMup9i/3ejLUj5X
         4u+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785759277; x=1786364077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z68BIXPiwwO1+VvUJNPr6amEVLgz2i8l7Jipl5mMv2c=;
        b=AqAplncuR0lrJ+jcsz7TJFRzUD0zW/vGY0idnuFp6LUgOFXPSqphXZXA/CASFTa66p
         FmYdc3J1oQJYnO/HDnNH/dZ9j8fukP548lufWpNXUMOCUDFBTSoaOQYaMbbSoS3VuNUT
         KE3LqSZC4o5QzCJmWXYIPc6L5JzZK6/OXP6OJyRZNqIidzLma7e6ni3kb/gE3RRB04bW
         xTQ2Bttxutg7IakyY/+Yj9I5fwIT7b3xkedqi7OzHOVnlkqEHmTwCXJK854ZNY8vN6BS
         f/b+61/eDqlE23eo3FDQNjym7PPtZ+SCW+sPjS7J+Y5lJuWihXPRv7T+kbUYoj+YKUAZ
         P+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759277; x=1786364077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z68BIXPiwwO1+VvUJNPr6amEVLgz2i8l7Jipl5mMv2c=;
        b=nQL4xYXQZEEQHXq26yZye99VQZ+hpYYWI1X40pZxLUCqZCzk3820OEeJ8jLanvI541
         Qs0NmiACGY06hWsEYV0SAeBnI1Qv/hOE0LV2EHUK7XtiWWHBG2AJD4rvpCRid1ho3KD2
         HCYXo7XEITNfAdGy6KOeh375CL/TADSYwigwu+Dm/Y1M5E9MGAKysTyQjwKK764PPUCX
         59q96yBBiHcDDvNI76Svemf/qBXOXLRvmJ8CmEGQ5Q0jrjhG57koFyzdnoMc3GBJu3Qt
         MCETDGN1prBKWgbAvzcD6L9Pm/Q1lwnHL4sHVt4wMMmygen/HUyW5EZ6wTCwjRYXW5Tk
         PsOA==
X-Forwarded-Encrypted: i=1; AHgh+RrN27cbnq7xp/folV2oKwAWCtrSx8yp/zZQ1Y+mGyIZO9ZiY9Zs8kowT7KV71ehoJ6C59S1V7kqzZTn@vger.kernel.org
X-Gm-Message-State: AOJu0YxZzZ/oXwHEWUNJPP5Hzooqii6/9rB2qJqA2fJ4qfI/7CjpLy7b
	f77b39LRPovfG8jr1B8DIxcdJJBCWQ3dbP6RGBBBAxh0OkbVxxY1uyqVlmbSQ8dkkZuI92zAORy
	lQQwI0iw4DBLp7yW1mHXA59U6ksfr41QujBGi/fPjNf2S7IB62OavGFZSF7KfAMT1blyoxegZ5N
	Px1mwoEDCiZrc+OWuOWyJW3/BqVA7EtvoF4AGXT8k=
X-Gm-Gg: AR+sD12hvh/AN71LvcSYh73aA9APz/HvppWfExNhTivOIb5VM+pVCpFXZNhIkRYrf73
	PdshA/NjiY0pyOmJqd9HblAZ13ee+M1qMDor+s0d+fQSGQEaGbG+BhHeSlvXjOKQPjE3Rwlx5YG
	LvasuO1Wp6FGJiUC1FqtNp52/UL1X8/ixxOq6XoabgObEo4NXVBPNDnj++Lw==
X-Received: by 2002:a05:6214:2429:b0:8f1:1081:a950 with SMTP id 6a1803df08f44-90849632786mr210024266d6.22.1785759277285;
        Mon, 03 Aug 2026 05:14:37 -0700 (PDT)
X-Received: by 2002:a05:6214:2429:b0:8f1:1081:a950 with SMTP id
 6a1803df08f44-90849632786mr210023436d6.22.1785759276608; Mon, 03 Aug 2026
 05:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728190314.2325906-1-kamal.dasu@broadcom.com> <20260728190314.2325906-2-kamal.dasu@broadcom.com>
In-Reply-To: <20260728190314.2325906-2-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 14:14:25 +0200
X-Gm-Features: AUfX_mzK-1C0mh3-O8tZGEzZLoSTAi2jZENqJ3feTTbD7BGLUaC2JKq2BREtqOQ
Message-ID: <CAPx+jO-C9AYu012zw5rUZe1-iN6779DpYUqnURfKX=5Mdi1BWg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: mmc: Extend keep-power-in-suspend
 beyond SDIO
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Avri Altman <avri.altman@sandisk.com>,
        Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
        Erick Shepherd <erick.shepherd@ni.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: KO3nLVytDZWTgPTfEgCArf3X3r7zgv5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwOSBTYWx0ZWRfXwt3dXbR4DMUp
 tfdub9M5+9fs7TlcB0Ih9155aW+hB2rhe3rsBAcnPqHMXgr2zv67Kc9DO0NIAmuH1aCXLZZdfh1
 rbzrBhXOyV4bB60WXINklCVYj5Zj/LA/m9Npv6GEvEEb8cJM9LpgSaR6WOqIN1TkPcpcsg3/n9y
 okmCegmETAWG4K3yINAQtYkf6VFrbJTsFYd2iIZznePg12tuzljgR8AyOdfnxnbPypjmgBvYQLF
 RIUL/sCmOZL2ju3wEdnvAHZ9AvlxPINxslqNBhCnALO8ht28GSfTRhiU6b7/z+wBf/fbwTfYq+4
 PnlLRhWFn+SyNpVlFtE8DOxEF5ug2jjrXUWDV9dFN132u18lHOG4eur1FGI5IrdK/f8qw0tB0x4
 MuARQWLfauL402/saIBTVP5FkC9MqyjTBushZR8WgwnFAc+nqkDo8jfrKfuFg3YB3Nwzkh/Mfzo
 f/V0w5FRvX9xi8ZroMQ==
X-Proofpoint-ORIG-GUID: KO3nLVytDZWTgPTfEgCArf3X3r7zgv5C
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwOSBTYWx0ZWRfX/81xVPfUR2CE
 hy2IRguFbAsJR0tanPeE+sc3KWcstOM9rBsvvg8vPg8GxuK8rPIEL/jr/4OH5YD938koKmQOLGW
 uhMjqYJgDcvViWn2GSnJmHOQiWmI1BU=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a70862d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Q-fNiiVtAAAA:8 a=20Cfs4-G_dBtE3sHqwEA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030109

On Tue, Jul 28, 2026 at 9:03=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> keep-power-in-suspend already documents exactly the requirement
> needed on (e)MMC platforms where firmware accesses the card directly
> during resume. Rather than add a separate property describing the
> same contract, drop its "SDIO only" restriction and document the
> (e)MMC use case alongside the existing SDIO one.
>
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
> Changes in v4:
>   - Dropped no-mmc-poweroff-suspend entirely and extended
>     keep-power-in-suspend instead, per Krzysztof: the two properties
>     described the same "don't power off across suspend/resume"
>     contract.
>
> Changes in v3:
>   - Renamed from no-mmc-sleep; dropped S_A_TIMEOUT framing per Ulf.
>
> Changes in v2:
>   - New patch, replacing v1's card-level quirk, per Ulf.
>
>  Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 7 +++=
+++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.=
yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> index 3d7195e9461c..f4663b318435 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> @@ -291,7 +291,12 @@ properties:
>    keep-power-in-suspend:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -      SDIO only. Preserves card power during a suspend/resume cycle.
> +      Preserves card power during a suspend/resume cycle. For SDIO,
> +      this is a request an individual function driver can make at
> +      runtime via sdio_set_host_pm_flags(). For (e)MMC, it is instead
> +      a fixed platform characteristic, needed on boards where firmware
> +      accesses the card directly during system resume, before the
> +      kernel's own resume path runs.

The above isn't a proper HW description. It even refers to functions
that currently exist in the kernel.

Please update and remove the software related parts.

>
>    wakeup-source:
>      $ref: /schemas/types.yaml#/definitions/flag
> --
> 2.34.1
>

Kind regards
Uffe
