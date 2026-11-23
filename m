Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795428763;
	b=b1HsWO0SP5q6fAdSce1OXvnbIo4x2aCRhrRNRBcB23bNMxpyKtrM5OfuHPKa+V2hdpQJ
	 r0JWhBd6ABx6cRyqOeWmkvM+NwoXSCflkN1mrbplTkksFvt09PR1Fy2ecLTGmLzakpkEA
	 3UBXSeaJ9Q9PFcY/aDnW/m2ogUvgxYODRKvwjsj6bxYF3vd7XfE4kuWpSXhG3JlMMHVvH
	 20EGJG5wyh+/S2HvipOk8+OHtP1ImBSU7CHwg++HPfFgOMThPI6W4yh2dhQQ6LkEkVE+H
	 gzVkZu7I6rPpGhX1ruV7jGsbHfungxLYgV9PWCJC5N3bavi/ps/fA0jHw83eqeGh/Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
	b=LBHuJLdRRRJZszhInkBtWoBkXhAwJ7tI3E8dR/chsjXyjPqlZwKNvR8jWqvGp08425CX
	 HStVo7Y+HMM6VwMc51mMVRVoFdqKygfInkmQFLvTdDS/ji/Yct+D5+pkznKglr/J3v16y
	 6zkKTfvsr5xlPhE7z0tP/gEjwzrWU19ksziDMiM8xqMiEyhMYkBe0J37Ic0dh0vuFcO8L
	 2EQ0hFMXEXhJ7LiGieNeW54nHpKkVFB1e1iezwukFJXIlULq2GelW1Sjxjz8ShtyJyEKl
	 NwaBVlvCYoObeqkdBr9b5jMJXGl2TzFtiLOkowv3tj249T4/a+MKe3cbtGpt15MQeSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=MqfY2WR5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62C7606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B62C7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=MqfY2WR5
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4395d31228so490817266b.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795428761; cv=none;
        d=google.com; s=arc-20260327;
        b=U83U391rUej+d6bS4DHmk2QUo9fLhWws3kd70sIlfI37CDrWYJcu0pTbzTiJJdVX7k
         HOpXsPZQZmbt98n8N6KPLrh018AY6iqatxySjbZwmoEI4dbnz82yupYi324OE+qRzXfM
         Q+VLpbuVPIA+HSuUGBHXC9NkVgFXWaqG6Z8Ed7SvoyML7lOJYys85GTb/IIJN/f+KXnY
         8VKk3vqqaB+mHzVSdddvqyTWG6jndBzb14lZhanJjRPQfpSrdDX8vqAgESCE1XjNnh9k
         fwRnah59N2kBlQj8Wigk6vSO+Dd3TAtKCQyGrxU3M0ABzSwOtf6B4qKcBUUBeWeckZ5V
         hqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
        fh=Ryg7zQGx2CgHzbY/33an1qkyPrJZeIliChLnuqEOSRQ=;
        b=satqPTWR/FxMB/SeuEuyOLmoFaEPDY+C3PHwjf3RSjrTizob2tzgqsTTS0kshpxBEK
         SJOc5dPOCxu+TIW1gGIS9+XAxQbXd+5sgICtrLCVQ+Jdm/NW/bcfhgwJZkRsX1caN1Jr
         Jf97zvwEVaTOGi14rlCKc67XNtuOA/gsznaZ05BjjQnATko6Gwa5B/J2czSUheWpe6SW
         Ceu27MRHCX+iMJYr0VSlgGFASGyaG9i5v2p0/ZsETGFae87n9lpJbGOLyj8ckXIoZfRg
         09TsaAnClwoPUPTg+r6RukxIoIqZvRYxpYBP8ZlKVMHKy5J6Fo0IxOm7U3nMiVLFUe1+
         kKtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795428761; x=1796033561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
        b=MqfY2WR5A+tGruAVHjRKrDw5GIaiKkjvwm6WEch6FTIYRq8BLizWLXn5zpDnFwRRwA
         kwN6xPmj02C+f4K6Pesc/ipxTUWAJ/jX7Z2eV2g3S3/G9Ri2i5mYzwiFBYWE4mKlYNib
         JaEKi9jzGkUyZfJGjcv+VdtMrCTPstBpK7aXngyyd0uzeK44uGws21jQUKMvEPyX72E9
         nu0okVVQrxrFvL6Nj9PKzFOum9ntDS1PavLl2r5c/4y05NfY1cHnTTw1MJUAQvpESx1Q
         qXotT3VmYjML0hmwFGL+p+w5OsqphEiy5AfG0/ACGnd6E2yJhxynpmSns7W94umSVVpc
         w4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428761; x=1796033561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6PZb3pWfu3DBOMyeBvBYRTT0i6m3apihG5iiqFet2Q=;
        b=mIbd8ZQlC049slpCs9pQy5X1vyMdtpXX75MOe+e5wuaVtyTffItDDNZFLJZpR6jqtL
         60OJGVhVsEr7+C7fwQlUOAA1RO2vv9EIBS5MUGpZbEEhCB+T2U0kYDyMfDabd3Xeokbq
         ttS98ETpauxlqV2XQuSNBXmLI/cLWWY++89G0zRVvX/hFWqSIFrmLVb+ZTsEOd3+bBtB
         dn0ArT8jzN8kj80/cQJoH8AzpGQfw/AwVkHWOuP44M8x/Sc6FO2vLjU1mzJ+SCBb9VtH
         vOQK9x6EOiYDM+265b8ysMt/AZKglln4+hYc/tEBGVpu1YXX+YSAuAYKPx1AhU+NcCMc
         0AKQ==
X-Forwarded-Encrypted: i=1; AL+hErHDH+I6O8pRhSGdQA889ChFrkIAtPl4E2eiYh9EcMsv4usSn0L3EoO1V2DyDhdQAPfT1AeqTLdJvTb6@vger.kernel.org
X-Gm-Message-State: APuU4Z9pFouGEByS7ABV/Wa5XGci7HCDHMxkkVX8eP8Us5ZrBD/M2iXL
	Af5Orx2+FeZ8Z7y9GdM845JpX6xC2MBazCZbVlfHrd0H0quouBz1PeiYeEcbDSVjU2F18dEvkz6
	4J/661HFuqux9C7/0AuHtAIxpMT+5QhCiFYgt8wu8yA==
X-Gm-Gg: AZFdTZdmPdT0BNIHZ/941NC1mG7AQL1LBX0bx4GPmtyIMqx+eCuhlyzJSOtfZid8GPJ
	DvOWSpzQTpHr64DsXHNC7HJkqXVSPv63mgx6OIsiXxpMRXtMM4OGj51RbvgDp9ax0oxRnf5MTTh
	SYpc5K4Nz5+sB6cft9Eng6f0F+Lk4B29K51xZ4mYWfGCMoXnPNu2WuptgfKViMpOiskHWgASt6Y
	CMFEFiFa+sGiBR8iPaeD+oA8z07EHUpjzE+rTJVp1yrkUs+bPCyrUowC7jsocwCUzS5lXoof4gb
	yEpLWR0RaVq74iNnJwgw/dtms6rPNBcbZIM9qQa1yehGf5JQvY59p2XVxv63N84D4q4nsDBOSk0
	XDrR7noi0DZVkk6j1TvDZVvqPoUBkpcx3LToD9IKevfjsTKUk7jSzKwzS1cbgVsOuEfDY+Z5iWf
	Pk1SMaaX8+ca40Q/Q=
X-Received: by 2002:a17:906:115a:b0:c3e:ee86:d2c with SMTP id
 a640c23a62f3a-c513a866684mr820899566b.27.1795428760997; Mon, 23 Nov 2026
 02:12:40 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com> <20261122-pcie6_fix-v2-2-2e0fe615d90b@oss.qualcomm.com>
In-Reply-To: <20261122-pcie6_fix-v2-2-2e0fe615d90b@oss.qualcomm.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 14:12:30 +0400
X-Gm-Features: Aa3M54q-Xar7VXEu12WPkFbFHzHu90UHCgQbyjxEoWpDnyAZhVgjhAvqOSDzA9E
Message-ID: <CAKTNdwEuu75UHA2_r9FLmximPjXVHp05Aztk201AjnFGcGSXRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] power: sequencing: pcie-m2: Add support for PCIe
 M.2 Key B connectors
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krishna,

On Sun, Nov 22, 2026 at 10:46=E2=80=AFAM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> Add support for handling the power sequence of the PCIe M.2 Key B
> connectors. These connectors are used to attach WWAN Adapters to the
> host machine over interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB
> 2.0.
>
> Currently, this driver only supports driving the 3.3V/VBAT power
> supply along with the FULL_CARD_POWER_OFF#, RESET#, and W_DISABLE1#
> GPIOs as a single "pcie" target, since Key B Adapters expose only a
> discoverable PCIe/USB interface and no non-discoverable bus (unlike
> Key E's UART-attached Bluetooth device), so no serdev creation is
> needed. The other signals described in the binding are not supported
> yet.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 70 +++++++++++++++++++++++++=
++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/se=
quencing/pwrseq-pcie-m2.c
> index 56c5d51293c1..8af4a059b596 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -39,6 +39,8 @@ struct pwrseq_pcie_m2_ctx {
>         struct notifier_block nb;
>         struct gpio_desc *w_disable1_gpio;
>         struct gpio_desc *w_disable2_gpio;
> +       struct gpio_desc *full_card_power_off_gpio;
> +       struct gpio_desc *reset_gpio;
>         struct device *dev;
>         struct list_head pci_devices;
>         struct mutex list_lock;
> @@ -135,6 +137,45 @@ static const struct pwrseq_unit_data pwrseq_pcie_m2_=
e_pcie_unit_data =3D {
>         .disable =3D pwrseq_pci_m2_e_pcie_disable,
>  };
>
> +static int pwrseq_pci_m2_b_pcie_enable(struct pwrseq_device *pwrseq)
> +{
> +       struct pwrseq_pcie_m2_ctx *ctx =3D pwrseq_device_get_drvdata(pwrs=
eq);
> +       int ret;
> +
> +       ret =3D gpiod_set_value_cansleep(ctx->full_card_power_off_gpio, 0=
);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +       if (ret)
> +               return ret;
> +
> +       return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);

Can this signal be exposed as an rfkill device instead? Otherwise the
pwrseq driver hogs it enabled with no way for userspace to control the
radio power, and WWAN power draw is quite non-negligible for portable
devices. Ditto for w_disable2_gpio (GNSS).

I'm also wondering if the WWAN-related signals should be skipped
altogether for non-WWAN module configs?

Best regards,
Alexey
