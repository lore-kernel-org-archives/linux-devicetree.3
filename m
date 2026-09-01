Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C85378D89
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244525; cv=pass; b=YmY390LczC1PXqzOyCwK0Hn4oWPRzSeJCaHT1wl9Czibg1Am9oERgcXpVHfMYhf6f5acMTRY7na9vZHPrGiqPCU1Z4sskd73jinejYv+QdQeyqSzhiLQfn+E3Ya+eri40wZI2tyiRtJtHSAUxp+HI7JMZZaviaXfQ0/cwvvjyDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244525; c=relaxed/simple;
	bh=BDon4cDpFmYz8mQwr3AAQV3DrhPj3IR/41250WfkfjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+R0k96iTPD6nQavLX8ifDZtrIsYRxtZFdO68Y+SaWl6P8vamuM98UFl4Eke3p7L5iBKQPy5KzMHlr9q4bhS7NVKZMRwlx9kvfcUrwzaVJc4pec0KtJ3iIE+ErDcmE1imwlXJPYJDR2fQo0cQqCX+NgV6BIXiFJCSYEb33KmMIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJuaV8An; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJuaV8An"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so1157351a12.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788244522; cv=none;
        d=google.com; s=arc-20260327;
        b=IJsZxGlKVDTK0LMiE6aZUN9GDmHXBH+IE5X3yaMI/Eiga4Mc+xWC/DBPqCwQuiVzBb
         2L/vybkmYYYThrl12GQSxN8OA40Kz+gDNyIKsAkttaTaUSlK5gvWyF4pIl1saZjXRHv3
         oqYNmuiRfhBAw8oEiwqHX9z041A+9i9FcZKnyapAQoX1UxspiH244adWlvrsPmutjV7d
         1i3jg8CItlryAajmzvVJpp/ErCzFP+tpHOXfUYrzYle072Y6N94n3MJSQxCnnAfhiPRj
         ZoTgk8J1J+dTYYsnL/C/+haDOLSvZQYgqFyRyBt3YwP/Od93fqHH2KPiP3t4yb69rETa
         V3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        fh=HfsCatsjgV4ZM3LOSic1CWyCnEvL2KOX/5I9P77VUvw=;
        b=ZPjaQf/piPXzi5LkgX4yBsEydR6aXOXZw7GLEdV+0WaO9DJRYRUOn01DyMnqS+MpXX
         AWKWZA67kHCR5fhMSdzojsby5l2b0midpOauGl8MtP86WSZmyiKp0uh+hHhmNUJXQ0Gp
         Sr7CEEs/T+482Lt23IWOCJIrAVBNXJ3Ezk+UoKNtzxVFn81FZ9qYHkOZZx9cHp/XVV4J
         jzW3+PD4ejlT3OjSsJJ+KWoB0Lj/Y/5PzXL9x4guRF1mnAWPxBb34W3k2mCgid/fp90K
         rIbMP6gJuQrRgekMU4crcMROCymMdLJwTGcFDmIKFomxv4WsTkAqZK+Rv5eZcc0IDXxy
         9Teg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244522; x=1788849322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        b=aJuaV8AnNKXXOBUpWLK4vmUqa63/rYdfhLrWH4OC8LuQ7iZGjM2qhAW4Zj7AjPB1Wk
         COYUzhhxr3JQoXTMUHkbDDejIEM0R4rEmPDgezWB75j2GMgDPuwIGT0Vukz8ZDjA+prz
         vrI7pDhJLZctnjEWZF+xFx8lZUXJ4AT3PhM7HL3O9yPJqRz+M5Umla29sf2ay/YTV1UG
         i5e6QpUasjkFkBZP22NlMTmzcy7YKD5yDbMEA6w0/ddqDDY7b1vcclRmEyfGmj5N0F/Z
         FYGHIlIOe65L5fN/FXC2C8Z6hufXsqPivD8ogtJujMhae9khHKSVj9SpSirplcC9w6Fi
         cNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244522; x=1788849322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        b=TKGPBDYogbye4bassCju0EAvIaVCS81K8aH9/yhL2qGjJeVGqeZPEp1oQI5TD08gmL
         mYna1UwjcTxt2vcTK8lMGfHsV7xkxN62rlQGRlTJjoLym00chY1vkVkQpzx3zWJCgT3V
         guuAoJ8+/o5Yn946JffUn4q+TMlgm+rxaU1kEu4Beev8iD67erbsc2DgwgjbjtY8Oepn
         6KO9iI9mpwTHYQTgv03Y/H/5vQ28pZQOyUZLgke3DWkIAuHMxShTz5cV9TPQ4s9gvvA6
         OX2tu5UzjPKjJ1jBYU/AOUMdDMrCl09zM9AeOh/EmllVMV2LNRuJp/+FeHdGUdE3nz+Y
         wtLg==
X-Forwarded-Encrypted: i=1; AKwUvBzHajBWa2rJ4CH2dQaddy1Jiw42yI9GY0vwR3HEdu115PUIEv9Y34XH78o5ES5Oii+igX+Q4+BT53Ve@vger.kernel.org
X-Gm-Message-State: AFuF++mQeeY6IgJER1koREgez90y082r1PVYdwnGbF352U76H+R5pVAM
	H9a3QBnntDQGItvHYFKW1W6AX5/eUblcTLcHg9rkqejraBf1ivPLlLH/JqZy2p1yMHY280dER7s
	EnL28X09ci9NmSNmCW6Kxqj1JT2OYYwI=
X-Gm-Gg: AYBFou3qzAwt6kYXD7UV/xMrPW1ddMXfOgUUK1UbRioQektG9b7pJDX/n86H1o3d2ra
	SESK6m4UjG/LL85FMzaH0cmtt8K1qmQBmV3aB8wFuFAzXdznmjY5snig4cn3Hu+8wxjNXdbHEyB
	dZ/jK11dzwQz7g64iI4rGlhqh1hHqzTGldOEAbxeGZNlUq7CHq+UfGtGj7bADf2/xbW95VUJoQk
	ghpJJzWx7eMPajI1FcQpRc5i+gGksugyV1wq9MTrbIRuMmgeL4rI2O9U/KJCWiRnbr6B5Ih5rD4
	RqH6zIK2VHUHLNDxIX6CUrmEpVPFZYmCSzEqcUALwVryGivaMYtPtzOqjaWWDwSS2V1aY4bqQ6B
	feQ==
X-Received: by 2002:aa7:da11:0:b0:6a3:ec9f:7e3d with SMTP id
 4fb4d7f45d1cf-6a66a611510mr1306101a12.6.1788244521855; Mon, 31 Aug 2026
 23:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
 <20260824150156.1310-5-sreeshankar0910@gmail.com> <apYNXZ9TJEC6rVVf@baldur>
In-Reply-To: <apYNXZ9TJEC6rVVf@baldur>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 12:05:14 +0530
X-Gm-Features: AcwNN1U5hmy5zAxaLt_MG_Oo1HmGFV9z4ZXwGALePDH7cPQz-NpgtyLXkjVfVO0
Message-ID: <CAA-+ukLm-6FhxytqX1=x4pZUqZU_bmB+hVF_+5K1AW=-ZpPd8w@mail.gmail.com>
Subject: Re: [PATCH v6 04/13] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org, 
	ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sept 2026 at 04:56, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, Aug 24, 2026 at 03:01:47PM +0000, Sreeshankar K wrote:
> > Add support for the global clock controller found on SM7250
> > based devices. This should allow most non-multimedia device
> > drivers to probe and control their clocks.
>
> "This should"?
>
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> [..]
> > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm725=
0.c
> [..]
> > +     .clk_regs_configure =3D gcc_sm7250_clk_regs_configure,
>
> /home/bjorn/sandbox/kernel/workspace/drivers/clk/qcom/gcc-sm7250.c:2228:2=
4: error: incompatible function pointer types initializing 'void (*)(struct=
 device *, struct regmap *)' with an expression of type 'void (struct regma=
p *)' [-Wincompatible-function-pointer-types]
>  2228 |         .clk_regs_configure =3D gcc_sm7250_clk_regs_configure,
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
>
> Thank you,
> Bjorn
>
> > +};

Thanks for catching this.
I will fix the error and send a v7.

Regards,
Sreeshankar K
