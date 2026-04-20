Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868262BE05E
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682078; cv=pass; b=EBtbl7Lfddzunqhct/luKCD1CET2qNEqdGNtEy+0MqRxtblLrLwMMhHA9wV8OSBi6XJsqZ/rw4pcdJJO6H7vV/o+tGjPtnpmu1weJjvbBffAJ9DVFuqcYqe29ygBBThotjoCriPRMu5k7zV0CB96dDOPtaLacyMjDwwhOaY3Egc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682078; c=relaxed/simple;
	bh=BuXpBZf0PEuPT4+OxXy/9cCxBlbL135WGtLgJcfyrsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrNr9luQd05GwzX6sTuX//17JyAIY08cQSHfEQdyKWCZGZgOb+q19UyHt/xWgnnEWqfSRb3Jnj0hwvkjI79SXfOnEESlg5Odvd7YbsQYOdImgmAaqw5pRM5pT35OeSz7FEw1LGNZciBLhjrjATrvl2g57xweFsuAufPcsaYymew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl0XGhGF; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl0XGhGF"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-60fea0840f3so2778016137.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776682075; cv=none;
        d=google.com; s=arc-20240605;
        b=jSEBL3IYTChhBO3NtWWXYwK6sHX8hFyM+Wmgnt1u4AJz1P+pZsxpvlDjfVrw9Ffa2J
         8V0BITau8BK0MYwHYW0ZRoav6hNxFsoDbB+/HoshZ7ugGYHFK+ToYWoiKzv2vPmuYs7M
         5brYeWYHK2hUw01SgxL0xvwhpXsLvK9ffXQNQYzSbgNDLdm09kKKon5IL9tBntnUGr5S
         KLznekkgIWu3lVJwPoJiTbPrQypRoT+FRNKyExKmdIX7IPzi8usddPCVOi8rgjflPpfS
         ukQppA9kxParUVzFl/PanmCqSN+b5YHM87IabBFfjyoLxFkDW3c7cHG13g7Kk023m9d4
         e7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BuXpBZf0PEuPT4+OxXy/9cCxBlbL135WGtLgJcfyrsM=;
        fh=pQsH8a4VivJrYEAPv+K2fpZtbRHQJdRZO0+QIIEm39c=;
        b=SCwoFoXbYlfCiM6eCwzWVzy4MPyLGSbGkWCtjsMAnkoMIRo+6+ZHQV8xmuWQREnn3e
         ZsQdXVKPfpOFmmo4forgmGOA80gw5beYsFEJf41WXC++lYltfopb/1upqaYDrRu5JfcC
         5fuP9fe0BbDChE3rkD0Wk15nxA3I+3hVS10OL1hjEzdhcB5rX+te63BHFuKxjuMVx7qO
         8wbcX+2UorgRGo91Cow/q4EpO5l9yJHL6crKkAXxdlWv8515mRMFtH0KDdQmtkm7DrFO
         +hsjPrApW2qxTyoPNvJWOfLuInri+p4NqvahtoftmVMUD7nnYRMpOu/HdyDtKMmkmdnx
         uDow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776682075; x=1777286875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuXpBZf0PEuPT4+OxXy/9cCxBlbL135WGtLgJcfyrsM=;
        b=Hl0XGhGFUOoGL+h2gvW2/uCGWUArhe7IyzNyPqEv7R6bFANFcbNEN66UKFrsKkL79D
         FLtJg5j6du64n+AwguX5AcIJHjs6etqUXjz3iBgTIAQkocZIs0PUu6/obSRdiWuYfMDO
         QUrqQPWsSO6Ih+OM9NyBrcAiN9PQxfqJPycgTlPZnmBquQ+uHrdvoFvOye4wAWM2XWn6
         72YDs2yQGp+SGBgu9WEM9JGImyxhhJAvIg4DBEJjK1ImBPptVRfq8m81TXuENAP49C06
         rucpuKKRM3tSvtv9o3zw3PyPSNq+MSoSOM2jBHFlbh+tpJTkhiOmhxIeN1hrDti66Fjp
         KIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776682075; x=1777286875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BuXpBZf0PEuPT4+OxXy/9cCxBlbL135WGtLgJcfyrsM=;
        b=Nq2/h6pk4KCyefeBZhnAMzLhmIANCu0h0inTde+wFRbBv7WOoEa1o0yvJaYfI7cNzY
         qy256Dj8K49yUrPBoVFWaHteX7YGiYQAGMnFhsrjPK8kXfRa7ivi+eeD52Rk9TFOExsA
         /soEQnmRJbU1dvkqH4Tt7WYNAEKRNUfdR5KAbSFb3ABR6OrDJxe2dd17UIc9vETdtPFk
         UU4hEVhljPpf7tV9EjDOOPSPWmKm7wkBzrpcjB7Jqi12f5DjVsWPb4FX6MGwUYw2el9A
         tR4nuiUoKvWgvii1nEZk+Kd0wJ+xCNybHLbePs/FQwswRHmU07Os6toiEpQYjpXTFptb
         EKhw==
X-Forwarded-Encrypted: i=1; AFNElJ+nRtwt+1u7rXIKAUAs3ZyQLIMuURHlck0rwfVvac9O9dgVUxdi17k8vGXwCKsWUsnBqLqwAlWrGDWZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7SBTGBP9JLvE46cTOMFuI41IviVE/YvTD03k8a4e5Rrzs8K40
	YMgYfU26hgJ68FvDpZ5sXDpJdnmQnTRqAAnPPcYWUeJaYUtSDhYYi1FMaupFiyJtc9XQpZ71IGk
	+sxOQ3ALp51sWdWXdwsLXTQ3yYOjRSUw=
X-Gm-Gg: AeBDieujxCFyysts4POUBHQEISADv53jTOC+osVVFwkiaaXDUC9tF5coX87JC7wcfT7
	v9Ii0KV8JrfbBSqdwkXsU5pF1Y9k4sVRrWP96mEe3mVirSA3HSySb+D+tF4HSEk6MKGUPozE3K1
	HojgxQeajn4aaHT5dHADVTqafXqnC5res3RWA7N9MJP2HV/aNUDXtVhfs719KzeFLr+2jupKXyb
	ldEUSZ5EyLUCfRSFK9VVWXcavuMWfoZ37puvwFDx4nZT0/GGI5PkaLbSejraKPkP+k7rX/BC0M2
	kRUTXcmeCN2d8pQSpbgf0E8q1+OrlGb4SZWa8DkIRcNh7QfWHw==
X-Received: by 2002:a05:6102:5492:b0:611:959c:86b with SMTP id
 ada2fe7eead31-616fe259128mr4162320137.16.1776682075457; Mon, 20 Apr 2026
 03:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
 <4abb1626-a0a3-45e1-9289-fee366a8d9f0@oss.qualcomm.com> <CAH2e8h4bMve_hfW6VXynBh--DgwW2v8=XuVpAzUoS8N_73ZEhg@mail.gmail.com>
 <b9b58923-40c0-4d3d-991f-52471b29a813@oss.qualcomm.com>
In-Reply-To: <b9b58923-40c0-4d3d-991f-52471b29a813@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 20 Apr 2026 18:47:10 +0800
X-Gm-Features: AQROBzBXeuTko6XXozsGKebKRRWjUWdntml9cNUG_m-eg2R5qI2_Z502Jjjqav0
Message-ID: <CAH2e8h49SxvPtSXB1AWcNNfqC_ZV6-V2YKbN2_rwSemh7G3b6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: add several missing pdc
 map entries
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 6:21=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/20/26 11:53 AM, Pengyu Luo wrote:
> > On Mon, Apr 20, 2026 at 4:32=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/19/26 7:32 PM, Pengyu Luo wrote:
> >>> pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
> >>> are mapped to them respectively, so add the map entries from pdc to
> >>> gic. These entries are reversed from .data section of qcgpio.sys
> >>>
> >>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>> ---
> >>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Konrad
> >>
> >> The below change on top will fully align it with the data in the docs
> >> (no functional change)
> >>
> >
> > Glad to know. Could you please help to check the tlmm map too? When I
> > was parsing the binary, I found
> >
> > tlmm 65535 =3D> pdc 70 =3D> gic 520
> > tlmm 65535 =3D> pdc 174 =3D> gic 733
> > tlmm 65535 =3D> pdc 175 =3D> gic 734
> > tlmm 65535 =3D> pdc 176 =3D> gic 735
> > tlmm 65535 =3D> pdc 177 =3D> gic 736
> > tlmm 65535 =3D> pdc 178 =3D> gic 737
> > tlmm 65535 =3D> pdc 184 =3D> gic 743
> > tlmm 65535 =3D> pdc 185 =3D> gic 744
> > tlmm 65535 =3D> pdc 186 =3D> gic 745
> > tlmm 65535 =3D> pdc 187 =3D> gic 746
> > tlmm 65535 =3D> pdc 188 =3D> gic 747
> > tlmm 65535 =3D> pdc 194 =3D> gic 753
> > tlmm 65535 =3D> pdc 195 =3D> gic 754
> > tlmm 65535 =3D> pdc 196 =3D> gic 755
> > tlmm 65535 =3D> pdc 197 =3D> gic 756
> > tlmm 65535 =3D> pdc 198 =3D> gic 757
> > tlmm 65535 =3D> pdc 199 =3D> gic 416
> > tlmm 65535 =3D> pdc 204 =3D> gic 462
> > tlmm 65535 =3D> pdc 205 =3D> gic 264
> >
> > If 65536 means the pin is missing, I will send v2 to remove the tlmm
> > map together with the pdc removal.
>
> These seem to be LPASS/SSC GPIOs
>
> There are missing pairs of:
>
> TLMM 151 -> PDC 264 -> GIC 191
> TLMM 143 -> PDC 261 -> GIC 402
>
> and very interestingly, GPIO 190 has two mappings:
> PDC 70 -> GIC 552

PDC 70 is connected to swr2, which is wakeable. Speaking of this, in
qcom,pdc.yaml

Drivers requiring wakeup capabilities of their device interrupts
routed through the PDC, must specify PDC as their interrupt controller
and request the PDC port associated with the GIC interrupt.

But swr2 specifies GIC.

I wonder, when should we use tlmm, when pdc, when gic?

Best wishes,
Pengyu


> PDC 178 -> GIC 769
>
>
> Konrad
