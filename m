Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436641;
	b=Ho+2WKuMTMRIa2wMYEj2ZnGZhHP7pfhzRDdTFGbC6YGqfLactWN0F56UwS1+Kk+EzmuI
	 v3YWaucNbp67saJZjjo28WQIL48FyuwxwHwvjzC51VBkMYCHYKvkT3ocTsYC17PD66upk
	 DuE+vocu5h52lWJQ3dtXKTZ3gEE6QgNeBIy53OT0Q/gi/De8fx4YZtOuh6U4o8BV1IcgQ
	 cEQ6sRDtYxzPVo9l/6lB+Bq7nw3zi+GzhWrVBSoV6+/0LVLHuw4aCv4iQE+sYPHbHb3br
	 LlTtEGvn/bSlINbFMUcCuEnCbqyBh4F6AaNkN9HVq/1Hmcxvy+XWrCaRQNk8nQQSqNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=tNjY8+hhVU4H7nudtWwRsBTQX4I5mOLQRqYzvL9iveg=;
	b=AeRFXZmAFKawqhMndn9o85BFOh0qpEvYn0sMTeFIai3Bx2w3/S0GzGw1/va70Yo+M4uQ
	 UaM22iwI5B5kx3FAOl1aYXbDy6gZX9dk3vPjM+5IUR3osq0s1STYZiSD3OB713GBlBL9m
	 uFlFXES7UMQIr0AJKd4o9pRvHTm2de7OwkIW4bWBT1eI6u3JAmtFlIGHSrt3l934qtyeY
	 1WTNPOg3JSB9yxFsE66gtSR6RVMnHFcpSxtyGgQRr/oUaQfcdoQzGRNnNfc27K1gaEV8V
	 7cAV2cfUixA8FQBF4AadoXNpuJNkDlM+XmypwlhgqRmY5qFJUH0H6qUcUS/fj1Xn2IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FtQuSOYg;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80295606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80295606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FtQuSOYg
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so3767870a12.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436640; x=1796041440; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tNjY8+hhVU4H7nudtWwRsBTQX4I5mOLQRqYzvL9iveg=;
        b=FtQuSOYg8sSf4/9V48Ab8qAjujqQz8NpDRWzirALjzHz4bD9ONZbSyTxPwLYNxZbOM
         N+tqz91gdfSCbdcnbNd9ERMipX0rPW1mIPC5bJbEOmBZxkYHpFzJxC0BZCwTaqeov0VH
         NoGITM3lvvDAVK401wBOsWCUrXHF5o+jie2l1moTEcTi9kZlUiphn9ph/y2aLQZDbHzT
         6RoK2LwZgnIKSeQlmwKSQ0cS8oNjqJyxDiTeU1KKTdWBuRlcoqJdi2VLH0zbPeEyZ2+q
         HqC/OaOQ49PpMS8uzsx7hbRKbyErKQiGQ7Y6ESG3KlEtJho+Nj7hI1jjlJU1URXDHxtK
         YLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436640; x=1796041440;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNjY8+hhVU4H7nudtWwRsBTQX4I5mOLQRqYzvL9iveg=;
        b=PgUKBZKuRvejlSC+9UBS4xRKt1GOtEiASv+XgotfUzV3jDijAfaYRM/VZ4LA90nLvc
         uhDHWauKEC2gCKxfTSA487Ug/yZKRSVHdbLP2xcABL0rTXqQpMCorHVkxJR4ooIbTAh4
         Rqs8Yq3SEtAJST5rztWr/ohb3D00lp0qs3IL43iHYAJ9YRavz4HPU4vsaRjcnNg3YQEJ
         W3sUDgrcVsKOai87/kxwPIad06K9I8q8Afzd+l2nnYg8OsVf2InwesIoL2i/cJINrPeZ
         aaLM0iKxHRY4L1WkGY4p3TOq3eDg1J0u1O34uW2mOloZWGsej7VusgQRKxScxxfvhl0Q
         F/dw==
X-Gm-Message-State: APuU4Z+M3MUX5iCgpFqU7nDdwc2x44kUmNcIo2AhUuOQuRjMdwMh6c2z
	GUdZTomK3TDsQJ0ioIgSrrDj961ALenV2mC5wmIjNbf+kZ32D/NzQ4+At+U8cfLfz3AfF/DkVLw
	=
X-Gm-Gg: AZFdTZe0tMANVjxcdKytx8JeRnnj4tSnf4BVdtD9fiNKtxckr7sXKqwExorMwmZ3GDs
	pghX+vzBCvPx9mgaH4tGJXqRTmyXirVbAjd8zC3ZF8XzBmXRFKy4ZrXZ6xCTdU5UxTX5VZBS+Qs
	zh5Lb6IamWM1zcqN/9KqaFJZGtowPClIhclGyVj5dIMRCQkxEd0w1ZiY8ST2eT8RMFlB4CVthgG
	xriWYHiCj5n5G2PwbhCpybBmeP/TUDHV0+118uAK8xPUCVSpDwj3HfVSybI3uChLRdCbLcDRmxP
	ZTVF/sabfC01q13Z8BOMQL3hGNM2fvwh6PyNdF9dzI/lkolzJnzkzp8DiUGxfwG5W7zxByJacwD
	vCLekoq5Idc237AX8+5Da0O+KR8Qc8FyaX6S6BfIKIdMHuQf0nybJS+zoABiRCjzBcerY8hbPix
	D5I9h+nWtZMSF0reDawr3ThNitQRArHUN9hLSryYLaw/lSmgmKDh6PnVMeRNpg+0tXN+9DnEzgV
	mmE46bX2mRDLN5LDd9kJ1fU4rhNCrOMp/hc+3VIZQTOJx2RxutGuXhlOY1MpsCrjZ0DFsHz3/PS
	iRs1Vy5+8sSnLOdS31lMswRz7zWdHwAGq4Q9bMYo4McG8/igdShmrIJX
X-Received: by 2002:a17:907:9612:b0:c2e:2baa:a642 with SMTP id a640c23a62f3a-c513a8845femr1010728466b.30.1795436639952;
        Mon, 23 Nov 2026 04:23:59 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42easm391318966b.60.2026.11.23.04.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:23:59 -0800 (PST)
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
Date: Mon, 23 Nov 2026 15:23:56 +0300
Message-Id: <DN2L64B7KMAK.11FXWAFFOOFV5@gmail.com>
Cc: <devicetree@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
 <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 6/7] arm64: dts: mediatek: Add MT6895 SoC
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-6-95c46597e63d@gmail.com>
 <sashiko-outbox-229131@kernel.org>
In-Reply-To: <sashiko-outbox-229131@kernel.org>

On Mon Nov 23, 2026 at 2:25 PM MSK, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: mediatek: mt6895: missing EL2 virtual timer
>   interrupt in timer node
> --
>
> commit 52307c1c986494baf205914bdd46826de40efb27
> Author: Alexander Letuchiy <asalde.le1@gmail.com>
>
> arm64: dts: mediatek: Add MT6895 SoC
>
> This commit adds initial devicetree support for the MediaTek MT6895 SoC,
> describing its Cortex-A55 and Cortex-A78 CPUs, caches, GICv3, PMUs, timer=
s,
> pin controller, UARTs, watchdog, and keypad.
>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6895.dtsi b/arch/arm64/boot/=
dts/mediatek/mt6895.dtsi
>> new file mode 100644
>> index 0000000000000..62584cec0f4fc
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
>
> [ ... ]
>
>> +	timer {
>> +		compatible =3D "arm,armv8-timer";
>> +		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
>> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
>> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
>> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
>> +	};
>> +};
>
> [Severity: Low]
> Should this timer node also include the fifth PPI (<GIC_PPI 12
> IRQ_TYPE_LEVEL_HIGH 0>) for the EL2 virtual timer?
>
> Cortex-A55 and Cortex-A78 implement FEAT_VHE, so when Linux boots at EL2 =
in
> VHE mode without the fifth interrupt entry, arch_timer_select_ppi() logs =
a
> FW_BUG warning ("VHE-capable CPU without EL2 virtual timer interrupt") an=
d
> falls back to the EL2 physical timer.

Yes, you are right, thanks. The A55/A78 cores implement FEAT_VHE, so the
fifth PPI (EL2 virtual timer) should be there too. I will add it in the
next version, or send a follow-up patch if the initial support is merged
first.
