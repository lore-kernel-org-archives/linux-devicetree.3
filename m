Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED51A37266E
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843392; cv=pass; b=UX/VNIr5Am5lWcL1cndGPnCGVOfMwWEPoK+ePNjgNWP288Wh7P/aAVJW7bZJUQN4EzzvttNK1GmQKO877kyjnGQs2pf1rN40ZS6LudguaYH6qyHurN7xvuUTcNIA7dqrTGRX51LO4UCOMBofxK9HTJjBuFw+PYLm+VmmW0azNuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843392; c=relaxed/simple;
	bh=4DzVyri0edtFhAHZfVFYeXT5iqjhOw+QNulxDA24+bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfhelhcSkO2vnCNTme9YwtlG3JJyP+1uaBjmOhTbZPI5ldAvZqESe3PKXKToJK6bgYoL09fRF8y5hPr+I8uosqtNxpIzOe/hh9hOKoTkuBkpqf5omlamjPgJTWfHzhVgk886jTrwy6kpsNVj/yvmaTeT9miUMkCzk4AFGGikAYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=houvkiKV; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="houvkiKV"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so55376321fa.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776843389; cv=none;
        d=google.com; s=arc-20240605;
        b=MJUsfL+4Trclox3Xzx4v70Gu2XU9TBuy/chQYORBRDQDFgxv0sIOoUtWiDrjZRv/IC
         noU6z63SRnHcNBQ6Liwk296TxH87kdQCpwWIwd0/1ShkAdWWYM0fsBLD7cpz5xfklFNP
         FqlKmuSj9S0CpdwA8Uobygdiltb4LNhHYexpM9H05mhcaKAlrfmsbtfPjhExqFq1ffbk
         P74bPeotUCmGls1PKVRbEKGIsH7XUvVxj09kHjHnc40N9/DGKxw4tf1h3GcNjkGV0B+l
         CC4g37+Mwk/eqBR+ad2JNoZMJTdKb0d3QKPNDJGPNB3F4JyEiLQoz5R26PzewYhYORFR
         JUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JRhsk8bRbL2KGVeQozHjmCu3DTba9VSOU96UxmUB0aY=;
        fh=1sCo5QLY0ztBuksyGQdrx/jmY3bntwe0Xdyic08qdr0=;
        b=hpFHT5EN5QO07ZsgV7vCbFjcSG/4B5jT81C8APyWQspD/k9BgO47mIT1Fd8fFKsbSL
         kWMynvfDlIA/Ifh9bquwzGrYM0KN/u5C40QD7MXt01lSh8vqWNYvgJR92nCNz04j4Yt+
         quhJ5iM5IJsu8YmCJRn+b9Jr6Qgn27BmoPvN3suoBGs5yIiSJiJkQ6b6/tnIUxqKaoYl
         lKpaGVHMZCFg2MVRuWrPa7+9snwHt6qHIqFjEiBwqH+wR/pToe97HFRVE4LvEZ6BNKzR
         mS3vMUtt0MgjRQFDtX4lxhjeqDNaf3s0e/inBETWYjNLJ0OSBos3Ea72JebiERQWqmw9
         Gq8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776843389; x=1777448189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRhsk8bRbL2KGVeQozHjmCu3DTba9VSOU96UxmUB0aY=;
        b=houvkiKV4jWOhoWCzy7Jfc+EPwWRTNG1BTkZ4ULPSLfYD6DGqUttRqNnECeQuzC/dS
         YZlV8Jmaa3QdbviaBCAYWCVTE/Ajhe/gMVcNDIgD8ejkuVr10mET/Tn85PPJDHOm8FnM
         urrU50942gmpbkvns/ly3SjK3RVm9IQKDcpphE9Yxwh6hGsJB0fBVSlueEPA/RgJHA0Y
         sj1JLWhjFbwAcbwOprN00LDHKMM0F9eYswzRHouNMVNyPoWd9RShARUxLgjSvy7+kTSm
         zXfxFjPfU5XsMVuPjv6qtF/9fREne/4ANYfxVMuvlgI76iXAh/IiX/2EXwQDs7jAnks7
         MK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776843389; x=1777448189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JRhsk8bRbL2KGVeQozHjmCu3DTba9VSOU96UxmUB0aY=;
        b=BdFSukxaP8FLCqWxyi9DSxioslyhMWtfqLc9OfPO/9PVEHpqyMV48GtjjqIg7rFANj
         NrBPmlP1zV5I9u+N6x9YoNFDAO9uWPDNuiyUP+279qB/6XhgKyg1MKuzXpZyRd+Y7QWH
         aPARkj4SINHnfDp1L36jX4HdhYqffyZz9vq3G4GIVjvX/nw0oAP4GWOv609CzdRJeKsz
         X34K0VAzoLBnUisIKmpdn4q/qJ8cbuFvDfuQkvgvxm3MwZ8n3uTuBFMh+M+yYtJWZmuy
         jJ/E31MHX/oFw73TM94gIHsSh7nHiEpIdmh7cHn3bb7v1SZr7b1FsaB//oKb9WE3QNA9
         Py7A==
X-Forwarded-Encrypted: i=1; AFNElJ9B/o0hZ7qr95o4x/jBNlP87hSBl+muizLob8J79jEWNoPaVjtjPVRGaz7PhR/mL+/BzjmgS3vShwPp@vger.kernel.org
X-Gm-Message-State: AOJu0YyLOGtEVQlEaF/qJo0my+7jR2jBuRWAioCHXRO30MigPudxtjBI
	Bim5t1O2iLT1WJhTNjzzeLhvob0Wu3eYJm6A14aDciKEBLo0qfc/cicxc0t4Qpj4tYdWC07KZAV
	vFnE4I2TyAQaf+ufxfJXua3njIQOoyWM=
X-Gm-Gg: AeBDiesJe+Iq8hgneYA7b8WXrCqJpzPZ22rs7tbMSefsSUYb7l5wCa1YmHKkqGlGI/9
	ZT18uXg+qcF5EkgVIkxoCQBdsETtDXeKgld0Cl6ky8xBoNf+KG9Cnj+9hnAPicr8DpYaN78WlpM
	MYhQyc3H6RoLTwoyLnJuZ3E2PogRumW/B/E4GP3w7iovtzRKwGqXuRjkZAOfGSkri57df5QLbzw
	FQiUJqz6QbEhE9naEjzgMoInMYcjN2DfFOIvnHbeO6i5IC5pi/2n5WI7lkOGuHHsb0NHfgiHV3U
	4K79QUY59PMI6jJhKBqXvZ0MHQiaz+MkHiTJqIjNONPNqQfAgAKYe+OOGAeiIhk5fsgnbN1hoHU
	wUQM=
X-Received: by 2002:a2e:bc14:0:b0:38e:23c9:2f77 with SMTP id
 38308e7fff4ca-38ec7418244mr76801921fa.0.1776843388831; Wed, 22 Apr 2026
 00:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-ch13726a-v5-0-f7f6f4f30e05@gmail.com>
 <20260421-ch13726a-v5-1-f7f6f4f30e05@gmail.com> <20260422-resilient-puma-of-excitement-02fee3@quoll>
In-Reply-To: <20260422-resilient-puma-of-excitement-02fee3@quoll>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 22 Apr 2026 02:36:17 -0500
X-Gm-Features: AQROBzBRZGRInIxeMUjKR2PpeDYi3ALSLVHHQxsrJaDloP4zzhaCTJCBGIAsqt4
Message-ID: <CALHNRZ__HyuWpcTzqq8YG_n=RPZ10kNhHU262=NHEqr_S-pYKg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: Add ChipWealth
 CH13726A AMOLED driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 2:05=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Apr 21, 2026 at 12:38:37PM -0500, Aaron Kling wrote:
> > The Chip Wealth Technology CH13726A AMOLED driver is a single chip
> > solution for MIPI-DSI. This is used for the AYN Thor bottom panel.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  .../display/panel/chipwealth,ch13726a.yaml         | 67 ++++++++++++++=
++++++++
> >  1 file changed, 67 insertions(+)
> >
>
> I don't get it, you use b4 but still drop the tags (b4 gets them
> automatically). Nothing explains reasons for dropping the tag, so I skip
> the patch.

It's not automatic, you have to run b4 trailers, which I forgot to do.
Will send another revision after running that.

Aaron
