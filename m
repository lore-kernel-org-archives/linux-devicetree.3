Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D69437CD33
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791670455; cv=pass; b=m48m1YXhoC7H3kYeSawNf6RiwcYPL4yP6ifWFBkT82DooHzph+HclE9SRj1n4W5G6tEQ+lNeVhOes1ok4Hn8GPukza7d4SPGgjWmvISoW0FkA8IyNAwCKJm0lzkLmbTx7151lXAQFb7IOMoXZaciw7gUquj3hZbCp/fE/nb/hmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791670455; c=relaxed/simple;
	bh=CBxiUJ5zCN5x3bulAKsga+lnv9YLj+R4wsUCpY3zfcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5lUTp8L/n7avbIMHhModkRSxaEw+ZIC2AYpAYuP5Jzp09FkqapTnxqOcwKW1g4mwC4FxOVx58qgjTe0QM2OtJ0T1QaEU8QT2mYtJPJlxNz3BcdTtSSQL9JFlhffzOcKF2jJDUM4X5W2+aqhfI2cu2alxDkTX5IuxjCJ6k9Z3Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=LMJDMsK3; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LMJDMsK3"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6793ff3d53dso516104d50.2
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 15:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791670453; cv=none;
        d=google.com; s=arc-20260327;
        b=pjtRwazv2RcM4A2qMDaHICTVUk64q4ODqaHXQKvDKv7y2RVESTK6eNt+mRnuOVPPC/
         ejtRRnpkA9dYk8/NOnSZ7FXP11UXOOgmDrMuYASO5UItWmIfTrE3MN59utN70eusZzbl
         EUQrFX9HIEjx/loshCZae7TgK518eoHMpSvGRIhr1IJX8RbnhxxYoAgOZm4bYaBWHWoE
         KWN+mugIv7ic2oCEU7NPo8/tO1CSROrec1hcyu2PCcwoJZdRFTNwZM/BzyDyGATk8VUr
         hZ3MkDt0qtwJuK95/yMfZdN6Lg3al+061SaQZgvPIYdXCoZiPrlIrRxCOHVvscLvfKSV
         KAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        fh=D4pEn97Qg7ymr9B1rapbU5gcEwd8f0UmpZFwOD2h9oE=;
        b=IiIkPlGbnltLOT1b2bG6VrRGsh33Q7ZrdvcyAIrg/5caVEDQFcL1Aj6/cKZ0AZTbxj
         oWCpzzZe06kRiZswO5cZrvphRQqjyK0gHobqsgY/htpMw5OsewnRYF7nFx0NEeJQxiia
         XF2kFTKoyMZZ6HHC6w3zl9psABw10SfXb/Gvcp8TTLyRofx7XweY56qCajTpu+Gm1+Ot
         UvlV4CsoQIDft3mC9nY82Br2cAd0zdCcW1WXmpBWbf7jaKdjxPQn2Dya7D4GEi3vg+Kh
         MYDl6HQBD3APFuYl81Ssi4bnhNG5wJk3V+w7WlZSD5TMGY0zVQWCujt1bjR3WTr7Shdy
         0KjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791670453; x=1792275253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        b=LMJDMsK3242JizWdooZ9/eHhzyuX3Ai2xdG4ZnIknTQuUyKJuboJyIIhzPlolYIjZm
         I0UXMG2rmCsMMMAyzXwgLbUvjuH4Ei9dUQFr7T0vdnRv2xwzZXZlw+xx0YFyYPh0iGqo
         vePTnFi++VpqeVW1y+l64pdfF4t5R/nC0Ry92eyL3BHP9ULB9hyGCCgyiwgXQm6Q9KSN
         99NgUEMW3ke8b+ZaN0apnZPoEtO3pS3VItx6Rchy4KUCD9OWO2oUduq+3OEnA1vHqFxa
         AvgDgZ9ULBHgtnB52ovIxiNuTVWfSKJ+bFeqpSmTsZqD8nyknnIcVKfzmAx3fllieLBP
         XvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791670453; x=1792275253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        b=zGKECiVbnTmYxmggvCRhYvcg4hvvxF07PQ+F74/seUYoKX0Qc0bOzHlIDFSMTkFfHU
         3hwqqhEyr7JErCHhF1f80HOTBqUGJr2HwOw1aFY8WerNcwYODEgsolZY5T+m5EqeBA4j
         6kZDREyqsA93atee1F/Tt+NcBpDQ9760axsBroJfwus/U+2TLTySc3czBDmUILKUqydO
         0CoWjkk+T3b5paO0LO9hV0bJaAxCrSaUL+fF7ZNv7xsgGHBE4Kg7Ve+qdxm+tnP9l90L
         Yx3WSyxfUwaNK0XfaJ9hm7siTOeKPaMe9u7HOX6RAfmQVtsrvfKLXP1LctaM4+MRL5rp
         kcrg==
X-Forwarded-Encrypted: i=1; AKwUvBxh2JvG/CYQEmV+r6UftyLXrkOjLjp4mzc49vHGq3HwqjakHB65WvozX/wZ8NBMFg2tDISMmeCXfZo3@vger.kernel.org
X-Gm-Message-State: AFq9FYKOqkFVLwY5M2SyVcwYeNkUsml2funm9PDRxF9ogDgFcmOoTu/E
	CybQFftrsBe5bp5FvXyzscVa+Dd6zKuWby4klMd0ioxe7kwhthZksFIFMc70MxmP+H9sYitmdVK
	khYjLL8gU9++0O2K3zNnnLyNkxvwVEQc=
X-Gm-Gg: AYBFou0zZvsa1PE4Ii7/hvVyxKFFC72T6T8k5SsRWjZ6uBV/EX1Cd/Dq05uRJrpNRq0
	Sm5ea4h0mBYAzfMkl5K9aMW2p52Y8AwCLFHKfOuP+ckG6v16+xt5JlEQ2li0iAATCBhTI1SErDb
	qj3mnRuehusSTUbPQ13buSR1lj+IZk+PfJwhwvHj7eihWBdpq82xKVP7W0DDkXGCp8itqndWX1H
	5TdEO3+HMEBPqavJRcgDlpkeGfEd9oCRw5NWVMQt7XhWWQDoNaaZ8xT1TjmBxuNXts962zJSbDg
	mcleM1jD/AF9rBQyDFWCfggtR9nglnUMScKpC3t1MV6T330cq6TDvkZuNxSIXKHDOGZXNLyNHjW
	8QEmsIIBCQoFe
X-Received: by 2002:a05:690e:803:20b0:676:9240:d69c with SMTP id
 956f58d0204a3-67936275489mr1125092d50.91.1791670453112; Sat, 10 Oct 2026
 15:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-3-tanure@linux.com>
In-Reply-To: <20261010105900.247342-3-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:14:02 +0200
X-Gm-Features: AclHuK8gB-tkTlpSxcPTOLR3EaTkCZhRdAGo-iA2p3YlqPx-9RYK-GDsrGLBxVo
Message-ID: <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +        # The TX delay is a quarter of the RGMII clock period per step,
> +        # which is 2ns at 1Gbit/s.
> +        tx-internal-delay-ps:
> +          enum: [0, 2000, 4000, 6000]
> +          default: 0
Is 0 a valid value? Let's say we have:
    phy-mode =3D "rgmii-id";
    tx-internal-delay-ps =3D <0>
    rx-internal-delay-ps =3D <0>;
According to patch 8 this means: MAC is responsible for adding the
delays - but it doesn't add any delays.
I'm not sure if this patch (removing 0 from the enum) or patch 8 need updat=
ing.


Best regards,
Martin
