Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095C849E5F2
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 18:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287842; cv=pass; b=GqlPevrEE/K6qRZybFFkTbwr4I/A1DkZcXE0UuM9Oks/CywIrikyPCsh+RmswRgNv5FLv+I+BWg/lT+WWxfInXA8uCGY3rUdu8TktWIq5aqE6qjrmw3x7Hyqa5Hd5xIEQ6LnuaMMBymaax6I76de+xCJ4dz5jhuBc+l3Mc7b6m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287842; c=relaxed/simple;
	bh=494ckq7zWDraIEHV/+JsNGhiWAQA60hpCZCjqs/KHgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQbY2PTgsfh2/P6Gnu2hkFtN0SMWit67Af3HRTp1BWl/ao4n9/Vngxq9MkUGbHZmteqeXneLHoSwdWDWS79tZNRf3nkjtiziisYL2Zzk+9IjBPgSNQOZ59gHEf1WoYsSHRYotQqCddDLx9sWPz4DNecbrIbArEUG08cxvprlcME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKBYKNvB; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKBYKNvB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso280504a12.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 11:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788287835; cv=none;
        d=google.com; s=arc-20260327;
        b=PPneWM5QogL1KWBRv9ZVPSRPHbUrSJxgbZfyXhNVJ9eJz8LhbSiQZqBYepzdCVC31t
         rOcRX6vjgKjND+MC+FarhgxsZH1QxrySi4ErozzE8BfMQNCY8CMpzTge+bT4zuOBZuOy
         OeI4/o+2eXy0Zx3z/NQl2Y4KcaM/0GxbFiPpwjv0vDxX+St0Vu1lMlX0w2y87qERIpz9
         6VBrBnHVTn16i4SPWG4rEHkYk6elfivQ73Wo3A598l01LYwWmXd3l2YB5VlYA4YTwjUQ
         KX0n9xB2bSG8N65X/0QuAU/UXQrXastFMqK72CMzmEZl8EoE1Ob7kQWVmcEVrKGP+ZfN
         jA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVxT21+okXO7H1rZRlv527+HZuHOBJIShXeskdwzZ5E=;
        fh=3hMm+ZPA+GpXhNhamXi+3UWBSGAbQxKUr+SPXMwYpXA=;
        b=NnpzBZHBk5KhUwwSx0f79Vzz270o4G3esYTSFETkzL18uwFQ0hBSHosOtCYHlUvCBt
         7nbd1IL5X7zZVexwVJte247QooBVcEp0pycd80Wgzj0hz14ZB3jj3AzOFXtgw54gjXQx
         j91Us194KHqaFogujFRUohN1/h7EbvDpsB+67XAItQqOcDuvC4aSlMSVNLYPZHGG2Crz
         1qMPunK0zK1DpMgMcgfQ4icNeHEar40rXdb3SDvO1Pf/1uKXW3ClLpekJcarcmWbkuAv
         jpyLCw1m6bEihEdP3lQh7H7meMQzhgCWH9LEFZlqwN/118NCd/7lKXcaqIR3bTXvrwhT
         fIbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788287835; x=1788892635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVxT21+okXO7H1rZRlv527+HZuHOBJIShXeskdwzZ5E=;
        b=kKBYKNvBUnclv15WTHuP0UPrtxDazur5+xRPXOIYcsxFAvc0qbt8r5u9V0H6U/F0Mr
         LqQUHwfrJ1eBOhgD3UUplCJUjFDAXRdmSxbsIzdWy2Hf6ygkiPgDs6E+jSprvIjncUMh
         glTsz5KIwXU3fbEm+SZq5VwT1Nx9gmphLdxZfsRnaacRxYaUcSCQEB4GX7pcznt0A7F1
         uvB5pywKk/SjtvA91turLbuMQO6fNx8cM1k5lGDGppDTwCI4POROAGIENlEhoc5vkJQH
         /6GUkDN6F0+wBxdJSMgbwySstPZ3F4m7MtwuEwqgpmIEXFBrbByi1KjOBwEbHo5Ja69w
         6XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287835; x=1788892635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVxT21+okXO7H1rZRlv527+HZuHOBJIShXeskdwzZ5E=;
        b=P2+R/L1PL+Oexp71ClRvH04NxmZTIDJeBrt+gHdu8tfZqXwcP8wPHnjuRwNMgyfGRF
         lUXCmHP8WKmNHt+pzjKJCsT46nJeLExF18gFxtr4EIE4fd4yRO/oVIbb1W9W46unpy6m
         3zirVWgUnbSK2kEJd8tWYk8eBjTVkT3IvnwdhCYq/74uwjX1O62Y1FSzp4PW8e20TqKj
         UT58Xjni9hIpo0do0RuxJfEChz0OVjkf7B6VTpGW5xGwuNa5jGaWhG8KFPmIAtSYQbJj
         HSbVB9PHo8K2vQszhB7I2ewQ4U14u44uRR8kaq1jssZ4PMCLtDGUHco/aU2/acBnhFsy
         ncJQ==
X-Gm-Message-State: AFuF++nZAGV7Gjhy1uNp2/hyWgx74FBmuRqZemkC1XfVqrQNPgpUiudb
	m6rLMx7JInVw/Qd2yJpPmrBQCxNRepAw/6fzE3rWRmzaSfjveiV24mmRtmup2SDYkz6LMLZqDCW
	vQgWuWURD6V/lIhT2rcOgFBK/QtBmuxE=
X-Gm-Gg: AYBFou3etItKZ4ey8TpB0ZCzG078EODbEmR+pIluHCGnG0Ah/FwqGRzKxad18WsX/tz
	gpCz4uzV+bt/aw7AtjRmYZmFnvWGlXbtstk6msmXbsJo39jKnp5XusFFuDyb4ujD3pmWWv+EU/P
	Fyp+m764PLl15zptrebZZ/mwLCk2oYJ8PVekp6CSOYDFSGGAdKnkQ87/NxizU3iHd21dqs8nAPg
	gdaxPAFavr7XxiRAf413lCQPFKIP7+PRR2G0bbRKN+HggzJ+QEl8ZAAomIi4Tr1CUpAAdFnyZbi
	zW35gLuikFIubZ7IGzk70VWPK+rhreW0Osuq6IowC6B/njGyxcJTyHcqFCA8TDXMqj6z7I8gAvz
	UQlWY1IDLZOTOzLqOuBYn4rT0mPWVv8VcUG0Sk86hmRJjEAeX3RDL7xJVIyH7Pi4r5tPZTFduI3
	e8CSC3Fp2Eu1rpIuSfqfG/6LqC4kNAAw/eAwbJq3+O569hsYLIh1NMsKM=
X-Received: by 2002:a05:6402:c44:b0:6a6:32fa:1e9a with SMTP id
 4fb4d7f45d1cf-6a632fa1f2bmr14643753a12.18.1788287835187; Tue, 01 Sep 2026
 11:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901025311.955936-1-rosenp@gmail.com> <e1087196-fcfa-4c1f-96da-ef76a3e03a11@lunn.ch>
In-Reply-To: <e1087196-fcfa-4c1f-96da-ef76a3e03a11@lunn.ch>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 1 Sep 2026 11:37:03 -0700
X-Gm-Features: AcwNN1UPUj6nKVtq1cjCz-NC6msW_ZrmBOinD39yYI4g4c84oBstlABPtX9pTQk
Message-ID: <CAKxU2N_qR-KKvq=qv0eu4PMYMf8zHnpYnZ8jMvpBNKVitB3Vuw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 8:08=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 31, 2026 at 07:53:11PM -0700, Rosen Penev wrote:
> > Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input,
> > allowing the board to be woken from suspend.
>
> Could you explain this some more. Why a GPIO key? The MAC needs to
> know if the PHY can wake the system, in order to offload the WoL to
> the PHY.
This was an out of tree solution to get WOL working on this board.

After some back and forth with an LLM, the conclusion reached was that
this is the simplest way to get it working, not upstream ready. And as
sashiko points out, it has problems. I'll respin.
>
>     Andrew
