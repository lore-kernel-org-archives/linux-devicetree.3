Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97703F0772
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461891; cv=pass; b=QVJPjUV62zMkQzhhNAZ7Od+TbWBNycqlAu0OLEYLfLoXop0Fn8LicDc/XCP1qFn3tu4xU6sYDzaip0FNdRiE0xk8226qTz9r/6qkWpgrt2TUi7ZQu/1YV02Ap16rXy//cprKUjEXrrJkb9C6JCts9HdN/cBx7pCvSV65Kvlnc1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461891; c=relaxed/simple;
	bh=QbqXT4tTrrdjuTLkfmMqgyWw3/qNy/1JnUwKAJmmVXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pC1ABfQMfS0cx0P72sbbQW33/VOOa39ff8iMGOvyQwyCvg1XAgAq0A89f+pd2sOcZ+68swg1VJJQIYOSkoq6LFO2ndEcn6TzJ33udy4e97XDCUP7epI4OVyhncem5iivRTjadFhbLsXhydujlWWGWSfr+JWKi2oXi+8cHl67P2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHJYPyLc; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHJYPyLc"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6058ac0ebceso7513022137.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777461889; cv=none;
        d=google.com; s=arc-20240605;
        b=MuZKX91Bfj94ZULG4w6aereyev0H3q3k6aGOFNKHMZ7bhU8CJT6xJ9xGhQPsQJqxjE
         wjrJ0fMX4NZjmOWW45n9wSEJKpbY7NF6QdogY3V9/uuFl/AIlUQi8RiNv+lAqab0tyhv
         /6egZZ142X1jq63bu2CmffK5uhxpxdsNROekEoc2dafya1jHA0gxn0hl85ul07PjInB3
         pZabTCLXzWEHeoxFYWc3ylqy8NsiFqdbMP7iDKssA0d+Jn2iDYmUF3tPw0NZEG5r6dCM
         qP+6F4UzYTqRmOdrltElKQUXpBekYjd6/BKk750CBvjkZYZA3YFJ14vGQZqw3noooNeu
         cvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7gz2/nVmfgvH8AxcwgS0YP5YxZm2HnbLT24tkQ8ZyMI=;
        fh=m2+Q3LwJAHFsG2U18xb51T6Qoextm4G0Q3mC1gi9Aso=;
        b=fPHq1Nrf6kMFDlwZKNKO/R5Sd8Y3P0cIfDlXfLD41bSt++LNFOFg+HNDBkNl3W9yzf
         q9F+0GM2ajlGmz+HsyrfsVbuFCGwFU6OxbnMdM7I6xuaLFJnyNK7Id41BfEGgyOqnWLf
         rXMwpsUKcxQcrK3e4h8tYWgtt+6D2DtgacHIxB+945cxJuOLsNS6wjpTwn34WplC8mF+
         BCgOVhB8zx+INKtAKG91yAJuBLkJS7bjsj2fryHU7Vst8Tp3ofk+OfbscB43/hqGdB7/
         pAj2/8kFe63JboSnf9z9LZjLSvoQTnySqkyxHYrTqnS3TY0ED54BydxNYrOmweDV3nwB
         VMGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777461889; x=1778066689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gz2/nVmfgvH8AxcwgS0YP5YxZm2HnbLT24tkQ8ZyMI=;
        b=DHJYPyLcfCack5RDNBh/WbrKv+wXFEVM1ogNbJePRh65yBH+9P8v4lakenfWlxAmUG
         gEqwnP4iem6/J2IU4ISlhomYEyM1i2P+F4X2ClbHh+mRSsCj5tigzw0i0OZx2MCW5fVi
         d/w21fuXq16Ul2O7iJHGpkYMM1892ghWW9xpcwsf+4Ko+E1uxg9zj0OP0F/ytJUty35E
         R2YtSCIep4y1iuIQbK+/mdMLVAcxU2TKIFPxihta1F9IJCzeTU509pBuMIMJStw6hDC3
         CDgH3q6Oim510t4nrUkPPrBDNdVjt7Hryf5wT9jd4saWoqRoBMCEr+mVGFwEt9d9lSj7
         XQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461889; x=1778066689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7gz2/nVmfgvH8AxcwgS0YP5YxZm2HnbLT24tkQ8ZyMI=;
        b=frLTZIhkoVQayvLQJN48rJnuweeTjkP3OOL39Uh7uLD78UvB24F9InGBd1ei033bKE
         hyAmnI5yI6+PYL4GHtn+zGScdLLKxJaMP60/Nv/mkTr8pWXLFsS+HdnDyjva4hQ13thY
         lO/EtcKjbGnquWiPClhmiMjtrC7mW9lU55w0mIb4ZQBuD1bKoTKnUtlhnmerI7Ow2nZW
         ctibOiTENnxITEfs4GawATbqIhJtUktIeBHq+jXGrSTikcuAs47k65qxtWCLHhKvwAIX
         spSHAUaOTnCMRAFU0WrGA3BDTEAS/mJxLTNndirtj8WxyBl0/AAYHmT6iuSh1grJnM2Z
         VYrA==
X-Forwarded-Encrypted: i=1; AFNElJ8uX1LQV0ZgpoX1u0HM9nV4xouHeFa6hKofguSNbNsrEqxArumkvWkbFLJnX30TAQzBkgsUgpo5Io+y@vger.kernel.org
X-Gm-Message-State: AOJu0YzrIcrxK1IXk9WNiU3Igw6Q0iU4qywvjy+jC1pgIW0Utshn53Mm
	4mB0pFE7ys+gBSDR0mx3ZwX940JzzPvGPO6ychHxfQV8OvHCtSuDq/BUYSRirbZsrC0FscV7L6s
	qiqeRwYf8KFiFR1lqkevLVkN4RDMsgms=
X-Gm-Gg: AeBDiesp68NwChgy8ffFKEaUUF+el0A0ViQWNRtLavO7m2c50FQ6TFlTejqYKKQ8dQU
	sWhTRfos89FLEYaqyE74dmDD2nxGY7s0ovVJ0UChhp6yFFWdnr+MaGV/m8l0hgmTQNReVJGune2
	xewzg6Qf9HXk9PzD3XfDIytjZyY6+IOpWeLkQgCiLJsIBt7vWqLOqvF7G2KH0wSL/YhC3uqCl/G
	AEWgKPRH3b5OKFWdS1JlaB3wclYUisTFDUspAWrS66Rq4qhgoMGI4xj5qZzgjwzhoZWw410792R
	I24v0XhZZV4RlPDTs4qD9x0F+yZ+ahLRhg48Fsr/xBLzMdrMDQ==
X-Received: by 2002:a05:6102:5e8c:b0:609:4d86:81b with SMTP id
 ada2fe7eead31-629278208bamr1936529137.27.1777461888827; Wed, 29 Apr 2026
 04:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com> <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
 <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com> <652bf474-a524-4391-b8d1-7c0bbdc28b4d@oss.qualcomm.com>
In-Reply-To: <652bf474-a524-4391-b8d1-7c0bbdc28b4d@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 29 Apr 2026 19:23:57 +0800
X-Gm-Features: AVHnY4L7oPV5ZetIKykRzVLPFjvo6DuPoYEk-dDEME-xpa-a28o8EUMduxtFbTA
Message-ID: <CAH2e8h4MNsaFiYmO_y8Pn8XVREGtGam5xY=yeFCK7p6BkD4y1g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 6:08=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/29/26 8:36 AM, Pengyu Luo wrote:
> > On Mon, Apr 27, 2026 at 9:00=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/25/26 12:52 PM, Pengyu Luo wrote:
> >>> Hi846 is found on my Gaokun3, descripting it.
> >>>
> >>> Note that it seems that only Goakun3(3.0GHz) version is equipped with
> >>> Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
> >>
> >> Are there any other noticeable hw differences between the two variants=
,
> >> that could warrant the DT to be split?
> >>
> >
> > Except for the cameras and cpu, I think no.(But I couldn't tell all
> > 3.0 variants are equipped with hi846) Before camera support, this DT
> > worked for both of them.
>
> Do the ACPI tables perhaps have some sort of a hwid mechanism? Perhaps
> two nodes defined for both cameras and the _STA method referencing some
> object?
>

No. It may poll sensormodule binarys, register lists are in
sensormodule, the slave addr may be here too.

In qccamfrontsensor_extension8280.cab

CAMF_RES_MTP_ALT.bin
CAMF_RES_MTP.bin
CAMF_RES_QRD.bin
com.qti.sensormodule.hlt_hi846.bin
com.qti.sensormodule.xinli_s5k4h7.bin
com.qti.tuned.default.bin # for hi846
com.qti.tuned.hlt_hi846.bin
com.qti.tuned.xinli_s5k4h7.bin
qccamfrontsensor_extension8280.cat
qccamfrontsensor_extension8280.inf
SCF1_FRONT_MTP.bin
SCFG_FRONT_MTP.bin
SCFG_FRONT_QRD.bin

in SCFG_FRONT_QRD.bin

Package ()
{
    "com.qti.sensormodule.hlt_hi846.bin",
    "com.qti.tuned.hlt_hi846.bin",
    0x0000000000150041,
    0x0000000046080F16, # id, id_addr, this can be found in the binary too
    0x0000000000000000,
},

If this fails, then try to load com.qti.sensormodule.xinli_s5k4h7.bin?

Best wishes,
Pengyu

> Konrad
