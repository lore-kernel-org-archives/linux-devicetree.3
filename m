Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A82A423A66
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827024; cv=pass; b=Og8E4Y2R2QoxMm76PlEBtKNy62Wc5IAHBpkj6cp8SblqIlJ2OUzvB0H9xlXvUA24wpmqpNm837+yNjX0YKdfrsoDRzrohfONmPPU0NXrRwgAjCpqG8ptxff96Nb/vPzNrJ0hgcAdhDonML2vvUe9hmDM0JKj4q8FfZXBzFkkEN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827024; c=relaxed/simple;
	bh=ZNJUk2nRrzObEtviaRtuFIa7gMgn0ltnoTKLXgd9BRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O//mTBv8Mk6QVN2bLoyBmz8zEMWDBp+qEP1ov0MS4wgJr5MYGhAuGWwZ+LoZAiCvR+OQidv0izh6n3NVw5z4/0SQ9gPgt9ESWPnFVwFzsXyfRpRA7jN45F7c5Fm8dugbvbx46pc0Dln9RhfIwea98P8992InT4UlCgka6+0QnVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LT3LVSRw; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LT3LVSRw"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso501799666b.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785827021; cv=none;
        d=google.com; s=arc-20260327;
        b=evdotqzTvyg/GRShvVSL4XD6dj5kU6znh5f8P/Uh5eldTaCzKyaPmDZKXqirULc6KY
         RtIH+AEx/HqYiiu4wKthUXv6/0zNjZv2kwQBPDNDCWYSG3fZ16FoDWntzPAcDkAMXYUx
         To8/gQgq58TYdaii/HNIFM0f0iEONYLjvqdtQSxXAx8DIIm3UwkdQssP54/QQfnfgYZl
         V5v3rgRqgSW/l0p5Focn1uzFnOEl3rWWUitkXjfrRbVhlyZQZqubqYXnL+xhxa3sGIFr
         Nv+tqeAEoC5ZrYeYMAqS8TfQvf0fFceWBDkr6eMZ67Ru1kMGwafIaRlQWUh53vhvkQ+O
         a6uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZNJUk2nRrzObEtviaRtuFIa7gMgn0ltnoTKLXgd9BRI=;
        fh=NhTuJRjwo5OW1Yi70/yxzH6J2dgqMErf16c20fswDhA=;
        b=WgGEVo9c3rO1lh5NHw/TBi9WZqpfZ7iKkS+g6FQ8EwAOwdrz2gyFSLcJYFE9C1xSns
         mgVLbfTdq/G4kdQdB5qAeSCwuG0EDPpyGUEEjEwNr2xu/PgG/UUc3IRXSyXeG+lyATVT
         KEA6jxC2gO9wF2HRinpjzLGeETbSE4K+tdGPCbwc8gxt+9U+NxG553aK6VIlNx5DzPcN
         z7IyUIYF4fVTxxNtuDbhzfSRmSlCzIWjaUSAc7sOrh4IdQbM9KgdZ4nC0UswSabfU737
         X2iRRywtRaNk+oafYgnf0dZKLb5M4dP2bMSJ6Eo+o7prSgctYhunrEBEo+XGIRpZZEX9
         8v3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785827021; x=1786431821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZNJUk2nRrzObEtviaRtuFIa7gMgn0ltnoTKLXgd9BRI=;
        b=LT3LVSRwj3FxxasrlxM8Wt5MS08zjqoKFznF7CV8qW2SFFidsvrHF17QpCr28yeBKm
         QxX2nLlAvqzVDtSAdXnnnFYsKTeOKAt3za8op4AUEXFAjcq6SjuAwP4+j8868hMlFUns
         hT6Q6opFDUskV4+Rsd2X4B+ZaKGobGvDca/FLhnFRTd42CPS5LGPptVwhTVZo4mX9atb
         nhqA8hY/XFeyEF5ppVSKAEGGybAbwp1eXSM+4/u51kYwYegfXlBLUV3xFNdguM2QOzsv
         OtsErDKxM9yU9+DZ5jTFpa/6Htd/8SrpZYxUL9U8eWXyNIJzj+CTiuPvmtiZv13TTbk6
         +LQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827021; x=1786431821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNJUk2nRrzObEtviaRtuFIa7gMgn0ltnoTKLXgd9BRI=;
        b=ZtEfFd/kSsqT8VMVAD2QTUDIU3uzz3SHjP1+tTcCmTxmUGqvo7Y4YbJfgk+AIMDSoA
         aq86DiYMkju96NZ0lZpaoAyByYEuqT5hZDhlMZeCQgr0RLgDen9zlDQQnPqg8o0+U5rf
         6u9IpacCV/xj8MgVuy+a3z5+gBYjq+zbyeLVZl20UiR7tLQeSfPKy/xsEg2wv/BB+L6b
         LHVW2z6iDWHPJBz3jdFTkbhVYldb7UAj9/v9Neo3TSzL7lbRZbp3Zx8Ot35LA21pHhy5
         mEkmlG1vjWZIT5aSByI9oTRICxyhdwCP86HIZmUvGji2+HGu33iy8nLPVuFoNHQbe8II
         4Fxg==
X-Forwarded-Encrypted: i=1; AHgh+Rodds37BWD3w4lX4M6VSek3ndiL9a42G9xZOc9N3Sctl0r78E0krCC7OTLlzwveI1HFCllZwHZQIc2v@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7gHcw1YiGHHaa2z4i4q4aQCz2TghkQCRDW5rGJbXNpk61iTa5
	EklhIaGXP6AamIxk9f4/DEPyF8VglhSDou5y3+aHBLxe2sWKpI2yykxoBZ/PZDvVl+24qBrVq58
	4G4mN928urvxhliz2L0EE04l3Q0/Zg4E=
X-Gm-Gg: AR+sD12iz4eROe1gAowaIw3ZzbhOvv3g6aRjzOdJu/GDRpaUovy7No4YdaFpIW1bXSJ
	6/4EjBYjnmWN9JsGUn6M/NLTTYXunrSTzCHsSNL/Q9Pw17UvAZxIgmDl9s/uZBe1N1eEhg3K+O/
	5ybSu/LE9J2SHEgKIDOZ5vhkQKk/XJ0SbgzdSPj3Qd8INPohPy4L+JxQdGIuCkCZRwDAwqE2Pwd
	+osGbdmcMaiBYxMcLFzO+X5H9TEWJ760EhykWoG272bYkTHvka2xj1Lk0kp2CdQteRPiwdgc1uf
	NxfePDrHYuhoou3d6xwbNvXqrFh7Hf69svdZ+sV9yPKsng==
X-Received: by 2002:a17:907:1610:b0:c07:43ed:1b3e with SMTP id
 a640c23a62f3a-c1fe7c4b08amr1219576666b.0.1785827021226; Tue, 04 Aug 2026
 00:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803101734.270821-1-a.shimko.dev@gmail.com> <94fb1a6e-71d6-42ae-b221-cc03a820d2e0@lunn.ch>
In-Reply-To: <94fb1a6e-71d6-42ae-b221-cc03a820d2e0@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 4 Aug 2026 10:03:30 +0300
X-Gm-Features: AUfX_mzjU-s1fA2NyekVyKJC1mnZ0UCZTD8jrUkpV-OMMlFmqFov532uxYaWRGQ
Message-ID: <CAOPX746ZFCE1XwXJ1H0gEaBvdvq-4GAiPTKkT-3XvZi0n_f73A@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/3] Add DAPU Telecom DAP8211R(I) Gigabit
 Ethernet PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Aug 4, 2026 at 5:32=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:

> Is this a random example, or what you are actually using?
This is actually the configuration we're using on our
hardware.
--
Best regards,
Artem
