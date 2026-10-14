Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1797D4EBAC6
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972289; cv=none; b=MnDcBDuCbMBUPjVKiOBm8QB5e4izShDo8cnTV+CflBH5+rhZqJZnX8oD1HxZEXJ1veqO8+bNp5Rhwp8Rmdsc254R9fU/M/2ewHhwjtJIZgqimPH8FSALrkVQAaEQ1gnOQBjszWhDvQGiyM5I5K7FXQqhbqwW4IR1Wj3rYd8AvVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972289; c=relaxed/simple;
	bh=xKoZbrsEpZl7WHOwhRzJwVxlIDXvatXmrwIqVWMRm3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNVtoLVz47q0gWMqHYnLFDKq2Z/jYGDcMIlrbB2gAKg/nDVIAbDjhTdq9yZWHn5d7Ee8uz0WzEWLpNEZRRyPGiNJxLEQAvFLZhOdxtxoi55mRV4fYKKqwJPabm2/yI3jeGMBYoNLFeu1tfKEMRhRNYlgiK4GHsn0cP4IpM+tKXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hYz70k6J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LZZ7I68l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hYz70k6J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LZZ7I68l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791972286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=;
	b=hYz70k6JOiiIfax/Q+3zN/ljcBnPqif/0CasS8tsPcPtKst5Ju0Aai7akKUEQqLzRs9hKW
	WtaisWCF8m9oJbMzjaeEbiqh7zRyrWUEH0YPKKWDNnkeTwx6wg4UcZ0o6xGaNMRrdgUr3k
	Rzu0zkNF4LJJxu3Pu9WfLwQt9KlLDFg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-vvNi-jE9OgW1Y-ZiNPRZxw-1; Wed, 14 Oct 2026 10:04:40 +0000
X-MC-Unique: vvNi-jE9OgW1Y-ZiNPRZxw-1
X-Mimecast-MFC-AGG-ID: vvNi-jE9OgW1Y-ZiNPRZxw_1791972279
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso8869415e9.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791972279; x=1792577079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=;
        b=LZZ7I68ldkj3iSwSrPBlqlAYfN1L+tOgruyR2PKLAX796uVuMKta9ndcpM4O0A1Mx1
         Jrh/KkTK7G55tFERV/NIXkgqGuIuZMJHiz5KVw/peJIlJU7qX/sDlgJJjq8kTxvXYpNE
         O13qBCOE+IPVyaIVilSKDQ3mLfVo7xhUWVkrAC8K1E6IPftL+X72ATJYThhcwulci9wJ
         spM+cBUqKCOhDE+tp8q2nCEt/fvn5sZZ+I0BpsYTRb4JK5oFWAjU3nfc64azqzAFG23v
         5KwGcnodHwaXG3sbG6YCFg1oZScI88u0f9U4UmcWP5NAlylbh10jrmSDYbxAZLHpij1x
         7v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972279; x=1792577079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=;
        b=rpH3E4R69Z74rZ2jiviFI/rEsftUztLUbl8A5NX3BGpuqkXO4wiLfP+6vr5vfam98t
         7s+TpJvxLhp1Gi15fWULLhjTIScK9b6N1MHHMX5p7f09JTCD05SSCM33jaM8qUUH4rOV
         kQMw1QkXx/qz9wfEZxdRz0ONwxdDQy+f0E7jDlmLwMt3jPy/NUzOjgZvoa4Y0N8eD99w
         QUJhoxco0gN1W+0t+RndnPafZnOmZdKHg+wMLifBGdTv/p/aFHjWP0BCn0knH0nTfv7G
         I8IqL8Jya4naI9+rcNYidpMgAUOfsaJP02Bqc3uKWv9ApLco8AKFaVfV9Q5zHW+HNUx3
         4Wfg==
X-Forwarded-Encrypted: i=1; AKwUvBy7JGyVw5Rf3A/3aE6tMqpWJD44dCIiVRkyf2jONleYDem3VX2xSDmOC/4Ec6EJaoZ9yf9ExAoN4EfG@vger.kernel.org
X-Gm-Message-State: AFq9FYI4gEPVVWUTF+LYgjOfU7lE5btkHTlZQwXkwTrB0vZI9fBys4PJ
	7fEGzHH6y/qlF/caEiabxTeLwKdGA8+EYagWP6lrNkXtWArAcAUVo8l/lOYHCyCoblNCIr6CNHZ
	rg047b16wkxlg0tyZsnnuAnTqY7AdbhfhYAvP4UvV1sNR0J2syLGBPqsrFX1vDQI=
X-Gm-Gg: AYBFou3VBA9U18+4prD3HbNcyycpyJ3v5ZwaLSmCm2/i/UWzSA45+vQpdmmpgVuLxl5
	eYJDG6NyzrCrQWT1Hw1SXRolcQLLV/3ungzRVxziy9CIcN7ghLyinoFo8yC5CS+9iWzmMh6T2K6
	485Homt92P1JH1OxxXNnq0LpHv5R+M5PYzDWAU7PXiYh2ZbK2UgYjshNGBCL39urjU5BiHby3/j
	+LMX3PTK3X3Gd76/QA+9vq+wVUR0zPCuMDN4ZuQRmyUbveDQNGbF2Pez2awFmlUVVLQCSsefaoV
	Fv/i7n+PuBKOq+F919juOvdmdZBiXBV3a7b5cMqo3vdaGbJr8ai809encNgWyIvG4Dx2amtN2Rr
	0w5BzjLw605qqtnlzzoqdhtm4O+yyCHbNEMshXW+bpJY0Z2G+dL/2s54679RuTFHwa1hs1rYEiw
	==
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr101285105e9.33.1791972279231;
        Wed, 14 Oct 2026 03:04:39 -0700 (PDT)
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr101284465e9.33.1791972278755;
        Wed, 14 Oct 2026 03:04:38 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm419838595e9.14.2026.10.14.03.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:04:38 -0700 (PDT)
Message-ID: <3d3b9f10-e3e8-4d50-b543-0d451cb07598@redhat.com>
Date: Wed, 14 Oct 2026 12:04:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes
 after the MAC
To: Aleksei Sviridkin <f@lex.la>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
 <20261013151233.2474217-1-f@lex.la>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261013151233.2474217-1-f@lex.la>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 17:12, Aleksei Sviridkin wrote:
> On 10/13/26 09:53, Paolo Abeni wrote:
>> The above looks like a significant amount of complexity for OoT driver,
>> and I understand it could be solved with a different kconf?
> 
> The PHY driver is in mainline, air_en8811h. Only the board's device
> tree lives in OpenWrt.
> 
> A config change can avoid it, but it is expensive here. Building
> air_en8811h in is not enough, since it loads its firmware with
> request_firmware_direct() from the root filesystem, which is not mounted
> yet when the switch probes. It also needs CONFIG_EXTRA_FIRMWARE with
> 144 KB of blobs, in a kernel that OpenWrt shares between every board
> of the subtarget.
> 
> Is that the expected answer for a board like this one, or would you
> take a smaller change in phylink?
To me this series still looks too much churn for something that has
alternative options. I would like to hear a 2nd opinion from Russell,
Andrew or Heiner.

/P

