Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661003;
	b=Jt3We2CM7oNBVnkuu4U/rciQxQZimlm0rgEROwhdrOJAnzORw70sU/xHkokhDnuczTva
	 h2pTOs6QdQTI9YuZKZuwQ03B0wUis6M1ZnajKKkk8U2a6jNGf/i8W1C09ussz5xMjoC9D
	 77n9wj8VyOT5HvEr9rlqU+lPIhvwC8oKGrSPydCBTnEiYZPB/GCYniFDBAOBnA7jL4mH+
	 MtJCTlyAgtMjit6xiCa3pZNE6jNu679ejGrnwLxavn6fHAerY/Qi/Gjc2b1D7PZVQEL0g
	 D6DPXfCYtFTQEYTMpS7n2HctLgzxlXM/MZo7R6lpE0iykE0cjmKPcuYwWEuGz071vhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661003;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CzDnQhxA2IGwG1S+MSyz5T4mghlVNlgfIGD03W+DjPU=;
	b=aAePyMbWXIdhwkxllxGiCGXFbDu5ixcN0+LITZSD/F4cs2XWjdAjgSm1aCtRzpM0vHfq
	 aQBOSzF4ffQ4cWgaeGmQZNL6ungsOm17tkbHyKWTVb8iQQXRaTEomfRrEJz/u4YY5lSXD
	 A8+pbEt6jjq69vDO3a8w0663AHiqirdZPowJNU2zvwOp3f34MAxk/wN8YDb1JfuWIs9xU
	 KSCRRVETClUXJEn2eTDUQiWmfT7rAlhu787HB0d1WTMCFcWJ7boX613RD8XB+B3dJ+lax
	 1fMQGXfcbxdnosQUF9bOhFXBv6S+yki6AB9VsUxorWl4OG1imzI8apLlETUDVlXirMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCVzNZ7A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04314606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCVzNZ7A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F01B1F000C7
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661002;
	bh=CzDnQhxA2IGwG1S+MSyz5T4mghlVNlgfIGD03W+DjPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kCVzNZ7AVIraFnGuWy/V8clT3ISDKxjx0XkadJK2jr7NMB4Pe4ffzu9w2yqIEyj6N
	 1GK33H2n3Fx9q7xwPsQ/GgrLLP4nXioMcXsCV9nPouj0mTOJ7HVeqQQ3gBmZmILxhW
	 UxMsYHJSYt9bNb0jsmCHIkQCb3O/pyh7cGtfQYPipPuEu/2CRXlz0TZdfImEULaMvr
	 hx/tp8kXM4tAJidvx1W9uiOSom0Wi9ztx0iN6JRi2lp02HCh7sjaeH9TbN4iXdHmnl
	 vDzVU7E3Xx+s0rNR98A1as2o1TTILaq2BRJkSouuvCrmsGUfjVVqkAYk77DgSnYict
	 N/YZzSKmkA2ng==
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso850225e9.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:56:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEiPka6MuiIZHdoz1C6KKN6cWAdukTqQ4f+5YUI0KBbTph7ggf6IDvHiT4T4Xz58oj8ze7lKfWm+ArB@vger.kernel.org
X-Gm-Message-State: APuU4Z93+tBDHZrQGZgHWg05H/S8hyp3DMwmoyp/LJ4802ZcTLdYSpm/
	P0GxCMxPw+aRWK60WHPBkr4vfkfrsMn8dP6pwAzgqsA6FXpCWds/U64LjKQjX8zU74QFenOA0Xo
	ffCRc4rEwwnV20Ej04yvOGP/05NFG3a4=
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id
 5b1f17b1804b1-4bb55a99ed0mr112169185e9.24.1794661001252; Sat, 14 Nov 2026
 04:56:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 20:56:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSHBu3qVmqQDfmn4wfy2uGY-bGN3xKxqpO=ULVfoXD3-g@mail.gmail.com>
X-Gm-Features: AclHuK87BF-AIKO2shVxwQUjV8SpcPDdYGTchA_sgB49NmXU0PUHvZ5gp9vekk0
Message-ID: <CAJF2gTSHBu3qVmqQDfmn4wfy2uGY-bGN3xKxqpO=ULVfoXD3-g@mail.gmail.com>
Subject: Re: [PATCH 02/19] dt-bindings: riscv: cpus: add the XuanTie C907
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:33=E2=80=AFAM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>
> From: Han Gao <gaohan@iscas.ac.cn>
>
> Add the XuanTie C907, used in the Allwinner V861.
>
> XuanTie is a brand of C-SKY Microsystems [1], whose JEP106 ID 0x5b7 [2]
> is what the C907 reports in mvendorid, so use the csky prefix rather
> than thead.
>
> [1] https://www.xrvm.com/declaration
> [2] https://www.jedec.org/standards-documents/docs/jep-106ab
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 0da219ae6769..bdb119ab8ee0 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -48,6 +48,7 @@ properties:
>                - amd,mbv64
>                - andestech,ax45mp
>                - canaan,k210
> +              - csky,c907
LGTM!

Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
