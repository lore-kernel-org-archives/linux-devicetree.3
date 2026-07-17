Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1653F9F41
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299516; cv=pass; b=DMivOh6WQoU7c0BG06x2AT0Z36eJluHxpqC6ez3q1bLVJDw2UCS2//ybj/XSgF0yS48xDDrQwU6HuDlkhzeCXOIFG1Gt6XsLaeLuw8XCWZGuttCgXTsDo75rPGiwYvaKz/6C7vAVMHBTJiJ5AKxokSrx53dSUfpqGcOGYlOO0NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299516; c=relaxed/simple;
	bh=FNzsOpMvx2fOI919kTiNEIxpFwaZQjVvzDd/rPsGLQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n6sIXdN94ALJejmUFKt+SjgmkMdDeAWCuwPDUYOOzW8aUmbOqKMWQHwKzoqTbf2vHv+jTjMAb3+9JbAigfuyEWokqGghCLMxqPPfF83nRkf2pDAEcbrN0NEnQgygRDWCpgLOmV+k55qrVkpicj/l8FidNRKVJMKsE0wXrewjaf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgURRFqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D68BI3dv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgURRFqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D68BI3dv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7o8A1809366
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNzsOpMvx2fOI919kTiNEIxpFwaZQjVvzDd/rPsGLQc=; b=LgURRFqrlyVMT+rN
	DOONXjUOuinpRQGIpUDcZfiDuF0qiWwRCHIJMhp4rmAHIIm+LPtl/yHwWBfv0OGv
	4ubsLPL/cMwo4MeQny3CEs/OfKd6V3c3H8dHjWXXTAJSK4w3v5oNLS6B1T0AjjRH
	hehaqU+4YcUg2NEh4TD2fLrzEItb9woYQ2O4cRddbgFJRhioqfE1WBY5buPNd0KC
	s24Vppribf8S2/UxeDXp8C4EwtkL6jfglBPs8yhrwysfm0wgJFYOT/CtR3+h6iv/
	XzOo9yOHLMjkkdIOKotPJfbrlMKPc/N0aZJAb44l8ptFUuxXIEjQPxPu9Kxw4d7B
	jmgf/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8m7gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:45:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b571432fso208296085a.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784299514; cv=none;
        d=google.com; s=arc-20260327;
        b=CFsczTi2dZM9SG6KPopiiwpBnQs+DCzHGA5HSIRTk9rv90tdPd8wYLLWBGyhZugpqI
         tE/HdwAXEbgtTl6KDEYmbjb0SVFAhyVezxzzlmDhv/9YlhV1rliE5StbqL5TAJYq9Lly
         imKzD69Y37yzCO7+opY/GHSdT0igoMA1EMfkZsa62B+HUsscRtsupYi8IhkP8+hJzG+N
         N2fYV2vjDECa9bfVkYVucbtv6Byxmjwscd0taLLpcmurBGF0MUa1PXfhqdxOpeIwxmo9
         iJnZ5nY2Wvnnf+KAXxKcgSJP+Z4IF+v/M1l3BHuvcXx3QslDVdoBZh9dwMgrYlLw8Zxq
         34pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNzsOpMvx2fOI919kTiNEIxpFwaZQjVvzDd/rPsGLQc=;
        fh=NTyH1lJUIFq678yJ8f+L/fcd4eD6tvWqxwgTnTMdNGs=;
        b=otaFNzw6Uo1KxuUhrmjlREzgQSv19V3rho9b25+YXZsFiq25+ujpxd030Bs9kALpa+
         pD7S9lVIneXh8/gRqWlfiJCAjsaIE1n4CuzEcT+nsh1bdxmEXZr0uxQdrnRkr9Nw/xdH
         c47g1ZoooW1QSztRyZYXrCADrynrPbJbRz60gEgI5O2UY3vNrRa5kcSKeL8M6UHctDkC
         7U9hmV6MafV+mA2RFcuxDqEHX9vZLBL3nZZGu6gsxNhj8cgFDXAjsGzs7t2I1qIUOMSH
         66o9NT+JpBmCsWDZdVxiKQQnlSEetVgF6yMfJeaebT0Fjjp2mvrok7uLOsQm8iVajvHX
         VOOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299514; x=1784904314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNzsOpMvx2fOI919kTiNEIxpFwaZQjVvzDd/rPsGLQc=;
        b=D68BI3dvWRmdAIR65e0X57xipBxSsWd3Hv4hH7Bof1XPMbWMtpV+ZYyptldiIWUX8y
         L+z2NQhVRwPPdiSzGenL0eSf+FGDN96uO06Rf5ZilDVGyxE09AYa5mWjPRytTByLnu58
         GlIXSk5DzFjA+tFtTjA1Hk7OVPRR0m1RqZBYXkadKTvHAu+Yedxozn/EtAAJyv4X4Pst
         Zga66iXSBuGTxAfAktmnF/1Ssb3oMJ8/bq7Gvz5TVJQV1HIYy32GL1R5TvQc4Cddi/DM
         Xb90bmlJoc8Rh4hz2kdO5MoilXFf/WkA9jYM+Mo193bWXV6Ar5gbyyhKfpbUFJ+hH56k
         9PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299514; x=1784904314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNzsOpMvx2fOI919kTiNEIxpFwaZQjVvzDd/rPsGLQc=;
        b=HBrDSs4hO/fY1QJU9x97fJxxLRMFxD+UUeEg/wPwTxJ3FnpiViNYv2LQ2Ilb8uZrYZ
         CKaNf2a22FlJo/HbJ7b74DMIhRVVzprv1ZcYIxC3ym+Cc3XJh9d7QdtbXKc/En3pIdTf
         +O1a3BLxW9xPpXcit9uyvH3BvWwS5BuAaK05UxSNgxShKeRu8+ZOqmR2JHcN+p0dllep
         z7A55GhxlbTMUibtEypioaEfS8f4txqg88Brf/w6rRIgSq9V8okDBFxmpvdjg8BapEDL
         YL2G3IOAY8JFzqGfTwACT/CLlHrcmOZ18tQMmv6XhnZp7VpKVVUMoadoOmrXSmv4ZqgW
         YCoA==
X-Forwarded-Encrypted: i=1; AHgh+RqmU0iZFiDmNcdoky8+zXx4WkD/PXSWw1HULEABr1/TZ3dPshSe05/ruQWnnKydQaAUKuv1HfyS02r2@vger.kernel.org
X-Gm-Message-State: AOJu0YynMcWUieUTpOhlAkMdQT63mFP/46quIwsPG13xpMXqQil014Y9
	n1MXZ59Lhn/DvwzfHsw2Is8WO5sxRCKsliziusQgg4exl4LgO5ydkxksR5E1B+4I0qdufmEINd0
	7Y/MICIlhKTcwoWolg1K/WvDmJsE6DKCiE81d7kfu2MFJSSdNXPN7eIEXIyQqDhKGLKACN09jLa
	kPwnw3CQXLh4aV8MyG+vfDjEtUt+1lc5ab+0nHsV4=
X-Gm-Gg: AfdE7ckkcsnnnWFIN8P8qk1qlll7Xe1lRIpmvTCs4V/3it0YnD7vBFJYuNJRdtHDv9F
	dPkNSNdDRZdCuS7zyRxVRzCfhucE3MrJhXdA9N2TFn3UtagLrAEKEReHN+YDXFO9knejAbzd2VL
	B701otIeh3uDDdu5om+i0wUfXs10U/YlM5uG4nZ+y3HmrNqr5VSpXiGSXI+n/VlX4E0R1AXutvo
	BK1AU4hVfQPegFsa5LGJg1qW3FND6Uy0W9gBc99XdDaP5HBDRawSiyjAqKlmcpCBvb/6cZIR9MO
X-Received: by 2002:a05:620a:6914:b0:927:efb0:3ad1 with SMTP id af79cd13be357-930b4929a49mr284921985a.26.1784299513697;
        Fri, 17 Jul 2026 07:45:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6914:b0:927:efb0:3ad1 with SMTP id
 af79cd13be357-930b4929a49mr284915985a.26.1784299513132; Fri, 17 Jul 2026
 07:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
 <20260716-monza-wireless-v4-3-9b02e6f549d7@oss.qualcomm.com> <CAMRc=Md8mLgYRsLd-KhwVV8X9AcYbHf--RB_pf0xFBP_P_DvCQ@mail.gmail.com>
In-Reply-To: <CAMRc=Md8mLgYRsLd-KhwVV8X9AcYbHf--RB_pf0xFBP_P_DvCQ@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 16:45:00 +0200
X-Gm-Features: AUfX_mxmtgHrdkc082wiMIxBxijXxJxzFJEhJ2gZz60O6dCpV0Wr6tzd5_cVl7k
Message-ID: <CAFEp6-2pbYXFTuozcg51+dQ_mKin05o-GqThyJLBjquFs91RQg@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] power: sequencing: Add pwrseq_is_controllable() API
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: cE902jNbQ3yNMEjMsgs0hMjgrNKbm2CF
X-Proofpoint-ORIG-GUID: cE902jNbQ3yNMEjMsgs0hMjgrNKbm2CF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX70MkteEl9o+A
 Q6ZwdAsPDMAqsn9onVdyrVPC6pgRfrlWOHq8r2189XvpXxEsbjcCnYtsuggs1DDE5Mxi0IbTz5N
 DrjvyCA7/kF+j3nhEN9JTI5wnFnH9Rg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX0zfBMUrBT6YU
 mVEiU3QEHWA8OUt4O+bjAAITW2nvRtL11lTjAWFWf1raZGGGpihbi5No2xfC6/BpotiqzuXgkK1
 cRBsMncehuFAJeU66+t4QWnyZqP08ZbeOzINW5LebbPYVMd8J1z5MEfF0wWDnkCLDwmyQO4A+hn
 jlVtqKLxRZAKlKFvCfpVJXUdHueU0xpUn1B/xUgXnb4fSP2MT3Vy+ZhK5ZRJQWxrUP/KBUUF/FX
 S1L23j2hAmck5tVfbgQmD6NnKOOPbJNq8VPJayxZ6VMKE1K+coQRP+o9eS/ZGiXt+8ENlw6W/Hg
 pWIotgp4BtUSO9TPHOElAmTf+7TeycKSZKEP1o/Gc85isuBruMQlcwzREqpr9Bj6YDrlHCCsIID
 3AlPvCMuToKlPC7gUDb2zbMXjjv7JTJV8nEubv+M0cUGNFicebkSnYvq2MNvNpLNii0hbQG2zOe
 7PSIFsaMhxPQ6gtupgw==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5a3ffa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LMDkYzAWLNq1XrXRUzQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170150

Hi Bartosz,

On Fri, Jul 17, 2026 at 11:29=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Thu, 16 Jul 2026 18:18:20 +0200, Loic Poulain
> <loic.poulain@oss.qualcomm.com> said:
> > On some boards a power sequencing target has no host-controllable enabl=
e
> > for its function, for instance when the enable line is not wired up to =
a
> > GPIO and is hardwired to an always-on level. The pcie-m2 "uart" target =
is
> > one such example: when the M.2 connector does not route the W_DISABLE2#
> > signal to a host GPIO, its enable/disable are no-ops and the consumer
> > cannot gate the Bluetooth function at all or exclusively.
> >
> > Add a generic pwrseq_is_controllable() helper. It reports whether the
> > target's final unit provides a host-controllable dedicated power actuat=
or.
> > The target can implement a new optional is_controllable() callback,
> > reporting whether that actuator is effective on this target (for exampl=
e
> > depending on GPIO presence). If the target does not provide the callbac=
k,
> > it is assumed to be controllable.
> >
> > Note this only describes the target's own enable actuator. It does not
> > imply that a power-off reaches an electrical OFF state, since a target =
may
> > have multiple consumers. It also does not mean that power is uncontroll=
ed
> > for the target's dependencies: those may still be gated on their own. A=
nd
> > it does not restrict consumers from calling pwrseq_power_off() either,
> > which remains valid to drop this consumer's vote on the (possibly share=
d)
> > resources and dependencies of the target.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> Thanks, this looks good to me now. This series is a bit all over the plac=
e,
> what is the merge strategy?

Since the entire series ultimately depends/touch on the pwrseq topic,
the simplest approach may be to take it all through your pwrseq
branch, with the possible exception of the DTS patches (through
Bjorn)?

Regards,
Loic
