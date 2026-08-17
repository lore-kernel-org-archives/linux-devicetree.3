Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513203AC0DE
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003508; cv=none; b=nxkEu7WiQgPDy1PbgH+T/bemaZx+fIdytYo3O9w+VVZsN2xOkeLmeiZ7FnXW+6Cda8cbE2o7LYIg9kNVgZzTEjt7MyFG+BJDYSa+6sQzHX+5FffnKu/uTLEyPihfurNvu6XsUNTbwXK2dSepNbOulJqu+js+/AQUMNMzOarjn5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003508; c=relaxed/simple;
	bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=upPRP5d4/D4XqLdnJ98B23A+Q5HFkYYGGXgKBOAoQTTc4AKN+DTGlGhctRwfgBA6BvId6bkL94Kfhk/hbkCH3X+sopYnp3HvP/MgcV9xuDTSp4j+7oIyN0x1OZ+dxbI+bobb3asQWGSd34nRzqEA7iIGVHm+Lo0gmlGGgy7i3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwPb9UW1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwPb9UW1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2410985f8f.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003505; x=1787608305; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
        b=jwPb9UW1SX52Fv1b9fs63kDA8krQUwh3qpouH7m8doSy/473WwSy7BJNXDBj0DL1SM
         9WBypivTcJoZeWWAJx0d0/CyFRiAmqgWuPf2i5KqQsnjoDvDALp3TBiQFHtlMPmh2gUN
         /yZ+hTIvbZUP1+PBu1Y6Ag+PcN5AZgajdI9hwIT6TTugdvH8V46JTqQhklsIfMTwYdwR
         HHwscat7OX6KsfaMWb0Y1hf3i3rWEc89JbJ50if6xaRUrVGMBXxz2LNO80T2g1+mWgxa
         izvwW5U9hz47WNLCX7IyI9PlrQjqdjcxNqO7krs84/UiGx/z2WYlqQj7hN6ItvCdF2m0
         oGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003505; x=1787608305;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
        b=ByFbGM+JuwjmhnflMw/LzfVGZsh9BMonHWHERDQAzt765cRmXaXW1cLeF4xMzc5rri
         6oV386vXvm8uxx1G+7ZLLFp4t0+CGyOjnxqOg7YyRK3bDW0dWs/h8ffmyXmQp77V/DUS
         wSVE/RBmNyLRJ47+8lSEabftkiV2EvMJ3gDzhoERzetm47xGIqlHwsGetEE9MVKKOTK5
         PK0KJrCNo4Pz+8nSn93u3gbRhW+wSYfv7K9EufKR7cdRNgCl/hpnVKhKcoJcLsQf1Vrl
         e51q6vFVbQmGNZFO1kP3TSXIUC39Csh2MbQmwo32gyltSSkZuUJmIH6cCdwCaGXrJ2nB
         GMAA==
X-Forwarded-Encrypted: i=1; AHgh+RrPp7Vd0MwpVd1mv3ukv8zeQwS2vpiIVmOvioKGvWMhKqIx+kB9GgEWFjN+cDQrh47oknzYSCCVy+iC@vger.kernel.org
X-Gm-Message-State: AOJu0YzSSrzMpTIt3iyP+pmssHDvBJv7xaTozlC8aJgynQkWBYj6zDFi
	N8jzmWkr7DBXcZzpZq69p3RD7R9j8hTS8AluF1saSsHBTq0wNdkaNriCkGSZPXk3
X-Gm-Gg: AR+sD12wQpW1BkCplr2v6ksgtVfkza8r81+1+DJioU1OBfGX8PyLZZMWwZcF9moGiaf
	7ITFODN0bRBZGMEj+nP4ZR8RW6f6/T5St/s2yXRLiNK18nBuPdjPL61x8bJlucVXR6xiXUekp7s
	OoliMTrxFF4yqJ/UkQUrE6EVobx+OTXLLPiIB9Vh35+5csHcq9XUlh1JbwW8VdjAFHA7/GEoiaW
	rl4vUshT1W2dS4Hv66JLbUjtN/QoA+mfYBlwOmf7z0wicG9QPIEs1WFvugN/vUxTT6Q33cSrAYx
	S1gcCcQ0eUSIz4bxSvHDI5Jh6saG7PQcC0zRkuq/VTivm9042XFdugjeoGNqj+uUIIPDPG+tv44
	tGwiAEES6uhsizV29/Wm674P2JDj9UwT67RDP+4EJ3shiQFAeHOzZ3fNWl2m8LQfwUY6LzaJgAZ
	Y22GW5ZL1eALqoj15F3lWNn5sM2inZUxARyKNB5PhbQm8cZ0Og4a27FYSwuuOWazVRy6q2Pixmw
	1Maoly2zNVd3WHb6FqhZeTLO8VuanH/6J5WMvzfXMSlgcSPdDWbrZ8=
X-Received: by 2002:a5d:51d0:0:b0:47f:f4b9:88b7 with SMTP id ffacd0b85a97d-48160723e00mr37583370f8f.1.1787003505347;
        Mon, 17 Aug 2026 14:51:45 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm7267823f8f.31.2026.08.17.14.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:37:34 +0200
Message-Id: <DKRJKMECRUTC.125CT60ZV5WKN@gmail.com>
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>
Subject: Re: [PATCH v15 14/22] media: i2c: add Maxim GMSL2/3 serializer
 framework
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-14-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-14-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

Inside the err_revert_mode path of max_ser_update_pipe(),
max_ser_set_pipe_mode(priv, pipe, &pipe->mode) is called with pipe->mode
itself, meaning that the equality check at the top of
max_ser_set_pipe_mode() makes the revert a no-op, yet the hardware keeps
the new mode. Am I reading that right?

Kind Regards,
Artur Andrzejczak
