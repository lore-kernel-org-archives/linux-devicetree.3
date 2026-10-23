Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757128;
	b=wNoyiy3jrdrFkqHegSkpJR8+DhVvtQWoyo5qOvsQevQb7L0Lp1KOiaGJShufY2OoH920
	 GeLiActn3pi1S4McCGhI09mStyk2A8RxIBVG3QRzrTstv/vXCjtjdVVSo8CLRiPgIqAuE
	 SYLCAomGvHOceQMm7p0V6Onqyzxo5iryFmXGf6NkQO9eYbR65mLi9peA6esP8RM3x+oLx
	 wGUeqUmPYd5IqLHGirQBl5fDDHBMOw5lihLRtHARSC4md7eYiLKJgGWTocOh/2PniFia8
	 6HDkUstvtKrcT458X4lPdxvlvKtko5CSnZB0aYzdn5RGrkpOfz2ogZ/yClSO2847wyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=uSco1V1HeJRIohr0HU9Igo93pBA2b9NsqhyVUoLr4Hc=;
	b=nFj9YcBw77pxh3FQCL5BY9lhFgk5Nutd4EgGICHA8ibThQddIL2ZyE6FvTzSw+DC8zos
	 mBWscwEP86zMQVGJAymXTiQyzPyxhEx81QFof+p5wPFkBVWFO2z3yLAp/vL8t8hg0X0GH
	 UhM5fwL6CFZNxmSZ8SEg72AdeuP1fHJo5cht4qLEg3Na37vHcH6zJa6ajYmcxUDXjMOw7
	 2EiOg4h/CKshCsfjMS/q6gjqzeO5o39AvAhvuCnsdmWqfY5kx3WlVoeB+b4Gc1PmJ0iMU
	 0ZGjCSAoF57bXXav+rwmUfCO/KV49aunnq8n7mVeD8BVTpfuTEWnDnmc5yoSmF6v2tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="k1/9Upg9";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEED606A320
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AEED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=k1/9Upg9
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso8706685e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792757125; x=1793361925; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSco1V1HeJRIohr0HU9Igo93pBA2b9NsqhyVUoLr4Hc=;
        b=k1/9Upg9OMvsI0X2Fuy/4v0AkHqITUFT5daTMELi4Zwjw72wGWcz0z9FO2Va9/UV/R
         +Ddwew7njKOL33BXKFygaXgek1OeO8qXu/pSMmBfhBlCWHBshfFos1M4mFvkGELkrWiY
         SaO2feErS/9QyPuqKTrswnqiKm2DBJf/Qb/QRrilYyBvI142O0hiR9w+u9xPa/bYz+ur
         ZbdorFMzHoK91jfZSgLS58P0HXQ1CFCKhpMo2DMzZyfuBsO1AmGpopssAuy+U1q6sEiw
         akhv/JdsMJY6oFQjZf9YPcpLZzZ9pSn2XjyKDTRciY+ZJv/C5b4LXaakuSh1fyb1j1vO
         ehzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757125; x=1793361925;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSco1V1HeJRIohr0HU9Igo93pBA2b9NsqhyVUoLr4Hc=;
        b=aiAzTxqvV6FCt7wAx6B/AcD9P+wTyqdclhMvdbSzRPxodYeMVAlHmRkb5UJtgX59BC
         nK1//hX0piavFpZrCIZFwDLdpabqJ0YhnGJAyv5LVsSltd07Ht1chtdodK8Irf7XZFtD
         luOJpZ8DrKwlg/SeV+fF/pICT+/qbqzqWYYE+2obJnkEhggBVvjmIjVQtV3mrpFez4QX
         9MX45ftARLWzNmkUKmmYVlTP/+2CTy2n7WFmUx3CT/Y81t9S0ouZ/ow7HLwfrUP420qZ
         4RhZjpc5Xsic6LiiLODp+LdVk8U7uFFjCZ26i7oGH22a9rnYkRFY4yPeDtb3znm71hLH
         2JZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKXwVkOO+2z2/rKnZrw/ispXFKtTe+iaa6E6rZ/RTY5Lff0A+uPyPNBQlLe4CPaBQP1V0h2AcZjanD@vger.kernel.org
X-Gm-Message-State: AFq9FYL8KmJ/vbO+ejqhYdrPzhrjv4oBg1Pr9c8oO+878EKodRA6LABi
	brDBIVLS2Wa8/yFbbK/yYRrKTimQxXZ8QJ6OqijIf+2FMD0EQVbLC9dj6S1LFKxDmS4=
X-Gm-Gg: AYBFou0sYarNd+klaBbR4MZZpJxQhqwbMg5lsWPlHWjos6PMZDSEDO95qSklNSJEp3k
	MvBBcX/dVFDzsuQb9Vr0fQWbmTY7R0l6kgni5ihKxmjix1Kc3m2P0RP1RWYhy3OAioOlPzYdEXZ
	l5vm+4/etO25ykdAWnOQTL4bCWDiGHz6krHIMb5h59GfGFcC08lTW/NDGWPwZj4Nr7dBJiTF60A
	LdVIyJxkou0hi6ubvO+TTUR28rZ/K1p52iqUBDJWbyMS1G0lvEQCLCNWnSUiTLCpjJ6XzzYKSaI
	UKgKFRPiv67d8tiYp0PfQYr84wuHyvpXpq3Gh/MPtOZqA1z0Zl8VoT3kMstTogcWKzJAW+Bgsmu
	CCm2BVPbmUC0xzv9i51ZsMibWO0nuPpgIM2AnnHdjGBlvRfzhNvxdLuVKpqmvhAMw6voq+sVxBr
	y1jxNXzBehBijigCC8NX+4rEXGacEbm5CIeAW0vovgjpNEViLDYCkhwBRr70PI8wmBfP+zZWLhr
	h/WeylpieZgLcsLRicvro/yihmy5aDu/hEVncogtXQytDn3GJ13wPfZzA==
X-Received: by 2002:a05:600c:1c08:b0:4a2:16c0:f4f with SMTP id 5b1f17b1804b1-4a216c010e4mr22298145e9.30.1792757124684;
        Fri, 23 Oct 2026 05:05:24 -0700 (PDT)
Received: from localhost ([93.123.20.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21544dc5csm28563925e9.3.2026.10.23.05.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:05:23 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 17:35:06 +0530
Message-Id: <DMC7CT2C3AZ5.2SEL62SMKTXEQ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sm6350-lena: Add
 qcom,rmtfs-mem node
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-2-b4612e3eb536@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v2-2-b4612e3eb536@erebion.eu>

(re-posting my mail from Sep 28 because apparently I forgot Reply-all)

On Sat Sep 26, 2026 at 7:30 PM IST, erebion wrote:
> Adds the qcom,rmtfs-mem node required for the modem
>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 79aa2521aed40..0ef3e9e239786 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,6 +4,7 @@
>   */
>  /dts-v1/;
> =20
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -54,6 +55,22 @@ touch_en_vreg: touch-en-regulator {
> =20
>  		vin-supply =3D <&pm6350_l6>;
>  	};
> +
> +	reserved-memory {

r (reserved-memory) < t (touch-en-regulator)

But it'd probably make more sense to actually rename touch-en-regulator
to regulator-touch-en (to keep any future fixed-regulator sorted
together as well), then the current sorting makes sense. Maybe add this
as a patch before this one?

With that fixed:

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> +		/*
> +		 * The rmtfs memory region in downstream is 'dynamically allocated'
> +		 * but given the same address every time. Hard code it as this address=
 is
> +		 * where the modem firmware expects it to be.
> +		 */
> +		rmtfs@fe901000 {
> +			compatible =3D "qcom,rmtfs-mem";
> +			reg =3D <0x0 0xfe901000 0x0 0x280000>;
> +			no-map;
> +
> +			qcom,client-id =3D <1>;
> +			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
> +		};
> +	};
>  };
> =20
>  &apps_rsc {


