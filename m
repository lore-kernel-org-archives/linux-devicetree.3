Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460949;
	b=t3wjjz22ALOQJJkkoRa0YRcQiQiFkUx/e7x7NXUUyjsVOBNxiOjq1RzOeYqa0HeHZAsS
	 Gr514q64lxqH02SosN24piwQTijUpwgToaaky6dfpDlksSMEEJVwegl9wOmaNvJy9L1Vu
	 CAysPiBl+gE9vAPjxcDpuPkPSX/zy3HBpewmXLereSK+VtngguOzH1KyyMsxlm7rTC5HQ
	 DrHUh4gmT1BKsHUCOzf7YQEYi8CAEQ3XqfkEDGGSaI70ZdL3LPs7e9HCm/YhAO9uU5Z/P
	 I2aQBS6K4jhdmoXMQZKvtl8QgZuX+GC9FEeeLaLrsVk0NhaBT/YxhYmafv1TQWFM/MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hXmxFeoTBX/tQ++ntzQj/is3shY2/2htZh6VSebwwAc=;
	b=H0B5zscH2J8EXXlaqYyZMci/qcIsBCCVQHJrsyIXrgKV5cLF2PAOZrlscKKgFse5HJkT
	 2BDkkSvBW2VTDfg52+Y0bEH5KxVHSw94eDWnouUavtFOCrN84jlp/j9WEre6mxfG5ea+i
	 vr8157buAujILcNvpPkLahfiehaZ4oX7ZFkO1Rw6jLNhpZbI5N8m0hn/h9sJqbuR2SdKP
	 a21h0bUZ4tymuOtamIYWBEz0tkwdblrgmgRIBTkUkqJqE8Z07aleDuTMQGODAxzz0Azxz
	 /lK4UHgzeAje9q6j1OIq3x+v5SNYtosllJ7moyswyDqUAX9pvEcqhaMGgbjEi65xICQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bvzvFjpx;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166B9606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166B9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bvzvFjpx
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso2138991f8f.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795460946; x=1796065746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXmxFeoTBX/tQ++ntzQj/is3shY2/2htZh6VSebwwAc=;
        b=bvzvFjpx075sG+8K5J2gMyO/voucUrNRFEDa5aga5/eRAnJrFMNDEHtmtxhq6Es/Vf
         Va3ETZB02Tk+HUDIDJL4wHTugoTbHv9LhbfA8qJ+FltMF+6rxnoXlKREnf1XnHEscMHl
         4E2U+tE2vJJWY69UqWY5h5XssZSKEqbBuyzI2GvHjPVmufkUG+tFZQNNQqvLcZmFV9HA
         rzorDz8pNbd9EN9nUfRRAA/K8MHECzaVgQIl2EajITYjyvlYh//ZSYV081SXgvyeBF51
         3REd/KLvhzSchHA1VZZvKwUVvO7+1PWJdaWjPxIklFfQn+lDVy8U3xgvTVpggqZq5/G2
         YS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460946; x=1796065746;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXmxFeoTBX/tQ++ntzQj/is3shY2/2htZh6VSebwwAc=;
        b=fRa0YTeeyC+J6GQsEZ3/N9Acnmc00RIIKtNzpaS+eT/iAJzSkKCbfefCStWFLGTBl/
         5PfEmlZx24YlGzNJ9CcxZOWU1zwXinKOri8eO7Q2QKJw+aRuq4PmI0ydV0MahesVmlHp
         R73e5X1fsUKKDzmM+fLxXZF13VOsaWx7g7hEuVZp8iaUPFELXXWhyAwjRqTgJnYsGtSL
         qpOV3raJIM6k2GyCxsKgJTKAUiEk+xzaYcmRoUWRptpIq66G+9TeMXlLB0w8LFyuoWzV
         09S4LOOufpIx46S7tGBRqe+a8tpDa8i09P9Qi2Q+oeaBckyg0gqUiQdXknSO+GcWiFAX
         ZGCg==
X-Forwarded-Encrypted: i=1; AL+hErFN7qIiBQFWI+wUQo1vfY086zH+rIbMWFEUeuMZ5vkLnJ/Ix0hnJnrmMgCVvSK/b1tdtkZ1KwsdmND+@vger.kernel.org
X-Gm-Message-State: APuU4Z/EFVnbVb6QaJm7fcDPn/ZKL/+Ecpbvq+tamLbMBOjhfDA7tl5d
	gLR0or00rXErN4iBouAlc4ylh6UOD97cWpkgI6/N3+3ER7i1HplDRazg+7NQ/yqeknQ=
X-Gm-Gg: AZFdTZfDYItxb/XkDUXA0WjAWgrCh5nnX/Ur72K3g7ox4RpGyQZq5kpdDDteteuMlGk
	iv9z3axWnVW+Sfqk/RT5QldhuuHgSnbxPKv55yHq4lwWlTzuBYRZjRbmhdJoWX4EO41nqPNScAR
	nEp39tAzvewG94w164YZ7//o1z5BOmjN+WpqmU7snWLj12T5YVFmNcE7NRZqXtRTbdoIIK9jA+U
	pJyqyCgFL0gYAofSkR9bH6WNAej3AYgNALo4HBxT3xsUskNEqc5cCHtkgMRBT+OF89Qxr+kCOCk
	dliHsB5w+veYA5vLk3IU97hemxON3q4e5mOxYoBfgDZEkZgOetr0YsXgVuoQuStoCpxS8sCyx/8
	EU7NYvlOmI0nmrT8IitlcZq02aVzISzZFz8swSZHlWbv/kInCxgpE5LFnUQKoSvM/FfSRfNrfHe
	uL+PnniiwGyHfwO0ew5JsvDeEIlX10MGGsJ8tOJ6cnSPNdBXSEV3E20AxN5U/S0XNdjHjsz/6hN
	QMHkM165f/PY/xn9OFRgZVYJnV7IzWlUuczE+slaFQ6bZiJhwgGDEPZu9WhnUAlj5xHsAfzkXcJ
	AdnraGVcQWM+SOJyWg9Q9RpwaX7wvUhuR74Ae9zj36Hafe5111dpncRnAg==
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr248187205e9.25.1795460946295;
        Mon, 23 Nov 2026 11:09:06 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm24014155f8f.44.2026.11.23.11.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:09:05 -0800 (PST)
Message-ID: <27796cff-eef5-46ce-8079-93a0a8d40db5@baylibre.com>
Date: Mon, 23 Nov 2026 20:09:05 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
 <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
 <20261123103633.GB2959742@killaraus.ideasonboard.com>
 <fc13a7a8-b825-400c-9ea0-ceb2670dc478@baylibre.com>
 <20261123160550.GA3050935@killaraus.ideasonboard.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <20261123160550.GA3050935@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/23/26 5:05 PM, Laurent Pinchart wrote:
> v5 supports one firmware version at the moment, and the driver would get
> support for new firmware versions when/if needed.

This is where I disagree: I don't think a SoC driver should follow the SDK versions.

> I have yet to see any vendor who can provide 100% stability guarantees
> for SCMI firmware interfaces. In theory, sure. In real life, I just
> don't buy it.

I agree that while an SCMI firmware is in development, its ids can change between versions.
To keep the ids of a released firmware stable, I see three rules:
- an id always names the same resource, ids are never swapped,
- an id is never dropped: when a resource goes away, the firmware keeps its id reserved and denies access to it, as SCMI 4.0 section 3.2.1 describes,
- new ids are only added at the end

I think upstream should only support a firmware that follows these rules, with its ids in the DT.

For firmware still in development, I agree with what Cristian wrote on the RFC[1]: "fix your firmwares AND/OR apply quirks in the meantime".

Any other view on this is welcome.

> We can agree to disagree on this, no issue.

Sure, I think we both already know we disagree on this :-)
Thanks for taking the time to discuss it

[1] https://lore.kernel.org/r/aekXUvIPb8nkhdKu@pluto

Best regards,
Clément
