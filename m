Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246184;
	b=ZWYRiadOnvRbIuiurDF/Mzt+MlDWcftVWwynz6lNs0z0oBalq3XYKOAdH+MtDWQDR6rx
	 3AT9y7fl7JF4SHGUnlFvP4D4fHC34Zj90kDaLBAmdjnHfi78EpEusTuh7hZcvZ+CVk0Ic
	 Of+6/LgVjn/ziPNIwM8ocXQYNvkexOWV2kIwsfbMFNdjfxXUi3KyTTGTHP+4Pqc4azkZ3
	 BvM7Z6JQQEM4w31ARzwgEeJ2wbhN7+ya+tIC7duvAFIibcDLyvohSUmQ6e5IPkorvy2aT
	 PyOuim1s5QE1ipN+TGJ0nP3VgVDzdDZ3R6oX9AZ7Ov1FxUWe4YYd877vHsylYmQNXAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
	b=gSViwV3+g2iU2WbdfleReQq6EA2s13WO2z2xRtb/43bsz93IB08G9yREWVu4SONI9eli
	 UzKLi14zTQTphrrjg7101EyMnwA1pZFS2t7LsrZ7Grw0h6YVq5kjqQf2Dagenc+uulPnW
	 osbJZIR0M7/pzBSV7obRWO4L8f+MNmnN9zecJadODyUzdfoVka1YJwRN9Df8fiOiPLO/F
	 KYigzIYJE9msuWBlRVtJrMQVStdtwzQPKeAvmVrDWZ2OgIrRfZpk6hTLGC+tXlayAwKjb
	 oT0FLtTc82SbYO7iKJ458SLQY0A0N9DQgCLsouEHiDQp9vmDTOMZR3HSu5tjEkF9b7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckZoDddc;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA5606A326
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 17:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECA5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckZoDddc
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4918c2d727fso605420f8f.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 09:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246182; x=1794850982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
        b=ckZoDddcTDuBB8D2f6vOtjEQlPoWOfaWhUmDEC61PQ0X0I+yEL4gEl5NEH/GGcwKWJ
         m0SWLad/8xv8sXKhB2ex0GoEl/vKHwM4LWi7D4bbNIyr5KUfSAdRJY+CM/A2eRweKoar
         7i0/2AzyZy97qJxXeaOO+fhMRwAPMikx2EC3jEzJADjIUKU5xqX9L+MtbWhs1NWclFTr
         NLmkJ+KaN4LMAT3AIypj3QwrDkVE1vYGvramUDwAix4DzDNmmuiAdd8KkGVC5ROtdDVq
         IPuncVm7K0fdgckXudrURlG7B60nVfPuG4fDg/J4bz7uc0lyfzFoJyKEUW4BvlWXnLTL
         p9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246182; x=1794850982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
        b=o8cWyeCAZTgEFbtqk6B1CkTRYwLJOwVoh3Nj7CaJkaiUxcNg2jdmph040MrdS1T+9P
         j1/wMuZdv6IllcLqIdpqdOGymFT053Zq2RNYHgrF5uEb0RzkyqHknP3jadZTozwu5Stz
         8Y3qX5hYqbSQT1uLdoeQiLtx1HOb8Tv26RyIQ3y5EAM1BZ7TSqbemIOic3qG+8ZqK6cR
         9Dhht+wf8QUBUWJxJVTrW//Xfdpes3D1AJzOqXvnS4oJ/ivhSI0PRpx6iVafkVxEs9IC
         iMw83xUR4e8pI9aXf8UDJNPJbdBdKtvRtLIjsaQXyVNeCG42LmEyHt/q/Zvp2RtjkgKN
         VEcA==
X-Forwarded-Encrypted: i=1; AL+hErEUmzgmbnn1QL0P4WfkQGPzuscFSd95WP+CGzyinr6yo5YZP+tB1sMMB5m5cdiGJ/9y6stlsAiJIx4i@vger.kernel.org
X-Gm-Message-State: APuU4Z/2JixBkX/4iGexHcN4lJTe63Ur3wivkQ12vNJBHvnTEgXxD6lg
	5qw9USiylArdWKy5iASEMMB9B2x5efvdSVZPC48L60BbVvW4K9Ccx62y
X-Gm-Gg: AYBFou0IGulR8RaZZy8dYfXzowY2j5baYLqHQcxrUyzUXJuaRjZZFNLFtfczjemrHsp
	MltoXX2X7pQri+kNWngDmgcMlnticNNANhWYa9nlF+A+KSrYm0Zp9RefAEpO+LtBIcR6ylir4JU
	Vbr3Z9owa6IgZu5RsVjB7Lf0cUK6q2K1CX/mE3aTbN4OgDMKbVk/ZNcdPjhBvC4UufAbBfO6NdO
	BMoxnfDLaKqnHXkLriagG5hUvzzspkuSutPxiMleOraVD5vVsPu6/uynSi3jnsYputEvTVbco53
	9xdKasShkeRCleZMVbEA8CeCsaIzVxkxDqR7glpL+r6DU9Lf5WzJbSPw2QmHuZk2eYDnZvvwSIq
	YKdwXYertv32IdxCFv4phvxvRzOYDyaklZ6792zz9vskj1un+kl41fNhkpByxuHNS0j84ShOuk0
	MbtWp1tpqyZHnHtgYIi52+ZwHn466LsmtB6ooJC7O2PFmNFCsVNNRDHoLVFQPc0hW1hXkS4TlY5
	/Bq1AvJbQSczsbmeFR1j7RCQ4B4Oe0ryC9Jw+eW6krjX/6RqG+yAUGGxyH9tyY1GkQOVnqVSF+l
	Gu2W9Zr2EViMryk3pIdEyhylHeo=
X-Received: by 2002:a05:6000:38a:b0:48c:72fc:363e with SMTP id ffacd0b85a97d-498309aed15mr286975f8f.44.1794246182227;
        Mon, 09 Nov 2026 09:43:02 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f175c9sm157557f8f.32.2026.11.09.09.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:43:01 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
Date: Mon,  9 Nov 2026 17:42:48 +0000
Message-ID: <20261109174248.2086482-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cdfwfoubvs6dvwojrjhryjejeqcpmtllu2ko7vhjcgxshgvsga@65rliahvcppf>
References: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com> <20261109-halliday-tlmm-v1-1-a181d54214cd@gmail.com> <cdfwfoubvs6dvwojrjhryjejeqcpmtllu2ko7vhjcgxshgvsga@65rliahvcppf>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 09/11/2026 16:43, Bartosz Golaszewski wrote:
> On Mon, Nov 09, 2026 at 12:28:37AM +0000, Stanislav Aleksandrov wrote:
>> +    pinctrl@f100000 {
>> +        compatible = "qcom,halliday-tlmm";
>> +        reg = <0x0f100000 0x300000>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&tlmm 0 0 225>;
>
> make dt_binding_check will not raise an error because it ignores
> non-existent phandles but please make the example correct and add the
> tlmm label to the pinctrl node.

Thanks, I'll add it in v2.

Stanislav
