Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7469940D58B
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199876; cv=none; b=g57bPWM80SwVc0l6f+YTZ96G7hUI9YD8ZuPZ0nt8EEJ0osf6Uuj4NFl90Hu7kK1Mk8+HReRbAtTTp8bkesfFxWxBayyiJojS7qg+Rk16l1VJ3KfDytKHUnELWrQ87HeOg0sGiE54iGaEVZ23RsQygJGOP5Kq0IHJ9WMRnsufX0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199876; c=relaxed/simple;
	bh=AP65k+yxpUU43u6TgtcCaLzLnJDCGr6oB9dEvsXCq0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=APdqpYNwaavbycUBQvUYcLZ3bJgPXU+3y4YVNcgSHbKjdsOKwOGewFkdvTuOln7lsUDRXq3wYV44JIAsYlRSOHw83Uslr0pmQWCr2PlvuzVq6aykf2I/MIKeg8euxJ974gp6swVuYrflv6XCnua1KtXopNaNPCOESvcleS236XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkbeNWH1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkbeNWH1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D171F000E9;
	Thu, 16 Jul 2026 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784199872;
	bh=+q0keCaZUuTf0uaadvGzDaUHYOA9oZ3Z5lQLNJf85Xc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZkbeNWH1J/IdpqHns1SzyYrsc4D6hDES6tUT0xc3EKqtW8r6sPN1QHLOjm6Gb5SBJ
	 fHMVgJcDm4InhC8KjcHn0/fB91JrKwpmILXRHoYWW8bMNk0klYmA7yht3vGF56/JMo
	 BraV0m2SivSDeSbilyEcNB/NFDZjxibgEDwROj6c+V+KqErtmNwmy6s1pAxMo8C9/F
	 IOkX30J5g7EDTgxBLmfN7OT5ljbGE25KebEBDFvbuZeSziBvfG+JFNqcBgfCQyTfTR
	 AFyD4dK2QzVrb0HEKJJxNOos6J6aKtf9BfIIuY25zzAm+aVMDP22rOFELfaTlJrwJo
	 wJRIAd1vLgavA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] clk: tests: Add clk_parse_clkspec() Kunit
 testing
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-2-98454e83845c@bootlin.com>
References: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
 <20260716-schneider-v7-2-rc1-eip201-upstream-v3-2-98454e83845c@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 11:04:31 +0000
Message-Id: <20260716110432.03D171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing race condition in `__of_clk_get()` exposing a time-of=
-check to time-of-use (TOCTOU) use-after-free vulnerability during concurre=
nt clock provider unregistration.
--

--- Patch [2]: [PATCH v3 2/7] clk: tests: Add clk_parse_clkspec() Kunit tes=
ting ---
commit b17a28133ab40253da7bfbaf67521eac37a7e21a
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

clk: tests: Add clk_parse_clkspec() Kunit testing

Create a new set of kunit tests to make sure clk_parse_clkspec() is
working as expected. We currently verify if we get a proper device when
using indexes and names.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 048adfa86a5d0..08874cf9b5617 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c

[ ... ]

> @@ -5300,6 +5301,7 @@ struct clk_hw *of_clk_get_hw(struct device_node *np=
, int index,
> =20
>  	return hw;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(of_clk_get_hw);
> =20
>  static struct clk *__of_clk_get(struct device_node *np,
>  				int index, const char *dev_id,

[Severity: High]
This is a pre-existing issue, but exposing of_clk_get_hw() brings attention
to how the returned pointer is managed in the surrounding code.

Could a concurrent clock provider unregistration cause a use-after-free
vulnerability here?

Looking at how __of_clk_get() uses the hardware pointer:

__of_clk_get() {
    ...
    hw =3D of_clk_get_hw(np, index, con_id);
    return clk_hw_create_clk(NULL, hw, dev_id, con_id);
}

When of_clk_get_hw() calls of_clk_get_hw_from_clkspec(), it retrieves the hw
pointer under of_clk_mutex but returns it without incrementing any
underlying reference count.

Once the mutex is released, another thread could unregister the clock
provider, freeing both hw and hw->core.

If that happens before clk_hw_create_clk() executes, does it dereference
the freed pointer when evaluating hw->core and attempting try_module_get()
on core->owner?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-schneider-=
v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com?part=3D2
