Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA26F3E4C72
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286217; cv=none; b=nM714BlDyK+hPlXyRRGuDeUhieC/eVKXbEycYng9AsAgjhtY4vwYSNphm4xb1fWJQa2s6M4REpw7FLbpTZlAaLXb7t2+YnflYL56HMFOdMRl5W04VWO3ph77CEBa9VJ4GQguqvPhgrX88LjVNTVE0cobgrJ9RRCR4bvYEGUO9rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286217; c=relaxed/simple;
	bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4psQeAPxnmWACBXrIn2mK6uSMZd6IaTT9FWWFSr0sbtv5aLRRKYmzfjOgvgQo/SZCHEHJRQyylUyaksdwE07kUOiMmCwi3HchllUlZtZweUUUeqEbWZotIt8E76IdA0tnoMVcT0svEhYo5noqBxcKS9oQAMwJvEM4V6AUKU5A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=N6ikWCBs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="N6ikWCBs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso3864955e9.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791286214; x=1791891014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=;
        b=N6ikWCBsdcbB3DoCIPyofZc4CvNuoUu5bQyAiB//1y7JqLmqyFJBPuyCSrMAUwv1Nj
         FR1bTKZpOVExf8aC7PoDapYQxX4Jr6ef1lhTQ5+1jLxYHmSF346Ad80+p2WAEDiUO4wq
         yTcqjhA+kV1Nn36ZhTKRsJKsy8SsFvYGy5wZHwGuNTsP27BYF0WptCUyELlbHRYBh8BE
         EHQjcH1/thCFs4IGMwO8+cEHHAqJ86MTgA6Gc+uUt7Yo2yC6erKgZi9nZXcbfJiUuN5Z
         tEEsrvBGF61DfR8Z3oiFrTA8A2qN8aT+oxjEQthcCMfndNLNTwJ35cPCze7GLg4zUeyt
         UX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286214; x=1791891014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=;
        b=vhfAFQVwmdpJyLAf3duasOnljDMJ1BwinpmN+q+KgN8ALXcNHLnYQkUTi7YnjtaeKS
         j5IJAALrIrtrmNRffhUQY7kyKMLD8rhFONm1QkIVAINGcibbu984ZvutVNzWLFFzPYt9
         gWj/PKD2JdokC+B6bzfWZ38AnoA/T7AJVG41KtpVQ9VZiimVXr/L7Acz47e5g8ics1MB
         SSWjdZ/dH8AA9wRcjlcFMfFUq2FWGO8kWCWfVYcXg5OwHywr0fBNt3tpJjXGDZHzmC6Z
         k/5dYJibHrKcTjlg5mtiSPs3bAOOgg7eDvKJZIY7Yj3G4PzHUO4Ees2ngF9rZZldh3B0
         m11Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjf1ldt/OoNNaIepoeFVWjxCftVEN4vsoZBQIXxdM7kXATSW4+7RrBhX22oPsH0GlrlgYejMDTfw1q@vger.kernel.org
X-Gm-Message-State: AFuF++k4bNaCZwZ1vCQ/WZ/5BfUaww+XnPRenvdyMoNpE6Lwc04OB5Sb
	nB4d1I6dFWV7hhhemrlXYeyKalKXmN0OuWyIqDplBKz1u3eFr9nzxi7530CGtboLzfI=
X-Gm-Gg: AYBFou0FdrMQbr9KYFs9Ih7LPeOPJq44FbeCo32QveTLTDxs6qFXdZQIYStWF34UvHb
	PMW41iLlrzCVSrTJcMUBnTVLao3W0oDnCinv7Ynb4khvD8W4KvQzmiYKkchmsJsBj6AWdDdDHSc
	zW7xDTcMLQ39qdqRYKi4z1PZaIpzXTTclVPjoQRupnySyXxNTnVY8oL+81kiiEvd11Q4+Wi7Q4u
	+nkh5WjLUBcQlSnte1CkB+Ew8+zejamvi47+HNLJJ9K9KDNJOEL+RgjbpVuuA7F620yvTbSv9KT
	w/58QN+PDe4MnybPbrZZgwa9IElAUiOcvjbThdBcx4t/ETfTH/8uy782zlFlpkeMGqFtHB9+OA7
	PaeT7ek4tf8T8e9ASiRf7l7eU3U0dpNR/HM7pXGvextKrE1/n2xuDw5jFHDwoGu7ZaZc9sSWV9e
	iYmccaSUwDAIXUHoLVRfU0yFLw8YJdKy2LxXYwYs9MHJkH/lqMbg==
X-Received: by 2002:a05:600d:864d:10b0:4a1:661d:da2e with SMTP id 5b1f17b1804b1-4a178a3053dmr37160135e9.14.1791286213774;
        Tue, 06 Oct 2026 04:30:13 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6bd2bcb0sm3173964f8f.1.2026.10.06.04.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:30:13 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev-bot+sashiko@kernel.org
Cc: linux@armlinux.org.uk,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	olteanv@gmail.com,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	conor@kernel.org,
	f.fainelli@gmail.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v5 2/3] net: phylink: wait for PHYs that are known to probe late
Date: Tue,  6 Oct 2026 14:30:10 +0300
Message-ID: <20261006113010.741565-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179120736418.434549.3034364543286173403@kernel.org>
References: <179120736418.434549.3034364543286173403@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> should phy_may_probe_late be documented as
> incompatible with mac_requires_rxc, or checked against it?

No. The deferred attach still passes PHY_F_RXC_ALWAYS_ON, and before
it the PHY would only have genphy, which ignores the flag.

The other points are valid and will be fixed in v6.

Aleksei

pw-bot: cr
