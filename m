Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97183A6B76
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785792878; cv=pass; b=tWqjgdwg8spU1nuq5axPKeEr6K41Wxl2/2y7Tuu1QcrR5neWZX98kSrB3NS5Xrhh3hUaqrtOolDmd5l8vF5X8TG8B5EZ8xRJ6yEhQ2q6vVUSk29tDPV5g3uMCmzLRLRm0eUqh1iRvJjHVASyopmwvE/GnFRmQbOGcXsLH/KqmaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785792878; c=relaxed/simple;
	bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xahb5EGx+/ULXGx6M6fCe93bJ51kp4vCW2K5scNnQjHdrG8e5irtC5jW5LDBKZ2mbKcRQuxlLm4YRvwHqb8kKd80K22M0MHcJ8KYMeoRhnbJsdlbYAr7IQ/+Pzz6/8Y4vrXsqZ0DrJHbAChMLhpNPYjbyLwEliYq8ZPKw3Kd860=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWOsOIoA; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWOsOIoA"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-746d77537f8so2044748137.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 14:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785792876; cv=none;
        d=google.com; s=arc-20260327;
        b=OYfcn7WXGma0tLj338jDFCM34pan8VrFl5rig57vmBfv/0skYA0AZk1knxgqolHgwl
         9mKlwjmQGiQx2fIZjgmNOu5y3cPOFIE5qOoyxYFiKbjIUW1RGuXa0DflAbY73+N3CSVY
         p3dqqHa+juHhSNFLLZ887JHSV0vEkqdxa0DeGrBcVjw6HAekkunxo/jryTTjQ25grTqQ
         eBvKmtmMH5M6DkYhevNHGXYgs+r4684DrKREzX63eJuxm5y7PZyPhtVOprmtVCHH7J40
         PE/GaS7cqshwKU7WjDvqvGjiFZXKTh5FUQMqARtkn469t9Cl8Q+vrR1zp7PU0l0rHrOw
         qBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        fh=dHhXFpvy7askhNIhRv8QgbzJzmOOj2BVXrUwuK6sauE=;
        b=koldADBShgm2TWTp9ghAdfnvmW8sUYKKzeYOInMQjuZUmWqrh40txyW2TXpgtSKPtG
         5KC/SRztbIhW6Z5Z6maTn7/pa2JQfiy44bTME3aancwfd0VCske/m0ecpr4sqGXuxhom
         IJOFZ2d2Z8jYezz1X9ZM1OtsgDAfOJ047UdvUo5UFsi6STaC5hUcl762vHYSPthZ6S/O
         QS27RMBjXQY6zRKAr9XZNK8DNyS6cD9O+GRIIIq2dnldQeRE0QhTOhMPsM57GKvZWga/
         o3Y/Qhq4nVJRLs9QT8vS32XquyptC/NUqZH3kYnii2rCz5ERTuYXjXTnFdXkK689qBhb
         2mxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785792876; x=1786397676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        b=BWOsOIoASMgYCdDgFcYnvVABfPMvwgFp8bu0TIMQ0Mhg49lbJY9lzaxbT52Y/1xFTr
         Gj9U8CjYBK71vzbzLP+XGhY/uhAKdaPwZS9uPS3Bofpye1Xaleb7fkXRmH8tBUOWm9kU
         CFo3/00vUT/bhKdoPFgysqdwOBzxYLY9cdmZKhbq4cChjaLusFW/Z10d6vL4kJkZcqIY
         YWhUx0j6yZn2wyILRu5gk8YT3HA8h+D46oW5ACgVVycFeZdmwYwG1kvTbBDJdsg5uOH+
         4foB06yuhh98QoZ7elTui0FIvFDXP+qTV3CwPQOEEFerxGCLz9rthm8rbwbErxha1Ya+
         EKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785792876; x=1786397676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        b=b/ll5rjyRZa6OPKC5NIYks6DVH2n7/UIe+7Ze45YTNKKBZmmuV3wZKgGGiFMu7EsbV
         QIaveR+fBT4H1CZk8kTPrwhbrS6MnTQLtFc4Cz7zE4a7HnKVF/XftZJ4ZeIdmMDxuTyq
         /9eo6YV/MTLeOBxt91NC2Qc5Cq9NjXfBk0xAXLUvqv9fF5cEonPFNCJGwhFIwu6tAi7x
         9aVqa49ZK/ZsiNcdDVZRIXQnGa/riRFXg1v0+dcn4A3mfYUihGkGsLzpRCBZ9v+XE0yv
         2veulahxaDPtZlR2GeNw9FiHkta0ayDbMNKFBOX/zVkFakxfxyZAUHbAXdzMHYcfulUY
         3rjw==
X-Forwarded-Encrypted: i=1; AHgh+RomoyT68mCqcqPH+5dKplK0z3sZ4NtAUIyu++muDSM3vkU7RV8IH5awC8+2xZrLRgyumOvaqk1lXIEu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf79P3Jirmzd3yGtaKRiNqyIbhauEmJBtQJ36pxlaiiQW/ZG1m
	cOLm5xOqSij7GWMpbtkg1iPvrcwofB/5ygzbhY92uhLyh8mUfzYvZtOmu4bQV0pb0ONtfEA4OAQ
	/HAa00mxoZRaJqjgnqpS7QRMwdL2Kn7A=
X-Gm-Gg: AR+sD10HQdSBacVfDqECDsWupUmQV/8088N+ELDYINIt7Q3o5tl12af/vETqhWrcR/6
	WtzgnS/+lEEshYo5j/52253TDdozia4a4E18LTW7uKB53aZBAM72p3RXQR++z3zfEoyrJPBpS++
	iEu/SctHwWB7GfAnLPTO+Vgag/ce2VXryuB5GNCJMhVi7QgdrQsQ0kSZHexwT3QJL9kzKgvlDIr
	knRXXhhNpdWLuR/u3TPY+viXsmkXWAHdvmZYlP8/tfkr9FYEgpge2KeMROqszCwWfIEZQ6ynWr5
	xEv3/EvDUS0ygGPqtpfsmdA62Ef+/E5Uu8BiljClcQvXcEW5379pyQHGEqvYhY64+k3Z4ZgbTd9
	UmHvxwrpTkRNnrQ/LtDiANl8vbxGjTNDqEfo+FGP0UWq9P0QXFHbwFkm94IDESRlz/Nw0/tI16R
	ibbxVryIYgfXVLBipRzjs/aI0oEx7gq2FdPADcgdOCliV3h4w=
X-Received: by 2002:a05:6102:c08:b0:74c:7fd8:73eb with SMTP id
 ada2fe7eead31-75b2196451emr9291357137.1.1785792875669; Mon, 03 Aug 2026
 14:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
 <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org> <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
 <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org>
In-Reply-To: <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 15:34:23 -0600
X-Gm-Features: AUfX_mz0nFlKIv_Mdqu5KdrEqoS_kIvG6t--sSCBfp69bBMk1YT6VypHPp03QP4
Message-ID: <CADvTj4rjXGgF2d9Xm6TmeS2LwaM+O2wFFH=rGLA32y+aMk2KOg@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 2:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 09:54, James Hilliard wrote:
> > On Mon, Aug 3, 2026 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 03/08/2026 07:14, James Hilliard wrote:
> >>> The AC200 is an I2C-controlled mixed-signal companion IC containing
> >>> audio, video, RTC and Fast Ethernet PHY functions.
> >>
> >> This fails when applied, because you did not explain the
> >> dependencies/merging of this patchset.
> >>
> >> This is THE MOST important information of cover letter. The first thin=
g
> >> to explain.
> >
> > I did mention in the cover letter that the pwm series is a dependency:
> > https://lore.kernel.org/all/20260703152215.192859-1-richard.genoud@boot=
lin.com/
>
> Apply this patch and test.
>

How were you applying the series?

I noticed sashiko was also failing to apply the series:
https://sashiko.dev/#/patchset/20260802-submit-acx00-of-dynamic-v1-v1-0-0a5=
3cd9e21cc%40gmail.com

But that appeared to be due to sashiko missing dependency resolution,
I went ahead and created a PR that should hopefully fix that:
https://github.com/sashiko-dev/sashiko/pull/389
