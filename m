Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250457;
	b=i41xMLRoKuwMkQns9lKaW+USj7s+QIbjA4YC6kF95/lutiw4NyEUapUZt4wi2nGGSQb0
	 c/JVD5uQf3FyNvQVo1OlqBSCOzFcNgFQjN0jHMG4rLyQhh7pLG/P8cmTEwox772RRbvqp
	 dGXRtwY/5faXtMqFduJQXB2ZsPwYGuMb0laSWBjNApVC2yxZ5evEW2fOy4boUrUCFjsVU
	 hbKD0+m/DR6AZSd5NgGy4JL6gUJjlLtzTYnRyKDHli8GvjKd13ucPSKNwyV6/T6sM8RHu
	 ifkKCaLtieHgzd36/wdunFxz5QKoBwkS7vocaaf4FZAveXBnZ3xtFHPDrQgbMDYnAVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
	b=GlbJTCMYTFXJu5r1yGTfHCWUu9TFEEe63zxe9XyaMci4bi1eJiBO5unOYFo7dHg+M+IP
	 5pxCpRiTHIpMA6vknrPhqh6CJUD3bTqpAhhJyHv+MeGKD96PTAS5YjSPdf+nG7yJuCtS8
	 G/zAsDszg6TwAJWGwf4J2xXpXPa+V6BK6Dl6FjoEsecm6XpFaUR3uz+5NoaUZD3PAe8E9
	 70XJS62vJwmoFW4E7dFhTWhMeECT42Fzm61L+nzQcpsWUZMWqX486VpPBRRrMkxbnkdfz
	 /NSdM15+eXYhdKkubc3grz3ONgFfZ5qhfmgd1RQdL92OVfcmXmsfHs3ImDy3T4JzoEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3BbByNv;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C51606A323
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 05:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C51606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3BbByNv
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2e831901331so13447055ad.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 22:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250456; x=1793855256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
        b=m3BbByNvwVTB61CMHLiYJL8DEUQo3qdr97nQ+INggGQWNXYxuBhs6564SGou9mckbf
         8rMZ6mAEPe8pnfrrQDQvfoTRvLcbLdErwvhuvdZ6fHAj5OtYZaU22cn/PdKdnt6BbpNe
         XDodhGEIuY1dL6zQy5GTOyiA8zlLyZmN0KeofYJzI+GnLqLaPSJj//bcdLzSUsJGAw/L
         JKgR4xGuvprCIbFeUgmWsfX8a8oCH3GchhBPHoqA4aYG7FNiiJSxW7GmwR5+3Pm7SjHF
         eDWtTVoKG42ubA8r5DEbt80e813z+LbUxlbgs5y+DyZwQA/cV/40EsNXmladHSMSfkcx
         kXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250456; x=1793855256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
        b=hMY0z07D0g7I6VRIC0DxnLGXkQtZM8jXpQH63EUtDmPPco/KQHfofyid+DUTQD9hlo
         GunB6Y6odkuDRW6yMlwS4xAF8QpXci5SjCWSi2OICXY6h9aA3B1LknQ/XFzlq1E6EznS
         o+nHDdxeCo3pKyqeU/PbBoalqUfB0rkW066gZpmxRfefD3ZrK/Rf+PiwKQNs1kPVfiKf
         zx5JqBGcyZ/f59Kvz7w2W1GEzGFFLZA9frPK0YA5/xK2B8arRH6xPSsdSFTdmtGE/jDF
         kWTn7KKe5VKBwckkHI4sUEp97GGJfP9cZDqIBmHOuAXq7vKlYWXuda4QAYwwJ9E7uAaP
         YZ9g==
X-Gm-Message-State: AFq9FYJVhBQAn1B9pER6FaLoGIvLRAn4jyoX7M5tI7Gbijt9MRYhHakb
	r1MxeJ9GZgspY/Q1MOYHvRqgabQW4Yi23TFHxm6PCGIz9lTfR2WgrITE
X-Gm-Gg: AYBFou3kHXmtZmnzbcLRZ7mF8an/iEocplUSXpqA7J7s+6wsbOKNq9NfQEsXSroZhd8
	RBoNpfsr/CiMlEdjvxuel6EVKTDsKslvC1VCzJUoRNrHMLdbx9+JdpEr6ZEwX1BmOEwmmHaL6Tz
	Sq3CGYCccWdlEDq6tJV1qGJdJLzVfgFSAKClK6pEA2CKsRZpTgpeilkWMDPqFNepwwIDXZYjtv0
	oAKv8fhDy1DvLZ6HNeu2tF8A7ele3bl94nhvGcfsihHMaDW6BUmH39YyMCQgoKse479pe3i0hbJ
	UPLbBLAv55HXHAUuyqH3VyEoxOH2smAMP+uzE+mNFUT8N/FOQXboIptxTgwvQg4D06clKlFjZYw
	JXJ+wY/yXKSKCwzsPyK3uU/k3bKb9ZXbJBlGhf3f+5Us8SGfIf8orDVjaGSpnVEb2udtyQCu4p3
	PfSV572B61YUiW3egzH6V+7gJ1zl7dAaqrKUhiOJpFkuVvam1avcUtxefoFlVMfhig0bYtrHPSu
	Sc2SbowPx5tWenljf/4zdVERJKROfdSxQalwEzMJItmFdkWnWZRGGL+NgpQCbHT5qCb7dCHEwfs
	sVgpzoYizX95/wiumtqnJ7uo2vbz
X-Received: by 2002:a17:903:38c4:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2eb005025a8mr38954575ad.31.1793250455691;
        Wed, 28 Oct 2026 22:07:35 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:35 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:53 -0400
Subject: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Add a MAINTAINERS entry for the Bouffalo Lab BL808 platform, device trees
and Rust serial driver and abstractions.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 801f964899ba790a8f71fe61f9b3777a494dabd5..b76d3e168468bf6139c958a81b626c73b422c0d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4926,6 +4926,19 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
 F:	drivers/iio/imu/bmi323/
 
+BOUFFALO LAB BL808 SUPPORT
+M:	Kwanghoon Son <asdfkwang@gmail.com>
+L:	linux-riscv@lists.infradead.org
+L:	linux-serial@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/bflb.yaml
+F:	Documentation/devicetree/bindings/serial/bflb,uart.yaml
+F:	arch/riscv/boot/dts/bouffalolab/
+F:	drivers/tty/serial/bflb_uart.rs
+F:	rust/helpers/serial.c
+F:	rust/kernel/serial.rs
+F:	rust/kernel/serial/
+
 BPF JIT for ARC
 M:	Shahab Vahedi <list+bpf@vahedi.org>
 L:	bpf@vger.kernel.org

-- 
2.47.3

