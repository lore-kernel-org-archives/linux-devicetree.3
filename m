Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587136;
	b=C2Sn7CUMJwf9xl1OgAo9hu4NqvUKje7y75cerUm031QRs8YsYuk/qTVCfkSscM7Yew4h
	 clRiFQ4pyo/KPvWd4/ZJPNYNoa59Sax+zdq4450Ttj3WMmRrtikxC1jpfowvVMx5yFfnt
	 964HnABft/DbpE1JsdvM97XSRyplzUq4nQXpC8jpCUNGL9cYXfnn2fZG1AqI7xQNFZ8O+
	 YGT2G73Yn499azfDL2z1hxmNvUWkFYsA0Yixg+RDhRDH70lfQZ3ZBBbPXjJYz4/ugCba0
	 sfROyXCb0gNVW9P2XF72D7+/zWKhXwLhwdc+heESVRszskRsqhBj728ZDrEWdUQCsMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587136;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Jci9qiUbYMeQLnsVE23Fk/bmS6/YaF98wtPe2dPL9Rg=;
	b=DrilU6iPk+2K3PUuKqYn7nPSenX9g6mSGmHA9h35HuWmZ04rWzhw8dGkz0wSVFZiJwig
	 eAnDHfm512yQcBXohHPnQ574l+GSu1pGAJI7R3iwMI7gu4tGxsQROMLxelKRiJxXsvm3x
	 r9bVhYpdAIF0Ti6iBwOIbkVrM2KSj8j2FOFStw55rLD/K0jqpAECk+eL2L+3dg9Pyfjwl
	 2IfNVYf69aEZsDIxVacWHYTQQ0/zwjvP3stEaw9Z0JydALTS6iCjOukmGvMIyw5Z8SC6m
	 Q6eK6UqRIf1TwgiTNMCg49SsYmbVjMcjaqVjDLwwxO6B3ixYHdofIiZBF24B8Cpgwbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF31606A334
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 02:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF31606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1120565a91.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 18:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587135; x=1794191935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jci9qiUbYMeQLnsVE23Fk/bmS6/YaF98wtPe2dPL9Rg=;
        b=d7dD8Hlaq6KG9Ld/+CzhKpOrYhX54uZTU0UOFMHuyPi2A5kK6MfX5IpHlR5TX4uh7W
         jbqFVGoNFO37QWdgs2bnrhUyVGPZZKl//EBt6Q7pfsZWc6MetBUqOw4OihKFfGHaMUYd
         cxlQnWckEcqoParBdAiZ2JJ/Z5n7x7tSqG8cOstAgAo/IbOAzDwXqZ2ttX1ayzYYFmZb
         WmYrrOrMMkPZX1DI1yBYXNIJNZbhO1iesHl817yHE79hpfDvQo/Ah/zPXsNJdcaiu2vc
         1vF4mwkpZmYP6DAywrDpp7rkxdVZi57Xk9uj9Y+1p9RXHgmnIk+6qsBfEonLyXFoXJcg
         J47A==
X-Forwarded-Encrypted: i=1; AKwUvByTWrV43xlMaookvdxQiuxxu/Er2BEnEwoBL3ZoMlBfDiuDWFnTV7fzfM5faFZoWy6iyq3prWXxr28i@vger.kernel.org
X-Gm-Message-State: APuU4Z+7xJiUZWh8MR37ftv8cQVWa3EywbBPYYck8JBbNtAcRwmfRIK0
	umyg+1c+4beMg4bv+p2OWSSb1ZKcgTSr+PUa7kC24k2IzJUoIQTBu8GQ1o6pMz0p
X-Gm-Gg: AYBFou2uwWoPeMbj/zIPQQKw9w5dmxQV4Ry+ejmUO+ewvQpsn9LoPze95ubN9YhX5Od
	kqKYsKWzmpJHrym1xIr0i1ZqdTR37m3+Mwz3m6Q7Q6/Ap8wNdtVt4Re9FOXGTpNNIQXG7qoehZC
	/meYj/qPt9J5MCrIM6Yu2jsXdYxlNi8wDWIoRQ80+AQ00s4JpsEppMODJM6RxDgtDpXcyHqhReD
	TlaYoAfH8tdcI4x5W5K7Q+dAH2/hSPlHnIRtfWUpuGPFHl1m/M3qGz3nd+9AZB+UOpxe7vEZBod
	8StYYbH495tWx8uWH+sQynBmjoy9eUt3QRzhtfEgYZY82jbEi4DEcn5m9+Y2YcbZEPkGGy1WjwD
	mvCZrj0wDLhpXR/8FE5q70zOvXOwnH/C2PYEnE/FY5Kaf6TSK6u5jS/T71dylbFD/I9TWZdF/Y4
	NQzUZHZb6NCdw3lG+mJhiUHObgP9liBg+aq0pYc1yCc1KEMh4abxtbCzIHgoJkhkxncU5sYbCrw
	as8KTcBB7ZgucW3TevuctuhjaD2hjNMI8oO68wVbfiuCOqvZpHqlO+cjTFzfo/8swtSuGsLOAA9
	O47ZE4IW1vGvYtKTItgnE/rpdNuoBAQdkM572KDZuYJmEpPMuPR5J3lxwLnJCA4tuLLyyTMJm8N
	nUCSCw2IbxuX011Zv8MfVb3Ad941CsubwpXVwdZ1tHUpmFwW7geKP7mL8v493w99PTnA=
X-Received: by 2002:a17:90b:48c6:b0:3a8:6045:5a24 with SMTP id 98e67ed59e1d1-3ae897e0e39mr6430288a91.38.1793587134972;
        Sun, 01 Nov 2026 18:38:54 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87fc548fsm7528855a91.4.2026.11.01.18.38.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:38:54 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so4757773eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 18:38:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxaIPE52dNrOvlIyMiXPOu6FBwk9rl5xK6Em0HXkj+IZ1GOZThIl28WUFNiu5ExVsershSb4TCabaqv@vger.kernel.org
X-Received: by 2002:a05:7301:db8a:b0:36a:279:c93f with SMTP id
 5a478bee46e88-36a423fda77mr13492128eec.33.1793587134291; Sun, 01 Nov 2026
 18:38:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-9-eb51eddad08c@telaak.dev> <sashiko-outbox-192833@kernel.org>
In-Reply-To: <sashiko-outbox-192833@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Sun, 1 Nov 2026 21:38:42 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6GHfhAp9Ck6WakVy0yh5YjG-TApW4zaOp6vAFDGivTaA@mail.gmail.com>
X-Gm-Features: AclHuK8Yeg2RaovImaieDc_RzvYkCKj9n4PkC3wjqPhvqeEv6To4mOIylRyTbUQ
Message-ID: <CAPY4CJ6GHfhAp9Ck6WakVy0yh5YjG-TApW4zaOp6vAFDGivTaA@mail.gmail.com>
Subject: Re: [PATCH 09/10] leds: rgb: ktd202x: Fail the probe when the chip
 does not answer
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 9:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> - regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESE=
T);
> + /* Nothing is read back, so a failed reset is the only sign of a missin=
g chip */
> + ret =3D regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_R=
STR_RESET);
> + if (ret)
> + return dev_err_probe(dev, ret, "Failed to reset the chip\n");

Please don't apply this one as is. As Sashiko pointed out, the KTD2026/7
does not ACK the reset command: its data sheet says the byte that resets
the chip is followed by a "not acknowledge", which is to be ignored. The
ET6326 I tested on does ACK it, so I missed that this breaks the probe on
every KTD202x.

v2 will ignore the reset write again, and fail the probe only when the
write that puts the chip to sleep after the reset delay fails.

Joseph
