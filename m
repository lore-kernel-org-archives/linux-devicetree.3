Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFD737266E
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 23:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096233; cv=none; b=grXD552X6YuvSP7vIcW+1oH1CoSfBHWcjmZPB1EKHC0bR3ZCOkQCco7snPD1emWPLqAzvuQQjsOWr5uo5G0U1cH+/y+YUp3p42XWiv22Vg0wY+NZ+grtGZYKie3H9UfQ5FIHRIdpWHtRKR4uoimBx63L2ArSEjn8Pg69Qf/rolA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096233; c=relaxed/simple;
	bh=zO5mT6oWpqELdaeWSbBSQLyWiB2W8y/nhFWMCKOQKHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYjCfSbl1vMFFoaI0JvaoUBAUdi46gTaKR0a7mwWzSLiUGZJDvuznibtxf8811S35b8GiRoZVV4HL10orxxaP2BsJckg0OaF/IfivunYglqZl9n28Vu3QkyP3hCzJpMYxx1uIpB4CxZfJZYDoaSn1K7DmCGrEcU27udjkSAV6a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcM2pwmc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcM2pwmc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e7109321dso327154a91.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096232; x=1787701032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=spsLyqllbdv8uoHDIT8SHj6pVVShs8FwTfZLnA7RIu8=;
        b=TcM2pwmcrxOn/kVAafraZhHLAiM3wJR9QthSqMhHTB5xikRxzJYkIeHCGlr93aZ/om
         bqunCi/QtUnkxJDGkS9vCGCZdrjiOTrY12XW1T+fi9zwbnQ7Sm58uT/JOkl8Nfi7ok/I
         e5iAsm3YJrPoZtYk1cAwpEkg1zGvcR9w5Q9pbZDD5TbqG6iiYvVh0lArqi/AFGrvIZNF
         zEeoO9XCDkUWy6ZWIDPsn4XS6RHRXE2ZZbuE5JOoZwHM/l/fRNYyuJjHl/z8qpgshaLp
         yZ4MLN0cmwcUMg/TmQZb9bjIA2gg8V3rcEpK40GWRBTSPDUjuBaCEQor747KleMfy+d/
         zPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096232; x=1787701032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spsLyqllbdv8uoHDIT8SHj6pVVShs8FwTfZLnA7RIu8=;
        b=eyRrM2g5GfIJ+4e7Ntb0jaX+bDpHtRJ1EdjsjyPwJRFifjL3zVMY/Zcm5E2ddHYo0s
         LvmgNbSLsDvOdEqr8mAymbsQSPrkmAi27cGHdlaRkcvrAyB4QsO8dhtlBkQItjdJDHbt
         bJoSgWd4vz/lXCMbVeXIN3XUZ+JL5eXLKv7Jx5F8RSWRDCqn7gtRINWnkRZJ8aIUeGB2
         GPgEiyYu2mvahatMGLFYzD1oeYXgvUNmU8GybyRr4EvY40sc7IUwt21I5tJYUbPV6PeZ
         YLEuqj/RTHTPU2PjK+za1dKkR1E9R2Qt7h5XNwgDstmqhVliv16dZjQ1uzQq3G6oS523
         SNsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpDS88NY/2/FfkLyVFHHzmCSoPDKphcqcEv2CBWZYKZqhPk63ExnSxW0wotaadBGIXbhtm9+DvqvGR@vger.kernel.org
X-Gm-Message-State: AOJu0YzNeJySJA/n8Q721mp40ruCVE/MI0bcRGIgGUHmwEVhAmoYUMDT
	nQ6OsuZ78Ao2dBdsn2i3mqBTQCTW+gJtpTOPb4ZSZ9xEfIpLzb6Ir6Kv
X-Gm-Gg: AR+sD11X2Z4g5SMMfiioSbg6NUwTSgh6XEgibuZnA/ylt85AIw9Ho2uGxhIxQHQxwnC
	/Mlz3vOY9ZggxZIUGptKGZktTYrpKzZs6HYh/YCiUPKeH917G0rP9vAdaMJXLge1Uqw2F4xYFau
	KZS11+Iqc4E4GuQ5Z/49GMZzxZG2Cq42vclDmmNY5pghZCFI9chDpNEU15T5KAopj+XlWkEeKKU
	nFPrpHa1VMwcxezS7/f05BT6QOEGJEUSIXyEI1mDrlIblUxGHmQtL1WW4J2G865GrgcubqknpQp
	BR+Umx+2DFK3n8XHhmQXKf/K1lsm8k1074C8pEYjCbJjTlK6TyncB2lEvX+pzMy7P0pKaleVCpp
	U5cMzAfV4VN2Ft9bSRZDzMyUEKZZTxCVQGfXyTgiG4o7+VMVEaWaT7m7fEY70bLFSknUGbJQpKF
	zUP6EiroqO5XYLwo9pHbLuapkXAlQsttHa0GQ92RuGTCPVBr22W6qBzp3ESpC/vcTpXt14B0+Fs
	AEADI2gTh+e
X-Received: by 2002:a17:90b:4ac5:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-3958125aff5mr697147a91.4.1787096231751;
        Tue, 18 Aug 2026 16:37:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77bfcsm541284eec.9.2026.08.18.16.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:37:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:37:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] hwmon: (pmbus/tps25990): Rework driver for
 multi-device support
Message-ID: <01704145-51aa-4d4b-81ec-990bc0da31bd@roeck-us.net>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-2-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817101455.3526260-2-sbogdanov@baylibre.com>

On Mon, Aug 17, 2026 at 01:14:43PM +0300, Stoyan Bogdanov wrote:
> Rework existing implementation to allow adding support for new
> devices to the existing driver. chip_id is used to identify the
> current device and differentiate logic where needed.
> 
> Changes include:
>  - Add an enum listing supported chips
>  - Add a structure to hold per-device m, b, R coefficients
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Queued for 7.4.

Thanks,
Guenter
