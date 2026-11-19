Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097293;
	b=KoHW1EeBSS3LjeIoS7Gobn8R0v/q4Upromc9xV/2ZYm2DCMAwnxQBEdEqMk5nvoy2Rfz
	 FayeVqYpb26/gl0fHxZeGDMZ19sVmHwIJPdjTxShThhU8ElImikW+58WDVq25l7xyrO+J
	 2mR2ZmHJvInSp6MecRnbL+sYNFkE4xTgb++MB+eLQrd5uY4Ai+kaGZX3NIggnmsE53e+/
	 Ls/iKFkHH85W6pXxlDwb5DAWEj6sVMBS9Lql2QygiMSlGQofqePRFwkLC0xajRmGyMhBY
	 uKrlbv1HEDA9onDm+2p+VZeiiXlpoqD4fIEu7hgzteMzjh81tV0tGV53oJIn0pF2KqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SAtgjovQGOJhJVDA6kWd6ptbxhHXvNBnvWsIVbDqIls=;
	b=2nywiNRDCnOXNM6wwv/ZJ1EQ1gzQ3+LApLEYnFsr3iCfNLzzyDPsnV/RVzi/Ru9FsDRN
	 qQRx3aELyw/laKTs8ya8OGrlfczBdgqzHuASQE3K4YXTKFGuV1r+KM5hkw9tcGxicHvd6
	 cD8kvEkuNWh+E0MsGmW38zd0JJPTHzd1JtPSOPMsp5L4/wQnsMsjZx3wj3RvECedCHJRE
	 MJ0kminK3NG7QR5zz0fCg4a3zPechNGc+qo/uziJXdit9QQa/j0YMuG4sWbWTYnpMxqei
	 8zBZqkRy5ie/+l3hHYcSE+hipm4pFGZIv38ZyjTqQpOj7Hc/ACvxuB7zDaojlu86tLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SORAkYSK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F3F606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 14:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F3F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SORAkYSK
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so530789eec.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 06:08:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795097292; cv=none;
        d=google.com; s=arc-20260327;
        b=oO8DwbYF4WEH2hNXvOHGIhhxJhHpXGzDYsAtASBP6gbSLW5NotygWj4/cyoQnR/o3G
         8g9VQC2W6JfLYohtPOzjs5dAtEw1UTukOqmdU3nyPupAGTIRWciHMVqEzvR/2RxITUHe
         5WmMlaeLDIJt5jNk0KR/4SMvPZKS7/j1M2ET6kNQJ8ttq08AEaS+e8Z08cUrVgBJY5lu
         8DpTSLaf1IaXTRMn1Ms1fJyIuJ1hyehMsXTtEVT+236QaVCa/0S0StIidMP9W4qTOoV3
         VryFnULa6GvcRR6rc0jpkuXnJ0Ryu19lniHxo8KweHS5BuZLr3tjR71CKYL5krefA5c5
         x2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SAtgjovQGOJhJVDA6kWd6ptbxhHXvNBnvWsIVbDqIls=;
        fh=Dp3B7a9wJOykBIxklXQtD9F0h2Izh1kqvksZsPfBzJw=;
        b=coFKKQhyeFamyP+GgNc9QGyfpzYBGfknRjZLvYRb4Yi2o4ZcZtbC++hq9OqTJcbmdA
         vf9w8I2pDw+TuNNUHt2F1pwOkKDWVpP9MuK7hTDRng4DNOuLQDjkUpVpDuQMRlyyoA5v
         ufYGoVOfcXC/kmPx7sAFIdZqxlyEToJP37A5M6pyUMY2/E5g5qUugYmb2H/o/yvAzfDm
         x2HyIvnQIo1yfLw3Z+hnTalTX5DP1Dhf2EV4dVbQPv9HciGZJav6srty4ZA7lkVwpaJA
         OGWbZEh2JflSLoBs4qimhFeGyU0iZaOpO9y+VVfNzhPFNO42dnATegeU1/kVFvj7gfZ6
         RiEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795097292; x=1795702092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAtgjovQGOJhJVDA6kWd6ptbxhHXvNBnvWsIVbDqIls=;
        b=SORAkYSKCiBsVUrC6wYAux2lJSLp9amBQwqx5skGYkiwTFG2WZXVtaOUfuh3riWI0U
         xBMC+ktwOrCoH8FRmgPw51MHlQKW+tgeA/LHkkZdch7xpVtF44L4da4KEjEoM1AMRDSy
         pOIXtEQRBw0xULgMlHho/ySW1f+OsK0ZQGdNRQ9fZ8SzDdQvyc6aqpPlMU3f9UXKNR9N
         0+17NquvtilCFrEF2VERzhV5vSOxbI4TU/9+q0FNcD7ANZiJphEQfrGci7OqhtuDxe21
         dTgOmlQbAz017QaLMCgeIkkq/g23I4xvGGdgaIIQgUV074Qoh0rzPCC+XyukoLXrFilQ
         YYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097292; x=1795702092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAtgjovQGOJhJVDA6kWd6ptbxhHXvNBnvWsIVbDqIls=;
        b=uW33rEeqzELboak2TTJ8zptIe8TpXiCnMk0Ce0VWCkAi+q2EznX2abMoCXj0pGsA45
         OUZ/6ajhEZm4JntiJ/8HVzk1P2bYQ4bHOJqrobK7pg7NEVDYM8PbGU7p9zlV5Hs9VAIL
         sPjRhn6rrB78yBzfTSmyEbKPnGKw+TiIm0gtM7MmlOeb54RNWApFMaG5Zktq+s+1Fg0R
         Z/TOiO4hf/rS5FrMmXIdH/gfNiomoYHztS4pWn1TigRz2hHcfDOVF/pvNhOViCwuTJD4
         x17/XdmhOE34U//LKaawHewg8MTOlLV5UdiQKxbwYzeoMLFXfSatwJiDOio/AUWG8KRO
         q52A==
X-Forwarded-Encrypted: i=1; AL+hErEcKXGLYt1r7IxxZcIWuF0EOhWahtHLzQPObqzWAx/aN6av+fCQnPOlMPqCEEkDh6l94W3UDx1qKpv4@vger.kernel.org
X-Gm-Message-State: APuU4Z/QFcGGU6yRRIwT9DcT6IG+u0ii2+WAc7rRYMo7zObW3Ej+ouEN
	CotrtpWvrrKJkAa6HdW6haklXqTI+4q9TP1fAflTpw5PoRLvTFkSU4IGTGP48AWQIo8CBqCaV8D
	0gd6hDOXPaZTnF0t5M4vbWgYE1eHMMpo=
X-Gm-Gg: AZFdTZceu4wjYuheLYcJdKwf3yVzq8PKjI99/tdR+f4agDDSuJQZkTVZjmcG8JPVehv
	45dtaL4Ymof3HKmEhsQmvrYVaLaedcOHaf6m8734XQ+qHwinNmN22vfi1u1PVM/NpnJZswWPpw9
	ElIOhHGjpo2VvGrX0LQL6UU5Ka8/UrNRKQ1PApvMV/D6BXcB6dqgJNDvXO+HUP1KuPnuHND02fU
	RqjathWSN/aucwLM89VRSZFYqfognnHtGd4p1ircXCKdCB2cTWIBeZrtkb5gyH8fHGYOBeorjoE
	+uc8esVAqVKiDjm+7E9cfY7TC4loeJaoKD4wFCMYvA3s16Nv4tksMPTIXt3EhMd86tCS9/1/sOJ
	dCmnjab56rYDNJDeo2yUoSg+tu4pRhv1cwu4Elw==
X-Received: by 2002:a05:693c:20c5:10b0:376:e950:873e with SMTP id
 5a478bee46e88-3827f98b78bmr5050359eec.12.1795097292380; Thu, 19 Nov 2026
 06:08:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119125125.75912-1-pengjunhao409@gmail.com> <7e207fea-8aae-4271-9e94-331464442ae9@kernel.org>
In-Reply-To: <7e207fea-8aae-4271-9e94-331464442ae9@kernel.org>
From: bill Smith <pengjunhao409@gmail.com>
Date: Thu, 19 Nov 2026 22:07:57 +0800
X-Gm-Features: Aa3M54qmdi0dWKA475ui43FuP9edDKAvcfBsoIojmaQTyA24HpB57Hb-KN3eZxo
Message-ID: <CALbS5L1moAiDADSoFrXruB6jdendFpwcyjQNb=OV0MTQeuYEiw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: rtc: haoyu,hym8563: document vdd-supply
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> "The submitter"? So LLM wrote it for the "submitter" and you just
> blindly send it :/
Sorry for the noise. I re-read submitting-patches.rst and the DCO
section.

For v4 I will write the commit message myself, describing only the
hardware rationale, move the AI disclosure below the --- line, and drop
the version links. There are no code changes. I will send it tomorrow.

Best regards,
pjh456
