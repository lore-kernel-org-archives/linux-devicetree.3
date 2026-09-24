Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07C2439F98
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235392; cv=none; b=a1kwHvwQzoS5X5kTqxpZjWKaAOyEsWNqn3p4DwO/2zjagl6ZENh5dD3JS1VlcMXI3oC6K1uRkeJ9T97cER9h7UaRWiQuN7avpGx2KCH/fpQ9DqAS7DrpFF8DIku1leZYiR68PANbLExBbNo9e8+t3Ga0ulykmnoVJ987D4QtGYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235392; c=relaxed/simple;
	bh=pQGSUWP+wqeItZ/eyVbalLMbvY0OTH5QJikLeqmKP+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0/kNtUWY+2r9tzYSM3KuY61vNnLWGEaEQmANTjRbevL9/adgjdpANK67Gb+PGf8UEvwiC6c/TRTHJauAZ9/hoCFK1nq1QHPR/0z80r0+VStEReHTgof2ZGjpfgdMiVlzovdij1dOXAp4xHIXyKNa71po+oc5SZmajVNh1F1C5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUTKed+3; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUTKed+3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48436686a40so204772f8f.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235387; x=1790840187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQGSUWP+wqeItZ/eyVbalLMbvY0OTH5QJikLeqmKP+Y=;
        b=VUTKed+3WoAJcMV+RErtML7GNT7qjE81BbvqN1ZofuG4twVgjGVxop5gpK+SgqAGUe
         LKtKWNLiTl4aQHaoDokgbmyDPm+yNU4Qt3L/9a6AgRW3ASXvfd/M7nQeeCiXPSr8eka4
         a0T7HapOCEi9Q+mjv6Nmf4N3Pt2IaNPnv4vPyWgRpqtwnfCnvqp5uS6qidGlOJ0RK/ql
         Pt/SH2hOAlQ++wxOu0Sp5xDiuWsshi5DFTKDPtGSsJsUt4+piNXaHzhdW/+Eey5UfSWb
         4N1C+Dbr7UWFz0ucjpqP7xop3AianNMpqSwuuisrfqJXJ70Rh0zish0DJVwn0CQpcyuI
         y6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235387; x=1790840187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQGSUWP+wqeItZ/eyVbalLMbvY0OTH5QJikLeqmKP+Y=;
        b=fdP8Qyhs93P3iockcMsJZX2xCAF2Kq5O1uhBTIoIvRFOlOe42LOjpDSZwxQeB1BXqF
         eTqEQVccLLbkGxtqWb4iYcO9sA8ow6BOoT435dd92I9egbRyTs83uN9cgz8APk17c4X6
         eCqNAbcm54hG+UKEqXCO1+Is3dM12p2sgctaBm5HBcLeRSh9vEMZyce9nuYe4RCSb7S7
         W/jR/dAiZoHSZLoeEHIoRVlmsdolt8WNmWMGEg9pvNsRm8h3Zh3sTnIuU4Mgjk1izgu/
         TEs6MQ7OBakmt+NWG90zzx40Ft8abyM9IqHoji3KwMkd738HslMc3mC+j5EKG9v0vN5i
         66tg==
X-Forwarded-Encrypted: i=1; AKwUvBwVXYAvHU9PM6zArN01tLQyD0/Wt7t8W4bkLp77FoyFmZ3OSCxlCsYaFcTVdD3t/yR2Gce9k59y8DvA@vger.kernel.org
X-Gm-Message-State: AFuF++nVETWnexmMAqyAW/DCeotmweCnGl52tKrEtA/YxMU1v9AChXh+
	jeUa2fNsP7wqTOn9/oCeoqMEhokuoTsCakiUuMmL/zONpKmHitYkNsek
X-Gm-Gg: AYBFou0TWRvImYc24YEgsdqZrdr1JTq5iJR3/jcX5U7cT/gFhUyvMeE7GeCcOc4Jx5L
	CzembF+HcIneS4fWHkU4T/w+1Hf9W7vB9UHO6I1hVyOrIx3qgYtm20v71ln70sgAQWn4x7nN7A7
	qXzwmSczVa6ArTofPPk7SPPKuYk68F9CUAPgdSZNwjGwkpRexKco5lsCJloPqlO0Hiq8abr5487
	0Sv+ZaQ1eWwTKmvz180nywNqSRXJ1p6E3PyI6RsRUS4GFcKzYG8CNAliP10pXZ5NWaxVnKv801P
	tMSJrmr1wQ0THTk3+t27hSs5zPVkZprSYuGhQKOoDyKpYxPz8lqwiBIJEIB5m/vwn5Oqn6QnfCw
	/2vZnnKT/hU//nBAu3LsrGp67i+Yw21EO6Xeo9GCdcMNUNDjnXpQQB+9PQUSoW8VDSMAtNF37Fx
	whRWNRjKthlHIj9LJtR0p4wPCHE0Vy4gLpC5Cw7MpuK44dXK/Tu4WJZuq/tvB97yGQmEg4bu1jc
	DGFUPwd7KB+7vUZAcO34DPo0pmT/pv9VX2Ky/F/CTbapsqPZbfKo9Vwq2VFq5j7eEbKXRjf+QXe
	PCc=
X-Received: by 2002:a05:6000:25ee:b0:487:342:d145 with SMTP id ffacd0b85a97d-488716c8044mr2252224f8f.2.1790235386830;
        Thu, 24 Sep 2026 00:36:26 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B90C500C183EA9C12FF3B42.dsl.pool.telekom.hu. [2001:4c4e:1b90:c500:c183:ea9c:12ff:3b42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877970fsm12839361f8f.24.2026.09.24.00.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:36:26 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] accel/rocket: DVFS for the RK3588 NPU
Date: Thu, 24 Sep 2026 09:36:06 +0200
Message-ID: <20260924073606.45849-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAPsqS2SC1GvzALUdf2xsHZDpNjDO7BXrmzk19OYTF6YopQc8iw@mail.gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com> <9cc5365470490b4b66364e60fb614ccda7e86c6f.camel@ndufresne.ca> <CAPsqS2SC1GvzALUdf2xsHZDpNjDO7BXrmzk19OYTF6YopQc8iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 07:37:04AM +0200, Tomeu Vizoso wrote:
> I will go a bit further and recommend you to not let the LLM write any
> text at all that is to be consumed by humans. If you don't feel
> confident in your English, you can ask it to correct and improve your
> text. Or write it in your mother language and ask it to translate.

Thank you, Tomeu and Nicolas.

Yes, it is true that reading and writing in English is hard for me
(speaking is a little better than reading and writing). I understood
your message, and thank you for the advice. I have already applied
it to this reply: I wrote it in my mother language, and an LLM
translated it into English and corrected it.

In future replies I will always say when an LLM or Google has
translated my text and corrected my grammar and spelling mistakes.

Thank you, and kind regards,
Igor Paunovic
