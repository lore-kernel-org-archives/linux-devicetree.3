Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A65A417D94
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550720; cv=none; b=BdoNT5bcbhyFMbfd5dlcxtBLdC8SjwTrYYbORw4KKb3Zqudv/FZTFMVq+lcRA/jZQi9S3u/tYWUETj/Jo2ke3aqXztipFffSctNojJyXF1UzYi+7Ij9KRlDiicnuNUUCXQftyrcDIcb+g90T6/TdtjoKuH2r2m476GHs8CGeA5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550720; c=relaxed/simple;
	bh=m5vMgxpJzya8xwy8d25L77S2eeydBlLaeZfSv6c0w98=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=daM2KcOahekqv+CxkY6QQ112my/Ch0wfA57TNJrPw+FS84g4FkDNK8ol/G1SCHq6GLw/gKngouWfiKE2wvPwpxUiUuyywqBVgbT5lXhB9byXS0PIsZp3twmd0swm/Wx2WqO2vnZykHwkDWg06jnqEaVnxCLqFKc6pSvitd5bhgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=djnTIK26; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="djnTIK26"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4955484387cso9623895e9.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784550717; x=1785155517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NWr7T4d59y34KnfzO23vP7E7473Y6DR4P1HbwbXpOA=;
        b=djnTIK26SNYVtVyG57jSZFYb6duJuakWX42aRhG9GtE6V88a8Nzy+v9P+b/rwRyJ4W
         9QJFU3q5u9GtwGuC7n5N5MMFJNYSW418iMu3abIIc/axQ62ejsl1P3qfGjSLra6J1hJB
         WEDtNbnVRBrZ2BIvmYnJDXK1/K7058kxzN751ys7BT6ES/hy3A2Cwz/p44SAabLG+UsH
         urmk5+/QzYTVdS06gm199kpEtAhhLdLdHD33Zmi8y1Vd+EBgJ8spDYQQJVQUKrbrpZYY
         irORR2eP5eoQejqdhYett4Ow+wZxw4eqaKZJWp8Occm1XurP8T1x6X6Q2+100rDmwSyR
         zjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550717; x=1785155517;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NWr7T4d59y34KnfzO23vP7E7473Y6DR4P1HbwbXpOA=;
        b=dq9nC0BZyTwUL5MHzWV6OVt1Tr0fhTkibBjEGGsJwWWgw8RPR081MJh93/KBgpG5Vy
         BAvFnl/ISZS28/5w0OFeNgRyqPwcljZhOU7c5/1iPgphGinx9hitWbs/W+D4t11xBCk3
         UugMMwlEVql+4I3E9jzqzYxsbR1861v148HktU7e/1Fke6iFrflfDBrLHtsLLOaUBDSV
         mauvOvzhf6YcMy7ZSWZJjKHEvwNXxPx1N12usn0AtRcORJzxS3o6m1IU5feYHFNYV+Rg
         c38vGjcktqfxe8OLAuthgFhw3OgpCIFbUyqHzCOafea9gOsN0JnMhJyvKBkhe82JsnSk
         Z36g==
X-Gm-Message-State: AOJu0Yxtfr1k5FuSQozf9rwna961YWhfKTWNOOaKOomuVYFxTd9qd2cv
	FH6XSaKJIP/F+GprHE88ymVnDWu2UsP3xrcoqqbFjIV+Cbbq5gWk9kOl1er/ZPH2q/k=
X-Gm-Gg: AfdE7ckgOJfbg60x7Tra6Jz+WBfAsXz7leNFkfrRTXuncM1QsGFn0Dth9SHvSBEcU6W
	0JKciIn2x0B71l+O5r2mAbCx+xjqEnW8jf24fLgRGL8iTqm25JhgshXp+OpuVYA0Q+sVXX+mffa
	isdCDPyGb2rkmgo8tRp91DmkwsibxI/OL0ELz+Rhef1bFhnr/tax6lzu3wwkRzVsgOIjLWld+BD
	jf4FqgHSKLyXACggE2jIDV+lCMm+bta19U0xjX8ZSbR3jKffjRO6nT8HZjjHHmXmYftycS5OTUA
	c7A9XZtQv53WqKe5hw81OHM58tT+8p0/kmWarD8PzZdc25Sn4f8nE4WTnoxGygtxV4G/x/1g8bL
	lLL5lV4ldAhHnpQuJcrdbXrD8V97TyLsBPO4pjq0VDptFDvmkd3RaEksyvy5tOTDnuNJNO4ceTa
	g02vQHhg15/HyCOhzC2rHrTwE=
X-Received: by 2002:a05:600c:630e:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-4954a3dc687mr158360205e9.11.1784550716629;
        Mon, 20 Jul 2026 05:31:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2692a3sm243086825e9.0.2026.07.20.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:31:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Arseniy Krasnov <avkrasnov@salutedevices.com>, 
 Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: amlogic: meson-axg: NAND fix and
 PCIe PHY adjustment
Message-Id: <178455071586.746335.9935948018468278045.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:31:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Wed, 24 Jun 2026 21:56:40 +0800, Jun Yan wrote:
> - Disable nfc node by default ahead of nand_rb0 pin addition.
> - Add missing nand_rb0 pin to fix incomplete NAND pinctrl.
> - Disable pcie_phy by default to suppress probe warning.
> - Re-enable pcie_phy on S400 board to preserve PCIe functionality.
> - Enable mipi_pcie_analog_dphy for PCIe on S400 board.
> 
> Changes in v4:
> - Add patch to enable mipi_pcie_analog_dphy for PCIe on S400 board.
> - Link to v3:
>   https://lore.kernel.org/all/20260617082239.645562-1-jerrysteve1101@gmail.com/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[1/4] arm64: dts: amlogic: meson-axg: Disable nfc node by default
      https://git.kernel.org/amlogic/c/77c63ef3be3972eb3d8aac2dd36f349d78620b0d
[2/4] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
      https://git.kernel.org/amlogic/c/45eb76f9ab6854f79690d56d04df227429a536b8
[3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
      https://git.kernel.org/amlogic/c/25ab968f7d27f46927658150bf466cac856e4f4f
[4/4] arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe
      https://git.kernel.org/amlogic/c/7f1d0cc86cb70fa550163b6f70fd1d484c03218e

These changes has been applied on the intermediate git tree [1].

The v7.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

