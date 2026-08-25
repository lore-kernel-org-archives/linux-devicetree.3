Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CF43D5663
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643875; cv=pass; b=OXx9eNyrLAIfrzXERa4bt7l6qJwsBbeazJMA+RV2T6gzHqsqubq2FnnSH6GT/bwwh6lq+GVefF8N+XxHf8AngpINiuPC6QhtsvSEj7Dyvkg13ZGCO29iB4n4GUmmKgi9VWONHLu/FuzwOMn11ca1KEnQlR6u1GlUfFKR9orNPeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643875; c=relaxed/simple;
	bh=Mii/DeCzm2nMtl3hgGSjPHkjrDmEfCYXtshu5NQAkD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWMPzP5i0bY7jLGHzdy3xBYmXjFBv0bfEf8UCUeU0K+oBs6nVlTnaxeEEX4Zsu3WrCPv/TbrLmW3ILtJ430UoXwFMKljEJgiNngdlgMUQAbn79clj/Z8ttD52T7yyF8xSQYng5UVKqpTzkDzwoEXk0argfJ7mhWqaE2ujw70Xj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JLr3KL47; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JLr3KL47"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-669944f60b3so4962323d50.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 00:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787643872; cv=none;
        d=google.com; s=arc-20260327;
        b=VlnMozNg47TMpHUDlgHALKdL0cEUo74uP18SgsYEEMD6EqVn9tBKBPqfKZZcOG8Luy
         JL6MbT/fcA1UedVyak6UNebUdbPzamS/M20/r9ItHGgpf0g6sUHYpOELx5yCVEzsjKPH
         arbLMGaB7bwnTT6fzyQ57AfFDvb2zH/YlQZsZo/2PtecH4v1z4mOTYfkXd2/xbAO2p9F
         XSmFw5/Ho88OrP1jYf41ffjgVzZKpLb16gG7/aMx3PVjm2M2R4pV70gYwKlVDX+udTFy
         HqkuCHsHEUCyBdqX31xGk9/UleOVUQyx6UstNFQzpdf6AB3LFGWQpRRv8BYl64ULOfrw
         OVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        fh=u3ANs4mmvajJxTjBsVSYwSNZSstmW9zs6vmWf6pG1co=;
        b=WJhh/YULLX0YgA+LgFil7q7gL8Kha90Ghy79Ba/Y5YKAon3dUt/erbbvNvJfX9UW7I
         +tO81QXG1gxmaM4J0hTXdxRVEWgX8kaUUKP3m3Keq8Mdt1LJoncBXXxvh1yRU/YWptbH
         DlmL2F9dsHkv8la2SCEZNTN4UZlZ7SO+wNWT1nRDjuKxv5i4o7A/J//QSvWeBCf58RQ3
         4g3YqjFeJH4wvuvHTupUaV1wEVufkSSFDBtUQXQ29RjibMLiN+KHffJf5p7CTW4HA9v9
         vxgeFSCUfDWtm2JPcF4hgKHypugFLHxAOL2RdaPg/gEuzIhhpakkPcdpsAQWm8iD3uGU
         pjDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787643872; x=1788248672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        b=JLr3KL47G4Cb+UYRYWyCFGDjVUpsKQwlnkO7htak24Xgd7PDtjfTg2gNjGnWSXY1Hn
         eapcVJmFJBl44VIEq6wcBHEZCnmZ9QYYBV3wC61d3sZei+nIbrcOpHee52YhHqEDDrpn
         4GfuC2xBh6ZJNaVU9czMBJdtJ+TxAZdSBMTA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643872; x=1788248672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        b=NrguObTc4p/WVmi27SoNBeupKmNFrdUiklMfJFToF/FZ0NyXs/c1Dqy3/9ddAUTM3S
         79QzZE4Z0+EHCXDqptyggmCAOSAmlw9Rvlnpe4nFwZdBp6MW76XEHbEXtloSNDvV2wne
         gSy0lJnpbA8WvyF51fUXQfDh3q+3DYTMaqekJLhdufUy53WYfBGBtmwxkQ/jvoqBSAgq
         VzURmsH9ONUxn2+Abb8rPW/rE0IEbITxwsCrgV6MnOqxK3iZAGrEcWi9kbwvC80MYsN8
         9zfO8Bfm3anqh0yTRhNZZVMzAFXAbe1GsNpHsHWF/p/ccLdXR275hfjjjk3kUCbZGell
         qSmw==
X-Forwarded-Encrypted: i=1; AHgh+RozwM+c0IelIyOzo+bmzy5++QF7XDbtR4ASH5Y0t5RAl0+1QfSiarFLWbNdalrxSJNIgvHWJ/p+SxWQ@vger.kernel.org
X-Gm-Message-State: AFuF++mxi09tGJYQUDxxGumfFvOlnN4LrrbMavpaJk8hL//ArSTcZCq4
	R5YQqaJckJsj5m0eyFEsVpkneCAoFXSqmi602VDoYsBgvd+awEXvPV4FgGvmPd+vo56cT+wIXnU
	EhMETHm2sVBOQNgpQq9p3f2VwqTXb6uPgf3O8JWnf
X-Gm-Gg: AR+sD13S3I441e9E+9tEUCRFNp+D/c0hR7/IRhCpt8X8RJOuVlfgtkGDUYLEsvqpOSN
	YDX7vpGmoojMUw9VICJ0lz3u+Q/Cz99X0nervLNyWkYpMiYd+K2bHT4XRFkj93V9MKAP1dCebnW
	a0CI2JgwPkMfRojxnsO4Q4d+fQ09xWvFKH1IHYOX8q412cL+M1jKV47OJ74v1IPKFQHOJBSyZxj
	gqtQDgJ1ltcRG5rCwkk94PP3rF79ZnYIS19Eo26eR9QqZaYP5R1Q19KwBx1b9U6AO0hDjFfnxWi
	t5yekGbhKqssYbs/NMZhQxuyCyIGYhUOFnP6vQvsisIaaNjEtWEin1pNQEIgJpWmfw7yvbhp
X-Received: by 2002:a05:690e:1449:b0:66d:1131:b81d with SMTP id
 956f58d0204a3-66d1131bc41mr2549091d50.29.1787643871703; Tue, 25 Aug 2026
 00:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825041628.988369-1-wenst@chromium.org> <20260825041628.988369-2-wenst@chromium.org>
In-Reply-To: <20260825041628.988369-2-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Aug 2026 15:44:21 +0800
X-Gm-Features: AcwNN1VHbO3y1ftfkF_7R2W7KDk8RFMySudnf-TTSiUhjGplV2Fwnh0fieb32LM
Message-ID: <CAGXv+5Het3zp_OTp=_ktg+_d5Q55zkE0SwQnM7TVyJDmOdBtyA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] regulator: core: Add "enable and wait" functions
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 12:33=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> In device power sequencing and initialization use cases, it is common
> for the driver to enable the regulator and then wait for a certain
> period of time to pass before continuing.
>
> In cases where the regulator supply is always on, or has been turned on
> or left on by another consumer, the driver could shorten the delay or
> skip it altogether, provided that enough time has already passed since
> the regulator was _actually_ turned on.
>
> Tracking this requires support from the regulator core. Introduce a
> "last turned on" timestamp field to the regulator device, and "enable
> and wait" functions to the single and bulk regulator consumer APIs.
> The existing "enable without wait" functions are then converted to
> macros that expand to the new functions.
>
> The timestamp is updated each time the regulator is actually turned on.
> For regulators left on by hardware default or by firmware, the core will
> set the timestamp if it detects it was left on and its supply (and their
> supply, and so on) is on as well. This is unfortunately best effort
> only. The core can only assume a dangling regulator (one without a
> supply) has power. This also applies to the dummy regulator.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v4:
> - Try to update last_on timestamp for regulators that were left on

Sashiko flaged a few issues with the changes:

- _regulator_is_enabled() called and subsequent timestamp update
  without lock
- bulk consumer wait_us incorrectly assigned
- _regulator_is_enabled() could return an error

Will fix and send a new version. I probably should get a local AI review
working first.


ChenYu
