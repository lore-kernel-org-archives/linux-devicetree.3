Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F41449B44C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679210; cv=none; b=pQPV8JXForlE/5J3ujIDGTILZgTUs/CinDEG4iATtEkWXbk2Vx1/pzzviF0K3yqQ+HyOrM5FMqwIHm/hHsGA6DW3p0/OsbZpBuPc4O28eHY9iyipylFWvtmMAKdaWQ2WaIh3JOvqeu04pmARbz/XGPOG0LXpJxZm3hHoFIvnDpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679210; c=relaxed/simple;
	bh=HvdkJ/FnzyzxhIRWpbHKeoBcBq03AZPrsWZYmOz5CAs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fgE3idMvSHTHzMicMlC4xuYACv42ZybwfHRntp5ggN8yl0m5cXLGr78jcHQg1lup86HeG2dndyZsTJDPwerkcljs8yktaU7cm0biZcUzbkFLZVDvNrAaUN9g/7DljUSexhLxyx3q4djPvrne5/9fLWMgwKbBZkcuw+VyHcRoxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBoZp6Rj; arc=none smtp.client-ip=74.125.231.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBoZp6Rj"
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-4a4492f5cd1so20276b6e.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789679207; x=1790284007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=;
        b=lBoZp6RjM/W3pmMw9EnkPietdw9V5oyHAbw2RFTBbE8VwDTG3lUNSNhJ+BSC1qWI26
         YYPCU4zo2lojubhabEmZbNuz2fDSYlyhRg3y4HuNt9Vng8o4jcQV0y9V1enmTKTIbIpv
         smxoZBNVWMRbFVHnE3vLVyqtikfxsY34Tdw+CPNPX0K10yfKqc+wJoc8j3LnzvYfnLjT
         75awwiBDm2DfsLz8O867Rv8O/QGdwCQs1lHgyr29JXfz6BB64pZEGJZfqlKXZnI9zTsM
         5T4OeItRruo9VYdSd+F8Kt1pjpZ0c6QlR2RO/RMtxyXyCd5t74r6rA58Bc36ozz52EZ0
         Pe6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679207; x=1790284007;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=;
        b=r0S2yV21E/mvfR0l7B7uoCzHfL9X4J79qlHX9/0vZXk5fYOHQiWw0uw8ITnGqB1tu9
         gw5xZPvKsxZdQzsucyIKGhvarTB62fYs4S6uVuqY7rphx9+W9T6bhbe8qoh2pLtga6W8
         wvH5GZD7Ts2n1BL6HW3v64YwKxm9clDe1KMe9qYSkK5nCVvmeM3asVo39DDYxpSEPt98
         qAgZsJIW+cEXhTUQkrKEt3BuqZfpsYs3/4nVAgPEaOo6Ir4E5+X4C2jdSMmO8OVCrlaM
         YCPZSQz7eQp4+hCF7mJsZfamVH+eED32ll/co3yfmpN/oX8ICT8QO7ZFSogK2tpso/M9
         qAaw==
X-Forwarded-Encrypted: i=1; AKwUvBwXWYk33dHBl5AK8+QpPoeajxCITppBUp7uKQ31D9rKyDDrWNp0N4kyL+2Nxk9WrIdZ2ObGqiWhky9I@vger.kernel.org
X-Gm-Message-State: AFuF++mTaE5d130YXpG2GTdy+6EvrQZI8pWs6oHeefvefgLnxeBZ/ZIi
	ClQ3XgVzA5DxR+qVIVMljK7BVxbdvceOlF+k9XYmBVygmKpaNj6ZCW5q
X-Gm-Gg: AYBFou1JceU4TJVdPExZFMHJZux3GrzD6sBN+an1qzl7E+1x7jrDmWo899fIPTeUtTP
	1rRmOVTwMuC4qjAKhQiM3rUqhZKzkKaYAsypqxV4Df3yErzizkAY7F/9U8HcUuZC/HvFDD4x6Ji
	HWb5ioQcAToJw9435IMVt6P6sI6A61xE0EMG6bxXFGmcIjYEoM2YWWpEoPuHSBoeo1RjK79zNpf
	YWVTNyF/ThJDXVx5S956W7vjHuA3CAxd3tSACOM2PyKesnz6/dg2+PMDzakS43bMDLghSm7rKO1
	JHk0x4kCcyVDP8iKp71iUSMwWqBxROuydhPqvlv2kmQEq630m5W+jTukPWnkUY29na8xWu1hC+j
	9ZIAndUHbNr3a/LwKGYtTYwgxDZlklY32sPV2SvxliFfNoqjE2ekL0wb+T79I3wkL5percvZaq5
	/ZD1Mpf39fEopYBYOqdR8Ms6YCVrf+aLtjUhMwWKHhvjdGvTfIYW/dK3ZkgPhEkT3rEaNIU3PoM
	vcij2yzqAWtp30=
X-Received: by 2002:a05:6808:c175:b0:49b:33c8:4b75 with SMTP id 5614622812f47-4ccf6a67699mr616748b6e.5.1789679207257;
        Thu, 17 Sep 2026 14:06:47 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6cd41d0asm3431836b6e.10.2026.09.17.14.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 14:06:45 -0700 (PDT)
Message-ID: <bc93ea43-0650-4a3f-919d-6e0272d24073@gmail.com>
Date: Thu, 17 Sep 2026 16:06:43 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
From: Ryan Brue <ryanbrue.dev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
 <aqpnpT6hU5Z0s1TZ@ashevche-desk.local>
 <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Content-Language: en-US
In-Reply-To: <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/17/26 4:01 PM, Ryan Brue wrote:
> On 9/16/26 4:55 AM, Andy Shevchenko wrote:
>> Why not add this device support into that driver?
> Please see [1].
>
My apologies for double-replying, I forgot my link here.

[1] 
https://lore.kernel.org/all/2d1b80f2-53f6-4ed6-81bf-e35c0a9efb26@gmail.com/

Best regards,
Ryan
