Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653281;
	b=cou+rGp2ZxUIUkvnt33bBfb8+k/xOHCkq/jeuqPeo7mhZdqfg6h7TmdGSBoL5nE4+pqa
	 AZ9s9Sbi6qL1rFFePSOCfKTYL8tjLTaUttRIC44P2+z+NSOnzCPpjPsgtJ6xy4RS4ICFf
	 YxFNhdXOIAFr9ehkZq+ESjHtGz7G4hAABlomyEm/IlIPqSfUp1W/RXVQRVRBK4r7/c9ka
	 ff2vuUGqZzfgs77pMvD48GBvDf+6E7drNeAtRTrG5xu93Yq2ZXkvP8+sCzCCsB0hnCTCh
	 0GsmsfyL5gbuzhHjWB/NBDnUBy59TrfcbfDQJF4+jc/NMoXbevYY8T7V4UpnBCaHEvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653281;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=5Nw1PUI/8+Dw+uE9Ar24vLwu5Jkm9NnRZmkT/cfK/VY=;
	b=Cu2Pn4plC/Z6BD4q0wPiirKxcmFu2a/WpBxMOYHxOFk462OFPvfH98Lc2du5niR7+dbr
	 Dq7ovcZBpmrP9rAdnDBaPzwFuEHGl9SAnU6fz+SKRT50Z3Eua8tWJUCXPBdq5cg+d+CX2
	 u62j/eIjE3WVGCt5MfEZRc1ALP5zH+5+weZcqcJcoCj0uh7WgypcDUw5OEsH8tZLsTrBn
	 XRWvP4tAipG7lFHPqQXIL2rJ11IcCV46Gc0qqxcCZMLRgk80XUsBHWbcm3JqRiqXj6ze+
	 flislYEgekNNDwKCr0Enohq9rStLOBioaHQbJ0IdOA1kkkZDsW1MRIYC8YGW4QThe0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=bQhzdxgG;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2137606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2137606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=bQhzdxgG
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 230B9108AA8;
	Thu, 26 Nov 2026 01:34:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795653271;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5Nw1PUI/8+Dw+uE9Ar24vLwu5Jkm9NnRZmkT/cfK/VY=;
	b=bQhzdxgGhksJwhez1cJ6RJfzVetdIlhj0vPwN9rwGVYBtPNyApvgg/373hbFxzfNxLfqUE
	giGcpt/g6Riz6NkXX7MlUou5cdiCVwf1iU4EdubtCMUAMaXIInspO7A/7phxpBwMMXnrni
	rZkV9tfz8DAZHHEWauVaU9rBP+Tv++S3UYDLeTolvZ+3idCuqEbKUefSgQYP8XNh+ee+cl
	9tGnoIPIgM5ej/IOTSes+0VBnwrWmuyeId3huadFlb3YCiE4o8SHFW1auHf72LHKc0jLnO
	wcACDZZYitleGOluF4Jki8+2NRNJjKnkwTglkvLdMZ3J3PcuVQeAzrm3DCSRag==
Message-ID: <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
Date: Wed, 25 Nov 2026 14:56:36 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@dh-electronics.com, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/25/26 1:56 PM, Christoph Niedermaier wrote:
> From: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> 
> Tests have shown that, with the current pin configuration of the
> eMMC (usdhc2 interface) read errors can occur with a certain
> type of eMMC chips.

Which chips are those ?
