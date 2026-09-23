Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4D053161F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173627; cv=none; b=IfgRy6w6hvmG0QdH6CficNeE42yRz6fA3ZvuyqlClt1VI5B8CqABzhBDaXZt0KDqNvzxfQSu2qdVpfc/57qxzglSxdNhrOlKY8dOVoKPdXnp9uj6JazuX67Or/doI9X9Jv/5zomKGbys3WrX34ss+A/R5b1IgkYaRyc0dTOOwO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173627; c=relaxed/simple;
	bh=qUZaB+3UwVox3QuJ6fhpHcHgvKk5qs3qiEgpgLo0ESw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRPJspLq2Wr+JUwGZdwfzYa9M1C/jVgO8XlNmwlD7t/Bly9u+k6T5iPsSamSerAfhTmhFtbO91XWVQql8BwYS+l9RtXk8Jayx4MKxxJZcClg6aLZst01zzpll9l4n0UJtcJtjU+n+Ml2SiWzkZOVtINkxfJLztXNDMpByDK0SRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4MqKN8g; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4MqKN8g"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da8so1123f8f.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790173624; x=1790778424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUZaB+3UwVox3QuJ6fhpHcHgvKk5qs3qiEgpgLo0ESw=;
        b=Y4MqKN8g4Zkx4f7x2aAkzeHbrsN6sjf58cvJIhKmyVuB/qlhHulIzDIo0/GtI7UMMW
         +S0U2LBLhwQ1Y9Z1nh4Z74Sh7FxdgrjnwnHc8gEQkmzbWtXezvvymWnTEBITSFKll/Fs
         nfgyVkjQBX5znRuvHbgwJTzm2YX6PZHYc/lpewFYmCyOdFPGgZUnf7dwHpUnteZuuWnL
         Ullysm31YfPBb4DGzn4iZP31e1ZKYPM4quysJpxAxtryR8HCCvbpzFInFE28SL9o2m+Q
         Ju8SzLwWHjSpV0TzuHotcHCIlQ9ySqUnj1IgtOI7324XlmBggwWe+qdbt+i/e3F10URM
         qw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173624; x=1790778424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUZaB+3UwVox3QuJ6fhpHcHgvKk5qs3qiEgpgLo0ESw=;
        b=UIFD8ciIbLtaCXINmcSbVVnXJkpUa9A/gwKKeZ7dhiZubBZmfWvFidZbf+AU3DxgoP
         2Cmx25IqR6+I4I7AyWtVLPOvuDvleLK0DDCB+foOa+EXWgihX4jigzG8HSz+ic4Z3nfk
         gvbcPD/ckKUuCvytHdLsVgXYgnSRXY9lej4tGD82i0tV2V223cmPQOjDxzngrcmF+Aab
         R1AhrTrtIVxrvwTDjUzi9LWSSs0Y6/T2jnjS/Mp4tyAWQWOYLJtV3uBpIkscD3g5TvPb
         +XsYvjoWPpmaWuA5nbfrCvSpJJGzzXQB97KaqCylCQ4Pla5kMIa/xL0rQ71atEPuHaFA
         disg==
X-Forwarded-Encrypted: i=1; AKwUvBwO5D78+ztk+M2vaEWNAHPvQ26aiB0IvFQi0kw8gpDCrWm+fd4oq4VnaqbaPkkw308ola2GkKUB50ey@vger.kernel.org
X-Gm-Message-State: AFuF++kWwHNGpgn5DESgODomVC+i87IPMjtgbDy+c8yMRWOdnNVgv/69
	C720fcZws+ih+DWXV/XJhI3naZOxcA+lFwS4js6tN2G4mKg490d6yqFS
X-Gm-Gg: AYBFou31EOLPKAE4tip6tGFPh+Mo7YLIgTH7m+LKXVOI4fggjsdoosY03njS4YLUu6V
	nNORQrS4i9JmXANIjkAwGHszZNA8pG3MS4v1omohqLVDSsSfxHmARsFW8R218Hc9mUkjG8Q3bCM
	ZSwSI7DP6VBTYxPSd3Y0Rd3T7vmF6VKgpCmWgNqcB0NeU8RStcF1ttjnYpj0iXcp6mla4I4vFKa
	jbTOtb9PCD4qpBaF6Gvvq0vMDvPK7Z2XFbO7gXrkwxmUrHBe+qLT9aMELRObqIK5A1g291oiGLZ
	Ku+n0YMGjr1VobxVfn5IKIlYMZxco/QsFpubczLriZ3U+KuafaZ3QROsAMdsRQwkPPCxfwueSOU
	J/BYJ0TdRAWwUcYFFCpzsdJZRYtR6SIj6PkJBT1ziK9JdAdP5yv0uuOvKyKdZKjs7rV9aub/ykL
	mjTeGOgqc6rCrXlUey5URUJIXWic+htzWoJIyXe4prU/nQlhmWIMtVphD/TqtBG2LF3R9/aalGm
	r0NWbbfWdNoMirAvxfgZryb5W2m5h4Hua5hJoO3XHcB72QiXcy72mlvaUsceP/LDHlnnza9y9aO
	FVPIqBZNlMnF5A==
X-Received: by 2002:a05:6000:481b:b0:487:1251:20fb with SMTP id ffacd0b85a97d-48867049f60mr4545566f8f.2.1790173623692;
        Wed, 23 Sep 2026 07:27:03 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F45001B67602CEDBE732F.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:1b67:602c:edbe:732f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c64dsm7388874f8f.21.2026.09.23.07.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:27:03 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] accel/rocket: add devfreq support
Date: Wed, 23 Sep 2026 16:26:24 +0200
Message-ID: <20260923142624.15791-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arPLjz0fP_b5dseJ@rock-5b-plus>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-10-royalnet026@gmail.com> <arPLjz0fP_b5dseJ@rock-5b-plus>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sidong,

On Wed, Sep 23, 2026 at 10:14:51PM +0900, Sidong Yang wrote:
> IMHO, handling rocket_devfreq_init() error as critical error to disable core is
> too much. How about just printing error for user?

Thanks for reading this far into it. Agreed: rocket_devfreq_init() runs
from the probe of the core that binds last, which need not be the core
the devfreq device hangs off, so a failure there takes down one NPU core
while the remaining cores keep running without devfreq anyway. panfrost,
lima and panthor do fail their probe at this point, but there it is the
whole device; msm_devfreq_init() only logs, as you suggest.

v3 will warn and carry on without devfreq. On that path the driver will
hold no OPP table, no OPP configuration and no runtime PM references,
the same as a board that describes no OPP table.

-EPROBE_DEFER stays fatal: npu-supply is first requested there, through
dev_pm_opp_set_config(), and swallowing a deferral would leave the board
without frequency scaling for good.

All of this is from reading the code; nothing was run for this mail.

Igor
