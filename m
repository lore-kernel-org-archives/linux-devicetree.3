Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E2A3BA240
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516003; cv=none; b=cXWtMXxQ4NcEMHSDP8inVnqBU6Pl6Zv/6/j0aIKAzJoKLRUNqCMM0eNzVVDA/hydYVmZeYjM7u9Z9WU2sKg2zp/DjxATL374phI0mgtngwwryK+nbvf3C9Cndgz92B4IWqMM2hyTGdADoxN5BBgycDptgvLJVRBC9LY7pU+L8hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516003; c=relaxed/simple;
	bh=qqH0mHum1MPPAMwf0G784Ou93TwAWIC34GO768GxGkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M2ip6kfv3weVD1C1Ks6zZGWjefooeVg5/5D9lRqH7DvBt5jRFYFARzCqbf7sJ8k46DpxRcM1BypbBhnBjhMW90QIkHwKLYABzsDZ4lARYI2Etucvg180ElpiGfeXjK9+oXrzvpHf8/3TqFtxdJbyXrF6FniC9LUbO+GCkwbuK/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y60Opy9/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y60Opy9/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso5280895e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515997; x=1775120797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3TlfPr5wsxYEJUguikxW+ieUfgR9C+ry1PS4rSilIM=;
        b=Y60Opy9/Ss0V4Zp/sUm44w8HhmOaOh+Km07QoSTzE30wtMW+Y7Ki9qq6pAd5Jjx5RI
         USz6ILzm2EahtxkZe5sVnoiaVcZMmjvyGO1LwfOafPvAw8dKoElyK6v3n1Q6oRpY5cPY
         F8RQNZ0oz0l7y4DRPHRwcxHBBEasAd8S8Ugc3eL+xhVDSSoarOvyuYo9ZTRI860l/i3u
         7+u56uJlZUv+le20u3TRogVMBHM4DBwGcEAqYUaHJde4Oj51l9+fRPhTDK3mMPGIbknv
         2MdNOoQR9AlHJY+S4VFikCUS9G8rIX3Yc7VjlC2/75JlWb9prbTZP4/JU/CJ99DrjJo/
         ov6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515997; x=1775120797;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y3TlfPr5wsxYEJUguikxW+ieUfgR9C+ry1PS4rSilIM=;
        b=JfGblgLD/BmadLR/Ri+nXVufgi5kaPUf/FcdW+yQzKSBL3EswzFb4eOonYlzmb/Wvr
         /Ye7uoOxH4UaTgsN98WL1n/NgVAAKgGnm4MmPgLuGRd3vI+GP1or5tZS2+xO+7Jhbxlx
         NFb+nbpMuQqwg7NIMPEmstXNZKmc9/7CF/k3AnS4/oZVKDPSO+LYOP5KdKuUiFZs9YEN
         3Fis4/1QlMfYWkVxQb6LpCwh60JVKYB7DuKaS4+7P1XpA1xK+OcRclAV46HNMuRsQHkp
         Mh3/ssaMG283dNO6TrVbR9fBMWmuVR5x6imES0g785f1H7zBe6bwQpCi2GD7Uicl9Vgq
         ZVHw==
X-Forwarded-Encrypted: i=1; AJvYcCXubnqXYgFIgSE/YPCZPlEX6vI+AObfTAn7oxEv/AMJQxcFiZUoqSJPcqo7QyEEHgQ1M7L0FvTmn2xy@vger.kernel.org
X-Gm-Message-State: AOJu0YyKgwxm13xaexk+nsSXfFgVnvbenypSYyfZzKNfJaBi+uklRhxC
	P9p5CEtps0O9yTIprX1TCyQ5KvMkziuUWC94WrupwEtduTv53Bra9gDtEXmNX1UNDxqbj8hq5sp
	GYaEn
X-Gm-Gg: ATEYQzxN1fc6GEJ/VPHdA66hFw/FWrla485EYRQNHy39k7VP43Z+oXyZrRowBZWA2NO
	6zHZOr0XKoAqMuMAujlZ4jCig+N5xeHyjTjtTeabC0t+bXK8lqrVOrIIApN/KD6s4DdqM/QeaPt
	w04QNscJoPPjvSqrQ8rIVXHDpENVuTw2rmOeAcozAcR9LAmUSKp0Qk4FJBCPVEwVRUWMDE9Hhrf
	wqB0/STyzoDvQYzYLpAJA0xtGD9zDcmqPRG/3RJKx9brikqWcF0F7SB9IKPRUK5fXhgBkOlmfSs
	9OpjeaJMphxNq+VdXe3I+zr8zgAzsjeqmGIIMHFpN3MGEmpyPRU86DVEr6eFokj9hPZhzneRwBw
	iRMLK+A5KVmoCu55fIoZgaMWntrOAO+Biu4lH2p2cndRIzRV9Ex5/TfIMhf7U6352tF2Hv2JpLK
	upi3BGFoBdjfFTp6A4IAFnTpI/dLyFwvw+Dyn13bLe+6qT
X-Received: by 2002:a05:600c:46c8:b0:485:3d3e:167b with SMTP id 5b1f17b1804b1-48715fc33bcmr99989815e9.5.1774515996854;
        Thu, 26 Mar 2026 02:06:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, krzk+dt@kernel.org, Nick Xie <nick@khadas.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260228063750.701887-1-nick@khadas.com>
References: <20260228063750.701887-1-nick@khadas.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: amlogic: meson-s4-khadas-vim1s:
 enable LEDs, Keys and Bluetooth
Message-Id: <177451599604.122020.4295187646181046048.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:36 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Sat, 28 Feb 2026 14:37:46 +0800, Nick Xie wrote:
> This series enables various user interfaces and the Bluetooth module
> for the Khadas VIM1S board (Amlogic S905Y4).
> 
> This builds upon the existing board support to fully enable the
> user-facing peripherals.
> 
> Changes in v2:
> - Dropped the SARADC and Function Key patches from this series. As
>   suggested by Martin Blumenstingl, a dedicated compatible string and
>   driver update for the S4 SARADC will be submitted in a separate series
>   to ensure forward compatibility.
> - Patch 1: Split the UART_A pinctrl definitions in meson-s4.dtsi into
>   separate rx/tx and rts/cts groups to keep the SoC dtsi generic
>   (Martin Blumenstingl).
> - Patch 2: Assigned the UART_A pinctrl groups directly in the board dts.
> - Added Martin's 'Reviewed-by' tags to Patches 2, 3, and 4.
> - Link to v1: https://lore.kernel.org/linux-amlogic/20260123022258.136448-1-nick@khadas.com/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/4] arm64: dts: amlogic: meson-s4: add UART_A node
      https://git.kernel.org/amlogic/c/6710d76d7e51a24f978eb1ae0738d1e3c25e034c
[2/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
      https://git.kernel.org/amlogic/c/ad44c753b976e469f0f014b6f92e7180b6a7ba59
[3/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
      https://git.kernel.org/amlogic/c/b8a95d4c054d9d2e784ce5eeb6a08be0ce9031d0
[4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key support
      https://git.kernel.org/amlogic/c/31132e11e9dd97c706434e4f9e86b503c67a6bac

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

