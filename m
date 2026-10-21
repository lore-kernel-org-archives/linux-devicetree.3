Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613080;
	b=E1peuHuubRDf/WFMGHJnw5Cmhb9cdKwym6D4NWFn73tZDtZsUlIwxb1PzMKHRWoeCuNS
	 PVdtHSqzCl7gKML1LdvzjC9TuNY1D70YE/F6y55nPEVJJZLo6CAoX8t/TCPbxSMrZ0XQJ
	 wXH1V3WTAwE+DyFkMYvb7GKurzuRdwg1ViWcC/DWnxeWpmHuBkF52SSbNMzzXtCpLaBcC
	 tT0XuWXJzQcupfXK+g/LvI5ifFAwU3JRrtPOtrezNrc86sSixVywNS4WfaoBo2HpZKKQd
	 oLYoZYVhGlZgxrjUBg+GxZYtTrF1yaEAPtti3NWxfBiZ2GeiUw1L9+i4L1aFerk5Pkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:Mime-Version:Content-Transfer-Encoding:
	 X-Mailer:References:In-Reply-To;
	bh=Oxuzt3tx2zzrVlPN9LeqR2EJEXH3nO1HmXie8iUqGdY=;
	b=vYVouCi/tVaj0XiuJB4b+F4sABE1dgoOkOla3xyRtBv3fgovFevHSm0iUj6jRsclSXIq
	 Dh1j60R2GeAmFuI/OTOHWhEh9o4GC4hHEfoajBazhbgRAUKzs1uUZCdRv/B4IcVRoI8B0
	 4yt+UqDNX96elSdHhE3vZTc6DMr6hd4agtfnlQCeY2tGdoC9qAgjR6kIn1fOdpQaVCXK9
	 QJDDl/JAyIHha64uoaIva+I6bZSffeXxC5wmbuawoPcCila004vSlnMV94uHpYFG9ttIk
	 OcXMNW4Q1C/zG6YsTMSC+DCluR2J7brM6JYylZox6gzcqRIeq5iYqvZq8OQep1PfB5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JAW4VnXH;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F045606A321
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 20:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F045606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JAW4VnXH
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-185fd3a4ca3so469327c88.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792613079; x=1793217879; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oxuzt3tx2zzrVlPN9LeqR2EJEXH3nO1HmXie8iUqGdY=;
        b=JAW4VnXHkBtVnCvV8amF5BuEGUgtPcES+Q4STI3sixNMY6bHHx/ByD7IeV2pe/YaQU
         FbxPlYzVrqngyBqiK9m+Ix3aCCancLJSBNp2JDRUb0yiHk38u3dAhnh5kO4wMV2pzt/2
         31Mati6Y3BbkrFNMO33S7VA8h9BvPQ3dYOEKw5A0gj/JK4sDK+YlfQ9EAHI77SKZy/KA
         lUn44EyAJlITyqm2wvCfHEcSwYQ3d4Is/V0cNobM+UQHrdURpyi0eZcGauSP3yBctOU8
         Tmwd0Wr30n8cGvWc/N9ZMVI/JdNBOQxfCFGJVfl4qV6cVOcV5btTe5EX5rFnRdGj0Op7
         TF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613079; x=1793217879;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oxuzt3tx2zzrVlPN9LeqR2EJEXH3nO1HmXie8iUqGdY=;
        b=gG98aOYmnLSKvwFRqD5Uup+xWzC7t3VTfAxZapkWtvtzASGmdoPef0IURJfoMNGp+O
         EfkAhJJ/0E81tNVixpG8r8/6HwuL3moBq99nP1lADOxvGfsvpFYfIUbB+mb+OleEiBrc
         PKYTC82zpx+4MFfLc15jVAanwOVJHfeLmqfZAx08shzf1KpaSkaQ6kB+ytwXnlYg6kJL
         nmkGv7e6+NmS/k9hSryJ/uVysAEEqCJZGdzg7nJyrMlUiDhz10vKcPs/WqDngQH3xGLt
         XCYeVtmgjKKq4eX2oyKJwPFzHgb5rO5xYrjs77XRIVrK8FSo4Ff+NfcGt1xXmVq1FPT0
         pAHg==
X-Gm-Message-State: AFq9FYLDKFje3cTzCg7SGQlhNL1D6uEkteHu54OFCs/nf3cHtzaKjl9f
	w390ndMh08yLKJpbGCx6ah1S/ajqNzTPFNCBupmuSR3ftS5WrHG/VJAzBvdnrYwd8dM=
X-Gm-Gg: AYBFou1gdIqDbuFS2797twt4FpaxAe0OcpfOvo+l0+Wgz4GGYY+pu8QfG01WNhui+We
	KW+YdfNgI2I59gOymZ9VhH03QEHTU1XhASPa0WlUKqdg8NsyASeMmPASmKROA6wi6+HbzDr1pHL
	NGXc8e0mkpTotDseJOSO1msMe4kynH14dugg6JGZztRDtn3C0nfx+uaXfHIc+3FhfdkmBNjYWL8
	wyQYb3Ol6w8x3eZHIlpe0kkdQ4xNGHIOWG1hnAe08dX2sTXlygWdgMTSPNfcyz7EzZ6THC+F1XL
	XO1VBlyfOsT0/qw+YoUptslGXDkGz3eZpYxkGwoZmrkvmf1vAnG9Rfu+9CdF3TOvw3wYhvfZ3fF
	hRk8UTtcpf780dEp/yn/HadrijojY/4BqilI6ywdNLTbi1TMWBNvi+zwUkdg86G+nw2CsQ/ZlwB
	fc9Mm2yKrjBMWH56IeBo7BA5iewdrrrjW9GUqQEuoFL2iLagKQeFterP0uvxFKW8miqKCaaOVAu
	34y9OHC6hQSnqyEyBil75bM/hylgCmh+WbLfpqagEXED8aOvtcgsPkU
X-Received: by 2002:a05:701b:290b:b0:14a:8df8:56b1 with SMTP id a92af1059eb24-1933bb42675mr16108c88.22.1792613078967;
        Wed, 21 Oct 2026 13:04:38 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d61csm8694937c88.15.2026.10.21.13.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:04:38 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 13:04:37 -0700
Message-Id: <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>, "Guenter Roeck"
 <linux@roeck-us.net>, <sashiko-reviews@lists.linux.dev>
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
X-Mailer: aerc 0.22.0
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
 <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
In-Reply-To: <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>

On Tue Oct 20, 2026 at 11:58 AM PDT, Abdurrahman Hussain wrote:
> On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
>> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
>>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_v=
oltage()
>>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in =
regulator ops
>>> --
>>
>> Good that I did not just apply this patch. Do you have time to look into
>> those issues and fix them ?
>>
>
> Looking into it,
>
> Thanks,
> Abdurrahman

Addressed all sashiko comments in v4.

Thanks,
Abdurrahman
