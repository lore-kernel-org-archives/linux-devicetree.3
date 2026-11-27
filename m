Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821031;
	b=jpSOVTNF8G7TGQ5vzC/vB3id1rt9GdfHvExzzeLgC3k7Ndn6UbOenacQGsXkRWAFcY1p
	 Tj74L1LVaYFQsygmqFHk2xkuaFIHSlkI7x7jxHKw1nygUDh51yAiVCE8Sq+WBpneFAVaM
	 lbK8u0NpmK1UGaPAhQgcFHmPLOBvxtDTnz62UZzDYVzb8lH0AVjbmb1VCSNZ4L0AsYVym
	 +BGQ8apjTzddQeq7Iwa+72U18n0IrEJLxS0ucBn6iOd0/Oda3Dm77i7murLnmzPq4V1Pb
	 CuB31JidEPxtvEweKmuQHV6cCe4GZOxIrEgCZ6LAAij0avFOytbqBDSv2MCew67jlgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Npnml9QjZCRfW4O0nCOfULU4UHnXEPFvx98UTggm7eY=;
	b=B7W1f1CVlrLVO1E4z8fytJgMk1tNdXMsnA5p9SG+Wx1MvBDkhLQvm4LRxPFg8KKkP1WK
	 5OrCAy36xlZbpEiiZiFHN4SPETYt5kjfuWymwqAOSphVASzK/yx5iJPLHRfZn5VQDo2N8
	 EDbDdg7TmtbnpUgORwbbRB1i1MEvjH+J+yns7IGqzsevAlzfKCsZAz079sE/rDw8px69H
	 o1v6bPbI26DCuhG2bwMzgC/MjCC0kUFKIyQfUxjjXGk638zoGrXrWgI5I+v80bQTEZGgd
	 ZuoAmEsk0fVUYmHfxHGhqIDicbc7GgMGu8lSDryqLQUiETI1bIqQAF0d1kOh3Hb/R7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdMLsdtM;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47E606A333
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 23:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A47E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdMLsdtM
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so12770658c88.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821029; x=1796425829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Npnml9QjZCRfW4O0nCOfULU4UHnXEPFvx98UTggm7eY=;
        b=wdMLsdtM1kKvSZ9N4l5HDWzkx7bv475oyue/HJqsujz43yapjHIUMIumdvYiATnMky
         BtrorKgqQ1x7X6kvBD1sTASXyZOG71lKktkNgv1MB8ZUaJQ/iUBS+ZREqV7fUm5u8PmK
         AUB8d8gjamUQyCoWjvcCkwefsymE4g+SLMa7xR5XK2JxXmDrdyVkqtqC4278gDCaM2dy
         xIe2Ltmzr/loh5OHUUJPsIBJQwQG0MqNY46rDtO/dYbh+xrmJRks8O/AGH21/3yKBVlJ
         S29Or3EbyBpXHk+jw0H8umDQl8JG/e73In7Dp4qdvj4jXYAxJNm5+JUJaYnCdKQFy6pk
         A4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821029; x=1796425829;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Npnml9QjZCRfW4O0nCOfULU4UHnXEPFvx98UTggm7eY=;
        b=FaAV/X54AhUOnscmAKfREs8SHwYZLAgMhA/J3IoULYIU1uS5s+FJiDq3/JBvqEvFgG
         hvVf/I5ze6sNH+kch4VwGS4UPSO+6zawtqd0b5ECJlIHW74qfwplbI/r3S4dipWl1UL/
         oOLcMSW+MJVjrS5zy7LboyFQsArAU4GZ2N1GCf6uwjwVVd/fXhTOJach97hWd4nx46rb
         WTqfE1fgXwF/pYb+X5yDkd1KfOqTXcN7pb6PH6HCCyHiSI8OtTal0IJgVgn8RAQODrK3
         HZ5evEnW9o6YgBKn0SrmkvPKx1aAVgVSk/1oPLH92dIRalRWV9NzAnCyvhBPz+rINM18
         rKRQ==
X-Forwarded-Encrypted: i=1; AL+hErG9uWVWhS/3BpXoEDt6TXrtRTYa6HpDh7wLO+orZrLGwmBA6l7YZcGK/iXtlbemsWysZzyb411xLkrf@vger.kernel.org
X-Gm-Message-State: APuU4Z+2JHWctTGKN5IOceG0BKPFq/XgZsg0HnFcucBJ1/a1ZGhjUgeL
	QORnOvlT96KdMnl/Alg8qMo4rVI1p/WEkPjSMYTzGp6l7Eb0+YyMCt4R
X-Gm-Gg: AZFdTZcWZr1h5jcnMb3JfM84aBJ9KcZ4K3c4F3vpMQ1xoOmoBFYlo8kEfuODZr7D3KU
	fGIkgfN2NdNs15GcNeTvRdSSCKKnD+TayfgPx5GruPfcdVCAe+ll2uKy9nvXCUYA2129nrycJRg
	Y6W6McaGgNzZlZ+CXB3l5xmf1G6d3jzthkaj9PG4QNyaQVTcMTRjYFP31dO0dADIQ6oyLD6Ixj+
	5uWHU8vtb44/plxpzVI0OmM7z2ihJ/nXG/UA91q8FsnblXJtizrfB0Lju39WY7XJuY4OU18eHb4
	POvmSLdSZFFRGSsJQaY40KuPbgroWbNG9SDZMTlsuzE85dl6hk8kx+wC7w1cfKxVs5mAX+E2afn
	JIyElSQiG4HkbabQetnLRmtWqb50iE0ifXaCFEiED+eiAGztIDx5VKHwVhHM+WkKl4QNbqI6to5
	dBXeSSwrsT+xxPPU0+63WbrQ/ifCNDZJdAjzuCQf+dfuYRtCfr5OdlgD9bAEiqhG93Mt/64jolK
	VkomVjpbSrh8aDsM/GTJ6KdZBYZLTJCZJREKduxcIXQgZ1IOlHji96gn0MGx2FWKVhIi5WLQ2kR
	UzVwt7kQ7gjl5yn80rwaTLzkJ3pBrRAXnQkqy2by5L2KCL+6H3WQJoyOdWZ8WvC+lPI8SPtZ5Pm
	ghfSMgaT7dPdM
X-Received: by 2002:a05:701a:cccb:20b0:1b2:3448:840f with SMTP id a92af1059eb24-1b55686ffd7mr22573107c88.7.1795821029109;
        Fri, 27 Nov 2026 15:10:29 -0800 (PST)
Received: from [192.168.35.60] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm58344032c88.2.2026.11.27.15.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 15:10:28 -0800 (PST)
Message-ID: <4ec06942-ad13-4f5b-aade-d6ad3314ec98@gmail.com>
Date: Sat, 28 Nov 2026 08:10:23 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH] dt-bindings: extcon: tusb320: add SGM7220 fallback
 compatible
Content-Language: ko
To: Jun Yan <jerrysteve1101@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Auchter <michael.auchter@ni.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261010081907.479226-1-jerrysteve1101@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261010081907.479226-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2026 5:19 PM, Jun Yan wrote:
> The SGM7220 is register-compatible with the TI TUSB320, even reporting
> the same device ID, so it can be described in a device tree using
> ti,tusb320 as the fallback compatible string.
> 
> Link: https://www.sg-micro.com/rect/assets/bec47c84-84b4-4015-8d61-9433e0d76583/SGM7220.pdf
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../bindings/extcon/extcon-usbc-tusb320.yaml           | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml b/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
> index 126107dd57b1..f88486c2fb09 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
> +++ b/Documentation/devicetree/bindings/extcon/extcon-usbc-tusb320.yaml
> @@ -11,9 +11,13 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - ti,tusb320
> -      - ti,tusb320l
> +    oneOf:
> +      - enum:
> +          - ti,tusb320
> +          - ti,tusb320l
> +      - items:
> +          - const: sgmicro,sgm7220
> +          - const: ti,tusb320
>  
>    reg:
>      maxItems: 1

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
