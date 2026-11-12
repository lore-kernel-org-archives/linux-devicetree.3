Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490688;
	b=IgESZ3ouc+O1PAzpA/CdXx8pdDKktIhOpk6xmQFt5Pfaxr3sSe2Ztx2KOGMRUj7B1jH5
	 A+Crfcys1doNdyzExILkoDLCcZt9+WU6v6VhjVuorBaRb4ezmANfnuuR2tW48Qo2ywTgy
	 suLlrvoIRoFgxTeGEhZ5sDCxmLDlPmeTHyXOwWu+A1XTi03TfF0p3MTdJvVDRg2aRefdZ
	 D3u7heOUMisDNvLmMko0dQuIJvPOvAD++nGBiIXfdP7MSdQNb4WugMXDobuqPAXUjWV9a
	 NjC0MFJFl+eox9CIWkAc4ekFx9F+WLOO2EEKGYbLWqOW1vmHvYPG7JGQtbvbDUpUyYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490688;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=4m5/EFtVtJMcX32G0Py/nICnHfPv/lKNQS3VJ6V35d0=;
	b=rnxI4B4Vtt+IS7kyWp7CS7hICcczxDxfZm58YRhW5gBa6AeBJfj3/yovnNsMnH6dwkdd
	 NFyHcMdxWIOEjEJRz6kRxPwG13MHeNJn0S9dyDuI3vsFC29oiTx5obPqwJdPCxdGKlfnD
	 UTjOi3P3tFfHNS0BeWtX/zHDh2Mmj2MRdgv0kPLynadtaTK4mL4A6GDKOZrpqPQFnb6sJ
	 /JZ/j+/1jlrPyPL6RsLZyBPt3dZNuZ+sgu+d1Dq9HTRmZ5EetlKVg2rhaAY4mwZ9f8Jt5
	 7rFo5i/8Z6YgyeF0/1TX18kQnxgvtBDaENRCVz3FR7sseNYJhGhnz8iEg2Cbb+1rcDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA7606A880
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65AA7606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so5718523a12.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490687; x=1795095487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4m5/EFtVtJMcX32G0Py/nICnHfPv/lKNQS3VJ6V35d0=;
        b=pfuhVLsCtkyNmvDQ/DasHL9enTK9lKIx190BAT+LR39JYwTKRHmEqH+sNQoktBXR/w
         qD8aClwVU1z9S66vm6p9QCm2i5if75C0HRq9rwchggp+aWIdB/P57KxlAs1oma7mC9EY
         iBplKIb2aXGBb+C2JbOfVMHcVSsd7fegnerud2jVepNrcxkrvY7FXESW/jKM5nWRm3Bq
         hPMKGXyce4Zdu5ceFvpeiUpFVTdCYaR6g/Y+X9rHqw/09OJAbhC8M64BdvBuRnHHnOlx
         P9ZTOsqHZX1lbpa6x8bKVpuMK6MTpXX010jkikUE0z25yTRCcmM9fLUtb0XZW2g4Vls/
         G5Sg==
X-Forwarded-Encrypted: i=1; AL+hErHQV5/ZAXh1d+uvWY9mi7Omdwu20bqtMtfSV1SfD6YTcx3BU+dEnz6s3mmrka+stqmKdsF0EyTBucqf@vger.kernel.org
X-Gm-Message-State: APuU4Z9F2/eoGAr8nBUP7KdnyAYu04Sqsy6GR0hSaLAkxvPX8uSTKhyS
	sd2wernQG5zKGw5saFTW0fTAEHoJmi7skjfhcXVVXOVOesQEVlophG9DC10AzVqlYsE=
X-Gm-Gg: AYBFou3+NDl8AO5H2IAjQDnEkP1VfNvJ1mFDVa8/a2BaKRmuNWqTqHRsq15UbWKfh/m
	tVBnt4xzBZbC8uQ/PICc5ekDStnrcpzAo1IsS5XDqe3NTKiGZIRwR6FxRaaEZ87FS5RQRyg6268
	NS6kIYdL3eB9AWhVI3WnDhkttmubZPKvSQZrHDdvz3Eg+kJKlCPI/+K2FtbXEssv/4EZzTwwO4x
	SvPuoFvjte3mtcaE9QXamBn12oaNdx4zI1h5x0mGNd8B/LQR59CBMVy0hD7czqFlFsZnlPcalmg
	P5keUzcQP9jpW2hGUyETNMBTPYY0bIw+MwHiVs3bLpPqALY/ZFpp19nsuxODliY2ZxZy/qx87g2
	31oHpT79Lf/9JMN7n3E8LZibQI85QIylTFT5+xVm7EWmojwV98uGJBZV3sWIT8/rXAc7c1LvzcQ
	SO3MFOZX+BOtIJSpBw22je91YlMKb0uK4JH+GsbXaEgqsQFI5EPoxIOjDhLjg//Z3KHtubhEu2b
	AU4S4Tsz4yVmYklsqwNxggf0eRo1zAZPig8yZCMFf89Dt4I2sbQ73ECsDR+AR4m+/IzwpHbUfvz
	HtWc/uH4hYyofObi+WBUDPeuA8hKuC6ilG9EsJN9CJbpYMlAIMHUODmmwi6S5u+19SA=
X-Received: by 2002:a17:907:9485:b0:c50:4b6e:329 with SMTP id a640c23a62f3a-c5066a83df3mr470979266b.15.1794490686458;
        Thu, 12 Nov 2026 05:38:06 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6a409csm347139666b.85.2026.11.12.05.38.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:38:02 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so5729788a12.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:38:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGrU/9vmtqBJUXg9BD4nlTCr0x9pkOhxr2vJGMQtAaEYOXOq4U1jzXi5GSSgIBpJrB7IR+NrxLIVvzY@vger.kernel.org
X-Received: by 2002:a05:6402:1bc1:b0:6b4:5a9c:4e44 with SMTP id
 4fb4d7f45d1cf-6b77770644dmr2967919a12.37.1794490681628; Thu, 12 Nov 2026
 05:38:01 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 14:37:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeX=6DCLv5GZo1UFU2Nn1Y4zGxCMovxyQGefO+JpuZ8w@mail.gmail.com>
X-Gm-Features: AclHuK8Bvm66uPuRAPPxi-MPPvPl-KdDJtyohfMgnqBqTlOChWJE1Vd3ab7DaZs
Message-ID: <CAMuHMdVeX=6DCLv5GZo1UFU2Nn1Y4zGxCMovxyQGefO+JpuZ8w@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] media: rcar-fcp, vsp1: Enable on R-Car X5H
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Phong Hoang <phong.hoang.wz@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:34, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> This series is based on Geert's
> "topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased" branch [0].
> A branch including this series is available here [1].
>
> This series enables the FCPV{B,I,D} and the VSP{B,I,D} blocks on the Renesas
> R-Car X5H SoC.
>
> This has been tested on an Ironhide with the vsp-tests test suite [2].
>
> Full summary:
> /dev/media0 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media1 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media10 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media11 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media12 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media13 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media14 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media15 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media16 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media17 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media18 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media2 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media3 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media4 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media5 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media6 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media7 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media8 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media9 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
>
> The last patch checks the device revision and prints it, which is useful
> for debugging but is unnecessary processing for driver operation so it
> is marked as DNI as well.
>
> In v3, most of the patches have become DNI because they depend on wip
> cpg and mdlc driver work. The non-DNI patches are targets for immediate
> upstreaming though.
>
> In v4, thanks to Geert's new rebased branch, all the clocks and power
> domains that were in DNI limbo have now graduated from DNI status.
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased
> [1] https://git.ideasonboard.com/epaul/linux/src/branch/epaul/v7.4-rc1/x5h/vsp/fcp
> [2] https://git.ideasonboard.com/renesas/vsp-tests/src/branch/epaul/fix
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for the update!

> Changes in v4:
> - Change the clocks in the dt nodes to use SGD1 instead of SGD4. (see
>   patch 1 for details)
> - Removed "clk: renesas: r8a78000: Add clock for FCPV and VSP for SCP FW SDKv4.36"

And it still works without providing these clocks because the fcpv
and vsp2 drivers do not manage clocks, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
