Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91343112C1
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302740; cv=pass; b=oUV9dCfd6agafaw4myV7sSN1Uhw9YITZ24QJJNzg2SeCWgmhhvySaXTmK+UubHH8dpqYNQHTVY2eqnS20ahJKQImttlWHQQJ6Gni3IdTj6NpDx66B2bcnCQvmBkal4jOsPVVxHjyxlsmnIuehk7rh8HJg9hK7radresF1l0K/eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302740; c=relaxed/simple;
	bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ruFEfn/F4XYs5WdFeYLg2Jx9MF3Psy+SFyxr7PK9N5bUw+lqHhYV7pWx81DM085ysT1/c0CmuicRvqwcbViujajscI5oeqQ14p/RYE5L2i/I+e8w8xpLvgeFoNPTiVlqWNq9FV+q6vLC+As7TnzbobyQUjPKQwVWTDAjKty3MzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1npArxw; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1npArxw"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c928bf172so55017191cf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784302738; cv=none;
        d=google.com; s=arc-20260327;
        b=raSw61DOt7v5MLNkJeeMjVudJX0Qr1MHnVEMO5jHxdbGIAgB1NzS26IFfrSeNB2qOo
         gksgbnOOvdaOZjLr/3Or3idUe80MTE9XFQgZeNhcidNUcJ1bgzDzNazSIy6ebTwBIqfK
         tNQoyjQF1aK/GZxwk16AI798w8vKenMqtqITBT6LSrQ5boeTtmWBfYGfb9eIqRD/FOzl
         K2RgY2J2mW3YyYFi8MOZCnyR1ADW+OJaAynb3F2tpA0LCmtEokjhsMnFu9vzM9h97MUt
         vH/gYQbLM+0HgRlThPli/BEVuFsckj0zgGnO55/W3YicOYUt1dOQigXtY1dxvTw45r58
         qjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=;
        fh=LLYnvVrNyMVmYx8UItYeFHgynrkagtGywx37Wit/LVU=;
        b=UBBE62YvG5LxvojOFiRHZRoZcgUqPY0UvvQv0HY7bR4Wg8pmVj/Nw67XVczOtx+6wr
         VjscLOXG/iYVrw6nV4ruvhOkdGKaLx9+Ij7qBvF1nlHlfRDUW8NQgPLAxz1/aU2BTPQi
         1o8QhK2OSUq5wrH+36hwYVtujJQy173dXEENXJGZR72hNFJQAv3lFIQjUxoNo0HdX6jB
         LtoNz5gFk+XjelYO24MFjqeIO/x6zNgGu582XypgHR1QyDtfQLaBFsmLhpPWs0i0ueGQ
         KSycmomDZcn47DE4AQlPp9poik841DD+DCDZjCUt47fUNlsdZPqJQAY1+ueWmA4H7Gzv
         D9rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784302738; x=1784907538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=;
        b=h1npArxwpua28NF76JLqrTrVuJkPIosil3Wx6assNObWgbBuAD719GHm9wlhSFMK0A
         eRDK3mdQ7kzoOkdzsHgTrUX5I0FrOo2HjkUZyaAACWjIWNpDPXyNjMGysLuzyx5GA7Mb
         H5LmkpcAd+Phj0Kwy1lTlscMaR8nzuHW5gSdeIZ662VsryWt2fiO5ofsxmAPuhTP0w2u
         rFI+kbnM1d0CYblUQ5dY4yJbWyWMYO9xkeQGT/sSgUsUTVg63OTenZMs6VllsiW9CMXK
         2CcfrNkHCS6QnWyXvMRpf65l72YtYh6TCaikCqFhLrTLog/uSmk9Tfl9cMHzJNF03Hb5
         IQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302738; x=1784907538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=;
        b=cT1NbJCUSFjoHyqYxp3nIj317o87cyEd0x7ARo/9evygA7kEbnea2/V5ooK0oGRApG
         6itRgW1c85Udkzkcen1QWac2Hw6llZui6L0TwUXJh/8inXXcBCRlRZ87n3kVpBv91yF9
         1DoMAqV0BIvOWAnn0egtKEVlFm7CtgVZgElps+WwOH7gby6atc2hZ5BgAe+wGx4S91mr
         ygmIZla7Bx6s05XW5jjsO4U3fV4MVw27wppWVpaSKSEwAlmrVQpdGQwzjJCuOLAv3FG9
         R5+sgP4JymU8mPgZalQsh+jfkrJTX2LTYeJffsnut9QuefIv+HY1sMF7jfys90qYORTE
         xxTg==
X-Forwarded-Encrypted: i=1; AHgh+Rryq03mxl244nEeXvibD6kyzD8H6l3elVlV0TMEuVSOLmZVRIQ5GqlNl/hoEO0x0EFK5K2Zrs+v6sFH@vger.kernel.org
X-Gm-Message-State: AOJu0YztH8mas2VpDv/xvbzCO1ktELusq6s6OUWEGAY3eSvgqgLThR41
	CYla1roQBdmsK2N5o5P80pkWBlKbf/Y3aRFEPKyuPAe2abh8m+4+8esySmOhGWpBdRIpqY/yEuX
	OHgtK/7B+tKwitAy0EYtBv5wLtQql4Sw=
X-Gm-Gg: AfdE7cmk8vyvqnhl4i8d5wLO/Ocfzh1A5d7yM2SVUz7t+7/X28CNnboagfh5Csz1nEL
	sy2Bz0bZeRI6254/SxLo2ySV4tXnIw4DdLd4GJ69TdDi+/PpYwyC+D9aCa0stpMTozoVqiaEVN+
	w6IyAGGT/9d8N6O5kraZt2NqOWBejS8mP2Mjzm6Zw+ggBNDYHRlIFOPIGwrll8JQreZ1PtmkZjt
	EZFn7mnsxzB+o+bABSDdXvbzsl3NVqgNq/RJ1ysYoxfdH1kGdxtzGvxkwqAidniQ+L4RfUv/ct9
	8nCp
X-Received: by 2002:a05:622a:5d1:b0:51c:bfd:772b with SMTP id
 d75a77b69052e-5213ea80af2mr28037441cf.65.1784302737601; Fri, 17 Jul 2026
 08:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716161923.266315-1-akkun11.open@gmail.com>
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Sat, 18 Jul 2026 00:38:46 +0900
X-Gm-Features: AUfX_mwBl3dquzxsUOjYfNF9eon0dxcQ4kYle5GNTVWYorRVVQ4G71Eq6B_eMk4
Message-ID: <CAKr_iV76upuWauE-ad7ds5W+jA_aSCkCGsG4oKqC8KNQBG=JGg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add reset support to MT6589 wdt and remove fallback compatibles
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 1:19=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> This series adds TOPRGU reset controller support to the MT6589 watchdog
> and removes the use of "mediatek,mt6589-wdt" as the fallback compatible
> from many other MediaTek SoCs.
>
> Many SoCs have been using "mediatek,mt6589-wdt" as the fallback.
> However, they are not compatible with the MT6589's reset register.
>
> To add reset support to MT6589 wdt and resolve this problem safely,
> the series proceeds step by step:

Better patch series is available
Link: https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scor=
cia@gmail.com/T/#t

I'm withdrawing this series.

Best regards,
Akari
