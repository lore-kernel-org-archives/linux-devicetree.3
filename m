Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078D121CFE0
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790645841; cv=pass; b=W4jT9RQMJxB5GvtKYm2CA8Yza4iYuQbuUpTCV7cDDTy8sib080SQwqj0g4wpGQd3M5kxm5uvNZKbW6rJN4dSihPMh3aLolDKCQ0RCedYHq3QEqAp8HQQFL+0vL+LGbsG7mq7qPty155YxS5AmIciRvhcUPA1WgIQKdjfpydf9Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790645841; c=relaxed/simple;
	bh=bB/l5IzBo3Uz00TsP6msX6F5bA3Pf21sY7q01hxENmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRu4aUcESPTLL4pwtJAhrl3qOeMC8Md5nNVwbanOajvR+XDITAX5mfXHQJKtqo+L0ybvGRn/L6S2bqsw8ZfWLCo8syyJaoMFjLSQ8AGuiJxzZ+G+Yl6h/1Y/Hlshbnatn0/kdW4CPYUleN12lCPlnOWctOl7GlqKiIRYrcORJbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afjTBBC9; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afjTBBC9"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so16364505ad.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 18:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790645839; cv=none;
        d=google.com; s=arc-20260327;
        b=CnNeKr9pFEN3yT+KfenZbALVmjrNaykyHY1S5WzYVmay1arAwrCWQoRVvJHmWfhrcq
         +0zn8OgWeyg60hi00KXiGzKPynM5Mfg0vtnXOAl/5poHmiAsLxjAVsiDOFSu8rmP4xjD
         jl61T8q6QeES41HXbrlACrzYlG73HZmF5L8f0mWSXZoXhSj/oi0wpJow6wTn0GhhWqWT
         /sMAR/ELmKe1VIXWYEn3aN79VLbndvSoocN2dri+GwuzBiMX1CoA0JaO0pjUAA+HxUfT
         lsGx37p1Ej8jPBQuIVNc3Ptzs8s9sev8SsPB43iWdWDG3k4BrNJJ+Q9dsOMLT0OqeASp
         tGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        fh=Ye1sgoKTf+BO0mBqPMDHXpxb0jBgmP9ieT72xOssKdk=;
        b=Egt5NRHsBYXa3cYlKjlQ/Fxcq0EwnCt1OeWSbZbAZ+zWwoPgZXpsveHMErQ/V2qXDz
         HB7IhzvXJXzzFrSu+wfNCKogQ++EL0mZtXW/2ajvPAyOa6NoiiccusemXh0pJKkBcYGf
         jQNdeOjFzvI4smQ0kFFMdLywUfSW3+yBnlV9SppWFqskNkweO/wg7IE44EED4Fq5WF4+
         DCoNYpe1vNnxn/4STz3vOW/nE03nUbSNP40BhYfMnUKTG2RyyZNsUTcJTCw0NROAspw1
         H/RL56Oxhsv8OUZiVIMIaZua5dagudpLPEk+FpqBSzYwMgReAV8+ecljmm2kZ6wzTEf/
         Ekcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790645839; x=1791250639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        b=afjTBBC92FZAycK81Y3W8MduKDPalPQM/hc/DeYZ+vijQLzZLxLdhGjn4sTk1UUoTW
         iZgbW5cmZ6OIThRYSsDiDNL7M15Czu1q5Ej1mAmAf/rA34fq7xHZ/6z62OIphushVM9k
         YEDOiIMGAg7yMqWpO6pGG78e+OSgPNK8lLZMxF+MZdD4rNW5yCHZ5myulpCdYifSL0fA
         +ATByRW1CCFRGfrbLmAGL/Lc9DbvzA5rP0KHThGyWWPZqgEAD8a4TbUzeCV7f/37fhQg
         Y8jfjcfkxouxsOd33L4y+nCYJX36uN8mhZesSBy0xF+YJo+FIlZdNiJmR9FZA9y+odiY
         AD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790645839; x=1791250639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        b=EstRwczygOWoHzabS25yZM0WTVKdDN2NAJvvJhRpR2FY5Z3VDu8sp/79eYLBiPlnGO
         OHlKXOSsEECrhe9TJioUfCGpTsR5r020ItHVAO9w8VBdQpoudbsFv5BX+8nv9JVxQJAz
         7HoAoRQpqrn3BD2QokF77l7bg4GkQOiQ/zCCC5BdKVIysBExIC73GE4TlLjUMvhg7KHy
         wLCbw5uNDzluM1kMJogiN+Q5w6HnVQdT2HrzYzBUnKg5yQugtRplr9BgwOZGsT4hwYUu
         DWd7238hOwn3kkytwmcVnHucV3Q+CTzGZjasPmhgWqFgtdtlypoLDtlnqquT8xT4u/+E
         rGeg==
X-Forwarded-Encrypted: i=1; AKwUvBx9u+rsvi+fYNfJouWTRzIiAPMptXbfDaxWS8/LqApU67B6R28OdqaF892alg1JxYk0KwRo+XFZr86p@vger.kernel.org
X-Gm-Message-State: AFq9FYIgyuQb/5B65PpK8vGs39ji0p+ZUAhpRG2Nl6pzfqSO0Ibtw345
	jTvzzGT85Sk/XJ9fLH3a8lR26AWrh7tASwceUUyvwvMD805aXMWQVzdzhv2a6z/Xtuwy7hg0at3
	230LEjkZ7PbKZ0kEOnBChpmZ0RElzaC8=
X-Gm-Gg: AYBFou0gYx9PWP5zBWdJOYZKd/VmvxeQMp7naAarQLy/xFqSDRw2TtfmngK3Qpvu5ZB
	KHuVFrWuilOYLlR0sr6awWEcE9eRoBFNVDo/M58vGVabLfRF65r5U7xjCjl3jwitdGeVFoGTF6Y
	N8HleBDzv+2KxvhQwyzHRdNcxxIKxvlWJqFPmGu527frZtRGj4aYkH4Eoa5IYHRkBI++rIVQvUA
	zOizwhAYi/mXpchCfACDhXAlh7TTmochwWMB+ADH7NRlWzQTMrHSVtEU2tkBv8M4s9gu5pF5Z1H
	07sME/jp6YOHIpDDNLZruPtpZHELE5Tsj6YBPmN/7AgaWOURDKDCLRM=
X-Received: by 2002:a17:903:3c4d:b0:2dd:c100:b2c6 with SMTP id
 d9443c01a7336-2df7dc506e7mr124008955ad.49.1790645839130; Mon, 28 Sep 2026
 18:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com> <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
In-Reply-To: <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 29 Sep 2026 09:37:05 +0800
X-Gm-Features: AclHuK-gi7etBZa6zDkid3kRxBB448XKArKELjgsns_Uu77zQnT7DY8d5A5ELVQ
Message-ID: <CAA+D8APNVx1P0G2pPJ3W9u0eY2pqsKeV0Ar0Aau9AeR5mYgpgQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 7:26=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Sep 28, 2026 at 02:17:27PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports three independent conversion pairs
> > (A, B, C). The driver previously registered a single DAI with generic
> > stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> > multiple independent conversion paths from being used simultaneously.
>
> This and patch 5 are not threaded with the rest of the series which
> really upsets b4 :( .  I'll fix it up but please look into your tooling
> here.

Thanks.  There was an error in the thread, the patch 4 and 5 was blocked.
Then I resend patch 4 and 5.

Best regards
Shengjiu Wang
