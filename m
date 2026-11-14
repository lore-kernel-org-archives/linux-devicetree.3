Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794670357;
	b=R43OpI+YSFV6UtOvDk9iCZl+ze+ifQfibSjdKMfWXrFkaVQ6rH2qJtqeaNdEvPwFGNiZ
	 8eQXpu3o/6NquOnikFJbUgzmmxfTmBpCSHjuYzAmUIOGhA1YLkjkKSIB2Q71j+NmyScbU
	 ionR/JMjhtCfSjkiSCXhzjm5WdLmZoFOOoy5Q8bvDejairADjxmyjzoNCxUrhfcB+JcGn
	 CSMlZx5JctWeBovXqR9HO6ZYcdGEuGajJ2MCkIDVCJpqvxTF0JThG951fxiwZvzUUK5+d
	 rkaeARG22NE8UVvJk2cFOH/B2/rUmZWUQTKY5WoUrJvDlyGMzbWNbS+FjmLSz0jeySA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
	b=dsfvTNM7hj/qQKC3a0oyZnp1kzSN7e61XLuFB4aDGOgq1SNJcaAdlnTVUMj/7XtxRU5Z
	 2qnH1KuCdy6zVuahwhQeknx8Pufhf+3u/deZpn/mKJpUFmIQk3tj4U6idf9g532TVvLjs
	 x2QJoMfAGujGll0DIC/u+nwTON0UkviXNBwqhTTwyNqtx8MqnW0YP2dGp3QqlBcdaxjgz
	 bTxwr+RG0bd5zgxq2jyY0m234wOxnAWrikV+13nIPsm0j9pEwD8qNf1RvbLCs4n5Ab3vU
	 H/g1B+sEAfyVEo71TdAHNIRI8paKqZicSXYiNiIKXq189xgRKKMnkI+UwR1Ft7uhDwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgrOhZRp;
	arc=fail smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E3B606A329
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34E3B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgrOhZRp
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50cc7540b7so287866b.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 07:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794670355; cv=none;
        d=google.com; s=arc-20260327;
        b=DDi6mjn20hVOKPLkl50Va+ZKdJUsB2IGWHviL/JIWbzN3ZY30xKX8Vz19ggxzc59LX
         cVG+bQkilNFCHUpiEpXcWYhOuNO0AU7jiFBwlwtnX4YARTJpoy1v7+bin2ddRFhePeCR
         71ud3tq/EAXogPqMDkpfwEMK4h/4KlzdoIGQxJlgaqEQcqangQz8oea9H8lqkR9uFAAN
         QaT46X+jbdSv7CF/U3WYNrdVqoK88M5qmdoKNzEX6cHU22qBCvLEJG/d8eXz2WgnFSjp
         WOwcZuCsSwcIZBiDufRDuBEMXFW4UBVtTxIHZXsBlOGtQ3TcJs1Rwc8ZYggQNt2QV3AD
         tIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        fh=5Y//tplz6FciJj66RkK8ExSvirxYo7dLAI4pao6xS8I=;
        b=Tx4FNtMiYxrdJl+Y6K7D03/PYiah3wJ8puwqq2YZBs6+z6fo4QC87pe3qvSLe12xUt
         5CI60Ap4Bm1F/PAXh28vZfsjwQcBC1U4h4fV4lG+p8qNe35iqKSuTXIbNadqAKNYkWnu
         gpG95FjFndr3pjVea04Cz+ITiYvI8VZ6mz2gxIl8yHdRTN2KT4oXSVTi48vczVH5TpuR
         d81MDbKGfcrfkMwiGhHU5dxiRy8gXHfZDjZsxEk1o/XGh6XTChlH8Id0+FXmGCH2fpOo
         ca57bp20AZA3zAAE5R6/EBMznvqdq+Y382Bdt55athlm7qMcGHSR73SieaSAqjAPQ786
         PeEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794670355; x=1795275155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        b=pgrOhZRp05KImLhRrhLjrWt50iEsX2rldYqswYgsVQNsni6GZ7hMZFhhEAsvzYl+XI
         pDxmlgRtgXeVD282942Y9MC1GgAIs4rNVhm9odZW/f2y2srKDssKPHzL037mIIt7q6UE
         tYe4MH3o76oQ5NfhwSZxAoN+RwnvALSJclUP8WgvpS8B/+J7dSGb4FwmSL9M7f+4e7TI
         jPqnY564o9gAucXpqlDNyAV+Ml9dr6o+UXPsD1dWTw3G6g6JvW7b6X2gsL2fuVsOMB4U
         NYynnyQli0Zr172tTLKl3QPS2vt1trdjq1+3vrarZJXPCSRrSjs+1oogfjcKHzGciZ2B
         zskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670355; x=1795275155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        b=Q0GTCjA4I/MmXbMy7aev9/iIPzP1u5wCd6LJNaTdIgf5gcaLE02mm82OVKuQioqM5N
         x+XPKEYIr1WXF/0NAeQZKn8bkPpuJ9nNODRvQDn6QKAA9U4Qh6mPMT4VA5m+ZKkyKWG1
         yQrulWBcML0u0UIifptS8Zyi+1BgMlYc1p6rRCYduI9SabttUqUa3hAeOmnRAW3RqvOd
         F1quzzIoOfdfDTbnruECKmEqYJEtEVPH4FL42LjzEKYFbkua9M72I0ohkG9qwpMzPBwx
         EpWGc+URS/DR0V3mRHxhBaQ4/0PeVB3miwr0uX/mdPmaVc52sSBUmRvCsvnN9cDwEQuQ
         Hjfg==
X-Forwarded-Encrypted: i=1; AL+hErGH6kgXv1KoVjn3aoMwWIer4zngss4xvNKsMqaAf6S8ZHvDHNXJp7EgLByxUchHk4lOBbcb81mv6X6j@vger.kernel.org
X-Gm-Message-State: APuU4Z+VMsR1f3hUAt6MgTs8muRxodXIWHIOq8Lckd/9H/9UcNB7OAJx
	5/F1BIPkvcCFOTDVFRXDIhH6QUoTEul8OT+KCmj3AowOoUNzpEjEEIgZRUlPiBj8T9ZnVry1m6t
	WDQqOrKF51MM/t6p29n8wA0+P43MEM7U=
X-Gm-Gg: AYBFou3ATyT5UpmBlewcmySagrvPpdCnQgSLNrnBgzKEDGhu1mpfPf1l8fm0Mg+6dRV
	59DkMeL0Mg+gmU6njE1e+KYTNJSe11A1vFTBhSoJqRXvtXnTT7S6THf1P4RVbsZPoiTMcoxVe/T
	idPHWskVoz8iB779tpSFib4ZukpMHXix9dltohpzaQLfhCegQNO+BHJgFe2thHJmDy//5owNXZY
	xshSkHfBFRKwUNw7n7Lu4nQYQRo+CAGZ4031RCiay04dZvsxPOO+mkaqNFRV/S+xa51nJcI5EDS
	2aB1KYRmkWL1JDl2SUxUKMo5IOCwOdEUp11hJRaAiPemy17UPqQYT4myEzNGs+JxPJINiOC6Ffe
	rGnDBwTmSDzuQ4BT9p2oMiP96eVtE9VbaoAh1cA==
X-Received: by 2002:a17:906:9f8e:b0:c4c:b4fe:c9f1 with SMTP id
 a640c23a62f3a-c5096385149mr526284666b.35.1794670355209; Sat, 14 Nov 2026
 07:32:35 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
 <CAOPX745=Mx9Q+Wijt9+=Mmjtdk4fsenEeV2h0gPCvNpqc8kN=A@mail.gmail.com> <43b83555-df27-4b8b-a1d4-bf0cd9c46893@lunn.ch>
In-Reply-To: <43b83555-df27-4b8b-a1d4-bf0cd9c46893@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 18:32:24 +0300
X-Gm-Features: AclHuK8X0DQZe3Z31cK9XuFE51dX6ITpI-bm5svIaVnP3cI8G5bXUmovC3tRnYs
Message-ID: <CAOPX746c7uJt1fhV6s2=VjjeinQs+R4zDmMqCO3_UqkMrjzMew@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Sat, Nov 14, 2026 at 6:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The LED_COMCON register does include "force-on/force-off" bits,
> > but i have intentionally chosen not to use them here.
> > To be honest, i=E2=80=99m not yet convinced that they need to be added.
>
> They allow you to implement set_brightness. That is ideally the base
> for all LEDs, being able to turn them on/off. If you can do that, all
> the trigger can work with software driving the LEDs. You can show the
> heartbeat, shift-lock, and all networking settings.
>
> Making use of the hardware to blink on network activity is an optional
> extra, reduced the CPU load etc, but just nice to have.

I got it, thanks for the clarification, will do.

Best regards,
artem
