Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75C23128AB
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469097; cv=none; b=HjO9knLEST5nuTNTnTjPtyFzatgIHDxU1V31pK8VVQm+INFfs1RiuE+HJAvgZX+rlnmL95Eka8uM8IFlP+sJ31u+D3SOCadXAMYo3X1H/STGrqIrLBRZNntZGOq6TbmEtYcH+6CBxpPjGAGYZvwyS2QvmAJ137WzfaVrcng0pkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469097; c=relaxed/simple;
	bh=w1gV/a4hLgsRMDjpGdpYm0XIx5pw0Hjh7pY/3xaSsGg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=malqGTE1fulfl4LskdanNFKZ8DFWXNH3m9Gte/az1EJG+h2Nf8OzIwuEPRycpv162xMiDV8N1cj891g2EmFHDuSYDQCI4X84TV0G3PYBY9jZRpqM7kFek85jeLZm9l1rtw8sLgGBfu7lE+8eNlS8u2Um4ehhET+DS7RUXLIbys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhbf8LCE; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhbf8LCE"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59d6e44e5c8so2153560e0c.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 13:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781469096; x=1782073896; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZuVcnii6ci+Yt1LSi5CHR+55B3RGmLUfp3Gn9RgYgc=;
        b=qhbf8LCEPPwVWlBZRFDQeZaovvGl3oudWWwsUV20bvWqlOt7LKYYEum9+Qq6t0dPnR
         Yx8MqD712paXoeuFnimQuxIXyb1jhof/UtJ3U3LojvQeLwbL9p5dfrSF6SMdR61mOnqE
         GT9vaBkFI0+o1iFng4cx3mI0TjCRvkdeqb3vEXUUQpQrHw+xVOf7fr22ruuAoQ5JEo6k
         IOydAimuZaH0zeaCBLkXD0zUowJmbC3pC6aNGVFDGoMacUjPsWWFkVceVWTjJGfO8j2o
         WCPLYSO2sauEpu7CnqiBtMmOT0EZtNXfCitJCboCePsea8kskvBN8geppn8zMnO5j4B8
         3vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469096; x=1782073896;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZuVcnii6ci+Yt1LSi5CHR+55B3RGmLUfp3Gn9RgYgc=;
        b=WxFc/+x92L1wfGPkkZmegG2rC0DuP1cRf3fS1WDzN1s4OblEKtB8PTfZ9hcY+kdNVP
         DCQK4O1clsZ38Sxj11glkFCInciS5iUBPAjX2MKEHfy9XlizSxrW4QdaeKVBPjf8Kci9
         7PLop+vyYbEk0aA9hLEEb6fHNF+8w/V/fBnAUq0tH1nhOSDxXUH9OjIcK3NV4XZQNRLA
         SMlN6jM8gOs/WcZ5PCBWeC0BTDJJlW6cb6e7d6ewTYPURSBk3bwsb/poyQHTMskRgu3i
         efF46ptvPXe0+C4YCAm2OTks83EfQfRLrhrj/RaZgpAn+zvEp0nWBSjKjnwyl3lQQRPS
         d6Zw==
X-Forwarded-Encrypted: i=1; AFNElJ8QgBmRvsAMNHIJkmAb8MU1Bz/mpwlqYn0nYm6VTcaRbfnHn0Yb21Sr42ZxuBNt91y0FfwGIqN7dXLn@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/bKBy01fyiRUfIRoQ3lYl9oFqSH/pvTvx8dFYvwyP+amk05u
	dMsPzvZqiHkcdUhD8TeHWEytop6oUFqSkrlCtdrYYjdeMjEd9WoZLwAI
X-Gm-Gg: Acq92OG+5m+HwbNx1cCWumT4TALdnSNAXP+Nm844sowcoMJdWWafO00NfDNGbF8ozMO
	urME5F066S1cRRm97eYR0l8fRpUzHgfUWj1mjsJeClJTTuXNU45QjZopmglrMOWI8ZJJvZe3+Wz
	3+NrLtL7nfumYJkjM7qHIGOQ0T2qa/LScMiJoJpt15rU2rpXGGbs/+L9EGxZr7dhlG4btrKNk5P
	PWoyfyaFcGX0PnHPrehtue4ku8GRBGO+YB/rPsr52B919/zJFwJjP1H4FWXIu6AxxwQN0q3Teup
	5/7VfyMiC2lutk5ysc8ihds1ajf6Xs5rSgwjg0aqwNeTaqZ5IxtJDpPjrkV0n5kmcadzWgXtPT4
	WaTgPovCOvEGWRKPzbKKTYxV1UFWNWQcNPqpwZh2vrdvjr+O1MerYwWmBScMXjafOgZC9hoCuhI
	7KjYg6Z1ojJZJwEA==
X-Received: by 2002:a05:6122:2a4a:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5bb6bfdf85amr6517590e0c.4.1781469095733;
        Sun, 14 Jun 2026 13:31:35 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901f1d1esm2052674e0c.18.2026.06.14.13.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 13:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 15:31:33 -0500
Message-Id: <DJ9237FZUTWD.1KEOZLSW5AQYJ@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 4/5] iio: adc: ti-ads1262: Add calibration support
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-4-894c788d03ed@gmail.com>
 <20260613145055.06aedf2b@jic23-huawei>
In-Reply-To: <20260613145055.06aedf2b@jic23-huawei>

On Sat Jun 13, 2026 at 8:50 AM -05, Jonathan Cameron wrote:
> On Fri, 12 Jun 2026 17:46:22 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Add channel calibration support.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---

[...]

> Read it into a u8 [3] and use get_unaligned_le24()
> That avoids us having to think too much about the bits that aren't
> initialized and static analysis / compilers having to figure out
> they don't matter. I general it is easier to understand.

I didn't know there was a 24 bit version. I'll definitely use it.

>
>> +	if (ret)
>> +		return ret;
>> +	*val =3D sign_extend32(le32_to_cpu(lval), 23);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ads1262_write_calib(struct ads1262 *st, unsigned int reg, u3=
2 val)
>> +{
>> +	__le32 lval =3D cpu_to_le32(val);
>> +
>> +	/*
>> +	 * The calibration word is a signed 24 bit LSB-first value.
>> +	 */
>> +	return regmap_bulk_write(st->regmap, reg, &lval, 3);
>
> Similar with a u8 [3] for the '__le24' storage.
>
>> +}
>> +

--=20
Thanks,
 ~ Kurt
