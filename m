Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460483;
	b=x2JeLICk/0rHVpRWPEtvtTOhM7Z5SPkbzjeCfSyn5Kb5UYhXla2Ums+tr2nW/6NjLqVy
	 IFhuCnXVy+0tLqYFS3jpYND9KX5Rgd+m5b6d+I21g9B9eDW/x+uWj3kKh3OgohKLXyHcw
	 oyPDDQi3LwyO3g64UnxMAjErvim3kyTLOVLpIcke8zYA+pnUopwZgEXpRfIz8rGkNMv+h
	 ILNe/wzqRqYGOlz4iFohTa6eye9jKh9RydCDw1VwchmNLwOalWGZSTv3xzmCz3yDZG4DK
	 UkkmHau4n6PSeKB/3E7UTlexHQ1/TRyVhFaFF4NVFKNMndwoROcNa2O2IhPHNWk6lPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=;
	b=RNLJ/wnKK8Zr1tDZztlIhpgnt9x2OrHC0AX9AhVidjDxDsFoVR66Jqb2h6z5D61pqR3i
	 oomakCCIscbviX+wK4TI/GA0FZkM8F2b0sx7HRnu8iwFZkDTt0xBzoNGMS0U4ROpiTncd
	 S8AJs1nun2aDOnnBPAmFOGws2tRVWNCL65Zn1wcvmAVbv8yL12lPbAX9AvYgOu6F6h7Xk
	 12/WW+2kM47TID3/LotLrROw80aBXJpr93R9LokljvJGPNBlPcvNtRx6QEI8N7/M2igxU
	 un40c4/qE43pdJG47R/dIzbLkMIhcg2cYlYdj1JEh4m7x91VYIjTODdDy0EVd00GQ2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QczcF95R;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9C6606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D9C6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QczcF95R
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-17bc533fda3so3192441c88.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460482; x=1793065282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=;
        b=QczcF95RLqhKlbaXAMGeaN1AxXkPoihUjRzwJVbthf4GI55+lJ/tDi12lth6tKOKgS
         cTy0iOv691TwhqWhbFHkeMyngO05h40ol7fVkPUdDShmb/rxRNfuCGVl2BfSZK0Mttn5
         5MixBOFNKTY/fMstidcQZ3LVYufFQ3YWrTq9F4AVmrDg46vLcoHy8iKXwR0XM6Y7sGKp
         1IDs+Qj8URbMRiTauduB8UaIxqMiKMsUanldJd5gaRaB/+PvGIjPk6j+FFOenOkaeN+D
         eU9fsubgP6AxXusE7HElU6ZprcnCC676R3EJf2L6aT2bUSjW/DlIBnLUfV3aBygH8Bfa
         DeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460482; x=1793065282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=;
        b=banO0ahg3cDa6enOo2hpgTas7lU35kIsXvpR8Jb/FnOBhMBuW95dmcHViitS0O+M6M
         t38tuHnUo52eMxATJQmuqWu/vWyX3cgOPphNxzeTV5TptFgv40FLQY+UJw9tzlv/XBCm
         O3e6tH0ajV/H83TYshPN8PAKMN1c/MDlMqJpXmZDE25j/KL5/xvZMi9cwftzAltxZMFO
         A9hoYdPucy9zM2lksxAHoT6CH1Bc+F9G2WF83Imcyu4Jwazzz7DGHYGeZZpUSBZSfcHc
         omSRA/M6jW+EKo7Fo7Fvso2YXZsYD+G19KtY61FOns1/FqZluejIkG0BMvfu0xFHGgSu
         w52A==
X-Forwarded-Encrypted: i=1; AKwUvBzQgPi5nH8/4LKbhBgJPmpy7rrX/pJvh5ZYJ5CQcOCMRSK0jgqsxElKM3la2OxyhcVewvpfBiEyN7oh@vger.kernel.org
X-Gm-Message-State: AFq9FYJUfXk7PQs9RheJQVmoOvWBkXAwM87wHqLqKXoUTTApFr2/cgJo
	LsXs8+Z2OwJqlEVtS/yrilZC6iPsMqKXpldFa9uVAU6IAVdfTxEV9aJc
X-Gm-Gg: AYBFou0ocr0ggdJDG9+0w9i+8ChgGMHgRgeldLrygOhHVcaDw0usyae4u+tGeRdc6a8
	IlEwlqRWNZugp4y++kElbSxVOoDRyGVde3wYfwDId7NGzmdTunMoALGIEtalIWizrl7wkBU/bOU
	OySje0ApAun9iVvRFa1JH2Z1OWuO3qUR/qLcs+lCx9JIBDVZ5UHcLa/QbGKIwkVg1HYUIU0o1IS
	wcCGtsCoXxfIrU1gz8/+nqhHidSIyDReteQZznIYTa0lgu3nTLjvJR3T1G1jxBqdMp7BWA4fpjX
	Eg+nN64rDKRnvFASqWg4wWFp4i+dnuiKYr/WIsFZI0IRWfYcnJG8JdTI7peZCyEA05ljXI/PQ8V
	XmQltulV3q8tj+W6A21MBH60a4vX3mungqnWjeWpz8Z/vKp05ZtLhU7RNVY3O5P2hg1nB2Fz9GL
	Qx9vS1x6a5p21fRXpGo9cWXiIh4ihU0Vvp8U6kKwAey1NtHqOGdmcoQh+qtF0h5Xo1CpF6PD6Dx
	6j47V45mgM15qEx9XYI2g7PnpbcKh+iTbEBnJopWvvP5bk8t5vCGYHeirUCydVbrH/hOQ==
X-Received: by 2002:a05:7022:ea50:b0:143:2968:564c with SMTP id a92af1059eb24-18512f1e993mr12640931c88.26.1792460482105;
        Mon, 19 Oct 2026 18:41:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c2e7bf4sm28816461c88.20.2026.10.19.18.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:41:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:41:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 6/8] watchdog: mediatek: Add support for MT8163 TOPRGU/WDT
Message-ID: <589d0ab4-46cf-4b8d-b4b3-5519dbf030ea@roeck-us.net>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-6-f2462b2d2437@protonmail.ch>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-6-f2462b2d2437@protonmail.ch>

On Mon, Oct 19, 2026 at 01:40:02AM +0100, Ben Grisdale wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add support for the Top Reset Generation Unit (TOPRGU) and watchdog
> timer on the MediaTek MT8163 SoC, which provides 15 software resets.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Applied.

Thanks,
Guenter
