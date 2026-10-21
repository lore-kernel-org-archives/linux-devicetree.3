Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792564989;
	b=GdUwDY8sljhyyoGojYceW0qzA2j+OSteaaZHCO5aUMW7N5MdY3Fj3m3AQuPTXdCR6J7j
	 /pdBvciE0CADy8CRLvPKUE1Q758cpOaEwbIm0lMrhoMtuy16Dba9L1NYzpAabnpxALOl2
	 5evhIjsPUrUGbWM8YEh849K3+sbWXGyt0M1BOUQKcNfr5reSavbJASBYRuEBzCQgzrMPF
	 9PBsimj1WvOhBblmYU3NYnJl6nCL9rj9RCosq+LblpJroXBxxEUexlxhxHkgdy+2pYJTw
	 t6chq3+5EkSjqSgMiMyI9eULX5cyDzM+Ueb6+w3zdbCiwh26WT6G2/ekJQUrfi+sQrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
	b=EPE7/9Mu3LIp2NwM3UoINxMXQLCEfvuxoLniHQvLio1a0wmcv1prSXZgPNOgBD3nQn4w
	 IPoTMPnhdxIM2RkjobJgJ50ciYmb9JxrdpVpgUvDZZmOSSGLfsY8Zpmd2w4iqMOUhe0lM
	 fGHIx5Ou4LJ88hZWfBYZ3anOHJMUhVEp0QBCoyjxTSwsFUaI/ByafvJr6XnfYZBupnVYM
	 O1nF+daXkqw9HobkUUmqZz9ROJtH9hlnhYkilo0K5bszn69FfazxeXKiZjaEgWrfd7N6j
	 93QvR1PTwjh2SuGTEL2h1+SHIAm5qiskCZRMS8BQKBUsTuT/ObrH18ktZ2tJtGD6GZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W/GZzHF2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA29606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AA29606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W/GZzHF2
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6798eb0d190so225910d50.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 23:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564988; cv=none;
        d=google.com; s=arc-20260327;
        b=A1WG+Tpj9TVc+UtrAFL3y5MA9L8/fd9O7emPC0ph50HihxBDDbtquW1Y9vV5ZKeADq
         Z/Q0reLszeRzzVefhtH/KtGnH8r5tz8qXHu5lLuqwnvji23DX3CH7KqEUhkLK1pW6jGv
         ArfnB1wtp4au+XvFNj9m7lRXd7gzeoqBn6GH35O4Sl99YBsZ6JSk9NY8aGZCxKS+MLHz
         nlBGG3ivluGR/glIbzSX1rpOUnX4IWfPXAjmD/Vp6G9jDzTpggrx5lcrQTDgUHN2Gbrp
         UQILPox5VMFjqlMRQ2qyQ0aboTu5LwPK2YBfk/KTwbfZVtLJjlOdC3dp03ZzyPVGjY47
         UoSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        fh=srWGXvpEIdDqllo3ZLlgspiCgO6nZKRB4NZfXq/f0nM=;
        b=TRsKDXScXsto8eQ8OK/JMUJ+QEW+Y5hXEgdHQ5pxSXR0AIHBZXE6rRlz+pFO4RGXO4
         ktnGHf2u/7PwMORoNusTVRrsOWbO2TbQWjKjFZE8PN7bwSsJVdp1SKil37qgkV56Ynvl
         SIKm2Xt13M/cpnPiAfmGCiQ9HN/32HosSLbd6d/gsOY2urd94rTi39qYYMu7ygL89X2o
         I+7rSR8f/mS1GOWR4rzN44EhShbyM3RsX3T0LLx3rBJuD+elQgpbTUPNNvlxIZx9xCO/
         nxfsXpZ7p8tptuSz+svvCpQS5or5Bj/9qqZJiYUp7ccThSc4ubnszUJCuQSuWVk1LjDM
         mgzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564988; x=1793169788; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=W/GZzHF2NY06v+oXZlgyivPlfoDTpJKe9CZuhEPaTuP3Qidpu3yorDYA41xB4bcPSC
         /M1QCIYeBX3/6FCyGJwl0TF8pFqTe88oUv3XwwvX1E5VlPp1911HfPcH3d5saDWQgsVU
         Nsll9UVTXZZuBMTm2Nwc2f03wOSjF5w+FPenbmn78a8sK+qlNzx+w1Y60DCOuAWUn1OR
         UDv5dhCVm0SZxFlLUR/YUHiWZCrrR8+FOmbCrNDyDDz8KnODQNNH/R7qPMfSPlYd8n0k
         Jxr2ymTOX88uWC8p/jyO/uN1fBbx888FwDve3IgT2GsonRNMcqXLmqB0eWi26eXiw5YH
         ZjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564988; x=1793169788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=YjTCY7k56tSgrnHBWV7kOvyH0y/OaT8jD8dYXTR1BAf0+bSIkmVBzQZu/jqX926ljF
         gFFy+M2wOTG8OkXI97hxplZNrhWOZ+3yW9TLeAAOR+wiebNKN76sdU294k6Yh0Bd3DkS
         MQLE5c45kiGJtRvgV77bBzi4NwhTov9kxyNmKDwTZKm5UP50RGV+cII84MxGpn67/4LX
         p9v4sRPebLERopf/HWIALn32UGA93yZuYW6/NzgetDazU0csqlko48HiD3TPvo3oRlm4
         nxjldMw8qllLYD9KnTC75856qZg4oGPJywnIJAJo8jLnkMVGih6CLLr7AGjc8h3tGZHI
         ytEA==
X-Forwarded-Encrypted: i=1; AKwUvBzEz9s3kz4sfFizd/4nrmdKDWOH5Oy+T/78iLCXbEVghicfSyQfr0ja8z6fGSVKpjgY+NW/A+3sHXk6@vger.kernel.org
X-Gm-Message-State: AFq9FYK4P89yMBB93QQL71uPo+ImFTpTfHwNfBelEYMadJAHc4Ha6XSc
	6TR8dfFzIgqdYTye2zpwft3CMFLifUkhuQGNla2xyr2t/cg5DFGh4c0B0NOZTGS/vK3TkugOS6h
	n3ZSxILHGtOSt5DAiJ9idFl7JmHiFV+g=
X-Gm-Gg: AYBFou3hIL4cq+TpoycsfQkVVie2ZeYG573s4FKnFWUSfQoZHzjoX4Aq2BBv8hNxC1a
	/sZLVXF2RIQuzGD5GORbska/ERlqri9NPLKoY09iWbiWh7acsyXHzRvFLhGzUTbQfPILw0C6lXi
	h8a999iJrbmumoI0pvkvTI0jep0G4965jn5wL3l6m5Q9vbJQEL3/8foI3RNncfoW3Z94J5uck8F
	Im+b0xSJcU7m6Yl6o9xa578qKv+GQu5aXkjMEbNRNB1PcxqkshJqY66V6Krg1KascdeGTrdnmnB
	lxuWIjjf1EL8dTOQnrsbosZhyy1WgPYoJ6dYuPK4pU4ZTD2GVTkSWBuKR/+tlcyzQai9croSwwJ
	JcnxNvgTPA3VI0r2cljG8HoEjuI8bBxSxsCk=
X-Received: by 2002:a05:690e:b48:b0:677:db69:cc1a with SMTP id
 956f58d0204a3-67a0e02fb85mr644184d50.7.1792564987934; Tue, 20 Oct 2026
 23:43:07 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
In-Reply-To: <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:42:54 +0200
X-Gm-Features: AclHuK9RBvE_tu1JJML2kndZnV_iY7Vg0PVQd2A9ECqRfA0-uzrQqgVwLULojEo
Message-ID: <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> And here you write clear note about dependency, once you fixed
> bisectability.

Just to confirm, would the same text I put in the cover email be ok:

"Please note that patch 0006 and 0008 depend on patch 0005 as they need the
registers.h file, but belong to different driver areas. Patch 0009
also depends on
patch 0003 because of mt6392-regulator.h."

or did I misunderstand which dependency you are referring to?

Thank you
