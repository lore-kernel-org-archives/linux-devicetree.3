Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4493B9956
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003519; cv=none; b=TNH0Ae32nCHJGSzBR+lgDBG7yh/hrPqzufnI1F6Fk34+98kOD1ih7MkhorlMkFcuVZaSMGjQgvU5aFfWBTiV4PenRwMfDvrL1Vx9T9RZf2swy5CwpY4ezLNDpkj+3alUfX35L2as7VjZW4OIdhPSgjeWTyaR/8ZY2H37ccaAJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003519; c=relaxed/simple;
	bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kMT8Qb+R7oK5nj1eGrGnfiqo1vMwQsbNlYnv9wY9ftWGkWNtyFOVFZ9WGrtsCoEohMULXrcMNypWUfNUr/m1QVcm86vQRVEc72InKEcuzrAhnQurhIgMUfOoIKeJLlDZXd7Js+G1uGuJOMgS/IP4Xz6bOzdRi5/3Btq6it7creY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgqCGRcH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgqCGRcH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so36995805e9.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003513; x=1787608313; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
        b=FgqCGRcHH9gMgXgzNRGLOMDqAN6BUbNQyL79vnhPflelKoUO9vKhwhQPhQGHO//Bl9
         9SOZLwynKnanaKNhJ+iGvh0BW7bncCmhu9HwE5CB7qAq61wxFmYtZnPCM6mrRM/IFjcq
         zCj0s0YSIdMoG/XPJynktk1hb1wnb0Q0L1mhfdrxaMQimKtiKj5/vVLtxr0vpvmodh4G
         zi1nUU9kkGeUcclauZvj15LEpykYNufMdU+RGiAfpNImeICzEqd30hXai0q2XfFX19Pz
         3IO96DHmuDqSEzmo0cmvnlX313f9NE8nwRJ7l2Av2r36mqU/cbiyq0lHGYSdW6e/KPk9
         O4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003513; x=1787608313;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
        b=oAa6kniCrb56IYRPciThmW4+hLOJ4pROF3fu1ntsgopfe5uZJdZSfR3djLcqWWyDQb
         fy6TKTLw4bZQQAbKZZNNlCFeAjdnINV9xXh0CjE64jh3GdzKqPWkLR+jkdis0YmS40VS
         CTY+bG0R91iwknW/dPKJ8g5+jsXBidOimsfd5qErCQoh4rbum3MdTS19tj7oB0Vs4uiz
         HtOfWKUIqeyZ06fg6M7lTwzIjkULQOyt/eRNiq8xpTvA1HY/Ufwx933Bb42+CwXfrlvw
         ymyvWzIF2JPMCZmeABD0msj46952spCAssBTDC4vLaJuA7T2UN9RSWKEadorPgcgqWbT
         DLyA==
X-Forwarded-Encrypted: i=1; AHgh+Rqk4TRfk3KwkqE1csLI229CVy85QwEnvoHbutwdq1YTjgmECyHOCzH7/V6DXOqrXRuG1Mfq0Rb+hlCP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8sDF6XFI0ZJtUkjwo2JCZjoHLKjkkAskWIWK1UU22jRZ4H22M
	CoP254OmvRUTg2ChsxuphM6SQsaNWdGuzwWKUENdUqrA6ESRMs46m27m
X-Gm-Gg: AR+sD12s0AwfEkLWx43dUOWG5LOQfY9dTsFPjWqBLgR5PaZOQCHkXvVSUU9rus+ohQZ
	6zI2vuRjKm0aeFlPGSklbXghWq4afbpH1bZRKWe5hpsuSxjAMvLs35WYCqSp7PFKhRjQ5d4vYAF
	zdkhi31jgArkjxqxCld5SeWj/Kh4XLon13qrDB0uDt5S/SskO4QR6bdMs+qjjBbjGilrmFi7c2L
	VLrpadN/3nez+Toytz5d6zS6Zrym4HYDjED60cYuSwkGgJjgFiXl99XkJtk9s7bV7PlBoaftz3I
	DEbqPwkGf+E6lqBGRag6ONRTbVcn4n1GPYc0FKtdicQ5cE/BJL7gfUa4oCDju2yQf81OOHyGJ5P
	eI6yIDywumEVieaSkhZmNkyHdZSl+jSDCyliDp/u9OK9tsPxaXR5eWUnNIm7WV3B4r5rYexmmud
	XIvoDv+lER5u+XMQJruN/MrOwcQMhm/hzri4rxpS7RZHO1m8kdr4BikX9D66SMiQjx1oGnKF8pu
	XsmcZhSBTZcmi+FsDBFh4uHu3SpO8URNK96lNTUSPjAzv6BjP3vkugJfzPA70rUxRI=
X-Received: by 2002:a05:600c:1546:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-49987974700mr415672585e9.14.1787003512692;
        Mon, 17 Aug 2026 14:51:52 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a31572sm7076978f8f.5.2026.08.17.14.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:41:07 +0200
Message-Id: <DKRJNC8R41H4.1TJ6IRW0XR5XP@gmail.com>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Cosmin Tanislav"
 <demonsingur@gmail.com>, "Vivekananda Dayananda" <vivekana@amd.com>, "Cory
 Keitz" <ckeitz@amazon.com>
Subject: Re: [PATCH v15 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

Thanks for the patches, good to see the GMSL support integrated into a
common framework.

Small note: patch 16 adds a second config VIDEO_MAX96717 and a second
max96717.o. The old driver is only removed in patch 21. One symbol then
builds two max96717.o objects, which scripts/modules-check.sh rejects.
Won't allmodconfig bisection be broken for patches 16..20? Both drivers
also match maxim,max96717f in that window. The same overlap exists for
maxim,max96712 (staging driver vs the new max96724 one, patches 17..19)
and maxim,max96714f (18..21), where probing becomes order-dependent. Can
the removals be reordered so that these windows close?

Kind Regards,
Artur Andrzejczak
