Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913789;
	b=fj79+Z/OrewK/FO3RBFf6fy1aE6UWdGD0XdY5Eo6Dh2e+R3kMeOfnObVBvIhemsh1vwS
	 MfVW6/x2Ve4k1EgZ4ssIK6QBSWVxBj5ydsOuZJP1+JrJ0wsrx6ndwXG7i1BfGI0HFoXLZ
	 vDU7t4oZ3Ut+eoNJP3WqUjzFETMNRUz0eHZW41Fk3KBBZx/QPrBKs2KDpLYm0hVVJrBG/
	 kW8WIhM0ZlzpL6x3uu9ljtM10OlWRN2fEkj/OuHHnJyAGxhCNBdHUdI+a4K03hMNWGNgI
	 1qdx1sf5wOvcmJivN2D8daRgvOmeQFvX62P2Fzd+0ZDTRy8wEQqG2gFq9Ym6LsYk0GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hpmM4eFRun76lvi2NsX7aNzz4o3nnQQCjWbpPZyMB+o=;
	b=tHpLY43bdg/tSzKC0WS1BebPoChFm0wGv8RzNEgsn/U8vobEm2hEIhpMjWughMNUK8F4
	 krbb14V7h1xafFsQzn1c4Rgzg0O2Pje9Y4MqEjEF0PxA50kyO5vrUmWxoJ9Fyj05V/piP
	 yUYFsh5uRd/JdNePEd5h69Oub7c9p8WFB0LBNkbla56VDt4Uly52g/UZUkR9C5Vx4d8wj
	 Bq0/tKbz4ePt9mmEe6e5uzWHSJADTegKAZs8oHzCoX8yzSqXW95KhVIBJ7BOzdQUKBwEi
	 /u8OXN1zyL9ACorblenEUBGQwQXd5y5B87WhbsbCggoSyU4AwgAjrvB1XfnLDlpbdmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MD3kGh8N;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B6606A330
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556B6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MD3kGh8N
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38190551625so680421eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913788; x=1795518588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpmM4eFRun76lvi2NsX7aNzz4o3nnQQCjWbpPZyMB+o=;
        b=MD3kGh8NkCjvXmoC1i4w2PtRphlsb24xAOL+9ggH1ZTFw0LQ6UvUoCXyiAzNaJp4/u
         6xwiO6o780CNXl7+Vga8jetTnOWcpaQra54nhden1ttLqc2oaMawb2LTaCTQhmiymPsV
         G24D4X4DmnUlcs8CYBjq4F4HGAYoKvpAuEe/IRJaIR2WdQKHXYUxk64Ceq9dUnA5mDwP
         WOcCwdEHVLuAWzSPRUK6sN8TvqE6G8LKtHNfn9TyoJjv+RLd6gss4AATY0u+4J6N2+rQ
         h7I/p+m5/2VBSQjS+Fcn45nyrTJpXD1qHAtWPHqqep+oBhuF6iwc+CJ5Uiogkh2Y1hqA
         l+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913788; x=1795518588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpmM4eFRun76lvi2NsX7aNzz4o3nnQQCjWbpPZyMB+o=;
        b=i5+93N17HF6XPEKnMqUeT8g9Y7gfSi8aLc6VF+fAX+JEPVy5SNg3Ob69UooItMdkHG
         4nYCgb85dkEbhm5izBRuwEAagAIE6/SUIkNETPJpn8vyFSJfledcgJbdvv1DTkMcynoy
         3YL2GV4YXgMgoxqK8ONMKuFAq7++1pwbTNcw9swlCokM8zjMA5IIW5hNBedfYS80fOd3
         uQy5MACA3mwPn19/UFR7JUtAwoPaNhva4+ou5LUmlwpmuQWXb4bH2qu5tpznM3me4qvQ
         EktTLfaPeQKr88xpRX/ZkN4A7XlGOxO3MjrE3KCWSchQiTmVViBjfv+FJHAoRPVGowvn
         rR1g==
X-Forwarded-Encrypted: i=1; AL+hErGNmtdtGAyikNwwLS2Enx6aBY+JXu8JkMjBFbBWrnXGk9k0OxwM9y1+ks3KlTnco8OwF+sfip0jxi18@vger.kernel.org
X-Gm-Message-State: APuU4Z+5pCwT0tcYXSsHpghQdWlsBNcHavehzxXtZw5BaIYrdMzDFWoh
	xi9XC3kh9K7ioQ3SVPQ9YJtPzfzLPtJn/X54FIkewwLk8EPUzIbuwVLl
X-Gm-Gg: AZFdTZetObGyHdNk/tC/LFaBQqZ14uAT0/GPl0Whjl2qzlyDYZIZNSYvE78EHgtkdry
	Gjwh4hpVygqXRqsYja0K7cYAYvcWCtipP0OiZVZovMwZvwYOMrBq014Yp0AkYToMtoFvTDS9Qju
	lVfIohPpHxN83rNoWc7DWtPPMHCyQDxaRMCHfGfOqfhnczZ5VweGtSqxk/Y3ZzjTr6PdgAENh0+
	pouWuO0ECFx60cGlX0V92T/B+y1j750fS5Z2emua2bmiq34faCnuuiB6urjbGPxmAYy+oscoXL9
	pX7fX/vFxfAQ/PTtqod3IoEDu57OuDMfhT6T5sghUpUp9tEFtCiaXO76JuxJt888wYixtiZp9nL
	DZszsZWrHW8pdebugG/az/f5WJSy6Zq1orwCEavIOZTEsyDuu+Vy8C5s+A3md2KmrtQ89Nw5Ocm
	EhdsnozZHWhI0YBib1qss+QR1pvHsA4gLIQoTOXPMEQNG5lSwcfTa6QUTbzQksR9LzMtI1+K+MO
	RrlSWFY8g2oJivueK0UtSJ01NdoWXO8FN20M/GVp+JcDdQs7eGNQ/xws/6CnzPeeRjbHhvLTBIC
	RIGjRs3jiTtctQ9aSAGfp0s9OqOgcokEW1S3xCqwmxJOhT5ocbF35RH75TNE9HVp52TUT9zFMjg
	8PnnrrzsbMoCAntA0f9sp4cuBJ0nca0ppjlYDdnCdjdqyL09S0FzYLNuLOe7tlomtOgB+22Np9U
	XC1pA9Je9SmXmThjt/baSWkvY4uBO6Wv/Y5FsmHgKfxg==
X-Received: by 2002:a05:7301:70f:b0:381:eb93:81b9 with SMTP id 5a478bee46e88-381eb9383c7mr522846eec.34.1794913788282;
        Tue, 17 Nov 2026 03:09:48 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381a55555dbsm5560475eec.10.2026.11.17.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:09:47 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 0/2] Semtech SX9xxx: add a reviewer entry and binding maintainer
Date: Tue, 17 Nov 2026 16:39:33 +0530
Message-ID: <20261117110939.214932-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add a MAINTAINERS reviewer entry for the Semtech SX9310, SX9324, SX9360
and SX9500 proximity drivers, and add myself to the maintainers of their
DT bindings, as Andy suggested on v1.

Changes in v2:
- New patch 1: add myself to the maintainers: lists of the four
  bindings (Andy)
- Patch 2: refer to the Link: tag in the commit message, and use
  sx_common.* instead of listing both files (Andy)

v1: https://lore.kernel.org/all/20261117094737.15253-1-kapoorarnav43@gmail.com/

Arnav Kapoor (2):
  dt-bindings: iio: proximity: semtech: add myself as maintainer
  MAINTAINERS: add a reviewer entry for the Semtech SX9xxx proximity
    drivers

 .../bindings/iio/proximity/semtech,sx9310.yaml      |  1 +
 .../bindings/iio/proximity/semtech,sx9324.yaml      |  1 +
 .../bindings/iio/proximity/semtech,sx9360.yaml      |  1 +
 .../bindings/iio/proximity/semtech,sx9500.yaml      |  1 +
 MAINTAINERS                                         | 13 +++++++++++++
 5 files changed, 17 insertions(+)


base-commit: 20ce8ef9c9e04cd6c5ae0422e251a9b5936c6b7c
-- 
2.53.0

