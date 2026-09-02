Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92623373BF1
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336879; cv=pass; b=lUKJYbWVOoKmX8qJj/T5GmwaWlR8E2xVjjKyr93Sc001Y3ujb+k+MvcdHVJ+ZoO5SAIp4kkSQYpqI6tVdcW4LV0SzhKhA8MjD/pDejKeKgR5yDRCEI5k7iIC/3GSjfk+HbemdD3fLpL90uDFRpb5BWJAh0QkFPQ8AvWLh3kdaqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336879; c=relaxed/simple;
	bh=+c8yIMrlDM+qUzZxuCRwA4fdsp/cuOIvaXQsFKyMViA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQMxrypk3jliCAttXqf+B9c2WHByYnyB2/tGEteKOp6rMq/0aUKR12dqX/TbYLF1a/FAu+TtPiN6WBhdE9oSLGV/6vXBe6n8AYGe3F94QBmXkMmO7STL4cAodU3U1PMJUpl0wwn2ytHDnQarJRp9RHZ7Cqr1MHQZlZy35x42/QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgAiIXD4; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgAiIXD4"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-966eabad303so210204241.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788336876; cv=none;
        d=google.com; s=arc-20260327;
        b=dQFlRTBn9zJ5ksukkrGvUwyU6XkuR8tAWB3w5brCyHoL/j49dQ+KzIuJq7VLn9y5Tr
         OJFAj2rfgfNJetIZzHZtv9FR5U65Y0BaAw0ehM1V2j5GfRXBjmmSWZ2zP8SVdTdzuVWd
         QD8sgzON1tND0z5+Jvlz8HrfRD5eJA3eSzgwD7W6VIqfKLkbeHaWn06JRk08QBm5ps9x
         xkOMehKlI6PiHqdkaH/ESeeD3BZE0DVtHmHl7xju6VFwNVKuC9NR2NVkXSFmLHNhxd7I
         fRQSfov+jLdZaGO21UNdO77jPP8RW3MSo5WJAhHrAyZmVqTZO4i+Teaw8V7F7GpYm1wJ
         at8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tHj5dQ8OvL8pomf0qCLtJN3kNWsHoYdxixHEmUsE5w4=;
        fh=d4CesfJWL8L/qnro+ecvfer1te8DDpp+/sXMcQ/eLjs=;
        b=U8UESXbrN2OEmnJe/HSZltkMa48vGpl8Gdy9LTsAfg2RPoveGQiFFg2A2vJS4HFrrJ
         l35Gg4aaPTsrqz/V603x7fBo8Wvikp/8nGpXoKJtCU7o/rV0Wz5Z+2KNM2iQaiDro10K
         o+vk0fFTBS4XisorA0TCvYYgmW5sxvrHVxwef+0ueEP1++dhn4WskHfgAM8+UFya98yy
         nj0dZG4LjecK5aJMBQ+2+oGzReqJTx/G3W7RLQfbO2mu3c6/GEPXSCsbowKhQmQCPQGc
         EdTMH4nufWiLaljWBK2PqwAaDqXw30RFnWuFfT6YNH20pRriOzY5hg1heUV2G7JQbMuG
         M/AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788336876; x=1788941676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHj5dQ8OvL8pomf0qCLtJN3kNWsHoYdxixHEmUsE5w4=;
        b=pgAiIXD4yTCMLTrDFbStOZ1YHmdM7VTAJcGS/9bP8axAC78Yd1B3Gz4zshe3RoppnI
         Y7nxWAGirNzSLfNgUv/r9CjaBSVvcbwOQC2PXbRlzuarL1AYs1MARR+LQWFpUrQEVBlb
         JGybpv07+UkhcyXRwMvOLKH7AmMKkgPep27GW5uPj8oeix9l9djUbiIDlXkbw1WF+TQX
         ad4bg9boMr4TUg8WrX34PN21MwFmTgQumMeqihSsHi2gS8knr0op5vlPpmvMRB5xfQ7T
         8u/2C1osbY2mj2uDPoB62n6sO0CDG2xEFlra4iKuBBF2b5hrYeEVUTibCIc0i0Qa3hSq
         DOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336876; x=1788941676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHj5dQ8OvL8pomf0qCLtJN3kNWsHoYdxixHEmUsE5w4=;
        b=SwtXrlPbMo99NN0e5xGiVgEv2mbW34E2zVV0TMwx5smRwzbZdNHP9CNKJgQmKmyf9V
         EYMZM8dKKE8hklibaN6llNh9uQvQ6mdGNm+gGhtG7wnuaQ+iTrwMNQZZ2/G2npNlaQ8i
         57NjvfVDyICwk1Q1cTvAXsn9bCU30DzTik6npbZuy/vuzilBzxxVotU76jAEiWOUbAb0
         wczzJFgXOihFAl/cUdmJWIdeoAmx9SRmvMPbRApqptDpMvI/GRgWoxRV/MheZKCEFA3R
         Ohin5sAkWosMtqsMGep0Gn4MzbyICPA3lXqdQp8YsPslhFNDnZQJzlVhV7+JHsfYSUn0
         ZwWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu0sxtHbfAG1m4GRcN9vcqJghtmI6J6X0kha9lEHCjX6yAao4lw9RrlPQL5lL2tBzINNrwFRALVdzA@vger.kernel.org
X-Gm-Message-State: AFuF++lWh1oyD/sfE/7XCw8ZAlQj/fWkKslJWvU40vUvv5+L2ZYejWjX
	ptONgYMWeyJHqWQshsHLe2kbpRYd0RdhS1fXaqnxCTjFCKkMyNjrmqe2v65QPaHsGmY3WAr2/OH
	K2n3JsdKNAVI1IygqtxvWq1tX0gy5VdPvDQ==
X-Gm-Gg: AYBFou0v1ebCxJ/r3QBxfBsuOARG9yVNS2jsQKtL38CF5R8AssuchqQj/oeDI1ejZK7
	SBVfAQiJ1sXe3BeRruwLAMua3uC2/PwMiYHnHi2D2Kf7pEWCqgfYMmG5IcfehyzD6BmFJJubCeN
	7us6U1viVgfo5jD77Ksx4ghd7ojMWAiAdDKzFC6a9vEZrdoARo2KeYfAPQtFzlR5VTTe15UUYlb
	BZTQ63Pmp/RdTw9MlWN3SIX3X9aY4pFMDQJjPqlGMbJJWkxtec0PF87yqNnLNDIc3VtubleYTP7
	ml2o4SaTLlqpMGir9s45m001YTUpC2bsFf/qS5eMtax82XE=
X-Received: by 2002:a05:6102:554b:b0:789:56eb:39a5 with SMTP id
 ada2fe7eead31-78a1f21f9bemr925356137.5.1788336876344; Wed, 02 Sep 2026
 01:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
 <20260901-anacapa-devlop-phase-devicetree-v7-2-0bd71d2e0105@gmail.com> <20260901122853.23E641F000E9@smtp.kernel.org>
In-Reply-To: <20260901122853.23E641F000E9@smtp.kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 2 Sep 2026 16:14:25 +0800
X-Gm-Features: AcwNN1WiCJIawK0Ti208acr_E9oI2A5bdOdmfOqfl4p61ZvVQa6fWkwSBaLQipU
Message-ID: <CAPBH0A8g27oMqaSdsU6+itwLzQ9C2nwg1x5O1bEKtEJaXbdsJQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/11] ARM: dts: aspeed: anacapa: Add EVT2 devicetree
 inheriting EVT1
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=881=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Incorrect GPIO line name mapping due to a likely copy-paste er=
ror in the B-block of sgpiom0.
> --
>
> commit aa80bc774dd824dd074a3ccff2eaf0de685d5eb4
> Author: Colin Huang <u8813345@gmail.com>
>
> ARM: dts: aspeed: anacapa: Add EVT2 devicetree inheriting EVT1
>
> This commit adds a development-phase devicetree for the Facebook Anacapa =
BMC
> EVT2 hardware revision. It updates the Anacapa wrapper DTS to reference t=
his
> new EVT2 file instead of EVT1.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.=
dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> > new file mode 100644
> > index 0000000000000..be7f17ad5f8ec
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> > @@ -0,0 +1,168 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +/dts-v1/;
> > +#include "aspeed-bmc-facebook-anacapa-evt1.dtsi"
> > +
> > +&sgpiom0 {
> > +     gpio-line-names =3D
>
> [ ... ]
>
> > +     /* B0-B7 line 16-31 */
> > +     "Channel0_leakage_EAM3", "FM_CPU_FPGA_JTAG_MUX_SEL",
> > +     "Channel1_leakage_EAM0", "FM_SCM_JTAG_MUX_SEL",
> > +     "Channel2_leakage_Manifold1", "FM_BRIDGE_JTAG_MUX_SEL",
> > +     "Channel5_leakage_present_EAM1", "FM_CPU0_NMI_SYNC_FLOOD_N",
>
> [Severity: Medium]
> Does this code break the sequence of ChannelX_leakage pins?
>
> It places a _present signal here instead of in the D or C blocks, which
> strongly suggests a copy-paste error overwriting what should have been
> Channel3_leakage.
>
> If this is an unintended copy-paste error in the B-block of sgpiom0,
> userspace tools monitoring hardware could read the wrong physical pin for
> Channel 5's presence and fail to read Channel 3's leakage entirely,
> breaking hardware monitoring logic.
>
This is not a copy-paste error.


> > +     "Channel4_leakage_Manifold2", "BMC_AINIC0_WP_R2_L",
> > +     "Channel5_leakage_EAM1", "BMC_AINIC1_WP_R2_L",
> > +     "Channel6_leakage_CPU_DIMM", "CPLD_BUF_R_AGPIO330",
> > +     "Channel7_leakage_EAM2", "CPLD_BUF_R_AGPIO331",
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-anacapa-=
devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com?part=3D2
