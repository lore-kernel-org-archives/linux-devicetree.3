Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795763873;
	b=VS1sRJ8eUB3gKvRFSjrMFtWEftl7xlF/MQwTNMEbhhIAcAArUYeP24RYkAFnTT+PGmJi
	 Jn46BtMqgv97TQDlJBg0AZyem42HBvtcJ70NNeFjwDerSOUtNVKW5+XktUad2edb39b01
	 gv3BtfgR3/OOFHoIC1zrRiK+a1ia2zuR4KU0PbPHpSy2k2sl5dwjzdAoX1LL2s99GNgso
	 jbsIaeW4wCbldKe5Xp2b/dUGBzkf6vPuf3fzEdHerp1jqEhrwRHHtAhu54Nix233WyF8g
	 OkZWYJ65r3hk4THHUv2edEfIt4QOA+bHJKOBpRbHLfkwPGP0lQtkZVfkAyHGJQzCgHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763873;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=QThccq8aVO4qT5svmvutaMycEXGwprtb+sQAgRodxfE=;
	b=I0Uj5Gqz5XjJ6Jso63ZDdvvv4bQekFI/NK5l7GrLx7So740kcswqcfOtwtaNFaC5uXZM
	 fk9EoCArB8plo3K+Ukq/vyEHFMcDIBkQFoZp1rFiQ++ILXwmahXAbRtqYhkf+XV4baR6T
	 w7COojOVcasXVRSQLNv95zuIhIaUonuJ8ZOo74CCzZ3/ystlYXscT69YyHK+LV4hHf1Qb
	 NMpTccObPTn5IP+khCYt70wYtyv+mjzIxzu1AlHrElyr3zSQL/jY2AyqISqlFBGMNgcTO
	 E688bJ38/5wqO6QOn9bsBV8V4RAjQNyqNwEV3XU3aNP1E7T0/678V0LQYFPjXlxY9Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=koyXUugt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3264C606A31E;
	Fri, 27 Nov 2026 07:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3264C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=koyXUugt
ARC-Seal: i=1; a=rsa-sha256; t=1795763841; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S7piGxenIQRfIfFugIGmND7h2L/Q/ME+HW19qKb/k3vFGqsNkUA2uhFERE11LTdtKlsdTzcldqq+JTOvGUv3tmiZnSf54nhcy1zfGQGWCTt39r6uaGZvlYblmI0KvYSLE7+TTqWkLAT38kvfURzAbwTnjnelzcmX+4jD4VmHIAg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795763841; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QThccq8aVO4qT5svmvutaMycEXGwprtb+sQAgRodxfE=; 
	b=KmyVbxEnXtCtn+yPS2llXrCywoIg105QHwbYM+iFtu+T5zWCqLqxi5Dq577Lw6a8uOFc99OZgzFU58ZdmXncOx11j45sgXOLudxjUE0pDS9Y8mO9L5JPgCOMwtYgW8VCwgPjpwS96qpF17uCl0BcU440mfOafAs4k5h+Tbkvb+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=koyXUugtIGFaI3oRPdQ/lKnH8TJmMOlJ0tOcQ61edgXXMngNR8tfcnhtJf6uyuNTu0oth5FYuwDiU+gd8LK7ROXtELehd6aFL/WDnnEBP7z5A4W67dwD7fkaRffewTXTiRITRrhCBh1b93JrLYkABfawEZyMRtcyNcsObqjWzrE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=QThccq8aVO4qT5svmvutaMycEXGwprtb+sQAgRodxfE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795763839368810.0143316630227;
	Thu, 26 Nov 2026 23:17:19 -0800 (PST)
Message-ID: <d83e09c8-cfac-46cd-83bb-d2ad751fa6fe@collabora.com>
Date: Fri, 27 Nov 2026 08:17:12 +0100
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
Subject: Re: [PATCH v7 0/9] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY
 receiver
To: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Sashiko <sashiko-bot@kernel.org>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
 <CAPwA33K7f2EbtH8rqihnxB8RkB1PzJTmDyGJ39ojROuTYwK0Dw@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <CAPwA33K7f2EbtH8rqihnxB8RkB1PzJTmDyGJ39ojROuTYwK0Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Jason,

On 11/27/26 07:24, 楊智成 wrote:
> Hi all,
> 
> Michael, I kept your Reviewed-by from v6 on 6/9, 8/9 and 9/9, as the
> v7 changes there follow your suggestions. Are you fine with keeping it?

Oh yes, absolutely. For the whole series:

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

> For v8 I only plan to drop the Tested-by tags from 1/9 and 2/9.
> Please let me know if anything else should change before I send it.

Please go ahead with v8!

> 
> Thanks,
> Jason

Thanks and best regards,
Michael

