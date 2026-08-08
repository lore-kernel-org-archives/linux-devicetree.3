Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9A1277CA5
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786199961; cv=none; b=TGE9afQ8Aa+npD5wZZK+epimzvbUpOdGuAf3e+UL2RKyb5/CxP3IN3qxXxc/doz8lg3t6lVkQEuJcE3G75AnzJzWZVZkUAPD+hZErjZAk+Swv/sp1D8n3EpkQAYXOceF5HzVwOEHCftgc7dRFi0iRtIENgPbGa/I3RaEOXB6OLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786199961; c=relaxed/simple;
	bh=GNZdbMnUJ+VqGa8a7gNHiTQSeSgxpLKBAsS0DNjAnew=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGPriz9Y2fePO2YXNNRQvwzc+qOkQnuq5/7PotZuO8+xzBsaGpwvVke5hcLc+fIPGyL1lLGrlVb3OG6Oqjl+Ne9zONFfz46JYReGYtymuQUNJBg1kY8D5amMRz1jwvWyqUxXQIqHL+7ysowBwyVheS3ja55DIEM/n3qZ8ZTI0dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D26+vpQv; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D26+vpQv"
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-38f0f8ab050so595758a91.0
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786199960; x=1786804760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gLPlagPSnxq9fTONnyyz/3ddba5KQ5Gz9V5u0Vh5tVQ=;
        b=D26+vpQvhZwWjfur4gExF4hKMVinXGQ8obSX9UAbU8f4ld5iF9Pm94eQ3TZBsRHat7
         fGS8VUOKSbooARdm29094mB/TDc/gC2+RZoXTwImtkQ8TEpMNSezTACtE6BNV7omosgf
         ZG5bxKg9W7DpJVstLlKmpbPpC21cwjUnRj8TD/GOSNbucSFcdyfoURNJNBxyFS6pkWyW
         uDAjqu9Z5F2Db2j/lxJH7Meii1iltQKblF9l/8NeDat4mjRWXXGxx4jo4c28ilqXXYtj
         kt4tVac3ruTmKa54v8N8oJVbk3VZyEwKn9VVinio5Yn2yh84uiN2iQ+En55SWY5K9r3Q
         OYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786199960; x=1786804760;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLPlagPSnxq9fTONnyyz/3ddba5KQ5Gz9V5u0Vh5tVQ=;
        b=EFNnZc93PqFogJ+6hTWJqPvdMTklCT+yGHjh9mgZQDe+8vQIbGhielbf0ZGwESqY/Y
         bKrGGVU4arYvUnrWZgtmQO/780BbTehlWdwQRFRJTdxuZkaTfKOaAYeFPE1QIMp1R6s7
         O83sj68WIZ4AFRFphoBTfrP7lg8GQjrpXko+HhJyinJ3KXkvBMAgp3Ok+0sK4oydHKJJ
         WxFtED9c4f7D3ikLywflX6CbN/CC+eMTQFitFLNZ8EgyrUyawTaVJkhT0xn9VZ8EbPQX
         +/dZX5Q9oPhvOBr/PtoJmFQzXg/NLIN8viH+z2amRIIVg6yFFo/UNARk+oL9fbkNqJO5
         BMDw==
X-Forwarded-Encrypted: i=1; AHgh+RqC9IfuaUJ5tiSi7SQs5EDj8OcBPXQmkh8UPZpoMYKktggbyZNq5O6bQOFd1Gv9XMaavyRo+Kc1aRHT@vger.kernel.org
X-Gm-Message-State: AOJu0YyU9UmMun1SKdP8FuLs1+FUf3KSOVwH2DAm1YrbobMdckMPXTo5
	5zbJF0cnbOvXS79W3Yzw6T5fLTS7QATqJ9rHsjrSObYRrUa+6B2ZAOIg
X-Gm-Gg: AR+sD11gOn5JunkkM58gVoec2l8OC66nnTSFxU5AjZuHpyd5z1Z0b3cVofAlmBB+9Xw
	Lcj3pD5KZEJYyeUUjklPs8u8nZ+HjvDoSEBhqFqig9NIk4wiZULdww63XmXwlCNXI9QOjCeO4yj
	nwVPr3AIuaM4iU3imjroJaQY2tOPurONVwj7ER72kO3LOPwIfAYbweCAAEcAQr0f1vtNHchnK2D
	t9oKGbfytzxaLIKLaySMpuubPmSZKeb2+m3kz69NOKrfAB0jYC6KlaPQCtC2BcLWJF1n/thUDQu
	phoTtQQBLfCVn5nE+aVmg9STyhKEVckFmsVzp+14WMN4OjKii/wj0dmOYVcpeCWUBjYNxQdpFh3
	T4AA59eBL9PXKO/+4U6UMqBRvSszYFE72xwBnIERfR62aHBCQyegvUpMlSwnlX054HTtaBgbYKG
	Viv3Z4/ZfF85sVMfQn+vWyEZOaNLnozTYHIiMGujk=
X-Received: by 2002:a17:90b:2585:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-39261fdab5amr13832835a91.7.1786199959787;
        Sat, 08 Aug 2026 07:39:19 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd95794sm6424491a91.7.2026.08.08.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:39:19 -0700 (PDT)
Date: Sat, 08 Aug 2026 22:39:16 +0800
Message-ID: <ec84e2ba71be5e82a3afcf257129bf58.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 03/17] dt-bindings: display: spacemit: add K3
 Innosilicon DP/eDP controller
In-Reply-To: <20260807230404.GA2211679-robh@kernel.org>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-3-6de34d80e86c@gmail.com>
 <20260807230404.GA2211679-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Rob,

On Fri, 07 Aug 2026 18:04:04 -0500, Rob Herring wrote:
> On Sat, Jul 25, 2026 at 12:51:12AM -0400, Cody Kang wrote:
> > Both K3 instances are the same IP and share one compatible; which one
> > behaves as eDP is decided by what its downstream port is wired to, not by
> > which register window it sits in, so the binding does not distinguish them.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  .../display/spacemit/spacemit,k3-inno-dp.yaml      | 140 +++++++++++++++++++++
> >  1 file changed, 140 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
> > new file mode 100644
> > index 000000000000..865ea310daaf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K3 Innosilicon DisplayPort / embedded DisplayPort Controller
> > +
> > +maintainers:
> > +  - Cody Kang <codykang.hk@gmail.com>
> > +
> > +description:
> > +  Innosilicon DisplayPort transmit controller integrated in the SpacemiT K3
> > +  SoC. The K3 has two instances of the same block sharing one compatible;
> > +  each acts as embedded or external DisplayPort depending on whether its
> > +  output port drives a panel or a connector.
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k3-inno-dp
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: Link and hot-plug events.
> > +
> > +  clocks:
> > +    items:
> > +      - description: Pixel clock for the controller.
> > +      - description:
> > +          Pixel clock generated by the DP PHY PLL; the pixel clock above is
> > +          parented onto it in use.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pxclk
> > +      - const: pll
> > +
> > +  resets:
> > +    maxItems: 1
> > +    description: Controller-wide reset signal.
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: Phandle to the K3 Innosilicon DP PHY.
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dp
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Video input from the DPU.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output to the panel or to the DisplayPort connector.
> > +
> > +    required:
> > +      - port@0
>
> Shouldn't port@1 be required too?

Thanks for the review. Yes, will make port@1 required in v2 and
describe the DP connector on the board side (dp-connector) so the
graph is complete.

> Otherwise,
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks! Will pick up your Reviewed-by with that change in v2.

Cody
