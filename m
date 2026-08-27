Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802A446DFF0
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836152; cv=pass; b=cbCNBsjzgL7eX5SEIhcXPLh8q0Pw3EjZkSm5lqiAFB76LX7e1WOz98AhmqUiCBHHPbgi7wbihDzfoSvxMqFcl77ciNwCprzWIfZpHDn5Jd4ZZKGAkwNeHJ2kQ+RTx9fwdeQAp8BRhyrOPmkH1WZUFwo2dxlV3pxSbprT9KeTyMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836152; c=relaxed/simple;
	bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrEtSLhywDVBOb6jVyMIBuUqzRbfM3tNMFUoc4C+2igy30F+qxKWUcQqnnzyUUE3M9DVUO/U3MNK1pikuV0A60hSg35WgkzbZIg+07HMZv+2unYLh9zEg+sz+UHo7Fu1lZOQXXgI4yVhQ2x9DLhCxHb71goOYplNWWcU5V1KMWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRcTrciv; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRcTrciv"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so2034250e87.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 06:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787836145; cv=none;
        d=google.com; s=arc-20260327;
        b=E3wUM7qnqzEHCfK1hJ5fj3oKz+Vri2ONg7vP1zB2nynIIfUO4LmjEzkqoiI+cLazJJ
         +ZwptixraM7DO8zof7uBQTdpZLyZ4K+gEwIdM2nzzml4oj/yidFLPh/amo8RSkXrcqWS
         sJsi8Rjur78z/xPBDF2GtHVtLkCkf0sqWzZW7vLsLxGNH91rTHX39vNsjM0kO9MIqpK1
         mPoNUl60UvqF+5ObobIiTJN/hTKtk9gsnUxedqkbWgculqBKyQ2H5ZnYtWeOJl4IoXoJ
         uG49dLGLGeioR1nTvgYFiSZw9RXR6c5m1H4qAAZ0N0+69aeTnVPPOr9lHKutkT5dtE+9
         Y4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
        fh=l+gYlUMu4uAiW1Def/FXxOcYkr60ppQNnkoam+zlqHU=;
        b=BOjJkiQvQPGo7cYf+MMgbN4IqnT3+DqzXgLozMLUc/VUwwBC6AXnNDlDnhUovozhGn
         h3PKnBsvaZH4OerlmG5xO9EaxKpQZrEZNyNiz3Uz+fRMEeoluw5EKjkDi1WbZ3OKOFjw
         H45hdoNdStvSRW81cfUIKOUBxdbj34UZcNmy0hQTykwbp6Al/rRm2/ZNlbYFUmr6WDTE
         +E2x5GdmsbBFlCamrsuGWjNByR51mrywoGQKbPxsrsKJg/4ET5nG1EGcZ75qZDvnXQyr
         d4kujVLX/tdziZCZ6ssg8aOZ1tPSFxj2B8yfiZT7MUaosQUPesJtF6FB+xagB1VKMzPd
         w8ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836145; x=1788440945; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
        b=lRcTrciv1tpI+038IVPgCI2tC2Pcj6vTAlv+YwTWScJuGM4KIs5fvLPs3iLlRepcd8
         AdoyoJLWwxxvYyFHX1e8Vrly9rpYjMkUYmPfyLUB3ebqKwIBSdiB7pXJwi8iA9WaMSxB
         IBhFCqTLUDfJ+VQjvOtZ8RDl5NdtzoxL1rUDrKwfTkkgAOA8khrsn12UMfyXWZmOne/l
         AcMVSb5VCFypAc8pyurjApvpr2NtCKy7Z/KKJsMWspF8VIFzfY6Sd4qGkDwseP32tF54
         mxNQtguRbY57Gfq7Ease6C27QqN7v8YjofkIHg1zkG0uKKk69kos5EZ+laUGa7rZA1c4
         mOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836145; x=1788440945;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
        b=Edx8DsIYl9tMgECZnU9ay1V04H7B09J28sqqLj+iAG5ibBGT+gSk2YkYXzibgbmxm+
         vb58SCsZMFMvuFjpZxHXWoGZdL+/z6v/2810Wpbj0h3F0v6odSIpNGpEhfh8LWp7ki6h
         uv6SzQCJR9zgtefSq4y2ha+DSqoDYThBfdshhoZyEN4x6wICG6/vXpu0yN/FN5wzDqs/
         5NK/Miy9oz0HRQlCD0OmoSznc2s+FAZfvuhzhvQWvrx4Ve1+HR/Oa/2zYp1n9z8qZFoG
         gLnKzKcBcD7yzj+Gl79ELbeQdo1gYLeREV10aFz2TnlxUht1KcRSsKnepVBWXHDnjvFe
         8R5g==
X-Forwarded-Encrypted: i=1; AHgh+RrdwgeucuUhiHy7KWLOhdwkJM3SiXXtK3v1wlagwbjRaSDgGI4FPplkXWzNMOoARd7qFcR1RTn0mgB1@vger.kernel.org
X-Gm-Message-State: AFuF++lgUrLRxr0qwnprpqUfPaNO0CXWZ9WT+LdSDnre5CWzJI2nygCS
	lMl+JTDtJGyX6p5doREA+58urNcAzxH339UvPkIa2u/oGbShYNGXcAW+zkMJp6micpN516/aM7g
	u7LBHyKH8jEtm5kIT7wGW8kCNiCE8LBA=
X-Gm-Gg: AR+sD13d8VsFjY9vqXWIW9pCcxf47n5rASvyJwZoIkU2ek+Jhe9flK69X+grSXM8tGv
	MUF3QLkgcjtBU5tp3px3U/P8l0JNQgFPaqHbVx2aYYh1r6ZKH+QKCIrROeiFENs1k9EU/eyDveK
	DaWAUJZmKlwsqbadwG0UcBdzP0OagYyMw+La+9/u+EFDx4+XDHfHge5UIpIjy0wWkd198rqU8Vw
	HYHRno1n2Bpa/WCLPwglQfH7Khxx0y2/hHkkTPLn5XZ3u/mDf5/KMb2HIUnR6nW7cj9pfHmUaPm
	mTy3sbJbyySo6LlMJtdI6CtCp4NoN2FpXO0rby6VBooZboiBwWl20bLoZL1AXmBCt390guTvazx
	TRR+3z6eUg2QD9MyJ2DK+oqt4+fvaQ+TDOnhKvVaEBAqpcBkj3hcAP+2ldg==
X-Received: by 2002:a2e:be27:0:b0:3a1:d468:f988 with SMTP id
 38308e7fff4ca-3a1fd453e09mr37025921fa.1.1787836144417; Thu, 27 Aug 2026
 06:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821010728.45065-1-gvalkov@gmail.com> <20260827-helpful-icy-donkey-9bfdaf@quoll>
In-Reply-To: <20260827-helpful-icy-donkey-9bfdaf@quoll>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 16:08:52 +0300
X-Gm-Features: AcwNN1UImZDtg3-upEabUa_XGggulmtbmlnjP2_UXhZYxbNMdjonIxEdG5ok4DI
Message-ID: <CADOrJmaF0UpRefk1+BDyn5iU5La4ke1gFWwzyRr5-9wp7Zr2+A@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: net: wireless: add flag marvell,invalid-reg-hint-in-rom
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, 
	kees@kernel.org, miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 13:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Aug 21, 2026 at 04:07:26AM +0300, Georgi Valkov wrote:
> > WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> > from the mwifiex ROM, which conflicts with the platform regulatory
> > configuration on units sold outside the US market. For example:
> > - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> > - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> > - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >
> > When the system boots, it detects a conflict between the user selected
> > region and the radios, e.g. BG FR US, and applies extreme restrictions,
> > preventing phy0 from starting on any DFS channel. phy2 works.
> >
> > Add a device-tree flag, which allows affected devices, where the radio
> > conflicts with the platform to ignore the incorrect regulatory hint in
> > the ROM of the radio, so the platform regulatory domain can be used.
> > This does not allow the user to change the regulatory configuration of
> > any radio. It only allows phy0 to start and operate according to its
> > certified configuration.
> >
> > [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> > [2] https://github.com/openwrt/openwrt/issues/9956
> >
> > Cc: stable@vger.kernel.org
>
> I don't think there is any bug to be fixed here. Support was incomplete,
> so you add a missing quirk, but there was no bug in the binding.
> Binding was correct.
>
> With stable dropped:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I added Reviewed-by to the first patch and sent v7 with these changes:
1. drop Cc: stable, the first patch only documents a binding
2. restore colon after Tested-on as requested by openwrt-ai
3. mention the added wifi@1 node
https://lore.kernel.org/linux-wireless/20260827130335.6606-1-gvalkov@gmail.com/T/#t

Thank you for your help and patience!
Georgi Valkov
