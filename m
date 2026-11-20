Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215512;
	b=5qjYP2/hLaJMdE7LHe9rp0hRmr9Svk/fUBhyuHFKfw5e7Pg0pS1KNVNU7NCO2FLft2CH
	 yNWEUwfBK9wW5rrBrL147NRwn/L8OYf4pdj28TurFrZxbzUl2dO2yMgJiP0NYQTpBZjkT
	 0FlZc4oZ99jo8Nqt0kK6CnP87Jn8nQ6RRMBqn8gNneiKb6zQhXoluG4YcCG8gAUr84x7x
	 TQ0SLdUkKYnU4rIYe8VvLhHJ0bN2gOESVdgMGgWxqLq43XUN/hu7T/0/3ws9H2wQ5jtaZ
	 6SA0J267emucyg2MR0Qjlktk/NjG+1bSFIQmGKGD6LU8F32pOExmjFSJtidw5QXrrzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215512;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FIOpzbtnrKtUa/+hf3gLKr00sKzOUXqZqP5MFUWoRpk=;
	b=klBuuyj1Qf138uCYDBPP9QQJSajIU8caPu0zvQ8l/5hoVbotEZElaJiD97/Zu6czvNe/
	 SJ6lBitG8dKLMDu5w4iBXeRy2JKPZAoBwMJ5PrOMKHk71KLTR07LXj2ZoytrHnRQabh40
	 zPylcjRQDDoqtveuXeiC2IiXj9AvAWNOq67QycFQJ8NQoKbeHWpQErKUSsZPOr0cEgn1F
	 aARnaV2LqVu8Ol7ydchw0hcxWs+1tOZJb9KcilGyVe+WewWxjxUw4aUQuQE3rsdru7ZN+
	 8H+CYCW/RqqUvFbpOup98eXaoCKATQwLs0TQ0Oo1MUzNa9Puivj5aTwtfF5OMWZamkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ocoupyr9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325BE606A69B
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 22:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ocoupyr9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B051F000C4;
	Fri, 20 Nov 2026 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795215511;
	bh=FIOpzbtnrKtUa/+hf3gLKr00sKzOUXqZqP5MFUWoRpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ocoupyr9RnebLzjzZf+qX4kfzNOy8W4KRUPACqMQGrNIVbPwnbu6r8HSAItaQy3YO
	 IbN8CXWrOc7CNL9inoCpbyTP2tplt7FpomoTMooXYj4dPCfN4DpzFbKenTf8m7jW7N
	 AXkwahzxTeE2nQXsB9wzF5KmlY2jXIT3vA61+ZVT4szmXoc3MRqIPgpbhJuO9khP6Q
	 m2R2Haa7ZcZTRlQNNvlx2wumXY5wkNgGGlxbEUXETWKt+b5K5wNMw6WVZdl81DvWQ4
	 gOCzHCKnvT6X8dCkEcys0Vv+IRSKc2dTZSTsj8x5Cylky5++tPxgiIps9F3sb5GWXV
	 ANdMvYkFplTqg==
Message-ID: <sashiko-outbox-226325@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 09/13] dpll: sit9531x: add support to get
 and set frequency on pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119225752.41846-10-arouhi@sitime.com>
References: <20261119225752.41846-1-arouhi@sitime.com>
 <20261119225752.41846-10-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 22:58:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dpll: sit9531x: unretried NVM update in sit9531x_prg_commit()
  on error
--

commit 94b9cfbb99f072a3656d39c3238bca0469693ed3
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to get and set frequency on pins

This commit adds DPLL pin frequency get and set callbacks for the SiT9531x
driver, reporting input rates from firmware properties and reading or
programming output rates through the VCO and output divider registers.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index bbc17a514c5ce..d3f6955b3bbd0 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
> @@ -460,6 +460,101 @@ static int sit9531x_output_forced_hiz(struct sit953=
1x_dev *sitdev,
>  	return 0;
>  }
> =20
[ ... ]
> +/*
> + * Update the NVM shadow and re-lock the loops after sit9531x_prg_enter(=
). The
> + * sleep is the settling time after loop lock.
> + */
> +static int sit9531x_prg_commit(struct sit9531x_dev *sitdev)
> +{
> +	int rc, rc2 =3D 0, rc3;
> +	u8 attempt;
> +
> +	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,
> +			       SIT9531X_UPDATE_NVM);
> +
> +	for (attempt =3D 0; attempt < SIT9531X_LOOP_LOCK_TRIES; attempt++) {
> +		rc2 =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,
> +					SIT9531X_LOOP_LOCK);
> +		if (!rc2)
> +			break;
> +		usleep_range(1000, 2000);
> +	}
> +	if (rc2)
> +		dev_err(sitdev->dev,
> +			"output loops left unlocked after programming: %d\n",
> +			rc2);
> +
> +	sitdev->loops_open =3D !!rc2;

[Severity: Medium]
As reported by Jakub Kicinski on v15 [1], what happens when
sit9531x_output_divo_write() writes the new divider bytes, but the
SIT9531X_UPDATE_NVM write in sit9531x_prg_commit() fails while
SIT9531X_LOOP_LOCK succeeds?

In that case sitdev->loops_open is set to false, so the background poll
never retries sit9531x_prg_commit(), and the new DIVO register values are
neither rolled back nor committed to the NVM shadow.  On the error path in
sit9531x_dpll_output_pin_frequency_set(), sit9531x_output_freq_get() then
reads back those uncommitted DIVO register bytes, updates
sitdev->out[out_idx].freq, and sends a pin change notification for a
frequency that was never committed in hardware.

[1] https://lore.kernel.org/r/20261117021818.2220307-1-kuba@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119225752.4184=
6-1-arouhi@sitime.com?part=3D9
