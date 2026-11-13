Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530261;
	b=KtysjjwmYTVBDiGZpUyaV2sEAkUqgvZqs3PA3NJsDbYJ+QOlzDQ4C8Hh+odlCLC0Gc1k
	 Ca/YtsE6Y9NNtvco8h1rpngvQkFtGDzUWFtm0+j+deeIq3CsYoGkx4yTgz3glozU0rgbT
	 e09tjJkguVcZ+y9DYj4kon66XmgJjIwIaDOA9NOx7Yt0wqmhT7ptKpmgh9B/W2lK2Jg7H
	 rTOvInzXaXgFm22Mtco65ADfL7n+Oc46SusgdHrEyuphJr0Fz7FNWCdNRZABnOfRuAtfZ
	 tk59uCnYEblEjnAmji1OGDMh2o03c+IfPG5sA+ajy7pf/TqdS5Oz5qBp/9cEIW80DDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i5j4IdUV7rfFI+fa6P9l+T7WdDrI8Iia9UsGOEW/6qQ=;
	b=ywlqQp/ECH+mokVOsFYlZFU7ik3JhStm2xHKEKgDe+1t38BIBRuUsLfkglbTXCGmuXjG
	 t5iSwcgxrl6MLYAkCSve5ZxLfOF9vVrGsbIPhcl5RUdoS136sp1TvzaxmmNtCx8jtpVS7
	 g/XpbuprE+HpSvSXLwzef+CmKy33naGu/xctP9tDW1xeopSXmFDCJf4SKt6pp3IgaOmcX
	 TglooaaO3F1o+QdQeCtA0+Byv70NIzP9/vo7eC6kAFKpkmwpqM7F64AIjPxiFnovP5hXn
	 Hw3WTj3I1EVVfMIElipdXfEdkEMd32j55FtkTQG3YMUR7vMbTiizT2qAdqfP2NQ1WZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E84Ppd4a;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2088606B545
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2088606B545
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E84Ppd4a
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-497614c95f0so155636f8f.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530259; x=1795135059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5j4IdUV7rfFI+fa6P9l+T7WdDrI8Iia9UsGOEW/6qQ=;
        b=E84Ppd4aSdwOFEtvb50mYkJ8GCwSoQN5uVhzGqU35AoLpgc8TGS8Zqo9dRYn1xOuHI
         QMJqZx2Fp1O6JrOVl01jihKftVc35Fd0KwGQ/mTTih7BZXIuQdydLjZ1LKBBTTQ6Sgcn
         46vaRf1e2usXYTEgMyipS3OsNcWkpkJlwNUHaiVwCNsXajReQfmXIiYeGzFCwFB1o7IC
         gL4AOJWaMPEixnen4xAQDrBaZOp1lmudiRDreaQurdyfXGm5uzvCEWk+2nr/moNAmSTT
         hRKkAJ+aw2HTmgdYVd0nbIwDavdbwBoGX7xVBVJiSyTGNdyPqtT1TFezwuJluZSvTtur
         RL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530259; x=1795135059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5j4IdUV7rfFI+fa6P9l+T7WdDrI8Iia9UsGOEW/6qQ=;
        b=KWy1NJU6zt1p2Ao42i8SJz1tB9Nvr2bnrtKyHwlpeEsn1J2ak5Iv3SLQiWhcYA0euf
         NTCqbbeYJoGzk671Y4VkWXHNBij5JET3VnKDNREjsu6jju/yQBDXq6AZYsvhIqP/B0Rg
         ZCVaPFhx7HU+/EkwdU86ZVlDtMObQC0SXSUcEdQzhkiMuli3uSe/dP6qmn35830VK8QM
         zNRvXMRNsG6EvjzGSK5TijTv24jo3BQWV5N6C5DDRj28j5q7EcZ6BhsfRg23Nw/lAeNu
         zwBX2pBvoS9vidu8q6cS778JEOvOF75Uo/J8+fu4fEvEQSiAOleApEscBCavTqp628Jn
         vAOA==
X-Forwarded-Encrypted: i=1; AL+hErEasaCl8tUeoUz9iJrJF9tSoPdKNtxne2QtIBezvUEnIszO66Bxd3Vx1ZRoui/6wXu+RXKc/eYjmRlU@vger.kernel.org
X-Gm-Message-State: APuU4Z9sjnvVJGbZfrXTmMHPAut7QL2XlEs/9YjZecBzyfeHvvNmU86L
	i7CuYWwNh93XGlQSj/pj1xGz14DZ+6URvag6XbQnZF8qxz/rvZnmFU6f
X-Gm-Gg: AYBFou3xQ7NtbvX9zGK+y5P58yrzq3jyrS8GTS4rxVuCuk+Khos2eYRlWy3f1TXNPbC
	wZ83hgvkdegliyJejT9EGXXTz6lu2cOPdYtnwY4r0OO6sLiThcggr7fo6L7NFZ94yQpuR4tET08
	zK4RBRAntcB85QtkKORBOnwbn6lmlPyGxurPhmGoIlivmP5wQ0qYs6+FY4MnqUxW4+e08QvEd5+
	1yB9wScFqzznnOR7moY2bSTseJcmnngulMqYY+6r15weItRxuObmKa728dx57xFmQ0qByl4RoAX
	pI4QeeoNS23cF/kNzewPAGZ5bOLSQQsVmJ65BgGg/kxYZEe4+K9cKKcaS9LGQne4U2IlTojRHtS
	GsShJsZlo/zAGq8qc+moQHfzogSR5+/NpURuxnpxninEYHKhwPuf2LzDv1mv68JNpoY5BSGdEcQ
	tcpSsaonYMxczvevIEIvo8fGLYcaGhmOROnkPp7YsGi7k9X4lnxTDIWILviFg1YHo0WAjx0xu8G
	AOet+Evi5Rn8TwfInMPM8Y9X1BxG6ihcvOMOLbgz6BLaeMzduLVDJj9wqBlAI6EqeJHK6RwLAog
	VAR8yhwQTbIYl7e6JYCdqM7YBTe7vgBz9he4nWlCvHWVgO5V97eccr7sAoOZDRWz0+3Zk0S3auj
	nOLOj78RUzgT6KWVBKEruNMXeIdU8OlyOlMexN8FgYe5ZTCj1zlJe9Hzh7JrZRmdc6fv89VCUj0
	sHLZ/+ny9pWaHXHR9e
X-Received: by 2002:a05:6000:26c8:b0:491:8462:20cc with SMTP id ffacd0b85a97d-49c73ce5e65mr2081140f8f.37.1794530259311;
        Thu, 12 Nov 2026 16:37:39 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm1866976f8f.7.2026.11.12.16.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:38 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/24] dt-bindings: phy: Add ZTE ZX279128S PCIe PHY binding
Date: Fri, 13 Nov 2026 00:37:38 +0000
Message-ID: <20261113003738.3668081-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-celestial-wealthy-cockatrice-7f100d@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-11-ghahramani.navid@gmail.com> <20261015-celestial-wealthy-cockatrice-7f100d@quoll>
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

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> No, that's pointless. What is this index meaning on the bus?

It had no meaning on a bus. It only told the driver which of the two
PHYs a node was.

> No other resources? Then this belongs to the parent node.

Right. The next version drops the PHY binding, topcrm gets
#phy-cells = <1> and the cell selects the PHY.

Best regards,
Navid
