Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F7224DD15
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 18:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781980703; cv=pass; b=ANM04oN7P+5z4yrnhCh/rBLbi1yR1bQS71oqD4mk4Wl5Ft600oiFWaJZiLtAgNzszMV1mGCMy93DLaRYwecx6PNDJ5hg0J+WCLsOaTSdvCV2RFeu89PUiCuM8Xxy9teogDXsPzxSTDj/ifNucnx6XzKpk9/+ROnRI6eVQIN9Kww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781980703; c=relaxed/simple;
	bh=Aa9P/Mi41OD3Kc2puae9QfPotZPZLSNTcSaoGs68Ang=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mREIFUrfQxBkG/Y2jG8WwdhZ1OyJL1dkLxsvNdOWD1jw4Vh7WS51TvcN2CLw3jtEKGLZAzGq9lpdg+vPK7p7bGM+c1nFsc1YSpHZ16jic172gpgKMZ74Sr8+0v9kNDHAOcU3pS8o4ZzMEzwxptjHUY+yQ/l/GShKgmQC/Mu8mOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6uSUQNE; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6uSUQNE"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c88b7c92577so1369062a12.3
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 11:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781980702; cv=none;
        d=google.com; s=arc-20240605;
        b=icFdZZGnhTD2NQuZnhqvuzSe0GYSG3xWG+ct2I3xhqpw17qM5OXVk+FGePvqo0++XP
         rDzVbBfbM24wFz0V6OQbs22VcLEA6JW1m0e0hFiKK2pha58gUUd26kaFw7OvFu4h9C8a
         WCYWb7AwtqUKx0qMQs8Whg9JB0xJMpaT0HFOQ0B1xAd/SDQ3LNEi0zvivdjE3LakmNqu
         1t/+p0Devqa9JTcoD9AY15D8EvaGC//PxmWsf+0+ya/vTBCAbWjjnrqomd+g5mEgYGWA
         XgX/2sLTLGCMQF6fscK1BxfRoIFdIeaNrK3KpK9eDT9xrwrRrJhDtuH1TUszxZviv0JI
         4C7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Aa9P/Mi41OD3Kc2puae9QfPotZPZLSNTcSaoGs68Ang=;
        fh=2qlGzLN2Ca7jev+RIFcDs0GFegUIETq101KfAn/9ut8=;
        b=Fq1Bw+x1ik84XXcpzTa2lKw4Qqcz/94cmWPvymuQEFTW8UBjqTp7gsHi6CbLCmMzxO
         8HBPoGtR49wW+1mo0DyxnyIlcam8A9q2SFAmlo5qmDs7Xhvh5/kAf9gl1Ox52vYrDxtE
         Aa1LtaO/FhaGwDGgo6NSMzJ8EMRRkezTbzghrdiHfAyz5C9wgNxC6oD5yIQdGgFZLJAz
         jgHg3ZID7JFcAbJ3JDJ/dpz1dToeoh+Z6nzPBiQwecfB3pKKK75aTocnmmW7IMoxKMIl
         +kjOJP8Asn691SZ/OOXKPQhzPlgroyHKQf3ozl0is/I7T6kt9hAxKwbX3X73UrKwDyua
         EhPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781980702; x=1782585502; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa9P/Mi41OD3Kc2puae9QfPotZPZLSNTcSaoGs68Ang=;
        b=W6uSUQNEncvPBsnoagqtqZDCPPoUtHAmiiIMp60HKJKSStm6mpwRdus5IJISYJCGW3
         AZKnvf0WOzWXHBXMSU8BOcxVHbFuR+FPySF7LtmkIKBWJ2XlC1bNznBkIlaB26zV8ALq
         evy9FcB/Ujl1Y4PuaMZnJWeaL8zPbrRUcuCEmc+G1FdgRucenC0HB2odrExqHQ9K0j7l
         Jzi5EUtNIJFcbBpHEMH1sLSWN7F0MOb+Og6FvzTqCK0FuthBpnV8eAAn9Cn2WCdzyzh2
         GCaCXsjOrzFszdN2WcMUElv3KNPMn18zoCFlX/37ZsJ1tTcNtCKoM/n/VCoS6a+L1uT6
         oviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781980702; x=1782585502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aa9P/Mi41OD3Kc2puae9QfPotZPZLSNTcSaoGs68Ang=;
        b=fjicHSWatzStngCyuXK1dxdgzcxMAI0MpttAzQ+SpSdlDz0J/OplWr9KprbDbvHSdj
         E2QEI9074PWEMZDz7Pl6IRjd8lq1YKr1IbLnkyeuyWYbykXycUat322pKSSIGuNt3u9o
         FHGHYgpZirPp6PXg8THqmr0pag+rHjC2taNT4yPu6eLcGCWOqdgpJCEpEoX2blAB+D6d
         j7E8XbdM70FuzsS22DqONp4O8/58uU3B84kWOPF0Gg98aHz1O9V5TujLokj28nbLkhuE
         xGKtC/ju/4YyVwCMN2zEV71f0u33GB0sRT8noTelPlmZqM7lyOvfq4Ph6SRyyeRqTLcL
         1/ow==
X-Forwarded-Encrypted: i=1; AHgh+RrcWHgJuX01KdBStcImcWw1hlcABrG574935zu/qpEk2gennMaRlWXRLllwleDJPK3JUNjU9WB+7IV1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz298frZZrkAzFftJr5E3DXHr3Eo9QJYLbjA9//k9x9t9Q83J1Q
	GiEgMpS7FYJrqRy30r37I1R0W+ULJDZb0Kde4pkP3sJ1w8izbomxBfdV6GikS5Q9u7UcCp2yM4s
	kMd0ezROFIAvx+3ql6XED89Hw5I8J4O4=
X-Gm-Gg: AfdE7cl6urYEDvaFcm2luxfyGXtUpkxf2Q/BIK/CS6Z3b9sCOd1WwlCrZDT+3qExDj6
	UEnh0DhVdB0ROHSn4ceMpsjSm9dUCbxRs6Q7VvlUx37ySOz5PsLmJ31cK2YmOGr7ZNE8a3Olzvl
	gAeFyi1dRDZXZCKaDnItZjzuZsK6wCOuuLg9i2SmE+4Bq6WbL+1YRmLP5K6B0qY0c0B1uThCOlL
	IKnoqYuVcnzfUZW5/4u61Vwdfl2CHNhigLgCs3JtYR4MyYdiRy1uLGMpGmDySUnGP/PkXNOBsnW
	NhgdWUW5+EnUGdWx18aGrtHQpQiR6fU=
X-Received: by 2002:a17:902:ccd0:b0:2c2:bd05:dac5 with SMTP id
 d9443c01a7336-2c718f1da13mr85666705ad.19.1781980701844; Sat, 20 Jun 2026
 11:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613190957.654798-1-jakubszczudlo40@gmail.com>
 <20260613190957.654798-4-jakubszczudlo40@gmail.com> <a0e19dd9-c2de-489f-a727-dbc42e5b36da@baylibre.com>
In-Reply-To: <a0e19dd9-c2de-489f-a727-dbc42e5b36da@baylibre.com>
From: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Date: Sat, 20 Jun 2026 20:38:09 +0200
X-Gm-Features: AVVi8CcwN3JA29B8Cxd1bF8JqRYySlAWpmR-3qka3_VEtMqSg_tSpJ1FT3_uzkE
Message-ID: <CA+gq5Jhv_ZvESipg2AtRSN9ov3ALbOnUZ9yhJeM=2xBp7TtxBA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] iio: adc: Fix incorrect reading when datarate
 changed in single mode
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, andy@kernel.org, antoniu.miclaus@analog.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, duje@dujemihanovic.xyz, 
	jic23@kernel.org, jishnu.prakash@oss.qualcomm.com, jorge.marques@analog.com, 
	krzk+dt@kernel.org, linusw@kernel.org, linux-kernel@vger.kernel.org, 
	marcelo.schmitt@analog.com, mazziesaccount@gmail.com, mike.looijmans@topic.nl, 
	nuno.sa@analog.com, robh@kernel.org, sakari.ailus@linux.intel.com, 
	wens@kernel.org, joshua.crofts1@gmail.com
Content-Type: text/plain; charset="UTF-8"

>
> On 6/13/26 2:09 PM, Jakub Szczudlo wrote:
> > When device is suspended and it is in single mode then changing
> > datarate doesn't make it actual wait for new measurement, so to
>
> s/actual/actually/
>
> > be sure that read after change is correct functions that changes
> > datarate and gain will wait for new data.
>
> s/datarate/data rate/g
>
Thanks for that I will correct it in next patch

>
> The commit message isn't very clear to me. Is the point that the
> changes don't actually take effect in the ADC until a conversion
> is done?

When changes are done when ADC is in single mode the first read
after change are still with old settings that are not desired.

My change make it wait for new conversion with new setting so reading
will be correct
