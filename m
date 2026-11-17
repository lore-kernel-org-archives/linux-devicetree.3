Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943921;
	b=i6bo87ijdMrXIDDVsm15tZvgrhnOld/1YSU0CT0ebHk/Z4POyOPGG8Wl5px8dZANCiQ1
	 NGqT2+ROARSAENovsQtWqDi8YSz4uOqTCEdINAUXCTHoWKOpwjjIGT/HthtsMJucTSSu7
	 DhM5bGC/+imqwdZLwgnDm+hfbtQ0D2s+5mlxU4yG3bw+dQIu6q0E8xnm16s7W0b5W6wxw
	 7OvureqCkECwBEW1fjVyk7HxoDFXFg3lVe2cBBrN/NY7/pkVnNvbcjZ2hFD/8bsjs92fH
	 glSm5re9msLxMY5JgHhoUAjeqJ/lEvnHAVbiI7zTrLN/iRYMdnPsdEQjW9qooaeYxpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943921;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=q2L8DXdCwld9OCOazUytyYg/1wnMDhs89QIOzCqPxzI=;
	b=hhlTM3KZ6MOcsQHlWEJ0B/rRSrTHmgTaYzXQ63GWph/AEYLJuZnp9s4mdvavbmiJNk4G
	 cGwYwuoRg26Cz5lOwD//eKOhkqd0OePy8g5zdKJLAirZ8bXQwiAwoI0sIDJEzF6iHVdu2
	 EPkS9c7HXkw46HQww7RNDE3gZkbtyOcjqBJQJ0wolPGcsUDpw6TFAtUy1cqjHe7jI9jFB
	 c1Th78qKDBr9fB+uMmWnT31QcbZVCSAEOTFmcip+0fB5HAgXRNFXF7yA04OYGOrRB2f0k
	 g0ETQFlwTysITlwZbr2Udt+Y48pCUg/67P905Sricly/cmWtfCHi4zUAo+S03F1MBbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023BD606A88D
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 023BD606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso132416a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:32:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943920; x=1795548720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q2L8DXdCwld9OCOazUytyYg/1wnMDhs89QIOzCqPxzI=;
        b=RO/fFYgmVQ+Ly8t2DJIGq9gTdituMf7mksFhVHbc6vwjzTZnuoJ7V93bw9Rrrxh1RM
         S15Pz0Xllua5dIkjuJD4+wnrLkQoPMqMHRZJhcs35c5rED00rkKipS2o5LGjbdirMPCJ
         bpiQRH61kmStW1OhPTpXTCfDUlmQIwLXjqx16RUT2x6rF6uPoupJTB7RmtppV/VZupGu
         7lwnMnJHmYGC3vP5MtziNxW6E8r1aBK16L3qInnICZVOIfW1IA9rj30Y0v8jpdD3nFCg
         AONg9qI1Fz2BSXkso8yT+ftV8WoIGjhNP5Owj8PueeuyHwVIMfikIscjYUQaBD1O4KxX
         RHFw==
X-Forwarded-Encrypted: i=1; AL+hErEEOXZizs1JwjUmr3EwoTm3Oc54au3TzJFB6ALp3iBgAKGldY7SdmN1O2HTW72ZRHxkuramm/HYk+yQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8AObqMagqgysng7PVzsV9rWbwsEKAkynT/StXyVzx6764R1U5I
	PqSXdSnjQberXvoRwxNRB7leC6I/Q723FmUfF4KN0Skss52nGp30LpNfXQ/XkbX3
X-Gm-Gg: AZFdTZegXKgmgJMK0Mfy613MdTDzQs9OPXNUuwdmkiILi7PfI2TFf0s57HJpWFpy1EG
	siDQMAkNznsBkLi8PXM8AZ120HFclO0d6GB3HD0Zjd+W+GIXFuTlNO3DbOtAXEFiKuP+1ZO8nCM
	Q/DECsODIEVA8FsM/qLgAJm+Mhy/Ml90n5nUTccUA34B0l6HU1Zdy96JBG7Qpq5TKn6X60Mw0Co
	OEyBO13zV14hs4iy8oqUpl8VRK0RLuvTGRdoeioWfeVU46pCc8kFBf9mgOP+kGlFVz8pGPmsn7b
	td0wd0xliBfzHjOENUi83zQKaGi8+Wg3G7e/kQjDykNDof0gDtf1AS615bAO6BYaYcf1QyNIZ+m
	+gmi3QQ92eoGiq7xsbh9Bw0VUpGdGqjLqiQnnXLV6qlaHXfyHza/ya3hTtkKrpiO+q+v6IEbljl
	VKpAe1ZgeLidovSgZR1EaQsF8zsNrB0Q/AIPfgXJe4HRx35Jz28CTXTj3EoNNgdaPL9eLMTvkA+
	MzILDbQmnpiDqK6YvPdAgz7377PeBYvfbfzYjWTN7VEFcWaircyq+YpbPzDWj/3y25f79n2vKAl
	auxwzjdb1Jsvog5vUVUUV7ud5i0fRtnci5+w32BLzpRCjhkPTcamE0bvf3BrpsqiTi8cDlwNn1/
	kg1zKyDzNh05yACqkZR8NLrb3pPYmRNBSyln1genk
X-Received: by 2002:a17:90b:2d86:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b3d0828c40mr318855a91.52.1794943920316;
        Tue, 17 Nov 2026 11:32:00 -0800 (PST)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com. [74.125.82.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff627f421sm1823515ad.57.2026.11.17.11.32.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:32:00 -0800 (PST)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so405312c88.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:32:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFGcD3UBS+ve7W1zEucHBfsCQMEoGj2oIAfNA6F1QqwAwrPyPTYoSADw4SoRD6kLxyrBdL0oCJWuOjq@vger.kernel.org
X-Received: by 2002:a05:7300:c382:b0:35d:4185:5395 with SMTP id
 5a478bee46e88-38280c3453amr432872eec.16.1794943919489; Tue, 17 Nov 2026
 11:31:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
 <20261116-iio-ad5246-v1-5-ef6b7c06d4b0@telaak.dev> <avwP2P1zTgFteODM@ashevche-desk.local>
In-Reply-To: <avwP2P1zTgFteODM@ashevche-desk.local>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 14:31:48 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4zHV-wCszetvFnVNA=v5O_rhY1YAeMNhS8r3nWC5wJCw@mail.gmail.com>
X-Gm-Features: Aa3M54rCns0V1-iSP2as8kRCd3gnBbNDEFw_nlMpPdbVKkD4iVYzP69Wrp7Z5RM
Message-ID: <CAPY4CJ4zHV-wCszetvFnVNA=v5O_rhY1YAeMNhS8r3nWC5wJCw@mail.gmail.com>
Subject: Re: [PATCH 5/5] iio: potentiometer: mcp4018: Add Analog Devices AD5246
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026, Andy Shevchenko wrote:
> Make it shorter and more generic, in this way you spread the same text to the
> top comment in the file
> ...
> and to MODULE_DESCRIPTION().

Will do in v2, with your wording.

> And here make it list that is scalable to expand

Will do.

> Keep it sorted.

Will do, for the DEVID comment, the enum and the cfg table.

> Why signed? Can the HW return something negative?

No, I'll make it unsigned int in v2.

> Strictly speaking this patch can be split to two:
> - adding 'div' member and providing it for the existing chips
> - adding new chip support

Will split it in v2.
