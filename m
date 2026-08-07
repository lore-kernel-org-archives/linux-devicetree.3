Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8983C4B6A
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091838; cv=none; b=LFugq+ypPCv4yddEJlKiodKZkax59dFL/mfX7wxQPdy3Dx9pEWkG3SH1NIrmaXXbEIWK/8TTzcIoqRY2Vjpg+qhz/xczMAUOlsH+Eg65jKYsEGTGXWG55qKth9XcAh1Btxu8NuyefjCdCwhBzWQQkDAVNfgKXC6gjimi2stFJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091838; c=relaxed/simple;
	bh=P/41CvtTcGae/equIvztsQBGuXVGaJoauUSj4lEXoMo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=QnIlnLYlMGuVj3JHLSpTmwXVsBxm8mioS/VxbnI3tq2hZ9UIdp2DBplOJNl0E33nN5yPX9Kz+iXugikULNnuyDxHLZaG4KFYizP/NmR2cz3NYwJUN2XDZAy0tHuEZ/8tw0Ypq/Twlh01OUWu+ElLoD55/Fn4aQmgZiVZUMqh2vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Q+D0k7jQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Q+D0k7jQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954dff6536so22673475e9.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091835; x=1786696635; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jEYndMHB+hzzoGm3/jN5rHUQhOLtVYWufPY6GQuzOfA=;
        b=Q+D0k7jQHcEeeIp+sWm9MsSfOccnLMzkyZKamOcrWj69yNNxV3T9DpIySVVDXjkXud
         IF6zG58bJnLuUsto/EETBz7StJz661s2IGN43p+bj8L5mp4ZE1pbQzNWlqOGxNHHpcmO
         FORz9BnuiZU1yLqjE/TDkJsUBrcE8EiWWl3S3iLM0CbJ4qxgZ1pbCfHWnyYr2tnDi+JL
         2fEW5yNzgENhBRcndN1HhrgkTRiOzKxfBHNvB+OTrIm6My4ZbTaKhdkI5gbwW6Uu7fOr
         vNzCol2QA+ERuxrHssZOswg5fSHb9DB3VXbF2cg9E2w40EfArVOEwn9birXPCiSNAv6U
         uKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091835; x=1786696635;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEYndMHB+hzzoGm3/jN5rHUQhOLtVYWufPY6GQuzOfA=;
        b=HXW85AR48CbkevFwTyg7FeV/mWBL7poIKh3Ga1N76sPM9GV65uSHfRZRY+ZXVsjwoB
         PKiLPbK9420+dsSRnFtDhFCAFVzeSuPEKKTc0MeBPOHQNYBcZJKq1Ab0h5jfnJrg/7Nf
         mc+O4CL3tm0VzG73Gv+jAlbjzjk02gsVYcNTNl6F1JeMoAtsbKx/DhqC30vggA7nFfeF
         kDKZOYuoxRXICN6kiJG2DFK/bpPO2MqNqBtu5+QxBP0yqd6jfg2pW8VNnij2/E2OjNvg
         xjYidSuGeeYXrWA3xXf7hEkuhjgdlb63u0JDE4Pyq83PKwc2fKgz0v022UbioZOiwNsJ
         Oxww==
X-Forwarded-Encrypted: i=1; AHgh+RqluNru9YF53mYkFX5eqBMnPnpt/M3XINZBIgfN3QMIFFnbvn2e6j1qt6vP2QXbOO8hH+u9/V11PL66@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+K3mCHfVheR7IJbW5tN5xzXDpZGJnYWVmY84s+YXb5a9LmWxr
	KifpjWVncKv+ABWCP2akaaJIKp5n7PChKpWQJu/ug72ziuffqTcLTZW1W2wNpOuISL4=
X-Gm-Gg: AR+sD12FzCaPdU7xZEOXlk1MBR7E+voxv84sMYR0ZvvXo/9GqUZ8E3W3Mz8Td3g/Ryp
	17jdFDB1aHdelVzlKLf4bsQNabnk/+1IWincoebzSdiZZtstzZcS6Gp69EaRshgZ3Hqa9+RR2i8
	0W8KBe04ciuJShA568quzLQM5Ad0FfCuyqntvzyd00Rvh8ZfPWEt0zI+1fGdqKxRbul8W45yEzy
	a7k88F2i9pfBJdWNRgXKoEvS2Y3XRhZl2nsI6b1wVDALJSbn9EqH/2I11JtukQ1WObMJEUwDhjW
	w6vCSSV0FDzzTOLMMczjKlZk5g+lheYe1FTBCyviVH0lT1UCaEpNPqW32js6hXiqZ9O1VwbNSTZ
	fP7MmCJCBojuunhEvhYgbrCls6CZHh3rBqh8fpcapdgj0jpII+xWB0ohGJ8xIiYfZAIDt/tLD74
	fCzFE5rDkn8h4AMXHuMEaPeTyd6+UUEB6g63X2wW3RNQnq5exY1hNx0DNioE2zS073O73rf3w=
X-Received: by 2002:a05:600c:a47:b0:499:484a:7644 with SMTP id 5b1f17b1804b1-49959e2eb00mr92663195e9.9.1786091835248;
        Fri, 07 Aug 2026 01:37:15 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 3/6] serial: 8250_aspeed_vuart: add VUART over PCI
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com, tan.siewert@9elements.com, 
 linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <84efc6b23b79e901245e9ed7f58546bef6089530.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <84efc6b23b79e901245e9ed7f58546bef6089530.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182923.193353.14922851647951168548.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=504;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=P/41CvtTcGae/equIvztsQBGuXVGaJoauUSj4lEXoMo=;
 b=w8BqgggHC8+rKIIYkDpF4V+LQxQsLNTjAkqs8Mvxlj5omkapBkoZ7qOK3HWj+EyFPq5fEadKj
 1czd/NMPD8ADtaa6dibTAstN19JKAfgQvZMVKV0WiyJ9NIMbbW8jdIf
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

On Wed, 05 Aug 2026 14:19:50 +0200, Grégoire Layet <gregoire.layet@9elements.com> wrote:
> Enable the VUART over PCI for the AST2600. Activate it only if the
> 'aspeed,vuart-over-pci' property flag is set on an
> 'ast2600-vuart' compatible node.
> 
> The AST2600 has 2 VUART that are usable over PCI. These are already
> defined as the VUART3 and VUART4 in the 'aspeed-g6.dtsi'.
> 
> [...]

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>
