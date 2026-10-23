Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749852;
	b=dFeb6PevlvwGURpQ7OBOvYbPp0mEq5U+ovjucNpduUSdkaBhxkmSfU9LSnp8PH3SAF7y
	 8gXB4lLxSUVtGa/yy1kAl497POcXVMLhEwv3wdun3Uca88nzFIhwIThCrVGnqz7VmQ/O+
	 yWDpNbDOkGW+4VfyZPM9VHG+L+9eZImjvFTQK1VUIexrDte6DudM/nrqPJ0MJswbgaj9M
	 aED5JxLHBuf4c3tqnq6k7wOBPdsn6rKRL0LU3G2lTsnMcHmL/SLZAnb8TaNn/GEO1acN1
	 xa1cuM6bq+JCpkm+dVfyKSulJpZesd5BinLuipOZMIOTYaQlKQ9gcnbskxWLhDp1PbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WLd0lU2fh/YAFZVVEuZA4CYWlgeDeL+IcAlXVNkPVKw=;
	b=IROXnLspGt05pzq0TPbaq/TfiiU75RAwMJnF4knwFUOBZ9Cr8bZITw0FG1D3pn1c/2Gg
	 8fmQfOzHIvoe92Em4gu3g/vc1K9og+MxLQMSEeQyuiYnniZmpfKa04hz6XmwIqvfRock/
	 sNdl3F56dBIwOTfLFY2YIarVEUnuIM6cPZnXMCZKtoY2z6VWm2sUbjawL32lMNjGkqcRJ
	 lvVyd4grhb1MW/IUF8h3EgAEjy0EIHXRbbBX1C2D/bFQ8CW79J7EeMbObqnF+eDajP6U2
	 DR88FD7vO9v7g8iicumX8sGRdLjZY5POWvMJFXZVBBg2xLIYlaeEheD9JPT02qckScA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Bp+v017q;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D7C60A2617
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D7C60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Bp+v017q
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so157626f8f.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749850; x=1793354650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLd0lU2fh/YAFZVVEuZA4CYWlgeDeL+IcAlXVNkPVKw=;
        b=Bp+v017qOOHv+fGEFbZyhDKPjmjPM8N2554dXu8wqilzQL6POiidZKPC1fT+9/0i9P
         YckpdzDhRv3e2fKa5BRVBplXrHGZYq8xnpQjU42AEftxpLEDDC8tr5y3LrXNzzUt3b9r
         Wg+X5V5Do4ofmadBzat4R8plYNZaPnMZwdf5Gh3jwNkCwF1lil9halJlpZ3QQbGfNgR7
         R5+Sg+SASg71mQYF4OcJ24EadKUCsu0e+w2TF8AMoEZZ/gjhKSVWMYvbOLmK0e1VlA16
         DI8c1AS3HUtb+sVrFAjKHKnqZuJcvNtQHcBVBkB4eQwEA2NHzDRi0k+haz+IxoW3Ph5m
         +waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749850; x=1793354650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLd0lU2fh/YAFZVVEuZA4CYWlgeDeL+IcAlXVNkPVKw=;
        b=m+bq+eJNA7TtLPM4YUyw1ueP/x7YlmWc7IMMPsfTM9KMM96QyaBVQxRuPbG1/MdGsq
         Jq7nzrnmW0nFcfsRxFv56CWTqjJbrSVZYGFkEAed2aWvpDTJm6bhwG5Z1pRWLo0eh6oE
         pTf8RJyY9asApKcS64nTmaQvjGBRAj6kOj3CIy77M6EPj58ebJKJYfkPeN2uNAcqmpCp
         caasSA2B3ECVust9tOvaI+fBd1/uy0yFoaNbDlBBvqweBdIB5QA1H1Avbi+D8KUsiMm0
         WYnRI9id8F5nsvOkaQGr+DcUvjH2CoUlCDkedxnoGzvjStNSs6931U6JI/aPJVsYEH8j
         PVBA==
X-Forwarded-Encrypted: i=1; AKwUvBx+jmkXfIN/Rb5+1mXuE+bVgR04EmskNTGMk2jP17/qxllDjNula+aZZns3Lg7x56vIeMD4rmAL75oo@vger.kernel.org
X-Gm-Message-State: AFq9FYLBjRJ9b9wGjwzUzDk7VA3haTbQEJuvf6RL/9LIHGECPtaIiayx
	H4aTkdtDtkRxjgGZml3+zZmNKLBZbm/l7ePn520umIDJ4kZyqE1grMa1UUkWIPoEOWs=
X-Gm-Gg: AYBFou2M5kWVza4jim22kjBygPDwiREz7skK4i66+KnFVXKrpHRJmkmnrSWM+87daLe
	AZVRVMP8c0WcnU5tfPJ2GP6Jwa7uZW5WpoF6kJ8WYCrqXELSSnHQEyfFLv+nzeO8BmLwjP0lbu+
	6AdnB70MsqGAHtk5Vng8zRUUMENXRDRlkVV/hmiLOiTRde0pvCad5PWN88XhubokNxq+UYvY9gG
	fedHLtjtIL4mIsOubnioSKkRWskLIRHIJgSDrnTd0+/C4Hw57hml6hvCodGgIJsRgKERFwDytpp
	QttVpaDVEldLUPjZaAOCnZoCiH6+8yZB/kbMC1FRV+EneMZcnm0T1kY2N7PpWbn4E0pzxPNLWV+
	gjjDMzQP+xMZti+d+65qwRSM77q0cMDHBFT+yHvgD9x3iSxdfg7yniaBT2a28R3D4RMhQO5Hdeu
	po8lphCQ4L8QF8E0bM5a60Q7JGI4pclBpgY7KHsy5POCgHh1l2YPtNVQrEhTm94ckDJnm4EIzWh
	xrVfvWNsR+s0p5oHwErZz833aSvdM6y+FGW3UwVnLLFKoR8fWyIuMHdnkxhdbqwGAPQ9ZEI+/dZ
	mU7W7mk/UtONMHi+LnvrFceicEJekXM7GA==
X-Received: by 2002:a05:600c:8882:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4a211f29fb8mr20172565e9.32.1792749848816;
        Fri, 23 Oct 2026 03:04:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:08 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: power: supply: axp20x-battery: Add the AXP2101
Date: Fri, 23 Oct 2026 12:04:00 +0200
Message-ID: <20261023100401.67592-7-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023100401.67592-1-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
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

The AXP2101's charger is programmed from the monitored battery and its
registers differ from the other models', so it gets its own compatible.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../power/supply/x-powers,axp20x-battery-power-supply.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
index a90d558e7f86..6a0a0c3f052b 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
@@ -21,6 +21,7 @@ properties:
       - const: x-powers,axp209-battery-power-supply
       - const: x-powers,axp221-battery-power-supply
       - const: x-powers,axp717-battery-power-supply
+      - const: x-powers,axp2101-battery-power-supply
       - items:
           - const: x-powers,axp803-battery-power-supply
           - const: x-powers,axp813-battery-power-supply
-- 
2.39.5

