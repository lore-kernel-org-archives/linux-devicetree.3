Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787467;
	b=W0vHFmep7MD/445kQcakcQC9ZycXgaTb/0fPaxK8W4gux9mLovUwibKb58+DjV9EeumW
	 JG2b6tvE0jbJ52gD3Uw5UoRaRPMkTemoT0PMzg/PsUachRwxg+5RbFATo54Z8++/hHDUR
	 YwNZid1tT0p/3trB0FLbmX9kKgNLc4uOvZFJ9YyywBIEvgz9oS3xhCVU9Obl9tGtd3aGn
	 Yq5coQLNNUr+3lJD0E/VamsTxKpUJC9lCTOUOrYEctvNqZVipFRw1dTWCeFfF4mzeThGV
	 O3oTGjuGZG9bxzug3rner7gBrHrUeLlGaCBGTUUO8UIzLacPG8m13Q9tJp0u/pNJ45g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nafaEA1OVG7CjcE+9vFCf00bZY6KpgzCNwfvKtVMnW4=;
	b=rWmRGExweypK3zur7nM7D7VVBhIj1DU3dtEnZHc7cPwuapAiCwHMRPyo6XirvmtzDDV/
	 oJGh35GOi7HoYKDBnXervbOG9ENIEJbOa2kBjx2VhIUjerHWGdpJV7Hb7egTI6AxrvaN6
	 qt9nCiztSzGO/HqHVTJnXykClNSzDdzJfLv854e3XUheruxznvQOVsSbdxk4nF2+8kbaI
	 tD1sF1ZonMIxcGw5nAdYgcB4l9PHBR/n3o0u2esv/IZ20LHR1bcAbTF/VNRX9u2Ilm2vR
	 QJbwLcBs1rf7UshZdG6fZQbNAnO8gfr3ehR+wccj1tS1AfIh3XL+l8TfkOA2qiQ7TSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eHnPGaGy;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C57606A333
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C57606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eHnPGaGy
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48fbe12cfdcso300822f8f.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793787465; x=1794392265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nafaEA1OVG7CjcE+9vFCf00bZY6KpgzCNwfvKtVMnW4=;
        b=eHnPGaGy9vjCz3endU7ujp9oiZUhTPhQRDiNW3N/hOwyLbS95T+qAJ0YpwEurjgD4h
         W8PW5edMps4nIXks6isfmzvTgbMPYOe61Q+xtyVIiNv/kxY8yAPP38hl4xgFROOY2FL9
         pvRFjtaaOel13Fqy/pwiop+UvoLlnaknkrkcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787465; x=1794392265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nafaEA1OVG7CjcE+9vFCf00bZY6KpgzCNwfvKtVMnW4=;
        b=f/r/Tdj4Oz2jET9hcNdHbNyHYneeiNbYAZyGc/BuDpK6uy9fNO2b9NKOcH+ZWxj47I
         VY/yZwp4ILjgFm8VDDj3jOlEduV5cJz5TDV0t8PXk9ZFV5avlpm4fRcR8fJVX4wWAT6a
         pmQuUX0+AV+DVJ78AXszdh/a5/eG9CxAjrCs9RFP7DqMIITm1CfN7vUOc9TGTzwdOGM8
         nIVv4yBoa4ww71+bAOl0A5/LMELNveEvenUYZJHw1PHkcwRZ2jf6pWT0nCt8z7JyXCKq
         5mwvplmlpimYT5tVvFrtqmDLqHpk9g7efGUgMxM0Z76QfCylTlp/b/KgbalcQ3Q/39ly
         Mfsg==
X-Forwarded-Encrypted: i=1; AKwUvBxb1VPTHkhJtdom3WkNeAcPNTaMMww4cxg7gDwkgONGQoeZjciV3lFGAX7fRiUMAZwn7kCUYEVJQpJT@vger.kernel.org
X-Gm-Message-State: APuU4Z/uB7Wox0b/t+4AaIsvsNMVjVNlZ7GBPObH5SKnwgf1Ux795CZ2
	tdJ/LigzGfaKBlKeHgsXfEuNlGxFoNDowjhIe9lDolzhWnP2BSHwvSA5X0Dg7WRE6aQ=
X-Gm-Gg: AYBFou1gIaoxztz3R5FQ6fbT/QtcEb4FZGySo7q/Gi4zjvMbaZDFmJ8jFD6i8ZzVhta
	M/Oa6L98W0vNQVuRYzOvZNGitbLzp5jvJIxxqtIBI4cu3uogrzf33uEjtcTlPyvYqsJi1A/+dHD
	Hy3LBCcp9zeQYNstRF/DLsOGI5fsmaHj28ToyCzDguAzh3HYC+nT5/CxeknQvLYtchd+Tm42kTL
	vuY95WL/hv1Nw3C3imfKbQhcKaRfmIFOE6aeL6LKWn7GDOeB72gOsSAZ0T150jXLn+hm2UPkt6N
	kLtteGEe9XVghQs3OQ0nf4Eciz1BDg3kR7UGl+H1Tp1E+7u8mpIS0O82KJU6G2a46cNFXGblees
	ZvI2cdGW53JY2n3No+5TAtt8yPAfslEN6ScKClS+AefGuI0sC3aZyet1mqaDJn8BdKG8Q54x4nN
	o22Viu/Njv0DRMsvPDHWx0TcccmjgYWam7m1XyVI+U8aYw2RVpdc9SlcnmWuQ9cxIHx3p+jkjre
	U8HcTO8q1cPHmGjTyWHo6AZ2unqeiOn+lpOGWV4yLJgXMyzVebJsUcz2ChpYohnbtM825d8QwCH
	+W/f1SxpoNlrzGwo9dGjz+lk8c23e/Ep0dTVKruXUh+AvXYD8/n+gVfes86B4rHalIS6zcw2NwJ
	uTz4oM6STR+KDryL5WC/E8sixl5DRSDNbUqzcobCeGrzx2+Bi67Bz
X-Received: by 2002:a5d:5d06:0:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-48e6e2fa482mr34138879f8f.17.1793787464715;
        Wed, 04 Nov 2026 02:17:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb51a9csm3035105f8f.59.2026.11.04.02.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:17:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
Date: Wed,  4 Nov 2026 11:16:55 +0100
Message-ID: <20261104101732.4043372-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
References: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
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

The common clock binding provides assigned-clock-sscs to configure
spread spectrum clocking (SSC), supported by the clock core since commit
a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Deprecate the
vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
properties in favor of it, so that new DTs use a single way to describe
the same thing.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v4:
- Add Reviewed-by tag of Krzysztof Kozlowski

Changes in v3:
- Deprecate the properties instead of dropping them

 Documentation/devicetree/bindings/clock/ti/dpll.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index 14a1b72c2e71..8759c328e841 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -57,11 +57,14 @@ Optional properties:
 	- ti,min-div : the minimum divisor to start from to round the DPLL
 		       target rate
 	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
-			  spreading in permille (10th of a percent)
+			  spreading in permille (10th of a percent).
+			  Deprecated, use assigned-clock-sscs instead.
 	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
-			      spectrum modulation frequency
+			      spectrum modulation frequency.
+			      Deprecated, use assigned-clock-sscs instead.
 	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
-			      to enable the downspread feature
+			      to enable the downspread feature.
+			      Deprecated, use assigned-clock-sscs instead.
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
-- 
2.43.0

