Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720951;
	b=lQbcnmCREv/rXv03uX7om5Jk7BaP60u1uRt4Zx6AaKw49SNs/UFuzap0JpcbBUcPH23F
	 yMHfj5RFHXwYZRJwaPbQrCyXtl0jLs0OTmtBQA4IQ3uKd70btiKr7sBiEjusDZeW9fy2w
	 skll6t6sd0iK2WxsbIdAQFahWYesOcYrHgI7KDmlxkaLQ8kOff0hdWYHZ064/Nvlh0yfq
	 Lqbb+AKCdeEauAtHoqzAMGwG8OmKJlHeOWJVj+RE3l6gfF1/sMNkn3Pdrs0aGQqy8g3ye
	 UWf4vCnNCeW9BNAG9P7lhzBhJpZUeRqnEiLxL2u1rigQgwOS7QikA6TZ056DNfR3c8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720951;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=xtYY1ni/jPVazlX7rZS6Ml4RefbM5/NVLUrh9nhJs3k=;
	b=EcJXD/E6ZjlvHIda/w2fa1z/KJFkTKAGJ5vsLIj07TEdI5PrXaA0IzzKKzUOq3VRZ28J
	 fLvFy7jui821PpKFkmaPGTRhL5RFMhJSFTSu2f5CTaiURNMjX5bDfDRE4iF10CiMHzBim
	 ZtBVAwQ1crNVGbnaQ6cVzItTQrl512UXlvQAQNA0bj4/HQbFdaTIMaKxMIG5dx1uxA6df
	 TKA22AaKO64WP3yvVr2qhItA9J7gQEt78FwEIz/93/2xuc5dFqF5epQ8cddkyGPIXgfIj
	 cWyJcs9ionOzxUZdpjVd2wGcqYfzQkA3PmMVec6QQWKrSB1+oyIJx1M/yKZ9lcYhVJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=qjS4jduR;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=GP7oKhu+;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A4606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=qjS4jduR;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=GP7oKhu+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795720949; bh=xtYY1ni/jPVazlX7rZS6Ml4RefbM5/NVLUrh9nhJs3k=;
 b=qjS4jduRS4Zsiv6coXPbfaH9e+XGqs4q2ihHhHsrokiBP/26+cKAw1kRFF1eYdMxYg2L7CmCV
 V+/O5skL6qdZQMrQTbyjI/DPEhF7ALt81xgwzs5dgB8y6TKOewsa0iM6idHDw98h/58qnaXY0LY
 JQc93DBMKFLoqKwnVnJnzXwm42AtWmGlTrlxMLi4fLaAZ1lMd7yOxujzncVCoblG8ic9P6lBYrk
 273ZjjyxSM/srPmJTS1TQ0bMDp9iphkgXqtJSuKXeMCFPBcVK/MP1s5lge/HQ7CQYwYy2Ys0Jqf
 81H/t51Tux8lmKfncip440oq/Y4+BemoXsLh+2ndxjjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795720949; bh=xtYY1ni/jPVazlX7rZS6Ml4RefbM5/NVLUrh9nhJs3k=;
 b=GP7oKhu+bpNFB+xObrjHquy2UoP/S7BPfcxDiY+8a6/Ec0KZLOL+2V9Jw2MVZ4Kvx+bZmuzty
 N/GCBt9MoLvDBjCJaOg1MrLPjPuRp4jYPm4R8EK5Hy0rIsEX3rBovGLTLlGklaNeo/Jn5DlnYf6
 YMuliIyIQW2XQNRfWAmMvcw=
CFBL-Feedback-ID: 6b0886f4db90085b74e95c0c:357941f6256b17592609bb13a46c9175
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0886f4db90085b74e95c0c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <b2e8d547-dd57-4ce4-9019-372d3dc962d7@kwiboo.se>
Date: Thu, 26 Nov 2026 20:22:25 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add ArmSoM Forge1
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20261122184532.1300004-1-jonas@kwiboo.se>
 <20261122184532.1300004-2-jonas@kwiboo.se>
 <8fc3f505-61bf-4a6b-80f9-1cd6bb1e698a@kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <8fc3f505-61bf-4a6b-80f9-1cd6bb1e698a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On 11/25/2026 10:45 AM, Krzysztof Kozlowski wrote:
> On 22/11/2026 19:45, Jonas Karlman wrote:
>> ArmSoM Forge1​​ is an industrial-grade product powered by the ​​RK3506J
>> triple-core Cortex-A7 application processor​​. It is specifically designed
>> for industrial gateways, HMIs, PLCs, handheld POS devices, and home
>> appliance display/control applications.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> Malicious characters found in your posting. Dropping.
> 
> Be sure you use standard tools, standard editors and run checkpatch.
> THERE IS NO way standard editor can create zero width space.

Sorry about this, I copied text from ArmSoM webpage into VS Code, and
nano did not show anything special when amending the commit message.

checkpatch do show a warning, however in terminal and editor the line
did not look too long, should have trusted checkpatch :-)

  WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
  #9:
  ArmSoM Forge1​​ is an industrial-grade product powered by the ​​RK3506J

Will send a v2 without zero-width space and have changed my git editor
to vim to help catch anything similar in future.

Regards,
Jonas

> 
> Best regards,
> Krzysztof

