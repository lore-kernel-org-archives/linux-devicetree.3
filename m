Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795690766;
	b=Rgu75vCLtVOhkNxw3a5tBy1jusJ8eTTbqUxvVb6CYry4kBEQQ4tPnlsqXvAzBooH70TF
	 wIIMPYaaA0/fQfCuxLpkHuN0NPsCC6utgyc4q5ULo3AHdjQack2Hp4GvoxwJCAxQ5tXoq
	 SrM8rh0/ExWmutrZWAyrtF4MQsvaeZ4W8zWIXu+sGdd879JT3y6pS5jvI8LsCPeOyZjgk
	 VfCqaRucKk2ohfeC+u/RbIQr1aMQvyhzSXltaxfOfcsyVbWwXmvJZRyBtFdJMs+4er8GU
	 V2FJyvlV/CM92nlr7ywvKS2ZduwASmVVH2ASiMgoI2rS59pNwMKi3LHuMkFFoIokxJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690766;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=nl+JupRMQLLP+uOTpPc+emGSWiD9NUoCDaj28QKFU2Q=;
	b=wL82tyeP2laba3CRaIx+3lx9TdsjNVa/fLxOoXM/rKiqjvG8HzgitH+3dVYxMAgm8+61
	 OU4dmH73Pn+BmELZ842UixfU+vtMODDAoj2ekqjV4NSJHB5kbFRaMt6SRLMbAC2Y43VjB
	 NUnZ/Su05HBTX0nuki1q3F0b3b0FHaXNwvP8RjQ0Jin6e6FWbrXyPhrqWV31DhkPkQg1b
	 QXyQ29iI0llcIXg9hGd04pzEH9LWdVOz/Taz7tNrKPkQge95TIdI8SIu0b3bMarZf2XhD
	 NMBrPey+Q9YVCiWqUhUzZabFIRjuUMbixAfX2Kh6dmz9MKHCCci/Pp8nzdSl+vEq8Cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KuvFcVJM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0C5606A31E;
	Thu, 26 Nov 2026 10:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A0C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KuvFcVJM
Received: from localhost (unknown [IPv6:2a0a:edc0:0:701:2795:3815:4919:32a1])
	(Authenticated sender: fdi@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6C75D20101E;
	Thu, 26 Nov 2026 11:59:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795690763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nl+JupRMQLLP+uOTpPc+emGSWiD9NUoCDaj28QKFU2Q=;
	b=KuvFcVJMmUYUDym6pqWt50pYTvJ39RATnvJtweXL46mNPg8kP4dW69Rfni/012anIoBFn9
	gnjwFV4sSABf82DAQb5u7fJFnXhW/MqGWmCEdEgJJ9V4SyJChJ+4uiVW77kJ5Rpq07N78K
	bOUGAA9fz3sJHeojb3BWmMzhPyJ2y2leF8tWiMQJl3ernAeFeYToabA1fUjGtfsPL4JKpu
	MmU2mO4aN9nXihUR1S9oP4eWHsfLuhEZzIRFvClo/dtxlUTMysZdB2D1GRoEOUjFxAOAOO
	1OXQkynipH9yb/DM1U1uNfAsZk0A0osymiies0UJaErNv4Ah+Ai/f68v+aaJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795690763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nl+JupRMQLLP+uOTpPc+emGSWiD9NUoCDaj28QKFU2Q=;
	b=EqNQVc9AytuC45ZYjhIu1Pdo9lCH9xno5xe/cSBOgKiJzbxCkac6kWgPcapMBaljWDYIYU
	1/0cSIevKWt3NH7S7HFnvB8SUgo9eyoRT7QFyxah8ui2qXNgWmge9B/5y3W65llQKHXaxy
	X3aUwYUeeWbEPWIv4DVYdm7OUEfDlKKXaygcXU2OhShr0iO3yRTlolnxFSaZ54tJ7axpaI
	hpRX1AR5Yf/rF5Pag3QABi153sULYP0ghRg/T2BA3+/vfbN/ppuury+FYrHUtWlsYP18gF
	4GLK1ERm/ArlGB3TtUNwPeBzY3qvbKh/1H817ElHdqJTysAEQHPDq5MS6SrDJw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=fdi@pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795690763; a=rsa-sha256;
	cv=none;
	b=ZBquwfFLPs7ziIK2uHGAkB0wP2rxBh69jwngCHyY7x1PbpjqmASxszJTlGqHVWCmOrvZ1m
	wh60j5sZLmkZ4U3dLIPNQBKhY31z01X7il6tTkryCq+tJjm91ZJrFlF1sEQ9Hg4RXEs/jH
	sALFMNE42uzxy4sV1rtxq4j+QkQ2YlVTHO+tvKwSKwRolDEvn2k6i4Lbu5Sh1SCxMYfa05
	7olkYIH3dGPDV5EBedfeFGDNkcxCXIanQAqxskM4V+T5KbkPb76FfrsqvoqDT9+NXKl6J2
	/f1vl/cGQ+61PWyWHcpcf1H44Ko1vmr5UFkXmQ2gMrS8rhTY4XXhPj95jXTcFw==
From: Freimut Diener <f.diener@pengutronix.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Chaoyi Chen
 <chaoyi.chen@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Midgy Balon <midgy971@gmail.com>, Diederik de Haas
 <diederik@cknow-tech.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: rockchip: Allow
 post-init-providers for domains
In-Reply-To: <aweeQ2McnEE6yXvY@venus>
References: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
 <20261125-rock5t-regulator-deps-v1-1-6a3470ad1855@pengutronix.de>
 <oJj2NKd1Svmsn320H8YWrg@sntech.de>
 <962182b2-6fa0-4aaa-a47a-f78339b5d89e@rock-chips.com>
 <aweeQ2McnEE6yXvY@venus>
Date: Thu, 26 Nov 2026 11:59:23 +0100
Message-ID: <8733snj1tg.fsf@theta.mail-host-address-is-not-set>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Sebastian Reichel <sebastian.reichel@collabora.com> writes:

> [...] an alternative solution is moving [affected power domains] to a
> separete device.
> [...]
> Now the kernel has dependency informations, which are also used for
> suspend/resume. So the kernel knows it should resume the power
> domains required for SPI/I2C (bus used by regulator) first, then the
> regulator driver and then the power domains needing regulators.

Since the power domains are managed by a single hardware power
controller, would you envision splitting them into separate devices
internally in the Rockchip power-domain driver while retaining the
existing DT representation, or would this also require changing the DT
bindings?

Best,
Freimut
