Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576874;
	b=QEHuDTH416I7cNM3EakKRU/0pGxi4ZMGpii55dX1OvCjN+b9xrPTP9TXs65D1JW9I+ox
	 7anrsRT97LOpwWisPTcBFzd17+BoNXNnThSijOXhyOcdc28bhG2uvPZrF+ANaXbtJObb9
	 /ukxJwnu+kgBubw6nDsPwXRG1/Aq6wKBQpOWQ2r27ny4Rt5d/1Xequi8K3k2e5cUjO+Ss
	 q/A682DgRnWdlG5+TPkLT6/jb50V2pD4J/19KYZp8KnBsMasIUObA9GXVsVoq7XNFaMx1
	 63JJ/kkosRoPZZ66NK/kqGggbVSR6l3O6Eo4pO1Oz5qz1mHJhD/Qx44h1Xe8VWLYbxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RVJTwN159znt8hJRBq+zKCr4Hg7h2qirYM0EqJu+lc4=;
	b=zlLXmra9vcGYZOtBN1tmYjLQZFxbf8NZVVCnooTZENTKYKVbLR/4AO9nIotjWmW9I47/
	 ACZNGVx0djvWnGKPkdOD6aKYtOSyXmB+C/4hHBiSQhyhWVyhkl8apRut3yKK6cOFC3mAu
	 7sDdw2Dg03kBB4xH/6a6+QmToQUe+MnjvB9DVjQ5HozbJFsUzZ2modgbQlciarCZx/puC
	 qDR4iHTr6lNSYfdgwje+DU30I4fnkuPFCX6biKJ8MG2dPMEshEJl/BwXWmz24yVaHaEZ/
	 pHJkqXpbkz1TgCU5IZtZ6loO0itv2HBs7O2tUNZdWN5VVWMsGHR3dE2Aa5eoPbxpChQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rZ4uX7UW;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD03606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD03606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rZ4uX7UW
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98301b325c4so144801241.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792576872; x=1793181672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RVJTwN159znt8hJRBq+zKCr4Hg7h2qirYM0EqJu+lc4=;
        b=rZ4uX7UWbJ1O4gUwJRxBqUzt7zn2jQWxTGl1OSySTdpfU/gL3vj7nsCqnbD6z+3NwR
         l1N9zREAkxd4QsL+o18pxEji02PB3Lweo2orpvKeugfr0AaqhbihlsKzmFeRPW85hrEw
         9heXvLYAL02cnn772zK9jnU4fvgxMs7NkfakzCE64z4AJt55mdDwCESZ0LJnGQii1VIc
         UugeFvnp+DCoLuSzu2uGSfwBi0MAspgt6RD3sHNIgrxAGbu7KT1y0udfuPkNMne/N05J
         lEQlHPw38MBMgsIncyyyxisPOVCsLz/9CtIDJmlwl+rSjYtt3eu74YUGdu4wzQg1fohY
         9Qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576872; x=1793181672;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVJTwN159znt8hJRBq+zKCr4Hg7h2qirYM0EqJu+lc4=;
        b=Ks6R8Vwfqm5VMkbTq0bpuuwY4QsCIHJDwx7gxSV+c9BJal/UTf2kOGBuxgzVnZQHve
         MjhSC9sEWGAfoJnlOprq2RJQwnhTFEp9ctEOZnumNrkL0+uO9CfkleO13sM4Os66gVT5
         QGfGQQ/dqbbr5XwNdCGAxJC9RoRgpREVjCWYL7g4/SA87g9jDAsQSK/7QaHncpIkckKi
         4EfHBDMC/NTiko3c+wv+HTodjm1GheAlUtQ/u3miQXE6yy3GrpyRhcNr4bU/S6ythHSN
         PJRjRA6S6bCXTN/qR7IlezBT4eOKuCTlRMo2WB6KbH/h7ptpcdVAQe5kTOC52BmfT0GC
         Lntg==
X-Forwarded-Encrypted: i=1; AKwUvBzKwnQT0nbAnRfRSdW3zb4cz8L38DNYtoeSonSvDDHBXQwRHdwqSCdBMCqtP1pgu6olREh7J6oUzQLS@vger.kernel.org
X-Gm-Message-State: AFq9FYJYaPh/zNP83eIQ+mN6jbyxhbMgXLkdVCnr/SyU+FskjR4RXCF7
	2xLftXKmjSHKC6DIaRv4iYW9uraBYICcWEOyK3lk3mVhcKT6VEgOPkyXKvxN1TbDj8Q=
X-Gm-Gg: AYBFou3GtXWvO7SJaelDBfaAazCORvZceA9aE9yV9pwbt3hGpv29Q1gmsyFggXQkxvA
	a9Fiovonl4FrW/awyPcMYoyTIIAPOHpuhGgS9k6yYCPR/OHuR/rPzZ3fycFwK9/XaCKHPzZv53S
	C0dfHWBn7sdmbcSg9UQ/VoCMjITzFcTY+kJYeoWY5HrqQBtPdyujMyiMpMbgwf5RdYm3eqs1XlN
	bfHLLdCvTtplNZzlDCJKVFGOx1L3pewjFNYaZy3Ibb5anSraZyrQYgyYccyHeJQFOZhncxCZtZT
	awjd6fVrTowBXjl9ODXV9dxA2r3TNkLwW0aa62FxBF3EwEqzjr5csyL4hGi59Nz6WpY1TgE7cdB
	Ms77BOGNdsOgVwEafdcin9uU+GwT2vdQ3XSRWeGa5TaNr0X0MjlkTsDZdOT2MQFAfYH4qMuKX/6
	uUufqN/UStelAz2+p7XMSFaxPpNlE2ScwTunU4fpwe6yfqRMpNbcTyTKDgmSJOoaKsn4BX2ME7P
	tM010Aj9e/w4OGPHsOefi0/ea3l/rDjRQZlHxoEAz4s75W+dkozCKFtFPkHFEIWL0A63h5S/pJq
	e5fuVZGoLc0vMhuee7Ic6Tm+1A4B8B7E8htsmCKeB4JWOqYhN22DKnDbETbbRVs=
X-Received: by 2002:a05:6102:4187:b0:7cc:776:6c41 with SMTP id ada2fe7eead31-7cc9273dca8mr461720137.22.1792576872539;
        Wed, 21 Oct 2026 03:01:12 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d118d522sm2526812241.10.2026.10.21.03.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:01:11 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 07:00:49 -0300
Message-ID: <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <athe0QikG2mzCAtd@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> Right, but have you read my second question in the above paragraph?

Sorry, I missed the second part of your question.

If I understand you correctly, since 8250_dw.c already has the BUSY-safe
set_divisor, you're suggesting that it should have the matching
get_divisor as well, instead of pairing it with the dwlib getter.

The dwlib getter would stay for the other users of dw8250_setup_port(),
like 8250_lpss. Is that the structure you had in mind?

Thanks,
Vinicius
