Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771036;
	b=CEL5whIz3Kz1wy81uX/27eVsgRVZkvvOcsJv3ey01TEulDaiYRBYwCdUV3nkNvzz5OQA
	 MtBpSthz5+tRNyrIDHCi4knhseIZtbHzvmWpNCUfZKJGJvT6LIcKGDqyeW4HFVgGF5O17
	 N+28PC29AykhE5ovJHKLITOeiz2hJKv0gUqO+8nK1NK65ITx4vso4Enxlqxgs4QFBdfgv
	 AkLV6xFED+As9aIbhYqBa28kUuH0QZMYJdaO95WqvS6YtxqzNR1VFRJ+QHM7G+nEUlK3Y
	 185L4tunNAIxjkS7ZibWQDig66rmF1OX9YdGRNAVnBeGKvTlxg0TNrFuEoxak7nKBUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
	b=36d3UgYUMMbzEn3IwYBgu0rezKiRJQpmHnGPp+uefZWYg47WWn+WmXvabvj/561Jv6Tu
	 MEMdtY5k8HV+H068DthtumRvvyWQqMr7tM3gw8ZD9ydo9UMf0xoMaSnjRDrz2Tf7/d7VQ
	 BlDlpdbU4qiI8IdmbWRh3DeFFicQlHNFJU+UnLlk0L/6M15IFKyXX/k0KLTO16kFw73dq
	 QmYz/5n9sWS42o+Z65yb0kpwReWC6pDa/SCH1gB1fkoGdBlUcSmK+wr5KnpNfW5/NpMKk
	 +b+3zjVBckX+FEsi9bM7EXz0FL5RqnYVkNvuKY5tPfSDr3pQz/F3H67l6MCU3ao/PUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iBRw+JF7;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529BE606A32A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529BE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iBRw+JF7
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a358881793so4126950f8f.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771034; x=1796375834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=iBRw+JF7XI+FsbMljrWUMpxaiKKpfOzx9BNFr1VLGWhsoqp2VSaP5SWnYO8z1hBxgi
         IQNbBMdeJhsysl+DyR6W0NanRt2DWD8sIglYpY/x5UY1LoWAgPv5ZUnnBfND0YLbUSfl
         Itsk0XaTbtlowa3WI5Gxl3k5nAWrW+1EmwyyX02Xxa/mHvv+dh/iykowrav92nNUb9uO
         Bj83vjke6GeDzVChb/+X4O5URXYdSZf9UGvHEF7bClbXmYZAtIIFShgddgG0GM0/SIrH
         tcAyTh1+lo13Kmdf0MVGZ9iMoPoBNW3igWAXE0c5LOGBN4lH4dIidyqeIIR4bXjt1rJi
         qmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771034; x=1796375834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=A6XnZGflZDUmoT2MabhVfe9RRxJIxEUTA1ljVcP6ZT6egZMEGAhjePK8F/Phxmfz3t
         xxNYo2tT1emhFMIrMMzYl7qFwxATUGx2G2KehdZ37AlmNEZGRMFNF5d+8jcDPVkjwE70
         CydXIS2vD0MXyFmRoG7P508cymqdX+dcbvO1wTDcajNLRDTxXxyNyvZ3r/4HpZDmdj14
         tv0hdflEVdZPZEgYfiHi5VFEVjcIRHyTd1CvT2zim+TPViYUlFF6sFKVVNdiUNXxYtlt
         iqy6/rDc8J/A2HR36gIZJT/i6BH077H9wRt+4Jeb4udM1u8X1a+TH8HK7rO6NpBJXgdE
         rSGA==
X-Forwarded-Encrypted: i=1; AL+hErFaKBZiKUl1BgYi4Qf+KrNFxbMFCUxnFRdVVrn4DuPm/aJB4A6CSor9LumYlt3s/10yEP4RH/RaRSHM@vger.kernel.org
X-Gm-Message-State: APuU4Z/nHA7Tz8N46jeWCpmFjK+p2o8fBFQL+7+Sg+gBHBn35fr0vlWe
	aOWPmkUFeEyln61lUlAYtpQE/NVj0dv1Yg76j1K3RmLW7trJakOfyOgLjEZdfrvLO9Q=
X-Gm-Gg: AZFdTZelC33UF16Wex8afiDy8S5IIVu+sYUNNm3xTbvJqCgEDnRboFwFsfGYeTMNEVw
	gdn0aHJm6/kGb1HZMmKWn1x7cm2kg2nTnyXcPhruqR+hhYcCW7QtRX4mQNJy9tC0WtVq6qFZtTL
	tLbqmWy4g1HXYFd7F3i1M1S9TANqXFO/Nbcp/0oG72cfe9pxx2tlEKiRhyDaWG/fTkwWCKYkHgF
	F6nWH3ifecKNH6BVApwCNchhqFZXaNATdRne5A44lmLFg7TVJBytTq1f5A6x4auGr1Xi6wsjlTq
	bOCrF627J5eXB5BJWKruGZhFUqp9ZfHkCB1dmo3zTa5hradah36YCc4yXBgUWdQXW/GTWdp/PlX
	nF7ATxUc7G69pb5/QDSe0Egw3cCRGVi9J+4oyFcKPXxxiorJRGokkEa32G2B3JWCZntBJ++SrLi
	85N5iKaGTGVEBUtR4iEwsqPHSxx5dSYhP4G7JYx4VzDynSO3ejKO8x3aFWcvZWYoYqdPusvS+Me
	NzphIscGb49ORBpAyXU8SdbJY0ChhgmPoJtWhtw4eb4Vcc8hNHniWVGpM4CDfVMu/c+0U/MjeAo
	zEoIvR+7lWwcs5CTFSP2zFz8lz305+vA1pXA
X-Received: by 2002:a05:6000:2f87:b0:4a6:bc53:246b with SMTP id ffacd0b85a97d-4abb5144ebdmr45324253f8f.30.1795771033589;
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm45914055f8f.42.2026.11.27.01.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Message-ID: <bc1ac983-16ba-4165-9827-a7cde032c988@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:11 +0200
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
Subject: Re: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add RZ/G3L support for
 selecting I3C power source
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/26 13:35, Diogo Ivo wrote:
> The Renesas RZ/G3L I3C pins can be powered at either 1.8V or 1.2V.  The
> pin controller provides a register to select between these two options.
> On RZ/G3L the I3C signals are multiplexed on the P2 port pins.  Update
> the Renesas RZ/G2L pin controller driver to allow selecting the I3C
> power source on RZ/G3L SoC.
> 
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
