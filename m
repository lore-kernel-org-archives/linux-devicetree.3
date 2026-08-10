Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0DE3FE35C
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373139; cv=none; b=R7z6kKeJa5GXAowTbqK8Pt/SBLxhZMkEgZ8X3Zc14Wcz88UMMvwN29vGzHVA8R651aQEj9BTNnam21Q3LrdGX7CIfy8SuhVXgaYBkQF4gLRsRMLTszml4UVs0NxOqGr0qj8vwe6ssyhv4z28xtKwJYuWq9w9AAP973Iqzs4UTjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373139; c=relaxed/simple;
	bh=Bnwp9jqVKIAfs/y0mpNAldN8/vl6K6VBqOAFBG6md/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uldAe+lmaIKkNsrRHY/Nu0G2Q+2U9qcQwdTY3Ld1XG6kvYdPqIEibCIYfztFOiQVlGqAJTEYE1W1tamjHGWDp4vuPajNkLbXotN4i8QLF1XUc5ifeLitaAW2TRqGEaaEv5Vt+J7xUOQMfkCMtOft/gNge+7DaULUST3VVU+3m7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso1047804e0c.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373137; x=1786977937;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/J6pjqX1tkN7ol9r0yPzfB+nnpzebdTRaebsQQSoZo=;
        b=jp8uceFpQvSqc1XsuiaDmMZfBY8xPzIXqZo2QusKpKn5Tw0+U4MDeDgRQ74bUXyF6J
         d/uHT21OTzf+qz1EvDiXfboibYxM8j3ZXqjM63kIQ5eh2CAd8kIzD4MKq4k2TBHiw3CB
         mqyWy62MJwU1ClXB2olVufmtYuNWabTOK0I+oDX4zwj2IdOz0sKd+Cq3TWmd78Ul8lOs
         +VHZzCXSghnWKXD/rYY3OUaf8jqCDa2aIpGU/zevol9W3Ysr6HRAxjwrDBNzUuqOpP6e
         xW4Hh1jvt/5kZF9dcKd3GVvxz3YIwP5udD8wVuDdz03EiQGLFLB8enqZasjJVAHQ/q94
         NtfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeHugFDVK1c0QeKdwcRvviigUhrj4isbl0rhzhve49JeEZNob/aS5njeU+wXee2Xaw4CM4JMUBDcfd@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEL739qLsnPqEbtxeYEtavI3cp9ikOp8AB7/l+9uaGH2yR1pT
	WeR9WTmFczFS1O/TzkOVTkuIQXid0ImXFi9/Y0uCXEi1BYk1FYEfCuUkBZmUiWC+
X-Gm-Gg: AR+sD12MxVLD1Uc8ETnQcHV3ncLpUtPZ7K9X6Od4qP7Q8VOYH+ZRw94Oey49s+LMgzi
	3L4vFPmrJOutjeoqL6mvaGOPOW1IsxoMgzh/e3S3ZNgV32Oxeg2OHuKQo5Bg7MhnWzrUA9iA9lQ
	7fOoUAPrQfcWei7WCZGBx2DPZqgCayNCT9FQriECp4jyUjV4/TdoPPwmxG+hk2B+oRB26UQQe7D
	ZtTDpZy99R1sy57dhC5yz/XC1XFQPp3kE9oWjOSHZQXW+vREouuLssvOoqtDrlCN1oBV9BJwxKM
	DQckFp4hQed9o7EcuPWmPD3iDFCB/zQmeiQPQuvMnbweVR+aeYTGzVDea1ftNTJjXZch8kllh4c
	X2QiMYbzEWfvJdLh0sV7O/ftCJpCl8AIEJ4V1sHdNKVmVKrAiNhHHGqzPCKCEN10WJpWoE3f99B
	ypEWivxziBMXyVajiIOPrqNcRbVCy3onjyRzOpL10UAfETUorWRvVqejDoEVNGmDWZIXfLioYj0
	n5/5prUSVRzuC6l5zqLee/UpVjggA==
X-Received: by 2002:a05:6122:4085:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c4112ef01dmr2615714e0c.1.1786373137278;
        Mon, 10 Aug 2026 07:45:37 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40ac786eesm4458596e0c.0.2026.08.10.07.45.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:45:36 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bf9466412fso1634281e0c.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:45:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoVdaNFZkntaT7QPAnnkVIfFHfSvyR3dJwIv9pEuZPHLFNDBdR+F6zcsu7Yy/bd3OqIwkdp35Ib505j@vger.kernel.org
X-Received: by 2002:a05:6102:1490:b0:650:94b2:b209 with SMTP id
 ada2fe7eead31-764e5a4e354mr5957977137.4.1786373135792; Mon, 10 Aug 2026
 07:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org> <20260714130515.11262-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130515.11262-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:45:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZcy_kA-R=bjdDJQmPp--=NMuyaJB7NV-+uZ=zyFZ30Q@mail.gmail.com>
X-Gm-Features: AUfX_mzpflf907Mv9hDTB-ODXObAaiTjsgKM8flRS-o-ZchQdmzFsvncjRXxvD0
Message-ID: <CAMuHMdVZcy_kA-R=bjdDJQmPp--=NMuyaJB7NV-+uZ=zyFZ30Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: hihope-rzg2-ex: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The RTL8211E reference manual [1] page 38 chapter 7.16. PHY Reset
> (Hardware Reset) states that the PHYRSTB pin must be asserted low
> for at least 10ms (Tgap in Figure 10) and the system must wait at
> minimum 30ms (for internal circuits settle time) before accessing
> the PHY registers. Use 15ms and 35ms respectively to provide some
> additional margin.
>
> [1] https://files.pine64.org/doc/datasheet/pine64/rtl8211e%28g%29-vb%28vl%29-cg_datasheet_1.6.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
