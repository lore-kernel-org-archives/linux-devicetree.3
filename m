Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883477;
	b=2jSJyzSD0ulrm8Y9CSiBWopYmXj2SiNKER43IVxWYmmnYB/x13BwWt1OwdJ0lUqEqwCh
	 0qDbCHM+dp5rOCpPHjmkGtuh0N3+59fBRiipg/X9eGiIXSqmTJUUZnOSrttiAVSMWksZl
	 YymqT2m8mGdAQzahfpGCNvUstq+j9W8DvXaV2eRP4nBP0pqurG7DQfvhNRhnTXqx7uhVW
	 nEqwZzAFztWsppiRONkbhdux9mcmuIGUQ7yM9ti0z52t0YzmuDIqBCY83UFpmT000dXXY
	 f96RuzOaEzrZea2i5pPLFRb/QcZBV3dNXX/mfsX5fVuGV3QaV/O2SlvLdaNswncnDpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883477;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Nyw4uo1UMx2UMwcj5/86TrpcocSt85lTij3scmNGbos=;
	b=lmDofE783BXNCvpMQ2HbAVozMv6bNg4YxgaIPHfExQ1vWSqc4iHcVBHlavDoQ07fpCcp
	 g5l2CehjiYSj16/4XoBaZr+Wjwz6numhyWioX9w+F6geeYtHCYOvknXu1fuyxDBfh43yV
	 sUQ3SarAHXVx1AkCzfFskGGdZNXj/SDS3YShspLkAllMTMnXVAFnTbctC30Iyql8laJkW
	 sMxWuicZfS/AWs8zBrsRhv7exvqmGdYSZ5riZU4VqHcVLVTb3+fxREO2At87HK/u/Ue1O
	 QiEvP2FofC1RkSYhKlTTTf60LqjZHnZGij0nQPC4dGS7pTMdtwOk/fTFRr8G/VqHKQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQrjd+q6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E6F606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQrjd+q6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0211F00A02
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883477;
	bh=Nyw4uo1UMx2UMwcj5/86TrpcocSt85lTij3scmNGbos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cQrjd+q6nNpH2xoYNC3OC/u9iIITjUzXz6ZPttJw7Yk1JV+VJxUNiRy6fOdG4bo9h
	 GFL0O6lgYfzlBm/5jsmbAw21QmT0Eh8QxIptTWVhMwkCm4qXVZz/CshS+7P4QBCqq8
	 gW+LQNqBud8EGNAJrdghHpvGnQ4zBjEQH/6kSAzl4d1gRk88I0MYMfGmyR6M9rWkRX
	 UVdzwh0ZHGw+rb+WR7LAKULmUgS6ZY2jnsiYd6BSzAQRB9fL9iLfnR9M5XDOTbZ0wD
	 Lh4aQYThFILqsEH6JCp+daJ9LvCemhjVrSJ8c3hux1kPtLmdfD5BBANf0wCmCtwJUW
	 V/IbQPTgfpjvA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso1248569e87.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx5roTRvIMls9VenQqPClsd2NijjmJSswz7IKiEEAoJY/3e1khwNEmEo6CVWcApBokbLz+VMoZFsTtf@vger.kernel.org
X-Gm-Message-State: APuU4Z9l66v85h1qklZEBNMK6OM1IqW63Cz970ddY7reKCLdR/c3XgPN
	yhTVEoOWRNDbTCEzukP4/GR1mlFo+O90rbGJcXyBDuGtoE6D/DTNgCqdbQnSL6qnI1SXwo00Eup
	AVjZ4rzeIKDpW5QO7JtiP7ddM0mwmIus=
X-Received: by 2002:ac2:4e0f:0:b0:5be:536e:cfbc with SMTP id
 2adb3069b0e04-5bfd9562ac4mr7119062e87.17.1793883475976; Thu, 05 Nov 2026
 04:57:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net> <20261104152657.14909-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104152657.14909-2-mateusz.nowicki@posteo.net>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 13:57:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLkYxFR89WGnQKvPgCLYaE7Le06U45Cqn9yR05fa5C_xTA@mail.gmail.com>
X-Gm-Features: AclHuK-1e9C4sXwoHJ54MvMjIKaAAfliTo1iA6pakb6j7gBlL_TeQYZIIK87yhs
Message-ID: <CAD++jLkYxFR89WGnQKvPgCLYaE7Le06U45Cqn9yR05fa5C_xTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] mmc: mmci: do not count a data CRC error as a
 complete transfer
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Yann Gautier <yann.gautier@foss.st.com>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:27=E2=80=AFPM Mateusz Nowicki
<mateusz.nowicki@posteo.net> wrote:

> With datacnt_useless (STM32 variants) success is 0 on a data error and
> a CRC error subtracts one from it. bytes_xfered becomes 0xfffffe00 and
> mmc_blk completes the whole request as successful, although the
> controller stopped at the failing block. Reads return stale data and
> writes are lost without any error.
>
> Tested on the STM32MP257F-DK eMMC in HS200 with a forced bad tuning:
> without this change 5 of 14 reads returned zeros, with it all 10 reads
> were correct.
>
> Fixes: b79220b3e0af ("mmc: mmci: add variant property to not read datacnt=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
