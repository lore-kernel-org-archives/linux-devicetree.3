Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C4E4570FF
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727120; cv=pass; b=tInLHO9a/F8roOP6mk4H2ynViaAVSBERgmDKxxG5cFqHHqMOWxlWcjMcMNCvCBG2GSxhMXlvx447A1ygSKNBvjUPr42DJX7XP6d6wVWoqfxU3gabOYeFugyftuOXVOZsO8MIAkHGOxh/68TRVKrkor4j7Zx/xKTk6TTqolIi1c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727120; c=relaxed/simple;
	bh=PQqTMWasXUN28OiYIu8PyJtOpiaTPczvB6SNcoFhwqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YL7W3LIG0NRCiVPsZQhNdgHzG6w39vO225RJFRTLrpI1Sxc1tx5k+vv9OxFsBv/YN5b3uzutwNN++7lCj/NVahYN6PJb0gtBZR423ncc69J0NXqHow3mKrnxXBnZ+AdHcF3Z2rspUU8BBmvxFXNff9pUX4qfhWvBYuwH7NxXzn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbGJZtXi; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbGJZtXi"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35179d0747fso69650eec.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 06:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791727118; cv=none;
        d=google.com; s=arc-20260327;
        b=ZMGGHiEUWeOQMIP89pL57iTI9gIirQ24/ziC+ZKFS6/TV/Vf8qUFDa+cKZ+7SqMFl6
         6Nu5+KUkrRdWhbn4fH+dL2Rq5Ip0z/+XFkqZPgFtdhrjYl1olyo4AKqmqm2OM3jN1/Af
         wUd3/A1dGqX8cne1RBfe+fg934ncfDKJ5fX1ctzVwm8kqJSDsnbOI2BT/Sf05ddaTZGG
         7Iq3JVJTHeBYGXGzwvwdQnhVGlUDTcrGEZ62BYY7riQzuifDT/f3eTcx6xxIwF7YOZHc
         agBUGvwcUQ43nFM1ny8kQebpeK68UjutP1ISzjXoHIJjTgijifsTbMS54890w7fUeWig
         TTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SKxUeoIO3zwwN+w8pgZrVpsaKx7RfbD1o2NJXlZe97o=;
        fh=180V86CB8UpkDrMsoi38Ju9vlCvKzqa5r3O0rRADdWs=;
        b=JIsQcuZBSbfalUT0Wx8vzvoRGc2aCgx12q4rbSh4UU4pZIlJTOQZ8k8Hxz4E4u+v2j
         H6h3mpMZJhldzeDopyvQ/33a8G28zrFZO62An9yyApcEivs1D3XM8RGWfuOCrKjekZBC
         vFQjuQNedf3xdoeqJWT9GpgmAZL0x7F8tjexmmP9LUK5CwQ2+24wSqTgeMAihswTTTXa
         Rd3XQmB7P+vcsnpwfsgvpd1PVmZqhYqE6haEetk2CcqpWiuCh1AqcvglJO2qjBGsGPJJ
         QN1FJdtmZf8Wa6VVugJpsLyLsLEov6BjrLhboF1WCLEHpEFfDMrubVsoi/4mJHB6YouH
         aDkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727118; x=1792331918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKxUeoIO3zwwN+w8pgZrVpsaKx7RfbD1o2NJXlZe97o=;
        b=YbGJZtXiShcJultAFQjN7MmEYC2ftBD/VF7UMrxMK2EKoN5Egcwk644i4RQ7HYdJTR
         7aHUS8rWhKCeGxGPThOe0XElPS+0grbEtc0bV5kt3x5rCdtI0fGWJCF5mV5BKRtYCNAg
         905T3ECtkRTCOETtMbb2JmCP9EiY8vj1rF7rNfQ5p0K30KqwrGDYQHIbK40r45hjTUR6
         YVLIm3ecynTjdkOzsJFTBkVmiGyQBNHv6X4W/1E2DC/VkC2/iGfCfX1czJjtI0Ia0nOY
         MpcEXN11xaE/vg20ONZ+nsdsT3eleqy8m0Dkm8y4Gn1wECK8G35GyCmxPTn6kb8O7RhT
         m8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727118; x=1792331918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKxUeoIO3zwwN+w8pgZrVpsaKx7RfbD1o2NJXlZe97o=;
        b=BuZ0jBX94KZOd3pAbCDBGUrinEdM09VquSAR2xkZaY83isBYdzabFRbqt8qWrQTm5T
         VIm4PhBwQswzqNrLoj4GCSpn8MCw4Um+K0v1+d3hxIYlxRFY5QJTmDFTTlL4RxXzPykR
         m51VrAfF96bbYb5lC3p4Z8EQ2KZwcitKp1iesYocERHnUmX7KFbZMDHjWxxXxhngQlyc
         hXjAad3dbnGYjsVL9Blv7vbE4MV5olyfrsxuWA3cDg5URQDI02bFEovuuX5pgbL8DBW2
         WRzPivCwpycctLugAY+dbbPe5mYJ06xnmMBJEcXut1PeJdBGbD9T57mWZYQv0h+gmxL3
         sDnA==
X-Forwarded-Encrypted: i=1; AKwUvBxDKnp9R/UrTY+ZeQgzeCzR+e/eGThgW9YQBX/37QdmSQgKubF/EaNudiQcocgsCcXlWzpWU1/+sr+K@vger.kernel.org
X-Gm-Message-State: AFq9FYJBaDU6pmpxJ+hngmaOOugcQM82v926vedj+Ohqj02S3c3lpQlI
	mP2qSX8tSA1mqkb0unquhYwZ064iD7klivtNHujT0ZXQEkJZaqMSeR7u4t2VhTqrkJL870G1VXR
	vZ22TQLEmSmHc52GyZXfnJ3cG2l4AgzZC2atLJQM=
X-Gm-Gg: AYBFou3UOQqZ39LoEcze5mRKTzAn6NvQUCGt8kaOXIEYORMcBJEN1a0Frecc3U+EnY3
	Qb0mUsI5VbR7rChNZURpeL+Frttn5wZEj9QtWmLuIBAc23ilOHbkSzU90vQfRr7z06cHCWT3TcZ
	khLwjB+Er30SHDLm6e6ly+TKDkcHV2dxGWz7IgPzqxZgBPHcB/nsvOwM+4BfGjTrPvGbDY6BcPo
	N3uJwGPav6wm9ehjnG4Tvg07wW171OxoVNhWBEJ4CNNrRqblrDt6gAhe+k7ljv5k273qIjcn/ez
	CLXG0Nq0qLXAUdiClcEMH3tr4pHf4bYLOkwKr4GqtHDEPxhO18z23IjsIHBJxEu0GkW6NH0Xib8
	yVLkqWaTwH+xGSCVq+f9ZE94bBAuc7pbcA4tRRdTLc5grdzbdj5pDAeGlNCtek2aKs77PstiY4E
	PildKMZix8D7qxgUkiBaGmhVQSN4GFADE+aEHPmsme7m4FF53ZBgoi
X-Received: by 2002:a05:7301:1523:b0:357:5c8d:55ab with SMTP id
 5a478bee46e88-3575c8d5ad7mr10718644eec.1.1791727118284; Sun, 11 Oct 2026
 06:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011132353.272824-2-blum@kernel.org>
In-Reply-To: <20261011132353.272824-2-blum@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 15:58:23 +0200
X-Gm-Features: AclHuK_0YdNEf9Mt1KyViOklEAgHvn9iYL1y3YQP7fOfshHxLhbMetQuvRACLcc
Message-ID: <CANiq72m9r1UToj1YV7ZwMGQEPfW10ZVSAgd29VQJg_mpmpXOug@mail.gmail.com>
Subject: Re: [PATCH] rust: of: use safe zero initialization for struct of_device_id
To: Thorsten Blum <blum@kernel.org>, Nils Lehnen <nils.lehnen@proton.me>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 3:24=E2=80=AFPM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Since bindings::of_device_id implements Zeroable, use pin_init::zeroed()
> instead of core::mem::zeroed().
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>

This is:

  https://lore.kernel.org/rust-for-linux/20260828122444.475-1-nils.lehnen@p=
roton.me/

Cc'ing Nils.

Cheers,
Miguel
