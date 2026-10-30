Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363087;
	b=M1R6P0X9jQNDkhyqCbA5nKh3C7Y0ypv66CxPF00KLMp3PtJN4BK6B98PlYAmkl0ep0xM
	 4a+EnD08O0EPNxAcrOjFIGpKAeMxQTa/9/1usvaa5SQMUaOjU52Bj8HpaN7rniKi866Yz
	 ZTHSQYT2C3Ve1pp9/D/EMHh3BDfBdIIok4qbnBQIbhaV2JVcjsG3AL2806bdBi/c5qGli
	 EWpOV5lfVsDP/o12GWOELRHbzXXLWH48o16gzKjPovWqg5SdlAn+Z3nWantNTJlDxlPyW
	 XWSozDnMOJ/obnFbLUtQrPLP5cjO3dw/VPGwrwrhODPo/bB0I7X8flEnwo4hp2LmYcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
	b=tZ6hRKUZWi/Ma3J9drakbADSPqhqWyKETmQUfE3f0Gzfm7becPMBnLz5gZ06QKnIeYKT
	 g/53m/jiaDW/K+F6F8YptZX1kgIzGhBpAsuKSZDkpQw8GITl1yXmzGw4doDKrzoNg/VIY
	 kCrxeeMV5jqcSHxLbJv56zOvFkW68RBAGvDgJ5cteQyeT3bwLK3Ua4T1yCRyhjk91WJWo
	 7W05TuwUiLvZ41hIyoPSQ33ZdlvrJDCjEC/qPiPSoo+DvtQIho1Mv2uKTCJtVgRKJPffJ
	 9mR6SQk2b2r2q6AeruBaJkWqbT5SQhqfr7ov/JbacTjbTRE/CuXIB6pMQuYgZtKmYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryYiWSQO;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F623606A324
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F623606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryYiWSQO
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-99071945aa7so391903241.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363085; x=1793967885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
        b=ryYiWSQODoAFQWFd0YUZMT/CuNVZF4RcRqW/9bAZTp9ouRXv9bvFbTC9iDSTtEFTgX
         QBAC0hzqyw9O8+9wk3MJRA1twuUlOcuvrmekv2hJmgqZ1TEKlCCSWwud/Bviceo6xUxE
         E/0Wh8kx/yJoZ8TlGP3loHgQw3lgrmZX2uQ8F5jutVY3rQqeAm6gwdT31v32BfohbQO/
         G5ie1WHDvmAz25uM4BPv+T1/OrsH48ouEYISV1nsWZktvT/yKbCN8siQc5qvcSz/BqGP
         4TOFjVE/XvAF1VA0yXocioVvelvMbdyLfArxCrgax993zJ3frPx++minYOQzqlbjBYVb
         s17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363085; x=1793967885;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
        b=Nv5jKnlSwppw5eNaoakEmHaxeCrSi3tT5TMIOGGN0Y+UnEiN7iTewGMaX48l+DeWmU
         DMu7PArQb8Fm6Pi6yzS3FXdn434C09/TO7JXHdigX14QyDTe9YhEAh8BEiVD8yTZjLbO
         t3BgwabiH3dlk7o5Q893LoBsGrngdywQDGe21ZYK0mTHYbIg7N3ka2w33kQgv9EVaBj1
         5y7JBqldcVlEPFA3Q7PvVLue9g//s+q+TW3xis3yskfhlt5Eb7HnclLgjZ9in1Mr737q
         FkEA0K+ghAQbUglwdk0H3sIYYCXZoiNJagRpsZfv9EO/9gt9iBeJGfIG/EY2s3dVmnid
         p1/A==
X-Forwarded-Encrypted: i=1; AKwUvBwLGdYAOF0K77tFwBnccvDox31n8Xz9xAi826Q393Oq5dpMjIq4ILpEZBU4Oie4o8nM/f8VHsPfQaQd@vger.kernel.org
X-Gm-Message-State: AFq9FYJSEQieXHkE3A+pYkctZXJNNKRUc4/bCNlKYNmM5K+cjNPcXCPG
	ZmQ7iQBjD60GmsA/gTNx0o1pKIlnZnGCCcU8sc0sXmfDQWkREg/8rpOxac4gR82KG18=
X-Gm-Gg: AYBFou34HN6Am/iqwxiW4Ed4PMltUF/PZpyn7yWo+MgM8GTw4wK4JrfZnDx0cfUxLtP
	wOMGhiXoswqXVRVshWR3z1LhTjgd+gMfJjkxmW1m7NJV/Z5P4YNunevIbOBCsRDQ0akxkEKntCo
	5g9V8GHY9pzvHGGr6GIYzyCMpRakPe9Gp7FmxNnF3hJyxHbnWWi0YNZN6k0JFG7CLb8UWItabO7
	Pc8E8PRjrfh3e9pqCdyOefAwy8G2Y5mNL4HDpdj5jbCLJliEYQMDdSK0X0L2en5+MUklHc+biAt
	oECd2io8nvfnJ9I4MRBhrZhfpwwqXB2R9elQW6jx6LYxuBFbF/0XPU63YShJhSCb8rC6Lp3ysDC
	0Fginy0d0sfUfW49pU/3UVjvA/p7gLz+GLDHiDgFq3syARwRDH+Dg+qfeOjRoTI/Z0LWNw0HOr+
	1mn/2/ZKh8RFb7O1fY9SjICTxiZt591gjcRQ1r/RMIugMesA667WmGv+KjOiJt8MHbiObD6/Fr4
	8bkW0p9UyD4ZYk4aq+dr1YIH6HzGbOw6op6DtR5OiNqhGuZE30IznxQYzIXgUJTBgo/Ez0MLBea
	xjbdSYFh+IwhsPmJKkOBr9WRYSYM/BdNa7h1D+/fPnym1RlqOO1PoSC99mWx/Yht00xJA0t2guc
	AocnDJr2lKQdtWvHOMDhq1hui7rZ5hVoN1QFd
X-Received: by 2002:a67:e70e:0:b0:7c1:7ca9:94bf with SMTP id ada2fe7eead31-7d072c3fbc2mr1028237137.19.1793363085481;
        Fri, 30 Oct 2026 05:24:45 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf54casm2188412e0c.9.2026.10.30.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:24:45 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Fri, 30 Oct 2026 09:24:33 -0300
Message-ID: <20261030122433.1659882-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030-adaptable-vagabond-skylark-bacc90@quoll>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com> <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com> <20261030-adaptable-vagabond-skylark-bacc90@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On Fri, Oct 30, 2026 at 01:03:31PM +0100, Krzysztof Kozlowski wrote:
> Just one paragrap and explain whether they are compatible or not.

Yes, the A733 PHY works with the D1 configuration in sun4i-usb, which
is why I used the D1 fallback. The A733-specific compatible lets the
driver clear SIDDQ earlier, which made intermittent USB1 enumeration
failures go away on my board. It doesn't need a different PHY
configuration.

I'll make this clearer in a single paragraph in v2.

Thanks,
Vinicius
