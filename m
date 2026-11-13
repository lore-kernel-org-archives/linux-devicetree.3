Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530282;
	b=hH6zkZN2E4YlVvWeVrDA9Rf+aADVQEf2cJMvxgIxOGAaWvm8Ub+WDEBnHHZrBE2a/Xw5
	 /4DXll5T3bSiZqbqw+a4/Ojq/tP4gRtLsl9d63JvuItc4p1K9HN2BVAxHqEuog+HNoJFN
	 Y+iR83RMxUdfjWPxihWn1m3mJGTzqPi75SmHDAXIoICe7dUBHth1u0sinu6oW5u3fCpRk
	 7j3cpKrqxKPwlWS6z9L3ImwTLlelOSI6YP6hTtYZ11H+CnpbNlJZfijWSppWt5jLUtWGT
	 im2m6l+WOLTEoPeGz1BjDyjU14tDLHWGlbrxg7kOo5sMoyR7toTeZixCEo0RQR1d9kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NJV6PkKyLn8LLaFMN3pT/YFquqSkktNVkI76CPkMC6c=;
	b=QgqYcsb4fKtLZ0d6cV/N7hcZajeAheVrfvvqtoYESjwh/+xwInU+sSuIOoD+X11/0dru
	 jUWrI7c5PPYuhjawtB2itr8x3SdB4GzvfdiJQMn1T328ASpNzS+o5uMJ0QFB0RJGHj9pj
	 WI9B/aa+zQZjRiXSHbgN/fnD5daTIPF34QFyfhjBoGfpRfAYZOW3uSu5Y+IFGYQ67XyoT
	 mE4b6RSrsHX8Z2rnXo7hleklKjIrctsGz9+gTBTszpV/yJjP+Xy4zbGVyWJWpOWcH4/hW
	 o01Qnx1fs0DKNiO9M5cyvmM1mHTJk8ZKZKsDxQHd5oN7zyoWgNOs57X2vxXeLUp7nEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POFAfAMl;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF780606A330
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF780606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POFAfAMl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so4795635e9.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530280; x=1795135080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJV6PkKyLn8LLaFMN3pT/YFquqSkktNVkI76CPkMC6c=;
        b=POFAfAMlzOe7mxCGaHxHhIQ7MfNoy4mBZBhwXuST4doYXLkrQmGxyoCIufW4Jk67At
         j+SxLUvrhx6EUXK/D9k0evL1gDF8hiWJLQDrmNfM//XrKTWnTJw/vTOLpO3tgrQg19Yj
         LksjfoErsWEKyChkkC5F/qzJ5ZY5Q1G2xf+FrkrL6v3FrEmBwXhI410bfV10v2FI8Inn
         4wjxf1yXt4ucgi9yzWO07vVaURDrquFhvbT3oml32JN1HHN6VH+mVhjIm1SYm0l2hQba
         EvMN8LiCQhLVUPc/xMwS7koslFgMA7GPJ7ZoV6Xt5b4wMil3jIWoqcpNFgCOQxNV6i0b
         2ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530280; x=1795135080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJV6PkKyLn8LLaFMN3pT/YFquqSkktNVkI76CPkMC6c=;
        b=wHQbO+PurlD8ZmGtUmKX76EmuVSUWztBJRIkOfQzPMkgQCnC8vcBV+cOjXncC4Z0Ql
         WmyVROJvFgeCiF84eQg1IkRcLD1HBYRtJhz9artYJp8pVesUtbRm7MAnobVCk8NaVBI8
         oJAGOO1NWnfQfrdT0Njcoicbxkwkl1L3285+pjxZheC+zr21ujE2UFC9SWEdwXScLFlb
         F7I7ItF5DbTRpjNMIVfjMODvItsKTjYuVxR7ywcxPt9unrPnObgz1b8AVosk5kJhrr/t
         g8Ius3cyg35RndYZf4T1aRPbgxM4i4v6cVWHdLXMWNHKxpDrP/0sSVyB7bakU2lSLxN+
         jTWA==
X-Forwarded-Encrypted: i=1; AL+hErEdYLRjE8ewyIPSlbZR/hplsTAldxssMcYT/U8pf+C9VVE0UjyjXT9mntyQkghnlEbmO6fthTSxpK79@vger.kernel.org
X-Gm-Message-State: APuU4Z/78v3A3hjzawBS+0fN071PvQqdAx4yoauMxoP6agjDJ/4QbtBa
	zTBfzmJBAB/DLnY4D+xYHxHjU+vycSQnXrM4XXZbUqgMXogf37sbgqT+
X-Gm-Gg: AYBFou2uROH9KHuv0ZlYOmxdUO8EfAZoPRtXRwofuNSSjrMRyQ2NhNjaoafW/hvzi7u
	j/CSfarexzH41VMUyrQhl7p9s/PawHbKNvuRXtfzpV2q+1F18XuSUEhvRAglpkxLP3h7X0cZb1H
	3XflfFmjvNhY5ttUKB90yzxtrexQ9xzmWHL+5Z55podiLVdX7zXUZdS68Gbdbm3mQzXgqYDgkAb
	XORwiFxHwxSYOJcUfEzdoJlivKSPeXAkvLvnGcYC36Cn30in/H161tOgfNgMW80KW+/I3bWmM22
	scR/4FixRZfhQEODbwbWytTmIYESlFjgKVjd01zLNMAYr7SMLpFEdJFXeRwmixa/dIkBEU2/IWA
	gfWTha81d+ctKw7ZSbdx540gqsRMqowv6BtIOkJIAFJeldLlm1hg4f03rEy+4Dqm0NixaJmsYhd
	OxEFzTKINLvm3CvQ+5lsV23SlrDkvq+k7ZCblUS8wComYXL7HC+GfJVjKJ7PqUIGjLXbGYnOGmS
	dH1RzVP3b7eHeRbaQrHDnJ9BhPYSpAlw/LikEJuKxooApE2aUKEBcvThpb2MBttV9NcIew/zKWm
	L5vGrl+eQsBfki6zKq2OMmeR+sLsey1EoT0Mh4ycrU8cXsVndwNY18qn6YWP/5WFPK6eRfS3fhl
	McMALCpUBL7zzxQskIiLKn0IIYRiy4pr7DVPpiub9hn/447AG/JyVmshG+zeX/XCtnD++NERF9E
	or0P7BlnaGOC+J1H2g
X-Received: by 2002:a05:600c:e558:10b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4bb55a96404mr12042895e9.23.1794530280470;
        Thu, 12 Nov 2026 16:38:00 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm1868483f8f.7.2026.11.12.16.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:59 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/24] dt-bindings: net: Add ZTE ZX279128S Ethernet switch
Date: Fri, 13 Nov 2026 00:37:57 +0000
Message-ID: <20261113003757.3669262-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027214830.GA1267186-robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-18-ghahramani.navid@gmail.com> <20261027214830.GA1267186-robh@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob,

Rob Herring wrote:
> Use the ethernet-switch.yaml schema here.

> ethernet-port is preferred for new bindings.

Thanks, I will do both in the switch binding for the netdev series.

Best regards,
Navid
