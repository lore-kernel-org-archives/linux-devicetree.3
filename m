Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566A74398E4
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 18:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387785; cv=none; b=mKHrqcq+v7WUxnb+iMP2gvkVWNAo65cqo1EtMpM0Z30ixm4glyPQ9WBuUcwyIqySBa6PDrchPTZI5b2neAK8xGrz0/PSxHGdheprDxU6EEqQPy6FSjmGCvprRMP8FSY6x7KNdBpASpXFC2Nb7MVZXoeBBEa96/0pgPcSXlpGDq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387785; c=relaxed/simple;
	bh=hAQbiBdb/L8L3hFDxA7tlwzLJflj/1mJe11rh+xIi38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tama+oCmtiPRXDXqvAHfN4SWjDouU7pqdHyJ3SIPCTNBybUFoSxOz41Iv4fcgwIg3iyLf8EFBwhzpvVEffoTSXqoxmRQuM4AF4LdcldCtGnsE1VlowKjN8Gqn6PqN3czdVpBtjTEdYFFP48erjAgsAwESvdOTsYNnRRYb6awXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHLuknOK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHLuknOK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49553515a8bso34604525e9.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786387781; x=1786992581; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcLbXw1HtxaVkLOq1A7ImeYJkGmUUOjnz1hGZ+5xdjY=;
        b=qHLuknOKWsaqh3kLSUIuizqZTvIUvwmpvAvAoc4os91d1AWP9G9awc0b5tnZXQiyzI
         290FT6BOj2F9u0EUsn3mDHi6jF/uEShP6gfVlVn6Bduz/c59kdxXDHgLuEcmQ0FaSb+Z
         796xXld7zmA8H3MCWxhizDZk6ucIGiObFVIzyJyhddLhsghK+a11LQi/EigSCz/1aAbH
         61otZmsUokjqaPe/OTpBv4JwKNeB1J/4424rAVb1Uph0l7FZMJMdF7hzwk2vG5IIAwHk
         OHh8eoaIuu5gN1RWzVtljBZ9gJxjX8EXuu2q4nHFr9WJqsXoD4BNeWCoLO1NnudGC9ws
         meqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786387781; x=1786992581;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcLbXw1HtxaVkLOq1A7ImeYJkGmUUOjnz1hGZ+5xdjY=;
        b=gBY23ctostoArXcquwT3TtuPShcJMqvM+EEaBWwceytHH1oWb5Z3WEZpg8MdgWpIRQ
         Bb17IziKPMJ20W1c1LJ8K+c9RmhcC9CmVB/svM7oktPIiQtqsWe89OzkSr9S9/HnUn0q
         ZCZEM8DDlMZpbcrSo1TxzMLQLnB2z+AOEWeC0tis/m4w0PU/xbMIjD9dtBCBYfsz3FMb
         ml+THTkULVNXB7JZKTOVeVHLIzjqKEXZAKlLWP1M2xC4lrKZMzp2En7THR0cKq0kDhoW
         /8ZiFw/y9RTaMPPGD+z/X0QxmkWBr20QCw4WnzyWM43c7A8bjzXQ1AKCrbB7oYYN5HvG
         ijBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVF6vanQC1ZcqgYlNx3FfE5bianXr+RIdW7If4mgdZKkSLIann/Mo+ysAhwHmL3blVAQi0Tr5gEXkj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl01vyRxQibmxait9PetwKCJyBXothAl618dYZ6bGFC6Dto1mF
	eeyDDqMS6gsEZlqE+CSDObK44fPJI33qI49f39/CnFOoa3apso5SxYhf
X-Gm-Gg: AR+sD13cKPkf6D0jcKVqt/jmY6H1McdCc0Jpxi+aJYsoyMGpOmB2snvqOvqqJByv/f5
	QPFXweuCTuNivKMGH2w/0LH7bwRDjdiJM+BZE7+m1HKrLqRGry9a8+oII3juQh5eHj8txSiTv7e
	iyCOs3tiZIleh1l3e5S/n7Xnkc4qP2giH6SFgGe/arDgGCJgrtZejZOlha8pLNK+x3YeUvMRR6T
	QKQdUtVXAysaLKLGsbSD22sBxNn/LBRH6Bll3qrpwh+Q4xhqyIcTO6fwOq/EUV1edpQ7TcCT+Kj
	wvkLHHeJOgVYXy6T7sU4Qu7syJJHJNiafuTysebQBbA3XMk8ptgOcz3s+UFyVKoYTrbTZjAf0sj
	qaIW8c/ZsIX1qdN+WgK7gMfmmQNrVCmdkGcZC6RJhJOSiP2FR206bGJmLpuDSNcTpjVr/6Ol99+
	HfBJHiw4tOulndJJHjUFbNTw71bJrm4YFrN0h+0lPXMWjGWbghzqRykhsYzeDmbAKnUKfzU+h9
X-Received: by 2002:adf:f4c9:0:b0:47f:f3f9:ae37 with SMTP id ffacd0b85a97d-47ffd21da75mr38161242f8f.7.1786387781329;
        Mon, 10 Aug 2026 11:49:41 -0700 (PDT)
Received: from strix.localnet ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002206effsm33568215f8f.32.2026.08.10.11.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:49:40 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev, Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
 neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com,
 conor+dt@kernel.org, mfd@lists.linux.dev
Subject:
 Re: [PATCH v10 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock and
 reset controller
Date: Mon, 10 Aug 2026 21:49:27 +0300
Message-ID: <gypuIvsORyye1Tbviu_vVQ@gmail.com>
In-Reply-To: <20260810153805.GA1793660-robh@kernel.org>
References:
 <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810071224.5AA301F00A3A@smtp.kernel.org>
 <20260810153805.GA1793660-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartnjexxywtRIihZLyUay2Kiw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartnjexxywtRIihZLyUay2Kiw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev, Rob Herring <robh@kernel.org>
Date: Mon, 10 Aug 2026 21:49:27 +0300
Message-ID: <gypuIvsORyye1Tbviu_vVQ@gmail.com>
In-Reply-To: <20260810153805.GA1793660-robh@kernel.org>
MIME-Version: 1.0

Am Montag, 10. August 2026, 18:38:05 Ostafrikanische Zeit schrieb Rob Herring:
> On Mon, Aug 10, 2026 at 07:12:23AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider: - [Medium] Missing `resets` property definition in
> > the YAML schema. - [Medium] Missing `simple-mfd` in compatible string
> > list for syscon with children.
> Neither of these look valid to me.

Yeah, I removed the resets property in response to Krzysztof's feedback [0]. 
And the syscon-reboot is registered by the MFD driver, which in turn goes back 
to Conor's suggestion at [1].

Should I reply to the list when I think Sashiko produced a false warning? In a 
way it feels like fighting windmills, as it will likely bring up the same 
warning for further patch revisions.

It does find a lot of real problems though and as a newbie contributor I feel 
like it is a valuable tool.

Cheers,
Stefan

0: https://lore.kernel.org/linux-arm-kernel/20260717-uncovered-feathered-groundhog-eab16e@quoll/
1: https://lore.kernel.org/linux-arm-kernel/20260617-deed-snap-4649ffae0e27@spud/

--nextPartnjexxywtRIihZLyUay2Kiw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmp6HTcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi6FgQAKm9IYOLqegfSaVNChHC
dp6j7VY8B5nPtUGsRfYZo5T7Vf3pKufABFbR1iabCxwC2IB3jXx1qz+24mCXVDHo
XuRq29BeEeDNBoHh7GNUkTagt+HRHV79yD4tiBNvfH6Mly2NHUeIOOoZ8ZRi8TmH
I25u5EuZmqCO10wGs7DDbq5ak8DeNsQvk+MQFLxzi7DOdW6UzDv5enNFEoSPj5JW
tMuj2EoKw+LIT12rkhXAPpUroKtHknKtl+SKolXU1ZjNOgxMdIgRKd5EsTMCWqWe
Xyi47x2kKDp0a/wSX2kBMUOQZn645dEQPKyAiB7uwEBQIA8PQoxuB2+wBZqXpQ1z
PE4JW1aAPI5uo+ru6LAMss467ZiK4eejRNWoLsnyVaaO49VwtCjdQftqPI2xC/Dv
+4aDMhJWJ6+VXFLC9HMC4lz5hggYHrsLfeMARDvyt8YSRrW6+Joh6bjGx5vxt011
h/FLE4TsK++xPYar9OjtpXLNN2HPi2EBibVVWP4pXWCcm0mIuKXa3jNANUObUBAe
0z54JE4GKVlIvZTRsqUUlzk/pnQLE1KwLZ5oX4O79537YTkQzjBNmGRZh0NM1SmP
quoWwa8alZw0Eb9GRPZOFstwiFhvB9mzis3/j6KSeHekWUIyhHfrKhl9wFbezAA4
wZpFmf+iiVSkrDq/xp/ft93Y
=7cJL
-----END PGP SIGNATURE-----

--nextPartnjexxywtRIihZLyUay2Kiw--



