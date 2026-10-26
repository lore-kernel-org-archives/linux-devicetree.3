Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008813;
	b=C5IeysfWesi4MAgs3QYOjpLMWkhuQAeZEdNMWwNOT7O6Y15dQvs/E1lqs+F40ok/VYhs
	 bsuNIpZCLgRQS6r1QbQklhwpMyvyfKml8HnoN8Z4/vabhp2xKaHFRdDNy4oBWXXh1SRu7
	 1xQlexoow2r63h/axEujXAWwLmiR0T1oi7lAAgf2yMd2Fo67Gg4mVpBY3728cDeJ3gZgr
	 mKCWTCGruoAZMOBOVz5PRJcIn8LtAogdpvuzWYzuKgm+kBTgptHQGnSMI/ir5ER8+1YiX
	 DuzibALDP6M8/vsarZzLuTaMyZP+cHENDTg0xqM0KvQB5Ms8SmBdr+rSjzWUbn2nVSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JxMaWVtUV0uwXPkwo9Mu+D6xSwARN7kCHxKOQvkbv58=;
	b=36z0hr+K/HEnaCSgAECEvu1HN20MoKJzFvPV2wuFhTXJVkaHsmFJcXL41F9750dAi12K
	 4A5vg4v8q2VL7INIVJ7gmcT0aHj/UQfjyxq5O8Y7YzqLnoUfKLMYD0+9VwR2UpXa0JYBr
	 hFPQE9+I0HTRat0TN1kZvUt9SMF8r7sZlN++0QFFTlxLMJso6EepPbb9D8ceWSZh1b8GI
	 I9nTJs+OtqbD+QaP4JMp8KaR/2+QKrFOV0dcedA6rXJbezmhYkKfJVEEeemzPUtN/xfmT
	 nTiSAmBilEIKxZbyEg4vVhwhL7xWyJxmFbolW2WMnOqajGW/jMlMpiwNC09E65cCmCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rO9H/JJi";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B48606B46A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B48606B46A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rO9H/JJi
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a215e64962so19828335e9.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008811; x=1793613611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxMaWVtUV0uwXPkwo9Mu+D6xSwARN7kCHxKOQvkbv58=;
        b=rO9H/JJiNVMoiSub6cjqmC2tT3lU2Gip1qc+hCn0V192ZnRtIPYPHh6ywTdpoL67dx
         u0E7cWwXQA4Ww74WYuBC0SfnqVTzEJ/B0co6Fl6RmJkg9VK36ePgDIKRuio70j+Kniwj
         9WtODl4KfhStM1ILHf8rjV8fU5A4nVmr3T+itpLquLk/w7elg/qrpM255BdimiA3QwTq
         u7mjNK/St9prrUNO6Z8YLgWR7PUBI5gbq1c+4L6Gv5QI3VPRBcdpc1nd3ENyFsQhtl+G
         I7hSH5iUvaEl3Nl2u1zHrqlSOxmu0mqhcre13RDT2dxEFypZ1EKvE7wbxXIStUPHvWYq
         0mnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008811; x=1793613611;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxMaWVtUV0uwXPkwo9Mu+D6xSwARN7kCHxKOQvkbv58=;
        b=Qjn7OK0arzsYKkSinlYcHiSbutxEv3w4UCH7EU1lytOKaeR+XLhu3zo9cW2GnTUpO9
         ioC3vYRV9UxcGgqjZI0BRXylGe5r32+4WCovuEtUL5nZXZornxcJimKoejpikrhP8nKr
         rDNeIavMf3K4lLiKGQ8ELAtRigC3LXfCkM3WX/Sj+uTC+WmU4MKy/rwmXMKe5NURHRSG
         og21l8HE1J7dCnr9i9Zj6GbV2NQF42xzMDRawdBlMgjCS04BS8OY5kaPo7OeEG4e4HgX
         WLsBwmICTZAuzQVvDy29qlLfKkc9q+0T89PfH0QaxQSK+53PhFuK2qAOykJR1ttXEZcu
         7PAA==
X-Forwarded-Encrypted: i=1; AKwUvBwOfCrvdzjT/NdHrsLf4TICUXjTQpV+hzQMYAPGRDuyxBAIZBIeHncXsJhJTUM5uOQzYmiepDvSmQ6o@vger.kernel.org
X-Gm-Message-State: AFq9FYJsGT7bYLsdaFBXlx0VXc+y3kaoH3ODzP69tkZ083ouIP71lkDB
	pkxG5WF01vesht4kcoEYGgaA4jIcIRX1Nv21sCvgRNF9fs0NEuI37NX1
X-Gm-Gg: AYBFou184ufroj22ngTKVycu+nWDDg8YY4c6/inzcsAwPr9O3Q9+qF4JWSGMFYUHWSB
	5dNNYID3tqgBNXGwGvg+ATdR4XhbRbupqxp4bp1mUDc6j01gLqzigy81+Jy7pwVwoR7rESxlJhM
	MxBQxuCgq3jxOqar4LCk9nSIMrPZ9z0qgYeJM8Tbn9JOmPVnEx4ImGOwfoM2sIJkTGGVKCB1DtY
	3ulhrxv70KaK+H1OWdVhflMYQXASduCjjNjUl+Icp5UijSesz3n3uJlI3NSWAfQGM2YIpf4yOB8
	SYadexnKtBnn1JXqsbYw3uSoWvJJsdYU39o9fVpLiQ5ELkHSv4U+mYZND4kFB+IX01niwx0Oc97
	ZL2j9nSZbHkzg98Fs2TZ98nBUn3ObpaexKUGk+TD1IbvACPDHrjywVuiVU4IolQOA4wtNz1qseS
	mXe3rLPczEFqHNeP4iJgl1q4ddATOiV8rWVevjYvxah63cNufX/cDUhdUdC5UiAM9VMoIb8YhH4
	JPBPx0JI7p2lQX1h/rTfgNhUOrTF4ijU8sqBJaFoH+zkuCcMJcIutqjCiig2WIgtoxoplGqEmef
	fFZOAr12M92LVUOxbmL8f4iSKEFMEvL1n1YkLR+NBIJd+3MY5ZHYoNmoDZxYXZCKbPIHY996qHs
	yCOl8F7737FzlMhwQzjqqA9GFLFLaitAJMGZ4ByORcbBUoyhc/TU2Sn9d3h8oY8Td7dDc9bEfto
	9g/h1HSXpsUe9I1WKg9EAwmvzzaBoVdMtrZ46RWWYfKLSdS+1P39+0G3Wwf+e+3g==
X-Received: by 2002:a05:600c:3d8d:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4a35acc2edbmr93717435e9.33.1793008810377;
        Mon, 26 Oct 2026 03:00:10 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbc718sm154241835e9.2.2026.10.26.03.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:00:10 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:00:08 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, "H . Nikolaus Schaller"
 <hns@goldelico.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Message-ID: <20261026110008.00005296@gmail.com>
In-Reply-To: <20261026083631.48406-3-olivier@mgcrea.io>
References: <20261026083631.48406-1-olivier@mgcrea.io>
	<20261026083631.48406-3-olivier@mgcrea.io>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 09:36:31 +0100
Olivier Louvignes <olivier@mgcrea.io> wrote:

> The X1600's SAR ADC has four auxiliary channels, each with its own start
> bit, interrupt flag and 12-bit result, and none of the touchscreen or
> battery engines of the JZ47xx ADCs that ingenic-adc drives. Add a small
> driver that exposes the four channels as voltages against the 3.3 V
> reference.
> 
> The registers are in chapter 19 of the X1600 programming manual. The
> ADC clock divider is even, as the manual has it (an odd value divides
> by one less); the vendor kernel writes the divider minus one, which
> gives a slightly faster clock than it asks for.
> 
> Tested on a HiBy R1, whose play/pause and volume keys sit on channel 0
> behind adc-keys: all three read and report correctly.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---

The driver looks good to me now!

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
