Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774913;
	b=rpVrhKNckpr+E4kSdKPgUJsMzpQIDD4xAa0S+zWCmLwouPBlQvSaebw6rr68ZVhSTEHI
	 GHbY/kKP57rCTt0eq4s4yMxsEPjTsiOsBIGGa9uyNHR+rvATzKoHQCr2CltQJ5j5cNWF5
	 MzyzEGVcHtpFvAzhq1JJn+ZAXd8MXvMOw4+kLrwk4IUvlNLW+qZjmreuKP0TiL0X6tf0N
	 FTwv+tCK94J3G53oj4z25l9UszJayU1qxGQS1r0wT8psDAUjENubKnStSeQFMzMzPt6xj
	 u6HY+MZtiH6CQUnsZ26OhUfQdWBM6fw0t32uWmFzGJwNDJBZXKu69nV5zipb/QbkpOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
	b=UJ2DqHhawtiLCfc0vGX/cI2modLyQZ4Pvj6ygXbzCA3BR+ZfG5p4mcR9co6DHeND+ZsS
	 VfheU2TUd9H7rAsg1ZlKiy53EKfXzNaYSz0dezogDLI0ylaVkCcef3HgdufZSRhUycfsa
	 /4JCHLPnX8UorYEE8zyjQDXH6AJloQ1yxN05oIjTTxPQe6XBSUcb3xIKvZUti/XqUMK5r
	 Q6GP2dodgFdGxnG/1V+2htjdtS/VpouZNMxybxPNZKdjo/dsEPeesGdZg7rDUHrGOK/Mv
	 PVBeR9GQu/byuFTuyBkJhpavs7rIHPiFADQbzLOyLcxVvc1ekycZ509Ms9IgQdZIQ/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBK7im3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B48606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 20:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B48606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBK7im3
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67da3d03263so724391d50.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 12:35:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794774912; cv=none;
        d=google.com; s=arc-20260327;
        b=kDlatZEH/M35Jx4egGEH0hdYG+RVKZj51sfnbG6YFxp2DsGcFOwfBxUWtvaF2a/gFl
         W3ZmB7Yo7anCX05ie6e6QOFmxsw3bvLOUeaf4tiIO1SFtKAIEZ3fPvw+m4Vo2e+BRxch
         CF+t6GHtUnwRTmsPNVfmZrZH1Kfd0PE4j6VUQdcUWcDUcHFX+Hbte5gtN6RX1xXEJcdT
         5zzUvQbcpYXVfx/dAPulwPQ0QSKakiKYvqXYG+1Km75XvM7CahiDVhH9Ai85f3bIbE0L
         HW3rSQPeWHNx6Rycis1utfhuOm8C7GISW/ph2nduvnxE6WjsMUi1G/7uvoBMWO5H0phC
         cvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        fh=WQ6nv4uLA+NIt4aEteDNoOjPtbLqkRR25iRQbWC3ZFU=;
        b=d9p7d/Yp3aj42wK7wdAzRSTTaAOkj2BgOFt7bs6AFD9sf+Lee8lq3ptTftpb0TiYLh
         BI93irHjYh5T+zyzxsinLF7vJO3+/KciITroYOSFprJOIlX5WzkCZjV1UoL40PNiX/BK
         jGvGv1rXWToXyoqpEFMmMri3M7hR/A5E9TLwfIHrXYsO2UUY3liHDsqZi1jX75+L8lKX
         Q5TS/b+oxUudwNAvgrrWkYWoP7Uusz+tMDQkSgNZa0Zxf9O5Uh1vJGiKzqNdAkXzdeyk
         mg/092XPmzM/LJTqWI0ZjL2/3cuBkwclv0rYYu9Ek5IA3DhjTS1iLnCc7dZ9qxfwAO1s
         pbBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794774912; x=1795379712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        b=TzBK7im3+A4TiHE8I1qr19R9+l0rNSyHA0FD1ldcuLLKw1GjH6aCJNIaK1H04kn3Kt
         tq5BWmYEFXeGwK6Fw/3kFe9rGnRajOyFIVndChGVmR1Aw2BDigzZbBodCm5A6Cc9bStB
         W4UbsLi0e0KPaOH3/AkiJO+gXsar0r5vtdsMi3Qy/czfHW0hhWap/KazaPCqm5oDF9Fm
         II/ddsLBDRW1iVoWxcLCNHuYP8V9XU6Xqtk7aCd/drSvKhv1VS7TxCvq8iWt56MZeDlH
         EDlSJ5KYossvwEWcFTNeNxEeCBnlYEqok51o3nrg83hAKJp6+arb9VvCD7nM0gaePGSV
         Oqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794774912; x=1795379712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        b=Ijo/viGZzvAWYDdxjEPd2d0PXZBbFtTQ2HP6ngX/Fig8IldePYsieVpfqAaPtAE7Yc
         e0/o2ACf/60YUJ4deMgTDTBIRLQlIYLfd3lsi2sMzDevYbDvM/4iL5E08tcwoS9uNM5d
         Tr+CWWyQVzYjqgRMH2hYvtWKXprUrXfcDKR6t3axSQRei8I7zgxlu+uB2fkC6TyU5wEI
         RUlKa5n6LfVOxCEWlfsmofQVMLOr7hxDN0hOCbXk3ZgrZ6yY0bkClEl9f94kqCeBxLp1
         kh2K4isdLyI4578lu1oVkd4LvkU3XaepBgydpSfh6Y+I8J8LZMtCsiCMJYK4pO/xtomg
         mBWA==
X-Forwarded-Encrypted: i=1; AL+hErHPsKwPt2ESdx3ecYWS05Nzk5JzOfzOhje2ex8ebpYR6sZBmb4/YBad0ZLopbbZ5Mz0wXXwL1equM5c@vger.kernel.org
X-Gm-Message-State: APuU4Z9878WAsL0+Mh/7/tNVIpZmJsrVBlVKWGO0k3+l7vlP42yX6h7W
	hrwY8HPOfC+3325rXflDWikn8hgJajHrMFuMBdftVceNbCVz3bxNHaWh4Wd24qgOoFl57lAzhG5
	5bkbg00uBB5SZt/pjEesZtYlV5j1lODU=
X-Gm-Gg: AYBFou3zpUpWd5ea/tVyFaL9+EXULd7bVcdKmJHVhQx1WrzQi0MvxD06Mqy8QJ+Ulc5
	PtL0IrtQDq0Tpr6GxrkwWnWyBOKul6QexJyMlZLoRsOoAFUfA+GNO1t/znJPFRsnLefQcc5AHCS
	8XAtVHsI/K4zowd9+TBd95J0E4XxlrGDroM2M4jW5cET2fhr4kQNTkqb5sEgJpRCvKG1zkc9Gs/
	fl4vEmnETCYN/724suEBbvKwZMGFQkxKUqT3C9uKf88p9qJqM/BdPpVji1i9weymchdk4dabGxp
	Mej2LB720z7iM86Gpx3w9urrQADLeKnfhypFIrlBZEzn4BhQ1CRoXuDtRZgy9b09zI4jWDfIC/b
	KcopQKzLlAVmDrw9UmMPOndyUOCpE2MfHdhibFfWkIlvj0ShFghYzlNRpruY8Pp4YsIZmBw==
X-Received: by 2002:a05:690e:12cb:b0:67d:b94b:6021 with SMTP id
 956f58d0204a3-67db94b66dcmr213466d50.143.1794774911740; Sun, 15 Nov 2026
 12:35:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 21:35:01 +0100
X-Gm-Features: AclHuK-bZ0RnQfOiBUZa9VF3gQt02asaFssBFzc6vFvqnEmYWhTqvHFuHS-Culc
Message-ID: <CAFBinCDfE9J7fFnvJ2YqeFx1ZijY+5aFjGcpcBLMDrnpU8OipA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, krzk+dt@kernel.org
Cc: gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:46=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The S4 USB glue is the G12A one, but it fronts an xHCI host controller
> instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY. Add an S4
> compatible with the G12A one as fallback, and allow a generic xHCI
> child node.
Krzysztof, I have have a question regarding the last sentence:

[...]
>      oneOf:
>        - $ref: dwc2.yaml#
>        - $ref: snps,dwc3.yaml#
> +      - $ref: generic-xhci.yaml#
Does this mean we need to the allowed child-nodes to the compatible
string (so only S4 allows generic-xhci and G12A only allows dwc2/dwc3
but not generic-xhci)?
