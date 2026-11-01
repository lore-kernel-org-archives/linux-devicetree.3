Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793574118;
	b=EEBgaTZQKAbFvNYRnpa+Dxj8egiDsf65wOQOpTkj+WgFZN2FEtyylzPxvffBovtH0sdH
	 f6au7P3RAR5ec+HiGb0l6I7s/KPxU8Rq/CoLpfG5eHDX8I2UO3KhrxLf06S1fcPsXk2Jz
	 kPQqBtsVu1gOef1y/oi5MZfCJ3R9UhiDbYHhX2xF0POmWA2wgz6GeqN/SsOIFv7cHzZHv
	 hc3+OoNRQ62YbFzNBFM2fGTygHpSQpcpvhZmOSePXROy7+xk9AmkWg5n6q45KKuP3ULsD
	 7NNsXEcObcCEPE1yQiIFQ6psygEWmwh9AXhUhRbs/nDAq594UTYL9NqQz36p578RRhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
	b=qtE/LWiL5A5D8rItkXj7yarfBcR6gjE0uzbETbgmbHTeS5HP5lDTPxGBrpQ/nnyuMucx
	 /oGO3vktjINdabxXIDuoXZFqe97UTdM53Bfs7gIIBNKzGyBT4DkWFv+LTCkLFEHVrkICn
	 4P0AqUgTQVlz/vGLmnSq3vi3xvv/hMsEn2h6c4gv2FfwBnP1X5LmtbWNvaXiLUcAGV7Xm
	 7gx5vloci4bqjEkcUQ4IHUH6og0eWiKalWhrCLWOyRB+AQLWjhc+I4HgN+iJUbWLk3Szx
	 FKS04pAO1MCWnGzdhFwBgxGy9upNz5IlrUZ1oj4Cqq7Rh/hdmwtIkQcfi6MiH+ZCXuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=nVzGWl6I;
	arc=fail smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187A1606A327
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 23:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 187A1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=nVzGWl6I
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b125371596so25200897b3.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 15:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574117; cv=none;
        d=google.com; s=arc-20260327;
        b=mIecAdn0xUD7uuNnexvqLiVoGHGbp+Hck6FmOw55M/6cLHK1MBwv+ezx107S3gEWkl
         lNLAdSajkOL5QT1ah/otEPbjDzOLlaBKPvUQ5JZRtRFUKgGiBX9WpRGge/+6JV0BHhSz
         Akeaw2U2wsR5Gduofp/YgxKHPziuIVOqUGy2xmgZoM3MALRLhBJdm0X3JnjxtFpBEKK2
         R+DF6T0s/CVa1a2oX6X2jageIUQLkKMRndNqgVnAvti0tAiPkmtQBmUXaa4MlW4mvewj
         Hll369+fztK4VcmQdFB1883W6jKcVfUbuK+nDw+IJuRF2MFIzMuPa+vlHybAVbWVkRRd
         2weQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        fh=4HYQ2YlWlcrSUOtUxuqqD0MbvD2vAbL/E+FH51tpJMc=;
        b=WWwfWpjrBicvbvpbL3FZwuUgJKfnNQSNvCwbjI0NDlUhxrbZAJ1VXNr2f7Av7lJXAp
         VKp9Llxhi7WTyUKsfBUaRpqq27Z6Mv3n5DpqKyWBGwbYxMp7kspUasZi9Uw5RCNqC1Y+
         /UFyTqZ60TT2crJXsIFGSjRc9DBMd5t8gaMFEfQRbwSj8YvJiKqQShLNILNXBPBRmiTQ
         kG85GZC7Ul96Tba/z77RPT/MUwLZjygdBfQXs42NpCbt5gqLyOS9iWHJ4TdiwvXZr1b/
         nflnhufN1aTREftWu6Fc1VgQYRXCmg5cAjyPhDDbJrO1vaXMB+QFukz05BMGy3SeHo9p
         k9cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793574117; x=1794178917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        b=nVzGWl6Ix/T3fqktC29agdSx+nhw9+1KkCo2E+r3nGEnlkYi0YDWQWcZKbN8IJSDu4
         MBaydsTTNFoMQdoqPXGsz5UQ2Wfw9GF21QdGDrbEeljKQuKKEjrBjiB06y5wHhM+nEm8
         mbw1jHlQf53yWyOYwcEcfi5NeFN6pvbR0q/l02QKIHDF5urwa0edOa9ApbA6HnMYhOll
         hYFaO8AgH/2IDzyj/ZN+G/EXtaqbcBGKAU3McsnRCQiBihI3r9uHmL5euFuWWyJROzxY
         BFVBwOhj8y40tAKAF/7koZvCgR0hrPSG/hVB5MytE3KgmxotZbHld46pa7CQa61/nU6D
         Ougg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574117; x=1794178917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        b=h3BHCwVf/5vkuZD2XVQDwiomyee4xnNmIleAykm9V6iL9nra35++d+Cpjnmlv7ZgXO
         XS2TFuNaIRPJZQa37Fj6Oj/y/4rzcXZrYHMXsUtXgYBGL5eT77PJ8yoQKVWuY5t+23Kr
         n9Aan591bOpll9RaS7ZIPcrSTVeshhbRcU1tDTWB9V1iMHruzhHltbdqMJrzOwp3Mel9
         rouSr66k1A6pe//HsUoLOYU8lzuhizUpEIffw23xq7WwKjTjCw+vH5DEg4LFRdtWgTgm
         NK2IFaRrDbfpE98ERT7z6s4i0fTEGu8eHBXK01q3lD9rFUDPUaDlr1gz+JGv7ToQdHj7
         RhVA==
X-Forwarded-Encrypted: i=1; AKwUvBxqdI1L6oTIUoPuBKej4L7nik+OHbM8FSnjeh89+mMldT1nREH8cdS7IjqT1aHgBdfQOf9Kvu5cmcBr@vger.kernel.org
X-Gm-Message-State: APuU4Z9bkwHnZGwsrv8Nu5xEgUYxb5bOkk/S+wFfJS5yR0EDg4KhYK+a
	teQ2i6lckfzOC40zJygl5rn4ztDdGMUcgR/6zF4Epf6LZdsragZxfepjKyjWC/BspoWusfiV+rQ
	SPGQQWbC9dIjoAUOJA7jDaGiYc/W//2c=
X-Gm-Gg: AYBFou2b1Vv0V4xdi8bC1EeLrLyzP+IV6DPQP4AzFnh3muQPNe+W2I9Cyb+GEWRhv4L
	ObSfLv3ZDr/Gjw9qf1kOw/7ItMe0Tjh0lWHWWX2R9Kkjo7vQ9U2pCTqcPC8DasPHt5zw4xUaFx+
	uh4z5z5gQCyt0xmCTJGSHgRHTGaakaYPBNq5bGQYJTYiEMSjHORjbw2rng+0A59hW72jRdKeiOZ
	0RQ6lwnIuks3Q60tgIkBy4AksAT0M3T3xhLGxats4fPUR5/vDjNaSJqw+dvJb1zGNiHQnjG+8pJ
	RggDqbM51Ea6ReNX9EI03T2idah1LtyO3CVdICf0sq76HEOi6++5+VWBjLGpWgdgG1+jyX6RQeC
	veKzK6+y9wkAcM1bQqXm/JaoguH71oe2xEtP4heUfH7IX/UvZaRLvcd/ebxZbuGzgumWPXA==
X-Received: by 2002:a05:690e:4084:b0:67a:86d7:b9ae with SMTP id
 956f58d0204a3-67a8d60ce47mr8913440d50.42.1793574117117; Sun, 01 Nov 2026
 15:01:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Nov 2026 00:01:46 +0100
X-Gm-Features: AclHuK_6zPYcTTvvo1ADEqHJgjW6vbl_w9ibYmytUlZi0WtkMQH9WoT0aPoNmLU
Message-ID: <CAFBinCAaV0WEsO1oNF6q1t1hLF7oeO4oEpJQY_vHXvuQbWA47w@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: rc: meson-ir: allow the receiver to wake the system
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Sun, Oct 25, 2026 at 8:23=E2=80=AFPM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The suspend callback switches the decoder off, so nothing is left to
> notice the remote and the receiver can never wake the system.
>
> When the device is a wakeup source, keep the decoder running and arm
> its interrupt as a wake interrupt instead. Boards without the
> wakeup-source property keep the existing behaviour.
>
> Tested on an S905W2 board: suspend to RAM, the power key on the remote
> resumes it.
Can you help me out with better understanding: is the firmware
involved in suspend or is this CPU core idle state suspend (meaning:
firmware is not involved)?
