Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786387;
	b=dZxOjQlSvSXGqPZsCpBzanbebhySDfbNMOLfx4sgaHkjMcErn/7bf7IfsQ9vMkNlsAZn
	 fqnqhPBEGcpOmGFPDFF3rtBUsdtA3+HN5zyE28cKpXv5k8aSEY8KBQt15C4vXkvFmxW6g
	 CGOb7+9l1xO9WDpN+eguFiJHcrfRA+hDNVHy6uXTOfB/xm3JrOU/eDaIadeQGz4zncYtT
	 +hCf70U9h38baPao3YICvUY6Pnd2sakAVI6eRqNoBJZ/10cA4UGYQTOKcDk8RZuNA6sa9
	 WaD4voq7l3JsyEg05flyMc0z2Z7dfjuX8Ia4DE/Jcz4JvmMVR/esJ+UJ/l88+8RNgvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kVV+NwTV+9ZC8EqM9XWPxOExxnVbvCg7pip7E4xE4dU=;
	b=rex0A0KU1ZHQw7n8mB6NsqFY5706TdidL5k/Ud+MrWIYcBqeU7vqmOQ8pKLa1DCwU4xj
	 RAfTHMn4DZRATdmizQMIMsJVN8PsAuUoiPXW5FpQrVpSzqYOF0hczjdUZ/1tAb5dPjJlm
	 w/ncUmo3EiFaeTSA/YoJJkgEzIkVp0FU4sX6jYLaYNXY/FrYw3BqgwaxhlXJ+AEcEEizF
	 LrQ2/ptz6X+3O2XJctwrf6vYlccwfssuzVaWpWcE5/ECs3tF0d86Nx93kI2Wphvb4A3ur
	 Zc+/4baY8AvGfYvv5Dr7bc2PLmdJp1u0asms/LcUjSCSQkMu3HFBh2BxWmYrWX+nKTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AE2606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75AE2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b244fb7fffso752265c88.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793786385; x=1794391185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVV+NwTV+9ZC8EqM9XWPxOExxnVbvCg7pip7E4xE4dU=;
        b=by0c4k/G8PDiSTyd8V8QTZUxGYbRRFcRKl82h5qnXoTgfKo0vA+mUDh6kR5bVxygZ/
         bv9B2U0ziou9pEVt2+CcJXB946+SaYN1P/l0s6+O6e6SyXdgKZbXjeVACwDb3tgMXG8Y
         DqxoDy2h+bywhFbX5P6j6cLTaYXpPfZz0uDPfzT8mpoZfVjK8ZXegEgQ6maa71AiCxg+
         ZcakC+uC2+gVBHZEJhVw/d408RRh0mANBEyXuLqZDK3dUtO4SUVgdGi6DU0Qk99rldiL
         R6P6+vSoXRgCiLlWN2nk46QewI41qbNS7S9eaCZegKyIFwyZoUO1rHRcf1WKhzgn1tW3
         en2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786385; x=1794391185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVV+NwTV+9ZC8EqM9XWPxOExxnVbvCg7pip7E4xE4dU=;
        b=jJMcS4kuMI0ijpIzUF+qG7YczcC6++fiq1VV6LWkTp+aLo1TLDpE8DW4pgcAqdwAOy
         bolrYTuLYZHbzXYcz5XAFaRByl1Qe8v0xfAClRTvBTOcT5mCMS4bduDeMPKVMDf897lg
         G7za9EwIgGfhQ4sx62G6BjMcrM24Vfm5BVhdEGpQGer/OL/uiaESghiE0F7Unc7xglJm
         t9a+U3KeNgrxv8F7Pu+/TxXp/OKESCg2J/CyJI4k/lWJ5zPJ5yO23chTUhDP1BKauyck
         Y19mnTvUIn5vqUkehCtpjXBP7UrKYhLysc5pTIJX2aY/G9Wusd4N1DKanGz5jgnT6j3S
         3WYA==
X-Forwarded-Encrypted: i=1; AKwUvByWtR0a9QD9ThSQ2cywjMKsRXRWCS/bOcKF2qSK4pVkBr4IkTqNB80cbhr1J2drlQg/gGMKQQ3h+3Er@vger.kernel.org
X-Gm-Message-State: APuU4Z+b0gaJ5CYc1H5X3vBtl+mYo9+uQDfh+nuRSOtnWdldQ8bwMW11
	jg/SN+LuUUE3xXrO59nAsf/m2ZsJWT5Ug+wn8WrtIvKJvfjizD27ZSTe
X-Gm-Gg: AYBFou0RDP4HSdmR4v71tYEFyNjPcv9QKADZHZ0Za2dQU1taRvdoN5Wl2FHgsULjZsO
	msJhCsrqU5I+Dtys/H9T8K4d3T0nVEaV7nI5MvFSs8+nJEK6vtLZCHS6dOFrs5WmGtOhJEQJhfR
	uWB+4MDUu2a4pAFsthNgS6w89IYZELiX9aDzbJvDd0sgOfdnawH0ofFB2Kq09SSflB91IImrwV5
	IBvjC2ZB7DaOJLTfADkVFnKwjdl1yQQjj/HxdWd6iT4U07WkDIXFEfj5n5U7uGTslm8g+Ntftxg
	50cWZzSXHAAYgurAnGY8FF6xWTbKkZu4tvqPM6A9ZVcUlUY0Vm1IUM7PKIeagckOdEyTyxbjObN
	twfgh4+qFSBYKExirvf0L+P84IZxeVSgNHvCWWHilFNCdB4LO5jbcqSQAVu3YdjfxyALnf9V9q6
	/qkG0BDR0OdqlmK7GdPX2dU47+qoA8YaXuV1BsCfaSOkTPSGsSxnlhGzJr5KAX1OD9JQmiGXyPq
	LvS6zfJZ0khnWKszghiIYMQY9QFUJc0TiOqCKSzUSYxpr/npKziihWzNlOumJ7GpcZ4zJuTH3P+
	aSVAuL/tl9fjai4SbyxqeXJqD/CdxpgD987/sN/xTE8lyAk=
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr23249910c88.35.1793786385435;
        Wed, 04 Nov 2026 01:59:45 -0800 (PST)
Received: from localhost.localdomain ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b87c4asm6318999c88.3.2026.11.04.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:59:45 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: a39skl@gmail.com,
	abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
Date: Wed,  4 Nov 2026 16:58:06 +0700
Message-ID: <20261104095806.18945-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <3ec43b1b00bca7506c1ca678c118f8c2@mainlining.org>
References: <3ec43b1b00bca7506c1ca678c118f8c2@mainlining.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 02 Nov 2026 21:11:33 +0100, Barnabas Czeman wrote:
> I have checked it seems lemon have same adsp region like citrus.
> `pil_adsp_region@53800000`

Thanks for checking, Barnabas. Where did you see it for lemon, in a
downstream DT or in the stock firmware? If lemon's stock layout also
starts at 0x53800000, the 0x53400000/0x2600000 in the lemon DTS may
be worth rechecking.

I will keep the ADSP carve-out per variant in v3, since I cannot test
lemon. Adam, if you can try lemon with 0x53800000/0x2200000, the node
could move to the common dtsi in a follow-up.

Thanks,
Amir
