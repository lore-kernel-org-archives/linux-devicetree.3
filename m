Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B733D891B
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718333; cv=none; b=GIwuLzhCW5fKRIlYs3l33l0P9CFa2HH7W1PchaVjcXa+k7y3He7DdJYAqRNDJi0LHdA2o8tbgkKgBHv2rWEPhvoJeCU87coTENMOqpjAW8y1VXRZKm9XnltPWh/xnuBwNpU4sLxEKP+3GCboEl+YKnVQUcjadRIQNLcbGD2hew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718333; c=relaxed/simple;
	bh=zsu5uWNKbRqp6lNgPV4nWWx3U6lpU1GwAvOF/oIJJXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ep96C9KgRP8Ay2qguGil5fOAnTXoNWuNBUyDGCyYEWtFtRPZYcFk5tO5+aT9GlBeXFmEEcyjrJBoYsfDYXEFugglVH/TIop4+4IduHY5g0dz/ItYTAGIAXj2TVez0svOm0KJxgwqrGgykGeuoYDnjGjyMB1GMi5G7yTIj/VFnUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aak2xX3w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aak2xX3w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E57C1F00893
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718322;
	bh=zsu5uWNKbRqp6lNgPV4nWWx3U6lpU1GwAvOF/oIJJXQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aak2xX3wCrx7if/cUgmVg/0cW+xRleyJv7N6aR73dpEZJbvosGlJ46e+rSiaRtUoO
	 vgxg534xFaHqpT+tMhkbORZ99/2T8HvFjguo3gtwFgXCpWDe6hxkF2VozL8TMG2vLH
	 jJ5Aw9/XEd6riCqchspM5eujtZH84fDVQa7RLNvHl+6ypz0Zh5iWKvOC4gxfK4nQIu
	 w+oqXlsgygqyER7TJz8Hp6EjOdn+Yt8k15rYD4MC/ZvIcWDNI4RXJCDmTJ3DY+aSOM
	 GTNnLnBm4aYj92+vn5Lx7sNEI0Q8KFvp050+UGmf+jXNwx7KXjTZdLlspc3TtaR+49
	 uHDWjOn2vsAlQ==
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae1f2cedfso6090188a12.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 14:45:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxclO0KnVkS1+Fl0FlbBcfn4q8EyN4/WCexFYhL01enAsfmghbd7M+FqOyH6w37/kkRQM0V/iVUXrN2@vger.kernel.org
X-Gm-Message-State: AFuF++nuUuIkiUi/ItA2x1U7acpF5+t8U8LGpdw40QkPy7fLfiXv61ZY
	9JGhth72JVR6ehp71N66xKVNLXkO/FSSqcp5okxBIYVoK5VIuf+sZoAI26EsJ4+2/heBXkLKLmf
	1BNaI6VX2O7eCdRO1g78znjf+8zDiNQ==
X-Received: by 2002:a17:907:3f92:b0:c29:462b:f908 with SMTP id
 a640c23a62f3a-c2e15e4f929mr52741166b.10.1790718321016; Tue, 29 Sep 2026
 14:45:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <cover.1789114385.git.adrian.ho.yin.ng@altera.com> <0fbda23eb4a22a56e455b5e89125813af60ab0cc.1789114385.git.adrian.ho.yin.ng@altera.com>
 <20260911091335.AF1481F000FF@smtp.kernel.org>
In-Reply-To: <20260911091335.AF1481F000FF@smtp.kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Sep 2026 16:45:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKHOA2F_4r-5go7=vMe5j9yV3h_QkVm8gktEmK9-Ke_xQ@mail.gmail.com>
X-Gm-Features: AclHuK_PDgyTTCTjlUF-Yy16WB-PaUd2Th8p6y9L9sXbr37fdqM19HyYoJdc030
Message-ID: <CAL_JsqKHOA2F_4r-5go7=vMe5j9yV3h_QkVm8gktEmK9-Ke_xQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: add Altera Agilex5 DWC3 controller
To: sashiko-reviews@lists.linux.dev
Cc: adrian.ho.yin.ng@altera.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 4:13=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] The schema incorrectly uses `additionalProperties: false` while r=
eferencing a common schema (`snps,dwc3-common.yaml#`), breaking property in=
heritance and leading to redundant property declarations.
> - [Low] Mandating software workaround quirks (`snps,dis_u2_susphy_quirk`,=
 `snps,dis_u3_susphy_quirk`) in the `required` list.

Not issues.

Rob
