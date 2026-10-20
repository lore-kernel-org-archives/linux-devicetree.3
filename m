Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493268;
	b=iK0Ny8/E1hzTm2mj72Zzps4ciCLtk3JmUxVFsLalQXYZvGBIBAmrd4PpjvqzKtvqjB37
	 zeAdZQJ25eIH7mTWdHm+diRXG/XHpjUsEzd2tIb7SQHj6lcpAaZElIVR7PmV9M1iUClg4
	 u2xinvc3eZA1j7PP++cOlGqZwGjBQy8hmKhl4i1ZYcJvJojktUX5xfkcj9z6+keJbhw1y
	 OXxbQM9+9QS1RHFAderiPwjpSP5gjdNtje2uBOqSk/5RACYlFEbb/sETU6J56vkYrSbry
	 a2KAxFOoCnFYCICgmX83PZlJ80ZSqFVaNRUl+/FntumXdN+GJZhgjOg7+YCzJ83haMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0yRGXMpxwUTECTA0OiqRhmW1BI9DpdkM0ZTAbE3p3cU=;
	b=yPA7rdWN0b54z1Id3aNg7PGNmsA2i6UEG0WI1pxx6O2PBeaH+nGba/snVWaug7Qy6nF7
	 YMcjO5ECXx/uXOV+Lc/7DoU2IehKoiqxS5zHkg6qKj0/vPt4h3LT+vbyc5Mg8Clin5NwI
	 LvBnWW5c1WfZeQtpYQy9OjjpS6KLwH8L+r6dAIGl2GXDRkl61lt9GstNn/3ifFWCOlZAo
	 cqVdun0bqFNIGb0x0Bc+ERX+JbyZfEuOxoZ3ZNpNDW5dlxq4r+1ND0RLcN2Ewk2B9KQQs
	 OXgncvwyKM/82ZVJAesKwgbLzKIT6Cy0E/J8ch+bUBU0RvNJtz3Fpz+cKb0cjzJWABg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYrXLtbI;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07BA60A2604
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F07BA60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYrXLtbI
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-16079d54c17so202249c88.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493267; x=1793098067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0yRGXMpxwUTECTA0OiqRhmW1BI9DpdkM0ZTAbE3p3cU=;
        b=JYrXLtbIFCXTKM/cTXXtiv/Y8JVYTDcHoZER3E4Nb7kDkRKdFX6BeaNmLOtAhp8Ya6
         dLmJUQ9N+TLQu6IAzgM9uo1kat4SU24m/CP5JMk63ifOZMiUtd5u+l/4SmCZsFdnQB/C
         Ux/GMryUZGOW9Of4dphU5cwdq0J1jimF9NTg7mCFjzaOSdtGqEAHH6m8Lf2m1HVJmcrV
         X7eNZuW0cug5+Iah0mXS8gr6ICaNNHZPZSvQTdvscfco16SCSudHS8fQe875Q3JqMxwB
         HDylZVhAkUijOhUcihLhgbY2K7mOYthCTCihzwmZDhof4IfDCiYFlQYvYrOeBglHfBDE
         Dkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493267; x=1793098067;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0yRGXMpxwUTECTA0OiqRhmW1BI9DpdkM0ZTAbE3p3cU=;
        b=az7Pwaeg1aJ5P59DugWuYKlap1x3ASB/R5+t7OPRrwowCq+6R6BoQ6ysvGB198xM1q
         S8+XuMu5uJR2aGVQPX2Am7TeoYAh97lJNZPoaWAaazRz5p57xYTBhA059eHiO2JpjXJG
         Gw6SyAClQUTpHDJ2glmeAH4+vic7JsPK9gm+gIa4Mc1WiKgIRPSnQ8TeiTXqOE3kWUxQ
         fltnejVU21Z0Sc8jf/LOca+Zbp/1ebRtBxqpt5vNA66WQ9X0IFlLxKJkF3GJBGKY39Xf
         Z9HRrmLKeNXRuA3pKy2+bNowzineQbHZhNFDCZLPSV/t4ZqqVf+6wV8rU6UZjwb+wbRK
         LVxg==
X-Forwarded-Encrypted: i=1; AKwUvBydFEfhxqUVm/Oq/H+LeM44G/VVdU1UIDHJWfmnn2Ue1SVISUh30bLEOaGENkpEpAJKyxKxGwu+IkH1@vger.kernel.org
X-Gm-Message-State: AFq9FYITQD8uJ7uCO8/wno7HKg8nL33EztfdE9qw6NIgrEmgPTbDcur4
	vbh2yghDYnPgo5T4hbHC4JGmCXhArLT/84WHDwH7q1DtexxMvyJ6pu11
X-Gm-Gg: AYBFou1fhRJyE8BRKaeCQl7YvmBNrR2pa5E4N/7feK3x91Jap9GvrU0DYmyBXsx/XGw
	yJ5GGLkdNcZQuMXDgllSc8DpZtTXmYA52gk+dF3kU/CYjo2L1uXX432y0jAxYiHGn/3pABqxxoJ
	3rqRmAYtEsCqpuVgO41E8g54iqyoETNh8RBj3JHSbCoteGmSOy+ZIvV3u3CrGGm+lNpFeDD25T7
	DAuxsuSzAzwChO8n5uK2Of5K1OKuIAc4pP95sbUk7C5KS48pQ/bv2lrCumEJGkM58gcOL24Fk6j
	HvFgXTTb4xkbA0nn9PrdnfrmtELAlTD/EBYXEeJKUHDXgIq73UY7MdkQnPN/8obYESQMAwv6qHz
	QkIyhWeqJsQ7m5FZtoscNFYSr6m0+soqmIoAQCuNwFl0Psst4zjcQDWfQvm1WC29wy6bfXVL1Hu
	QXsJjQbb8da2sG6MR+w4UuBHnBoVpTSodMK2miXuqOdxTQGBKtVN8OqSzHmz0tvFl56qGT+gBuR
	fsmwOhUC3MmvBpb6zNhvcOht+dJ5OJasEqAgB2D8upOu1CHEbaa085TlfL2IeUJN8iKHkYj1aDb
	ZRidNnQ=
X-Received: by 2002:a05:701b:4511:20b0:151:2068:e81f with SMTP id a92af1059eb24-1851310a457mr14502929c88.27.1792493266915;
        Tue, 20 Oct 2026 03:47:46 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm34662429c88.5.2026.10.20.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:47:46 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH v2 2/4] serial: 8250_dw: Only accept a contiguous DLF readback
Date: Tue, 20 Oct 2026 07:47:30 -0300
Message-ID: <20261020104730.28646-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d992e18d-31ab-4937-8780-9c9dc423082a@kernel.org>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <a79114e72d029732db6764935dde12aa5d497706.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <d992e18d-31ab-4937-8780-9c9dc423082a@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jiri,

On Tue, 20 Oct 2026, Jiri Slaby wrote:

> Do I understand correctly, that this equivalent to:
>   if (is_power_of_2(reg + 1))
> ?

Yes, given the existing reg != 0 check. I kept the explicit form in v2
to keep the change minimal, but I'll use

  reg && is_power_of_2(reg + 1)

in v3, it reads better.

The two forms only differ for U32_MAX, where reg + 1 wraps to 0. But that
isn't a valid DLF readback here.

Thanks,
Vinicius
