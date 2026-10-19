Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF6C4A2A70
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399899; cv=pass; b=qk9Xsr0GFJ34vnRZytu6nOifZlvHbC/pXqxg8UnYLK4cDyMjqGvY7dBUh0TjRaVAX7YEOoIc1QpqW3Zxawco7I+rfL1zai+Hv6/IIU5qvMycCtss9Bx6sRZFiEwLspiIcC/+n9c8h6+lkR52Ow2utk5KJ8+lXNDGtSiMk3tcOYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399899; c=relaxed/simple;
	bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwMlhw1bMhbakFd7n6ANj5mZFMRT2TCnLL7fmtkv8tRziFQANXX2H6hx8NMpvH/NoLZeOZELap6rIzvFCP34St7A4E5nMaBHPSxYkuomsmCIH0vjklMpfTj2vgLALMsZs3zAYbxv82/IBNxBSP6vp4uv4gtC/gEck683Qnj37A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4kdIJwC; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4kdIJwC"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6aa046a99c6so355100a12.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 01:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792399897; cv=none;
        d=google.com; s=arc-20260327;
        b=VUUyfYtCbC1bxOHz9N0DFdJ/mS7jINvtOL+rAnHMFJ98tLLNvgUb4CNM77MvjwulXQ
         P1jwZMUqg3J+hy8eNr9PhdTErC2rF04ZfZ9oYO3KTTyKuuZxsvmDrT/QX1dF6045tb5F
         9M4Q1/1ntIM5i5Ns2ssKJz+uwOe0mt8p86LsACU/9x6D7Rx4V9HdoALb8lT0+2j+OyDu
         0lp0f/vLCjIPEjt/hxcif01Kl0Jm98lUE3eEaXxSsfm25kMPr7NOA2XXCXNGPGS8X3QS
         y+hUsGQunwxQyAJhqzuJ8umPEadGm74N8ITZN+k4Q9rHq2/iVIghCght5t2lXvQX67MF
         vEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
        fh=CS1H2uvD/FqEZuVRPqTOC3YPTo2UQOh7JVvggasNMkk=;
        b=D/X6ef4N251i4n9lKAiguNVU9FiHzUgRGfVRDt3bs6DvfjKeUzPcXvxwwZEv93E/YO
         3e0YYyiIsceVFYyuBgGiWeM9GIkcCYLo2ejQ+33d1mzzyxdobj9C/SnDohDoGdrFyNZv
         LpL8AHLGs23X+A9/9SHE30H4aK4T2JclH3U7/FNCZWSU3vCtSa5owysV71JD4CMMKWAg
         bz74taNKZdKPqVUUlU8shieOdgJ48ns8k6pLbgg8kM2iZOaHFXE8i1GkcTdSgW3xx9Ul
         Pb50VS0GZ27zJ9xyVdIoV3Kf7V8IyX+5uk7wOGl2Cd2qtSBHcYl+1X9npLIokVFyk7ow
         XNyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792399897; x=1793004697; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
        b=h4kdIJwC3BSlODG+uWwjhUoVKgH21GnE/26XSzalXkBFvjCbzB7VKV/SZ26esGMGNK
         z4aLukjexfdeDN3dY7rmH9dH6c9WDuibYKqkONoDhZ6DYlepVL1j9LxBfE4g1VTuD1RL
         2tM1BgJ5VAETgTbksQmmxjrgBvDWRcizslaGqM8fRLPXqxzrtLgCgJd5GorGdxGgNwmh
         oAbvPGOMG1FWG6xiK0gQBE7Q8uJGYu/eXLnhS6iVeI3TIEQVU4zmLy7IfAdctSQPOSpF
         QJ2WtxIoewRFAvF2Et37HVLpW5FitwfO0+UUzsnM9H7JzO3UbX/fWrliJY8fuhsETBGy
         MoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399897; x=1793004697;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
        b=OEn7WR7+qG0qyXFl81nG5YknNAtpXdTemRLQIFhfh0jXaq3sxoaY9nbVl9+sY/ShLb
         cFqo+66k4ApiVGDbzfrYc1yrNfrp8aNyKbpabxhMtI7k6mwAi5ASJ7vDE9HuMkJ3ArSI
         +J6pSuidSH2JDHk8O9z04tVd3nkdvA9EZOiq4BlbffPoTvbfUG/CchYwYfvH4Y+KSnCu
         Opy/Lq6wnHZrozCBYA1ZFTTlhpfDrVlec8CgcN56REVeTq99ARBG+Pl8X4njzwNsSsW3
         CTqCFPbMdht6pGNYLr2qLqSqUgqlb2RO/P0CSadBTNqAD2WEDL+6DzBWpcHe0ctlycfN
         nE3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwehfhd0cNUivthEkCDDQkDMCLl+kFs4OX5CsG8sKuml7UnCdtLmfXoqcmc3kEptMVgT8s6h+gnkJ+i@vger.kernel.org
X-Gm-Message-State: AFq9FYKHIL4A1Er2Q9TEXfZEBf/QHTFrro5b6X/VGPS+PcmRYfdj0hyN
	ZGbR9BfgZ2apyIgLCikJ7NDQXSh0ZVbj2KMAvzqEwUqZT5n6JrezrcudU0n4zIe5jo65EvHH6uY
	QsroSuXEC3RqwIcYI9Rse8YkTa1jqArc=
X-Gm-Gg: AYBFou0j6RLKs8+ag2SmB1NKReyIOgeiovp51rVP5QQMxrzWLLIYgOdQtrGTzHZqI4K
	9qYwqCZG2iWnlLrWOMxdl23asoqupZ6RitNJRpsf0nI8nDWUizBXoADu+tzxT9pph3tzNYdB0WL
	4D2MRH8C4jNtYz04iAdz0Wz77DtaRkvb725UGXmJYC2/RHZcH+WWLFAZoXorcSN7/d59SSkcAhB
	aTalMVLbq48gLSwUlG2fVUcWd7FIMIG5Y6xerqSzgJ4AucgoeWmjNdo2jp0gR6NFYxlC0gU4kVR
	j2wueBliGOQy1gpWIDIovSPL0S9SxlZnl2JCUaMowDvnN3RKOaPvGA==
X-Received: by 2002:aa7:cd16:0:b0:6b1:a509:8a2 with SMTP id
 4fb4d7f45d1cf-6b3a8153c70mr3342735a12.2.1792399896018; Mon, 19 Oct 2026
 01:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com> <f337f41f-2ada-4958-b0f9-379e78e96a3d@linaro.org>
In-Reply-To: <f337f41f-2ada-4958-b0f9-379e78e96a3d@linaro.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 19 Oct 2026 16:51:23 +0800
X-Gm-Features: AclHuK_WAI6-16edIPrAFWjpLBUVloumDqFsNS60JoizZzHWBKP6V-AdFc5lP64
Message-ID: <CAPwA33KFY0avDH-F_5w01vqWu=RK=nXZ=za-Do5Zm3S8CPtGgA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

> Two consumers use them - which them ? Two consumers use the receivers at
> the same time ?

> Its minor but instead of "them" define what the them is.
> The second cell, if present
>
> -> you want to make clear it is optional.

I will check my description and make sure there is nothing misleading.

> Not really related to this patch but how do you envision that
> requirement being enforced, per driver ?

The transmitter and the receiver of this PHY share the bias block, and
the TRM explicitly does not allow them to run in different modes. Since
this is part of this PHY's spec, the check is done in this driver's
xlate for now.

Best regards
Jason
