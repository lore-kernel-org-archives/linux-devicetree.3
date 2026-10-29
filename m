Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284911;
	b=sWRfy9Xe6pNnvy4CNj5/4+tPq3kkr5DYlK2v1ECaVmpBcGkZ3c1szN8T6GmoQKAB/G5B
	 m42CgApXeJ6z0eOxrOAUywwab9+K34+WB26VJardk2uDDtQ2PmcfSMsKfpEvFu/nI3aY+
	 r/zh3P2ALDlryZCgZT7+wgTyI0OeJefdycMvksROZuXdvq+74ySYxDMkg8H2KV7L+JQzw
	 qWdfU/GxrHjtkqTuF9qvfK5SnrxV2AnB1M9+mhBt3O+BqhHsG1NYjvKgzcw1X0Tq/jLqX
	 mE5DeQ3M/ieXHf5kLzOyj/PxXLjwQB6+JiNksxhHyFjLmN1GTCcm+xTIqUwUek/R8BQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
	b=c6KeJg2cc1iHlHQFX2SWoyOm1Rh63h9IgCfmF6mRA4yGL+F/qSS6RXsrOTlnx3klEnvF
	 vvpWcpHOYQxSGrH46mm3y9cLgLtchNJB3VJyRyzNlQPhzf9MkdMrXeiUVQuyM42+lJ82N
	 C4cVYFRmterZxF4JZodV3HHxyLywExck4hYO9YgjVFDdsp4cwP1y9dKWD94yFuotj2icW
	 VU/IA30mqxjVqxReyVj6vcyauOlTNBqvdDOuYO4mTwdxRoT8/Jw4znv1vWi2u9bP/4bJX
	 sCsbzrzaaKdh49f0iJZWhiQpNA8rFJJZeqBwnQ0LS3deSCyy//Levxd2uoHeugTw+dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hghgDVpJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7991B606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7991B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hghgDVpJ
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c37b612635bso315781066b.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284910; cv=none;
        d=google.com; s=arc-20260327;
        b=Gx0TLCM7sUu6e3neDvLXOuwO35GdYyRBwIzItM9gx/LFWKbvhTY2be8fVj6peGPJF7
         6OshLlCd9qwsX8K3HAz8dKsBysAAw0cSj+4W+2G/TC9P+rjGLa716IMaQIiAtFAaHnHH
         Wg9nDgTwMd871E+bZQbJZPAILIsBr2W2P+DElgdH6tUeXcv4dnAXk+DhM3eATrBbI9LW
         Es90ByAu1PUSVuJmBYS3vUk1wkDNl6zpu8JxZ+7DwceHWgDZiroNQEWQhx2pCzxcg7BX
         wrD502BNWneiNrRFikVlIfStQjNxweXYOo8xsv26ykzemAMhkSE9yb8oOJ7/WNAnFT/W
         fCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        fh=NMN2LTxTL44mYM8PGF0GSW4j0jFjEQ8/6r9YDBp1iY8=;
        b=kiC04NnfYFpuNQqP1+OHCGsGUFByXc5cFTAsJIq+LLt81GoIxS6+DhtmxUhIyqyaxA
         PwcfTCCI/aQOAEtBCLHPxLgVWWgyglY8WmpK+b2iSzV6ZVBIGRqH24L3HLQBLQb95xrD
         wsOv4pJTBKBp93IS10XxR7VF/L1MT+mVjOxsqtzqb7Hc8c9erZwq1iYSxumO2YQqE+Ft
         IrZLN/cgpZ9OizP8Bde/Hag7GLSeyoI+SrkJVgH3KoV9+HTbLhCdSrO+ztbdi9m/COnZ
         vAv6+qrI3hkUQ7ijm+TESjz/ThVE9l2tMyv5L9BEShgyK/SA0WLArj9DplUXh+OFc+tZ
         x/qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284910; x=1793889710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        b=hghgDVpJP1cXYyThMA1gZBdoGMjiVg+rqnG6FbqVfyG80atEPkE+cfMHmoIWezl/C9
         XrtJ3fiu/AY80LVVtY57ZjKn4y8UbkNImktFCWOyd3Co5HvUDG0Zgu7jwoa53114S6H0
         sQMxRUtrelRiRZw9bikrEPHMBNppKhTRXp7evQQN/7A66DZ5P+sf4Nft0PN+W56HvYa1
         6pV51HwyGHwt33FcOXYuLrtRybOk9jaLF32W6SgSIJ2b67T2J7yG0qeIyqKm8NBiLxy4
         z8QoX/bA3wt6/fPsTMAsIkQ1yTdyphOax1o3EO6z5sFUVJbWXgGJHl0EOWOEJMD645jT
         fTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284910; x=1793889710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        b=bQXKGXY+f/tDWM07YnsN0SQZVuY0VFVz2tZee/uHByc0gw5wSXbZ2aawkKzew5bm2O
         5ALZs4nMM12dcPuTbxiBAVeTDAxX0zERI46lnPaYJO9kJgJIh7qv1cPmK9b1v/kDJRQo
         NKhGNddLBku3Cju2bM9uWX6hJinwQdBZ9KSXbz9dkJtRHncbqtwXgeOsE/VKhXLK6D7P
         1wHpdb8j+HGOtQCU73ypzTdtui+edQol3JxLrt6hjXJsbwoR9aetVdj7NLzZtlh1UIFI
         aVZmKO+lQxut/VgU+vKwTIgv2jgrs1fmpWJck9N6jcEkgXLNrIMveqK3W5eu3rZI2a8e
         UGxA==
X-Forwarded-Encrypted: i=1; AKwUvBzF5n6rfvhhNhl8HCtCiRGKDVVWVeRUdeqoE9sMlV5rEbcj7CBI1sVeskH4RWXgAksYdg0+Bq+0sbGe@vger.kernel.org
X-Gm-Message-State: AFq9FYLJSaiT4mWCaVQLMlITay1jJ6d+CvdkSIieEa3n7DLBrtmxywzL
	8tbTFnnCb+Y40PI8hwwkED4MyQh8vO09zpxlkb0OQ15p4bFZJZuI+3J6rv89HkduGJ34/D6AF1s
	QmqLeRJwdAk5ZkoZN0Qgp4UhqimSWbQ/a9w==
X-Gm-Gg: AYBFou3Vbh6NdHEAz2pxR2Q0Cu9PXur/OIPMbFznXPmghoYBYXyt8HmHYytohpaohZ5
	sv+OK5ojAI+tct+jLo69del8L9XnfUEcnGGK15gofanwI7oqtSpCyUG7K7mgglUx0FrJyomUaSS
	g4ZFSDY5dWPbne91N01Iax6MdhsG1ZbAGFz6a1ELtm37q8UJWLsSXaX5JzbrXLHBqY5oUntBJ05
	+Q6nqfvXXXFC2rQ84DvzX73/RC2ok2Mqgi4C41ikl82jmFKSLhdlbC9bmFDF41Kj5uhjBUOkQzB
	Kz1L3zA9G2ibaeCi17TxyzLBVEYJQfThkmuUn/CvKCc3I8ZOcGlPapen1NnbiVDvUHXPBpiwZe2
	Ok8/NFNSlAZirz0LeljprWXbJhz1fhmlU4V3pmLhrFycSZjFtmi41Yb9SoOBf8mKrgXD4QmlfiI
	QgWqO5aSnW+nIAEbdovVyj2lsXfn3k4JbjoGqnacZBsMwgSiWNPwc=
X-Received: by 2002:a17:907:a88e:b0:c46:6a50:40b7 with SMTP id
 a640c23a62f3a-c49bdf25ef1mr512176766b.10.1793284909657; Thu, 29 Oct 2026
 07:41:49 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com> <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Oct 2026 16:45:14 +0200
X-Gm-Features: AclHuK8IDt-muCciisOmWbSe4tpMQXEP57E_Zd-8ek8gdIf0pEg9SXZFYjLfJ5w
Message-ID: <CAEnQRZCT2ghW69zvZZHPb+GHVLGFO=2A2hGxjuM0Phqjve8xgQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] gpio: vf610: drop unnecessary wrappers
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:52=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Remove trivial wrapper functions vf610_gpio_writel() and
> vf610_gpio_readl() that just called the relaxed versions directly.
> Replace their usage with direct calls to writel_relaxed() and
> readl_relaxed().
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
