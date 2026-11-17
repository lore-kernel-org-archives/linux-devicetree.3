Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794897693;
	b=ydkPIE9YX9ZIRgIYIEhWg3DGVEq7pswiBg3UCcs6BZkZZg2XWfednz570WcX6AFt977K
	 PiuEopBjDaxmupuQKdnACKhi4tzmEMnVzcZ4CvW+Zsf6WpiGp7nv3TT046jNx7RWkqny9
	 7nzAicA9TpMTmGefQiQ515crGf75Di8EUHqvuq33NMo9WYsKHkHMq4qECRi/GNHxIRwzS
	 MRpLK/s3iSlUBX5DcdiNKCuOVc6iQ3ybXR/jvyXdD31ufh+wB6QIB5TzsZTOhEdODg2lD
	 /bqwmaHu55IAN8kfLAM6vKUS0OSIi99ll/V8BWuoDlrbhsvM4dS4BQo32+hqEO9j5Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
	b=TbvpxO1eACeS3PuYLdn3YK7MVK2JDI3Fk9WaKYS++YimGbAZAnajxYI/KXK9qn/PQSF5
	 ivkbob2BdCWpbRTe2KTr/2EHcxP4ixrcs/qWBZz73ymB18sH8/QBxZ8Q2B6YyXRpWoa+x
	 rmXwHUsBt5jCo60PyySh3SscD5ULP4hKlillWJ/euV5t7h/QdkHrstdo6IDt+F94SJpyb
	 4OExuU+m18gnsuPuuTMPg+6jIZ7OmaMn9eY9kBPSs26VT+YSuI+Ofxivp8m5iUV3d1bnJ
	 b6rJv0G3f8UfAPnJlmF9HFK5nlmNl/AiDzB5nrcJKc+a5tvTUzMXlW1QbIgS8H89VFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwtH6Nvl;
	arc=fail smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6AD606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A6AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwtH6Nvl
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b5869223e9so737131a12.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897692; cv=none;
        d=google.com; s=arc-20260327;
        b=plCq618+iyGxL5JpRWODcsBOxhcoE6YComRCdRwXD1EaBitxq3YOsZE8O0lDkbra2y
         a6SSX6CT41WHr9pMI9YS2SUO2JIctIZqIc3gISx20i70NmnlsKaBv0QdBjFucuPXvQ21
         vo/6F+cxWjvYhEiYzCRIQ+6zLD88j1aw8ZDJQjDYktvY+9BMUEJZhDEoMqeWhY1b+GTx
         iGudO6RzVxeayVZZhmX3LG5ckGdaxzNU3q8F1TmzjyXEt5/iBO0PTUjhfe8Wbt9tL9Zn
         HZ59/bPMNU5aaA/XUDEITIgzIltp5e7C5xzFfbOmA2w2Q4bYalipmt9KUB40F38+T6Lw
         8tag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
        fh=Mdw8TdHMwaJSuUQ5WuTX17vKpw6uJb0MlUWBkJWwYFk=;
        b=TpMlTtQ5D4HukLh7EbHLn+gsbd/XomVJpD6ORfQm0eGMfjEY/OhR2uKbyfRI/DRWtb
         OUi2mc0qTkkh0TBBJqsHTE0D2+Mvm1nh2fjuGoEgNkghGGZ0K2ajOdM8YC9QRLX9N2ZC
         1IHDmn3KaW+8nVq1wsL0eIUQQ6vsKEaeXRoOFxt0k1rJy9qoTh180bXuaGPP5/ZlSju+
         FZZquETgmuJRUe5h4MA4lBPBiRYNoVtjTPQ94Y3zpfTw3NyCQExG3eEPb9vvreU1XbDV
         v2267fV5OFjL9oa1qgxY7z/LN2NjuH/y0rVzI5ySxue7auAT43X4xHm9FW9vhZXDRiIR
         aNaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897692; x=1795502492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
        b=ZwtH6NvlFH+reQeUwmv7ZyE7ux3rBWYYiAbBw5fHJ20jIql00C5yxzh3slRgi+5t5j
         BYnivMmvhtboJ+FCyCvz0rMFpj0YtCPchM/G1bpXQ7reRYowOjVeNTUqgN4SjT+WX7Pb
         qnIB9RB0wdD7ZMq/OcM5oZDb2m1y6ZD4SlFah+bZ+a31T6wTJmhwA7sfhtmyeRnPKSaz
         C6/kSNCvxslOvPsMfSCHkIB3FRjnZPFxljRy/E2/GFk/Li1zZeEyI7eQFTsPHR1Bl+mD
         +2Ny3VDtFOOa8dEd2KhBW/f+RVpJAm/fvKNBd4PmMqZN3HpOnOSdn8rMF0fUcOd5O24C
         83VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897692; x=1795502492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
        b=zU7tHx69ZWPcyo8mFhNfO9HOXPFVNV3/1hmrx7mpKiFFwvxqr+PZxOeuPcTfTXPnHp
         NwbFTdEBUEvL4W2XqbtoRxsM0TwY9B6H5KpoSXaqzUx3MFGY/RzE6YIrPqL03bp3ujiJ
         EoleFJYYSdb8FATX2T3zyf3m6eYZyRA7Pznak0MGlma4rmoCAbQvSsNqC1O2MZItEFn7
         KO0N1hfu+3jynpAhtqQCzNbRPExnQfa85c1QJmRPcMt21F+wQGFaI6IHVf4V5O9VNGN4
         OUrJg3cUa9OtPMQmpYwqqkWxdYVvtmb9C/z9BmuT3N79Rsj2QwXiTzSJShrB41pVW4ZB
         J2wQ==
X-Forwarded-Encrypted: i=1; AL+hErETrfEYX8z8FryQ8B5jR/2GZRrW2juzz4SUel2j4qqFcPNnfyAciflaD+QBYKUJxtc7OfJPjraKZAVh@vger.kernel.org
X-Gm-Message-State: APuU4Z/OEQf40pOLueybLz1cCZn1/lhNM+jARJhfVg4xqwSsO/iDV4Xj
	kZHHuY2xyPzP0RrvmOUSuJi4J11YwC8dj9BV6/bxQ6NkTAfvs1NQPs76OVPh/d7SMDpenKjGZl1
	jwAgTYZkdIsyFLFdg+oUqiAo4ppkvg0s=
X-Gm-Gg: AYBFou2Kl2sU9DyYFIKzCqDKqAlPTAKjLR0IF5wTOXeZtQEcye+VU8tAetv5wGTjlwf
	PBWVTjj14aW+Gkg7xYU5r+ES8MyuLl1ltkfDgfTud3HF4TJIXfTxXxzIBqbLSvVVqICJv+vXqSL
	NPDH6/+S44Gq2wrKekMPGu5Mxlaz1dZytxkVDO2aWwI5ckKbzJGV3O6t9Swx7qJ6I6oeLzoDQGD
	+MO3nDTDS68i+BQogHRvEfDgkx0Dk+RR4SpNOFK12J5HJQ5/PJMHtuZiTwDqHLSYpthrz5wkoba
	TT1VXzLNhBymHel3kOmlAnZM98KH5Yfu0c39M8LiE5D6cbaETxaxCeJD0v18dHa+dbMuwoK7TDA
	T7rcN1MY/TU8JZB1Ea5qVOEcTs3JUViiH8iO+ZM9gPfi4xEcfi7GXpsr8Psai+dEStqpkR3Y=
X-Received: by 2002:aa7:dcc8:0:b0:6b1:b5b8:b695 with SMTP id
 4fb4d7f45d1cf-6b7c05c2ab6mr10001732a12.0.1794897691319; Mon, 16 Nov 2026
 22:41:31 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com> <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
 <CAPwA33JHxsd=nr9F9_KFKWPx+HGaR8P3ee7hxMc8XCS6QY46gw@mail.gmail.com> <0d837fe2-e192-4fc6-a2e5-c23df40684ab@collabora.com>
In-Reply-To: <0d837fe2-e192-4fc6-a2e5-c23df40684ab@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Tue, 17 Nov 2026 14:41:19 +0800
X-Gm-Features: AclHuK9K0tynceSVuGQK7zRApbKLpPj305E_NQui8VbqIokOScWH3FFiT-Y5p9Q
Message-ID: <CAPwA33LgQqQSnn3vUOQF2wTUiqP2QROKfUpsASJZqjJP6WDi7A@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On 11/16/26 11:00, Michael Riesch wrote:
> Still what we discussed makes sense, so let us do some refactoring in a
> later series.

As discussed, I plan to add the tx_ prefix to the PLL helpers in 6/9.

I also noticed that struct samsung_mipi_phy holds phy and lanes, which
TX and RX both use, but also the RX-only hs* fields added in 8/9, while
the TX-only PLL state stays in struct samsung_mipi_dcphy.

I am thinking about the following:

1) One struct per direction:

struct samsung_mipi_phy_tx {
  struct phy *phy;
  unsigned int lanes;
  struct reset_control *m_phy_rst;
  bool legacy_mismatch;
  struct { ... } pll;
};

struct samsung_mipi_phy_rx {
  struct phy *phy;
  unsigned int lanes;
  struct reset_control *s_phy_rst;
  unsigned long long hs_clk_rate;
  u16 hsfreq_cfg;
};

2) Keep only phy and lanes in struct samsung_mipi_phy, and move the hs*
fields to struct samsung_mipi_dcphy, next to the PLL state:

struct samsung_mipi_dcphy {
  ...
  struct samsung_mipi_phy tx;
  struct samsung_mipi_phy rx;
  ...
  struct { ... } pll;
  unsigned long long rx_hs_clk_rate;
  u16 rx_hsfreq_cfg;
};

Option 1 changes 6/9 to 8/9, option 2 only 8/9. Which one would be more
convenient for your future work?

Thanks,
Jason
