Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733535;
	b=Kenfb8NsGwIjbyrkzWK5F/I3e8AkcGieLHanJHDiIAQYzDF4kTGejebcEFeSfTAhgz95
	 v3CNz3zGFV9A5f0Q+aClfkf7rp/hdMK+isA5OdBr8L8yMnEK2M66uwD2A0v8FhYzHJhj1
	 p3XwNMAxzXrsAoDsKs8LaWvjD76UiAvuAxviNz0GIh7K2GMl0/dhfdhExUhj4CzGjNmvV
	 fgFva+eGeCl/ACGJ6dtBBS7F8M9tTULeW43l4g1jo4n5dVYmpK1a7EWUteoEJDip3KKNF
	 05txmVhh3wWvsi4ESFs2DfT6IMYOI7Nf/dUpg9zGLp1C0PqMSVZLnXOPncUwoezWpGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
	b=JvtVdu4gSZj+z8N3YbcMz5o+MIMk3ysscXtmZRrMfYTxOWOfwjbSIfl6eK2PGjWbxpgt
	 fDL1/5DuFWk+Dt2+RFAB7GHKM4aS/x6jcRtPetF2YFbfGL0YzGD/n5w4S0jrmRFqMgHrz
	 9Kgw5tbkfZcC08Oww/jNK0y6ZI6JJ95FxWbHm2SWx6kDjITgMp+ZMKaPU/Zsq0W8eBEik
	 TTneTdSr9G0LHmFTJtRQAHxS14BK9PK6/7+2V3RS8jBBDsMcsHT/CpUCGSH9PD3g6cCc/
	 tLzsZLwsios+QEWGgNLpOPyYbT0TZJ6/0BGY1Iv8pNMn6Drh2VEdc8DbiP+o6tUDqLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ih+nrjKF;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D8A606A337
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D8A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ih+nrjKF
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4395d31228so422170466b.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733533; x=1795338333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=Ih+nrjKFK5iCoO2tO7pmH4BWGl0hxpb95KHxQ4/FgWHWtbhq1z+Ym19vNfTmdEKS2x
         IR9BvFy7eMplgehfWprfu9XBH7qqi9EKHZGvlR8PO2QQrOyXcBv4109VJvztPeeBEKgE
         wSXsMVU4ej1cUhzJXB6iPP8VkoYaTBjAAlc2IEsw8/UZIMIBQbScQ+6JkcOh0jGd2UXB
         lYGtXrNFqHyI0Gr2LnDE3XgN3PqQcGuqmwoGMcWGbKjLSPicUTFruc+6kkFFICtINFuo
         Je3BDtjriYVp6eagNVfSED46cJjJbG+a2aKKvd9ZD2wFzNXeUZ9jrJHGhoB/2dJzYMfs
         2RcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733533; x=1795338333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=pf5awmc5TWbAnEtZ3sGKqg6fti7qVUPQFD1yuPgF87gOp9tIBsgcNRvsu38PsSeaJp
         svZ5WD/4RpThV5NSAfZ+qbgKLDle69IRRt+sIxijyvgUp22uJoyxc9fiiO740u+TGdcH
         IkJ0eISeasDjRdaBW5SsaRTrRBhWLS48eS1gxyqWl6oFMkRzDmpAyRkHcKUKKfS9/6PK
         dyIIN6yw5qhEembNnT0HG3Hqkis3k15MDihKczH4Nu9zRLTq2eEyLtMu9ICJYbotLzki
         r66T91JSutPoQDG6eNfNZGTZP2is2yd076bnqb2fdgSOCK5AMJCcpwPmrg064gwdTu+q
         /KpA==
X-Forwarded-Encrypted: i=1; AL+hErEHm4+hHSmTV1dAwqCnXSI+/QVUq6hAy2t+eXbn0LzE/xuuAYdIWEGctu1/eYAN74xH8EESx1BF1qoN@vger.kernel.org
X-Gm-Message-State: APuU4Z/AyxH1kCc0DDX2eInIu/7gTGpfy+Eq6pYfYOl6jka2cYYnsTAh
	0Jifbhhk0B+BZDqThxkWvQjZ8R02JbwGF3vfgm4DnOjay5Z3f1BjF+He
X-Gm-Gg: AYBFou34OrkKucOTihG3S7WJFfBY+ISYk1hbY8/V1roNrGND17MEYWkk7z3WqLNpaja
	JRMxOFIxvG0XoaCuz7Rpuz5167EzAMEEgz6NqVFUKssRecum7TDt6kLGxh8kXe9ZudeFbFST5/h
	kErvGs/O+NKUVOHwC7AuZCj0QuDkCSrE0q7eLwmadmISgpMuC4hU6rdV7Mq9NEPskkqbXzwRu1U
	qfjZC89Lp60OXve78rJlFlu99Led97Y86xeVsKRtML8tWMXcwhq1PdhTFHXI+uijudBw/vDKP3p
	UxDnxM1rz+hV3sPKn9z9HlJiE48/Ou5N5WM26Frt5GN0s2K+pislOK8+q/q+yj24YeXZla0SG2l
	OWfAlozDLeTtzUnBxwG9mOqJgt46DS3zNa9qTvSFPFcwo9Y6FCAQUBV1EEnhpARo7QuhGNcdUBn
	w3jsnhgRdKy3Lyks4upZ63QgnL1UqhgMN0bAUyvXVcWtf91b5d9R2cwLxVo6gTeFMBDiyWspjOb
	mpVUZKIpgsdaosuW/AWUMcCkG7xrLJvN2Kcy5t/fhzylschzFV4X8KZuj/QlS7rlX8IIjhsIJDy
	GKK9cfI8vEc0BrtzbE6DGsqRYaqPbfzKN5yOWs1b1H57qy9SrLYTwPHoa28mqva7laEiNhhlSfL
	LqCDn5zLo4D8OmtsdzTqP+YuRLBtqUdw=
X-Received: by 2002:a17:907:7296:b0:c40:aa04:18d5 with SMTP id a640c23a62f3a-c50963075ebmr684777566b.15.1794733532776;
        Sun, 15 Nov 2026 01:05:32 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document LED support
Date: Sun, 15 Nov 2026 11:05:18 +0200
Message-ID: <20261115090520.102216-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090520.102216-1-clamor95@gmail.com>
References: <20261115090520.102216-1-clamor95@gmail.com>
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

The Maxim MAX8907 PMIC supports a single LED; document it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/maxim,max8907.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index 6cf8e93867e1a..ee1a305d1c210 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -31,6 +31,10 @@ properties:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
 
+  led:
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
   regulators:
     type: object
     additionalProperties: false
-- 
2.53.0

