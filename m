Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418693EA959
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786796576; cv=none; b=FDsi+uO/nQr4OerSvWt7QNmtv0ney1tdblRqoHcA8KxKTasWhyppfXYS+xHjpu4fgQ3yeQSbu8svcM7CywSHrs/64pSwnVzbn3j069QnuJSfnxvUR97zF2dfH6kTJtxZwYDjgIkrvAZo+DWJrAQ3uLk56ZwrPTLazIDqsmcVOgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786796576; c=relaxed/simple;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOvEtI+4ks9o5gHq2LiosK8OCkQQk+gOkdqCcNxmPgjVSygwvDS+agfZc0yEHD5NXrBvf6heR/jLWi/8uuYPSvdm1JFCZ6xmXRc/Wh0ZLWS8VFO8W/2fM/mxJ3HsXmNjczaOF4i32Q15qo+Vc3hOJyOcg0qfTwn+Lgw5U57OpqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cspVOTfc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cspVOTfc"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f502ff678so221399f8f.0
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796571; x=1787401371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=cspVOTfcgmpQHXEP8L81v2osYM4eZ+6IdnP7Z/4z3Jd1j6KzSfG85mD+IA9N+dLS/3
         LxH4UlKGnbdIJFgZFenoXX0N8PkNKUfVKpmpbB9HH0cqCYkRDeYaxjoFyKEd5IL8AccF
         vtABO2rZ7uHdQyaaE8dtNYdF4ffaQUdG9jYuaV+qaEHL8TMDg6CQc1irdsENA207h0VQ
         WbLfOxsSm9dqmeJcSg/28nwyzX/BFaFzysM4hW6rA/xZB7QJm7iyc7Eiy7+Q5XyPraUK
         k1+BQuCOWrNmfYfnsxnvAyhulTef2OY6lXFx1qEPqiU4b35X/LLg3VW6G5oMtKTZfUSn
         pGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796571; x=1787401371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=ir+uytD0RitQG0zMnjj7moPqNOjIyBX29r87du7i0K/6tEyOjx2yRKNJlQPCCWpGrg
         SgmcRW1cmVodQWDIMKfHo+OXuLfS/s+mP5kdL4zFDvxf/MEJ6wtkx4tDoK1KFGi5vtEs
         /OudLdV4o0MnnbXz6zMVUGAhF4jtQyR2vYh3genlg3tD6cqpBGOeNqRqYT3rqec/N7kJ
         Vc/Nnrh5GJXwgA87h0CsEytE53OHxfdN0KTlSnNj/52TuPtGRuO0CMAfN3tZIXO4o7qy
         H+dNX+XN+RWgZV3X4ERF1Z02zC18rMj0MIQ60y9tob0QyDEboV1rRbB14s+56Tryh/7D
         y1NQ==
X-Forwarded-Encrypted: i=1; AHgh+RpacHOwoWondk9yaQTpTQnpp9xsjAGiS9QiwPIZr7sZh2Y9zTUosUimbsvopiwPcAggDz40jF7FdFy7@vger.kernel.org
X-Gm-Message-State: AOJu0YyolPLSiS/BEn2Y38EK+WkDOGYPogkE1dXq8EX5mCsxIXMAcplP
	jB6x6ab5KjCPlVfB2T7j8Ols1epl3Cbg8a+vYnytuLK6mktcfQraLRG5
X-Gm-Gg: AR+sD12MkkWMct6DeNBUX/UgMiLor5RdD0vTihbu9knuJNjcxEUADknDCRru6khAjAq
	VqFOWqwYGF7ncn0NklO5gLbBa+W8ibeg7OTs980LY6kqqr4Tb5gNVQDSRdYr4MQwegWTOy8ihOD
	Xqvxam/+D5eQWq7V+HdLYAH33xAUhJtGy4bg8DMM3K7XEHYB5oNlt862jq1T6ZahUtQKXah00fl
	BFucZl4ABIB0L84sVFAaH17WvaGmShz/PY3QGFtM8uJvhiC77iVFAyMU0hngKFj3Q3M9p+IWFJ8
	cTWwRgSXWWAwIOQgckTsDSwFI2VnOkSu0kmn//SrdvFg4mBTJEY7Sb/F63fw5DxiAp8hmJMBWhO
	AJMbWMbbcewUzfmprg9c4I2KOjaF/gut9CLUFkRr+dgLRD0+JqvBo7+ODvBtkeFNbm+d8Ug3PGW
	nIaWeAn+dxRRHBrwUMUfC0n//SwtWhdVXXxNz8ooJ9n7QNB0YpieXBISVD9EUu90CwfcinJctEM
	jUf5Dk1OyAPbRvQXP9FRIVDxuhWYT5PYGpSdLp/upEUyABWZKLA2FQ3cBXm34Hn63Gf
X-Received: by 2002:a05:6000:1446:b0:47f:959f:d5e with SMTP id ffacd0b85a97d-481606984d0mr9483486f8f.0.1786796571543;
        Sat, 15 Aug 2026 05:22:51 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:51 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v14 30/38] usb: dwc3: core: add post PHY registration hook for platform glue
Date: Sat, 15 Aug 2026 14:22:33 +0200
Message-ID: <20260815122239.65405-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-30-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-30-b5ad9c68fa11@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on Orange Pi 5 Plus (RK3588), 7.2.0-rc7 from rockchip-devel at
ea51774c5c42; details in my reply to the cover letter.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
