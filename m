Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D238AC98
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367886; cv=pass; b=DNUce2xIHFVh0HTvHSeLV9XdU1v0CkSy+LTyxxUe5ZT3xzj9o5XhDEDk1tAKBctXr38IamRcFe3YrpRL20u/Knyk50ZcDETVlB3hFOdYUheigO4x6LRaxiNXXX1hzskuakVfUGuUpDFOgWyJt0GtO2x8MfoG52xb1CsOHX8bX2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367886; c=relaxed/simple;
	bh=U7DMFwg+q2iJjApPB0UHhcc+bNMMjYSNE1WuG+detXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KE32z4ncnl7r1W9rqpgfQK+C3QMZa8F2c9CBcd627SvJ5fOFR7tX7nJxgLRThg97Qp/7Lw6I075akrcAi1FwsKpngAZD355gSYyxbTSVDAGi/bxCW+9RGCzlUWJeMt4/q07wZSBJzWGQES7q2IRj3Kq1daIrRP88WPG5BQUNEU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cySCBaT/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmIXZAZ/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cySCBaT/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmIXZAZ/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ODiRM22372277
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=; b=cySCBaT/y2OuNHrX
	DkTABeKgFJMbEng+rFRYUXROiAxqfKXnKkmITqfqE332GOKySzw0tOfQQnf9kLbP
	Be+o4um/oujWLcHcuGPHDkqTFpJW1PhDXquyWyFvuJlD/WdmHDLDU5E82ItL3/lN
	qhT8as0JmdZyyltpcyfeINr2FrFDQLCxQmPCAyMy7QKBztVkUF1YsBzyrXBp9PlS
	Je4Jh7uZufVsGQ+DUOeZcFz4ywnIBKfqydBMRhOtfta3O9fCZ+5ZFzcen5xT/KXx
	5hlkMb6HsWer6xgBozy+DDiaZWCzzaJ1DnjauxgRLpkHRYiE1g5K9piV+fYZAGYg
	HRst1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p831xcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:58:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c4e730c2bso8800256d6.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774367883; cv=none;
        d=google.com; s=arc-20240605;
        b=B/ZrprndNkP1nuAiMKfCRXhwel+FHfqNfQUOrEuL9tHAzSzIv4Wp1THIcddYxClxwM
         ZUJnRH+0y8WML2+1soCqiL3GOYlMEQOu30mC/OiHG29DbqCWpybUvmft8ae4nedLwiYN
         2rn57Hr/+/4idunhRSygCBz1ynNnIjk4CcFM22Lfzyhon+NwCjqyv/w01YIbwHw2eMRL
         6E7tVzpszl9Is2lnskyxdVKY15nUYcbbUXp6AExZiesIXfsoW8sIbUTmt1tZ9CgoVgxt
         i0Ovr7RPyCjEkHI7GJ/p6YuDMEBR6xR+t4BMTyEDMZj7HkaGL3tx84aHH1XXdSsC+yDk
         Vl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=;
        fh=II1qWXW/Tqv4P5wPbO9CzoCCzCOORU34yeHhotxmnDQ=;
        b=O45BDTBJpqGz2/8uVKjGoAKBxVgab7EaHIZYGg9VT3u4XKK+idbiRncnGwXuj+3nbD
         33cVpOjj+X1EPDZLAf4EkKY9MsbkHGDAju9juxfwoSswz8JINLED1gyN/hE3hSl1qF+A
         nGNEPshuypctcrrYCDOPLmzZfVmZU209W7ugFdvAvWLK1TuQ0vVilw99aTMZRGdcrbBG
         CTnprESLoPaX2SGQsFk4Q2g1MqU8VbYS68v22FPOnQ5XsqpkPKCc+Rq0rXPKs2EddPIp
         IaKIz0KGs7/KcbzumuQFsKyO60X7sw9EQ5Zb6l8CyHm24shH5KubfDLwzUoVO3JaKgte
         6q/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774367883; x=1774972683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=;
        b=AmIXZAZ/D21yR3LUKf6hLOhKzqWXl6tR2ijkPFfAcW/ijsxR5HctPo+/XBCrK2YxkR
         nwWmEw7BU9t0yUfPeqmILfNR2yeFhZq6q+SEWqRFkTh9nx03cXIQ0KQEJJiX+qerRYa4
         5NzLn7nIUT5ERZP0EksUbptYf0H+CyabCQzfRmJgp0EjHD/54HJV/p3q/SxcY9nniAFV
         z9rC1kG2VDAadZYu/eglDZ79s5u6dPYQGCmxqVm7jxcgFn+RB08DbeP0zx2wK3/RuASz
         nQc5FlhHSP6KncqUDU7uT5rVzvvagIJpVCfmwXzA1Nk31TcbvDx0Fw29XtR/f+9qC2GV
         ec1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367883; x=1774972683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=;
        b=EfXI4PHjC19u4h9jGDmkKcwjhyaynF2m2bvQxMEVWQEQCvA9IFO/6afMV4zXlBP3KZ
         xFAMfrTftMmWrvnddG9NpYvRkHYxJihD9HYl0MWDDb7TwiLoN3teyuuRcLVPb0jFxnfD
         XCSzQjI4cG4L26P7rqPbB+D/Ah9rq0JtD5oAjOHWX0QxfaxJNilL8d9a2sg2p8aHO+/Q
         3kZ+wa2FfqpRgtwIBZVu7i6tq6mYnQWQDY874U1qpAoym4s3iBD7XKK6LUYFKvoZpCBe
         NSf4NmBV/cJVzvr9br5cDT7bCJR/uouQ0DKeMb03Px1ppFNh0zVV30SiMN6+UwZFHoyU
         sDOA==
X-Forwarded-Encrypted: i=1; AJvYcCWPJsTFLcEulhoVbQuCDc29iFQsgNFDmL52YGNNwDzxc3F35MXGR1qvrdYlQK3w+pGfsID1+dovbJ8G@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7m3P8QTY8z1HzBxuVe9mzigAGU/c/SW4KeqTIqJfm3S6TYOTC
	HLohuHBTy92nSXK07QAshC94YCUh6cP4ZljOf9TKj6WMTtcw+pMya4fQ+9xXu5MVhsQKYKGKBPf
	JAMnpEU7mSOeEw6TAJKrh4G6GdEDrMEIkdpEnc9SXdPNJV5WX3Ywq2XvDExhDKpaRZTnbM0a4KR
	Mp7qYFSjCAtvFLVRYN3hZD683dqLYF97XQ6xU/DpobXLaI+vIdIw==
X-Gm-Gg: ATEYQzxKcXE4AMMMZJ9cSOEOHzIhF86l+oxsOBf0SlY8Q52VVVYUdrxcK509V6UDLbv
	OO4sLX4P0axHyoUrHd7+wu9v4+yaHoAR/8wc7DBn3bn7H9L28U8P/JX7pHeuT+ZXqrMQqFNFaMR
	6GQU7KA1ypJqmkyxAcjZgWMYG18wIqp0zvJq1ywsdHzhwLaDKtJuZVMEcKTe4qYZv7ozXxldCA7
	hDFDED0kZP9/yw868uJ0u67y+LZTu+pnRTLo4k=
X-Received: by 2002:a05:6214:570d:b0:899:f5a4:8110 with SMTP id 6a1803df08f44-89cc4adc756mr1982456d6.56.1774367882685;
        Tue, 24 Mar 2026 08:58:02 -0700 (PDT)
X-Received: by 2002:a05:6214:570d:b0:899:f5a4:8110 with SMTP id
 6a1803df08f44-89cc4adc756mr1981856d6.56.1774367882087; Tue, 24 Mar 2026
 08:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com> <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com> <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
In-Reply-To: <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:57:51 +0100
X-Gm-Features: AaiRm52QkkxQCqRqr-Jt62eDyvDcyXaIOYwIWRquF6V_Pbmf84Rb_fN-zDuHgQA
Message-ID: <CAFEp6-0qb4SUrNZ03+EsEj6qAynH2RL+AQG6F1F8K0ceX3JpUg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyMyBTYWx0ZWRfXy6Jv8jM1QPRa
 79ivQtlqUdYIsf1uByAaDIUL0GzjcoD3ii7xYKDxQ+j/aOHz8UuPIpyb/928f2xiZ5ccQwSoxd/
 YSb7KHhpwTgqFYuUIcyrDdtWrCqCuNGECyKdopmhQ0zBpobrZKvC96oQHN4YBo1eW1YH1Ou5Zfs
 fA1yKkWEyFq/O4srHTf1FbzNQW7ff5DSjQhsvCUXYLq+UwMqSMJxZNVAKVkuG5e2aLVZhhwoKdo
 b0NtlHStOPPjQD4VrBJZ58039XsRZ3FfUG7vopigpAB4s60+jdLbQfX0b3SNvOfS0fmTXwXVhma
 y6F8rzBArvkRYYU44bozfwKPfQNj7uqbv1m7/7ePJrdNqiw39xLO4RR1lsLV9dEjBhFzLwmCY1p
 mLGHD3Via9UY5TjmGWtwzLqJ7aytCjb0ZMIeyB/KKo0ycKNf4pJZKlyRbesk+0W8aCTaiXhV26d
 +QYMoSsqmliImzjcYiA==
X-Proofpoint-ORIG-GUID: Vm-vjWAHrZslnq2I7mXynRMp0QnhxVMi
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c2b48c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=lx2B71hQoDIPyAvjx6AA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Vm-vjWAHrZslnq2I7mXynRMp0QnhxVMi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240123

Hi Bryan,

On Tue, Mar 24, 2026 at 12:00=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 23/03/2026 15:31, Loic Poulain wrote:
> >>> +
> >>> +static void ope_prog_bayer2rgb(struct ope_dev *ope)
> >>> +{
> >>> +     /* Fixed Settings */
> >>> +     ope_write_pp(ope, 0x860, 0x4001);
> >>> +     ope_write_pp(ope, 0x868, 128);
> >>> +     ope_write_pp(ope, 0x86c, 128 << 20);
> >>> +     ope_write_pp(ope, 0x870, 102);
> >> What are the magic numbers about ? Please define bit-fields and offset=
s.
> > There are some registers I can't disclose today, which have to be
> > configured with working values,
> > Similarly to some sensor configuration in media/i2c.
>
> Not really the same thing, all of the offsets in upstream CAMSS and its
> CLC are documented. Sensor values are typically upstreamed by people who
> don't control the documentation, that is not the case with Qcom
> submitting this code upstream now.
>
> Are you guys doing an upstream implementation or not ?

Yes, but some configuration will be static and non-parametrable, I
will check if we can at least document the layout.

>
> >> Parameters passed in from user-space/libcamera and then translated to
> >> registers etc.
> > The above fixed settings will not be part of the initial parameters.
> >
> >>> +}
> >>> +
> >>> +static void ope_prog_wb(struct ope_dev *ope)
> >>> +{
> >>> +     /* Default white balance config */
> >>> +     u32 g_gain =3D OPE_WB(1, 1);
> >>> +     u32 b_gain =3D OPE_WB(3, 2);
> >>> +     u32 r_gain =3D OPE_WB(3, 2);
> >>> +
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(0), g_gain);
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(1), b_gain);
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(2), r_gain);
> >>> +
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_MODULE_CFG, OPE_PP_CLC_WB_=
GAIN_MODULE_CFG_EN);
> >>> +}
> >> Fixed gains will have to come from real data.
> > These gains will indeed need to be configurable, most likely via ISP
> > parameters, here, they have been adjusted based on colorbar test
> > pattern from imx219 sensors but also tested with real capture.
> >
> >>> +
> >>> +static void ope_prog_stripe(struct ope_ctx *ctx, struct ope_stripe *=
stripe)
> >>> +{
> >>> +     struct ope_dev *ope =3D ctx->ope;
> >>> +     int i;
> >>> +
> >>> +     dev_dbg(ope->dev, "Context %p - Programming S%u\n", ctx, ope_st=
ripe_index(ctx, stripe));
> >>> +
> >>> +     /* Fetch Engine */
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0, stripe->src=
.format);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE,
> >>> +                  (stripe->src.width << 16) + stripe->src.height);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_ADDR_IMAGE, stripe->src.a=
ddr);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_STRIDE, stripe->src.st=
ride);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CCIF_META_DATA,
> >>> +                  FIELD_PREP(OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN=
, stripe->src.pattern));
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CORE_CFG, OPE_BUS_RD_CLIE=
NT_0_CORE_CFG_EN);
> >>> +
> >>> +     /* Write Engines */
> >>> +     for (i =3D 0; i < OPE_WR_CLIENT_MAX; i++) {
> >>> +             if (!stripe->dst[i].enabled) {
> >>> +                     ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i), 0);
> >>> +                     continue;
> >>> +             }
> >>> +
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_ADDR_IMAGE(i), stri=
pe->dst[i].addr);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_0(i),
> >>> +                          (stripe->dst[i].height << 16) + stripe->ds=
t[i].width);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_1(i), str=
ipe->dst[i].x_init);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_2(i), str=
ipe->dst[i].stride);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_PACKER_CFG(i), stri=
pe->dst[i].format);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i),
> >>> +                          OPE_BUS_WR_CLIENT_CFG_EN + OPE_BUS_WR_CLIE=
NT_CFG_AUTORECOVER);
> >>> +     }
> >>> +
> >>> +     /* Downscalers */
> >>> +     for (i =3D 0; i < OPE_DS_MAX; i++) {
> >>> +             struct ope_dsc_config *dsc =3D &stripe->dsc[i];
> >>> +             u32 base =3D ope_ds_base[i];
> >>> +             u32 cfg =3D 0;
> >>> +
> >>> +             if (dsc->input_width !=3D dsc->output_width) {
> >>> +                     dsc->phase_step_h |=3D DS_RESOLUTION(dsc->input=
_width,
> >>> +                                                        dsc->output_=
width) << 30;
> >>> +                     cfg |=3D OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_H_SCALE=
_EN;
> >>> +             }
> >>> +
> >>> +             if (dsc->input_height !=3D dsc->output_height) {
> >>> +                     dsc->phase_step_v |=3D DS_RESOLUTION(dsc->input=
_height,
> >>> +                                                        dsc->output_=
height) << 30;
> >>> +                     cfg |=3D OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_V_SCALE=
_EN;
> >>> +             }
> >>> +
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_CFG(base),=
 cfg);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_IMAGE_SIZE=
_CFG(base),
> >>> +                          ((dsc->input_width - 1) << 16) + dsc->inpu=
t_height - 1);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_CFG(b=
ase), dsc->phase_step_h);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_V_CFG(b=
ase), dsc->phase_step_v);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_CFG(base),
> >>> +                          cfg ? OPE_PP_CLC_DOWNSCALE_MN_CFG_EN : 0);
> >>> +     }
> >>> +}
> >> So - this is where the CDM should be used - so that you don't have to =
do
> >> all of these MMIO writes inside of your ISR.
> > Indeed, and that also the reason stripes are computed ahead of time,
> > so that they can be further 'queued' in a CDM.
> >
> >> Is that and additional step after the RFC ?
> > The current implementation (without CDM) already provides good results
> > and performance, so CDM can be viewed as a future enhancement.
>
> That's true but then the number of MMIO writes per ISR is pretty small
> right now. You have about 50 writes here.

Right, it will increase significantly. The idea was to start with a
version that omits CDM so that we can focus on the other functional
aspects of the ISP for now.

>
> > As far as I understand, CDM could also be implemented in a generic way
> > within CAMSS, since other CAMSS blocks make use of CDM as well.
> > This is something we should discuss further.
> My concern is even conservatively if each module adds another 10 ?
> writes by the time we get to denoising, sharpening, lens shade
> correction, those writes could easily look more like 100.
>
> What user-space should submit is well documented data-structures which
> then get translated into CDM buffers by the OPE and IFE for the various
> bits of the pipeline.

Yes it will.

Regards,
Loic
