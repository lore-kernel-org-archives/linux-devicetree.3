Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B591990C7
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556241; cv=none; b=OzKrHW69A9KftpbOYBy44RodJVA1Q3VmSFwVF7p0UXrNwqjlQYfN2YpjgCfCR8p+MoxsSIUeGzFgLwO44AjnaaWEEsZFcshTigwgxM2jFl5LJIN2dY1w0lynUM7PdFEQM8VJycx6j3mcYg+UxaAr6gaV3zm54Ax7OdSN35uINKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556241; c=relaxed/simple;
	bh=7cAYYs7QCMaFSHUfhOXAYKr+4Ut6/0VfAcoLh4hkqJI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=kZq9J6CSMD1UQFytUoi9A8dGqxlw+vyD5zGfyMW+ty11Kho870iADjQ1YO2K9FEaYKy3Rsn+jWQTK5HPCISSh2lXFhqoeSFHHUsnILIbG+QgxAXqvaVbxU2SfL+wmuY722gZApzndMVraVYe81rQXHogVq8T0KCMSXOwaLDkgb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YFDaF5tC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YFDaF5tC"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso499790366b.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787556237; x=1788161037; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7cAYYs7QCMaFSHUfhOXAYKr+4Ut6/0VfAcoLh4hkqJI=;
        b=YFDaF5tCK+oyzgX7nHwffXR0KZdmtW4dT38gIPGO26TpNqAElXJWFuV8vz5sUzY2zA
         njABMqCdQTZ82KwpCX0ZHO0+4al8POtlrwy+ahkLScEWKSZvtc89iz9ocbJaIHzwUwQa
         tEEgFyBX8+c64oBcer8wGRFnJtdc8yDypCp4X6Mn4hpbBrx13TS7yIL0RNZawPsH6qK9
         xJyBj0AlWH5bX/CdHq1+1okcxohRbOMnUEkTIQvHFxilYynF7j1wYZj0LeTFtdhaw/zK
         uq2R6v3qwlBQfErAd+G2d82E79Ajh5O64DADEJu2/5wOH58vkY4Rqsx8OaiesbVGPItO
         y/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556237; x=1788161037;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cAYYs7QCMaFSHUfhOXAYKr+4Ut6/0VfAcoLh4hkqJI=;
        b=KADru13npQuMpiMqOAygIF75Gy/MtLWdTskWVAxtUGuk0gmpY5XWl+Ns9THboVbWMJ
         yJA/PWjFICzncBwo/6NN7iH+FVgoNvMwqbWUHTISHnbrrqwGCQQ70UASVjPqQGX2kJ+u
         ku7VT2oPhfEQFP7XVlEwaER8gPfbeBgVz+3xnDyZvrffZSx7KZcmt0CFAEGUrgfsJZbH
         u2QgIU04MoXVfMrdqV6Cvv0sf1EPl3FJoWuUUaIG+mCMpv5v9eg4a3qWLUAsn9yfms/a
         wm/4MNJ1oCjno83sDNg79xlNxBAnJgxrmbMKjNsjraiHbrwneLAdeTcFJoiQAsa9XKem
         IqqQ==
X-Gm-Message-State: AFuF++nPeGq7CAJxxUO04RzI8qWU8hHAqUFh5EsDNHIbqRu1fbrZ5IQ3
	7v5DdlDpunchbETiIPVxCqUqpaODyT+DfjR8uVgXKnF+yjiSDO0p2cMXiJuffLknAOQ=
X-Gm-Gg: AR+sD13WaS1zk/WOoI6ksz+HrxTe27RVT902Fohl28E3x3A8DammmzddCd2u1ZPwsjt
	xscjnSthIVO9h8xBtcuicynWwXPRmkE7ogQJ2PjZTIozq91ecD6Rz0pwB/Ai1mbVVwNpHIZLK79
	NUvRXCikYa3gkekZtKaA+uv0DrbB1YT70WySNfEKA5sw+KaVk8nzm15lKDhu4m52pnPAIAsZ8KP
	ay5UDlNbC/u07+cJmW2/NbNjIuu1aWGgS03siFogHM/8126aBpU0cCSdMTtzcq309jUwH0YcymZ
	BiKfGzB+VUs7+gHt/hljHMH7RseQNdjTmKWMAX1jNFU8AjDeaP06uXvFtGHkMMIBX9HkXAeGHdL
	m5EixIYG37SJYhaVlkAcMAHJDDZMEq1pyT1KK3t03w2FLKAozsRSVFleLsAOIFmDK4aMi3fvE8Q
	hPIT1Km7c7Yj4B+2DTmKtQN2x+D/U/UFcWX5vuZIuyvz0B2oMre+OjX9MlMh4anT3xpFH7+yvDW
	NT1VOCtOxxmM0pLzk/WM8HErXTcrie7cW6CH15pn1flyQ6+oZRffBbA
X-Received: by 2002:a17:907:3d0a:b0:c20:83b1:396c with SMTP id a640c23a62f3a-c246a62b68fmr2605606366b.17.1787556237186;
        Mon, 24 Aug 2026 00:23:57 -0700 (PDT)
Received: from localhost (host-212-171-227-71.pool212171.interbusiness.it. [212.171.227.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199767sm7243944a12.15.2026.08.24.00.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 09:23:55 +0200
Message-Id: <DKWZSTY0TTBK.HRRXYTZ4CBWF@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: add boot
 phase tags
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "David Lechner"
 <dlechner@baylibre.com>, "Julien Stephan" <jstephan@baylibre.com>
To: "Carlo Caione" <ccaione@baylibre.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino@collabora.com>
X-Mailer: aerc 0.22.0
References: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
In-Reply-To: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>

On Thu Jul 30, 2026 at 10:04 AM CEST, Carlo Caione wrote:
> U-Boot SPL runs after the platform DDR loader has initialized DRAM on
> the Genio 510 and Genio 700 EVKs. It needs the debug UART and eMMC
> controller, together with their clock, syscon, pinctrl, interrupt and
> watchdog providers, to load the firmware FIT.
>
> Mark the nodes consumed by the current SPL configuration with
> 'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
> information and bootloaders do not need local overrides.

Gentle ping on this.

Cheers,

--
Carlo Caione
