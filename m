Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288244;
	b=t0FX0HKp3kSORE+aagxXpdY7wBvKjy5lwDutQX1VyPXn4yaW4770KDzeFbnmPDAfVHV6
	 cpY5wKvQ/tTXkTZ1oxhUWqN7YGAmHK7mCVM8WltTmkHr8UDSU9NI0aUJ/wni5UppPw/Qb
	 gHlDtLdyzAZElpd5ByfCaBycet6u3xMyblkrkGd6yr4BH3sH8DygbVHYPRSFQVzxCmlHq
	 zkNy972v9b3XqaUjlrE76XCyJd8DhAxhtt1VUyhb6WOobbwKTx834Z3jHm0b5/IeN1uw4
	 Fmv2YdUDEGDx5OI/7wKhbDIfvxrBU2BxXNadpZap8FE7N3/htaGW5SGwwocsOCyoG8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
	b=lgdBZtnuc+PytSEW4Zj1K/lIFThiNReGK+y5QHs/q+2ScHMYN1ClUCtllgEwwKj+uw9T
	 4W0bHhuIVeTN/lSoSIjFyESzDgL1XTekCsbEljbQ+OwwMatTgugSrmc0STm2n2NmjdgqG
	 rynDBimYX9ac+F8JaHEu1LidWK+hGvnxyvNm2xEXqsiBcbY//OiGhu0zYHd3eAr54eHjs
	 Sc2u2BaNeZCJiG8N91rdnJvtHvhOt7lgAp8GAQ0ARC0Zc94KOVnPb/f7o4PXW4FIfobBs
	 kgPToNzo0kkmrqQZ/vvhxHNYmyyUxRl6S50y+UYlMriiq6aFtVm++cRhqHVJuO16wCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBJufFj1;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3C0606A330
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 19:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA3C0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBJufFj1
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d3563e50eso990381cf.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 11:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288243; x=1795893043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
        b=hBJufFj1Qm0MTosVUdix7CYrg67j4sFwqQyFeUWyKL4F+kVtC07PIqIXq9JSi1b3wh
         /SxqneO5ezTSU4dS5sJZmxsCesQ2MNcfN+fbVZwodKRErXx4tPyNfcNTBdvC8kF0EDjh
         kRXy1NC4XQbhXeZeGiSOq9X/hJp5jx3uoMv/b9kSgmq4DlwhTFJhEq8MwsvoM9hvLkD/
         AOJstP5SehIESYaP/IaV0+ZP0TibC6BN/gynE4O3BdgwCuQ3jA+MmJNl7UxWe3f/Z6zO
         As7O22AnCezZKZ2wHYOvjJDAij/CM0gYuzNitfSjb9RhWwES1spSjOXnMST009P1fur1
         vmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288243; x=1795893043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
        b=rUskcpya/dms4H2zN1A8M7+fR9SJ4fenr01mIXbYqPGMykP/7bvx/G09TOK81MBPag
         6C1S5embdP1WFskJQ6giaA1cKVrmhYkv8Uu9vfNNCkSf02NYUroq+wOM5bsH5eeLjW58
         gX/BOzBtpuCdeqj/7V6e52gk64fxtc+I91hyciyjyolCvxMuQ7DDg0rReOG/r2ivH0BT
         8IQZcol9H5B7Vk1kD7umf4D0eeZtPmb1dPVSrm0sAqwxdcDFhuQ+MnIG6RLea27QbBUE
         Flwdp+2WARs35e9S7oUV5rVKAg79COUNCR3qzHBP+FIdvDn3JY8G6q/OXx+UWblUWI+G
         ECow==
X-Forwarded-Encrypted: i=1; AL+hErFsGuQwKWMyqwPvdGiEwGtQp9/TBsvDCVCWPCOsXOVn51XtOMssWd3V7xFNi9hgGVLmaHwa0A7EyS5F@vger.kernel.org
X-Gm-Message-State: APuU4Z+2hOUaj2hh2jrOeqfK5Q4kMxtYpQ5Nz/mabpMGn/BVa+euGWMr
	Xd6uBUgBC7/vQPBvIYYNH7gx6B/v7FFdzIwHm5sbY/CdZ63AOFW8wtG3
X-Gm-Gg: AZFdTZcuvB1U0Hdd6AFzzj5NDledxPy6iRJ8e6vNvwjrSU4g4T1kGwFph75NZz1ufkh
	z4K6nsxjpo3BMK4gtVOciN/daRqdO9karH+LAC0Q1YCKrkik0gg+9jmZ7oTyB7/fubdLh9vKqvb
	f5mcyMJLwtLQHupXyMSeU+f7UmEANfbZnO1VClUvJy57CxktGCoG/TFsvU59ajPCK70JVBWuls4
	vmWRTvsMawAKBCjxVSfsbXC5c1fsQKtqnvuRrnHq4xXufOdSE5ucnu/22+K7vwWU5bffA7ASKVm
	76tQjiXVlsJSvUrChJIO4GfQI8eCb9WQfNDQgvNdEVTiXtSLwaW2+2g8XmJ48nC0Muggl7GSoXf
	rQy+iD2q6OjQ6sor1wnSItOZTU4jrzG3M0Q/SJfM4oeH8g0GBKehfG7KWoAOrnkVEkbVP7FpYFU
	87Ov/3C8UtU1akuaPiC3a1q9q1y0bKxadV49jyta9Th5QRmT1GPlW7Nyfm4BSkx5OketghZTuKL
	v8Rrg5SSh/I6yEYnUB9/cP2n5u+BzVD6cOrYkwu8nwmCk+XhEqp/fQcbMNspqd4ulkZBdkiT2Bt
	TsAMpc0ChQg00aT8OKq9jEBba7B34nSiNMd/Fk0w3BnD5nfC/h/8LezstrTnd7j/6T4nK+MD4A0
	PE7OYXvl8H9IjwqFs/pjoUn22o5uFC8V/uOq1UAK8Go9W3urSg7rJ
X-Received: by 2002:ac8:5c95:0:b0:55c:8dc9:401c with SMTP id d75a77b69052e-55d76ade97dmr125384641cf.70.1795288242646;
        Sat, 21 Nov 2026 11:10:42 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm55854191cf.28.2026.11.21.11.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 11:10:42 -0800 (PST)
Message-ID: <af0d5840-f025-4791-b026-139e4e5f490b@gmail.com>
Date: Sat, 21 Nov 2026 14:10:41 -0500
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ov13858: Add device tree support
To: geocausa@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sergey Lebedev <lsa.uz@pm.me>,
 German Pablo Lindo <germanpapulindez@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
 <20261018-ov13858-x1e-v2-2-cd35434cfcfe@gmail.com>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261018-ov13858-x1e-v2-2-cd35434cfcfe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 5:10 PM, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> Add an OF match table for OV13858 and parse its firmware endpoint at
> probe time. Require a four-lane D-PHY endpoint and both link frequencies
> used by the existing sensor modes.

[...]

Hi George,

Tested on a Surface Pro 11 (X1P-64-100, LCD 5G) together with Sergey's
power v4 on a v7.3.4-based tree with out-of-tree CCI/CAMSS & camera DT
nodes.

The sensor binds via OF at cci0 bus 1 (0x10) on csiphy1 (4 lanes,
540/270 MHz) and streams 4224x3136 at ~30 fps via libcamera v0.7.2.

A few notes from the X1P/LCD SKU for a future SP11 DT supporting the
cameras:

- The rear module is mounted upside down on this device 
  (rotation = <180>)
- Routing and power sequencing match what you decoded for X1E/OLED:
  IR, rear, and front sensors all identify on cci0 bus 0, cci0 bus 1,
  cci1 bus 1.
- Rear VCM at 0x0c on cci0 bus 1 works with dw9719 as "donwoon,dw9800k"
  (vdd = L16B; focus_absolute shifts focus) but it only answers when
  the sensor's DOVDD (L6M) is up so dw9719 times out at boot unless we
  keep L6M on.

Tested-by: Haipeng Lin <jimmie.lin@gmail.com> # Surface Pro 11 (LCD 5G)

Thanks,
Haipeng
