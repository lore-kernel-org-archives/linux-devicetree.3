Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377592;
	b=d9CTLkfndxFm8ITN34AsMno7j+YjAWkrC2IMdtPNofXkdbUyRK/VUkw+LcxxFTsxN3cf
	 1HLleVN0+kvB4ZfUbhAFn6Lff8lTjmm250svok7Cmc8Lbi+TZU+vRdxV7kzOYKZcIUsPq
	 r4yRfK+jPeZ17e8lQt7wi7ZU9IwD606ImjBTQ/+egP7LQm4sNDKQVRmuaPUy3Nq2TS29b
	 /jmM7sZyJaI4JCyIttupgtVcafOZyGd2qP/F7ZUbkC3+0ce+z3blfet4usFPBXYOH0VRg
	 VShQxOe3O3GVJLRSzx4ZqYydw/GFj9jRuZOoOC3sabUktPgAGO1LkSELD3fjuIVhVvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377592;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hS+rLYQpPQo7cr5nb9uqxFHEAlKH7SAJLbqNhPkjfzw=;
	b=hS1hGrHdgM02bwBt74RY9pK9N5C4Snfx3bxHqqTbG/yNxmnfLVpQZFMJr/6pP5f4LAs6
	 ZRwQ+dqb2eEnwF5LWboyyB3SK3zNxuyXNC9kVDMf8GGfzA7JtuhXVVvHpSHEHeO/8fGzO
	 wrqQoFjbhLKudnAdpc0GG2yhKoKroY+k1yQ0VOfqAQbKpsHydnGL8CETYetkB+BEAQQMy
	 Br7L6rhsiaNJ65cCc5tk0ca3d6Tye4Y3d7/CoL64H2Ou4DWnllzWNuiZpB9A6oRi9bbtV
	 594EPPOeRNjmYxR4a+wxsIRt0m1AdyXJ/eGwlpIIRAi+eXkv2LXLutVIy4TKIf4628A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8S2wxzS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B4606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8S2wxzS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E671F000C1
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793377591;
	bh=hS+rLYQpPQo7cr5nb9uqxFHEAlKH7SAJLbqNhPkjfzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F8S2wxzSfpI3XS2R50duy7R8ZC8VDYBCBAhG/KUx2IWeK22Zw27Uih84z/0NlmflS
	 bi9ab1LST9xG6zQhoV/FRVlNYtRRAPbu/kFGJYMocthUqmw/ICnFE9d1Bl31QVxuE1
	 Zy2M1QGoMMJGW9cTJcx/I4oiQrrYEO0zZ3H2WQ++9rfi4w2CHxDSpvOvIBHb5Ecgym
	 Fk92f9Sx9ACIKe/9ePSxsAJ3ix+zDhaTWelzVFu5bzj4loDJtB7rHaBFEbCl32LYgV
	 6zFA+N3ojDI3vvpMAfbod5G1PEYkshD6dCFn/Ts2ZojDeMVn8WOQ/H+xx8cXgsi7Vz
	 8EWzfB+yaQHyw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1154144a12.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:26:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzEqrnxxt+lK0XkT74le4gVWmDiqFTqt8/r3ivhpew7jLWsw5EPLQb3l+aiivm2RcCqtJjtjdi2BBLk@vger.kernel.org
X-Gm-Message-State: AFq9FYIS+hBojr+z303Kllaayvvuf5KokjXFpzCBcKuhrpZSV43aY0KL
	4TksG9dQZozvBLdXKsOcdC6vK39rWUzKxuU5266LVIy6vYQSbD4yE3z6fy1tbk7RLDg1tVJPTad
	2uOLqP/3tz11RR09WLCNyBJxKb+DPHA==
X-Received: by 2002:a17:906:f595:b0:c43:ae92:9a9 with SMTP id
 a640c23a62f3a-c4ca7aa3e0emr267070366b.33.1793377590568; Fri, 30 Oct 2026
 09:26:30 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029224843.1155201-1-dakr@kernel.org>
In-Reply-To: <20261029224843.1155201-1-dakr@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 30 Oct 2026 11:26:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLVJ2S4bhE-kSLM3Q5VzWStuTVZk7sP7RD5mP1B0ydR4Q@mail.gmail.com>
X-Gm-Features: AclHuK-nQBbKy4gKK43XfqZDxGiS_yeHOcBQ7MwShw_wdc0eH6EgYHj_NsV3Rwk
Message-ID: <CAL_JsqLVJ2S4bhE-kSLM3Q5VzWStuTVZk7sP7RD5mP1B0ydR4Q@mail.gmail.com>
Subject: Re: [PATCH] of: unittest: Require BUG_ON_DATA_CORRUPTION to be disabled
To: Danilo Krummrich <dakr@kernel.org>
Cc: saravanak@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:48=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> With CONFIG_OF_UNITTEST=3Dy and CONFIG_BUG_ON_DATA_CORRUPTION=3Dy, the
> machine no longer boots after commit 5b5224220747 ("refcount: Use
> CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors").
>
> of_unittest_lifecycle() deliberately calls of_node_put() after the
> node's reference count has reached zero. The test expects a warning and
> continues to check that a subsequent put does not produce another
> warning. With BUG_ON_DATA_CORRUPTION enabled, refcount underflow now
> triggers BUG() instead. This panics the kernel during boot:
>
>         kernel BUG at lib/refcount.c:37!
>         Oops: invalid opcode: 0000 [#1] SMP NOPTI
>         CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                 N=
  7.3.0+ #14 PREEMPT(full)
>         RIP: 0010:refcount_warn_saturate+0x89/0x90
>         Call Trace:
>          of_unittest_lifecycle+0x158/0x310
>          of_unittest+0x105/0x130
>          do_one_initcall+0x127/0x350
>          do_initcall_level+0x7c/0xe0
>          do_initcalls+0x59/0xa0
>          kernel_init_freeable+0x118/0x1a0
>          kernel_init+0x1f/0x140
>         Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x=
0000000b
>
> Make OF_UNITTEST depend on !BUG_ON_DATA_CORRUPTION and explain the
> restriction in its help text.
>
> Fixes: 5b5224220747 ("refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for UAF=
-related errors")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> Alternatively, we could also just remove the refcount underflow tests. It=
 seems
> they are not really testing anything OF specific, but rather test the ref=
count
> implementation.

I'm fine with that. I think we should keep just the first part with
of_node_release() error check.

Rob
