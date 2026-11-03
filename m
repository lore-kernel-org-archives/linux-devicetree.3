Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723789;
	b=FNoraBczwL3hRoQmZS78Gp+SKst6e0CwKYNDunfK0N8GhxgLlM0EP70It6KuQ+XiDZT4
	 FsjPPheVP56mOqfBPfZUAa7SSecqYZYpKfOI6l1Tw+wmbZffTW6WtYi5s0t4EakHEkhVU
	 BHKnEAocj8DY3+01BHKZQXRHR+U1i4ELWWrWlTqNGWYs487koxAiQvtMGBzxdfZFm45LP
	 HVCs7PvNSKA886s6NskGFSVdHV80zMdNyiCcti4j/hwon+rs5cO3bnX1yNgT/9Syjf3wW
	 g8yPFdvSJb9eU28GiV6zyARqVvtJChZ51EqByxS4q7fRAM+PMWJ+XNrlCfpg0fCjT8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723789;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YNY6h4Csi0xCblDGgiFLCrE5yAWsa766ysMezcggLVQ=;
	b=EBmebZBZaUl4SCwXZWrF/+V1dGh/4qjPP5OLIT+M3z2BLYvSTQ9LXZ/keLnKHb1LCrB2
	 HhoP2X/u7R2HS97jJOArtRnIsUp+D3qjk8UR4SiG+kr0jI3J0HDpARFwlx3q2QHG2ukxw
	 FG6q9aNMtv8Ix+IR4TT2nKIE/VBkB3oMkzlK+nH2mX6tJ0zB4M0pYymHR/YJmXFe2NocU
	 knN/imhDf4+MRPxfyY1RwB2JqwZk7QrCVRlZS6oUe7x0jatiDXHySx8d8emfjNWCXGTBL
	 ZYnUVBTFVjn/BKGUJwiTxknxKPBPuU7BKJr6N2eEKoHTp3YgSpiTzo1RWs7bi93qZ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA90606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DA90606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so3053596b3a.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723788; x=1794328588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNY6h4Csi0xCblDGgiFLCrE5yAWsa766ysMezcggLVQ=;
        b=M2w+Rf20QqpIl6rItKO2w76aK4Qsz5qmJ8kjEe5lHZx0+WWqsAu1EImHY5x+gigjRm
         PzxWtxmZpfFPkdq71jLG+4G797XYpfgzW1ZnHKT/Af2HcjtWQ2l3619Rgkmn8qd74FyQ
         TWihhunnqQHurepobTtyr/rTMsfBLMlMoh4GcsK90EUZZnG/fVPeOgptQwA0tcXKJNf7
         M9K8HSSm3W1nrLPDlM41UJPbxopyD8B1qnWQrQMzmlIydNdY/yyc5PCDc32k5IqxOx0W
         qDrGbeqWm70u8pGpL8oiVeI/M/PzeyexS11ymuHMJ5XXaAXluAbjhl/mAfQIfLPOCOzR
         Kf/g==
X-Forwarded-Encrypted: i=1; AKwUvByxU7KiQuxgaWM4Km2MDjUMIEsi5kdHASExa/NFxY9uZA7qberzoKmh3JjNCmwiEQ73+Js91gYudmcz@vger.kernel.org
X-Gm-Message-State: APuU4Z91r8qj5AbwwXlRt+oPulYvOTB/hsn+wdA1wshZXlUyLCz16NVF
	DEzPIGWhxPXiG+ptc45Qc8SvF7JRELSo0vO5EFYoGB9gKTSD66fzVGSFcdxCbLA7hTZqrw==
X-Gm-Gg: AYBFou23Cqz6zzBBSHZcdbjyLa2Yd2AD+/IyrFp2qIAXAVogxUpGWPsEGvLzVfmpWcE
	n7Zj58JmB/nvleE9THsU6ETixC+2WuFWfRNT/VlcTHWUTWkOkLMjHi5RVR15kLKfc64Mxfmpf0v
	DTfkMkEw/uR9VzVraMlBjdLz+6I2/6gkdcL7efWLpcPiHVgM9MiZ2NbVLOR7xVedAJnBfNAN4rP
	rho30TEVf3+Kiy21N0gakO1jKEUto3NLldW50+Vrkqxee58jVlV4+1VaLfcUayp+da2FcvyuJnY
	9fpXAehSj38wfHXcDNRmYyg0pSnq03MIXR3hNzRPypes/9bKfHfVcA9bUSAsuVsZFSoOYHFiU6p
	O02nS7467qVRmVVLpMGbI6geh5tWz0XGEpvBc4cKkn+3fLUl38gXREd3R7Zkq4Y+rvhQhiNlZrJ
	pjoCltINSv24G3hz6eqWpr5eSZX/RuGX30tOEby8R4Sq2Kwvwll18uDFrmuDDbQum545/adBlIy
	VG/QM93/Tah0nTn4jMBzcuSfFwKiQ+qQOtDV8L+mqMN/JNqghNhYgb4IV8okFhKfLZoGJCteySo
	gEci+GxQLG/gsXPo/QryZ08ZoDDUOfaDkKZQcPrXjSsgKp/IojBXxpE4e0R80nDxFqukaizAwsS
	YRo1gCDE4MAzoUTgxxlbz0eLKO1SpTdalOXBaryaVHW8/HqdiwX6q2ds=
X-Received: by 2002:a05:6a00:1daa:b0:89e:df2e:cebb with SMTP id d2e1a72fcca58-8a9bdfb2e1bmr12872228b3a.59.1793723787787;
        Tue, 03 Nov 2026 08:36:27 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadaf82a66sm3472030b3a.56.2026.11.03.08.36.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:36:27 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so7418872eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:36:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByF4JghPcUKF7hT/+99zaQ2fxw8IBVTLmEf3mFuwdq528+2wyK5ZnDOt26p2jHJ/Sd04tmFQLmQ6oAX@vger.kernel.org
X-Received: by 2002:a05:690e:1c07:b0:676:8974:9795 with SMTP id
 956f58d0204a3-67ba50e5d1emr10529834d50.92.1793723366247; Tue, 03 Nov 2026
 08:29:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-3-tanure@linux.com>
 <f8da1842-bdc0-4bf7-8f15-46b57a9eedc9@lunn.ch>
In-Reply-To: <f8da1842-bdc0-4bf7-8f15-46b57a9eedc9@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:29:14 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3hxekJn1FiDJjYqDoCFyczxzvCuQJwWQ1DbH_WXjihOQ@mail.gmail.com>
X-Gm-Features: AclHuK9_PvSlgVJNQpbckdVoDA5-AvRndijSeKC1Bujpf2P-dAJH6DOiVyEau-s
Message-ID: <CAJX_Q+3hxekJn1FiDJjYqDoCFyczxzvCuQJwWQ1DbH_WXjihOQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:27=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.y=
aml.
> > +        # The RX delay line of this glue is fine tuning in 200ps steps=
,
> > +        # added on top of what phy-mode describes. The TX side has no =
fine
> > +        # tuning: its only step is a quarter of the clock period, the =
full
> > +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> > +        tx-internal-delay-ps: false
> > +
> > +        rx-internal-delay-ps:
> > +          enum: [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 200=
0,
> > +                 2200, 2400, 2600, 2800, 3000]
>
> This is good, thanks.
>
> > +
> > +        amlogic,tx-delay-ns: false
> > +        amlogic,rx-delay-ns: false
>
> Maybe add a comment that these are deprecated in new SoCs favour of
> the standard {rx|tx}-internal-delay-ps properties.
Done in v5.

>
>     Andrew
>
