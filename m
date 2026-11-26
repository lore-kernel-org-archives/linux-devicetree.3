Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701695;
	b=CdEYvXvx/vrU1TfG7Y3+aVZlZjI/hAPJnC71May0Et2MaTzAe/WCVx5VoCxGRTdWDIm1
	 2KgcgEPVVY8F635mR5Wmz5PhEP4xU+6o9uxbdmuWTLizxmxGTM4GMCJa8wL9NwjApUxkV
	 opgdL9A6BYtkpTPXKAKzHMMTwW0ytIQkMzkQTdgf7SuXew08x7S8hg0QtsdDuycNg0PiK
	 FAEKLHYQkngywDQaooQn2cr0HRqZfMa9uJDODrL/Wc3qbAp640cKa30cmzZ9Iz0+dn82m
	 V4+Do2DJ3oDS7jwwzkYi05nXK+xCKN392k45h8ahChZ2Ae5YvGsM3DFasIgMWXFiapQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701695;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wNad8aGHa4/tIJ1y5EBj81nrFIm9e9hCQQtF7l5nDIY=;
	b=N5KGmT1e/6G0MxJU+tO8+2it+DdrrNoXR3CWoOm7GXyYadbOOec0LrhA0oZR97lxyGRT
	 V0KJ7qtvJlEcu2V/TLijkxWcPC4md7BPM/CPpmhYXisMwZRT88WXdFPjvKwcBfp3Mo/SZ
	 I22PXOd+EMEE6FNr+G0sEqP2SUgj2t7wWbY4YGCnMiPz74puu3hhC4WO/3gbgruiGq/vB
	 wAb2mDsdeK7BqldMOivM6u26M8Vhuc3Er1teh7PAzCiv28Mh3i1yohhK+SG3yZcblbHJn
	 b0eXqx97iqlW6fTFpBIqmgUfA2eb4l4QTDwHaBifuC3ag5o+sd6oYwvV4wOco2tNH6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrmFEPoZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA22606A31C;
	Thu, 26 Nov 2026 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrmFEPoZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E241F1F000C4;
	Thu, 26 Nov 2026 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701695;
	bh=wNad8aGHa4/tIJ1y5EBj81nrFIm9e9hCQQtF7l5nDIY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TrmFEPoZXfgUxvRkBH8yU8kXTjF1KuoGclUL4zDFvcCFj7rXLA5CzIDnMQ1UaG9bN
	 T5qZXaHRkJ/2ZzP/t+SohQ9qDR3ZiCR7PM7fPFPN4avcuLf601iyPJXyV+7miAQGu1
	 xHKHluAT7d07Upus7x5m/sGpxBlAChMICgQ0M3siMX710eIMpvFA8C515AG4IqsdJh
	 IOaEg2L1ScHj5wK3dZZ0ACgQEhDE8/94E2NraDImRIaQNWMWzIpopM97G1HD2kWuUf
	 jWl138QdRGV7FF0PQuBUPnwEl9SrlDtmHCL6HpZprJ2hrEVpqgb/XOuYLPN0yTs3NT
	 cBuJMbi/iJpKQ==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/4] regulator: core: Parse
 regulator-off-on-delay-us generically
From: Mark Brown <broonie@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
 Saikiran <bjsaikiran@gmail.com>
In-Reply-To: <20261027-regulator-off-on-delay-v5-2-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
 <20261027-regulator-off-on-delay-v5-2-f9c3b128c6d0@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:01:30 +0000
Message-Id: <179570169045.142532.16106966799227228984.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=479; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KdfCQNV3a8eJP9eLdbdXsgwj3MPsywhJnLY4FkqlhXc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5rHebCn2e2x+ZcLVM6dVWlynLlN50bXnPv+3dX7fTY
 kut672TOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRPXKMDJeW+yV8nJprs2fK
 ytvuL4OvC1+Jsjgu2Lfgo+7E5UE6DNsZ/nDfWXysr+Gm4ZMPFi/tprF+/lMyN677vZ3tDrlHb9X
 7/zIBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> off_on_delay is normally fixed per regulator type in regulator_desc,
> e.g. hardcoded for every LDO a driver supports. But the delay a rail
> needs before it's safe to re-enable can depend on board-specific
> factors like attached bulk capacitance, not just the regulator type,
> so some individual regulators need a different value than their
> type's default.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>
