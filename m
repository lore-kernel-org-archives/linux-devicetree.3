Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250448;
	b=EnbJDbfWopBvNvUYW2E6mr4pBBfpRjHUILD2vAtghOy20L488zwXzSFLsCETHUqUjqxp
	 +uh+vJVuTBoClLlyRX3yEHTHVzcnKQj8mDT7ZEly8YohUg6dhoJF8M1so4szUL4WsW5RM
	 z8ftiFV/G+7y42Hdwrhh1WgGKl1kFeavydBHCEDAt9nbyce7N3tqoUVZenZD9YdWlsyVz
	 qp5QdTEx8xmsUy+iBCuScg9OoJ2UCUOC93K2j4t8CELimuhMLOBy0YB0vr8IhSGyD3+Wn
	 pFDHa2vo+KjbFYudxR4YySuHPfmWBUqnUhRgkK7aeuuPxoJT5BqmJUG1mjMMnHKUFgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
	b=UCFRTE6KnbZ+Yvo/mfHKzjITXIm2DiYI1RvQNAM0GEhB88OKs1ZXEjLL0r5vgJ6x0wPx
	 HtKI4PH5tZheDrYZIgm2GjwXKdvs4WMkyTCPzNXBK9ocHeojHnrE3kfM08Fk3qjWOnKAa
	 wGLKoj7ivqyFLw2OOjuHcYdFODgEurpGtvnCTmO/0ekCFmdmzWGpGYCUFCEIJUyVbl6+N
	 Gmc/qc2fCPB7yC7K4nTyJBSTqLibOQ9PTAj7DB4l9oA0V6D+DUx17psfmsHxwoERuNvA6
	 PVhOkvnPpMB4uBd1ZQVg93Z7Yfa43c4rPC4XzLYZ+npSJDtcuqfykDejRZDbdofCs7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzCXo7ur;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EAE606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 05:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35EAE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzCXo7ur
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e96502e447so15018805ad.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 22:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250447; x=1793855247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
        b=bzCXo7urDa6UbYwZ1ZnzYmKQgEctapwj9XX3Bn8RdVeT7BZVAzczVg73uESuoQICT2
         AC1tRi1ifIsL/spuMAC9rXHH24zz9UzV0bhCXMj2znMtbses/nwzdcmtvOI5TAJHqUOy
         7+GNyz64WKsk8cLgTbITiFyuukodRlO0arxkZ+evUtBnU+2XGur4cTdovJh+wGvPDklX
         AhyBWENXiWs2bVx603vlVZKWr+Mxffheq7KzR76/2ypgD7WYRyvbta7WRUUbSSLsxg7o
         vvI7wl4OVrnLvJMoh9FEUupt8XF99EOQ4DASyrM0itQFZdOaOTZir1LGMOK4AAZiqgqc
         reSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250447; x=1793855247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
        b=uSVaUnt2CaQfhqwVi3Nu8CWEyUK/F0nagVAFsKg13CVWImj3buzBVc4X+WTFHFfnPF
         ww+tOj+uvwkcpeJS3M68BGPd5LuimA45vVBraTHBSHrKHYD+OStkF44ETIUEt0t8CMwu
         TdBJOyJ61MvrclM3fpAlvcpwxzZAZ/yrBErBABwpKvmjBOT0vG74II1RjATt4LFxYpZQ
         qnmlZt1PObJpJca+wFjBZFHHnN1XFRy4Ch6BTCEi9vecWPS3/Drpz99jLfHEWb3XRx3Y
         LHWfMDKXZCvHVTvAE84VvKtlSXoel9UTHAsOYizeWmViTdhjNOTy1RoiFNvyKFeCSYHi
         YF1w==
X-Gm-Message-State: AFq9FYK6gXJ6HAbLMHUQvzonvmEepQNpHy2vJi2ZaFRC1SK3dBYlrJNQ
	54BYY7btWav+pAu4fzPeD4fitjrb69scsKswdrdfhBrCqCsx45bB61gP
X-Gm-Gg: AYBFou1K9TuRg7NpwCv+6wm7uLAFm3V5pJBpN4DbXwTrpk5pqxc0kyMPbCBIXlVkmWv
	IWZ3rM2CjlE8zHGG5n4QqxfuHqBNSFkw0EZTqZTZ6V59rJvJdBPNwP+yZonBHBpT8F4DCXYOmJQ
	FWewVCD10YSEFbGpuF9SiMjUWFJ94V3BlENBfB0w6rCaDXnsJjqZMpOftnSc4XGoAIvguz3wIf6
	sv5C31eIADcANYAEDEgrO2MNxd9+cB5IB5bqABETeyBPBCQ1EHZ7dIW3FJLRdb+2Ra/tp6+xszg
	Bh5VvOnHnj95YtFv8nEpnAV6r2cOrFX2jttC9zrO23xvMVdT/Z55noMu5Gr9ZGYWwxSQzDDOcei
	pixL7Tilpn+Jtbu+Zp7oDlWWrO/vgsC6daRk3z7udx4gabucUR0BWHd+5VSuVtEngW73FzsPAkW
	LdGysPTxkf936lkR15XZDLAwrIlxeBIo85gN5AQQVHh/u+YKxjPURgEMKu9Ou1J/IcYlD7tgYRy
	RctEGMuhOH444ISMtYgQO8tcP9tDY2ASttk7n8X3XdK4oiGV0zIjzd7bfD5KaXCa17HAQTQanSs
	MUvpxwokZ2SChFvE0Vo6tmpvTnP7
X-Received: by 2002:a17:902:d485:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2eb004fc927mr39045165ad.27.1793250447442;
        Wed, 28 Oct 2026 22:07:27 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:27 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:52 -0400
Subject: [PATCH RFC 11/12] riscv: defconfig: Enable Bouffalo Lab SoCs
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
Message-Id: <20261029-rust-bl808-console-v1-11-b736ee920078@gmail.com>
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

Enable support for Bouffalo Lab SoCs in the default configuration and
build the BL808 device trees. The Rust UART driver remains an explicit
configuration choice.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511bb0760247f50d4b69b1e3a00527b..78a5580021d8cd654c33df931149a2224465285a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -24,6 +24,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
+CONFIG_ARCH_BOUFFALOLAB=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y

-- 
2.47.3

