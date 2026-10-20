Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490678;
	b=ZFnqo3oJjAZRzK2nIczXKtxRVQgvxM7fiBrjmtZisVEJH8hWfjsJIfX6jaadI44JZ4Iv
	 GTzRomvBkXMCJ7se6Udqldnhc4xPcTmFBsL5o9u0XPtZUoz8lCPP4GVIr0QguJjAB9Q4o
	 HktFALTTzIh2izUFIKzOS5Vyi3SMUkBpcZaqhUYLN018qfSkuO6DqVmfBdoJs/8C0yhOh
	 e6sHwTbGIUuZZKiFvhyLi/19pwvKqHOSxznyyTQnGfEKcJ6oRcu9FelfYN7bRcAItykUF
	 TB4JEMIJJU4iM4VI+aUK8IC5Gn3K7sU7LBlXJ1F/R68LzfcFn/eq/bmOmyTQbfHgptA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=U0/lnzk5hFsVd5ZzP5Fnt4j1JlLknKQhx8BKtAG3IEE=;
	b=zHSgduqCaG75yTFQPv2PJKZexQtIYogIL3UUAE0+YKhvym2wOkPhrGf8u0aAzCppX935
	 VobO81caSBYz4JWMTp9Y7xuKRnRLZlFsCE1f5oXMOGhUR2Ug4VjoqpABVC7kO9r5JiEiN
	 e2cZovBTg3cTId+sBEdRoOrXI/8SsOb1t7p7jhYrSToC5MyWKo4IQS1YksLseBz6GUMS8
	 +937J3DIMfOHIy9ZqR18usxPhMLl5WTZIGc/BfYwJNhabks8ooZ5rV/ZNL4vZIkkkKi4K
	 G7PB6MHErDxdIGCQrLwbCn6jEwo5duT3FnVraYb+CZd0ihs7faFvVx3A3ctUHHSQCdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FuSZyAOt;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7313C606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7313C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FuSZyAOt
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-354ba08cfd1so5543249eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792490676; x=1793095476; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0/lnzk5hFsVd5ZzP5Fnt4j1JlLknKQhx8BKtAG3IEE=;
        b=FuSZyAOtgmaq3sCg2uXCvFy8HhAlxhY4FvqQ4Pv9eUpyC5Wg4HpPi4imXh+oIiwqF+
         RuPzvldA+borvekP8KP6jB4g4/mOzH8aPEgtb+wXXJgpXO6W9fbiKDrnXGSj8rf3X12N
         pfz3iifyNtYxGreAuYkZ1GXJBHfV+10ne/Fm0uoRq3RGh29/M7hjeXPdug6l/CIuiS+M
         TTDSYspO4K22jLSl7CGx7Oy7fM2JIJig+ZyD8yr+JRfn8MohxE+WWBM0HabFwP2NhB0h
         dvbXsTwYFWoMNsUPYNQy1nr6STlF0TmAcC1wILnfOh0jfQURAUkWmqLjj8FH0FIEP6uV
         DNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792490676; x=1793095476;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U0/lnzk5hFsVd5ZzP5Fnt4j1JlLknKQhx8BKtAG3IEE=;
        b=kLWDNuJQpJgh5Pq7afnMufSJA45F+ThX2ysKr7xIbeNAUCKFOlrYpnov99S/TJ9yyz
         gwyu+NMeU84Pipz4ee38QM511oPfGt7KmG8ZDiWyigN5YGpY0fi3sFMBVvcaE9iQfOhu
         CQE9tj2dah9D1OWQLJIqSXuWT340tCa4nca03+NG34tWLMdMYEPeHdPKTUQUFEU+Id5f
         CRmm/F5OIrKG9o7GdMJsLMdIW8/4scCbcM59KG3WL/lH46445Be1/8l9jznkQ7D3ZwgE
         UH2WFIp4GlQn/8eNSWm8qre3PTjjmqhFnD6qD4my3NB3HZ6axeM376Pywh/+io32245p
         jVDw==
X-Forwarded-Encrypted: i=1; AKwUvBxAGIKH7meKv1TyVrCEkYlsneQng1NGgyjFXFDG6cDhTJSNczZ4IVXhorHlEDY510270Aoo3EX4DoKy@vger.kernel.org
X-Gm-Message-State: AFq9FYLz3y0gWudaU2VAk6wDo1xe0t7ZzNSLf04XEBuBiramkDNQL0qq
	sx4vfzR9c0N7niCHM6866s5RCiWc2LWr3VXj/Eb23vjz0U6hBNXp7C4V
X-Gm-Gg: AYBFou13m3Kl3e7BYsSRT4Y9XvTku7aHUpUjBYMspq3Stq/K7lSeUgZQe2wmrXFBqH7
	jLrBrj5kh3bjk56K5LfUQfE+bER2yvGOERRMg0f6eJC9Jr67Pjte9ZfT3v59gWFhUvB/k4WsHRD
	iiNdAUdqBjyfn9lUHTYi1A8iJFIEqK/AvHc5UGVzTJ9QafTslsGY6iUjKouIM2rG6MCzQ+y4opS
	dAIQoKfraZxTfUuCcr1OhG0wnFHZ98VIqW1bKVV8r2VH+AeHCkzOScMbxLsrWFvW28pzoezEIdC
	dQLoU+s71c83/4MgNW9YB0UiKmSRY7WSrCGsqi04Y6+detV+/GD4mYkJlSm8kLQrjKACItCb5L/
	p2cSzDA1ABjSCNJmXtnrWW3SEImoUtHJyw+b5eoFrCNQNSHm2znmluUc6u7pE6WTWWuIl5cBfGG
	JjsYpCwb/HxrX/uwatOjwYm8xeoEic/ydAghHS/YwO5UBfYupx845TQ0zxgLmjllfRvJiOCmlrW
	GMdc/R/vQJuUNLyiVMkZJ/Gt/ZV0wHd+rLQcVt2684FDSgS4u31opsNH+wDWQ==
X-Received: by 2002:a05:701b:204f:20b0:151:7f08:5961 with SMTP id a92af1059eb24-1850c9cf541mr15980378c88.4.1792490675971;
        Tue, 20 Oct 2026 03:04:35 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm36076766c88.9.2026.10.20.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:04:35 -0700 (PDT)
Date: Tue, 20 Oct 2026 07:04:29 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Message-ID: <t5mkri7cbalmy55ylrb7stanrnmxc7ep4vhmtw2nzulhgdi6wm@jsdhywrqubwx>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <sashiko-outbox-177001@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-177001@kernel.org>

On Mon, Oct 19, 2026 at 10:36:09AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ARM: dts: imx6q-apalis: VGA data-enable-active ignored by simple-bridge
> --
> 
> commit a66c8dd73182954ba43ed81cada90ae73edf93a0
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> ARM: dts: imx6q-apalis: Add VGA overlay
> 
> This commit adds a device tree overlay for the VGA output on the Apalis
> Evaluation Board, connecting the parallel RGB display interface to a
> non-programmable video DAC and VGA connector with an active-low data-enable
> signal, and wires up composite DTB targets in the Makefile.
> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
> > new file mode 100644
> > index 0000000000000..991c2b7c27773
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
> > @@ -0,0 +1,80 @@
> 
> [ ... ]
> 
> > +	vga-encoder {
> > +		compatible = "dumb-vga-dac";
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				vga_enc_in: endpoint {
> > +					data-enable-active = <0>;
> > +					remote-endpoint = <&vga_display_out>;
> > +				};
> > +			};
> 
> [Severity: High]
> Does data-enable-active = <0> on vga_enc_in actually reach the IPUv3
> CRTC?
> 
> In simple_bridge_probe() in drivers/gpu/drm/bridge/simple-bridge.c, the
> data-enable-active property is parsed into timings->input_bus_flags:
> 
> 	if (de_present && !sbridge->bridge.timings) {
> 		struct drm_bridge_timings *timings;
> 
> 		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
> 		if (!timings)
> 			return -ENOMEM;
> 
> 		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
> 						DRM_BUS_FLAG_DE_LOW;
> 		sbridge->bridge.timings = timings;
> 	}
> 
> However, simple_bridge_bridge_funcs registers atomic bridge state
> callbacks without an .atomic_check callback:
> 
> static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
> 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.attach		= simple_bridge_attach,
> 	.atomic_enable = simple_bridge_enable,
> 	.atomic_disable = simple_bridge_disable,
> };
> 
> During drm_atomic_bridge_chain_check() ->
> drm_atomic_bridge_propagate_bus_flags(), sbridge's
> bridge_state->input_bus_cfg.flags is overwritten with the downstream
> display-connector bridge's input_bus_cfg.flags (which is 0), and
> sbridge->bridge.timings->input_bus_flags is never copied into
> bridge_state->input_bus_cfg.flags.
> 
> Then, upstream in imx_pd_bridge_atomic_check() in
> drivers/gpu/drm/imx/ipuv3/parallel-display.c:
> 
> 	if (next_bridge)
> 		next_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> 								    next_bridge);
> 
> 	if (next_bridge_state)
> 		bus_flags = next_bridge_state->input_bus_cfg.flags;
> 	else
> 		bus_flags = di->bus_flags;
> 
> Because next_bridge_state is non-NULL, bus_flags is read as 0 from
> next_bridge_state->input_bus_cfg.flags without consulting
> next_bridge->timings->input_bus_flags.
> 
> When ipu_crtc_mode_set_nofb() -> ipu_di_init_sync_panel() runs,
> sig_cfg.enable_pol = !(imx_crtc_state->bus_flags & DRM_BUS_FLAG_DE_LOW)
> evaluates to 1, driving the data-enable pin active-high instead of
> active-low and gating off the VGA DAC output during active video.
> 
> Should simple-bridge implement .atomic_check to populate
> bridge_state->input_bus_cfg.flags from bridge->timings->input_bus_flags
>  so the active-low polarity is propagated to imx-parallel-display?
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com?part=3

This and the other comment regarding atomic_check are addressed by the
patch series below, which is listed as a dependency for this patch series:

    https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u

Leonardo
