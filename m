Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CB139EF0A
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053575; cv=pass; b=C1aS1/6YNjlHcpQTARTU/CRgm3D7Ylk+3dvkSi13onwd8cQFv1ESf+L/7oBw8BBU5EogS6VfLN2VdgM2RzHQ382BWeoeE4GWLuVx7n87vgveWU2ZnZ3jG4+CcPtODc+Rl0Hyd28UWj4vTETUMJVjOQdqhSZ0fGL0dI8ZUqclPLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053575; c=relaxed/simple;
	bh=tvpbU9b8C3/MLm7HMvw//xPuetOAEHclZO0FvFBk8L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AjfC3UVGFxoxPAjFf5GGYmqxRopT2g5+Pd2IemMM8qY1cB5mFJKSo1qIIvMfjEf2k/SC5s07KGPwzA9OCBJTrSUGJrjOzuYXu91NsEWTyN6DWeTtera3RwERtRk9ya4ioLNiLqgbjXbbpaFPd9xNmKkeTGzUFR2lwKnKj7SvzgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVdlCR+2; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVdlCR+2"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8201447e8cdso78951157b3.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 04:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787053573; cv=none;
        d=google.com; s=arc-20260327;
        b=fDIfhdbsbWMVDmkISPSf3SiMcons6a/Zq52xcYRVJffiM2TSzJgDXx0dwjkDYA7rTt
         9KwIVvvrTse+25LQQ+jQvOahXlSsOZEmrlchREU+dZv1AgAk60Ng4PhtTdlO2t241Zr6
         F131e4pHBuf6TxNFlFnSRtsAS/U/04NKtTtIMRiWALfKTFGVQzOpeXHA2QjG14QcfZhh
         3P9/5XcSN/tX6LM1GuR98EMsUSiCqibBL0ClQt+yC9TnKzVDJzVdQ1ZHtGN4t1On9IHG
         5ofRMXYh27WFknG3vUQfMu6ugJUMzRMPRu3LHyKVEEJ83Aq89v8IBHyuTXQt9EuGSVow
         vkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hpxp/zN/k3pa4zTW7PgrgIqgWRxXynXakWrls+B4H2A=;
        fh=sUJ8gdZWLU/jOkk6aUdz1aL23OrOWljW83j53I6cl3w=;
        b=aYoIR9USusqi+27guCVuKOnDT3e0Jn197k8WqAYcrXPXCDTFr8O+aZliPyRCe6s6w3
         pq9DSr4nW4Q9CSSvrkObPfSKKA0MyY4I3ob/ubsgRAMl1U7RhiOV6phcMHAMn86SeUBO
         eF609rTR7XkFK39KELPLxL4ZEw00HPFH8DN2T8VjqWbsX3cEuJ/zgWikl/J0bPSQDw7B
         fV4nyHWVRYs2q/HjxKhq/3wUnwwT38tUwwsBlpJHiPdTtBDYzspyoqPWMr0OVSU3Fnxb
         ehB7Bx6U13XIiVc/V3B4rR4hT1F6bMNktYdt4HwnKSn/Zu+0HKMe9z9xA62/QrtfszUu
         Nfcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787053573; x=1787658373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hpxp/zN/k3pa4zTW7PgrgIqgWRxXynXakWrls+B4H2A=;
        b=nVdlCR+2Q/9sqO4xn4iW38tVxPSTyoaORkacC1ju7Oj+4EFADCSSW+sYLpX1XbHWwb
         1V4W9Z8QOWKYonAxiRCe4FC2xhG3nAOO5e4l17PoZENwnxc3ChEEFZNxBmpKZF2VRXgX
         ThXLiFT3bt2l2x01dvoK9HNJOCn+xnmXqHsgj/g6iyciI+rsoyq+UQ8nvr/Y42Ck+IK4
         9q+cDmzK8PVd2ZMKQmc0UtT6Lpq7WtgTZnKM0lRJm6R3vemyufkpj3YwYn9dZURn7ZBF
         NML4nL4/ahwI53a0iG/ow0kHQcqTuTum9snzX8OclJFUQhr2gVnBQhk7rAiAyhNGRyGA
         16+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053573; x=1787658373;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpxp/zN/k3pa4zTW7PgrgIqgWRxXynXakWrls+B4H2A=;
        b=ANBc/qkGO5dPp/o8+MoehL6G6YfxzFh755c+dGRezm3tpOEryura+5cCQJZXDZZM3O
         pgbSsfgrmCVtCW/uyROtco5O+FHqxStxILL0jZzUNNKlrQMC2hoWpxuwkT1nQqkbfpMl
         jhj49cLP+dMQdfL/oTMAU9Nsi5cqm8V6f1Pc2uEdEfgvt5V1vkNZwgq76NRhWDIRKM6z
         OknpOErs5ckFfyw63D3vEyep2p8oZhoR0cYwmILmk4428a6tiaLNLhB2yAhvKm4ih9cM
         x64+4B33osf1rcOdvj3vc0Hcy5hDWmyCQ8fAskXLzIswXxBeIv9GCt6lwrJMKX24xuuR
         Gimw==
X-Forwarded-Encrypted: i=1; AHgh+RrF7ct5wksb1zibK2u+RBuunre9DSl/bcRFA/AuuHeieD7zibhXruT/SIv20G5nuLy1vvgy8xYOHQDH@vger.kernel.org
X-Gm-Message-State: AOJu0YwrS13Skzc4a5Ui38s2rX0QBLNY7J8Y8PSOhog86mlcHAO2ypr2
	3iyFfTZ+uBg8NVTtkeejT4gDxqXs2WbzYQqDN6fvyBeRCfumufKsCiffNvqtMUhWuIFSnfBTJyT
	NDZ6XIsdP06Z3iY70x+7BTNEZAMonvFQ=
X-Gm-Gg: AR+sD12HZ4nzFAVg3Xf2nCvNJnG1oagkB6YRiMdpGxZAFwhp3zWMi8EucBqYjnVOL2Y
	DsGOQXQc1FR/8j4CekeHGHJ0ofGUImDCEuOt3UEw0rsrtRjwhKIcaPkLQt8j8zRb6y4NIotD9E4
	2dNHehX0RAXPM4/qgCQWjMP+DSPwhYAp8O1t0oIeim997ICdNd6lCbAbMUSNee3FwfC/uWvcML8
	rKzWHRIkymZjjidtml0fHIGNAcTHPdzt2Rz4OEAM2nfxuftKf1z83eVXEqOD1uUwUkCF944d0eu
	ORWTrYynHR+ZdEwqcZbwdIik9uglpILFmt0NStdAPYTC3p7VrORPZrK83IzAzu2XETB7Qo6VN3J
	J0ABnvABIP5rt3xbbvW91fCVZLQ44RSSMjZJzL+zbORmftMVR6BHLZv8nkZtZfXrEXx4bN6NIqP
	nWVJfLQ/+y
X-Received: by 2002:a05:690c:9991:b0:81f:d505:8ea4 with SMTP id
 00721157ae682-83712da9d13mr124393587b3.18.1787053572846; Tue, 18 Aug 2026
 04:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812132755.32585-1-zajec5@gmail.com>
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 18 Aug 2026 13:46:01 +0200
X-Gm-Features: AcwNN1VKHMPAdBOZimFFX4MmmZLiUZP40Jjbh2uMpcUo_B2LLCgJ0plyHTDZ4p8
Message-ID: <CAOiHx=ne6o8j2jLWB_R57z_9KFwF=ZMw-2JVWDn6QNYs3CTyag@mail.gmail.com>
Subject: Re: [PATCH V3 1/4 net] net: dsa: b53: deal with Northstar devices
 using CPU port 5 or 7
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	netdev@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Semih Baskan <strst.gs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 12, 2026 at 3:28=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Northstar devices have 3 CPU ports. Ports 5 and 7 may be used but have
> their limitations. Warn user when CPU port 8 isn't used and add EAP
> setup workaround to avoid non-functional standalone ports.
>
> Fixes: 4227ea91e265 ("net: dsa: b53: prevent standalone from trying to fo=
rward to other ports")
> Cc: Semih Baskan <strst.gs@gmail.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Tested-by: Semih Baskan <strst.gs@gmail.com>
> ---
> This fixes a regression so it's a net.git material
>
> V2: Print warning on switch setup instead of on actual EAP mode change
> V3: Proper subject prefix & shorter comments (long one comes with 2/2)
>
>  drivers/net/dsa/b53/b53_common.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index 3f5b9592794d..5fd8362d0430 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -332,6 +332,14 @@ static void b53_set_eap_mode(struct b53_device *dev,=
 int port, int mode)
>  {
>         u64 eap_conf;
>
> +       /*
> +        * On Northstar setting EAP_MODE_SIMPLIFIED with CPU port 5/7 bre=
aks

This isn't just northstar, this is any dual IMP capable switch

> +        * standalone ports, see:
> +        * https://lore.kernel.org/netdev/ce4d9b7b-aaf6-4796-94fb-8c3d6a1=
dcd4d@gmail.com/
> +        */
> +       if (is5301x(dev) && !dsa_is_cpu_port(dev->ds, B53_CPU_PORT))
> +               return;

This should be moved below the 5325/5365 check and just
!dsa_is_cpu_port(dev->ds, B53_CPU_PORT))

> +
>         if (is5325(dev) || is5365(dev) || dev->chip_id =3D=3D BCM5389_DEV=
ICE_ID)
>                 return;
>
> @@ -1281,6 +1289,10 @@ static int b53_setup(struct dsa_switch *ds)
>         u16 pvid;
>         int ret;
>
> +       /* Discourage users from using port 5 or 7 due to limited feature=
s */
> +       if (is5301x(dev) && !dsa_is_cpu_port(dev->ds, B53_CPU_PORT))

This should be

if (!is5325(dev) && !is5365(dev) && !dsa_is_cpu_port(dev->ds, B53_CPU_PORT)=
)

dual IMP mode is also supported by external switches (e.g. bcm53115
and bcm53125), and if for some reason someone would try to use port 5
only on these you will have the same issues.

> +               dev_warn(dev->dev, "switch to CPU port 8 to use all switc=
h features\n");

I think this warning is too mild; it should be something like

"Using port 5 or 7 as CPU port is not a valid configuration and will
prevent the switch from working properly..\n"

Best regards,
Jonas
