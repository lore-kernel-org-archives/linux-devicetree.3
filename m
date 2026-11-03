Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722379;
	b=UCK0s+mQAt7kl3OUfAyTV95PNcqiIduqiCpNWvGpfCTH6pk/PM8z1rN6C8qq6n9iRfr4
	 9M4fkyXKn7ZCS94J2VKhvED3Jwrm+NNKvk5KW3Uezvwedhfh25UmoF2brNoYGHQ1c1FZc
	 7ziXgq+efJu4/nDOeQ3WUedo86omkh/LtjrCFeV+O13fdJzjg0ps4C7YsD/egITf67FCh
	 HEOtm1N4/5/5ctEKA8RJ/JIr6fb99e1+U0z8uWUCj0KlvEVlcMzFC+0kPdqgbJMOtwAB4
	 U+aKTBhlKHeCfoP11J7VdP+M3Su+P/nFha/qIiWgWbIb7N5jrt/XUBIBCjHiEnrXPJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hSMTNzWMANqWlYxsoyKc+GU1Gc89Y6rRwgx6/XfOORc=;
	b=BTTmCdTeejjnhww5dzeREI4xV8i5cGe7+tjayUXLDOdAHHLF7vfjBThscb2Q2KSfDoBz
	 GGGfflMqz0QX9DPSV49+MhV21MmexWChYt3EAbAHbzfhxIRIoh6xJiN0HdisuLeINf6X8
	 hOCVn+7/eQ2lczTfB0ywQi61KXeSbZME6OcVknMe+8TgEmymR/KiJv0hZCtI/ftJ+NmTN
	 rTBx5ksjdYYvWLr6QoEEGzxHqHSQfHCABra36Z80Y6C7JSdK6Gnsa2ElzqDcT5HcfDIlP
	 kF/jgBVeoD+l/S8E7hD2MaCyMb9ZTTbDkSXgsX+LINiMbmYG6HLB0lnOmf2MR1iElFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=TCYWmWZa;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD705606D80C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD705606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=TCYWmWZa
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-19305bcb72cso3244529c88.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722378; x=1794327178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSMTNzWMANqWlYxsoyKc+GU1Gc89Y6rRwgx6/XfOORc=;
        b=TCYWmWZaCqFgI85/TpfZ98KMVon3DiDgKRYugDv45+Q8LmWrfKTWHmkQVREtB1tiRx
         HQaCVwM2bFCOsFjmHDsVfvukyXkLHpeHkz8L6tzGFmp4Oy7hTXPOgDSK4F+bz9ZM1nWn
         ZyybP4J0HhQdmsKH+71+tD5JoXFNwrR7dXp+ONXXGxcXQm+sGr3EmsChLgMSeLCvTYB6
         lglkvAXOHOuUbxWhreMXGQ+nJXAk/p3SQTCaBhJxEumAxdM6p1QY1sPEAFaZPIDIki6v
         rRfxKuigPTgOvEQuuUZZ8BD4LNbeIy/kgQYu82lGi1BCREYdM2Tn468Am15+Z/b54pcy
         aN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722378; x=1794327178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSMTNzWMANqWlYxsoyKc+GU1Gc89Y6rRwgx6/XfOORc=;
        b=BBLX7ktjKTBP2TMLp9Jc+Raw8kkjOUoD8ETxhX5HANtz3JOUXx9CAwhlBmUX2XCsR1
         Lb9n17zEb+/5p+Hzx/mMwAxjg8IsXjLDqE7mUBau6nQGrK/HdUH1UdmDDLtyKH6AM2O5
         L6oEvWf/5tVOsihO6cd0bn13mYrctq6UsE2f8nMoqdLW7yDolEKErMcDVBtYf/oyGwkk
         THzUMYjSgs6iJjMqreQ1mv1C2zrUemyE3BwiLn8dFPTwHPgtvrtLKW7MgD1xrIjOj1N1
         p8wqN1XTqMqdGBBg9uzugfl7ZEYgGZuWx4oS8Tkv2f6VZ86S+HsGwYEGYfZIhzV6KYR9
         Llfg==
X-Forwarded-Encrypted: i=1; AKwUvBzfTmYchcRcZoWYI65QL/ZipkltRxd0TnV9oKVZ310gX0/YsjMzRORS6hsOevUOtz9rQgaPZaP+kUTc@vger.kernel.org
X-Gm-Message-State: APuU4Z+CkwvF8YZl5R4PWa3D3xXjPH5Tm/RvFop3KagoDnbJKizFgFmp
	LZ24gmtrDbC6/odQWDff1v2Hx5yz3V8Ik4kYpWNDKmX8Syx4dhO74mI8Kwqy1rEJAQ==
X-Gm-Gg: AYBFou3Hzc/Ful56QS09vDr2T++CipC+Q82ovnvYyy7ZTnpko1znIODdIFbE0F1uqyC
	Went2v/hAmDgMWo1pim1l4vUrevPlkE/j7bzYcGjLB11+9n1k3wpkugtpe9HLpuFxubCZx43Edj
	uH5FEJCF0xNidMzPm6ZfdIHPnLUR6auW2zSr4QKYfj7eefT4HNTZIwNyLOlCZocxDllXssUQpmQ
	I9qKTKyFpUbi4md6hogzwx6+B3iUTQcHsMgjWMzBctovTdAsunDyg0fZj6he+Ll8DlaeE72SFOi
	bZnwKJq/CZG+C3LIAbiiuh7cnhLxVGEx0B2HicbRZpPAzGKnhnjrwYKY9F3iIg2d9Xp+B0ixcl5
	sOnTuJlWE2FgELg28r6/2Cr8k47DSmJMIX5/L8FEUpH8VnvJGjk6JdA4D6MOQPSOj42bJUwMrxU
	p5vZVofttODTYNimk0H4b2DmxXBVdLfFFWLhCXpvSqQ6b7j2DHEQg+Ceb/cILx6AdrPkWoowAJ2
	3ATUd9APr5q8O1DFgfOoofXQOxETBL0IwFPnXlEplkTWKlBQGoUw7E4TD5TnnlAbIJwBASFkpM4
	EQVyrs/mflmpS0loC4G3gzJIvaZkb5skmF7YG8nC
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr21210378c88.26.1793722377822;
        Tue, 03 Nov 2026 08:12:57 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:12:57 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:50 +0530
Subject: [PATCH v5 3/9] greybus: operation: arm request timeout before
 sending
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
Message-Id: <20261103-gb-uart-transport-v5-3-f8e326d6561f@beagleboard.org>
References: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
In-Reply-To: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=zpOdmfpBKhgDMSZ3lQslDxw8tphqN8m/HcEZLtVnRY0=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gffPq0afsUXss+TmBdVdcpnwmES8qvVoLoO8
 fS7Dc+JsBaJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH3wAKCRAFzvXHieVa
 dFAUEADCzZFb4PmN4Rj+2VqSKvaqBBqV1/9MMgt1W+ePRdZqR2RiTnya+lDjXg76JvCKC7OaJJh
 tPF4igoaNIvSeMnln1nUF/c5JmeqXUOvtr8iZNVddhaKHTBjhu8RO9QW5vRmymDn9VHi5y5Zc57
 jdRvwIzTBspkV+aeZw3jha9H1VQxRQZ28Elj0GMYRzcV7hbyuEerljz0mC+sLJ7DQH7K0HF4URR
 mqBQP/viA7KP8jwZyxzha2TVxp7/6qQ7uvlPgOF4ev2q58pH5QgGE0aY0IzdsxEJ9TLEkoE5SVe
 KcKjQI6fj8rpb2dOOIHS/NwNhpcyOFBeBzi2ehtKW0hyb00CZU00Qm/tf9gMnZ19tFLblr0vL9Z
 eN7B3nD4r2RsiYt/JYM1Es4ZjPVhxgWwtupkOf+7Y5ss9qcHGukalGPJSg6dmINyw2kySgXqonR
 EMnhdNMDXQVKCitMDg+GvvO24uGQWvLjlVWmmMnzIRJhNcBN6KZEfk8drCV+YSSehwa7Lk9ShkE
 CIAS2oed/ThFJR9r4Ekh8CENJXPhTKo1FRO3AlMkm3j9PmEtKoiatAbrgnX1jbvFUcRQq3YKyoq
 wWB5Pz8+FmmOUy9k21LGNWhqUeoT9xxDMmTwot0WDvYbxUfr89m00XeYfWozvgbn/GNGrwldMtg
 Z+TSFS87f4yWb0A==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

The host driver can complete a request before add_timer is called. The
main case for this is softsvc, although, depending on which transport
is used, there is a possibility that response arrives much faster than
expected.

By populating timer earilier, we prevent the starting a timer on
already completed request (which would then leak an active timer on cleanup).

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/operation.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index a63bc2eb164e..2d37acedf36f 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -782,20 +782,25 @@ int gb_operation_request_send(struct gb_operation *operation,
 		return 0;
 	}
 
+	/*
+	 * Arm the timeout before sending: the response can arrive, and the
+	 * operation complete, before the host driver returns.
+	 */
+	if (timeout) {
+		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
+		add_timer(&operation->timer);
+	}
+
 	ret = gb_message_send(operation->request, gfp);
 	gb_operation_put_active(operation);
 	gb_operation_put(operation);
 	if (ret)
 		goto err_put_active;
 
-	if (timeout) {
-		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
-		add_timer(&operation->timer);
-	}
-
 	return 0;
 
 err_put_active:
+	timer_delete_sync(&operation->timer);
 	gb_operation_put_active(operation);
 err_put:
 	gb_operation_put(operation);

-- 
2.56.0

