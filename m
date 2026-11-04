Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781884;
	b=IMboamMCDKHSXtwXwkBcNsKPq75PZ8mkVWKDrgWjL4GxjZTGkFHYKFOX9e2F3uGAiyYz
	 Tz7ffM+RIvQU/Td8coXidWQptemvp+Pdt7SyvCIrzOH3wlmTCOqt2VreNGulxL6yZB4uR
	 bGnzmY+2yUQGq+HQvxXqKEJg57LRs3OqnGMd8ooS+sHODrs1OYdWPN/95Ci/tuSgtzwTE
	 /7t6QULAad8QpAI39czjAiTbAlRtiGk/lH1z37YfX1inIBckZpPzYJEu7apNnM8OoyGUI
	 wXNXlkD3S0bsslN/j/OdI4Om6r+caggfYEkb1A8p5IgUm5Lie1GDJkTkGK7X9DU1LZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781884;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=yUcMHykGBsdlMngLe5E8c5GRiAK228iYooBSZKs6auk=;
	b=SmxPvK7rCXQi5zhfbcVbHTJu78gD93E2bIAXuxCzeKA0OD4B/Fd4EaaOl9hl8XNVt7zI
	 2xaiB60rQDqP3Qyv3JpYF5fcHMen2eyVSbaiKG22Oj1VCNamxVI5Q6oG9W3k/gZP9gDBH
	 IFHjLEZZzVm+fiQRS+zVMu11u2VnJjERx+JOy88qtYroBKlrT80/jTdjZ4XcX51FZPhAH
	 ezJiprJJ/yAQ6hSqcV4UcpnmzSe4sbdlxDKZRfcQyzebjeuGQn5bV87p9vAYYin36SzuY
	 RUU8XcC5nlaGkyK6GXucA9hzFgiI9yA6AW3/XmXUH1fjk3DXiHxnzZtUgOqq57K56KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A831606A339
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A831606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1000206a91.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781884; x=1794386684;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yUcMHykGBsdlMngLe5E8c5GRiAK228iYooBSZKs6auk=;
        b=e4KCkfJ1/rkP6ZMcHCgtXb+obrZ0MGNDYxQNE+TSU6D3UG4EpUCL83iO2U6ySmcPSc
         ODYfnNwHqox0PNvri0wjU4l54yW3IHasTRzQoIkiVcvsY853qVdI2netMPSHJZPeJE9I
         E8t5WljVWDiQ27Oz5nvQa1ZAOqLxXQe30Wkpuh++pm+5XB7vYhRsHfnOpJHlBqYAju0e
         gPYtmOihxEu6zYhEJ/pMTmqTcch9IUXPbGJZG51s1JwpPY3KJhdQEpCTMBc9xflxQFbl
         s2NthbFfjN82/T7k3OSGyK09i766oNQvP98l44xFnOpzf1dfeaqPdxTHveLEFWgGDwdf
         LUaA==
X-Forwarded-Encrypted: i=1; AKwUvBy87w7EWhG+eX774HbIQYcjg6zFecUm7hr86R/BN5nFrVO3QmIPdjP7jfBAs7/b6AY6FSeDIPHpazy0@vger.kernel.org
X-Gm-Message-State: APuU4Z+sDUn7D6XdVNL6Jw9cHHTeBk1y3zd+C7h0JEkGiFqmYyqndFau
	FeyENqJb9JbVGDg+Vv62s7ovMwvYObf5mphb9RaTZ9Ddv0acPV/C8D2zYFjVFlJP
X-Gm-Gg: AYBFou2lkfjN7BTvTB075eUolrNzktSuLPd6ic5ABygjDWhVFlAgPcpubj7GP3yf0/Y
	EEpiofoeZK7oqahja7CmhmyTCBBspP3kmzNoNINYHub3F+TN6Z7fL2N/XAMs5me7mkX9NTWB5ZQ
	ixRGv+hfMRTNV+hDJgKqAJZZRaC+OreCBCeIDzScEVrsq0rAACG4icgZuXJXl1P/SL+0XPVdlKg
	GDBD8ZCqh1es8ylhpkVYVGWVyP3oRphriij8FSChvTHCvJgceJXoIYjctHaHtZLiza+vmxQawcb
	b3RJ+/QIp9g+jV9alK1+75loKbI9AOqmO0BeJN66F0Lsbei8ABBM63mwaPLgABzvZVl3tSGBoh1
	Z94ptWHNJw/zEgIvlYgY4Brb2gvjJfkDGdA9/f86lIzSuMhQA8grVYN1H+ZmP3JRjlAb2XRZ+2w
	A+EOxfmT8kYuXTgCx+bXEKDHREVJ1ACrxIRJ5xs46fr8QndF9+l0siJnLyJtNNnUANk46o7wKF5
	UIW4/69lqUU7zBMRE3YoHeGGarujeQ+hV74Z+D0NonCPJnk8N4wVHYR5/ISLVBO5qHcSSJmoEeM
	RX7ObOrtCnseUfZCqPElj2hZs1GEAyC4ajq0bRn9ymAnEKVf4RBgzdTJd72BH5iD9z43OJSgYsj
	UBbhcshQJJQ6cBJFBM1tSE+SxQ9ZwseA7CpZzJTxu1Gg=
X-Received: by 2002:a17:90b:1cc5:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae8917bf84mr9283054a91.0.1793781883823;
        Wed, 04 Nov 2026 00:44:43 -0800 (PST)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096994650sm1368525a91.2.2026.11.04.00.44.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:44:42 -0800 (PST)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35829219da8so1717046eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:44:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxLbD/t6DgViqtI9v7s+iAv0TEdkfHlGIXHznOluAY3F6/dNOSHBYJVjyReTcRzWE9at0Lw44w2gxP8@vger.kernel.org
X-Received: by 2002:a05:7300:c5a7:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-36ca1bc68a8mr2873501eec.0.1793781881630; Wed, 04 Nov 2026
 00:44:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev> <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
In-Reply-To: <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:44:30 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com>
X-Gm-Features: AclHuK9nnsy6U4khk5cNnlQ4F7O21MbUU3fY_2pf7x3dkjkCudC-yc-EGP9flSY
Message-ID: <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek ET6326
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Drop.
>
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings.

Thanks, v2 drops it, and the series is clean with checkpatch and
checkpatch --strict.
