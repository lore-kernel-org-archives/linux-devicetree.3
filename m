Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E667936A03B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919444; cv=pass; b=sRn+Aq1usIpNUvya8Qj1KBnoqpGgARbBaNlxPubZCmISrsRjRWFkplMApj0pU65c0EHe1jvotiAdnKAoOfooP0+Yc1zxvBk1X7HFEOncsdS5kqFgqL9qDhdAKQS6it8I2/C8S9gQIoXDeF83PoZOewmj+/yMAYx92gvrgcbAWSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919444; c=relaxed/simple;
	bh=fE6xsCIR/eKT/bChDxYtjPABUURv/bY7qgn7TlNBOzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ+CDaKZ7H44yrfM06bT3zjq2Y4WOriRSrJMkLPJduC6Y1sQ217+EZM8B1Gfsmj8slLc0X7ftYPUa9Oj80NoKP8OMMSfIT02anInIQYPHWcAn134rkiwareLSBtE5dug/G3xvhch/ibdoPa+UDLVJqsu2p6A3SIo0JByyxeI0A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEePjwkF; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEePjwkF"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa6c66e6c5so2526753e87.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780919441; cv=none;
        d=google.com; s=arc-20240605;
        b=KUnBh5anvxhM/0AH7raghhnvvoOtZD3yiJM5xZQRIs3/oRY4niGJnsgevuFLHr8eP3
         NxxNsuQ+QnJZvhHvXF2Yyvpca6YBDSzuglsKHQjJvGy4TFnw1Yf3zXNjK0HTb2+oZegR
         jymQ/DGgs4viSFreGlEwdTnamsxfDUUQDG4cl4PdPZNQEQX3DGjE90ssI2GovF3HX0bO
         Rn8urlaP08S11x9yJCyll/LdGXDRZ7JIgGoy9JkrjDJHJK/EzbrJKiXC4uj9exBPOt/o
         LCoQJLR2Ubmbb/LQj8ZnlI9HW2OkqbPPRyKzjmAnrZLuCQ1YTYKye56R4wWUYlvpj4xg
         7rrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CSww2uqXCMxSPrJjJ5xgdwSthvGPZPtrHQN2YqMCSVY=;
        fh=k6Lk9lGefQqLZWHgOWfaQyAvAP0HYh/EoordXzqm15o=;
        b=hc9Tbhcaggm1uETz/B//xTfLlaUZuVf4EmcEIjoq5IGC0xyToJzkj+cDWZONRoBRHg
         mSx76G3Hur/XkOLPulOMOxusTkmp5YWduwiIO2Xu4Ur3xOUW8nyXF9+Cd6dQjRuAdMzz
         I2oIfmaStBrx5nk/ztOo2VgB2Ys0bVWf9iajUaKqAkyhrxjlYo9S2XBqQKNYfGpB0Jw+
         Qmn+qr9xoK1iDDOA0umxOftXVBwui2bDSDDt4kCVyr569Wlu6SOGvBOtw8g+WeRD7fE5
         bq8tV66AtN4zorXhEVFEYFWzWF7SgLU5wHIJ0kM5vVt758094+gMOS3Q9LoLg5KDDanr
         LmgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780919441; x=1781524241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSww2uqXCMxSPrJjJ5xgdwSthvGPZPtrHQN2YqMCSVY=;
        b=dEePjwkFsRZfjFXqmPxuyAukXvqzRbkKpoSyTYZMGz0cxU9Q7OHFeXuY6afriqOZMX
         DaIyq9vNUHFH5ZexxBAatVyCYgT7v+Pg5htR9SzeilIW9TMrnn42ethVNOuYAxEjkmhT
         t87HC/C7vf1fk29OW7GLco56GQTTLmXUTfvwU5pkVcfDdrizYMi6C+nElF736B9m0puV
         W4qNzj62XmhV9L3Mj6dRcJ/JoTi0/sbd/wZ8yKKnKJ9jOmaGa/pAIjXRJ9aHuY8eRKdg
         bDlYVbVbk+tlD2jVDmxPB07V2h7pWgVecF89S70s66JmuNkA9XcP1DpW/MC9HxjVZc6a
         wFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919441; x=1781524241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CSww2uqXCMxSPrJjJ5xgdwSthvGPZPtrHQN2YqMCSVY=;
        b=br3HPiIXxuh0EIV8eYGctHiOva+0m9CzQ9guwJ0M6i7cveWksPU5ec6Tqp0KaFtDDj
         uAmyTcbmsVUYrAHLhdN6Z0NRTzahAc1q3qzo2+LzNYrR9gcGQNQJBIAQTjMuGWpdtpQD
         PFK6mxsQGWJJjtqZS3g32Xgc2ovogwYfq6Du7urPWQyxt/YaCahI2aj++AjYxWgBav9W
         fvU2ekBDFVWameF3bzSGJp+dXB/xzMWxFoUe+nUPk+xUJbbnS6DmgG0mBH/i/dAwXl8z
         HPJw3/BYRLfr8HQgoikZ0T/uOMBU4SUytjzZ98jD+EZDFZEgfrqtuqG8nVuz9hHa0MvN
         VfNw==
X-Forwarded-Encrypted: i=1; AFNElJ90sLEqIO6bjDtCFEeQDt8LhruDWW598EXjgLDobRGGD8VeD2ntqKJCrmQHf4q+r5X8CAlwuYqRxsPf@vger.kernel.org
X-Gm-Message-State: AOJu0YzLR9g46Z73ufTcFJtpkvfzbcDbHjMJT6R9/nCLbMYqWsirrmyg
	6Bqzmkcw/HVsabwUL7p+JQ2379OC/s3etifQ4oaxe44Ib4Efyy3I7KyJ68yxu/yyYFBcakZn8rh
	dXxqfWkqidSiUM+reoTl6zuxbiwwOGfM=
X-Gm-Gg: Acq92OHMhHYNoYxjKi0BnGM+uRkFl4f13qibq/OpW8LK+dPMlA6s42Iameo8Sv7lv7O
	kk45erxgZmDsnBl7a5gWVc1kyqR3s4uiRMBq73pivMvWV8NBFypl1695+kSQ7GuqhTr7YfxpKcV
	9lqmU3kxBiVE/OFWWPhJ/3L947CBtKMl29dwFF0SA91vYFVpwvmBKWssU74o/5In8U0KVb6VH/e
	FOu1+t8H2ET0YymIH31L1CfgIpAL1n71gMBOngg2iXiyQQ2zoAmp1C6jBA/kAvX4yfVUyHnOBvH
	KFLsGWdgq2MzdbYR9gNOUNZBag+JlQjVPyYVVPA5pPrQE/3YhLgCH+qDn1OF7yJ+PcBHEVA3Zex
	i9ItC
X-Received: by 2002:a05:6512:3f07:b0:5aa:8823:e30d with SMTP id
 2adb3069b0e04-5aa8823e38cmr3920328e87.47.1780919440875; Mon, 08 Jun 2026
 04:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780912893.git.stefano.r@variscite.com> <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
In-Reply-To: <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 8 Jun 2026 08:50:27 -0300
X-Gm-Features: AVVi8CcopUIUnSsBVn_oDWGn46ZYi_6hmaOIDxy2o6en86FExNrPt-umbKSjcr8
Message-ID: <CAOMZO5Azt+FX4z=CXHmwQTNqruKp7y0Ki2EtmDyavkuqT767QA@mail.gmail.com>
Subject: Re: [PATCH v4 13/14] arm64: dts: imx8mp-var-som-symphony: add second
 Ethernet port
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 7:09=E2=80=AFAM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       reg_fec_phy: regulator-fec-phy {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "fec-phy";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +               regulator-enable-ramp-delay =3D <20000>;
> +               gpio =3D <&pca9534 7 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

There is no need to mark it as regulator-always-on, as reg_fec_phy has
a consumer.

Please check globally.
