Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501587;
	b=Xe8QY4gnIP1+qq3KZqM5fIjrQ+xXM7Cee8Hdsdyn2rHKTYtW3Axk+hR79HKq9cAvrbcC
	 O03Hf7mU6gEG+z0+qZ8WgK+aKtkA7ZcMDQfinPQnxLD40b5dkEvrI31QSGeBjQSGjICDT
	 z10zKVWREUSs6GvqriCemuUlgB0dab1OthPavFhZOEP+82Ws34qVefCmVXYlZN2zxJlqb
	 qWOUzRJpm1Pz/5V9GkubCIgZScrY4o5XCB9asjTa16bzzziuaL3R0/8na0VeBhT0qAn5T
	 n3YrfJKHziM2U/4xNjEcnRwcVFC7+cYVv4Wo1yBgYkEdcVBg3uM2KpX/HiofBokhThA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
	b=4e2WibxeHbK/vguMSonZqd8G/bh23K5+Y0I+ALL73+r05YBJJys+dIDgm6rR+cAyo/Lb
	 lwP/OzFRDWnO4B3qS824xD2ijA3N18XBUGAIDqeDpziSNMedYTuHCbGVGr4ollS121QHG
	 O+v5rfwhJr00p7h1fmLj83XS7a2TWy3Ayys1OIaKxMFYmbLG3JeidLDwlSY9z9UkgrQVs
	 /g40UV9+boAEurdez1T1qU59hbO15dnyIsyG4+kgHivFUkZva15gBI3txY5oa04GpaHss
	 YyGlQg5gq81BSuni54Bv55f/zR+bUiFdfDrhd25W/moONj14u3A0HhMBsSwcoaFbMtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aw2NmU5m;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1D7606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aw2NmU5m
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386c336eab8so282882eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795501587; x=1796106387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
        b=aw2NmU5mXIfml8zWv2yXkgGBsdqu0t1jHUU7WofPUO5XM93i9Id2hMdudHcF3xP4Bt
         gndhdLLj6iSmZdDlUp8knzGn+AjdVC04G8TCXIkouk7gAtkgCiqZjbo9rb7A+4YpLG9i
         DTFhf1W20CWS11DtXdXNq2spKqNYuLnRGnvSO8k3QBpTskFPW+4BL4gYYq/jVZut+zKY
         cabPckCi3C55CjRPgcVnzV+du220fYI7mjU3ydGU0p741gRVqGFIapvLGQURFOOfv3o2
         4906pe2WYq0QGwkqb83H1VMVThVX/wRgSWBrTpCk8CI/c7B1BGVD2WNXvBPsmK2Kc3jr
         bIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501587; x=1796106387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
        b=LzFvHrpQWq6hSAwpAvUxOk/47EeSzhFl6bA5BHAtn12lEGQi86mhgUk7Z4VIM4CUPd
         EMLx55+V5XhvbNcSTzEGJars354CTgwm/Osyl7UcnCxif9vN/vDoOUVcVWKFpZBkxqS5
         VC0EQsiJMeoxW7gSxRT2022Bt6U1/I1ieUGRJRbees9tfC8t1ox5j7R3SU2n/wtwhD+e
         MVokpgGDSuOm6OpKQMjsS1zolU2UYUQhIJW8YPaUPwe/baHXmeM+bXK8goHohBkWwDXh
         cIzfybMXCnviH7ID+eofBPJjSu5kUOE4MTEhFJS8dD4D3eNQkOK4sWe2IZk4+/uv16fD
         klwA==
X-Forwarded-Encrypted: i=1; AL+hErFFhzF9hQaNoL/6lEpeZyapq9VpRwPgzGp3+Z7MblSDCRIiJlS3V0ekWStMoOA2KBkBv4tUi24pkHPh@vger.kernel.org
X-Gm-Message-State: APuU4Z/EGT0uKH0Q4T+x9tpF1qGyoa8AZEtjzz6mTPNe8cbZa8n0WyWE
	lzFjgftCBXCEJqEy6+LxZSpMNzSRoYLZjrFFuZIGDcjRy5kn3Pxv+d9/
X-Gm-Gg: AZFdTZcEI4SOGr4cLRpj8FV3ARjr6b2T0Er1Uy/2MUIQpg5LqrohA034/nwzFJwzcVG
	eEPhlbtNOcajVY7HZ81+O6P45TK/aTVu3Qcp81M4ZIkT+I0jfWtmZI9QQE7+kkdeUiCzB1DNb3x
	bUcPx4fsS8AuAT6Ed1ZVDkLIgrzRSQRunKaIFOjV9If2xxjFqW0QuJBdM+AyxyfZ9dl2ru84mh6
	l/dp+VkKSgOaJXe8c3Ui+5xsNuZZMY/1rD5xeEYCW6qdkNPrlk3d+mxW66HT7FExFRRRnN0TnPy
	0j8c9IsqiOVVyPECBO3FVTFGzwSPpIoNlcS3kaBizuoxiZdF1HFHXZpy1GIgvisG3wyxFdFWhut
	ELr3ziIwAn4In33y+Pnd3RZcA+0Ml5HUgdHMancnRfyuu3F8g3oLUmheaaHIPB3qKpx1GANIDSn
	cqFE53iZ8JJohKAX04ZMqDvsBnjO/OWsc0MUUF7pKbsud7JiH4TceKtMILRGF069FdxgQwGrpFQ
	ZCUM2KrilTUpJTlM2ZPGm4ipacmn9hTjbCOhTkjPhMnqIYBbfcm/8vKl1ozGE+Q9S+tPcE8C2je
	LB/FAd+frXj1VVojYuazIAn5xtm+6hMzP9A39BC2deH9VT3ims1ci+a6hJZV+6OfkAXv0S9r
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr6427409eec.27.1795501586545;
        Mon, 23 Nov 2026 22:26:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm72739389eec.3.2026.11.23.22.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:26:25 -0800 (PST)
Date: Mon, 23 Nov 2026 22:26:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mattijs Korpershoek <mkorpershoek@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
Message-ID: <awUuAzGu3ZoADKyB@google.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>

On Mon, Nov 23, 2026 at 02:18:37PM +0300, Alexander Letuchiy wrote:
> Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. Its registers are the same as on MT6779, so it works
> with the existing driver through the mediatek,mt6779-keypad fallback.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Applied, thank you.

-- 
Dmitry
