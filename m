Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C6403E9D
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785760058; cv=pass; b=Eaq37BjhlT6rzxU1S9ViTftTSPErpqmO5F/4zkREE3IQXOD+aquiGldDuFP2gPpIsJGcNk2QKSxZwq7t/d9nCD938pq1XeAMGr0ivnwtS99RfrcCmC9vgL94MxJboREXz+phLxrGQbr6uqr47lF+aceoNH5DGq8+jPUEeIAk6DE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785760058; c=relaxed/simple;
	bh=8t2b3lxGnBqDFg9CDbFOnXkf81lMov01xY50g0Xv8iI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9rePdav3pMHFw7PJDlkyPYvd+/5xcGYVnOhf0WJFtso2ISAvWo+Nm19mXVd0TMmrroTbrEA4GbuZorf7kSq1PVIseQTfZmB7RJP/3lRBcTllIUw31nWwRr5fBE/DHDBn48whYVRdI5zha0d75dKhc35pf+5TldDKGvj4fcSovk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6wIsQB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyoZMiIw; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6wIsQB3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyoZMiIw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4UlV1722048
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 12:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IL0YAibvI8JaOTIvCw3rwIszIsz9z2Uq9frc097mPdo=; b=W6wIsQB3x36xZBAD
	FkMv8Jk9VXjvqUSzPWzZAYxQhgS79qzFdKiO3ZvSO/3yLLiA79jDT/V7hRrDpnIK
	RisUQ61t6/Ws15jOJ5UNnYKYSmHz1P94L6HIO9q6aHG5AF0j/RcXJUpVMr4q/XWx
	XdXfj+S3lKAZ6/A5jIRzFvcZeSxVRrCNWFzf4003NSKgTCs6ovzS9ShcJSOQdG/D
	TJDT0FHdu6VzBYNu9ekXW1o3G2ySt3qArg2vlQ2zP3XojsFZmKhZJtjZbZ16HrDF
	309b8iYMmAECX8CgYCMzNQA8JcBvJR+xdE039zxtOhT0aPjPZvF6hudh6LCTYLjQ
	Hw1MOQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fak54e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:27:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso33953216d6.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785760054; cv=none;
        d=google.com; s=arc-20260327;
        b=j2ukkhFaHUmiGdJI4+mHA2MDokD7+cp78xnVFOM2SZsxQW/OWQ+qwOPupLVGcNE6vv
         aD0bVo0Cc9hQIuxJYXj/Ig6WQ0DcRl6Ver9zkFz0PzGD+VMiHZUBjlyzeR1kExtiSmvc
         Jy0sa1Rl33F3t9F2rR9OVbkq/MD6IJ8fnc/mlWORbsjdIEKSUkPR/hIiaOBJlbgJkBf/
         Obsi0aZCTKl3fQ1It7iE93epy7DPQFax6k2n8zZ9kTo2FQdmN6Q04+3r464ovoOM5tqI
         wNrl1VvvDdPmYiiGFN96j75kNaozrOtJ++ugYNxkFb+9uEXF/67PoQGMQf9axJAmI4TT
         nlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IL0YAibvI8JaOTIvCw3rwIszIsz9z2Uq9frc097mPdo=;
        fh=fdvt8Mc7mtB0Cc2prQ+KxAV7Hz9l06HMlHKyYr0m5Rc=;
        b=YmQ+pnzfXUr8NXGGEzjxhDqQ4MD+XE/hQImh9T2yuSTsacYIDbDBjNyFDCy898HLMf
         QncwCaHdbPPVvu6UWoDfLDsCi3sNYGGv3Iv4ArM3Ul6KJxf1sp6Zy/NDXOEt49DoMvB9
         4S63wb4ENuPuyM+xQonM7Jg7bG1cvWq8wXezZMfBpkGMO4wCfCzHZuL9dw76zkmyHDEV
         QfrxF2Lh7/O9aCfPXHyYoEfjajmL+uovbCYySxdovT+x7ZZHWsVhgSbwlpNC7qMn7xBv
         vkv/twTU0ClSpFcwXJsh8GX4PY8ILwLnFYNpAGrvq7TJiDXlPDfZ0ntsF8pf6Xlmf9SU
         63+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785760054; x=1786364854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IL0YAibvI8JaOTIvCw3rwIszIsz9z2Uq9frc097mPdo=;
        b=ZyoZMiIwtqdLWLPRsOuZiy0pzK3ixx0BDTyStaOAhaK7uEyYVhbQhHQVNuz/oIOiOE
         w8hussU1/T1elGhmeryiWUMM4tsHzeRhmIsAl3WXrAVh0MbYtcNi7bfuOUlKYPxpGqr7
         Ij8xyJ+2lXutXpreplj2ex7d5VFN+Px6RlGJIAc4cQ8zbhf/UCs3hloRuOIpEliWjFPh
         6uo3qjqTP058NTwrmsSUOa/RGUsj4K+TJCdOMqdOgT/4dEtLGvDnff0LeghhLVrpWMNR
         ySo7XskPlG+8O7DwPWtKht6ZCcFFobk9y30+sJT/zIvClCEYMV6+xP/dIqH61PF+A4Kj
         XZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785760054; x=1786364854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IL0YAibvI8JaOTIvCw3rwIszIsz9z2Uq9frc097mPdo=;
        b=Ohr7+2k/OJ2Gb8xwTBpZfCIeYY/2YvNz59wGUnwmnUZ1uo3OQbK43GHMG3flTmxEt7
         Z7XD6oOtYg8OpXjNvUpzsr6DH2XNIuwb17ALZfhpLQiSJ1qp+OTyfWMREaCvZZPJlfXR
         6/hfF2onmwxFoxPSfRgKbkryPi8qzc5DLIfU9OnGGVqSAEGCHUCq52XyMC4/32tR3HUD
         sB+OYqM/SkruXXiOzIUFsBTbjf9q+ZWAFgyZMxQxzPRHUONNZdveMG+8VjRKPfwQGAXW
         tqR1VOmrX7CYBo2edpMNerWEoUMs0L7Zbdl/16am90Kau1JVWh5Sn2a21DM0PSQSF3sb
         WiCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrksGdOYZMhKxhH0KU9yx2flK61td5kOMDizlW3y/tHjxR1HHJqnWp+sOsVjfnPeP5xKODUNlUqHIi1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0CSrEkk2onGBhOmPekYf5aoFggp1LES5drATcs/udI1fK/iIf
	3ci/fFqq3U9v9lD0gpXyyaCo4VZSvvwqlU5eCUJlY3bGoX0xLz6o+dFCq2XA4hkKxfAGZXIu39S
	S1E8eGJhO/SnpheQtgL82R17rb/5Oemp7RzBE0J7ZPdyy4bBY8mtQK+1rQ+syBlKWoDCv1nxt+9
	ATff2oTjc9ErRJlc4eYUY/Vn8rEtGWW5ACi/75lw8=
X-Gm-Gg: AR+sD13/kFYqfqXd4Ec7zYH3uhdMKFfBpyU6CUEz1NNAHUmXzPrgEo7XvCOHi37f6NB
	w2lslTDqZN59PDIw7ckRhT9Z309FqW6QojHcD8+d+te89iLnubKkYV5hXxarBIcLuQrmSNxgq1v
	RTcoudGCfZDYzrZzzMuJ4IzU/GbLPFDeacohPEPgHX4Ots7cwP1keB6LwOLQ==
X-Received: by 2002:a05:6214:848a:b0:908:488b:14f with SMTP id 6a1803df08f44-908488b0344mr226428306d6.5.1785760054527;
        Mon, 03 Aug 2026 05:27:34 -0700 (PDT)
X-Received: by 2002:a05:6214:848a:b0:908:488b:14f with SMTP id
 6a1803df08f44-908488b0344mr226427396d6.5.1785760053927; Mon, 03 Aug 2026
 05:27:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722205701.372789-1-jm@ti.com> <20260722205701.372789-4-jm@ti.com>
 <CAPx+jO9w0utg5BhsKnUSgdCWeM1prOqoV0gCrTpaeuaWZouXoA@mail.gmail.com> <307ee173-81ae-4434-aee4-9ddbbc9e6890@ti.com>
In-Reply-To: <307ee173-81ae-4434-aee4-9ddbbc9e6890@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 14:27:22 +0200
X-Gm-Features: AUfX_mxc1kMmSPRDF-FoVDCOaaiFmoNXRpwiZNTqei2Fu-2tdARSI0YMPYEGSSw
Message-ID: <CAPx+jO_3tHk7KWjRs2dCBJC8j9FnKz64Fp2BtcmKSZSTNUGd_w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: core: Add power-off-delay-us support
To: Judith Mendez <jm@ti.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a708937 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=sozttTNsAAAA:8 a=ESAVbi1KNat6v4_x51MA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Vhef7JHTlMPg3iumJIBY9s0ttBgam67g
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExMSBTYWx0ZWRfX/VYMn7sDEIA2
 fG9XaEwvTBVa0V19iBYDccGsmcncitGBXDNWQ7yHKFHa6k5mLgn80X+A+nkRUmZkd+IF5BRogG4
 AJfuUAW0FLassCiK9qWu1jbrr3zBvjA=
X-Proofpoint-ORIG-GUID: Vhef7JHTlMPg3iumJIBY9s0ttBgam67g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExMSBTYWx0ZWRfX2cEKmfOzcP38
 iURakc0BYBe4sUiYB2QnjM4QWG6j8iLwhkLw2lb55I5D1u8cy1S1QTI5cQgxjo2ZBeMUpmtNrNO
 Jl8EDMvd3yxRoDtKGvGzbm1VNsuSVHKyMLbut2APt35zwUNN9mM/oW2uY6RGHnAbfKit57GV8AO
 m7fdF6uEFK46DmwIBW45JgV7MxEaZLNhxseLPtK2sIxf5sGqVM+b6hz6jm305oyV/5C1n/iIVvl
 DkaGcQQT5QLhUqHqQmwpOAQdey3VaF+QqueQRXmudxhhxMisTMw/oKrz2+tWGTZ8czStJc2lXGH
 yB1YXRXAxq1WN72eHLc8auEGYw3/vEB8dGGL36rA0e6Vd4jle8DBz7bPl8ama+m3nOlC4n9mnLH
 sOMNYTmH+eBYcr8dg5wuvi7ZhvFxjT5E9IQZNkvqOYipACX40ho7VIXhdHJwMIVwnw0mXyzbVQp
 JSyyczdR3fXUw8WqhwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030111

On Tue, Jul 28, 2026 at 11:56=E2=80=AFPM Judith Mendez <jm@ti.com> wrote:
>
> Hi Ulf,
>
> On 7/27/26 10:16 AM, Ulf Hansson wrote:
> > On Wed, Jul 22, 2026 at 10:57=E2=80=AFPM Judith Mendez <jm@ti.com> wrot=
e:
> >>
> >> Add support for power-off-delay-us which shall be used to specify
> >> value of delay after deasserting power during MMC power cycles.
> >> Default for delay is 1000us but custom delay can be passed in to work
> >> around hardware issues such as slow RC discharge on MMC VDD rails.
> >>
> >> Signed-off-by: Judith Mendez <jm@ti.com>
> >> ---
> >> Changes since v1:
> >> - Move delay to mmc_power_off
> >> - Fix dt checks and remove print
> >> - Move from mmc_host struct to mmc_ios struct
> >> - Rename post-power-off-delay-ms to power_off_delay_us
> >> ---
> >>   drivers/mmc/core/core.c  | 2 +-
> >>   drivers/mmc/core/host.c  | 8 ++++++++
> >>   include/linux/mmc/host.h | 1 +
> >>   3 files changed, 10 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> >> index 29e80e5f928e9..9472041fe1c20 100644
> >> --- a/drivers/mmc/core/core.c
> >> +++ b/drivers/mmc/core/core.c
> >> @@ -1388,7 +1388,7 @@ void mmc_power_off(struct mmc_host *host)
> >>           * XO-1.5, require a short delay after poweroff before the ca=
rd
> >>           * can be successfully turned on again.
> >>           */
> >> -       mmc_delay(1);
> >> +       mmc_delay_us(host->ios.power_off_delay_us);
> >>   }
> >>
> >>   void mmc_power_cycle(struct mmc_host *host, u32 ocr)
> >> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> >> index b7ce3137d4529..fac50a2860211 100644
> >> --- a/drivers/mmc/core/host.c
> >> +++ b/drivers/mmc/core/host.c
> >> @@ -421,6 +421,13 @@ int mmc_of_parse(struct mmc_host *host)
> >>          device_property_read_u32(dev, "post-power-on-delay-ms",
> >>                                   &host->ios.power_delay_ms);
> >>
> >> +       device_property_read_u32(dev, "power-off-delay-us",
> >> +                                &host->ios.power_off_delay_us);
> >> +       if (host->ios.power_off_delay_us < 1)
> >> +               host->ios.power_off_delay_us =3D 1000;
> >
> > If power-off-delay-us is specified and the value >=3D 0, I think we can
> > respect it as is.
> >
> > This means we need to treat "0" a bit special and bail out in mmc_delay=
_us().
>
> Ok, just to confirm, then, you want to drop these guards in mmc_of_parse
> and instead catch 0 in mmc_power_off?

Not exactly, if mmc_of_parse() doesn't get a valid value (>=3D0) when
parsing for "power-off-delay-us" it should not set
host->ios.power_off_delay_us, but rather rely on the default value
that we have set in mmc_alloc_host().

>
> What if DT parse gets garbled and host->ios.power_off_delay_us < 1 is
> passed?

See above.

>
> ~ Judith
>
> ...

Kind regards
Uffe
