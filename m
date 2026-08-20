Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19ED3EE1F8
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217977; cv=none; b=JTivuRI71hgsb5688CZFPmGPdKudDvayE8sMsSXvkOkYQ3uEjFMdF7dq0wp2e5Gy7mYp9bHWu1eyLZrznXtFv3VMkkrGderbUEPlloFTlzsVB991IUBdGUJL9Kgg9dEu1Xux66qUFl9apVShwULaMZeQdo+TzWrJ0VxcR8dmEEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217977; c=relaxed/simple;
	bh=3v8CbSbKdFVV/RjS8CpC/g5rvbPZ6MrtTulOIvBnDLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=La/DfuIhO4xp0Rr7mf9q26gMKR0HhuHmR8MtLerf2vu//vc8JCz7YYA5PR1ngQS8imcHyvtQjFNvwIQV2OusoWy9f7lJYJ0nkQsw2G2ekcgbzjASWb0nFXWuxMvJQW/IqZy+4K+jhUxywtqR9yzoT8NV7CDzbjXpUh2EbFN+beo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b=jrE1Au7U; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b="jrE1Au7U"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84eb992a881so1612135b3a.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20251104.gappssmtp.com; s=20251104; t=1787217966; x=1787822766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzjBZTtu53iWfTHftmKggPYuL4K3uk7JwnFJe0vNmS0=;
        b=jrE1Au7UIuqUWYwSAgGzCN8kNsWAcORNfod6US5g6hdgcCi+aBsrKUBGf7X/MMn+sK
         p4ZSYKYI7WI8SCGxmZrERg8yEFA0htUjH/ElIpuvHP1KKrJGpatjPE2kIRChCTve5kbP
         YdBk06roHFVQhB7WVOpBup96CKHUUrKcL6hLzDuzhqDO+r3xVSx8H23em+cZbS5Qz1k/
         TN+IUZl3Qxa5oTIv5J8KCt9m5RebJx9QB/xeWKVMMcio0evTRyhGA06BGRGn8fAQUvHB
         974/lLy8Hv7BIXywpc17KgCZHrEXBzdKqkhPCjxqlFaII8Ye7dNsnA7HFc1Mjjdljsp2
         XSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217966; x=1787822766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzjBZTtu53iWfTHftmKggPYuL4K3uk7JwnFJe0vNmS0=;
        b=om11Oit03MVvS3pauTtaRsCNfPTIJLrAn1603K9re1iSPTZXTzCV9Ezxc3ra+Oqs4A
         ZK3tZ14u7HIUGDh7SP7tqxIf9+I0mPMhWyETn6YYJrUIJrKNeK653PW5Z0eQBbbf5h1A
         YBy6jkDuMrzAPAZRzpmu/Vq/vij1sFI9YfGmAyozuml/MX+T9eYjAVLde7uD7hdA/fX/
         2U0LKaT7UC9FAexFMWYMBvMGBiFXNGqlsH5UPieKUSWGgRj9Bw0MzW3ajIGW7BrvoXxX
         kmTD3Z45Si143wjaTwDi5VSCEffj2EjDebU5ZvhlaMzHfSvSOTVvDd/7vCtIr56wXjmx
         zz/Q==
X-Forwarded-Encrypted: i=1; AHgh+RryWhdU9x+mEp8ert2jqYnOh58jcC8OHkHHs21UEi8U1ImPgKAgcxThNjRiJX/MGhJvxrOXZTAhy0c8@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUnyMvgoTfU40tG8N/0RPcfZ0/kf8rBOtAuyfJ3tvjM8FGR23
	Do4JqUczzEqBnZzkXHcfCH/tzU0UbbP7NrM0VoC3YCGXDShVk8QSMa0sRqQ+XL+DvQ==
X-Gm-Gg: AR+sD11hp9ODxwE4k5ZJpu70X6OsISaZQy5Cxm7KhjzNRB8L4NDZuAQSiTqEy8/i9M7
	mJ2w1swafOa8NerJE6KJ4ToXbJVZjUIvUgnLVfZJpvbWYyV5PR6ylaoOgrki1E0ntvHneg04Cst
	k1gm28GpOQnhLb5JrCsKByChZzXm5SeFnZG6uLjFHoM01MWsDhW2n/BGMNrl4lweyWkyIfiFHIE
	yVZNyAWQnGWzxBkB72ieaxjoFIJzClaFqcDDO9ubSQsNIJMOIK4kzbwaaXsz6t4IjuAD+TrgZ99
	EewWNaIbTt6P3ffsP4CsJASVW+KvHldM64VxkDT2SENkv9y32TbbVoA50q7sQWjjcUoGPcUJO4D
	IdEMDADR2Vq51gfyh80IsFPHJoZyXB24EMidkpVJKZb+eqm8nqpQzk+uKZqUjT4ZjYRUsswzlMC
	xVhoDsGHjMJqphkDHv5ZCS/V/9wcgt39rH7qtaRv3leoBVJoOcp/8W7W+KVN1FdM48LMa3bBM=
X-Received: by 2002:a05:6a20:3ca1:b0:3c3:66c5:68d6 with SMTP id adf61e73a8af0-3cd00f77410mr20716026637.9.1787217965814;
        Thu, 20 Aug 2026 02:26:05 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm25903254c88.6.2026.08.20.02.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:26:05 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 20 Aug 2026 14:55:43 +0530
Subject: [PATCH 1/7] greybus: connection: Export gb_connection_get() and
 gb_connection_put()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-gb-uart-transport-v1-1-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
In-Reply-To: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
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
 Conor Dooley <conor+dt@kernel.org>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=3v8CbSbKdFVV/RjS8CpC/g5rvbPZ6MrtTulOIvBnDLU=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqhsgcsGXsXSPB7SXci9/gMJrvKggOA203vrKBM
 soP+2HaYsqJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaobIHAAKCRAFzvXHieVa
 dEdiEACWq18kE7iI+UXzmz+hA/pJvhpAA4AaqDxNGkfh/85AAI+4vtEkocPh8pN2lMFEPZY2Wpw
 fcBkT88GupqSEJOqjq603FuN15iH0mpbpIBqHdSZiddqlWT1VcFcIQlLRjs4Wf03n/Axqvvx8HS
 83fvE7JcXHeo1SOVBAaIgWmS4Gx4vjHT82yLvYVn69M/gmQcy3XHbUDjJqvevjWAUqrS1z7/XTA
 dFh1NHDUC4F0rdv7A7yIFIOXJz9m/6Fj5U2tH77yqH5jL+2Q8duQkQOBIgUOeZ2iHF6GMfQNsmT
 FAbltVef/eV37V7aAlwvdwJkL5P7viP776sUt1pl421yvjdbnH4IuOaKRi81uTltnJPoGIRS6O2
 pTIC3Wu/cnS6x4DIjdmFJou6ThaEIZn80ucHDpB7xCKmBHLl1PifImdKA6VZhJCN8SATJjHGAq5
 9Yr5dwlrC87firFBxtQYeBqPpucQsWlsb6RBfRi9sp9PGHUwSr28JHqNpChqGXlrJFIOb5TqfN9
 9bB9w0ErZgTmfhr66sQU7+j4Xtsz+rtXx84s0GKCNymCtnndaznUcnGKCrb119Qpuu3/BdAOFMv
 c04gCdL5nKzj4hVP5SH2Hq6Z85S5q/QP3nU98bycEmOrDGUdslNXNxQMqoPiFPL7ZcDQFTkT5NY
 ca5dS2Jjqof9QNg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

gb_connection_get() and gb_connection_put() are currently private to
the core. Drivers that hold a connection reference obtained from a
lookup helper need to be able to drop it, and drivers that cache a
connection pointer need to be able to take one.

Make both functions non-static, declare them in the greybus connection
header, and export them so modular drivers can manage connection
references. The first user is Rust greybus abstractions, added later in
this series.

No functional change.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/connection.c       | 6 ++++--
 include/linux/greybus/connection.h | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
index bd04485decb3..f8fda22bc466 100644
--- a/drivers/greybus/connection.c
+++ b/drivers/greybus/connection.c
@@ -33,19 +33,21 @@ static bool gb_connection_cport_in_use(struct gb_interface *intf, u16 cport_id)
 	return false;
 }
 
-static void gb_connection_get(struct gb_connection *connection)
+void gb_connection_get(struct gb_connection *connection)
 {
 	kref_get(&connection->kref);
 
 	trace_gb_connection_get(connection);
 }
+EXPORT_SYMBOL_GPL(gb_connection_get);
 
-static void gb_connection_put(struct gb_connection *connection)
+void gb_connection_put(struct gb_connection *connection)
 {
 	trace_gb_connection_put(connection);
 
 	kref_put(&connection->kref, gb_connection_kref_release);
 }
+EXPORT_SYMBOL_GPL(gb_connection_put);
 
 /*
  * Returns a reference-counted pointer to the connection if found.
diff --git a/include/linux/greybus/connection.h b/include/linux/greybus/connection.h
index d59b7fc1de3e..b53aad2270d6 100644
--- a/include/linux/greybus/connection.h
+++ b/include/linux/greybus/connection.h
@@ -128,4 +128,7 @@ static inline void gb_connection_set_data(struct gb_connection *connection,
 	connection->private = data;
 }
 
+void gb_connection_get(struct gb_connection *connection);
+void gb_connection_put(struct gb_connection *connection);
+
 #endif /* __CONNECTION_H */

-- 
2.55.0

