Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036987;
	b=292rqTMp3CXp2NFXnoyK1vTuJSmwaecmbHO5wL3ZlVf7G5Xg8vA4IKec/oBtAL0Y/eHO
	 3zMFhDHYXnicf9wS3056rcCkmQynBk22poTRmYckn22yrMWfKVHn0UdqJvnaLYyJ6wLxw
	 jZQEFIJmVEtfWP1/qoyK7xjhZZCF7GZA9wRnIb7e/jKHHdYOLiI4OCQmPjT6ejCayNTqb
	 klLo1qwTa2j3Xs8oUqsQ11RhSIqI9DEJzHfjNJ3OEOr2v7SVono7W+edJfVfhJE9baQES
	 cC1fN/1DRgLIXnYE5Eiran3mGntvpreOPbMw7wtcDcUagilkqlrVYNLWodKrzIkAUiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036987;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cqU8tvLU1AnmfDQyKnlG7EO37FGmGqpovxrw0thQzoo=;
	b=Or+sV5jGhArAeS23ppFtSlNybM8lkpxlUttWG8SLnRbNzYbay4nrYQWB3hAKRKmyAP6g
	 FKJMisSJfB5bbCEA4mV9ozye+r8DVq3wxi6Ou6fCBpitV/zAmP9d8jXoc6y5bS0hxrBQm
	 pGLFFRijb0Fg7NdWhRzZ7iVym5EAa3Py4RrQ9cbbojQVBqnXhv2HhhetHSJAE/xOGRHIC
	 n4nAL/A5d4GwMeTwweu8NnEMTck7ExUFknKltgttyVuMbbdFwJQ4yA5W7dA1MwKINY4m6
	 m8Rrir+mh/tzS7xRgROJxh0TuuB5XoLemjKuXpKBvcKMqU45wxya/TY7rLZiXAYouKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Oxlz/E6v";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEEA606A325;
	Wed, 18 Nov 2026 21:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oxlz/E6v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D911F000C4;
	Wed, 18 Nov 2026 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036986;
	bh=cqU8tvLU1AnmfDQyKnlG7EO37FGmGqpovxrw0thQzoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oxlz/E6vE62jZP14hMEO4/o1sdonf4EBdMU12AgzhpkqyHI1geaFxYIZQioBrUsWv
	 yD7eWsyKrU9tZBPdYukOYHjrBsuwDq5W5Sm/Sf7qOxGZ4+s+wLmM6tTNHsFTjUh/qw
	 OALsF6/h/XGGLndHpLNrWtC1rY8ePoS0bK3lnWacwzePa7sU9dFWKzvwnzGPEOg71x
	 RQlVVXSuF8zNF4dn029EGXaQCz8MT/cMZG161Umq0aeuLLqbkXIZPjTQgYzW8Tuezi
	 kYSUlG5UXwFEnCy5iEWZxuzoHPg9YCRJWOwbaq5rQzXmcMhwKaKF/MUiTmoOY+g/pN
	 cxOsEYCkfYW3w==
Date: Wed, 18 Nov 2026 15:23:05 -0600
From: Rob Herring <robh@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 03/11] dt-bindings: display/msm: Document Nord MDSS
Message-ID: <20261118212305.GA1058901-robh@kernel.org>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-3-e3d3bf0e2c49@oss.qualcomm.com>
 <av0uy_Cq9iaTZn4c@QCOM-aGQu4IUr3Y.na.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av0uy_Cq9iaTZn4c@QCOM-aGQu4IUr3Y.na.qualcomm.com>

On Wed, Nov 18, 2026 at 05:51:23AM +0100, Shawn Guo wrote:
> On Mon, Nov 16, 2026 at 06:46:42PM +0530, Nabige Aala wrote:
> > From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > 
> > Nord has a new MDSS 12.1 revision with DPU 1499A and two independent,
> > DP-only display interface controllers (no DSI), which no existing
> > schema describes. Add a dedicated qcom,nord-mdss binding to document.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> > ---
> >  .../bindings/display/msm/qcom,nord-mdss.yaml       | 396 +++++++++++++++++++++
> >  1 file changed, 396 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> > new file mode 100644
> > index 000000000000..abd80dae4e7f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> > @@ -0,0 +1,396 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,nord-mdss.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Nord display subsystem (MDSS)
> > +
> > +maintainers:
> > +  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > +
> > +description:
> > +  Nord display subsystem consists of MDSS (display controller), DPU 1499A
> > +  (display processing unit), and display interface controllers (DP only, no DSI).
> > +  This is MDSS 12.1, DP-only, with 2 independent DP controllers.
> > +
> > +$ref: /schemas/display/msm/mdss-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,nord-mdss
> > +
> > +  clocks:
> > +    items:
> > +      - description: Display AHB
> > +      - description: Display hf AXI
> > +      - description: Display core
> > +
> > +  clock-names:
> > +    items:
> > +      - const: iface
> > +      - const: bus
> > +      - const: core
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  interconnects:
> > +    items:
> > +      - description: Interconnect path from mdp0 port to the data bus
> > +      - description: Interconnect path from CPU to the reg bus
> > +
> > +  interconnect-names:
> > +    items:
> > +      - const: mdp0-mem
> > +      - const: cpu-cfg
> > +
> > +patternProperties:
> > +  "^display-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      compatible:
> > +        const: qcom,nord-dpu
> > +
> > +  "^displayport-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      compatible:
> > +        const: qcom,nord-dp
> 
> This is now contradicting with the dp-controller bindings which documents
> "qcom,nord-dp" with a fallback on "qcom,sa8775p-dp".

The correct thing to do here is add 'contains'. We don't need to define 
the exact value, but just have enough to ensure a schema is applied.

All these child nodes also need:

required:
  - compatible

Rob
