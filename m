Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708356;
	b=j+m0ci3W5u2OIesbqgfwvk/Ge6p2pUaVdmuCQ0eiYNvFy9q1uLr8H1mVnSA/lTb7M4FU
	 bmESxC22zW64DMm5i/aKoCYLbMQ7zO8JSVQ0nUAi74mI52K0BmLsedE/nfrDUWO2wms26
	 TayLI6U+MaTAKMtJUEM2zBqr0KYOpDGXQwv2ULXDlm5kDoeQUQz8qHa0Rmv0DqrU+7dvw
	 Sr5lXxfFrCItpgkXBaJGBDKy7jMentQj48pLTIzDNvSK+xnAOVs/XEFR/CHctpEwYmSbh
	 Id+fXI1Zt8T4y/dm1o5jbP07UXIA+iBqRIQTapRBEGETq/ohW0dgxR8h4QWsk2qgQNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
	b=ZUMmaBJGfV6wm/kHXYEFJIf+ZjahFdygApN8lKPscZnT6gz50P+SFW1wn5rbiIJsKyDx
	 EloA+YTxcjOzHycDobIcBaoqkS5zHUM5oTWnKJ1isrhw5x/bNQIE9YidmgFZvhBGjseN2
	 cdbWwyP5lwrLxG15HvbSRl6r3HU3KcrvWUFpIfiuVpKt60k/LxgEgQrRRoX6j2o33Cgpw
	 xIHroMwZTsGN+wobXPJykv98EFhH0Y57oUCwE25X2wioYBz8YQIqHRF+MKBk49hVdHeUy
	 tA74z3KBlf+o/25LzqNaTIz5c84DIRk4rRJj1CpXGM9nhqhxhSRux559kNAIJl5qsPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbUr8sYj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9E4606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbUr8sYj
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38699cf08dfso8778386eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795708355; cv=none;
        d=google.com; s=arc-20260327;
        b=aTWa6roZTYX2KHRT6arCsBJ2yAwghb2jfwY5K8ikzNbAp6tbjC+YeVdfuAK+u414pc
         q5HP2bt86QBoVMcP0vgQpy3ADK5AdN/FSeLEJ0OGXkxjoqbB/3eE4vUAcTz8yZSUoraC
         n+D+cvG5cyjOPGDNvejmh2DCPiu8f/DKlseU91gcwCo9/Xi2FZIR0YGg9PIgb+BRyRXx
         N5OaBUvS6A750Lpe6XMs8Y7qMdMY0MlkMD5nKAjD4t0pYG9Am3oP2qoQ746HBfY8jz7i
         DuE4YKcA60U8arEPvYPakKb3WQyYMsSV3WZNzbPiZydSe/h0pkhmuUw7caelXX0Eh24k
         edEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
        fh=uuJOiuXY4xiiyBB8jWveo6CuigyuKsp+weRiahZCVtU=;
        b=ebUT2rArXrH2zQwBMKJpA5pDLVAY/i52z91TvsoU0046zoQ+tlyb334avMHliMJL8q
         p4+QLyb8eC0Kn1tS3i3jKdJ74i7zTk9AHgxNCpkkc91KZqYgg3LmEvDxNdQ+wqRhS1PI
         GKjA2Girt7KHHN8PKC74nhCfdRF4O3mZtoEi6bDDdZIGXkxQc3lDMl77SEVmB+zv0PHu
         rYKcElMXlXZGF87z3nmWq/fTA73PYN7SLZ+jF3zjMTatXWeXjM5M0s0Gul4Ai8sNHKPR
         73WYLvbS79iFkTSUn+bWUVUzX4mgXG+VHxMAE2tNckk26vdpjdd3XVPxY0au5osO3cPN
         L89Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708355; x=1796313155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
        b=vbUr8sYj+6w6aQJb8FXk0OrpubZlXupvHF938s1OkK+EzF798QEfaWCZACZGmfPEUE
         FljYK2YDMbRbTtt4D463cFgs/SW2IDAmqaAZerwExV3cBTCv1iE8Yti1ketbrHQZOs8L
         RPTkl68xHo6xPUZZbX4XwZ4JEd1fBuMwvNvFV674xCbfTem5IRov0WEx4qQaYwmHk7U3
         7EuSkPrQOCnkC613XUqI3Drz9ubLg/WIfeqwnkLo8eGEo5ZnOsYsBfUVem+Cntfc8Vt1
         SvUQjV8plFoXFZz6MwwKb454wWDgR3Wg+QPBRj/9v2KyIdbqqAX4UGtH5buhWe7iz571
         BdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708355; x=1796313155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
        b=NY2T+8bMwRPNW5NHJbZyZ4Z6auEFcd7VFtaTmfbxYVJ1001cKeR9VOl/S54Xqb2YqA
         hyMht9g0MXSeg8NtcSF2L9mqey03OPwDyzy/1hYr9JdRpyccq09dOmzGqAy2XhCJpDKM
         zvs/TjBheL9PkkZCo8YJOUgpTV9uNDm3WxngoPII3w4G7gP+/mOIyKtbgqdmglSI4yaJ
         nA67zkPZQA5FnT38nplgVJfxST+kbnjoc3/0F6IY5j9eYrK91Z5vv2GZ7KzdwyDw48BE
         6tBA7i2Wfbe+Xza8pTDvC6vVQEV6krN01TwNXBiqh/ObpsGNnyscWLKOykcZBzD+io+q
         Bb7g==
X-Forwarded-Encrypted: i=1; AL+hErHXdGyxd8LXqlYAqWC8Xf0ZwnBmcqfaBto1NnqwMZv2qMpBi1s90BfDRDiZTVV6NjcqamZNi0yGH13y@vger.kernel.org
X-Gm-Message-State: APuU4Z/IsuEo++pgjZOUD+rqUjgcg0zeh0PaGAoypdv5K0esxnGCvUa0
	0tMbDHMe3zhZ9lYSbidv5ftvUS6AFDrAY2v/v5PLV/+SiuwRMOq0BUni0SwTKc2lhiplfpX23FD
	Hq65bn50qB6IGl9dTwByVPZ9iabI5V2A=
X-Gm-Gg: AZFdTZeZhoP3Os3cIxcQoDmBdhRwkl1VR1zH1ZvvYvhSSdpbIyUIazbpfI6hef6hsBp
	WvnL6qdolG5fUR4h8BqW/2IOv+8EQsFEC6vdLK5qrfUkWCcuFB+f7AGCtpqhKOfIxsHf42DV2d0
	Jwqq9186xKtS7OdiWnaakEfPuctfiUfYACjfYpxirScjMOcpQxEZ7PFlZrXVbr9HCxP1aiKXo+r
	5pfeDpGWC7xfU55yOWJgkVwB9xIAj16thKRckbMxXgjhL2bGW136RhOQXjRGuHdF9Hdp31cnMH5
	z7E933hMM2CqAKBTJoDATUc1k/5wY0dmBoeF3DcdUgms8dTbxtK65VDSudfJO9QN4MzuH441lL/
	r8RYfc0QhRlL9HOzMM5nBnk6cQUaqLo02EioOjooGb1lIqOhIhMiJrC4uQSOA6T4917yNKtuqTT
	naqiTQLRAHx0RyPfss8djCLKR6wGK5d6Q=
X-Received: by 2002:a05:7301:909:b0:386:a3fe:44f3 with SMTP id
 5a478bee46e88-386a3fe48d9mr16927412eec.4.1795708354752; Thu, 26 Nov 2026
 07:52:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123150224.199601-1-clamor95@gmail.com> <20261123150224.199601-2-clamor95@gmail.com>
In-Reply-To: <20261123150224.199601-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 17:52:22 +0200
X-Gm-Features: Aa3M54rc_YffzEFCwnfkuVALbinO-hBCm-HlGDzQA_xhS0kZ8JcE1X-SBdlekrc
Message-ID: <CAPVz0n1GzY5BJLUZrdCgJHrkZ+45Kix7VP05EJeiY5FVycwKBA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] regulator: dt-bindings: maxim,max8907: Convert to
 DT schema
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:0=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
> to nvidia,tegra-regulators-coupling in child regulator nodes.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/regulator/max8907.txt |  69 -----
>  .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
>  2 files changed, 283 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.t=
xt
>  create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max=
8907.yaml
>

Hello Mark!

This patch is prerequisite for MAX8907 LED patch. Since Lee is quite
strict to what he picks maybe you can pick this, LED and ADC[1] device
tree patches?

[1] https://lore.kernel.org/lkml/20261123150725.212836-2-clamor95@gmail.com=
/
