Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711745;
	b=dLKsiItoh3TRqOJ68a9l8D3IAhVKB88MonSvjfGemIvpfTKBIl32UOOBU9s6a+fLQCfG
	 +uwtbtNF3cPYfDg/1wttY2wl18BFxzxKJtcIfol6k4QPuDW2O2xFFQDOQKrFOH4r7Jo7k
	 jNZWP4btOMVqRCx7Xaqu/Dsgt7GcaZI9L+SFghc0VgdCGjuvUVV3tiMPxp8V/MopOtfT9
	 gFpLKJkRMjHG2G5R+P7sH+bpJUgQr7UeM8utVfgVNfdFZn3Cc6cSRT7MEvCI+Rxmjz/Pb
	 JIUd0t/5hW1dn4OQS2kULsY0c96KAfLlbna7Glf/+/w/0P67iwnwLwOkhZE7DVcjR5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rzDnp40CE+pREC32cu0fVxrG/CaDJAbCUC6G5UBtf1k=;
	b=Qk8o+9JhUHV37GdSsScVMrOXjMZTolcYOB5MdNrYZbVQ+zGiE8HMDXLhFtbst3ED3AbX
	 1Q/BsN5XP1QhV8FZ+za62u9TQPe1E+pfTF+u53tcE3dkMz5nd5UKppdqvtns17Q9UOC9j
	 Nq2iz3X03AdctywH3ZNnAhF13R9Hyg58I7eu3sz4kXESHPs3CPP53hYwwzYd+5rqZYKps
	 OsZyZfDHh80b3+ll+2KJLlbdX4NFARMJF/LCgREnY50LBl0NtyUw2v/+p/t2fatpk9ov+
	 8G5xWPmUaOMzLNtBQ9xTfusTtfNczEfCVRTqyRkZn58u6WWpY59Nl2tBdalzOdDThCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Z+PAYiRo;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26764606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26764606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Z+PAYiRo
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so74107875e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795711743; x=1796316543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzDnp40CE+pREC32cu0fVxrG/CaDJAbCUC6G5UBtf1k=;
        b=Z+PAYiRobNheQwZbfb5f7QnQu49d25SfmVyFqoPiOKNsJj+kKgYtX4MJYBi87CehJz
         jYsCk/iNt3mZlIJS4Nt/63q1faPRJEGPLekhja7Tf1hTGuPp0dle1UglF+CV+SzD0VJT
         X8Hkl9tjgLa+GkYtXcP/J0W7KyxRIt88GFlAYWwyvsqHluwqWYXn8eabVGlHz+QwDlac
         G07/avkpNPctUrH2sDvpcAlRqmhwNisEPBzFxhUqWAXhnLvbhi4HshA8USZgbqdNbLv8
         pu6iUDPxhOZDlfr+pAtoisZDkzbhLW3oQANqE25LjsYP4NYBYn+mrD7xJrLajoQFP2+W
         SlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711743; x=1796316543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzDnp40CE+pREC32cu0fVxrG/CaDJAbCUC6G5UBtf1k=;
        b=nBF3mV46SB0KK+nNMBWRNqUzLtiKSVrwifGoIUTil06qMCcRfEMNNWnaD3XkI5F9Z5
         GOoSW0nCMpRFcqd0FkkCmCSMrvqYRvOYZRthuXug3LLWmy6jWGjIN4Q2y+1sYPzeQS0H
         b5e+1FYWaFUsEzg609o1EtZIs71xP7N0Sy6ZxL0i0LwULnOj13vBDBj3maoWGm9q9JNA
         nFL9/9+yBvmDduHHM4nXKWLZJs2TBimmxPyqaK8cNhJ5xkGd4uQqIlYH9/h+4RXjFd5k
         c87KdbnYB2CMt9cXj/kttfb2VdouebZqU4WB8N8kJXThCOxGMae0ajSlHF27SkWM3gcR
         DNQg==
X-Forwarded-Encrypted: i=1; AL+hErG2T9egDGxT0BdgwZEOO1ei7gBNT18XHTzlnRUGsepKz08tuXnRjWm2A7b9HPWV14tg/hVxfYvmYStV@vger.kernel.org
X-Gm-Message-State: APuU4Z9ymVxvSLBDaFxBztyA4RkX61ywVfIMpT0UQxZSD2dE12tjt48l
	+skEMbNCfcigUM+wIdhcLBEdYwF8rYm7Vad1R/DNdmEqqWhj78sQ8p6XttJwA22ANMs=
X-Gm-Gg: AZFdTZfxZScbP38E89a3naq6BJVY2/0upvS8O0cg+hhSsnVpt5ajruRPw0s5VZMY66I
	a8grLiEPI+jNi5QELAnQWMUg+AAapZ5W1a0jhFPTterjD9APhtpeKH9xoXYaoHwSgGjrIKmT4S0
	fyH7IMH9cEXD96NxhnyXWJeUAsPsb0ci/V8gb8cUDfbf7UHx2Ex4OKS/fExlJevgONySr2yitAH
	5fqzZc2GZZcwOYXrNtpqaiJRsE8WO/k8a689JrXBUDrijY62+wH3Kqb2WBId0KUbQ24bmSN2vHG
	Cm7n0AMNHXS0xD7+TUgThLTcOjDxxSD8KBiu1X4urdobQWLknJhOG+HfSRnOHXT9KxynI49cl2e
	PdZEV1wRGuSWutgS98l8APt6J88FwRTMh8xjGY51mb4Wp1BU+4qeX/9idYlEY2KtyOHcdxd02Ap
	MWjVVx6nOVKC96Gii/UmFj/XHDIkE2TRaxQtn+kN/LhvHYcqTHzPIIfc7dko3hGHI7lA4oAYae3
	vZAXEfrfFf9i58et2qJ8Fmb4fhNq+PmYTZRm7xa2ujlbF405ZwnKRkdjCswXA7vvZeCmm31Z8bA
	l20k83vLqqAltKJUhjKFbk7MKvan4nAwPxxDWCJgIBlYUTj+NrWN8BQpGw==
X-Received: by 2002:a05:600c:4e0c:b0:4bb:875b:f23f with SMTP id 5b1f17b1804b1-4bb88827f0bmr417736165e9.33.1795711743379;
        Thu, 26 Nov 2026 08:49:03 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm43506290f8f.8.2026.11.26.08.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:49:02 -0800 (PST)
Message-ID: <54b84f7d-163d-4cc7-8ae7-0bc41f48ae1e@tuxon.dev>
Date: Thu, 26 Nov 2026 18:49:01 +0200
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
Subject: Re: [PATCH v2 3/4] can: rcar_canfd: Make clkp local
To: Geert Uytterhoeven <geert@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
 <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <cover.1795703576.git.geert+renesas@glider.be>
 <72de009af38868a4c72c0af674e2f527035a2927.1795703576.git.geert+renesas@glider.be>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <72de009af38868a4c72c0af674e2f527035a2927.1795703576.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/26/26 16:46, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven<geert+renesas@glider.be>
> 
> The peripheral clock is only used in rcar_canfd_probe(), so convert clkp
> to a local variable.
> 
> Signed-off-by: Geert Uytterhoeven<geert+renesas@glider.be>
> Reviewed-by: Biju Das<biju.das.jz@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
