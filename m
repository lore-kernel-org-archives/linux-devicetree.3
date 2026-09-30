Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0970F472541
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758836; cv=pass; b=aspamlOWZ+ERqFxaSnQM0Noo3vVXV/aWD+lmkadkXB2R3q2zez1KvAOEU2XPbM8H6owLpPnBtu2yW3Jc/0YsG5umXQI+LbrvU4iH1ueXdcIXVBZ6DIvTzCY6WleX8/aKxr6dmF3G/Lo6ndOSyI+CTQkOqKOzIlxc96kfi+Mv06w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758836; c=relaxed/simple;
	bh=2ptQLVKYeJjEOvJHdG809i6XfpxS5ynDbXh7OBZc7Ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uO3WP4p28ac+ObI7e0D+uSweYWdFuschOMgZsOeIPvTdRaL6uZGqHexX3ue0vTHrTz9lOHag1IbAbNOUL4ZU833CwMb8bir8Vszzr0vWZJWSE63T4KBkXd5UgN18SRgD5EVMSjolYuCzWhm3pWxV6bDePADk2aaY+uMbSe8QLbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q36lqAQL; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q36lqAQL"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b4f2d90c4so1381964eec.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 02:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758834; cv=none;
        d=google.com; s=arc-20260327;
        b=ko9+KppfI0cP7Sy80xLqoFxn9tcI54qnS1zbnmyU/rcaEnhO2zWcR3Lo/EdLbV566I
         sxpxln0hltdwcpvtobyjhwiIFOlpvtqKSDB/QucOk6lnF0IiYRBVmBtmQMpyJQAh5WfK
         aE+gqN0zuY8gE58Rb421gVBahZuRyoR83VJbltKvEltebOeuyau9gFPsdJmmJxojIKR1
         GdW3puySpfQwMBqqTPsL9UTwW6jotwDdqWq8xyj+G9B2qXvE1fNISI2ePNnrduoduSL1
         Z5yS+774tzWxcT37jf++gYGUEk5VxNH5HVp2GkKn3d5PWG5m6u8u1VKKR+1heyxF5MfQ
         lcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jmnQsQ2nLUzstSMrsKXf5By3v5J3tmrAtywKsYCssgg=;
        fh=31ThSTA3zZJ/4mUsCBh+hc9WM2WYhYEoIziEAI1vwSA=;
        b=Pt3MXGA4oHxwada4DO3hg6xFPfvak6zYSULt7/DjpiYSafGhvcrUdyAKNPT+8id9es
         McE+lxAbavNg5R2FLKTGbA1lyXw/x/xHNJ1D8KNUaVE1n1yW8/1Nc6d6FbvVE5hRKPfE
         vuCSUJ7sNP7kuKgQiVeR/a3OXrQk9pewPlkb/aHtY2+bv/N4ooZNg5Wapkw84ogYrTwr
         IrMjhV/0113JwVICMvvGmmmx5LZRWShqf87qUFfd2jugxiYDFwTi9gXm9PE63+zAYy3x
         9SFU6hq7CyaspTz2wqbWzLuU7QtTp9lsrdDWP3lTiVQ7fPsb7/ZxVPF1zgKhPynJG0CY
         HjnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758834; x=1791363634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmnQsQ2nLUzstSMrsKXf5By3v5J3tmrAtywKsYCssgg=;
        b=q36lqAQL0rX1j50QXQ4g49CYGMhYwKHCsJrYBLkFisCdAjHYrVK5zggtRjJx4pb+aC
         TWQZIYeYSVckcySzdbNxihiPbPpBKFkpWE9xzF6MfLJ2Sh9NYTMmeMBdvHR78H60BohC
         k5EgxQxavKZibsXmfUzCSuJC8x7UUXXeBc6/d494nPTBRe8D4+lR/yyutPxccyhx0+sI
         vnCFfGkyWdqlE5v38OXIOdW0nqoH6IiXSBrQoREUITfvhOjpfs+Bu2Jj3KUFbtHezRDk
         LvkMTNsvJoqZ/aOfnWOOP/91M5KYp8IGbOsY3GwADVgmpR0ouIU9sP7PxOLzyGhiQ+ZH
         J4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758834; x=1791363634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmnQsQ2nLUzstSMrsKXf5By3v5J3tmrAtywKsYCssgg=;
        b=dnkqz9RLcKar689gMjcPJaOIiZFraZkaCQOaDrcYewoZOMU6+MNpbunrrMAWincJrj
         uysItpP2pY1wcOvQMzm1RB+IXTq+HRmOtikHOt4a7WJoRE3CHRHxgnBmpZMJPaSeYpzA
         sVOCeSiOFpYevJLOlX8I5VULj9Fc/sFjHXzH+Aris3RcLxNfHyGvDFs+JIkrlzvs//Li
         0dF8olFm6DTrBA3HYTDFasc3zVIAk7i4dGjehieAocFjWcQeBZQgTs4m7glzZRVy0KSF
         LPVFZ/N7LCZLQEBrstxZOsnlBO1dqueMf48bRR/hWSTv6dNbsW5LC3leyN5bm277m5JA
         wdhA==
X-Forwarded-Encrypted: i=1; AKwUvBxtqS71QWjV9XOGMLO3mxB3VGQb9Hqwi3YWxECIb+g9mF/Oa8q0CYig3MCKldNvW4fV/ug8E68c6KeX@vger.kernel.org
X-Gm-Message-State: AFq9FYLyuBVmO1sTANzCoa4b6yi+8xAYFvHwo6oRZ8kQqj4cB7kF2Tan
	ocrfvYp6SPcRYMW6443/uwFLE8zTLjIh+OM/zg11QQGoaNWz0NLtalFvVQFXw7KZm24QWYqUkNi
	OfEVGiloXIJKpblpaGUT2i7qRORCEMcI=
X-Gm-Gg: AYBFou1798LDa2pKH2ZtP9P6LbxCD6dn00sjNm9yiGM+7/Q/4WNyLuSjtRHmOI0FCgo
	Oo8oQc5R8eU/GXHEuxZYH4AsS4e3W6jJIQpQPS/6XIsHmXb2uuzMN7FbiIqgM3DITLWDzdJcyL4
	h0lxHjwX/VSnxYPBLO+1g4goWIkmQphzmZVa/l9l+7PAcSD1jN9f24nNT3fCBEpFieWg48wE5eg
	4QuShfpYxRmWgf/d6tL8FfMts561NjVu1Q1jRLTmHRTaX31dQbGzAPBiPRIBRd4+jVOUKeliAoW
	/XfG/Bz/wQBumZUxPBeoras9CC21tHC7k0BjD/tK3uGSvmmA/i+mzRoLKtvep5elnsiLtA8Z21f
	BXJZq1ODb327c
X-Received: by 2002:a05:693c:6392:10b0:332:8b9b:bdc4 with SMTP id
 5a478bee46e88-34cdc3caaaamr1126682eec.20.1790758833695; Wed, 30 Sep 2026
 02:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome>
In-Reply-To: <arzMF0wjcF_SVxpE@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:00:21 +0300
X-Gm-Features: AclHuK-TlqGnIU7ukp8yYWTozjs2IS2nCNkcdYeOW3HWE0VGgW8HyLwmVml-FCw
Message-ID: <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:47 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wrote:
> > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > Tegra20/30 SoCs display controller.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++++++
> >  1 file changed, 138 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra-8bit-cpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra-8bit-cpu.yaml
> > new file mode 100644
> > index 0000000000000..f0dab608b2936
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit=
-cpu.yaml
> > @@ -0,0 +1,138 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit-cpu=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description: The display controller in Tegra20/30 SoCs features an
> > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > +  protocol and is referred to as '8-bit CPU'. Each display controller
> > +  provides two such interfaces, which can be used to send MIPI DCS
> > +  commands to initialize and control the panel while image data is
> > +  transmitted via 16/18/24-line RGB.
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra-8bit-cpu
>
> The description says that this is a feature of the display controller,
> so adding a new binding and compatible string for this is not the right
> move. This is all covered by the "nvidia,tegra{20,30}-dc" already, just
> need to extend that with whatever is new.
>

How would you model it? I have tried to model 8bit-cpu as a bridge, similar
to how DSI bridges are modeled. This reflects interface used to link RGB an=
d
panel, without inflating existing DC binding. If you have any ideas in mode=
lling
this, I am open to any suggestions.

> Thierry
