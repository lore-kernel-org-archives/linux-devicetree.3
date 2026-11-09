Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794242353;
	b=yehYvJqA/zl3+t6624C0iGtexFGg1A7RUbJKg/Sl3xSWRFDedgIpDWXZDCpBrLNIvPmu
	 WgER2hZTOCkNc6slz7j88sMWPhfIEjj9o8X3fpBWSVqhsJStjuD1hMmxfu1C9KNGFltKf
	 lpixzkbqIdqOya2vbPd6IrkWlGwgBiTHDGI6wO6HIyfnalE1F7HXdlUrDRtw9CVIe6KyK
	 yiW1SWfdQoCP9RbNYVY6N3PqQutzjBP4vd4V9hi2w/bbc3fuP/r1/RRsHU+OWiOIbNlJU
	 YUXAOT+R9JR+4bNVXYMRjTTfFVwUv78g6qDkL6P5HvUcnkmDD9CzsLCE9S/1/PbGaaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
	b=IetQ3IanPBNMr0w4/B0Wu5qst9EnmdobJUi/hP74zxYGvbl7WqDMG8V9V6LeWQvEXNZu
	 bfO0y7eUjF+8wGfGt1EV9cvRk/5mmefeMlRtHUMasVdDsnV8jwRkLcKKVYK7gLFkBAxtS
	 SFhQe/cuqKjxDAx7fHyNvtY5l8RNHUmdR+K6CizTSU9xBhVtg4rAeYrdkRdlWLiSeG7SI
	 6DWobaDJGKFczEASIPMp6E1UwVS3fm+yyPhNf9epZ2GzJv3ZGWnPjPkYaFyp8h4y6Spts
	 Fc2AlRhexvDVTWPBFMaBQHxxZk5Jo50iKqunmebuPElDULo0X/S1a+d9QtOQ3WX3k6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9ccdv3k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C958606A333
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C958606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9ccdv3k
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-54492d8a988so268821cf.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794242352; cv=none;
        d=google.com; s=arc-20260327;
        b=sMP3L7/L1K2ZIhCI+T9ywh40h2Yzsr6f9pE0nAEk01ldefFMb+2jEQwQoIn2NDY199
         roZaXf6vpRF1KrQD/P0jNvCbsivcpFCL/Ny07SLI3B1joQPfdGcLUMr2D9oimArkoFAT
         auVVyfdZYiVvcrkEJl8J1lBi9NwDcybJO435HZmI5e2fddC8FWfIWyDRZAO2s8wLuHI7
         GOqczhFYl9DD2L0V7Ua7nOmhpIQz5BKFvwqsZJxa582e9PbYkgf3kZ0+bci07E+p1gDo
         zD5KVKIfqCDGtOJZPaMBZ8OfYOVCZJEDLD2BH1khlsNvhLMqO7mXeVvXGJHQTuSHA6LE
         thwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        fh=Y5HauLYqf/P3mnOg3lvTtPYNi+7iJNTquXAYxR7ZIis=;
        b=YdLhksZ8j4jV+wBcscFSKS0dhNmPFVQ6Ftg0VYi7+lK3BMsqCouflMo0hOANn5dS5L
         VioAIcFzTnvwUff4j5HDlwS7AKa/K5QwZuoL13z4v7j/lPQ+C2LAZWpW+mkvqzbOcdPs
         uTKQWHdLe0EgiiPSU/2Q1qbkZmusVP8luySmfvMkQnoFjXysJyuHLafiWCark8zW57Ck
         K8DnatJ1HCdJ9S5S6DQnP5a5RJdxQa2jXNSXsMMRG//QDzyAEYvPvD1GDmK0+bOEwa6G
         zsmh1JpvQpMiAOpKH0WM435bhP3HULdcYjz1hmzGVmhent8cvvgDm69CfbdKhy5JUP0l
         Gafg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794242352; x=1794847152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        b=V9ccdv3kK/Lbx1Ki9SfCLupe5m4AB1kXkJnwHDXcTbTB5eivVr+DgayWNH46vmTbE3
         LAgIu6SrTtf0DK7WuYphsLXwxG8xDvpU0IdExkaAamByNth8mgXQjBnM00XZ0Dqh0YwJ
         nZtHi5UCl5R7zeQ8Igx4eFdV2oDs79h5bGJ5jtWwHM/Cn5uHcM348DGk3jx4pThKU2aU
         34NqNj7plitjbus8/7MEN87B4ZriRW6jvASOnR0aHKjYhUU5xT5XvubDw4KSVDMSRoMm
         c0bFTl06PloYMgngbUCB1SkXbW+lMUA+0O1Py2U5aEDtJ91AdWbnINpbE32ryrhk5GOo
         fbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242352; x=1794847152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        b=D7uJyFaS3qCUxeGuHrygCooe6WcVJChq4RWjwewtuYrsSEqO2H+zkeiecGf0+ZZoS6
         RuE6Z6jrJiphfkoLKxRMmUikBJxMoQqu9FnZ48zkEYEpl4hyp0P31sGyXq3aW/ppr3fb
         FULt/LqH7v1K/O+yCVrX9Mz4OlC2yXOpByMn+kDIxK8sOC+gmhKc288t21Uq0w59f7Lt
         bZ6DBhm2BK7xxa+PBjv89IsyZ0njQ+aU3twazHGLB9Wij1mWTAjiYdv2+7jBYpXd3ovM
         HuiRkq8wqeBRDncsk9y6aKXIC2j/X5WLOKhHwotmaFf64A8/HTNRj/d/G3+TTFyVDb+N
         hqdQ==
X-Forwarded-Encrypted: i=1; AL+hErG1Gk5ys3hn3d1tGUKPTK0+bOc+wTibvIfEiK5j16rVVVhDh4xARxR0spEk929wFq+rCZY1hUGztL6j@vger.kernel.org
X-Gm-Message-State: APuU4Z/a+7DYy02N14Dcw9u9n9D0Mi0kVQM20kd/cYGAA7+0AGkJEGqG
	TPF/b3DI8Rk96K/AsyiJLGDIaUpzHu3600u9yW3EsVdZK8ZIlH/+x7Okckh5zWkaK+hLq+tHtQv
	dw6MSWvMM1hUoHAipwX8Kr50xczedmgLRVhOQPHtg
X-Gm-Gg: AYBFou2U4+1IBBehZkco+cvbPQxGGnhI2TiNr9hUpWZHtNQ7diN3kbHrMdToD6PBLi/
	R5+2rMIuPi7WW5VO780GV269bRJzV6sx9edPzQWdVjRfRVH3/EXFMJK/zXmL5sl772PjoXDtaZV
	DRjRyokf8i+iv1pw5PIxqUndaGsmT0v5q6pWssaNFsnmKPXruV0yLJZ87LKptT2N/6gGXPhyVvR
	935s3Uc89MQsRMimskXjw4HaopF2DRl574C6kP+14uwU+1otSl4BErd0bHrQeq35wH2QZQ28MAr
	9YJ7l4/vlsC+0ktN/B/GtQXQ2wrO0mN3DmXMuprp6OBq57+NDBy+FOGJgwDK6sbmTF9AIPjnyXr
	hv/L/UIRgLyLf4ppUjLG1H8ABWZ5Uo0LynmejAEqV/T7fFTivHGjHz32fuhrkrEa3qvk=
X-Received: by 2002:a05:622a:2b4b:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-55519d553afmr66891cf.10.1794242351337; Mon, 09 Nov 2026
 08:39:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109080126.417161-1-irogers@google.com> <20261109080126.417161-2-irogers@google.com>
 <179423587020.3133545.6594248101575070050.robh@kernel.org>
In-Reply-To: <179423587020.3133545.6594248101575070050.robh@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 08:38:59 -0800
X-Gm-Features: AclHuK8feNx1zDrXSRA0wP-1jAG_C3k6aMQ0LXM4MGvjXYCUb91zzoIWLHYo0TA
Message-ID: <CAP-5=fVDVds_q7NjAcapJw4pUx2psF2c9AsaKZC7nJbcOHOJ-A@mail.gmail.com>
Subject: Re: [PATCH v19 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI
 PMU definition
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Rutland <mark.rutland@arm.com>, 
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:51=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Mon, 09 Nov 2026 00:01:24 -0800, Ian Rogers wrote:
> > Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
> > found on BCM2835, BCM2711, and BCM2712 SoCs.
> >
> > The hardware exposes two MMIO register blocks: the primary monitor
> > evaluates the System fabric and the secondary monitor evaluates the
> > VideoCore VPU fabric.
> >
> > Co-developed-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 +++
> >  2 files changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835=
-axiperf.yaml
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks Rob, and I appreciate the testing.

Ian
