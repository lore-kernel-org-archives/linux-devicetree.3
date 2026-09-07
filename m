Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17585346E55
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817570; cv=none; b=Mz7gF94+n4n70ggnYtjeronRmpBRjBHrPexJrPNzXe3OyAz2QeqjKrdcr046joerP3sA+D1RXD/p0BVgSihk0a304glVZm0DyoOEasK8Ef5kKYR1dSOvtwf+/oahPQe3W12Jom6qT5z30ZtHJWY2ISryqrpK97ftMsnvlHVAhfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817570; c=relaxed/simple;
	bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Pt846hU2brvCvzG/8WS13oO/eIf4mZVhlcMVN7mVKzeNpJcoes7PmVziwubpM4P1updMtnawrNzbWo1f/BcjIzjp/YJk4pDSweGwd/ccv2w8WXBS5dBHXrQ8w/5coDvKnUSfVqWnh7wC+aBNcoxKGT4dB/lQUC5Yx7GQdYGT+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAnj/rcO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAnj/rcO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so38527775e9.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817567; x=1789422367; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
        b=fAnj/rcO80TMH8HFqrvv8EM18bPhxCk3sdYwPAKLF6fGgFJsHO9sQuudWHzoLaGtuz
         hJMenQH3yNR9cJAx9610rIwQtPX2BcSdbxcZSKVXizwBQxtMSgw6siBRJ9UtS6jme+tn
         Sp5buhngBoZr+3vzzVewIkSq8z+eqLSJb1suwCngI4JozAxhw1sSFtmZjBPZ687Ltq5S
         jAnJ7L3F4tdiSpsCA3yz4vHYbUG/PdxGhjPob2tUkXur6fC7s9Kq1wRuafLJGyjNcWU8
         sRYQEDZW/KZqtb0BNPqg/5ZHfH57TN4shs8rHSoETT0FEmdyOsOix+3+l2cZQ1xHYsuA
         wxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817567; x=1789422367;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
        b=IGtJl1hl58H4i8AYxmVNMXUZ5UoMHXY/mkaYuWcdyhQAZudLvIqlohr2SuCkYN30BZ
         dI6tZKzUN27zRMZAojX5VkEoLMv7htOIceIrTvVFpzpvQkxnAO6qv7PkwdVgZi2qYj3B
         Lgtl3XRrv7ClPqzb7eFV4BxmzFAuuqBStKHqZQ3ZuICb/8aWIia22AsmRmt87iroLGI8
         6x4rpn6Y5vtEOyc1VoRc1MO9RK0hGJx79w+FIHRhHLPPiwCMOcaaQDoGX8XLqh/CPtBG
         SntOp74XZqmp9htIqdcCl50Vl5gLZL+j+EUvFs42LbdN63IiAD/KU5fU40uY6Vkg7vo9
         OOuA==
X-Forwarded-Encrypted: i=1; AKwUvBwjYRzl/clPeMzAHLQPGcabeZJmUHtEtzZ0juoC/i4oPuJKiZGnaeCKjugfAPHBkAWJbT/YWofchhqN@vger.kernel.org
X-Gm-Message-State: AFuF++nNIrA0ijF6qNq9NOTLkkRDCRInDGEhrC2CaItlEY6wBaT8YDXW
	W6aP6HkWx55AcfHLo6Ws/fwasqCCsM/JW5BXbWY3C2yhbHlP5yvyZWIX
X-Gm-Gg: AYBFou0BgpIfI+odhdE8U/CfGM/Uob0lcvpGAkiaA2h1uGuWcKA0+XjnJYFwXWFmrER
	/X9dq1Dd7pTfegjVC4wDCl1mOsXqW8umZMX4QHE1O6gbncrbbxhOcXm8ovHxz/uDmq6XaeD8LS2
	ANXCxrCIKqTG92G1vrRIttjx2AuqkyQxdUB2FJhPeIGZELFMe1/Col/EYITEjihS5RKmUPzw8Kv
	Fvw1VZdzGE2+6nhVwvsZBQXB1HVZ8Fecl1i7tcZNdnSjDHKJ9yAl84qf2rUDN7yNcYtMAHK+sFx
	/xRgAj8H/88+STLI9xH9SB0Sm6AuoAo5C7PSZ/iD16zxMrr7q7XWuy9smUbEXO3rlyh/dvyNGBv
	iNNh2Q9cI8D03bTqG7AURtewvyem7MsWinL5kCS/GTIYPT9hg+VMWBQt8zT7erdUdoiuCdX7Asr
	/Q1RwId0K5/52CHU+6PZjqDbTaYRXYv9wxNH3Tua/833YpLvUOi88uM0rJg+Ps/HPON4lP0HfUU
	lXMMT8tq0bWhkL5HB5+PZeLRKqViUUD+b/zYWuQbHgycFV9uN9l
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49cf7f3d239mr547293245e9.0.1788817567046;
        Mon, 07 Sep 2026 14:46:07 -0700 (PDT)
Received: from localhost (178.43.76.160.ipv4.supernova.orange.pl. [178.43.76.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm204268135e9.1.2026.09.07.14.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 23:33:35 +0200
Message-Id: <DL9EN09H9IUW.12C25XA0HVUXE@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>,
 "Vivekananda Dayananda" <vivekana@amd.com>, "Cory Keitz"
 <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
In-Reply-To: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>

Hi Dumitru,

Went through v16 and checked points I raised on v15.
All of them have been addressed.

Kind Regards,
Artur Andrzejczak

