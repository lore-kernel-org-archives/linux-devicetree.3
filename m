Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794172016;
	b=hy+26SiKIyX8FIcFFi9/a4mTQbEgjKPConNKJhbJjhxnM723xeFUIUQohMHP74T6Urj+
	 ShwpN2HSZLSAmsPfoLRi2vT6lB9hFfNaDoCfGBx+fZzPW/Zg8jSnuaTRlj7SsAXhlKX0N
	 m6LADYtYM41RkMWP/SVMIdCewNQqtcWLrPl6vT3xO09mCQMkg32ygkKiEl/sc2Dx3DGKJ
	 ssYA+3YtaYH4bvZ3gWIefEmcPt+mDnpltJkn+AV0LqO96PZ/njBc53Ak3XRx9WZ+Kiv10
	 FTJXsDgLdS1X3PUE8mSzyR75XJsnYHUyBFaRxxTajivkkZ5LaNBaSdG8UhG7DAiBCDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
	b=c9Vb+gY1OWTj1tSpIvJUahGhuHBXY0FuuvuEakHEO9aZJhPx2fEUfEVzYvV8Zp9gTq6Y
	 nAl9vlW2rUf/cch3TVWTa+od7gtlXUYByIGFGQYtoWGR2B9t/0vgLGbvwg0TRUKKyT/Xd
	 O3tDiqcSW9RMIqJFpC8shDHMYtrm9jJ3/dSbWT2klXo+E44+R8JVFM2ZiNAfs5CUC+I2g
	 ivtG4tfxF5xj7QHNadulU2/Ey921J+0z2Kdjv6gf/qiltDv/mSQBv+P9bOfcu2oE6IZfz
	 B8zyMqVn0MfTZkkoVEu6T37reQEuB1E3GP0AeTofs9nFBR1K9oOjweBgLZLj9L8MbJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="V85/hf9u";
	arc=fail smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEEF606A326
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FEEF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=V85/hf9u
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67be4686827so152210d50.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172015; cv=none;
        d=google.com; s=arc-20260327;
        b=LjSi2GJ36yNG5iC1/JM/XJLnOfJy8FRdorkfrVHo4/JdUSv/XoBoL5m6Z/Vhg1bOUY
         LUEaSd8+pjzXxx19vJpyyc/1niSWg6DJ5fp7rx73tWez2TFggcrXP9z0QeitrXGZK0Rz
         BChhiUkHBTvUqu8U/OjBrWcawKUCV9fAcb1intRJsua24pDOUHDmdZA+OORuTZTzR9+V
         G7gH9VWwqWjgvM7VHYOtPCvOM6DFUsNqKW7yOOed6gPbHFEso9aHpK1jpIpoDtEgdj5B
         GN8Z9uqsBOxrrd+qWZC5RR6cEGm7jA7XEpDWJ7sDAOkMCS51ykwWgT4H90GtHdxSwaZB
         jADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
        fh=nEnfvPypF25xrafdvv8ZjoVP/1/lvPmStZmZU4V/da8=;
        b=M+YmabQ9Uo4sEqhNwiuQf5Yo7UdAAChIT2RBho6PqqziCCdSIIe8zHTdbii3YRm29w
         lc+1JbOdVqZg5TnbuB05RDs2KQYo0vpjRsz5bFWvFYxXrWoK2xKF7d3L02cLpolhcIT/
         sWZoT0lPOmuUqMu9GXg/VJm95agdK6lSQniw072of4KGecm9dzvEm5eK9/icqKy5QLlA
         nas9QwBbiknR1Du0F8xcWev+w+0dgtqZK0FzBAmi+cSGQI8cXZ/aqFBsHL0isD9S1cWe
         LPhgZ7ag3tWcZtXch92ZpuSEgYpGEFDoYygt4mZ/tHa+PLLTruqLRkmdoQjeIYjd8B2N
         vPjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172015; x=1794776815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
        b=V85/hf9u90ghx3A7sxECxUZhOaH7CbQg4qo/SSPFUlDdIJmrmpQt/ivx824AWCa2m7
         WefO5cXfAq7GVNpV/oYsMnkWobgtB1pH3jf8nJZECc5zkP2wsCB/shZ5JXAXF96tVDL8
         YPA26M3Y3aGoDk1DplbJb7fRi+wdme+tC1Zk+t0Og3Y6AAlS8NX4P5S+ktkwAv4Yx56F
         5yVmYZ3GAuFS/41zMprN9oP1IhPKAOgHhkbXpLVFKPf1XJGGLNFf9kf+q4TZea+xuzqj
         1fpihBNTIFn4MXblf82TptOvEugj8jT1q1hT4vxIV7Q8vvIrbmEFxotXc9tDIXOeP1Hx
         wnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172015; x=1794776815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
        b=WWAK9FH+QM7YGCz65DIMQX1CwlLb+36nQHTpIb9nELMcuYGBi+F+B5CqfJGZUWYVq5
         vEar3MwCQP2YJ1Tx7yDgwAW8R37pa+KfODIbmJL7nA6fzsjZ35m/DBQqqm0cz/rNJpgl
         K4YZBLqJOnSB3Av4H2YdUJL0rhkKpDWMXpZbBYY/dPdpBHBrMpC53NrqhMO1X0v9oF3N
         O20MfLCTiZxt5DugX1TZbwiOH67VAK8YPMJjeHIPkbBYnLo/0ysSjLFH6tVEnYUo3Au+
         2DHCDsO9WXevyu8YjojyF0MLtjEQSgORgodx46ZqEmuRinn0ugkTLuym4+Y5P0y9+x8M
         YwIA==
X-Forwarded-Encrypted: i=1; AL+hErGaYSrif8m8Ki6bud2p8f0MqXo1Omh1TuECOunbA7Dr16wZ5ymz6Ko1L/rTCmfls4DyosfCygbcMLEq@vger.kernel.org
X-Gm-Message-State: APuU4Z+/I8hti2o0fLbkANb2NLP1LpOvbkiBwaPavtg4256PYSBGW96T
	ri5wlFZ4hY1g9Mecy66Tojg6oRy9La4eu8v20IMfHzJqXw4l4RLsLExTxmUTkNCjpCxoO7FJj52
	Vo2MtWN6jvRLE5CjHk3o7TnxM6bcLRJM=
X-Gm-Gg: AYBFou04I1tkyhMUnFAalEDIaTMX0G8V7qPwq06rzQuMuyowi+ytvm/VWWSj4VsD6lN
	x1fRoG0FSDP8pKxr/IYe9GEuPBm5TjUlJ+ZqgSDmd4MQ4WgjsFoi9473lGoBNzFyDqdXckiOcSU
	lKPxPmjkH7lHdzvA7u8P2hXiVluHUlwY4F+wfohvB3KKtRPsat+L/My10a9btGUDSYUP6NC9wuY
	BJ/EqUM5CmxfLpomzwn9fw2nJ7DYZRcPCe7V66PK1gZpWHTkXemiyBlZfLSwBsKaPx9FHQ3rvOe
	FcNbKq8mMqV1xQ9gg7n/4geeOdTD1uOftX/X61M9vfDcYAfRppUPssZzkVLpeOwBuGguacqRqq5
	atuLASUyLXXZjGhSlvIj/pM1eLFn7YMLOHW5OivqbrtJc2i6Y2EYvzqdJoA8gx33q01BUtg==
X-Received: by 2002:a05:690e:4084:b0:67c:307:205f with SMTP id
 956f58d0204a3-67c3d9bdaffmr1517575d50.50.1794172015392; Sun, 08 Nov 2026
 13:06:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at> <20261106101913.46664-4-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101913.46664-4-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:06:44 +0100
X-Gm-Features: AclHuK-74c2fIbgObwWVEcBBZUrlkOFXR6g67QOovSh9WdTOcreJmeRwgf3g9rg
Message-ID: <CAFBinCDKUmA8UPL86znCo1XwvDrwcvDsO9ZWgs1KkWSA9kZxcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] thermal/drivers/amlogic: do not log the secure
 monitor deferral as an error
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:19=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The thermal sensor usually probes before the secure monitor, so the
> first attempt always defers and logs "Failed to get secure monitor
> firmware" as an error on every boot, although the second attempt
> succeeds. Use dev_err_probe(), which records the reason for the
> deferral instead of logging it.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
