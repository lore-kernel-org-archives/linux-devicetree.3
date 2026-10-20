Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460966;
	b=LfdW138bje5VGehbT1XfeNHRVsAUn14oHxw6KMVoUl0TzhVHzVzTOY2m8FMTdZ/j7PFi
	 W4DvHC9qkdeyZ0BlxZPlK3sw6wp6glEa+APNelsviSww1FSv5pvYqwueaQMsVfoAm5UdN
	 5jCPQBRzv2KkCmHpSZHSmGghU64feC87j8EJmRfUjwnztVPkkfDMCgP8rzFafBJcszUpb
	 QUjcZdeeeUvg8Ide7/esPyg/VSIjhb2qZnQnfr7MlT3EGKQwV2W0mYnJxrEV4AX12F546
	 MzQa9k4hACu6rOGFdCPVj5vX2k1nj2mhF/JJV1O1bF+jLQsC9twOnvIJOs52pmjzNJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
	b=tXoToxkWlDJZMm/zn0hkEwdgrHDSppLyrDFsRCMntchE40n1HpPTjlaVUzUjZy/n/mO4
	 z7GM1/dSQUvViTKlYhLOrISnkeR2c7gON3bltJGWY1HGYlvHvgEnOJ709KRdgyU54RZkd
	 36X/ltGytdUUPx+afMl/Gq1hx6C7MELzBa59n7td5KTxOTMf6mwNuqLQpyjCVv+03PvRS
	 fcISKDYcCVDzQe2l1iYaHCbQjQ9bvqZrrRJ8s9Kgo/KvXqnClsDSmrbc+Cxzxq5efVVoM
	 /+0KUd9KDZby9yIrWIKjoWxBBRq6sAyiVDcmWC6Yy98zOSn3vmj4ccvWM8ff0q/7zAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j5Zy+06H;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04356606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04356606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j5Zy+06H
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so3802510eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460965; x=1793065765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
        b=j5Zy+06HYvqYPzoaj9knMK1wL17L7UbkhFY08X6bji2CwTZ2KbbiifP/KVdX3Q9z5W
         i+kgyZBG44OKtizVXUD99kmzJp2OvnzAMYVWr5palMY9td9/HrRCXsmA3eMzEdxDu5Gk
         YK9u4n6eohz7cYvcSYbcO7NsQ9ybecgkZ+0xYWkmdZODUJ4Sie5KL+wi+UxjZANDgGcc
         Atk7lkyfdFm525ZM7UNE2j75qevy1ibAc1HiXz8Kw4GCw59TEFlMvo8VfV/ujbGlds0K
         7RhpU9WeZm/cHO7MOIqBM/lrAxknTs7UruX71kWhte5U62tSO5m0qdWwsiZdzwfsaR7N
         187w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460965; x=1793065765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GI1sDXL68rILFOS5IDyHXobc25qpbCh5q48o7ZrhuAs=;
        b=d3EaFxo99EXLjeHFFtx2rnAiqr1dsP4Q6UlOUs+fsaY1dPsLkT91ArTT3YvtJBjSlv
         4JpkAN3wKs2bWSPwTLrdY0Ng11nvhKe8PLJICRQHya3TQ1kiBHM1vdg3BiVzRlLAWvep
         /HpdFIkfNLf0Q7CcS3d0GSSiSrvrnjuBYUOj/93iZS/qCGDU22VnNlV1Il7Ai3OSPtQZ
         7GeWcSw9Urd6YTxQomQiCeIsqvYaFGuvawuAhZyf8C1JvQoSG1Y+eU5iNafbSuNQeGdX
         wYb3rDuvwhNpWQ2IHJ4mm673+Ny/b64mhc6Ceg0sJ4cvb/yMhC0yVaw607THjvgDkW5y
         GweA==
X-Forwarded-Encrypted: i=1; AKwUvBzFBHqFs2GfEfcIUGPdxHol2+nLEscfeFTIY8KuY8GqKMDKzhW4uqxZFkFcIra33me/fgmzOrrmkNf/@vger.kernel.org
X-Gm-Message-State: AFq9FYKKbyD87EwHO2edE3UD+hnblfTwqBjWWm+6z88hUBFMCiWcKamT
	qk582TI5QWw0ntOfekpiBpKiWinmOo5skFt7igiuLUvj4L3C01a2G/R7
X-Gm-Gg: AYBFou1tJQ1CXpxKhyvqC3pswCsvZcGp2y+vuwMUEwMnqjM8eqdPYFjH72QTTGmb6Fl
	gzqLkh2pfeJrKfsmDFcveGMd1UrgsND4ccDca43RJcdLIzV0TyOQvAWB+ROsFTaDIiT23IFV7bA
	RCvCwhCfQVf3MjT9y6LyvGSzix7IljvjL+g75y+LjiXOeIzY45UZvB4cHgHKldsAzkZq3uXD3g+
	sLkjM4oOrL2OSm3X1UMKhFmfuCtmhTeZkXZWf+DB6ivaJprJiywJiLfehOuWbICHLXHp/ICo7dH
	D1F+VnJfQ+vsVhr6d4L53LEBQCWvpC0Ym278vcDKeIWk5DoJX6aMd0eLZxsCzebugBWrLDtr8BF
	ggLjU9wJ6uo2bqNG4kPm0vU74Oa1WVvsGZKCjMaCl6UNL1BvKH/0TI4eWSrWa5wPgnMJ/bXBU80
	tMbaX0v/LwK30FG6aQvstWlA7ZpA+rSV3rY7B5eMi+JVaaxFt0jvXoZcvFj2TY7xJVgcqimDG7j
	w+YgRJXUl3u
X-Received: by 2002:a05:7301:271c:b0:35d:b452:902a with SMTP id 5a478bee46e88-361a2942d31mr14312652eec.34.1792460964928;
        Mon, 19 Oct 2026 18:49:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm33941191eec.22.2026.10.19.18.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:49:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:49:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add
 Allwinner B288
Message-ID: <0ed8c1ac-1f9a-4cc0-b914-6b245f86d296@roeck-us.net>
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-10-pmazzini@gmail.com>
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
In-Reply-To: <20261005202731.153971-10-pmazzini@gmail.com>

On Mon, Oct 05, 2026 at 09:27:29PM +0100, Pablo Mazzini wrote:
> Same watchdog as the A31, which it falls back to.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
