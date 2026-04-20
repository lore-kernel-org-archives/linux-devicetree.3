Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9606034A3AB
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776683669; cv=none; b=gJnLvvdSczgEyI62kdT2md4c4QdF5LpaiHF4IlxU2K9wMI4e/XrTuCMgCC20W6d6EULemRA9vtfBZIIJ0hbG2y0U2SYBE0zqgl/reMRazFUoqFvpOe23NmlQp8q4qPj/jKqbokBsGCpxMsqnB0biucQ0i7Hg9tyQcg4YzjN0bIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776683669; c=relaxed/simple;
	bh=oo6sD9eeKJmgF8y+Mv9/ziuyg8LqE/RcnPFXODHSQBc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BZpySO/qF3ClOrov74OUWKqdyvpJCeVl6NitR6Gq8M1M3caXewKTNwVUR/RUXnm6jw1ZSb5H+3pvC+JBcaTgQYleIYDumccXMgLNZZ7GDbb18AN79Lb+tqG8aozuMfQEP0E3xZMMHOtV2oKhwSda5P4afVmpo980SJt85aFerJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IBn20ZWW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IBn20ZWW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so7781165e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776683664; x=1777288464; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dympeeiEyneZdFEwmKLL4dnrMWqI+ctP12odqcxsjA4=;
        b=IBn20ZWWmHujVbwaKsnlG6/fA6O6Z2q5Etxdiy0Rpua1Flfio5iuvHphA6Htwq45Ru
         s3mMLDbJzJitCNYGwhR3cCaaAbvB/WQVHdTXYCLx9Ml+1bXMjxqtxGNQ5GUGgh2cPEOt
         xWbSHmOvSqUrozSX3EIfXn1/Kjql5WN+xOBy+pyku4K/+NQjwg1Q+P5EfcFZYHDnpRgP
         093Q9FGcg5Ieo1vfOMYe13KsQZ+l+748XCsqGjAh7oX71k0klpCXcJNDTRHAcj6xVpKo
         JSTzSSLYe5WGW3+LEp0U6l0aG7rirexfpwixmMKCzWA4FtFNnMJOFXXYXH4foGTAh1DV
         JKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776683664; x=1777288464;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dympeeiEyneZdFEwmKLL4dnrMWqI+ctP12odqcxsjA4=;
        b=r3Nd1VBlSGFZ682KlB2kfe3AgDWQ0EwckW0SvbQR4mqO7uWYFr+ZcdNBMCteEBMQKX
         cIIrRbFKZDUiazZZZikqUFg2JyRW7+8VzytAX8xdpNksOztxIC41JQ3UVM0ZxVfJZyDo
         YDogeUfKJiO0Ob7uoLoJgkhn+eU2HCllMHKRwlUF8FWz/xz0iqAq5bYN1I8W7SCne4y1
         2SWzjgghwdElZtVJc07CR7hBXD/W1HaEsttVPdnT4zOlaS1boGZPgKnsSPmTmcw1puWe
         hHZIrznPh8H1Zcn6vLQm6BsF42wqkc/mPTF+zjLcnp/HjNHMZa+b94UvqE2+2D1Dg+Ds
         EYAA==
X-Forwarded-Encrypted: i=1; AFNElJ8RAoF38AQW05/OqWHt6xTS8i6xWbKWhgMCvexEVmFTUUdVaN3LVa6wRiGj7QnNQqoboZRMrMGF+a3+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+o8MvF1/vYFeQTd1E4DR++cDA62MMb2+63piVUTA4Ak4XxQ0z
	qDuFqj/DRrxZWlbXJO1C7x2aECLSUIcvHNzhz5FWRgwZtq03E/UaBqFKcnnuxR2dl1w=
X-Gm-Gg: AeBDiesvh8CWWRvJbgaD2UCY0RIKPgp/HFi9eE+ovW1CsSLy3QdZfResBfhZj9DXCYX
	bfgn9MIwMy3IuqhJj7OsP2J4eEtCCwZ6py6a+5L6WW09ZlVcgqt4LhAzR/yFnSJ6w+J5OcKrSxk
	RpTXllCRXhy6xQNMn7fUTqfoMtWHrSH3lW8dBUeKnh7PClM4h2JLxslxaIlFkmN704oUDLZ1NVP
	KXD3jTjRV9EE/wvYighnmVkhUj2IQypHpe/qSQEVlkAW4DT+RyKWNIcvxv4wkepXgJiIRLBo1HC
	QvTcOjYkxrVP26x84B7vitRY3wEhnpsTs4laIuMjhKGst7YsnbgOU6yoCiVYi7Ht8ctk4LOT94E
	thW2KyCO5XVFStTk9WVPeLLG2KV7fWz/LGvBDEHr/+oM00zzQ4n0Lc/B21u9CGMi5l4fwNKdNBx
	2vP3beC40XKTnnDDfnXNEeTo/HlQHhllfwNRKzOYWir2rjvTfInUeudZ8XmjQF3wHu1pD6NTtRI
	+MIlDgja1EwRDszVaY=
X-Received: by 2002:a05:600c:34ca:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48a07615b87mr18212465e9.8.1776683663648;
        Mon, 20 Apr 2026 04:14:23 -0700 (PDT)
Received: from localhost (84-115-213-130.cable.dynamic.surfer.at. [84.115.213.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489393ddd69sm10775525e9.10.2026.04.20.04.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 04:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 13:14:01 +0200
Message-Id: <DHXXSDE9V52E.33D6CI1LWMHFP@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "Marcel Holtmann"
 <marcel@holtmann.org>, "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
 "Jeff Johnson" <jjohnson@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Balakrishna Godavarthi" <quic_bgodavar@quicinc.com>, "Matthias Kaehlcke"
 <mka@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-bluetooth@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] wifi: ath10k: snoc: support powering on the
 device via pwrseq
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
 <DHUHU7UIT487.139L3KIVRVREU@fairphone.com>
 <hdypom3nioc6tk26gh647imy5ykhcjqvknideilnbc2b5p7eo7@hm7fsscleutf>
In-Reply-To: <hdypom3nioc6tk26gh647imy5ykhcjqvknideilnbc2b5p7eo7@hm7fsscleutf>

On Sat Apr 18, 2026 at 9:38 PM CEST, Dmitry Baryshkov wrote:
> On Thu, Apr 16, 2026 at 12:06:09PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Mon Jan 19, 2026 at 6:07 PM CET, Dmitry Baryshkov wrote:
>> > The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreadi=
ng
>> > voltages over internal rails. Implement support for using powersequenc=
er
>> > for this family of ATH10k devices in addition to using regulators.
>> >
>> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> > ---
>> >  drivers/net/wireless/ath/ath10k/snoc.c | 53 +++++++++++++++++++++++++=
+++++++--
>> >  drivers/net/wireless/ath/ath10k/snoc.h |  3 ++
>> >  2 files changed, 53 insertions(+), 3 deletions(-)
>> >
>> > +	ar_snoc->pwrseq =3D devm_pwrseq_get(&pdev->dev, "wlan");
>> > +	if (IS_ERR(ar_snoc->pwrseq)) {
>> > +		ret =3D PTR_ERR(ar_snoc->pwrseq);
>> > +		ar_snoc->pwrseq =3D NULL;
>> > +		if (ret !=3D -EPROBE_DEFER)
>> > +			goto err_free_irq;
>>=20
>> I'm fairly sure this is now broken with CONFIG_POWER_SEQUENCING=3Dn sinc=
e
>> then pwrseq_get() is returning ERR_PTR(-ENOSYS) which is not handled
>> here.
>>=20
>> I'm observing my ath10k_snoc is now failing to probe "with error -38"
>> which definitely seems to be related, but I haven't debugged it further
>> yet.
>
> Posted https://patch.msgid.link/20260418-ath10k-snoc-pwrseq-v1-1-832594ba=
3294@oss.qualcomm.com

Thanks Dmitry!
