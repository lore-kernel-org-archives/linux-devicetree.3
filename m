Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874047;
	b=DbHYYLQrfiMYVvfB2hwR2EwMX7tQMgspykecxTPsteHyaQlKt6F1YHG1uLh7AffUoTjR
	 yDIdu78dLWICqrimXRpwMnTgVvK8H9YHndfQtPg84jYxrfEoEWAOuk3EXLefDAllQ7Ozq
	 7ynMWLjp5JWYId+R7egl4bJvgOVizMTP3zLPckY0gP6gPU9ue2ma6EtVKwqMSG0Zf81Rp
	 0DrDXr87v6vd8KbOyrjfsGa9Lxb9r8ddKaJAKOJPiZLRYCE0xCqf52ybduPC3M+AGIGFG
	 FnHm8mVxSGUbAaqME52GE/niYSBqjbLvFijfHikyLISThMXR+1iKFMtuAh+vJLpWiPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9mX1XwkpZzZFlEfmqdehYAaIQV9Aq1Y+dGqXT/HOfNg=;
	b=jB9Yf5dLlFl0PYhcO/ZLwWaVHBNn8Z/g2ds6vph13U/G+g9EiPheayw5dNN3kwT8YwpJ
	 8SXtlKdRHgdLU3zlQl6po/gxN9d8SiC+mnHhnimuEpSdURAn4/y+SQkT5OeF/3gQEkBvb
	 iqLhcT6bU6/rgK1gUeaMCns3JOZ1zYho5rmy8vo/bYJFVQRlz5q7ny0gqBevNdxNDtyFI
	 nq19sOF3yTSDtQZqPJt1sigTdbDUIjY4ZGGNnqmjPGnW8YTwO8Y9UOfUkFosgiG8T+/Ap
	 +fa/fgEnFZbOAfnuWsjFqL6zvHQgu/XJhsnkuxKV94DM3d+bid/c9Heyzz1NeqAeB2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qi2hXA7x;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CAD606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 13:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99CAD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qi2hXA7x
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c10dc41270so9391297e87.2
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 05:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795874045; x=1796478845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9mX1XwkpZzZFlEfmqdehYAaIQV9Aq1Y+dGqXT/HOfNg=;
        b=qi2hXA7x7wrRxNS2ksI35vF6o18iVAI3siMasQCM0/EIvffM/SgAi9ZV87TC+rfFl+
         H5C/YM1XB9Qut/evinyE8MGbSoyucEesjeEw1HI7Ta739KwyxudLpTEblh6MIA3s+WR5
         +M7pCyTPFnJvc1NOGc6orBtpamkbWmSz03k4L26GfbeDECZPji8MhwOt8zFRsURVKAls
         5cLsXHTN4w4d3Pp/ShBy/VwZIzTV+kfNVMNj17HuUUMXbgKdKYPb+Gh4sqTWys+zQDN3
         u8+76dz5XMoumQKDrnAt5S1X3nDr0XG9tn5EtHgTikDZ8poG9RP7jcRfkfIablVyqSj7
         1P5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874045; x=1796478845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mX1XwkpZzZFlEfmqdehYAaIQV9Aq1Y+dGqXT/HOfNg=;
        b=tzx1Wl0trZztbZr8kShdr+UASIjReqx4dDjK2G4IDOew6pLP2nnEkP7UiQbnzx/qPM
         pRqMN1plLUutzyOVbKselr93oGuxnbuZ5qhnI0bOoU8b1eNrgWbNj0gRHmo6Pa6tPBEE
         ZlTV5JwJlz79hbOsvMpifOy+U5q6yeHVvTFTgM/ZrCg+CjkdOxxHHZ6H2kLIyRPQaZ08
         lDClkpZF2e4cGR84J5+2uQDdck5SrHqX0+tYSJ2WVrOJQNSt9eNqHmHhpmC3got+H5uC
         Qo5c+jiBJIp+LH0xkfcv5Z8jrUr4aljSlc9ezDND8xGt+fT+Btf3GXF0+czw/bqxLH4c
         ZAOw==
X-Forwarded-Encrypted: i=1; AL+hErF4vJVV6iIvx4tdpc2WkWZGy6gq55AMXkILbgIMd8LDzbpHPU1Lto5uq4fx0di0Vl05p4w+77IkPyk4@vger.kernel.org
X-Gm-Message-State: APuU4Z9g5XQjRgqfrvmGlPayAw9WXLqDCSIL373gL9wdoDYS/gjbqEfg
	ye8PygSU13f/FmVDV/2t5xk0NCm+wP+L73OEXOx7j37eUuoy3IN6gRyF
X-Gm-Gg: AZFdTZeQi0X2Ex0rZ+fmimBo/sAwQFkWVn4HZCJArlFAINImX6HLCLb7tKe09kXMuNN
	jVjvJ4osuxlhYdlCFbw90okMSOi8WpdiYD8cUvt+1y9AJk9CIdCAhcvMZW/zaSWKB2MzwZFMXg+
	sKqmf7CBw5uPqY49t942lMioskZl9htVpx78u1tfc4i/APnx77FTtF6zxx01FTYbxmMyU/dBN6d
	ra4aVtEcJ7Odp7n/z/FIJnBYAPzN56GJ4pgmkXZ9yOG0b94Fapb4yCUqlfxaLXBL2c+amDcjRyy
	o6Z3wKX0M9z2VU4nXaVGGr9id+QdTgQ8rbGTJ6W0vs/IhQaqTMmiJwYv1a8RSnOySIYTDmyKNz4
	FYmjacAnsCSbRwLcElnq2XdJxY4GIG4k+jdfW6sPC5258zbFiNmROb7TRWcscsu8PDfOxjylGjT
	usiC96jnigSizHujIpOQmGFSS05fGNYccU/P0kF7Ik2OLm14MsuKV3yuomYwLQ22vJDqG+pQ7Oy
	NgSLw1j/wyyKL4I0ZBK256VPtzjtRRW6dkP2LyMdFACGOQoKe6OwwHo9RxYUsMOKB7IDS2VLDkX
	2TsmxbikRyrbspdyWztaWBfP2xGWvzwut8nK+X48A0v60fFBtg==
X-Received: by 2002:a05:6512:239f:b0:5c1:5e33:6994 with SMTP id 2adb3069b0e04-5c1bc7ad610mr8583121e87.12.1795874044617;
        Sat, 28 Nov 2026 05:54:04 -0800 (PST)
Received: from hekasnap.home.hekalab.eu ([2a00:fd01:82a4:d100:34c4:da37:4e1c:e424])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8bbdsm6725546e87.28.2026.11.28.05.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 05:54:04 -0800 (PST)
Date: Sat, 28 Nov 2026 14:54:03 +0100
From: Troels Vognbjerg <hekatombe@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	usb4-upstream@oss.qualcomm.com
Subject: Re: [PATCH RFC DNM 13/15] thunderbolt: Introduce Qualcomm USB4
 router driver
Message-ID: <awn29nfzVzPi-HDM@hekasnap.home.hekalab.eu>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
 <20261124-topic-next-20261116-fsm-mvp-v1-13-a9b45c69cd38@oss.qualcomm.com>
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
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-13-a9b45c69cd38@oss.qualcomm.com>

On Tue, Nov 24, 2026 at 21:01:42 +0100, Konrad Dybcio wrote:
[..]
> +static int qcom_usb4_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> +{
> +	struct qcom_usb4 *qcusb4 = typec_mux_get_drvdata(mux);
> +	struct qcusb4_link_req req = { .usb4 = true };
> +	struct typec_thunderbolt_data *tbt_data;
> +	struct enter_usb_data *usb4_data;
> +
> +	guard(mutex)(&qcusb4->typec_lock);
> +
> +	if (state->alt && state->alt->svid == USB_TYPEC_TBT_SID) {
> +		req.phy_submode = PHY_SUBMODE_TBT3;
> +
> +		tbt_data = state->data;
> +
> +		req.cable_max_gen = TBT_CABLE_SPEED(tbt_data->cable_mode);
> +
> +		if (FIELD_GET(TBT_CABLE_ACTIVE_PASSIVE, tbt_data->cable_mode)) {
> +			req.active_cable = true;
> +			req.cable_legacy_tbt3 = true;
> +		}
> +	} else if (state->mode == TYPEC_MODE_USB4) {

While testing this series on an ASUS Zenbook A16 (UX3607OA), I ran
into an issue with a USB type-c display using DP Alt Mode.

TYPEC_MODE_USB4 and TYPEC_DP_STATE_C share the same integer value,
causing a DP Alt Mode request to be interpreted as a USB4 request.

Changing the above condition to

	} else if (!state->alt && state->mode == TYPEC_MODE_USB4) {

fixes the issue. The display works again with both USB-C ports.


> +	} else {
> +		/* Do nothing for e.g. DP altmode */
> +		return 0;
> +	}

Regards,
Troels
