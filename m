Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39745581F6
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884891; cv=none; b=bXNKGH5vkNtslOtWNTFRvtw74RPiwMCMRiHcazMKepM0hg9Kw1e04CWVupGK4AeHvn+qrK+zGwpn9OFa7BZHUm8R1pTmqxpDrFyExuOrDkpvWC6wvBEZRzT/OqvsEjuizi47SCqZYCLj9smr9RbNWZcTuSWJGSAosVEUb7fkImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884891; c=relaxed/simple;
	bh=QO7aVxN0Kc+VeXFyVq2eLzoCiKN2sTlqvt9+lPTHH2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMPZUoBuKRKTPzCsGobnetFrcVT19nuX/SvahK5NWvtdHjjo2+HkGQSxyoz6TZF79Eg9YS6UyWvygGDZ+SEmjfbUZ72uciN8949JG1cS2DbKd/eEYwKEyflKdIGlSYJ+IYO6t1xFzqAUw0bEg8QxBytR6jbT7at71SvgZWFU3Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rm/klmC2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rm/klmC2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so7920845e9.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 09:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884888; x=1789489688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oer5O6BgRKMcoJLGFe6Krh8JHdSb+cfvZG9u7xMnm+0=;
        b=rm/klmC2ltX40v1TS10Ogr7E3w8kf4/NHgLyTw7Sk1s4xejNZPDNTOXF06n8N/4npI
         XMyJnlwQBCDC61jD6WO1XuwzKLkaptIeQI47iyikogqshuJRBfwwU5+w8dY3b27IrESn
         JiLFHIs7bwGRi98bg+s7kQITuQfHsWapy/zU4NyAgdz+dImICcdXYC9mvwAs+dqDDbR8
         kpph9AZxXAErLxWr1QzCntY+Y6o98zgeZ2KH6Jxayjwu8dhE/p7rWbFNhVnJEBY4iLLJ
         hIq4Ezyo1M2HDGcAYHGXHx8n230gwvDo646QMt/T+b6GSDvWFlqC0yEjCd2zbwsGLfZz
         XbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884888; x=1789489688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oer5O6BgRKMcoJLGFe6Krh8JHdSb+cfvZG9u7xMnm+0=;
        b=e8XXz/DE47kkI+9XLPDPm85tNMYSVIr1upLFJPSswaVIovmbEeW8ZuiKoqmfxlYH+/
         cozmXPxTSBanixm+86MYaXE6HU+ZZBOf1lUMYPOz/rAjfkrB2X7PQMJZuXQNk1Vw/PGw
         czw8zuVFmh0YdPKhmAIo4H9xRWXGQX1FWfuTS9ukeJEhlkt+nSefjNcZsPK5e9ELrDEn
         2AhULFzm1iRzHbj6VlthoO02QJYvrNCMWJQZXg7RSgIxBKworEKqCEpReC8UdBnmcZQo
         hm3QlEcrsM5i664lT+R74jL7reqxfr+n+h5U2DPJUZ2UP9RPNVZ9EJgR8v6gTlUsZ+ju
         hDCA==
X-Forwarded-Encrypted: i=1; AKwUvBzfWo+uD4qqxKWxaJA0Zty+Mk2QU21K7kZDWaNfnfKQjKk9smYAGHuODzhBiH8adHTHX/CDm/kBRlLc@vger.kernel.org
X-Gm-Message-State: AFuF++lHVi92LCTvMHorYRVyeH48oY+Z/lUCoApUz7PojnHRb85+lsj6
	l7sqJzceegtg6EcMCEvvTGGnsf+nXTTVGs/jL+KnqeEz9FrUyLlZgglh
X-Gm-Gg: AYBFou37QQJtkFIG52x4gRjOASkZcg+sUnx+QOP01fx+mPENaKT9eYffIr2wW4tqI0j
	6/eASCDw5TWLCJwQY5uaKQNsfg/q+Y/w22ANvMQOWqXAV0SiHJ0wdooNVfCpcJ6RaSKKhFBnzyq
	lLP39bvA1KdC4BNNbpIFUfx4l+Ouaw5sQGk4MY2enpyJ40/SEvXyLmGSWNCXjs7Hgc4Gdw2s7XL
	rrJ0ntaPi6tv0wXU21JTsJP+y6xcqnm1ncP226C0VNVGZ5vVC1bEPWtuN4thpYsycuJHgDx2jXG
	NnXa64Tj8O72NkOoXSsr2AaUiH27N11EWjZsQGehxorU42vVyJ7fGEL1q9tinH0xi0kjZcV5iOO
	aQbP/cO08yVOR03j0MfiKamU2JRh7DLEqur3PsT5ZZU3H48iyBPWhtVunQQK/CuxJuarMw4ZVkc
	lfWSrrc2O0eiIx8MVLiWwqlS7Lr5a59AXa6rl5gNCU07BEgjziQZj3A9s+fp9bwpR/lp7PZPI1v
	E6QPvhP7EH/OcLkCmpXEBsiD8kjwfPZxzU0yHNYFw==
X-Received: by 2002:a05:600c:1c21:b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49d1e79368dmr14997255e9.14.1788884887754;
        Tue, 08 Sep 2026 09:28:07 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm42028093f8f.25.2026.09.08.09.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:28:07 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: ti,ads1015: Add label property
Date: Tue,  8 Sep 2026 19:28:03 +0300
Message-ID: <20260908162803.5400-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ap-SBhDIJGvFZqFd@ashevche-desk.local>
References: <ap-SBhDIJGvFZqFd@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 7:41 AM, Andy Shevchenko wrote:=0D
>On Mon, Sep 07, 2026 at 06:23:03PM +0300, Flaviu Nistor wrote:=0D
>> Add support for an optional label property per channel similar to other =
adc=0D
>> chips. This allows assigning distinct names for each channel which can=0D
>> match the schematic signal name.=0D
>=0D
>You missed a cover letter.=0D
>Try next time=0D
>=0D
>	`git format-patch --cover-letter ...`=0D
>=0D
=0D
I will keep this in mind for future patch series.=0D
=0D
Thanks,=0D
Flaviu=0D
=0D
>-- =0D
>With Best Regards,=0D
>Andy Shevchenko=0D
