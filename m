Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C9E51D525
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699259; cv=none; b=OXwwQi919hu3QvxMAHbJV9jKv9lMhdlcibotrmjderKpKh2diMfqZftHzeuPpHJdxkkElgmLYQ+z3+9VgjL8iZNv2cOhbiU0uV//cIQGbR1j5y51MmaKRJj+KdG1zCX969dqLnDG/X7IERIYctGFlpjVeoUsUrvHVgxTVKW50jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699259; c=relaxed/simple;
	bh=PMX1p5KQ1LljzZN0fjjRX/ggRrs5b9HbaoJ5+VgHJlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzmTmlvF6BN9t37MBX7NCmfeDhkF/NflP2GG+ulJvaIn2hwqGmAmKETHMa6hVXoZ6hG1z+rcjwDc6O+O1oIcUqqVpicb1IqbFYA7ni4ThwY6kjmSu3ZEsQ6rnGlcPl+SG3RQxNbqzx80xQ1hir8VqlT4GflmANjoXPPhMRho1ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXlg7WSo; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXlg7WSo"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2118170a91.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699258; x=1791304058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMX1p5KQ1LljzZN0fjjRX/ggRrs5b9HbaoJ5+VgHJlw=;
        b=VXlg7WSocGATlOvCB4Z/bVVz3oUCyJUcS8MRA0ngbjH3puky42+GDJQFPIEyKUJ0o7
         Xd2dP9rd6igOTUsUUcgmkxNI0Qp+Jfu6uzKvvqk7nR4rR6PRp/128CItN2Yi6So1NvM3
         vCuuUgKp+xXnKgq6jYzZDWrgxmXurdKQGg2CvBV457HERcv2yblzudf1OKTocsbPRDr9
         OZAx3vIL56VmkoXpOmAcWnp7+jfuIeaNJyNIg4OCKORaeFdIDHDN3jxycC6uarn+Xjgs
         2UGCnvBgo1BT/pK4dCSt9xNcYjmvqg8I6yZGd8TEmYZgxwfGv5BkacgiwJ808Jf4JGY2
         paMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699258; x=1791304058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMX1p5KQ1LljzZN0fjjRX/ggRrs5b9HbaoJ5+VgHJlw=;
        b=ubRdyoEk+ZNAzQqZ67Mj33mzcrBVAmKkVSY1CE+53/zmT0320JLmLqrJC2+P5iRQgN
         0/qDL4a3FCudRGBi6e7bwWPdAS7t4KUwoDjvgoW9AQ2E48f26QDlmMSN4sgHDMPsNvsJ
         xOz5cnS8qkjmz7nkx7aA+OM6gu2WgTK+Hv7eE//jy5ahmmsg7+vCW9errSMPqlhHGoPb
         rvgPraBc1R22hbKNGBzvB7poxzcYIYy226FPUDolysXwB2gKF/Lbc7+DCrn+8c7oByMo
         VJjhvrUhe5PybYfCYVcUDMV6tBKIQBKrwHZdhGuHNO6cUMXtngLAHQrq3EyTTESJGvWh
         4EEw==
X-Forwarded-Encrypted: i=1; AKwUvBx5btd+hMkzkqcx5iZIamAiwWQcKs9cjCE1pciEJcpLLLumQymVrEHAwmVADbS0aT3EqsyWsrOwzqcF@vger.kernel.org
X-Gm-Message-State: AFq9FYJ022hBjQ4dJPwbC/jSwOjKcC5MMz0RL5K/JB4VoJjDAZvXIoJW
	DvTCjpiLINVQOZDXCeWt6M8pm1+TpvFJzEHOofxz5G57P/AUVeK85r6H
X-Gm-Gg: AYBFou2iM6Ii4DDWTZNwRg+Xs5jk6rzNG7zGS+L33X2t6oSQhDBtLhMZZxoked08dDb
	fISbLU9IitcP8/Lll7LfU1N25hmpNS1vVzoWtGiRLFxZuA7VYOVZBLv/xEikd7FJcg79eJ3gdPz
	ATU/aD8XyHlWADEOJwqQDfFrnnKjkWGXNo4y1gBgoo76PUbkLqr+TrJCWS+w0IB5HQt3by3Cp/X
	cRVSdi3xhZgpV3W4MToO5XuhN0FnZGgVqEIBjQvgVIMQwBQ+eFxKo5/ETrZOtklRziIn9bqROG/
	R6dKacb3B6JNUMLX+Q4JN7eHqV/LrU5GhfVHrMDVpJtNNpYZG8rC76JJrhlEEhBFoTiwqW6hWTO
	GycrORZYxIiD+lxhkXjjdDV9pKTa3LcQhFxBxikqig5Wxqbsmgu7EiXAlSQy9SWfX9/sRonK71Z
	OquHEip8eBGcEo6NM4AEeNFKjDu4TS1OtgaLdNauP5wjyZSHMjziTB8otDnjrG5Fhuq6SLY6dFP
	2ALGtf8MUE=
X-Received: by 2002:a17:90b:524a:b0:3a4:71b7:eb63 with SMTP id 98e67ed59e1d1-3a471b7f585mr3801721a91.10.1790699257948;
        Tue, 29 Sep 2026 09:27:37 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497f23328sm6510887a91.10.2026.09.29.09.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:27:37 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: Re: [RFC PATCH v3 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Wed, 30 Sep 2026 00:27:24 +0800
Message-ID: <20260929162724.1545-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929141337.6F0321F000FF@smtp.kernel.org>
References: <20260929140649.55-1-yaozhonguwl@gmail.com> <20260929140649.55-4-yaozhonguwl@gmail.com> <20260929141337.6F0321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-09-29 14:13 UTC, sashiko-bot@kernel.org wrote:
> By delegating this core power-off requirement to the optional
> pwm-backlight driver, could the board reboot instead of powering off
> if the backlight driver is inactive?

I plan to keep the GPIO1_D0-only description in v4, and to make the
commit message say what the backlight does and does not guarantee.

On the emergency case: the PMIC's power-off prepare handler runs from
kernel_power_off(), after device_shutdown(). orderly_poweroff() and
the forced hardware-protection path both go through kernel_power_off().
emergency_restart() does skip device_shutdown(), but it restarts and
never runs this handler.

With pwm-backlight bound, it sets GPIO1_B5 low when it powers the
backlight off, and its shutdown callback attempts that from
device_shutdown(); the result of that GPIO write is not checked. On
this board, with the backlight on at full brightness beforehand, the
GPIO1_D0-only setup stayed off in 3 of 3 runs. GPIO1_B5 itself was
not sampled at the PMIC handler in those runs.

With pwm-backlight not bound, it does not claim GPIO1_B5. The pin was
an input reading low on this board, and that setup also stayed off in
3 of 3 runs. That is an observation on one board, not something the
kernel guarantees. In particular, if a bootloader left GPIO1_B5 high
and pwm-backlight failed to probe before setting the pin, it could
remain high. I have not tested that case.

The alternative, listing GPIO1_B5 in power-hold-gpios, means removing
the backlight's enable-gpios, and I have no schematic showing that
property is wrong. That is open question 4 in the cover letter.

Thanks,
Yaozhong
