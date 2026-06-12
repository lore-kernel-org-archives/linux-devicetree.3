Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A3027603C
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279200; cv=pass; b=l/IQZwq8nHg1pwesfhXBdE5L2kx9UNeWxvkyeRZslObiPHGSgAl0oGv+C40jJZdZ2FUEm3gN/Mn3IXdpbQWyxEenhINXEOmc6rNrbBLDQYLrMxMBKarB7XXHGA8oMSa4Hd6Rf7F4P4UDxqTnmWkTcZFTRhP8nIZ9Smy8QHfZz1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279200; c=relaxed/simple;
	bh=XmooFYO7MJjwuHLWtjcDdWHx87YsWZvV+Cm4GZY+JDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0ec2U6ELfnPDdNgnLOHVtWCiFYADcmddrfuFZn01RJKZEYhnCcveO1v0unA1RNwNrskVXFuku6gUen1vI6Vn2kR0j/U35FQAfAxu0L6cVskOi74wRfSmM3Rn4kLvdjrNEI8noKNizgq4JUDxRYFLrAsV7GiGcdcnegeMIxyZ4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTdOWnab; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTdOWnab"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6606d5900dbso620530d50.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781279197; cv=none;
        d=google.com; s=arc-20240605;
        b=PjTM4ETqjCUOSEPl5Lz+19gXYLQCUNaG6mKGV4JggoZkCS/xuerHL3goX7kabFOZC/
         pG8ajr1oZVR8suMFPGiCF6w81tJqSJPCzuAWKCsADP8Ro1pVvF6Vxuc+nCVCTfeQWXm/
         Jt20zk0vBr0D48MU1uKN66zjJ0qvdgOouftAurpKeYahDSNjnvsCvoSwL4QAZoFWGX/e
         FHtjgNQv+GmGmmdofot3/eWL+3iTB5vXtENYMGWw28054VG4LQej9+fDR6Sa8LRnMQy/
         8kLlp2dmEfvPaWa5TwIHK4XdsuuTj+rBDnFKSIT3JFq3sUaQys04nrX1TibJg14ydImh
         N69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        fh=C8oTYEeBCEOxAtZFetkMP/gDanRZuhzRg2Vk8cI7nR4=;
        b=Bf53L3zC+By3UzzXWwJd0Jsaz4gQjD1CypnpbHhog9SIfxm8XeBUcxGsJaN8may63J
         mbxFflmCjwmtNZbSiew2n3oj825RxvKixmNtM0EtRVEU7+vtXJla9qBe9oGsh6Kgiz71
         RoV3Jxst50dgkcAgrVJGGALpYVFvrcGtnTMQzkLcDLcUz6QSM7YrIiV9TQ0VCnhx5lly
         oj9CGHLvZoTOujtgqsoHMHtn2eesuL/LThn6k4VpuQFhbtm7+puSpZQuUuDZ6PODw5W2
         r02Tp2CVS3gPTF9sRX6wCF53YBx7GpwRme61EKz+vp5pWKNzPJTmtEmZmgewztL64RLc
         Fr+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781279197; x=1781883997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        b=sTdOWnab2g/nh1baVfJVf0+ExYOqQkbNl5HV6c6yysAx848lONEk7gji7UUw0eNKEW
         o7kps/V46c3oCV93vWiFfICAnW9P717fSvdTkhAIiAqS0Tp9xSymDxh3R5vJtXW1k1ay
         M0ysBRooR/T8j3ywyOmOKbMkXAQnqbTNvILRo5gaTS97d1skNh4u+qOK3d101FBtYkEw
         PjjRHvmHhcsN5pCWiNoikggYRCivOyYBtGmEFJC8ZeOSxlgGHQ7DfYFKPwjjUqcTaxhB
         GXKXJknq4PtqUkxAmcK4lZ+EqVwlXgNs2ST1uOj5ghTFA2W9fFbTNcXD5gga/3vRN3vD
         GLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781279197; x=1781883997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        b=YY/BtEeQDt5AG9ZXbzZQz3tLvmaZeDt6NNCVTP/vzFwysGo4IKtGzARoZWvTZDDkt8
         LE1EYXnU/aX02xiaOWJszeoOFeIuDzr1xSlpnGx/QXMzfZ2CfHWBgdWEQlR3TcELVBfO
         B7ptte+epXfFuw9Eqsy1R9zzm6+t6ky15l1iBEBrqyw7bRjnQAdOtusr0ipQadhEiw18
         sezyXvxEVo2Gpety5VaekbLD6nXzF9Sm/+JYHltQ80nOUBQLtN4jdAefpHACXvQlGbCI
         Tk96hnfj6VNgB9r3oO6+1mxJWLErH1J1refeyuGRq3NFLvRrzJbZGnDe2wcdl9C7d+e+
         EcuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Dd72Ua/Z81dW4JyHEPTyMxTnield2Vs5shE5xZI2yODQXDR0EIKNBifUf2hiwvBX+IZBV5BaSZTir@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/f7z8yUtT08U+FO4aBoliN4s+Sl2jiW0nouQ/MYpGCNxl63Q
	GWOh2C8jNDHLuXcehs/7vwbmj0j+478kxLi2axESoo2TOQNbaRaDWCrdA1DLblOikwmVyaXgekt
	TPgE0XDIaKLANoYcQN7hz4sf9CkHAt/M=
X-Gm-Gg: Acq92OEdX9EaOq54pWk8a4gmwY1kqWKHxclqjUyfyIzpWx4+Ru8sX8vS0TY/2uLccfV
	8VNb1LszQJGBHHawNA5xNe2bdLUuFRlmHGcrG5lRCIJaxrSXyRcmNNsYxuFl2HEV6anWxa7c3Xz
	J0E8tX1h7sOEru9y36+beCNAIa9IvRK9X4Krpqc2EaoY7u1GUhihqp7vY+CwScZI1Wswl6qREEn
	qZwgorBMUMVJ5CRmhM/LHgT1KVnJ3oUsNetauXRQJ/++bJsxiZcjWNe6erRmXA1WfV16iLYZFV7
	Yx9dtPXUWVXvVIfY7kIUR5Asi8mZEgUoJS2vIz73Y7qrI2+E+2M4/w+l42DM1FLVYLqmpQ==
X-Received: by 2002:a05:690e:419b:b0:65c:7129:5c66 with SMTP id
 956f58d0204a3-662782d4c92mr2935747d50.41.1781279196694; Fri, 12 Jun 2026
 08:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com> <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
In-Reply-To: <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 12 Jun 2026 12:46:24 -0300
X-Gm-Features: AVVi8Cc-RlrekTPykssUtkucAEzJ495V9LRVQKNsNE6WJFZ19JGNTXkFLsVH6_4
Message-ID: <CABBYNZL_FmgjOKP-rNzc6e=m8oHdzN=7cLbvLqcHi1Otpa8puQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt: Document
 WCN6755 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Koskovich <AKoskovich@pm.me>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Fri, Jun 12, 2026 at 11:33=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:
>
> Hi Luiz,
>
> On Fri Apr 3, 2026 at 3:52 PM CEST, Luca Weiss wrote:
> > Document the WCN6755 Bluetooth using a fallback to WCN6750 since the tw=
o
> > chips seem to be completely pin and software compatible. In fact the
> > original downstream kernel just pretends the WCN6755 is a WCN6750.
>
> Could you please pick up this patch (or provide an Ack if you want Bjorn
> to pick this up with the rest of the series).
>
> Regards
> Luca
>
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++=
++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn67=
50-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-b=
t.yaml
> > index 8606a45ac9b9..79522409d709 100644
> > --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.y=
aml
> > +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.y=
aml
> > @@ -12,8 +12,14 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - qcom,wcn6750-bt
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - qcom,wcn6755-bt
> > +          - const: qcom,wcn6750-bt
> > +
> > +      - enum:
> > +          - qcom,wcn6750-bt
> >
> >    enable-gpios:
> >      maxItems: 1
>

Acked-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

--=20
Luiz Augusto von Dentz
