Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E23090E8
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436246; cv=pass; b=eRf5DWu3/OILNeXisBZoSNmLTdMWfqBV5eXJrcoYJdAzADOEsdKOFciEEm5gxopT3lRL31FTYlRQ8bPK2Hv668sYjZZVyl56WYUAKJTkIErKIf2vom4jfiCTC/wFSjGLt1MEYmqiWe2eCQsNTqwYzPm0mxCaMpTb68wHTAIOrGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436246; c=relaxed/simple;
	bh=5tfluHqupps5STIW6gd2bV81yHlP1aogVix3b1hDENY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tC7JciGn1nAre57lFMGFJxb0yHMcJNu40OwxwfJ7Y50wJQsTUtA0VnOwSPl2n2HtVCXbyaanMt/3+fTjWFqiMdR9T0lBeUMzN5IMYvrC0dDjsx5aDRGDkefba/1po4vyLPyoSHwQ89jhyjAcMmwvm1aVr54A5fKrxovackHxQ7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8WLEBz7; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8WLEBz7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc61541f8cso9188025ad.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786436244; cv=none;
        d=google.com; s=arc-20260327;
        b=CLe/Wf9XoyGzOnLM2uPLTQ0MfTlyraHUv1BKrVFYr3HYVGOhtE84RnLg3aFkHtVtiL
         8VWrgsCZJT5x2UMC93t/4AfT56mzvAuXmYeJflJXEzeBKy+YyoomVnS/0Up7WbGR7fJV
         EQ6AQWkcjVWZ+czhuiK3IHeKiYEsbQoFYpLFIiymyIOOyWKsNolSG7/xLlF6D/tHumhS
         QuM2VT+LmmdebE1aYg/3Sg+52wD0mtcLPRM9Cpixp/l5Z8EK9BFb+MSLfopBxHW7gw8g
         5noTkPWebcXf50M9qywOb2d7UF5Q3GJz0IEqfBVfzfQusxfmMYbV5354caYgSB9QdS5z
         wIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        fh=di0v8oF5s4rRTqTg1cRdAoC0Bt3ZrbXJniNN6fBdFio=;
        b=otMelRo3sa+rfsBXIvBC01S0wcvcS5onqcHP46r+SKaGH7hN+YGuPSX2PoP0Duu/r+
         PahNbKEc39TfT0ogPoDxbLaryIJk+8HdIZf6BkDCNVyaV+f+rm+pKYd5ueSff6RflvA9
         YXn/uivzeDlUDExcTEO8wC/NXBGj5wOyT1MxnFYvJTFZbHrNDFoELxNXTdyA0vqjgtJZ
         N9XV9w94gwkchHV7YfOBm0LJK7HTbnMh8fbPv8fFtVkayawZ+gZQlFaaIVr4c9LgendK
         JdeAfDoYAv6+zlzIiBzpcYfthAAAV/kneINBhZW6PUxJ9DgHU3DBXR5PHQJK/oRDiV34
         18WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436244; x=1787041044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        b=C8WLEBz7CXPoNEzVO2MEkUCgI7I/o4HvAzkSRMGH1U6t34GUNmvHbDAUl4c9wleTCW
         /0lmJSRnTNtCb64qoICV/YTAJXbIvcqUX2zFb3xgVJhOGh2vzsxCW4dd3+rNZPIHs+T1
         c5FsscP5LDhIFpPmjFAKYq1r/6y6JdALcE4G73+BO8H7ercbPKya1OLHEO12r0TH9EFi
         HYFk4XlzYIOHs2jVxuDbAffVXwhviSxPn0X13t2qzxo0dQ6J71ofyUt6kzeYclXKks/H
         xIVFtXvLyl5h4iBmPnUCyvPtHv3JCuaNfvVOT62peoj09Uoa7srKxRUw6XDt0WXIzdGD
         6gcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436244; x=1787041044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        b=DRvqvVQ8B2g1C4E2VMbCfDDIuXQ12luKZ/a44o7UMY7RusTJ4l5ZJ9qeJth1HZUp1y
         IKjYEbAkIlFhF1okmoo+hKXUEI35rp87cLbFTRQgOgBZPighLGR1qAuFEW/5vhjBmTQ1
         GIaQaPUVrMOoIV93VyGXBkKlbt73ACR5uWJCTOroBhaX79kSi3N/YrYEQcNInrJwHYoW
         OM1vnM8+j+D89QHRDG57Y3I1jdUptuDpGkmZFvMBLXtabe4hup515EQnrKei/9Zj9dnr
         ucazWe/7kiq6KUDf0b4XwkIjSuo1/Mxhf/tymvObGe7txEP/qzp/+mg8RQ/4ICPBtgcO
         5/dQ==
X-Forwarded-Encrypted: i=1; AHgh+RotkDB3M8X9TNM9CbMqNzMMg1AjC9pqsqnhMeguT+1oFA7mbtOs5lJO9Pt/CHXdyniXoVcJtPx3Jx+v@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1B+yRAp1yKxn/q2PPd6YgFHmdJ5DsZ+ZBd8uK8rFUDMRXg6iF
	xLGGzpEvzZrdlLuJ/i/e36uORcqTA7qS0/sykCBB8RIrNFTWvY6a1yG6kYAqUjgVKmwZ5qJKYF3
	jtYRvu5ge+QAEfwdNcEktobaE8yllTAA=
X-Gm-Gg: AR+sD119MXqU5/pDTw/IQFBvzPcvGEUFOm3Nr33jvOJtHnnKE47ZOmdqmrqyApmG7F9
	YqhPVo/MHz1xOWN1YPF2H66a18mQ26BJYNl1Z8uTn1hcdqOz9XcBsBeOqDop4nndCetNiCtQJ3D
	3JX0VK1GRzrwo/vdIPTMB+e/ANxxJ3wMOzefs7uwQHg8UpS2RD8Rha5HvkcBIdIhsInmG/ZLaaw
	fzQwGXafkxsthzO8NkVxbXTGUOjsSqQbCYCaZlEEHCmjtn0MPDjjNHnUBnuZggtDBQXPkaVMsxI
	dhhreWNMahSXd3qcG1cVVm7G2FzbGKhZBu3AHAUDqxcJb9wVUkJ5WXk=
X-Received: by 2002:a17:902:ffcf:b0:2cf:7ea3:7cf1 with SMTP id
 d9443c01a7336-2d31877be01mr17789185ad.5.1786436244086; Tue, 11 Aug 2026
 01:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
 <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com>
 <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org> <CAA+D8AOQ_y7BdR4h+X6qxFygPU6h1iFV0cYXHN4KB370yM2Bkw@mail.gmail.com>
 <3219a2e7-d11b-478e-ad2e-5f1ec2bbdf27@kernel.org>
In-Reply-To: <3219a2e7-d11b-478e-ad2e-5f1ec2bbdf27@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 16:17:02 +0800
X-Gm-Features: AUfX_mx1LX0wZY0j5iDajd7W5oe3f6Rmcs5OiNPXvXt3EbMHLfrVtGbE60ayIAU
Message-ID: <CAA+D8AO1q-n2S3X2d1ZZ_yXxNrHPjCPvrJrPZmTMOYZM9uEGeQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 3:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2026 09:33, Shengjiu Wang wrote:
> >>>>
> >>>> Why mentioning upstream in the first place? Either this change break=
s
> >>>> ABI or not, explain that.
> >>>
> >>> The deprecated 'port' property is retained, so this change is fully b=
ackwards
> >>> compatible and does not break ABI.
> >>
> >> So why? Drop redundant parts.
> >
> > Ok, I will remove the sentence below in the commit message.
> >
> >     No existing upstream DTS file for fsl,imx-asrc uses the previously
> >     documented single 'port' node, so this change does not break any
> >     in-tree device tree.
> >
>
> Honestly, it's redundant, because you are not dropping it. So even if
> DTS was using the port, what would change?
>

Understood. Even if a DTS was using 'port', nothing would change since
'port' is retained.  I will drop the sentence in v4.

Thanks.

Best regards
Shengjiu Wang
