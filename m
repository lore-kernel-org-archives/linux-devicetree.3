Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06E03603DB
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432311; cv=pass; b=EkGM+u/2DmoLLo4fnGrs8kVgqAN5v1YUMxeAG4nahOEQ48Zey4ETqYYbzeZaEgIqZ63sgpJthvnhe1i978tQTxqrNasOaeldht0IErBeXM/o66jlhw23DCOr1FUbaZW3HW4rMDfV+XQpbd6JxeVHPjlIPtXvDeFTsf+v/2fAuJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432311; c=relaxed/simple;
	bh=SqK1UZBlpNmMZaxyfQOlt2VMUPTDu4n9BsnDzyyxKLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1kLZGMeJ7zqRMW1CdcSwGrSSLXz8XS0TzzPvPKUtYnHuSwOMQTFRyfKgQBvmnlTIJ4VBnpxSq9v1wcMfWCEruF+uRx0bvZ3Y5SoQJYSVeiKATIccVCvIdsT1qKgOM+C0Dph2jtx59yyjNAbdJzLZmJLCuVpipts6R6yU8deZAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAcksszp; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAcksszp"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56eec951db1so190250e0c.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 06:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776432309; cv=none;
        d=google.com; s=arc-20240605;
        b=Uq30qzYi/gehGRHwSYc+gHBRcD2FMSdZsa5reKZq2W7+JTmnYj+T9OxMYh1bbcAE/P
         g/1EYP/zg4PwMdc073cw/JxwWw8fkBRClG42+ugFNdCri4kNIMVfTvNcnP/MW5R98fMn
         fPeXtHrjfdqbZcBDbkyFs2xRO4l/iLfTy6lscmhA139TkuTwFzEP8ZOaZYklaIHKCYYO
         qrAfTlRvJPIKCwpj4yaaCD8RVmi4RqTcGuiThhgE4tTB7q128eWD3VIWzhPufKhQ9YtD
         JMrucu/ge7AlXASl8f7xqgLYG/uDk5O3LLCFicZ+j4o9kse7iNHm19eK2c1AYrG84Prm
         T67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SqK1UZBlpNmMZaxyfQOlt2VMUPTDu4n9BsnDzyyxKLg=;
        fh=zZv11MjjvGpamBDRdcKNoKPnhuHu+mgim5PtS1TW77c=;
        b=lnnLLaYyOx6nqN7uI9bEDDEMceEVT3qbbZ1iHCOWFLhBRisbHpsgxmUSV99ZeONekz
         Bb7kfcSSKGidEzg/3bh1RSoX77b+NbjXj1u6LcsCujCCo5skAT/eJgKn+uP5eNy8ttDY
         RzFnIolv+xDlvh/pGCtIcJs+3LXo4124zmdhTjjmZqaQaDI9BkG0CyhQpA4mAk+h0Sq+
         KIPSHY67vMUheb3ol6zVcZ2HsbFRWrpR7HpMFGMR4bXFL5UHd9sVDxx2d3Z6QN2Jqpqn
         EQC4kYLr3rRoxUfv3s9Ns4dS0YLm8L1KyAE31+DpgyMg0wy+1fUxSVTr6QKgrS57XDp9
         nESQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776432309; x=1777037109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqK1UZBlpNmMZaxyfQOlt2VMUPTDu4n9BsnDzyyxKLg=;
        b=kAcksszpNXLTUga+cGCMP+QRMHGvwycgl3U4wWZ5qG+s6Ppy/SZdQ54rKSJM7T5bjL
         yqx6t57yr/yt+RiIp6jP6ZaqdpU79M8nJmkYadIjS8FIQ1JESpLy+C14oCEnxrCkmu/J
         ap3zcq+qwmuvggfxdK/uDXA/or+uAjpzLoId+K+My5+8Yl7sbQZVPCVx5hRq+wElJKe1
         CMR7Jx9yGjb7ss6ESVpUZXGpp+PfodrDjtSL8TUaSyxXm7kHOhM5VD1qyZ2xK8CDne0h
         9kjmITdlMMSBen5Sbl678E1+JlKFd+V9UDJd09TlZWViIRqMMOPMEf3OI2niv0M8Lkkn
         NsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432309; x=1777037109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SqK1UZBlpNmMZaxyfQOlt2VMUPTDu4n9BsnDzyyxKLg=;
        b=LnIi9mgQIM8RhdV/2TuHe9T4UrRtBchzt1mQBh0AwJshIPvH8U9Nx9jxI9OGIak9l3
         0hgchjg8lrc/MnUm9Y58cHznYlHePkMMbAiheaCarw4kcQLwsrOEOnWoj8XsjitTCAUk
         zY6w2fFjFotGeNhem0oGArShwn5xxALMZr9ObdSomUEQgSo9TKD7P/1crepmVCgl2Gj6
         9/1aWCCVOW+nYRJu32xC+lsSqIPGD7Go/CMcotDcOdff3lkR+4ty5ZZNui0G/QNNPCDZ
         XU2g1xc69Kc/RxkecutC0IYgSE7x7t0rdohpQcOExlptfkhzOAPCRGZWP3fZnkWF/JFV
         Ip2g==
X-Forwarded-Encrypted: i=1; AFNElJ/u8wksQBmExSCMqcurU1B3TfsvcSvc1IQvTVKZCPS1YY2z1S/rnLiJ+S/pqy9fGISpbhCvE7Geg1p5@vger.kernel.org
X-Gm-Message-State: AOJu0YwyPkmSmc1JRxnXe7WLI88ZAi+8lPhtmy8+07HJRNsp98TBJs2N
	MF/bwRLKuc11S4+RQt3Seku3UYOpCLUYJpmeRW2tLYFuNEVopdCxZ+B49agW9Y2aBUPJL4zCnbJ
	7Mfi8EODb6gtxvXbgWGgw8/GhRlaF1s4=
X-Gm-Gg: AeBDieusf0UKaZfS3uus5EYFzf+B5LMk5dG9/Td1UZoe6pOv8Uu0gvcstUSihWaTbhc
	nCHI6E8Drc3rsDvNnYEKDDwgAYsmsRUrb6FV5jrVdPC4+Pvsg8ycgnNRNdMboL2EnDh7YaMZIWi
	e6iPb4shS4HgdRXsgqP5/oY9BlxZrQEa0oSI4AopHhINpm9XNvICtOFx3X0WfpByb4n5ktxsdyJ
	CeIHWuWGPKZ7aRw/X+26pghJyVerjNG4TOFP838f8e/S+rc1sirgdytj4kmRQRrKypaN+/KMwpQ
	FZT81qNOmQH8hvwmTA==
X-Received: by 2002:a05:6122:4893:b0:56f:1ea2:8609 with SMTP id
 71dfb90a1353d-56fa57d97fbmr1146988e0c.3.1776432308496; Fri, 17 Apr 2026
 06:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228125431.23098-1-mitltlatltl@gmail.com> <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
 <CAH2e8h7W8Tng4v9Da9c7xg-oczHgNcMvz0OF6A27L9m+Pw7iZA@mail.gmail.com> <54ab414e-a33e-4cdb-a125-5a980ea7e851@oss.qualcomm.com>
In-Reply-To: <54ab414e-a33e-4cdb-a125-5a980ea7e851@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 17 Apr 2026 21:24:25 +0800
X-Gm-Features: AQROBzCDLJ6v8mDcdpHtTggoUqR10R3kOuBzHCUGMT3dT3PMhuihMf-zW543gGU
Message-ID: <CAH2e8h4byQCMxAO9aR4SHUbm8GJeXmDJ3jUuayGPf0s1CQh32A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 8:37=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/17/26 2:23 PM, Pengyu Luo wrote:
> > On Sat, Feb 28, 2026 at 9:13=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sat, Feb 28, 2026 at 08:54:30PM +0800, Pengyu Luo wrote:
> >>> Use it for the DSI controllers, since DSI nodes have been added.
> >>>
> >>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>> ---
> >>> This patch depends on the below series:
> >>> https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlat=
ltl@gmail.com/
> >>
> >> Why was it not squashed into that series? I'd assume that DSI nodes ar=
e
> >> incomplete and are working "by luck" without the refgen supplies.
> >>
> >
> > Today, I did a casual read. I found the register(0x8900000 + 0x80) to
> > enable refgen is always 0 on windows. The refgen driver may be not
> > compatible with sc8280xp or the DT configuration is wrong.
>
> The Linux driver casts a software vote. Most newer SoCs should have
> a separate hw line between the PHYs and the REFGEN regulator to take
> care of it automatically.
>
> Even if a little unnecessary, this won't hurt
>
> I *think* base+0xc & BIT(3) should tell you whether the power is
> actually flowing at a given moment
>

I see. Thanks for your explanation!

Best wishes,
Pengyu

> Konrad
