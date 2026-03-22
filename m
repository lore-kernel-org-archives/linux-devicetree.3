Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A57235BDC7
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774187565; cv=none; b=A9+oRFCtP/1PJJhZA7JlSQYS4IbJexcELi+CphHEl7qfLfDGkel80i8pN77genSG9swEqKKZwzmyv4uiIws213+IUAgAzDqB4blhwfEICLDVZMbHaiXI/65jCIOUT5aELbJz09gmrXOjAgFOWgZ3GJV8Zxnpj3zZnLS0PGDwOs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774187565; c=relaxed/simple;
	bh=w+DQX1w7FFlPVsKbazN8qiswzg+87TvbKsY2zMl+ALs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTvoeBYRubE9ufsBl2ekZL7A6CI52Lw6ZjQ8Og0RknNNHY7JU/0jjtLKa+H+Io2E1vvNvjJp4+8PkqLCvvq66GwAB5xJ/I67QXWMi1/vNI9tNU7PSLA82VbwyuN4HuAKbV74HcYCyExtqXIFId70UBk1ymYly9n2ofyiXISoO9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ea73e7b60so2650990d50.3
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 06:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774187563; x=1774792363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+DQX1w7FFlPVsKbazN8qiswzg+87TvbKsY2zMl+ALs=;
        b=jsZzCB4VCFrjSr2NNdvzQzPFJn6r+zxyutRoTAI01ABMFMF9L1awro0FkAAVrJ7Rka
         E5KOOP0dCN6GUC/4CrmlyhqhWi7mdYgBUN6X5FUAeuBM9r0zT3cBS0vuuks8i1/zSE+g
         Z46iGqdzH4TaxcT9JHK4kxlvF+p7A3Q/QVixy/g1htA4CL1BYYqJWrhvct+PpSC9WN0c
         Kz46mkS8hW+8G5wOaQkbWPaelyWu2d71kMqLGJl3FLrG25xIlrFc7IuTOvUQzMcfMt+J
         UplVyqK9QyzSJ28inejGpsr13p2qZQFQ5YDdzcdnnYY2BQkcFVXHzX3+6dOGm9ONkvHV
         ueWA==
X-Forwarded-Encrypted: i=1; AJvYcCUN6x6xM/yIAj1ZXx04yDVg8cJrCmj/NcvT5h0vpJa1wb6jvctvfRHgJ4n9GH7kNmiYtqqbiHTXjsxK@vger.kernel.org
X-Gm-Message-State: AOJu0YzU3WfXqlh/3bL32BPUXho4+r33c2CxZ5N4Tq8ivu+mErRM4ECd
	ftV6vAoorazz+gMaIv6jLToH2FOpavsBASGAjT5hRid0+3rJy8Fv5lOC7DO2HgZZhhU=
X-Gm-Gg: ATEYQzy5UGUoQTFdqEPlaiU2UgIW7wYUbxEzVwVV0NtVM2IsiaEnPxMQVxKR9HvmVfy
	bNHo+AG+OieIN81ZkqLoS/7V5xSarNfJWQ36/Njp/296ZJ2dVKVQxyhO4k0hDkqKpkHYh+Vs79J
	PLSRhP6Ssal/sNODfN69MSM3AcQMnaUAQkWS/eU3lEMS8eyTfgoT5X7b7eEI398XATAFJE6t6yX
	M3ii5E+m8BZ5vE63tS8zdsWRTFvQ2ge4ZiGJzA10juwSaXc9iwOrFMy8doBFM850RLGuYGh4qHB
	J1zU2QUTKT0LNxs7rdeO1dVZeDIKOK/MEPxwbD9fwUgtKtlLcdePHl2tUyPerfQjFTn0Ti0nL8f
	DI7FnRFONXOUpf8KqNDIF3OzLvt0N6++SYtTPCyxfGbnHKaS435vfiSchavq9IKyam/W+fgvl6z
	EA/9cCbShkDDF8hbDp5LuapKHfLq+lHx9GqsXUnN+Z0r+kN+RjNZF6umh9T0wcqOHwKmdmAEfIo
	w7mS5WfAIG27xBkSVTTgL/EKIGzynTEGcPwrksFpw==
X-Received: by 2002:a05:690e:16c1:b0:64e:a737:e1a7 with SMTP id 956f58d0204a3-64eaa79721dmr6918443d50.48.1774187562950;
        Sun, 22 Mar 2026 06:52:42 -0700 (PDT)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com. [74.125.224.48])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabbf8503sm4817349d50.0.2026.03.22.06.52.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 06:52:41 -0700 (PDT)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64e8c7f5082so2960743d50.0
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 06:52:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDtEHWndMwGCGv6H8EbapMNuU5Pj/GfM3mfB6zWn5IVXzkzOeyEuZPopvR30VNmdAZMGV7p0jeuhka@vger.kernel.org
X-Received: by 2002:a05:690e:2557:b0:648:f57b:d07c with SMTP id
 956f58d0204a3-64eaa7a3d25mr6790302d50.50.1774187561442; Sun, 22 Mar 2026
 06:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319190738.151614-1-email@sirat.me> <20260319190738.151614-3-email@sirat.me>
 <8502eb51-53c9-4f1b-92d0-21b06fa4802e@baylibre.com> <CANn+LWJEJJoGQU7p2P2GrOcA_g2x7jEnvjcTJYG1hDRUnRw3UA@mail.gmail.com>
 <b1da32d2-e1f7-4fea-82a7-a40e8073a100@baylibre.com> <20260322110319.7d7558f3@jic23-huawei>
In-Reply-To: <20260322110319.7d7558f3@jic23-huawei>
From: Sirat <email@sirat.me>
Date: Sun, 22 Mar 2026 19:52:30 +0600
X-Gmail-Original-Message-ID: <CANn+LWJwPUiCkz_godEeBvZnXEXzNmCW_-ou=wHL+kjfn0zF_Q@mail.gmail.com>
X-Gm-Features: AaiRm52NweY6HyFIQby7OSMCCfV58Jsxo_o9z1JQPpqAQeFp4LsvOu-yTm0_v6Y
Message-ID: <CANn+LWJwPUiCkz_godEeBvZnXEXzNmCW_-ou=wHL+kjfn0zF_Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] iio: proximity: add driver for ST VL53L1X ToF sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, nuno.sa@analog.com, andy@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2026 at 5:03=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sat, 21 Mar 2026 19:37:58 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > On 3/21/26 5:39 PM, Sirat wrote:
> > > On Sat, Mar 21, 2026 at 11:09=E2=80=AFPM David Lechner <dlechner@bayl=
ibre.com> wrote:
> > >>
> > >> On 3/19/26 2:07 PM, Siratul Islam wrote:
...
> >
> > If you do a buffered read, which stop ranging when it is done,
> > then how can the direct read work after that?
> >
> > Can we just start and stop ranging momentarily for a direct
> > read?
> If the latency is high, then worth considering whether autosuspend
> and runtime pm can help. That way a burst of reads will see low
> latency after the first one but we won't be wasting power when
> no one cares.
>
> J
> >
> > Otherwise, is seems like we would want to have ranging always
> > enabled.
> >
Maybe we should go with continuous ranging then since it's the
vendor-intended behaviour.
Since there is no hardware single-shot mode, by design, I think the
driver should just behave
as the hardware intended.
> >
>
Thanks,
Sirat
