Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514906;
	b=oIolQeTVwsQqtKyBxYB1dDMAoXzHRjMYcLVj85MtrLggAp1VULzX+mGhtxhsk4X1GyZ8
	 HDeQ+kwQUrMNWa6kZoPxIF2sFYgXg2n6Z8pGdMJga71qOuvoaHi+fjFl/1rf2zmFhyQWx
	 2+h9o0dArQut4jKhN9afLa250IyieVzkqYomD6zeJz6cr47gJPtGzFfULKbbk+nZSnUJD
	 v0wynTdRvqimT3VO6xmvncrycGrrHM5He6QVL/BIw+w4JIcSgy4/KC/jbzl89A4Al6iwb
	 UoyG5oTms7FQFLzIXRgZVV2qLSUPQ2S8fcWwqq0nNusqiSSSwl8Y7SiXK2d6Jyuq07Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
	b=aWtL6mC+qmeTJn4U8ZctlWnXJ8zBjlcmXPsiI2MHMCIXn1WHL0bBEGTImzCF+fnrdcVs
	 8KUKfCGaTtRgEojaMLFJsVBEd9ZtH4ZXg4reAT2wug4dLSS9Qs03ECdH0999cWQmFhZEc
	 wk9RXHObdBJ10c87AA387zb6BLhwF/5PI15WLTSSwUkux95GHIdHqK3PFs/Ep++SZhBrT
	 8b5gkQK5HFj50JNvL3xE2rX2YSEyTK4b/fqQgfmO8Tf/30wv6fGQ8jMN7LF5QKzgWpk33
	 iSZDBkS6FjEJNUyowLWb8KYCEd+qg0GjFHgz8vel9I/jgrwoVBDEBz15PFy36NvSZrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=MpsKsNpU;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4060A2615
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E4060A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=MpsKsNpU
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-170135e43c7so1458979c88.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514904; x=1793119704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=MpsKsNpUPa9OV+dFwz6mIl+c77SGqOYzrbVx2rnpteX5BPlPEJwM44zo+/HlLyridu
         Wh5Y6MzKSI6U8paCI7G2guImYowAT5lsf6NLtyhhUaIjEoBLTobTeGX1YeGkP/5OB43c
         IXvGDmp4lpSuJzRmU7B2sYkh3iDXc9nsRpOj6CsO4uatd6o3Yfx3G95/uwS5L7ptzX09
         pGi+0u0SPEIPdEvH0sWtIsOWH8jTd4zf7w4GaLZE8yV9l44zRSNh9XGnUTutIWKTJm+Z
         AmyPoRtzB5LxAC9tSTuEAV+vazbcKN1k/GGXqvPT3+auHUE816zL2doQBTUbeLN7AcwB
         SIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514905; x=1793119705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPcVFMHqz4mnw3Ff/F/mneRQHFwopYrVpU0RUgxr0Ug=;
        b=1TQJDdrLbBUabBwjHtgEWFx9pWfIiilLLle4sEfRLE9b86xC6RYi0U/Do4dQ1HC6qq
         yrYfe1cXQzoRMOUdzqGwzgdOm6hQRomodNWeSXH7XJ0SbfAzYq399U9AgknBdGsUxtF9
         OR8xDWVNK23NZmcV8QI6XEgebmLW1ZJXprMaIbvjpWcvChpSgX97d//zHWt/jRwZHQMx
         RllSCFE+Uo5eceUN5WJW+chjqGERchrOu8tbBqFrljuxBwtVMHnwQMga4CU9gMHH1doQ
         6aA83MpHWcILPgg19qRXsmLJakiazNEmEgQwTORc9tmSb0Ob2yMO5FFq4TF8ave7a711
         8nOA==
X-Gm-Message-State: AFq9FYKIPFSbeVuhTs4YIhY2KPjIgtSftoglLsze1dxAM49u9NrYZ2qG
	HI7f7mZzR0PdYL9y6Emlklco7bpqqg8CNRu84U7K1wErHZ/5z8pmhHergnFPyDPZCv4=
X-Gm-Gg: AYBFou3r+hr7cgsR2QzAq/s/UqIBLtWU4xhbxUcyOZaLXJDghbUph95++coBCFZkQKj
	iB4fjRjMGOoaE6B4e935vrSvzxJoJQ4yE9AbncqpwpiS+lX2uKDQosZ2dsjoy9G5AA+n3+sxzk/
	SzsJP3uHe68AuGJwYUUzTShM94Y9IgP0pOwVZIJaaIYSEZYWdP0fukBlyZ83+XqgdnAFFsz+cWs
	uSpli9ocrM20WDJ3hut1cKb0UlWL5XRimtLYUjq3fy1Bp1831yy/M0269ToyUy4ZQpE2CuTwCju
	VY5CnOlrv5VrVCo7YQQ7NaOrARicyhWnHE7A9+r92WLqZNR/Iz7zJI18IJ+pZDJUViK2RBtERX0
	9ZLdAxyOL1+1VeRwP+CH5BOp5k6bg7mpWDxlfNPKnDeSOuqJnV3FrShD9OQ8PrYK7e+qcSkUOuc
	y54yJ/3wZAsPH/xPh4eF09+roEdEDzFNsaQ1XDvAFRwkeKQFbzElf9ayU3j1IMeUcH
X-Received: by 2002:a05:7022:7e88:b0:153:7a27:b7d with SMTP id a92af1059eb24-18512c381a4mr23295394c88.20.1792514904284;
        Tue, 20 Oct 2026 09:48:24 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:20 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Tue, 20 Oct 2026 16:48:14 +0000
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add TDK
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
Message-Id: <20261020-fs1603-v2-1-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
In-Reply-To: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=858;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=RLHUZiHjILnHW2rcudg+5Lp4bRYjlbIHyQfQJMexFWI=;
 b=YYXyiFzWZmnmcU5S2oOonde7bNLiYUA6N0ss7PIEEY7AN7tqRSbLfGp6g9tqO6P5vmrvGqDew
 z7yU2imn6/8BEoDXMMxHqN9uoxvqj7QFD4cLZ40g0DV4kCszBvsqQKb
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add a vendor prefix for TDK Corporation.

Link: https://www.tdk.com/
Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..b82311759c47 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1682,6 +1682,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.43.0

