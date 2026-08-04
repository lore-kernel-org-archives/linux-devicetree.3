Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F1459AEE
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841375; cv=pass; b=JRm9IgyY+axg4NsrqU1rVxMyBv+KnC4qnnmrfP5FZDONzljDm2Nipo4kkL9HxTYU1qjV3rfXd3iP+mD9zN3wn1GkjyjTCv/uiwxI0arcIaGubRMmeIP9cbaU4thBVwvzFrrpD15D18oAGvu52KlBZH1118JwodHNm+N0Q5FX5uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841375; c=relaxed/simple;
	bh=pvfa2zQPt27/egsVTaH5BIj3J7J+6hv2mqtI6MlTyTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqJo5JnqPA4mNdfLXWSpnjvdkP/EwRYjvVTid077vmZUCrQDxTtck44lqBx85F4vU/RFcvcKobIVv+Lm3CR+rZYRlnbcbRL0w4Trmp6e7CXaoxvAAvxBBXWNlOKkTT/q11Eaq540OOXdA1JuFRLq48/yLM/wFCdIxAG5ZW1vmZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mw8KMRYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKDH/GOF; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mw8KMRYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKDH/GOF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CB2x3300242
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 11:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxuMNOUsm5PWH6LUewq8G6NpcCD3wQ0J7nbDQgaEG70=; b=mw8KMRYXLA46Qr5/
	HPz5HgmKgKsyKXkvzhxtP7ie7Mp47cOnx9nENwa+HHglLjT8o7Bq/9vTRHyP1mQ9
	omn38PXswNX5lvR7/3F5L8NVGPHmYsbD4kvj7qTsRlEUeazsAZwvUTWlYXYzSV9F
	VaBnqKORjCkCEnp7GHWhG4NbhYpYVE91JX0yfgv4Ez7lwoCyRDKmyxg8c0yCk+Si
	cWpVeaU7rqoOKkhYyvXpi18xgfyk0c+aa7Jje3nm/n66ewDebSEXW0udKaiaFDPL
	om0opxJsC+JnNF49UGYtP1i/vr6XhAnpa7LeP5UTmE/1kOMG+Rce/GtdkesCJlnS
	N5VHtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p8b7xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 11:02:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so819331385a.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 04:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785841370; cv=none;
        d=google.com; s=arc-20260327;
        b=gKLUkNZ1HzI4KKBmr+FnhwHedFQzJhuCxiiC9QlgaemV/ZVL6Mfr7ebblQkqqhJo+G
         a0sc0BYt9IayXRsRPcaEH1FB8xxOn0qH36wBLGqxUkH8JLATTu5ort89WZzag1g4nuLG
         tTxr1E7fkgqpSFxXnw+8COn/TbxAbZKPCcHSmEl/tteLz7A9oqMO/155Tq3rNOcKWp3j
         PhjzOGT53S0RFiBK6SCxjz9jP+o1w2stmGsmu9FX1pwMxJJrSwKtiSTgt8g9TUMOI+9O
         qtMJpTP9faT2/jTkzL5fBWRfVBOGIx4NryNDj0MsisgGodGNapuQHW1kxC7iy7aYGR6K
         cUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RxuMNOUsm5PWH6LUewq8G6NpcCD3wQ0J7nbDQgaEG70=;
        fh=l8cy9Vch2R+6CVsimcAHTO6+o4/ymcErRuoIV/RWLk4=;
        b=OyvzkCRCJzDkeemXbCWHfld7/PZfxPAcsP882nmRoOCIqEiE2OESi6TPun4IQvXZZf
         gxqb2TB7FODRZBmWtJU0UgmoNH8iueE4Dtn6uiMyMaIOVkfkCRZc2Fnlcn8bWqba6E2w
         oTVtb2nKkdYJmSTaBkvtap9omjQC0DLRchxw+XIRLGwo7kEPVGnpDA6fYK0obb1YnafN
         Qph6nPkQaCygn900Cr6SRJJPRZOagAY+6fTBBoNZOERFdlFfv146rO9TxuiBKOed8p7R
         XTw6Eks0CsnAN900QphwZKL4UJ0r7ItZUlb2E/q0yazmdIIUsabGQzHB90hnqjpicXN/
         xNIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785841370; x=1786446170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RxuMNOUsm5PWH6LUewq8G6NpcCD3wQ0J7nbDQgaEG70=;
        b=GKDH/GOFTue2VaEfzwmOoWVW3HG1x7SBiiGj5ccaW78x5V3yFe92rp7/r050AHV+QC
         wIRpf3cL/K62vAv3n4YztYMUl7YEJNKPRa8QceMPZQ1qaCuiXLknPIhZlMe6tQHwt9Fy
         tkUBt6SDmT4cV077ThNKYcfxgi/CqElsQg3t7Xpr6zOVjpU9Ml2W4cRhSq0hU/qKNDeb
         xwVf1gDLir3gzUq17JF4L1qbMelMK+qWZH7ZqcjJxmw9Mb8JhWd12OUSxwuuW1MUYurK
         2b48M4ukDtnMSjcSlqcFWH5rs8E34zjD2PpwEVuhwCANpJrCpGqhCDe7+0qvsL5wL+cu
         159g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841370; x=1786446170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxuMNOUsm5PWH6LUewq8G6NpcCD3wQ0J7nbDQgaEG70=;
        b=f1OPvVbe9DvjEoAuW6q1WYhsKry36rEYPWjY2dBayG7Lnl9GtBnu5twV/ENpXNIMLR
         HkE7ZDeP8CISpLrpJiiN/DrHe+hVfRaMqU7DVdD30BB/Au4n3Qm0NtnBKCsa6HeJGQSn
         jAdH9yP2REIFXWmF4D5lkBoeLgz1G6dTvd80lg3yoa6qz4AAMtGwCmdPZ0eAnuos0iEp
         B8HUiyykoIU98oFycCUr3IpfmPux+2XNhAJ/INGjA0OznuFcmKYQjELT7Fes+BIoNUqO
         JvWWMkkSk2OHgue57J0iIncOrBzkWKFDIvdNwxCC21wXYjWJGSG/WoUWyP1OnUSoa2Hu
         ClvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgTWfoFp8UXgtnZrrY+E9Q92f2fmgRi+VcbLqh/0VyT4Px40HpMDLkSCakBL/iol4Qyi9jcxitzw/K@vger.kernel.org
X-Gm-Message-State: AOJu0YwX58P8/4lYCxSp4kPo8idLyZzNIra2VXb9p8kDZrJil91gmrZY
	KGY/RO2uY0CT13Tlj8Iv886hmNN4iq1vu3h1MVlE+c0ynHNRiBGJarRM1vOL0AXCPQ5RRgUmqT3
	9KLDvwwwOGajPgUuxBoHILZGEIJHKXADHt3SORomgSbnLCD6gwIZAP9shaPOngjcmz2cS5Ynvr8
	lAmVZ4oU7iXLJOLxYpZ7d717ZNNqWe/k1TW/duyDtFGBKy2LHgEw==
X-Gm-Gg: AR+sD11+OkDbjypUFi2LqI5VAmI4dJ8LTy+1ifC4PXe3A9H1FijtdHGJGFsCfy+YEYs
	7mbQRP3rC4wTY7Ak9WUmEr7s8pXF28f2nwUGzXzVPlJtB2Qb7JIsNjZ/a9sF2uRp0FLsP2BDIZ0
	pwum0fI2Tp9DDAVurmP8Xi6BPq/a/pghtIyrf1llny7qV490tkGqFzsooUsA==
X-Received: by 2002:a05:620a:5687:b0:92e:9d63:a6f6 with SMTP id af79cd13be357-934a07a1795mr1767200185a.17.1785841370468;
        Tue, 04 Aug 2026 04:02:50 -0700 (PDT)
X-Received: by 2002:a05:620a:5687:b0:92e:9d63:a6f6 with SMTP id
 af79cd13be357-934a07a1795mr1767192185a.17.1785841369878; Tue, 04 Aug 2026
 04:02:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722205701.372789-1-jm@ti.com> <20260722205701.372789-4-jm@ti.com>
 <CAPx+jO9w0utg5BhsKnUSgdCWeM1prOqoV0gCrTpaeuaWZouXoA@mail.gmail.com>
 <307ee173-81ae-4434-aee4-9ddbbc9e6890@ti.com> <CAPx+jO_3tHk7KWjRs2dCBJC8j9FnKz64Fp2BtcmKSZSTNUGd_w@mail.gmail.com>
 <c5ecd0b1-580e-4447-9459-f7455fa6c448@ti.com>
In-Reply-To: <c5ecd0b1-580e-4447-9459-f7455fa6c448@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 13:02:39 +0200
X-Gm-Features: AUfX_mzCpUo6JfNMY_DeytVj6b_23n6B8Knpsj_umOmJJ48Z32F9C_Gkn0OihFM
Message-ID: <CAPx+jO_Yc1rBcxatzByy6cWAy6JdXcLXqkOpFbAKTcEsK2ASXA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: core: Add power-off-delay-us support
To: "Mendez, Judith" <jm@ti.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a71c6db cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=sozttTNsAAAA:8 a=4rwqBcRinW2UmxHnGOUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfX1dYzS/dJ1JmU
 N2T4yP61eQZyg7ZGWmv8+CaZdB0mAdenth+BqHXBWEwHPZFgPEdnFNUbHKKWf+LEy8x+3Q1QvS4
 nk03N2ZhVaZshS1+Sjp1Amwm0nMXhl1WAbuSFZVQn6ttpT7CVHyx1U73/90kiT7XVIaGO25zWus
 u5B6rxfbkfp8l2IK/8vTwclldleXZA4zPcUXwImTq3WuhgvEeXjH8UxhtAO6KUjzRPSl64ustU1
 IYl5WbIJucPiiyHYCjXpmdAEx9p+9zPXUsFJVXFSLRjYqjtm5YwOVDd5MbUngDNexlZAP5YPttB
 4PgM1PuVBXtY8iSEOHc9zW+Eq2+pcejb+2xA/zF/uacn5+J7bspYG793BnTUty1cN/Ue09i20BN
 IkbJiWUOLICuS2z9eJ38Rh13ufZ/xho9GHd9O4Ghd93nc9FT8INZXr+ALnT3GeOLnVCGMh7VcuV
 SQyt5zYwwtRXWDqI35w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4NyBTYWx0ZWRfX9fLNTMFpfyCZ
 b5rGAwZjIBPbLsNSovtjZSpXWOtISV/3Yw6PhmbOIOtbUgQLHT8sx0ziFed5Ec+QuvBGkCgvtpm
 cvHS9njAlKzhGG+41I1sNWmLDnAwZz8=
X-Proofpoint-ORIG-GUID: 8e2J9h7TU5PUepZ_HMD4fKhOg6cAoJE8
X-Proofpoint-GUID: 8e2J9h7TU5PUepZ_HMD4fKhOg6cAoJE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040087

On Mon, Aug 3, 2026 at 4:31=E2=80=AFPM Mendez, Judith <jm@ti.com> wrote:
>
> Hi Ulf,
>
> On 8/3/2026 7:27 AM, Ulf Hansson wrote:
> > On Tue, Jul 28, 2026 at 11:56=E2=80=AFPM Judith Mendez <jm@ti.com> wrot=
e:
> >>
> >> Hi Ulf,
> >>
> >> On 7/27/26 10:16 AM, Ulf Hansson wrote:
> >>> On Wed, Jul 22, 2026 at 10:57=E2=80=AFPM Judith Mendez <jm@ti.com> wr=
ote:
> >>>>
> >>>> Add support for power-off-delay-us which shall be used to specify
> >>>> value of delay after deasserting power during MMC power cycles.
> >>>> Default for delay is 1000us but custom delay can be passed in to wor=
k
> >>>> around hardware issues such as slow RC discharge on MMC VDD rails.
> >>>>
> >>>> Signed-off-by: Judith Mendez <jm@ti.com>
> >>>> ---
> >>>> Changes since v1:
> >>>> - Move delay to mmc_power_off
> >>>> - Fix dt checks and remove print
> >>>> - Move from mmc_host struct to mmc_ios struct
> >>>> - Rename post-power-off-delay-ms to power_off_delay_us
> >>>> ---
> >>>>    drivers/mmc/core/core.c  | 2 +-
> >>>>    drivers/mmc/core/host.c  | 8 ++++++++
> >>>>    include/linux/mmc/host.h | 1 +
> >>>>    3 files changed, 10 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> >>>> index 29e80e5f928e9..9472041fe1c20 100644
> >>>> --- a/drivers/mmc/core/core.c
> >>>> +++ b/drivers/mmc/core/core.c
> >>>> @@ -1388,7 +1388,7 @@ void mmc_power_off(struct mmc_host *host)
> >>>>            * XO-1.5, require a short delay after poweroff before the=
 card
> >>>>            * can be successfully turned on again.
> >>>>            */
> >>>> -       mmc_delay(1);
> >>>> +       mmc_delay_us(host->ios.power_off_delay_us);
> >>>>    }
> >>>>
> >>>>    void mmc_power_cycle(struct mmc_host *host, u32 ocr)
> >>>> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> >>>> index b7ce3137d4529..fac50a2860211 100644
> >>>> --- a/drivers/mmc/core/host.c
> >>>> +++ b/drivers/mmc/core/host.c
> >>>> @@ -421,6 +421,13 @@ int mmc_of_parse(struct mmc_host *host)
> >>>>           device_property_read_u32(dev, "post-power-on-delay-ms",
> >>>>                                    &host->ios.power_delay_ms);
> >>>>
> >>>> +       device_property_read_u32(dev, "power-off-delay-us",
> >>>> +                                &host->ios.power_off_delay_us);
> >>>> +       if (host->ios.power_off_delay_us < 1)
> >>>> +               host->ios.power_off_delay_us =3D 1000;
> >>>
> >>> If power-off-delay-us is specified and the value >=3D 0, I think we c=
an
> >>> respect it as is.
> >>>
> >>> This means we need to treat "0" a bit special and bail out in mmc_del=
ay_us().
> >>
> >> Ok, just to confirm, then, you want to drop these guards in mmc_of_par=
se
> >> and instead catch 0 in mmc_power_off?
> >
> > Not exactly, if mmc_of_parse() doesn't get a valid value (>=3D0) when
> > parsing for "power-off-delay-us" it should not set
> > host->ios.power_off_delay_us, but rather rely on the default value
> > that we have set in mmc_alloc_host().
>
> Ok, so
>
> if power-off-delay-us < 0 -> use host default
> else power_off_delay_us =3D power-off-delay-us
>
> And in mmc_power_off(), if power_off_delay_us =3D 0
> what would you like to do with special case?

Well, we need to bail out somewhere. :-)

I guess mmc_power_off() will call mmc_delay_us()? In that case,
mmc_delay_us() could just return immediately if the delay is 0?

Kind regards
Uffe
