Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794776985;
	b=ZiJXuDVu9dUp/phKAyL6YIY3K48nw++KdoTvKtn5rDqc1JJClE506JpBfXrOLdw091pD
	 DIlRhQLNLMGrQ0VWAKGa9/VIqGDu2z5LmZpoJjOfr4QI2SWl5tO3BugFS5HC+RZlynHLl
	 q1GLHpCAL4C22OGBPoEGl+gUOn2DopVuwAdPp7kIvkWcG5f5H3QbDrgTppsn3Ern7MThI
	 bGI3/isE0plT5ACOtiioSX5PvENcJH7O76LOOb6YFnarR1MIDA7cf8K2Xz0GBOwLIsRx+
	 voydWolIiuX1tMHH6EJkqREwux52RxP4P4yKF0PKZsZCtZ1nOJFSFegxst4AWD9TqZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
	b=Xmz7EmFvkUOiq02HQFyyonWRsMQJ7Cgb8OwMopSSZ53npb+ohj8454IIYGSFbAjM+Fhc
	 AqXalMlwb8Q5YO17F6didzZevmgCydGaXggH76lJ3gIA0XKe9folaDH/pCr7jcBXR11wY
	 ZemgusTOvmPBuNvMlePmb01GeaF2gEtrqCJJ0YYb2wKf1Aecw20zJheUIXE3Cm71hNRQf
	 Gga+WF/Pp3urzqVJ+FI6TYVrwmobA9pvqcIiJjdnrZuZDncsbO0C76lAg0hO1UIFYKyuC
	 ntmpL/ZUt7mOQ6X215j+UPbvIdB4doe5lzCf+bZCtbGCcTImxWIRJRfqrTvRxj7fiJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Sl1nvHNh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BEC606A32F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27BEC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Sl1nvHNh
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679a2b5fe87so2747781d50.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776984; cv=none;
        d=google.com; s=arc-20260327;
        b=j6y3cmX645Hf5cjgNkde5QoS7297KD0RSvsVIHq9s7hC1FAJXOFtExbvNKM22rLPI0
         Rfg5lTUjTMzspcIR6Gnt27UHAFqtpf6EukaRK9SNRGHs647be1lgOWJxYomBmP3dvyVr
         nEzZBqC76KvlkGtKe6FwveYhg3o6BnHbtF9PJY6JUOuVQC2FaXlPR3kYKuXX+GWfSrF/
         KqtJgKv9RuNiJ3qXLaQPWEhZPSfeE5t8dkBfM2OYbUZDMboCWR+Os1VngDSI+uW9huBz
         zz4vPhLHiBUWHje6zVPNm59QL3r39zd5uXsL0bmLhcfXazyvYpjundNM+wsyWK/6m8O5
         iDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        fh=jDbg+fGczCrVESDzeAnruTcL/u1BHB9Dg7mlMHaoWu8=;
        b=jx7vbfqutXOmajO+24HwzDdwkIGHuxq9/JpnOJXD6cBMssXLkkyqdjXYTn4MXc+DVT
         cQ0nnRfTunQhCouD4vOHQLMYq1iTtERU/IwZr7tavJZj0zvYL7bVps0nnMmZdD/k115c
         QCZJmr72XXp8dQ/FwSz9PREDf8t7EFdTsiaNGo4vZXNCPHab2Bm+uA3StpVGSc00JEUz
         AQfXDtVGo1asv8RYv9iGZNtA2G6MKhvcXi7dR5s9VJAC2TBdRHiRHSbHoHQ/HEDSd4Qr
         J9NbW/h03dW1IDcq0mbAOQW+qxoJYYxMheOlZDhgoW/0IJ2lJANosguZT1L5IzdHThuE
         P5tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776984; x=1795381784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        b=Sl1nvHNhKhAgdXV6eF9snxogwmW2KEFXEoeKXPziOPzyezDqEnjQx3TE0b28sh+Z/V
         +zUtEMZXBWIL+bImfjhwOY9EzABl/+THfCGwt+VpR5XQUeu7sb/uXXCDApnXxXDNYRfE
         vBQabVx/xnF0cJVgfBj3S9VV363Q2JmfNtzSPwpluFN19sm79WgEjt9AuobRARUTinxq
         Iuf78MgXoV0suIFS5xhpesJFOkoQUuABV+Tjhn9yI3IIf4Npj0G7kIhlSSbGzw/vyOrD
         gC8gzgQhjpgPTpNqfKRM4yz2Oq9/mGxGcRdndxlJwq9y48BmGcPAJzXkgPymQdDGb80K
         s0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776984; x=1795381784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        b=QUCHQzHTd2tEUZUxiTiuZUuK/EMK1zOprq4EoSKC6lHD5z7pg644qNMpJrH7uLc1qK
         3Y4tnBbaYEx3fIGpD7ZZugnprGCdVqylfEu3CxncaGo2AAgnf8c87uG94CpVUFtHBj5n
         /vmX5wQxAi8UlPxYipoYfV/Lnbv6T21WGNmXap64JNbBvdDVitmc4svZ8TLrJtIw7sEB
         ZkyvXX/c3N7Vm4auSX3ugn56iIQmX4jT4b6XudZ1FekwJMKNYgOMV+eUMMFM/1k6EogP
         jnKe0xEWZ+G60XqdP3hY8YGWORu5tHx8MRJKpkzTGg6iCNwMnsz0OIpfmkmKFXcexkSQ
         oUnA==
X-Forwarded-Encrypted: i=1; AL+hErGrnfAQaX9W+whLNeH9w+G4fIlOyY51XQUcv6SeW/WiCiag2EUF1upIHCHU0DdhBVE36f/9qSlu607i@vger.kernel.org
X-Gm-Message-State: APuU4Z8IXZ5GgqZ0C1WpAKstG6RQVGnpeY3JB7GdT0FQ6s3IwtyVvdh3
	1Th2cVK8Gwdq56S5SgWmaf+ceGYN/io1s2fHVi7QmvoSOWBHCP7qX8EP6N39V+ClrU5Ear+RCyv
	GZU3yxNa/ZrOKkoaTIPCPUgNWKL5k8eo=
X-Gm-Gg: AYBFou1yX+yPoF8dpeAKYgIXYr19pJmrKO1rFhACdb4PzNjqV/VVHrjBoAuOqBct7nV
	kJb3Ezr6692MzcMY/zFurpDo/ap8Y09RARcAXp01mn6FSGliYhb5WkbFFjrU96jyhGIA/6o61yl
	ZRSCe6D8RQDs/zBup05PhTbAf86a8jmh9WfZThI/TaQoODVYPN/NN9UDEtPQ/2zNAY3PDNAUaSp
	u+eFjjNgENRRO5jLtEezQhERdNxJDNGm8oDcAPI6wUC82piptUYzHpuseBxfYBanX/UEMlAHMgM
	YTTUQHwpO6Iy1RitACLPyIJnobc8Zq7hY/+abBe5HCQ3ebjlVJ89scV9lNqxuLfUFOlW1kQcCfa
	b1ZyEE/i98TCe2BgFX/FswXzfoNoaBVZKrzO21nwNIBgVEgKdW7ACd5VlKe2FExsEdWwjPw==
X-Received: by 2002:a53:ac9a:0:b0:67c:cd5:f5aa with SMTP id
 956f58d0204a3-67d89731e46mr4496105d50.122.1794776984233; Sun, 15 Nov 2026
 13:09:44 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:09:33 +0100
X-Gm-Features: AclHuK_ZuEq6J89mo54PdzP1OnTq4mPljqW6aT-mLz76EZXNOrQC8XCfvE0QC_0
Message-ID: <CAFBinCDB93uLnY9V-tLt4n77Oh5keji=rwA-VNbHm6V8rkYkJA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> A recent Sashiko review [1] on this code revealed the following problem:
>
>   If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
>   and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
>   snd_soc_dai_active(dai) remains 2. This skips disabling the clock
>   divider.
>   When the streams are subsequently closed, the ALSA core skips invoking
>   hw_free again because the state was already changed to
>   SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
>   enabled, potentially draining battery or blocking system suspend.
>
> This commit resolves this problem by using the 'clk_enabled' field of
> 'struct gx_stream'. In particular when 'hw_free()' is called on a stream
> the code check what is the status of the other stream and then only if
> both are off the clock divider is disabled.
>
> [1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.=
org/
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
