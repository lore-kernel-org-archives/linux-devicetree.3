Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58C8399350
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 20:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791751206; cv=pass; b=s8MixEeBI40Q9GKL6sgEstJOUDgC6kmnzG2/XW5o1uZTBbGOPSOL/FDtM5iKFESrIuwAJmwfBDgx0+/J2BXyTQCs/W0YYNGgGnuKfqoqpdtu6kJ+jE1UyecQxhKxJ6Mn0r444JKaxOsKWsu2/T0BSdTCKkoX6ka0CTd2XSyzuhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791751206; c=relaxed/simple;
	bh=s7QSs9fGt4VMsaclyqUaQwH1ssV6iqtI3sGopV8EknQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYbS0iZNiR5HULhJSJxZ8CY1QJ3Ri88GQasIW6OufVah/UVtImqEYef7dxLfNUBDNKUEK3FwicHFD91zNAdV7nS4XubFlQMndx7XW+yPd7IRhMQ7bfNa3+FkgtcRI3Xyhvj3nVk+Kx9l2u05pRse5uzPju57hIfld6aabfcTuv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=e4+9MM+q; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="e4+9MM+q"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-677aec6ddfcso913921d50.3
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791751204; cv=none;
        d=google.com; s=arc-20260327;
        b=JFVs2qJ8WJmSu7NV3aZ08LcZuxnwOHx+nQ8JR1yGYvxzj1hdLYgLFztBU+B2gvH/fy
         hNKpsJ2gB78oNrDZeVxdfivkEyOb4w5Zh04Xf4427J+aCO5sNWcNGgFi2T9hKV2+Rbqc
         5HEIBVSm9eqvvvLV/im/sefcyj0zKGbm5DMWculQ0G6k3k+ZNOV09pJKpRA7I36UlhrS
         1+Hz4UHizXrOztI/FeDM+PlubAKNNz0k0hjyE+qx1Wp0NWy6usGlPXekpVTJP4ADDZOF
         Zjlk8loj3EJT+FY9JYY4M+2jFvhiQPxBYIV8nopR8t/Ky5YnyW8QWLQGlp/bD5VrDeLw
         4G2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        fh=wItzftZCz2rZie4smnKEr1MvHc9xRHBpmQC1CnSz3nU=;
        b=pmFhH4883sYfV0ACY3p0HKtMwVOf8OelF6288ynHAJwV6iYN0bmf1S4VWQyoYfCx9c
         0sMA/+mDnGbLBp9Ae7XnaU6oOWPODrA/ebaacpKzUNUfucVXiMR8BM/2b3bDe0gwvf2n
         LEU1/gSPffwC3DZI7bMpVsJU9U9CJnsRq9XSvCigl1qCDRj66xxkgrwRsUU7hhJqWcKn
         WKoflJOYGmZxx57OuZtuNuTCm/9IevyMA3Nco614rDBujEHV0sKv+tPWa8UYgSs/6y1q
         EPXuTRCtjZ9GVlaaJaf0nxKSQYyVsWBUW9zXQdDzqhY2z6OAmfQeKzpfXtiZ7mPbdl+B
         +0KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791751204; x=1792356004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        b=e4+9MM+qr0JxGl+VWxmS/FNz682ZepVXXvzJaFcio5cnrBi8/Tl/RYQAAWYfAfHYTm
         IsNplr0M2fCTOT5RkZuWP3+Iewo04JrLpbNpg2Qp83Vuv+XoMz9wmmNoADE5A5TtSOKh
         ZT1MQQrRMZg9EG7pLnDFiVtTgEDZ5af2vlB0uQvQEH9sMzu6n9UHzrhTDx2QjjRkli6b
         b78kRbOYls9wM4cby3GcOOAfiqlr3EdLJGVYCMvsVB7ran7bR3NahkHUKYUSL4o9JDGS
         NaRsZ8OhpqEary2VgzniOcJWJEJuhCnN6YLCudfkfUiryjQhbAyObMX+DaMPYrrb4gC+
         UcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791751204; x=1792356004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        b=gWJxgfe6MKKhHelADv3hgTqb5FJEe+Td49QX4AGC7+biEtJd3sn57yKw6uslRq6Nzi
         SKrDjHUEIEh5uUao1RPN1BvB7Rzb0mum3EcjziLXcQGUbVeNRJcD5rhEkZCpVm2D8kDE
         YTxdh7VyLDzVsV38jUC406450L0ir6zQVAlVjzF2zzmM4V999Cy3jPWHdbLkQWOoN81R
         kLzxY565a5wwIIUJU60RWMwqDmfS51XqYrIndjho7AqChdfsyK7r8bbptTcHLf0RxcM/
         5gaHOYfPPdez6t8LD2DcomUTDMumTkMfLOwqwhalZ+ASkNpTTSeuoUZUtT6FUfs6nb79
         xv7A==
X-Forwarded-Encrypted: i=1; AKwUvByOQ4vRWm6yGjh1zFj+lGwvKBG5iiRp8Sawa++bVxY2opYojiL6BwsMZJax3nbsGj8juV+xvxOoeUtm@vger.kernel.org
X-Gm-Message-State: AFq9FYLvMW/JhOw3ACL2H0rGS8D7nXwABVIW8AZFHRHOS0bxaE+WlMGD
	R/P+xv7vpcajVeIislB5/tj7JUaR+Z6lWcSvT6OVpmq+csbVptDAaH709F9wj+EzyDu4C1ERdzK
	DPw9+lAHp9U3bxujdb1SlX7YkpEIdTs4=
X-Gm-Gg: AYBFou3C0ciewh6LsHRzDroU6DAfCcUi/n+g+rrHrAKuFuJuCKUIcs3gTPAqX59TPRl
	9kDvs/pl8s6lXy1JK34y6OeM9qxHjNEVaXHUP4dHgb9rbKn5+dXkNTb3f0KeYfQgbkRb0iuRpDd
	Hx2bccAzZJqQr4xKsRhy1yahws1qhUIWtRQVr/SdFVac8mVLquY8pVglukwmPEui+FZZkXpWlrN
	fqaxe8OA6NNaVUwBYSKpdVHpZnt5ppkWdNrVzM3jVVmqgIZzOqxm7dZi2RSVwNbjjJGzkcSBtXi
	A2ZY2f/yZHocNv17qGh68CuhI5P0Vh+RAXLLt4JZGjgBguwPQOuR457G9B1a8BcK90iC7VlWMlu
	aniXbh8eguide
X-Received: by 2002:a05:690e:1519:b0:677:af43:e258 with SMTP id
 956f58d0204a3-6793629ea83mr1945754d50.117.1791751203712; Sun, 11 Oct 2026
 13:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com> <20261011-odroidc2-dts-v2-2-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-2-a3a4a752f2ab@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 22:39:52 +0200
X-Gm-Features: AclHuK8O8IYZ2ORxL6RhWYJwVEzArYZ9TYqeOkNcn6oWSppRxLJliDi6XNzarl0
Message-ID: <CAFBinCAwqKZcUegwsFzom6398-BVmBFH8sekgyDp4ZPm8qYvUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-gxbb-odroidc2: use color and
 function for the status LED
To: filipp.dunsky@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:31=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:
>
> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Replace the legacy label on the blue status LED with the standard
> color and function properties, following what the other Amlogic boards
> already do.  The LED then shows up with a generic blue:status name
> instead of the board-specific c2:blue:alive.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
