Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB59C3A7F59
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777323695; cv=pass; b=PC11SfnL7CuTDE3QLNRRdOlUFx5TfTiT7PzRC22lkNI/tSFFl4Rv6NFSE9PebK90tbXsBYP9OQF24rxPcb4+3o9i01jZBejLq/fw6qc+8MFhbnoxHaEf+YhVJrG31831gLbC9qkU3HwMO5KA6kvfajwm0pjtfl2M8tNb+7M8J8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777323695; c=relaxed/simple;
	bh=+C4GOpYhh4aS7P7JVT1CRxfrSUiV6hkVbjF9PaKWQQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSim68S0TTIa5GGndhsn0bkq1O1Dy2SUMEsgeibzqeft5F8PGH0uGgUoA7w1Lu1ge/j9G+EPOgD/cJ0oa2gtRreMpF0Gb9pV7BHfhygQS11rLruLxagALrFpPPZApiNOlZjxeO7X2ONLBqbV8MRc0hzzNwlcQ+JH9vzXXXSWnP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cp/1dL52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgUzHqjl; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cp/1dL52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgUzHqjl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJpFJa429204
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=; b=cp/1dL52K20USnHG
	xbiP+49+kQ33kx6K6NX65lnRHBunBRp6nvDF4IjzIJx/T8bJSXbPJgXh2SKonvI5
	yhXCkl+uOR6RvyIABH1bBk32CkE3iVKN0r2FsgHJ7eycpvuBUFzxeYPmHlrdlvBK
	A+95SBHUAnlqulwA5/pwGrRpjodDriQNbLjGx6wH4H6MoTibeiTZs3zBzFRdIxnh
	6TjGOEMw3XMw7/7NrgE2AXlHQdweqFYd6/JwJ5qqB6/cQXcFVgOp80Et1OT9qQGZ
	HvZYackOvIzvuCvMlkFeOu9Zs2JaEK19uOYS3HxMmtdnAEE299tQQC3rHtltZrpL
	lUMZ6Q==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x31x6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:01:31 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dce0f50eeeso13921668a34.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777323691; cv=none;
        d=google.com; s=arc-20240605;
        b=J+JP5wH8FcRhgGUeVe5C9di1hQa0DbHIra4DKfTDBbBtvnbX68mEtzmV3RjTa/iZWp
         67sPU7MnVohreDYfFZiOKdU7V12WFzfhkQGrhFQJAweqkP18knbemCON4UVHHhqXqzFL
         DFtQHPACBePu0V6/8/UZkJ1Cf19dFEBxv0f5YwHVtyl7inJieHBNEcgOo7IYjj9FafyD
         zY52OrJYR8goE0YqdqsqVW3IUq2FC4U9OUzJvTkaNx7eqaKKXPGOhNOrhmycwhpIkW0P
         O6152KWQCaRpZ6d//eSHloX+2SNp1h6VOuPuSvY5CEZMKpYtu3cGQfJqIPKgDRbluEm9
         4S8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=;
        fh=6aKuRHRftNjCzeD05ybO0PmRL6uCXvr8h+bqmdpIfyU=;
        b=RhsADfw1awaeJBtlgOYkAOHJj5LEIBO6x2zbmQDLu5MjARWlTflbsHrg2N1yvXAGTq
         DvIuzAYBTNqPhYKizJCX9dx3nGcFmV/Ed3cxHme4Oeko/0tMuc7fvKtwChfg/FqJWa6G
         fFaYTswH2wIvbsap8h2/ADZyyt2fEw168ARoCkChZqbJCCmNKG47KcfcHPY3a1W7ZggZ
         bwqUkC1iziVVIV/JCxGF9bLkTSyUjRTMuTecyeBZVxYqEiSZOAa9FV6ywKJdf5GmxRtR
         XXXGYAOHHhhe0laSn6+/yMNTWxawr9zejUAM5tStarazozV5eCEyAeaCw9h0mNpEjzAa
         I/LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777323691; x=1777928491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=;
        b=IgUzHqjl77nAzPzB4uDaV3OqaUkMQ+9x92I2fIVFfbOicl+soEK2zaZKwW951BbMm6
         KB5x84nJsKhnI6a05+IGVzovvMneYcCmbjazrBtU3dN8IxMwCCoMTX3b311ioi15f9eA
         4eYe2CM+HhDc5vGreAtLus0LAu9bISU+MgeQA+d0pVTWkzMIdGwdCYcuQtjX/jH90YQs
         Llgu1UXHz6pnADI0wuX+/JSaOHf8I+iKAcVdAtBordDCY33yMvcVWxNn9CseN5Abmxdi
         MJ/SUg40j0+o6hvMcxEKYCnqMny5tI+v/Z7xMQj4L9dyBTZWZetUxQZ9Xg7JgYJMwj4k
         98Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777323691; x=1777928491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=;
        b=C3ucZNvs8dEUcs9S3sbKFWEzYOMJvjfuaElGW47Bsxco0eXEJCZJMeAqrrg4t55s52
         Guo81gom9du1zkMJ6U2nafGdS+9jEZj1PPL61iJlpwOo7Q+5WwzHXvqjhEmxy5AQoCqP
         WnkUmz5pu2ga+Wadkzc277jxUofJJYZOW85Hn5FCVxpm5nbshY9PEfEMvqZOtRaerjXZ
         gbYKxa8VQW7RHCnywbUjMkn2V43qV81Hg/xHIDj2PxrqlLgi5SNc4ASECp8k/nhM0mRT
         ccaZLJjMik0qolzWZLPcBH/ylpm2UZO7m1/RAoyVM+vW0OFGI4NWTBYsbryLez5foitu
         yBBA==
X-Forwarded-Encrypted: i=1; AFNElJ+hlz2bKkvQI5xAaf7IOvvbL/g9YvC7A6wodUfH5TjzS2XNuDCBomQMV+EE0OFl7yk7tZZNx/HvUYkY@vger.kernel.org
X-Gm-Message-State: AOJu0YxUUgkXB0Rvd4SrFPofwi796Q8uv+KkkH/oS4Ohxfz2assCls5y
	fg4VcNKFzh0jSG6fjinsIg1TZqipGGQJ+136327kolX3O94MauDtlDMXO3WRWTVG90G2zYjdFQh
	5s9Uz6BXoZ3VvCM4/EacnjDKWveVmnp3A28x6U1hb8E3bbXJuX4Zb6XPaKC1ybCHlzJhdIkdRxe
	cPGNIo4DpKqB8cLmhvhbliMrDpn59CHX45iDhC8/g=
X-Gm-Gg: AeBDietXkz9Bck9a7ZANhLyY5RLr1eoYc/Adk/HxEAnOl+cPTfxJZheXo/CauToJ4FD
	YaEY7NbSxbIHWQS5FSSHZZhqqucgK6yDyxryuQ1CuDBLeneB3U8vt3saxL50F+BDIVGjCGDOmMG
	ReR1E1zZU9Sw2xb+fhtuoQ1B0M20PRrJlLfXCzv+J0LbuBvyV1GWMaQMdAAQFP4M0Zu0Tdo3lHu
	ncDMbSKDPlE65/pIfmio5P9K7iwKtSVIYmoolKxEsauDjbYuHA=
X-Received: by 2002:a05:6830:81ce:b0:7d7:48cc:ccdb with SMTP id 46e09a7af769-7de9a0ea40emr232036a34.19.1777323690801;
        Mon, 27 Apr 2026 14:01:30 -0700 (PDT)
X-Received: by 2002:a05:6830:81ce:b0:7d7:48cc:ccdb with SMTP id
 46e09a7af769-7de9a0ea40emr231987a34.19.1777323690349; Mon, 27 Apr 2026
 14:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
 <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com> <CAFEp6-20MzQh55iJzyhn=htFZxN1yq9o+EJJAX0CWG3O6_KSyA@mail.gmail.com>
 <20260427202523.GE3219146@killaraus.ideasonboard.com>
In-Reply-To: <20260427202523.GE3219146@killaraus.ideasonboard.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:01:19 +0200
X-Gm-Features: AVHnY4KhboWBXcHPTL_60SWtSw-AAA7UM_3jLhGlKnmcS9RCmKJpNOXClsRGkmE
Message-ID: <CAFEp6-3yecq5oGRFFbaTCEW5Ag9JaZXjVTAT=Z2FSX20UC41Ow@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration definition
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIyMyBTYWx0ZWRfX9xh4vVzeAOMb
 YcXtCwDgygnGoHkwZWH1Bz5BwXnddDyvyyO+RtxeazhO2OMeItvi0dy34OZ6bRbNbEPAuJyT6MC
 7EiuFVw+z6NG+Dum/pXwOeItfjA7BLdhfD08462bWh3Iwe11h4ugEhrcJjaQEGX0fByUl0mqdkq
 IePnwK00TOD4Z7M1oIeA8SmZ7dCO6Z3ZOCFENDqwcvmltT+54lreunxdkNnP3wBTl9vrhc5hLgL
 codL8OQw1ltprpJbPSzaG1CLgXn30DdXXzogalLCNplksEN8X+qX9ZXgtFQs/5mely2UbtpVykw
 2MpOBxFzRwn2diYYCQMg+uRGJKQmfv918/vTJm2Mu3Z17nONuJyvZaFzVsA9R2RZQU/zF/M4HOS
 d731ketZ82eHcZIYtQAISkgG/GCOB3bikWYYNlU7tqWYqIHJXZmjBi58cvKsaOyP/BabnR5yUIu
 ssIhKnwK+tSb1QPusjQ==
X-Proofpoint-ORIG-GUID: LSo4SAjJ4Hs6DjU2LHbvbcdLAjKya9rA
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69efceab cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8
 a=EUspDBNiAAAA:8 a=By-mYhKeKzH8vs57knYA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: LSo4SAjJ4Hs6DjU2LHbvbcdLAjKya9rA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270223

On Mon, Apr 27, 2026 at 10:25=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Apr 27, 2026 at 10:08:59PM +0200, Loic Poulain wrote:
> > On Mon, Apr 27, 2026 at 2:56=E2=80=AFPM Konrad Dybcio wrote:
> > > On 4/27/26 2:43 PM, Loic Poulain wrote:
> > > > Add the uapi header camss-config.h defining the ISP parameter
> > > > structures used by the CAMSS Offline Processing Engine (OPE) driver=
.
> > > > This includes structures for white balance, chroma enhancement and
> > > > color correction configuration.
> > > >
> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > ---
> > >
> > > [...]
> > >
> > >
> > > > +/**
> > > > + * struct camss_params_wb_gain - White Balance gains
> > > > + *
> > > > + * @header:   generic block header; @header.type =3D CAMSS_PARAMS_=
WB_GAIN
> > > > + * @g_gain:   green channel gain (15uQ10)
> > > > + * @b_gain:   blue channel gain (15uQ10)
> > > > + * @r_gain:   red channel gain (15uQ10)
> > > > + */
> > > > +struct camss_params_wb_gain {
> > > > +     struct v4l2_isp_params_block_header header;
> > > > +     __u16 g_gain;
> > > > +     __u16 b_gain;
> > > > +     __u16 r_gain;
> > > > +     __u16 _pad;
> > > > +} __attribute__((aligned(8)));
> > >
> > > Should this be __le for all of the related types?
> >
> > At the moment, this is purely a UAPI, the values are not dumped
> > directly to hardware as-is. Instead, each field is translated into one
> > or more register writes, with the appropriate math, masking and
> > shifting applied. Adding explicit endianness in the definition would
> > therefore require special handling on both user and kernel side
> > (to_le16, from_le16).
> >
> > On the other side, there are scenarios, such as platforms that rely on
> > ICP (firmware-driven processing), where we may want to forward these
> > structures directly within an HFI packet to the ICP MCU. In that
> > context, explicitly defining the endianness could make some sense...
>
> Would those be different structures, or do you envision that someone
> could develop an ICP firmware that understands these structures ?

I believe some of these structures could be reused across different
platforms and bus implementations. In particular, a given e.g. wb_gain
parameter struct could potentially be shared between OPE, ICP
(firmware=E2=80=91based), and the inline engine (IFE), with minimal
driver-side adaptation (limited to shifting and masking) or even zero
adaptation. Bryan has sent another RFC [1] defining parameter
structures and layouts that (as far as I understand) mirror the HFI
data layout, so I plan to sync with him to identify opportunities to
leverage common types or structures.

[1] https://lore.kernel.org/all/20260426000418.1158716-1-bryan.odonoghue@li=
naro.org/
