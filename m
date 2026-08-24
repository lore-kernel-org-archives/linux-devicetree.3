Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E73F0AA9
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562881; cv=pass; b=bjSG7WFsuco8BOTqLCQEaToiUN6jxkVzp9brvWuRxsqn57ljziNH1tgXCrRkJNzPyr1vz1Juzw0DXXs7iSa1FHZMZW8c7R0JgiFUQiD63HDfTzxq4RNsGhswnfPCiJtLXR1gJ5jn9eUL4uiIcZslLI1/N5a165hSzjP8nhfUA20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562881; c=relaxed/simple;
	bh=K8j+qC5sBVeIB0di1b6yfJ6CIicUq5BKlp6j8EN6/6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hkw/JUuc4gLZv1a72r+mDt08O6Bp1cmMOxkJq9aiVBM7qAGpLNv69bL4ddmPkWYNSxNxOW10YUZI0zgZ8e08vTKEv9rXNKMfjCPs9Y1gfYgGtq9HeRTLddPz9ZHaayJ65mNlL6IqhmVb6zM/77UURWBXDxtNr3+3x3fsV1wOWqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQ6fVi6o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMnyOeTY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQ6fVi6o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMnyOeTY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99HEb1981943
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=; b=jQ6fVi6o4gesVS8R
	GAtMEjAf92/imkQ9nIq7QKNikOYjpBXmvU9n5RBn+9USmrgAhCaHM1siITXm+q+1
	WNvOxrtk2so9DLtaoIa8mRTj0jKi+0iomJiHKWOgK6LL6eVXmMQjxqZ0Of63nshb
	Baw59FlIGh9wZvghh2dUeiTGQAqfiLEt2W5fJCCsflsrYiRGTUfgioxrOaIs4Dgz
	KkCcPcn6TmoE+PFUuLqz/c/WyTfOCzFcmIPjHPIqGrhcsYASbMVym4qCM4M+kkNK
	fkaafPnfT3cdxC8T9FazQiTD7DIxul5MS98J7c86xbBX45l5pL7ZOazwop773ZoO
	6H37cQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528p6hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:14:38 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-845cc1ab48eso128463177b3.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787562878; cv=none;
        d=google.com; s=arc-20260327;
        b=c0ZrGQesrKE3KAZr/AdpBNs/sy1odweByQGE+TBw2t8gC8G01TnaGkHC4jiSoSe2w+
         xNGhtl/z8dj+cr/Q6AVN/FChcz/F9UZuEhgk9cCw0TqYHIPxM173F6JdmVRNMpDcHaEh
         ISTIgvm6vwYv4esVSKdhcKoJKWK+h1CikZXSrQfw6jhiF4ySZyUM1hvltCrLRt469/9L
         TqqdbO+bQYVhLNPY8bJTRyGPOrBSNHIecP7lUYy8E93hfbyhgRTLLK4KY/ilqBIkEFws
         9NRg4wcvO50zjf5bXu3zhAXg07COKC5+k56hgRv8p8jNC1l1LoUdmzKmGCEBHcLFMXg4
         ohkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=;
        fh=TqY3xCwwX+CL94GLSt/bEsx7ym6FYGOZNYfQp2nuVMM=;
        b=gVW/8g+kI7BL3RbRapYXjmTTXZsWeTkdAwORh8wfceKd818RAyE2Z565pEGnHuuGbK
         9Z3e3ae1se0ILUE63inZkuNem/g2OwLq1ln0zUR0ejIlK6INLgTnKn0N0oQ9CI1XBCTv
         z85dClU6rgiw9qt42sl6rcCy+yFa30nXVWXOFFc9rF6kTJBYAGpFBaWEoo0xzUWB+xKn
         YAG35oe5teIlAedPdgbyvpkq+njeXPnEIriKNtWJX2xS0Qfz2nAAAgsnFGp41FsZENI7
         5/pyEPcT9R7lSW5tNQHXlLzXOFFucJv6ir4ZKXeuQYYSn2KUclmV0FjBG74WmRMJG10L
         YwwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562878; x=1788167678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=;
        b=HMnyOeTYY3+5neX5q+n62l4ITI932uMAv5cKcFQpRuJwoFSMyiAfKjhwUsaLp9OUEr
         bk14/PTf4A7ITDXC4TjUx7VS0arG5T2F8Jt/q8H7NCBW4ivywNFgFUbM4T0UErOz8i0s
         LNsbwXUSRxTtGXKxcpnW146saNvRwRh6SzZ/FOcfIdbJ7ayeWZ5go12wm/8Be7nhwNHY
         KUZ2jA/JhttHX95d8C7hDbKM/QXXa1bUyOb4CTOJm3hSeWt76VqVo0sdA61rjk3+ILZd
         XS94+fzg+rH/h8MikABays3wrfMvZP/AcjZUtLYQs6fTGUwNpxhxLOk8beslx/P0XqA8
         wLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562878; x=1788167678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=;
        b=TB9S/IfuhY6zgmE74yhCSDHOHipx6yE20WsyXWcucKoPfbGlEKGKPUgGFmMWcUSW7v
         r3eOPgW/fgoThCQ10cYOXeZU8ULAEhhwsAxI/XFbw5dG/989Ae/UzhuQTAu4rfTN6RrV
         bWiKcckOQ3nfLxxG9f/qo8cJaQyiQv4MOvznkTVAgtDc8kbLYJfL/eqefhUjgTpzM7Zs
         tzyBWOB8VqC3CiOw1NZvgW54GCuSSC2uoHLEHButnjookOm4h8Yy4yYxpnx+K2mvT3Mv
         /OKJw39iQJ38EsBQO7UWEAHFZ1GwbI1Z6kQXMybkp74NDizafygiOzrqwHLQxmo3kAsA
         YQhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2XnwmSzUMeuVib2k2mbtOy/Ag5y14h9gOYzpD0NImVcwv9iqnI/irZ2zRbeK8Yz3jgrxITxzJD7OZ@vger.kernel.org
X-Gm-Message-State: AFuF++mvk6Qdjn6XdEw4ItF7LKQa1hCcwze8nElCtZLOAfeIx5AjqklH
	O9eCW62eBLpgdOHyat7Tov216t/W6eEWYDnyI5QFq02IrLjFrP+bSE9Frmd4xO6pfSlZNUmdtXW
	X6jVM+pXlUfCG9C7Wf9iQSrTOlOpmMhnviIThbhywFRo8fTYYITyVhrDtbbTz/O5M+e5FptiNOq
	+o8Kq/kHph3m4bXMFs+cvn0U8M9HWmQ48WBrn6TLw=
X-Gm-Gg: AR+sD10ZHeHDGUSA2dIkrVID+c/UfeL02XWujwi6qmImn9w1OqZC5vnRRxPVphO7ZNJ
	9aD2aTr2rwgu30UwuuNUGT+AoSFXVt1OU7zZLWS+Or7wckECj19C9YVLkxz2LBBXAbRUKy3kpkC
	qjcx4qeSC95Ph3k528jip2gfHhl9/kWAIEIx+KY89awwz5D5rxwuEpbTXLCv4=
X-Received: by 2002:a05:690c:a648:b0:80c:d342:955c with SMTP id 00721157ae682-849ef49ad1fmr76365917b3.3.1787562877530;
        Mon, 24 Aug 2026 02:14:37 -0700 (PDT)
X-Received: by 2002:a05:690c:a648:b0:80c:d342:955c with SMTP id
 00721157ae682-849ef49ad1fmr76365667b3.3.1787562877007; Mon, 24 Aug 2026
 02:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com> <f24970d3ec28f6b8f57e7c139d0daa2cb5128492.camel@mailbox.org>
In-Reply-To: <f24970d3ec28f6b8f57e7c139d0daa2cb5128492.camel@mailbox.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:44:24 +0530
X-Gm-Features: AcwNN1VyeWTTevjYtkyJU8B1OqqLSNiUH8LEUOVIm93k3AQStOqmTeqdsZFxI2U
Message-ID: <CAC-tS8CnvdmhRrZd58rDeEmtxbzR3W4g+85UW8Nse-L4J-31JQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8c0b7e cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8
 a=iiTjsVZ8Xzyo1PsM3MwA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-GUID: VOlPQkADm_k06nJYhptdkDeHQY1Et2OV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX3YSoYCic/3EK
 A2PAGEP2aUTAbanCJgL59BNARDifZAXQACLfCzOyWY3eqIBIVww6kwjmlnT4GkpPmHHcaXIpqK7
 ppI207j32k0KdnNP5CkYJ0notM2dNv9rTRT7ircdbj/Y5Yx3qcxQIlPHGbPh8W/aOvvBSp7gX07
 0rkbav1tpAl42UYS4nUNUUb49e4M9zlXBIR+JHEtLvX2r+T5r5tlyAjaW4seV4A0NxK6uRNHTIa
 HOs7l5BAzQTMHJmHy5SSTlFP+DqnTw1zhYAf9QzZLs8dfrAM8A7wEIxVBonhNLR50Mn/fKNTJEL
 P1Co8hWOqatflvP72vIpJodniZdtyRkFE2o3JM6KDynYz8PPCGgUDiDaudsZTbrBsxuzn6KXWD7
 8wxnshjFGOe8uO5M/scJ0ytquxECOWBVnBDb2t0nalHCjJyr2dT+4uCWCI02Qej9iZRcXh3ie6B
 QyQmvoHMroCdxOCo1yA==
X-Proofpoint-ORIG-GUID: VOlPQkADm_k06nJYhptdkDeHQY1Et2OV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX7CCCcbFH0zZp
 bQgJlOhMhe5S2KFbvBYpCO4hAmTxhe8n75NDLctUKKJiRFxW6fXdjcww/ZBUuXile3+UM2Np+Lt
 TR+B2JlIa0zPdzPlo54isdIr5ytj2Us=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On Mon, Aug 24, 2026 at 2:09=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> Hi
>
> On Mon, 2026-08-24 at 12:06 +0530, Harendra Gautam wrote:
> > QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> > interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> > need a binding to describe the controller resources, DAI cells and per-
> > interface AIF configuration, and named constants to avoid raw numeric I=
Ds
> > in sound-dai references and child-node reg values.
> >
> > Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> > aif-interface child nodes required by the controller.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >  .../bindings/sound/qcom,qaif-cpu.yaml         | 307 ++++++++++++++++++
> >  include/dt-bindings/sound/qcom,qaif.h         |  97 ++++++
> >  2 files changed, 404 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-c=
pu.yaml
> >  create mode 100644 include/dt-bindings/sound/qcom,qaif.h
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml=
 b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> > new file mode 100644
> > index 000000000000..134356114733
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> > @@ -0,0 +1,307 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,qaif-cpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>
> Both of the links redirect to https://www.devicetree.org/
Thanks for the note. This follows the same convention used across all
other DT bindings in the kernel tree.
-Harendra
>
> >
> > ...
> >
> > diff --git a/include/dt-bindings/sound/qcom,qaif.h b/include/dt-binding=
s/sound/qcom,qaif.h
> > new file mode 100644
> > index 000000000000..24706efd07d1
> > --- /dev/null
> > +++ b/include/dt-bindings/sound/qcom,qaif.h
> > @@ -0,0 +1,97 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * DAI IDs for the Qualcomm Audio Interface (QAIF) controller.
> > + * QAIF_MI2S_AIF* and QAIF_TDM_AIF* values are used in sound-dai
> > + * references and as the reg value of aif@N child nodes.
> > + * QAIF_CDC_DMA_* values are for sound-dai references only and must
> > + * not be used as aif@N child node reg values.
> > + */
> > +#ifndef __DT_QCOM_QAIF_H
> > +#define __DT_QCOM_QAIF_H
> > +
> > +/*
> > + * MI2S DAI IDs -- one per physical AIF port in MI2S mode.
> > + * Each port supports up to 2 channels (stereo I2S) over a single
> > + * data lane sharing a bit clock and frame sync.
> > + */
> > +#define QAIF_MI2S_AIF0               200
> > +#define QAIF_MI2S_AIF1               201
> > +#define QAIF_MI2S_AIF2               202
> > +#define QAIF_MI2S_AIF3               203
> > +#define QAIF_MI2S_AIF4               204
> > +#define QAIF_MI2S_AIF5               205
> > +#define QAIF_MI2S_AIF6               206
> > +#define QAIF_MI2S_AIF7               207
> > +#define QAIF_MI2S_AIF8               208
> > +#define QAIF_MI2S_AIF9               209
> > +#define QAIF_MI2S_AIF10              210
> > +#define QAIF_MI2S_AIF11              211
> > +#define QAIF_MI2S_AIF12              212
> > +
> > +/*
> > + * TDM DAI IDs -- one per physical AIF port in TDM mode.
>
> Is this sentence complete?
Comment is written in fragments. Please let me know if it is not
conveying the intent and needs to be rewritten.
-Harendra
>
> > + * Each port supports up to 8 channels over up to 8 independent data
> > + * lanes sharing a single bit clock and frame sync.
> > + */
> >
> > ...
>
> Thanks
>  Manuel
