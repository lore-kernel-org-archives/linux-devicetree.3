Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721612;
	b=230ztupepxiwvxLPtiwtasTcWc1nzDM7uFGgZ5fXHZljTumNaIS+A0flxAyRxXUl0zD0
	 CbYg1eLRrpIzCSIZmo/gdCEbtWxhPS/prSHhnAwm4H3QWqBbzn2v3hjA0LI0weUa5rCDp
	 ZOYYZd+TSOh1rDnxbf4LnG6HeZaadfgiEiNnNPjf6AtoArJs3OAdzl8DoDrd338EwsA9a
	 rGkcZX0r3PoeVw7o/QfOUUUBb2nc3ycV7wawfa17sSNf5+/7kjvWXsNFvO5XVOYLtgx8o
	 cM1vh4NQ4DDDcWZbGdUaf/C2Opj7CUY73iS9zJElXNZ71U+0P66WeafDPGr0hv7tYwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
	b=CojgyxTRILN6df9atnWWkbcf2YZrrLvl+gJ6S7nIQgGsA0oEplis6fGcZ/jylKsd9EH2
	 7cgCxjbn7fUODfl62fK40BUab7nBnIP81odMRwfHnr6+jBsgfOZOz8BQjS7jWP+H9otIh
	 K4LFtUlo6rSQRQLAM9+CFPF1ux+KnY92KWPClHL18f9d9GS1IXffwD34xzpUFXDVQmEAN
	 zVnU0DbGM/m+0beOpO+NaiHb2BTMkH4Enz/WhQKuf9jgsldL5y2R2N3ff1j4aKIIX71O3
	 qLZfWOE5kowJ2ByHBSNiTtck21WkUr4jqAonDevDPy9e9A91UetbeUW7b+Yr9Yi9m1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ksh08Imw;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7D8606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ksh08Imw
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so59977175e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721610; x=1796326410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=ksh08ImwjMsbkPCVgubgvskNXfr9QkAtTtHiqOknVabKQbp8kPEh7bQh1o7vRfSm4/
         1vj5Qsv7BjAj1WrzPYq//u96uTQaiS75GPuSLCWtlD4/HVdIpFMAKPZnes52ofuGQV5K
         5xiZzgwPi85zAorQPALidYX1pVkUhboqhdBqgNh1zEXtdxdFgBUnV3kp9B/7YjLiAwRE
         SLddUBsbLuw9FLgsy8xdrGngMwsJ7CtpJf2vRZeWx+K07miFHwnS8oB7utjdn7BKMzi9
         sNTajnh9EfR0yyVr4vDZoX4BBxs6kTPDbEeEqy526Oyiy/yaQFlVRJrNXbUe7kBjLPBb
         Xtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721610; x=1796326410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6o5PkBcDr5mo9vn6AHRcwo7DgEVc20BXfKxW4pDcM60=;
        b=ZX5e1MGHF5xD2ee/RCBCOc7BwbcNOuOJiDDFNRQyL/mYeA6hCFvpH/akShyXm5zdZi
         k2FRgVxTeffT6lDniBmhaHZbWensrt06C9sTTo7lktSsxR4/fgpe+SOmtGC2LoDIC3KQ
         CXe5JpRCcmuHU8yNsOprkPfq7uQVo0PkNsMP6jgtHibxEdmh7mkZLVDkZlc2iRDrEt78
         zrdmW9HyuARF61hPqDi6T042OUJCo9LO1BDWVcFeBV3xJyjDGrGuSErera+IFh3MRJrn
         8fZ34T0qmp14+wfdBEEpZJjY0FTe/VdnS2BCU4Gbqv9ISAwbROlfp/moDplJX4Crjqqm
         l7rA==
X-Forwarded-Encrypted: i=1; AL+hErEV+mLziqNzm0WW8xsiL7IPbHbzAK2qsQuWtDvzf1S5j056MtzUHAtlWRxt9I0yLWSMokcQSaRxmXm3@vger.kernel.org
X-Gm-Message-State: APuU4Z+C7uEsH3igZV4TIi02dc5HBA7hwCYvQi/AnlXuLaQuzIZzENIW
	sdmmjYIOgJRwcGxG+WhI0133PogtrqfMmIV3ylJn/0oqoJtcewMpDKms
X-Gm-Gg: AZFdTZcDnm1XE3yAnw/mgvjAN7NVm88M1f+T/gBBUonH5I1IgZOIkbayMn2IF7EXKlJ
	MgP+r0yhuMMmjPw8xm8V4u493QaUXvTCXkxegz0IiF37QHBGpTnNM4CYIJ7D2Dl5132dLLzU1Ku
	NLnpAIRAvUTN6rPkzSQ7jyC9691hmFO7ITNesi/e5mieJq1cXeYhc5iN7OjOOb/w8kiC4pp8Q67
	nCNjkreSDDcvoOLtfowqg9/sqbt9Re2HEXdHDsdZIVMKn9TwLFRVIyulG+k3LFeGycDcOCIm/q7
	VsE/qmdoZ9fPKh7nJO/erm890+2iHVv8a2wu/UpiN64WMObHYTdTdSBqDO0pgm2wxbScDpFCggY
	Yq8LZszzAWYnpiHx7eOJCPQ5U4GdPB/BbRr56aqp7uqhyp48e5/+16TxuznS2RVxdg7dzfNCP5n
	g0OLAK9c/fy07hYFxPv6kupGDJnW9CNLfgB7xWzrAWNxZVNMA++CV/i6qUkpFFejjHIOXt4uB7G
	vOH3ggBi8YzjNmdGPXesROThjvdoCVK4OXbVbepnVHnAfWESq2CrCg3ldKtx6CR2JTnVaWeH3GW
	r2UB5Q7XwQvRnx5K7tCA5k6G+W5rqRxcTt70IRgg8VVs8Q==
X-Received: by 2002:a05:600c:4504:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb888284d7mr463782755e9.31.1795721610174;
        Thu, 26 Nov 2026 11:33:30 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:28 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v13 18/25] crypto: amlogic: g12: drop CRYPTO_ALG_ALLOCATES_MEMORY
Date: Thu, 26 Nov 2026 20:32:34 +0100
Message-ID: <20261126193241.1471372-19-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver queues requests to a crypto_engine kthread and does not
allocate memory per request, so CRYPTO_ALG_ALLOCATES_MEMORY is stale.

dm-crypt allocates its skcipher with a mask that excludes
implementations carrying CRYPTO_ALG_ALLOCATES_MEMORY, which prevented
the hardware cipher from being selected.  Dropping the flag lets
dm-crypt bind to the engine.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 6070ee6b488e..72892fdcd55d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -498,7 +498,7 @@ static struct meson_alg_template algs[] = {
 			.cra_priority = 400,
 			.cra_blocksize = AES_BLOCK_SIZE,
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
-				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
+				CRYPTO_ALG_ASYNC |
 				CRYPTO_ALG_NEED_FALLBACK,
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
@@ -526,7 +526,7 @@ static struct meson_alg_template algs[] = {
 			.cra_priority = 400,
 			.cra_blocksize = AES_BLOCK_SIZE,
 			.cra_flags = CRYPTO_ALG_TYPE_SKCIPHER |
-				CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY |
+				CRYPTO_ALG_ASYNC |
 				CRYPTO_ALG_NEED_FALLBACK,
 			.cra_module = THIS_MODULE,
 			.cra_alignmask = 0xf,
-- 
2.47.3

