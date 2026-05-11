Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FBF2FFDE3
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483022; cv=pass; b=mJpTs934cUqoqw3UfYpJBKoig1M7aazCNISGSUHQeh2k/JLwq44FIKhf0b83K1iV0higjgSHsarj76sWzD31M1XSonRBugqhxJ64iV2NZ06ISdcnz/5q45mwM8kTYoA+6kkDml/dgNgWgYk7PQqQlXtvty6cs/vcwv12qRUeNZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483022; c=relaxed/simple;
	bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWAE3xICdEYPhHZrXCZ4A5TlRMkZubgfucpbHJ54LCpen7imi8fk1/mvdTf1v2rsWynlmoj7ZV7xHXGtdu0ihsJtW/qsQESiM2/+aYhwKEmd0hyX/2FVOoAUjzkic7Mm/xIuxBUG4HUZM0UMX4XwNWF8/hzyzaVVeCKcvzCFyH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=UL1gcOLS; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="UL1gcOLS"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a858881ad2so4094884e87.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778483019; cv=none;
        d=google.com; s=arc-20240605;
        b=bXPcgi21TQp+7B4KFwVu7RdAj4GfDppZGV21EqSRvsfna048ChF0SPopS/cZr0uO9z
         hTJh5NXakGgwmL+Aq7ZIp/I+7n92pJZmxnSnAwkzYpqLZgi1mTv/GM/SKDzMoz2iwYUT
         RI3ANn/wrScbAuQLrc7ihrykev/zStMpMt/ceXqjglayOvIogDs7pwIDbE5v2B4RfGuk
         2mgPBZ7hipFP8fbEbFN05t8swcoRDjcUrOfQofLYEAB2t9DiL/spkSsJWFSXszqNFvxj
         2B5bH1lP8JpSnSsrv8vDf/bZq7fuB9gz6aZ6S8XHITdOtbEaOOS4BV75rKggrJs7isxj
         Mt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
        fh=+n1GebqnXSCXwLGHKpchkrNN+1V/ICGrcr1dWwws2Tc=;
        b=DMXCefCxGltHJVGgH+/BuBAiGfQLjKAB8ay6e6H9ZSW6yu263h1F5wDMgJNGtFf6lt
         VKjJuZ2YRKjzUanUM46XcwDWJdjqgrSqzU+vNFY4LT7hItn/8LQyLWAt+sMJeXaLb1h1
         qE75DwRS5xL4dz5+kldMRA29X9EadmRu7N7xVEWfSp+s8j/QVGQBxXdyABYkjRBGMB5f
         x63hmfZX4OkawpfHyE8s5Z1yKXtloVGJJLcfvQCriJnRSrgO/ro8wzhLGnQA0L6N1iVY
         HusMg6oRHM60VTXJ9HpRsfiXJ2kmJur75rvhawWxK9Gw6IpeuLUnAl1CY+GQ/MejC2V5
         OTHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1778483019; x=1779087819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
        b=UL1gcOLS1hhcAv+mgvf9TjKKR/64ATXPBTwjh34QOxfrp7Xs9sx1Mlr/Hdr51nX33O
         pMJpA+Azd9D0XByAoaQ2LqYBCvBgZtBDa0cAZPM9a+14RpqxqXt79QHKNGxbocnFJk+y
         5iD3e+5xGFu+WBamEANuyvi8nm9RPkWkxDbcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778483019; x=1779087819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
        b=GtHHt48Te407NyfEpZCcgFFv+1n1IIuLIl2v12XK8VVn6ywHYId+FxnK8BDd9AuAGU
         dGZ3dieeXrk+cXljq9f+D7KWuLaArlMV9bl6QhbaEfiVj6+FOv+a5aRYsgJX8c0ZwNgu
         BdYeOaBxMCFSxI4whGAc4ZHKd3Hx+DMavaHenmLD68TkZChJq+gFqPEPoOxQlZzjpNcu
         CSYOrMTUAUDIlAPo9wiTkS5d2E7Yuk4vlXgQw2rpjkamSGnAUDx5JA0JPSHRngmSVTWQ
         w/abHDjbSlugQMBlMFyUVYU/XobWt9amDgS7AYpdsuQ++ze0UIEUs8gk652bCXJ0Htdh
         VURw==
X-Forwarded-Encrypted: i=1; AFNElJ+IEkhEjQ4pJr2jVjFnXUZv3y8TNqx6beNv5DZgyS+yZ8Ugva5om+9HpUZHzlqtB+kAbN2XNIgKetxX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw86v1e341Xlk2n81PtDOuuaaZiICYA+2Nkb7QuLvIbMkNpWfqj
	HQdEASo00oZimA7ncHOOKxXX4W6O83aGAsIjXf8+NQRDweBII95b8kLYeh+EI0cVWW5fft5hcI2
	un2QfGIbHswGiMoCU8jIOWM25U+a3BKD8gVWbRGiRNg==
X-Gm-Gg: Acq92OEAG+j9GtUG6nH2ksmLZ8945w35Owm+oTAfRH7tPsRfq5oPVse837426T2d+FQ
	tUbAPEtkrc7gnzNkkiAs2/4lUNxuIDz3lbuDjBJxEjxd+4g5h8OeystErnYdZpNVFgYfpS28cc0
	8sKTz0cdQwwcPIYEf5zV32XJ15QRexUAqFTUd2/2h5CO96ZJta8ZxP4GefLRwh55yO/6FKs7irY
	Zoscg0qLYoRoWzE/THtZQYBihgwFfj+K3otSvaD3G35B7yqn/86zpQDcYVvF+UPrvqJ2g8TW252
	KDxLz1jyyzRjv/o=
X-Received: by 2002:a05:6512:4008:b0:5a8:80ce:ba55 with SMTP id
 2adb3069b0e04-5a887ae1e90mr7551438e87.11.1778483019285; Mon, 11 May 2026
 00:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc> <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
 <a6d6e638-6e61-4e39-9e06-bbac7703c6ac@oss.qualcomm.com>
In-Reply-To: <a6d6e638-6e61-4e39-9e06-bbac7703c6ac@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Mon, 11 May 2026 09:03:27 +0200
X-Gm-Features: AVHnY4KqvZ7gjq-ivtySQtnC8vX7jHJ3zr9wVqg3mRzKVkPEw_LUG_hW37iSbSA
Message-ID: <CAKA1JhZHDPWbJVSuu3X4PH3T6Ko-uzZ6ktA0i+-w919ffuvEuw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, broonie@kernel.org, linux@roeck-us.net, 
	Jonathan.Cameron@huawei.com, wenswang@yeah.net, naresh.solanki@9elements.com, 
	michal.simek@amd.com, nuno.sa@analog.com, chou.cosmo@gmail.com, 
	grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
	m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com, 
	Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 1:19=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/5/26 5:44 PM, Loic Poulain wrote:
> > On Thu, Apr 30, 2026 at 3:21=E2=80=AFPM Riccardo Mereu
> > <r.mereu.kernel@arduino.cc> wrote:
> >>
> >> From: Riccardo Mereu <r.mereu@arduino.cc>
> >>
> >> This is done in order to support different video output over DSI.
> >> Since audio part is linked to Analogix USB-C controller it is moved to
> >> the same DTSO.
> >
> > I'm a bit skeptical about having a separate DT overlay for this. Is
> > that really the right approach? The Analogix block is part of the main
> > board,
>
> Oh I skipped over this!
>
> So, does the media board require that a switch is flipped or something
> like that, to route the lanes away from the analogix chip?

No, DSI is shared without any switches in a "Y" connection.
I agree with Loic that not splitting that part but modifying it would be be=
tter.
My goal in doing that was to write as little as possible to allow a
bigger audience to play or repurpose DTSOs.
Since V2 has no panel I'll avoid splitting them anyway.

Riccardo
