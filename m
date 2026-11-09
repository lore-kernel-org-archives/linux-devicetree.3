Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228387;
	b=gtay3SLWNZHgDr9LCJ2sFc2C0mHpEtPB+iVF1kXNoxS4gUcOBNo7CJKnpcgAJC9ZLQOT
	 oyd8YDUGfmtMxhos4y2zOkcy/oUjk3gh1ZsYqKbd15t5saOO0jVu2Bx/sTDkjZR5BlDTJ
	 v8QX+HYeTuyWSCwAuis4ehDjID/OlKJ5lDY/H8F2GFZBSQgTtP89PDH6+09/3mC2sZKgF
	 aSZFNhraHQ+iycT5vYCn0pdyzKGAWVl+z2WzOsxcfKlX5pBarKcJXf4JjsqzGtkKcpzjp
	 QruBalKB8v+AKIVs0I6YdVwQxbGGHrtLe2xlpH2kFeP55Mb0tbH1vEhWW3TQzfA25NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228387;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=H+sb1qDVJksy0tD0IS7N8/CuqeviGEq2b64P7nj5BAQ=;
	b=VwNZdK03vKKPbu2FmfUyVpsJZAcFkZulZ+XM9HmRBUAa6uyeLVqhqCloWvDygY7xCuba
	 RXkqGDYUGGBlrjXFdc7nITdxKNy0P+IjFiF7QIULdxiW2UQyICazrph9NbtckR3bAHRy0
	 PXfTD6hDntE5blKvjW4DXagyB1oi1L2yJFihM6ZRtjS20JlIqVYL8+R7I32AuV/FJrogf
	 nghIh73dQLx53R9BwM+ATzo13WuCL6qpFXBWXRQjTh2wviT9opsivkdyehbi+F9x5G/Av
	 ffUX504j5JRnA53x/fKo2rXL1OjVNYB9HrRH932ePHV62AiPbKpIoJvQAU02pscDZLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=KPPLQo23;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB510606A326
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB510606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=KPPLQo23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794228383; x=1794487583;
	bh=H+sb1qDVJksy0tD0IS7N8/CuqeviGEq2b64P7nj5BAQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KPPLQo23A8NXsFplVV7EbwpYeIgcaxVs6/ds2/hFo2cxGl8cV4jzSerneGwLyDatd
	 L412kcstuPT0gO/X0Er5LCKbv1SVYTUYwSwn/UV2RmaeI3Rpa0gcLGIy/VOglMp7Ls
	 x/aLES49nXlI+tqwPvo8VGAsP9IswXXJ1kDhPghC7pJYJeWfXCndPwUcStHiWMzd3V
	 LjE3tFRJHTSni3U5SnA74IviAaglnGDZKUVjCl0AQske/ZH3SHjLZbm9fXIPZ13FUF
	 EJbCH4Tct3K2z/77+GLxK+RDm2uuIW9UPVk3ueZnp92DCZ7M+PUsm/HCO0q/NPcstU
	 ORS3OkCbyvb5g==
Date: Mon, 09 Nov 2026 12:46:16 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261109124610.85065-1-lsa.uz@pm.me>
In-Reply-To: <avGwRaKSqXdtXkII@kekkonen.localdomain>
References: <20261109093353.3757-1-lsa.uz@pm.me> <20261109093353.3757-3-lsa.uz@pm.me> <avGwRaKSqXdtXkII@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: d36449cd1cb0f1090ed47c1f08f5c850fea00f72
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thank you for the quick and thorough review. I am working on v4 with
the rest of your comments, which will take a few days. Two points
first, as your answers may change the code.

On Mon, Nov 09, 2026 at 01:36:37PM +0200, Sakari Ailus wrote:
>> +static const s64 vd55g0_ev_bias_menu[] =3D {
>> +=09-3000, -2500, -2000, -1500, -1000, -500,
>> +=09    0,
>> +=09  500,  1000,  1500,  2000,  2500, 3000,
>
> Is this

The sentence seems to have been cut off here. What did you mean? The
table is vd55g1's, in the control's 0.001 EV units.

>> +=09if (!ret) {
>> +=09=09sensor->expo_ctrl->val =3D expo;
>> +=09=09sensor->again_ctrl->val =3D again;
>> +=09=09sensor->dgain_ctrl->val =3D dgain;
>
> Can you use __v4l2_ctrl_s_ctrl()? That way events get handled correctly.

These three are volatile while auto exposure is on, which is the only
time g_volatile_ctrl() is called. v4l2-controls.rst says to set
ctrl->val there, and that a volatile control does not generate
V4L2_EVENT_CTRL_CH_VALUE; cluster_changed() skips volatile controls, so
__v4l2_ctrl_s_ctrl() would not send one either. Did I miss a case?

Sergey

