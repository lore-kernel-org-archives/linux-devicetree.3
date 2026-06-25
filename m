Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6D249E5
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 05:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782365645; cv=pass; b=QLGCdFNCzbM6VA9wr+HpCSI+FI80quFGoBO9uX8pUEsO7NnYrNejwcUEp25Gv6OMRGmcg9Jy7Cy5g0hPBDquqRzSKDDRD2ndRMfvOi/0H1pbqsfhqIwkQPkpLQzRVacf6ymx103HARraa0G3+4GHu59xzfgBjKQd0VE4jr5UHXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782365645; c=relaxed/simple;
	bh=gzJGT+ZQh8z3torCEv8HmNtKtrQnmEcVtJIgSfIHtck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ba1Pfj2ut8buYTonNQHxl81ydcP1rYnlqmzUvD/0t5MScclRq8H2VL3yfPkdbc+8RE+id5K5o6gwjDCLHw7R93szfTr2CJkBzZQlv/nrEO8IEtcvJUjB6OoZXATSo2FsRtBT4xDwOWKK3t7RsP75i6gTBvy6+StS35fNBVoPrzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYKuCOI8; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYKuCOI8"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ad68b30252so2108879e87.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 22:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782365641; cv=none;
        d=google.com; s=arc-20260327;
        b=opRtBxmKBB0F9O/Vu05kMrmTibEyQUHjcVUCQ0zsY5WyzE/MKi21LgCSl6UwrlEToB
         69qkPXO2J4gR3twrnS50N/DAE4kfzVgkhaFyJvCFZIbZntxmkvVs0PE4ZiASr054fK7e
         RGiE/rBhKq3rWGqbCd2Lpy+Wkvo/e89LOe3huuwXOhJCo44M+PyA3YO+oG4/A/fsgVBq
         fpPuEoBjOr4qWGu8lElH7ybgEdXnXOclERJgDcLfm0JVG7GcLB1o4i7IuXo310Tdl4+V
         R7wsW5R5IiAIKlnKI5KO3HhZUyETT3c1O2zaGKVQI/SsqU+5SPB3rB/3teiIav3TBkOH
         7UMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A+9zdrnWdYPYO0YMlgRGb3kLO0yAknKaNgGna5hHFMo=;
        fh=qUg18CddOWqb/H98wNc3uKymYoosXEZaHrB+uA3X6mQ=;
        b=nf6VS5fU0h2olh5ZRKr+b377ohVITGjNk/U3+P5S4saesQboDZ6fJBGUVswTH3RyL2
         relBVNSjegsxCdMmhZNr5AHx86Ow3gUp0RGrzTktcPIg/WV2zRTpACKe1DJ/EajlgiDz
         8/ql3CPrEZGol1ITAzcEuww+16rrisS3zge+2dSQJBqVLfLH0H1nidATkaq8saAC264M
         j5NHVCHwdigy7PjCdsfeXq0zVMqP1azFQ+ZrmG+AmmVwBr6nGYGNyRv9wli36qrLzOtZ
         JDYOe6A0JDSMBO73ZqorMdfiV4+AOB0zi7jcM9LAm8NOesswK/TKMoFAYgL7SjjXRC7L
         mhhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782365641; x=1782970441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+9zdrnWdYPYO0YMlgRGb3kLO0yAknKaNgGna5hHFMo=;
        b=eYKuCOI8u9fy2xtpC0VlkmmSF+BhdNBiEXrB0afL6+tOgip+mgW1VrD3zomSWBo0YW
         LI8OlJ/9m4dYI3vdKN583Eja6eJTZUF4tmyY24e5gus9xuIkqAJGgqPVxuwkZ5GfOA/s
         GYy+p2bnUnCWt9jFMBJyrD2HWs4IM049Gu7qEIIoLxnnX+9pWAisXOgnAV1py1dDWXBx
         LbC3vttHOrvv4GKxdb3OtVV/mJmhnIG46r18kJODZ+6WdesKyLk0+xyoB8A3p50LFxNu
         2povH1l24Spev8gggx7r623k7dNq3/GoOuRiEpWMC8D5UXjBXTn5cOBE0n1DIeKISwom
         Vnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782365641; x=1782970441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A+9zdrnWdYPYO0YMlgRGb3kLO0yAknKaNgGna5hHFMo=;
        b=NiFQt8T7PV6+/A/xjUgV9cb8bkUU3ibQM11WfbCJc2Uh9MeReSJp8mn8iCT9F0SZ1N
         Eqy/rIYKQ3dJIRI3TD8HMK5OamwuJRdrgFQzJLGzFKECklOTJeRYIjeH4VuWFmkhqRQs
         U7e9MvjxfP4TSW4zYk1ytAd5vrwb6jLqO4qSMzwqvHJe5B/gpfsTXoI1pRg9PZYwppnM
         HSGpYwgSAZ9w3umgzDxB1n00D6rlxAEVWmzM2ouhY9dVVvuANTcvFuKgSXusLytu4FoI
         lSpUvu0fsE2xUm7wZyjgE2fUCRjXVU0B2bgE3WdovS/sWX6itMM4rTC5/zpkbhRztd85
         MMsw==
X-Gm-Message-State: AOJu0Yw6ByxrFbNYYJWWBHVsnKwn7NPUp7iy+EgbJPwbb4n+dxZ/zVJU
	XH+e6+hVfEymW3jMR5+NAr03c8hlQmWDeTVsy/MWGhxQ3xqJ6QmKDYgnvRtWBlSM1UO++yfwkJ/
	hZQ9RN6N2AnE2dmck58fdZpUkaVwc9ZA=
X-Gm-Gg: AfdE7ckunXk7HfUDCTp/WBvNmBM41xCVDmEwpXoZkIKPdg8ZMADcvH9hqaJ0/6758XZ
	aGches44eOUqIvSSw5/5QhkJZMmzZ7Ts82Wq3PbebPMw/HkQSx52GvxW+OAJLIZg1T5SxMp5fvV
	0RvlXaHoCiKNSeCjbqNth+WZPHLybjm1NE64s2z+hYMz1ECm9XuBC06jd2uku0jObAG1+00P/1U
	UiEG0xCFtSwDkBLSnN/YlQnwKVnhGzb9ZmZUx5+Pnpz1bi1M0tEkCiAMuq5cMtAammHID6c9A==
X-Received: by 2002:a05:6512:2c86:b0:5ae:a348:1292 with SMTP id
 2adb3069b0e04-5aea34815d2mr45473e87.38.1782365640650; Wed, 24 Jun 2026
 22:34:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
In-Reply-To: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 25 Jun 2026 13:35:37 +0800
X-Gm-Features: AVVi8CcTmMqcRiP9802pZDxyIJzSjqDj0HrKRWQTIvD6r3wqR2s-_IKZO7UmEjM
Message-ID: <CAF7HswP25GXigSqL+bGBz=0=RST2XjS7fNmkKcsy-qjxfg_1jQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maintainers,

Just a gentle ping on this v8 series.
All review comments from the previous versions have been addressed.
Please let me know if there is anything else needed for this to be
applied.

Thanks,
Kyle

On Mon, Jun 15, 2026 at 10:44=E2=80=AFAM Kyle Hsieh <kylehsieh1995@gmail.co=
m> wrote:
>
> Summary:
> Add linux device tree entry related to Meta(Facebook) ventura2.
> specific devices connected to BMC(AST2600) SoC.
>
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
> Changes in v8:
> - Addressed review comments from Andrew Lunn:
>   * Added a detailed comment to the Marvell 88E6393X EEPROM node to clari=
fy its hardware I2C multiplexer isolation and out-of-band firmware update m=
echanism, explaining why there is no concurrent access or multi-master scen=
ario.
> - Link to v7: https://lore.kernel.org/r/20260611-ventura2_initial_dts-v7-=
0-a61d8902bc5f@gmail.com
>
> Changes in v7:
> - Updated the commit message to include a detailed description of the Ven=
tura2 platform's purpose and its key hardware features.
> - Fix comments from Andrew Jeffery:
>   * Ensured consistent blank lines to separate child nodes from parent pr=
operties and from each other throughout the DTS.
>   * Sorted fan nodes in ascending order.
>   * Replaced '//' comments with '/* */' block comments.
> - Fix feedback from Sashiko AI:
>   * Added 'idle-state =3D <6>;' to the PCA9548 mux on i2c4.
> - Link to v6: https://lore.kernel.org/r/20260610-ventura2_initial_dts-v6-=
0-375d8e9d7ebf@gmail.com
>
> Changes in v6:
> - Addressed automated feedback from Sashiko bot:
>   * Clarified comments that io_expander0 and io_expander8 physically shar=
e the same interrupt line (Wired-OR) by hardware design.
>   * Removed leading zeros from unit addresses in DAC nodes (dac@c, dac@e,=
 dac@f).
>   * Removed unused properties from the adc@48 node.
> - Link to v5: https://lore.kernel.org/r/20260608-ventura2_initial_dts-v5-=
0-37ee5bcf58b6@gmail.com
>
> Changes in v5:
> - Addressed review comments:
>   * Added comments explaining the necessity of 'legacy_' prefixes (hardwa=
re label collision), pre-allocated I2C aliases (future expansions), and the=
 'ledd1' naming convention (schematic alignment).
>   * Removed the empty `&mdio0` node to comply with upstream networking su=
bsystem guidelines.
>   * Removed the redundant `&peci0` node.
>   * Sorted `&kcs3` and `&lpc_ctrl` nodes in strict alphabetical order.
> - Hardware/DT alignment updates:
>   * Removed unpopulated sensors (adi,adt7461, infineon,tda38640, ti,ina23=
0, ti,ina238) to accurately reflect the current board population.
>   * Added the secondary flash node (flash@1 labeled "e810") under the &sp=
i2 bus.
> - Link to v4: https://lore.kernel.org/r/20260424-ventura2_initial_dts-v4-=
0-806b00ea4314@gmail.com
>
> Changes in v4:
> - Fixed capitalization: "ventura2" -> "Ventura2".
> - Reordered I2C child nodes in ascending order of unit addresses.
> - Enable PECI, LPC control, and KCS3 interfaces for host communication.
> - Configure MCTP controller on I2C4 and enable MCTP support for specific =
mux channels.
> - Add Infineon TDA38640 and TI INA230 power monitor nodes.
> - GPIO and Pinmux cleanup for PVT:
>     - Aligned gpio-line-names as requested.
>     - Remove unused or non-existent GPIO line names to align with Ventura=
2 PVT.
>     - Update specific GPIO pins to empty strings where signals were remov=
ed or consolidated.
> - Adjust SGPIOM frequency to 200kHz and update signal line names.
> - Enable UART3 and add serial2 alias.
> - Link to v3: https://lore.kernel.org/r/20260113-ventura2_initial_dts-v3-=
0-2dbfda6a5b47@gmail.com
>
> Changes in v3:
> - Add annotation for marvel 88e6393x
> - Modify the gpio-line-name
> - Modify the node order alphabetically
> - Modify dt-bindings document for rmc instead of bmc
> - Move the gpio-line-names to original node
> - Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-=
0-f193ba5d4073@gmail.com
>
> Changes in v2:
> - Remove unused mdio
> - Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-=
0-1f06166c78a3@gmail.com
>
> ---
> Kyle Hsieh (2):
>       dt-bindings: arm: aspeed: add Meta ventura2 board
>       ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
>
>  .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
>  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
>  .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2903 ++++++++++++++=
++++++
>  3 files changed, 2905 insertions(+)
> ---
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> change-id: 20251222-ventura2_initial_dts-909b3277d665
>
> Best regards,
> --
> Kyle Hsieh <kylehsieh1995@gmail.com>
>
