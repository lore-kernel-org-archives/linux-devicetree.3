Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601990;
	b=Adsfk9RY4z+OtMBoZEFyVxP7qC/bN9X9e8YjSiKlPOfLik0rwstK8bUl9+/JWgH+egBu
	 Yvc4srFloSzwFIJPdysnF+jxD0T9laA8IwHaND+TFYLNdo7e++PNZeIk54rQ7GC+xw0Hr
	 aYRmW9DXLbx8pefKzpHAOD+o05MOMG+GjsWnjavX6U2Zb9BuEni0EsegVtKOTlJOYalav
	 HlZ0q8rdjGgQDywDDUivQ/oK30G0RpbulVXycq2oxVtl4Or7t9fTs2jfZuebkuGV+p7kz
	 HjdI9TyAveaGOUPL1+J1aI+cDvSV2uBEFK35+RkUJXzgRa0QI0doVs1uTwqrHbME7mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
	b=W4b2hkduppqotYXt/iTnCXwp4/vwJqVASGdLs8PgOoDVUclbtACbr+kjbyTVz8hZ9G2d
	 SRoI5LFB25ooIvelFERS01GeI1qwyjefgRNGiQ/rs6F9GTKQGp0820EZyiUk9UpcxlFma
	 23qiJum/+3XviDgwr5AGXMiK1/cEBXutirY2No1VY9QfW2namN2ixJnsKqMChgFDyT7jA
	 12umLJj4miSsKtrJsh7Y7PMdREkn0Cvm6w3m141GXQ0SRrjiLE3NkzhxHdmmiStrYHJyh
	 +ieuMSFpTORn+gfrjkWkH7+xa3bIQHbhsh17FJjRn/jirnuc46CA+jCo975XCrtn+8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLp7NZCm;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036B606A33B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6036B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLp7NZCm
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso220355a91.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601990; x=1795206790; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
        b=ZLp7NZCmQWAAnZ02+wYgFgtbHoC30BCdKnKTCxTln8KLpmiuRrFaIwdwJYQqRVA7g4
         3cT3k7GD/iqJcSTBNWoEZwtTAoHK3HMcq8gcZgA/8eemkhVFrf80PhgUm4gLWvpYA6S4
         oaAQj+fTjki9zESLABnYD15O/9hOmzp6KvYeEMjVNy9QiAqZfcYHfbTd6mUj7PnYHinq
         Oa4m9icOmpJ9ZnAvvgLh3jj1bShZ2E1R0M4jEqBLK5gHb60u7YPmoCRaxKsaspFN5wSE
         c/j/3fPOsOh1OavfHx1WW1EBmwMagB7r15vwyz09Eb75/4Mi6DyXjdfvsMVr9CgseSOL
         FTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601990; x=1795206790;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
        b=kdkY4RjeJ8LuSMN4GxAmhAF/xh0tUw9N6ALUVk2SkUYewcoXLtF1gIWvFYLi2DUnBp
         ty2XoSkIokLCdwHQzIld0nXDmDBWaeu/gIiG7Jg8XiTJg0qTxSEDVU9r6ZEhwMzb0olU
         5VO3JdNNZX4Bodlj97pvZFno4+4aiwflt6daZ1ksC14xMksdpVz55gRtIRUbueLDaZJw
         DHDXpBqmBSSa/JDKff67FgzLn+OasmqqW+Z3JB67Yon6TBdixBDGZrZBFmKBH8eMQuml
         nzloSmlHC6CISfIYeP6rlfv/nUFuKr993KAMi2JHnJpiMDmcQl453TRdNmoXD9MESYtF
         t57Q==
X-Forwarded-Encrypted: i=1; AL+hErHkLGNVZzcVRZMMdF/6inamSXOHk3qzYjP4m3VX0XsCr53lMOnJ5ze8GKI5R87CApBbtC3fde+nrI+B@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZZrGGkMcgNEYpMJkuAAGbEhtghop4uhryUdoPqO9cEAsWIEMC
	m+TBEarSh75XamhOj0DZpS2uyUOABL9kVdjnbgnQ8VwB65So8LFc0Ui6
X-Gm-Gg: AYBFou2+O95OBH1OvfhAPjuwx4ulFV8Fwicf2WzTm0MbE2SnC37HTh/79kFvr2UY+WU
	t89hN3+CZ8yExFsZIOtCoAbgvYLZG/NGfFHq2aJvPAl9ye+EvhH5b/JJAASnP/LWkUZyQ3ah4Ek
	JpmaYnXkcCF9JCiX0vz9++0gHAIBWHPePBlCRVG2w6XqUb/ozo+Fukyvz/4nyJBetMbsVPiqQwn
	hDqEJoFho9Wl260wBUnABJOR+9kDElasvv5bThTuj6kwz9lDyDxLgb4URLMubHxSNHt+0X9+cK8
	titc0RqvCi/0/d9QagplDHxmhVA3aKKjq3gibckA0KtA2M6ThjnEx4QMvsV2F/I7Xf3mqNsmRU1
	oBMv0HO4lb7/wuQSZmLAK2USy/1eR9R5ClylbgrbHrK8YSMoBaDQObjd/uiw0BMqJ8m4DLVqiQJ
	9YHd7PPEyZqsTCWZfrZ4BOP1W3nIXac1GAA3J9tb8qIomoGWixCSm/U7+zW5GgqoPkP6WQT2VtZ
	mKMJX78+p+8Zi6nOaAocgpEqLrXqorIBYC8TIWioSKAG2dnVFi/IWfqyqOSzW1WXAthMosZCNHO
	Imu6HHOXQIAJ84KH3axmPTths4LYL0s8adsmF1lLMR5mFyCoPSYGjVXmAbB6/pHAXF0hwxMsj9p
	NLklU9guoqNtO5p2IGMWotx/3m1A=
X-Received: by 2002:a17:90b:4d05:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b1b05aabb5mr4604273a91.0.1794601989766;
        Fri, 13 Nov 2026 12:33:09 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm11168256a91.9.2026.11.13.12.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:09 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>,
 Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH RFC 00/12] media: rockchip: Add a VEPU580 stateless
 H.264/HEVC encoder driver for the RK3588
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
Date: Fri, 13 Nov 2026 20:33:08 -0000
Message-ID: <179460198852.187691.10732168634380090377@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

I'm withdrawing this RFC; please don't review it. It depends on my
H.264 follow-ups RFC, which I have dropped. The cover also should have
said that Detlev is already writing a driver for this block, as Nicolas
explained in the VEPU510 thread it links; I don't want to push a second
uAPI for the same hardware.

Detlev, three things from the bring-up on an Orange Pi 5, in case they
save you time:

- HEVC wider than 4096 came out corrupted with the external line buffer
  (H.264 is fine with it, tested to 16384x2048). Tile columns of at most
  4096, one hardware pass each, as MPP does, work (tested to 16384x2048
  and 8192x4320).
- MPP's "TU depth 1" is max_transform_hierarchy_depth_inter/intra = 0
  in the SPS. With 1, decoders misparse the residual.
- Two streams, one per core, with both cores in one IOMMU domain and no
  dual-core handshake, ran at about twice the single-stream rate with
  the same output as single-stream runs.

Arun
