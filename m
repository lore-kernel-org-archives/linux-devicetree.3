Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE7F3A4535
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269134; cv=none; b=qxg1OEKHHkvsLz1Ds3dCLOYZOPTcfMxYoeRQRXAVc1mmLuzTbge4jcY/oL6LwG7EgkS3FYm0roQ82+pwcsI1ysFtViKplAoNM+nkGutJ+LCNf97x8lO75VjzF3dAku+qL31dmRXNO8OZCQhngRVDV1BsVTyHxwiHf2LrQr4+KCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269134; c=relaxed/simple;
	bh=EaMqpe7Gvk+f0KkZM1xdoZcB1Kyhx8cGrASNkvb3ncI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dnuWvWYtAsdxeuPwfxAHZ4tYIn+/GTg7Y4vmqDZA6Bddy6dfLs+8oxs6kOVofXj4JsAuse0iqCtBD25399mbGC+MAZMwaZ5V3rzDjfDZ1+i+2DOTHG4hsqLoEQHqtTLM4+aRnRMMj5ClmtzJR/9yY13vD27u42aAcHsT1sfweGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xBy72gcI; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xBy72gcI"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-668d41905a4so4476213a12.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774269127; x=1774873927; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikFz1SRcP/rW6eUkyNzFzTyCYVUG4zpcRXdMo2dV/lA=;
        b=xBy72gcIHizD3dp1XJMExUtijLYSrEIFPd24HaLDVnm0GFrq2QLitUGuc1ldeG75r5
         2pGqAbjF1jIwRQ3LwkAMa3Xpp1z/HXQvCa2Oekwd9GHAP/QhGya9OP5q7j/+hiw42cWc
         ZRdJ0Xrp09FKmmuE/8LAI1RWqUxBEMuC9uv6I2NHLHEymZ+lCmHIPlBz9dfWEW1Wb3AA
         LeJn+Pk/tlRuTH6z3klUCl8rCzC+i8zrqO3RMS2eK+fSogh2/KK+ScFvTjH4xy0fJ4gR
         sZnKdtRynxNM9MA0OXLNQmUzhyiCW/huyIZSVy+BAPotQtWr5F9I468sxjtQiaNOYJRp
         H8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269127; x=1774873927;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikFz1SRcP/rW6eUkyNzFzTyCYVUG4zpcRXdMo2dV/lA=;
        b=SxSUNjAYshOu2pZLpM7IprI9E2h6eKW3hFww2Wfu4ucvmcNeUjuCZfnnF+Vn/fDVue
         nvoXfJBb2S4cuWdKTjbg9S3eqxDcKm9+nkoFYN1jBXJID1cvYSe5m2R2mgK3ux7GdMUa
         7CQv9WPgomyQFOlvCjXCO4n4EQIvSDn7ee5ZJRlL52NDnRi+b3IUCIdHas8OFXEq4IIa
         y+17PqYAQD1H4Xsl236oyqeH8+WZPfz+nUup1yrqjsOZg7LttL7daJiC32D8yj8wWIks
         2KnweRPLk6Tataa/k8ugKYkv/wn5SOcXGVyCN4Rhqfr/MHx2LpFLftZaEC2CO8XCFsaJ
         Uuwg==
X-Forwarded-Encrypted: i=1; AJvYcCW5JaSPlIu9fb/1Tmpfv3umxtMFlNHjeBVVr1zhYFyJVvpHSU3Jy9FQIYVBWQtppmYHrCYWh2IbSttJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDSEi/GaPmlez9rOKTLAAlb5m+rFHb5ze3lAzPQ46JKTL6YFx
	irY/BSAiQbbAUEFJKSqDebfQfAuVoHM48BKwu8lAFVhsko9FoDJX4Nn9mm03+xAnJZQ=
X-Gm-Gg: ATEYQzxsPkuxm6rZquJJsJZHvLm5JGcbYDtQunoWqBsLGBg/rHIiNlWjIWWw9V0YWLU
	K5XN4ZOsnVgBuXBnYDcFXG3tKEgZrEI8U+jfHgbkqwBw7HLaN/Pk2cM5hKK10y8zLSGaeDROwxi
	okLZX3oZePEnUBZaf9JLvIw2jhF/H8WQlCYxqvsUw9dlMkQRwbWcwSQvrI+6ioLsSNcZc73jVn+
	/5v2hZlVQBtov3HAUmd/MSze7p1KDu+i5dL8XwYNJTBEFc8/MRyKDqh9aknq4LdEsz9gc0tMkHp
	+v2UonK1jslRWkkAAmm4uV1XH+doeQRaZet4lKBQe0YIAJIn+n0fMHnVlA6rhxzUtaq9hiqM0U/
	Ae5thr7ExidbqVz6MrAJ2bqaX2lv/kxrqfA5PuhQfWDMIJ9nq3dLftAxkkX75+gfxgApubuk+XT
	WofrqgbwfGlTKkCO3htdhhlOmtf3LUvuR5uUbncU+6pr2pxK4TzIpQPurXhsZLg8SYqQea
X-Received: by 2002:a05:6402:685:b0:669:cc03:3367 with SMTP id 4fb4d7f45d1cf-669cc0336d9mr1300928a12.23.1774269127428;
        Mon, 23 Mar 2026 05:32:07 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf7e2b69sm3771489a12.7.2026.03.23.05.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:32:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 13:32:05 +0100
Message-Id: <DHA5WVPN3F25.2Q71FMM8PD7UL@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Alexander Koskovich"
 <akoskovich@pm.me>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: milos: Reduce rmtfs_mem size to
 2.5MiB
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
 <20260321-asteroids-v1-1-4b902901cb49@pm.me>
 <bd33bd53-2539-42ee-ba3c-4a544a61b621@oss.qualcomm.com>
In-Reply-To: <bd33bd53-2539-42ee-ba3c-4a544a61b621@oss.qualcomm.com>

On Mon Mar 23, 2026 at 10:51 AM CET, Konrad Dybcio wrote:
> On 3/21/26 6:00 PM, Alexander Koskovich wrote:
>> The rmtfs_mem region is currently sized at 6MiB but the default for
>> milos downstream is 2.5MiB. This causes remoteproc crashes on devices
>> that expect the smaller size:
>>=20
>> modem_ac.c:281:Access Control Error: Could not protect the region specif=
ied:Start:e1f00000 End:e2180000, PID:1
>>=20
>> Reduce the default to 2.5MiB to match the QCOM downstream config, and
>> override the size for FP6.
>>=20
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 ++++
>>  arch/arm64/boot/dts/qcom/milos.dtsi              | 2 +-
>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index 52895dd9e4fa..c0981ab731c4 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -724,6 +724,10 @@ &remoteproc_wpss {
>>  	status =3D "okay";
>>  };
>> =20
>> +&rmtfs_mem {
>> +	reg =3D <0x0 0xe1f00000 0x0 0x600000>;
>
> +Luca

You didn't actually Cc me, but I found it on the mailing list anyways :)

>
> Could you please confirm that this was intentional in the first place?
>
> FWIW I see that volcano.dtsi indeed only requests 0x280_000 on a "clean"
> Qualcomm tree

Yes, it's intentional that it's 6 MiB on Fairphone (Gen. 6):

https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qc=
om/proprietary/devicetree/+/b3744ffef87e1f2a232b26e9cb270a1f82554bc3%5E!/

I think Fixes is appropriate since the default for Milos should be
0x280_000 and not 0x600_000?

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")

And maybe a comment like this on top of the node?

/* Increase the size from 2.5 MiB to 6 MiB */

Anyways:

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>


Regards
Luca
