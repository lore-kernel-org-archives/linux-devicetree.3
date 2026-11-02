Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589539;
	b=l3O2KGlrgQESKgmvwL7Pl7fS51OxmxSxqai+/5G+oO/r/ZOoXL9jm8LVyr9AoBHLxY++
	 tPUXaJhyQHkNFn2CHwXLNVEo1Hgb0A1UDD5SjEFAUmbvOyvo6/rpIOsgEuiRf+we9qpqf
	 vRh21Yjm3dhhlTyJKnmE42ywibi0rGg8bLedE5OeTsLJyOT3guxYwUkD9SV6+BvfmO9Mt
	 06GLuhiy5u81dE00ZxLi2ydk/ouEvG2DNncOS89UvQbaIueWx7aQ+pvDqthWj13XGQ8a0
	 kUw8V4DPACXanNKSm8gMqWum35zrH+/cTLHiyirHpYMGHAOdaCCy+rInG3xGYbg738A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
	b=OHeYofKoFyDGcSl/OyI2GkcEVbj+9g8M2yj1/uTCHl8tyH0O/DqO1q7+FVizZRJpnzYZ
	 jx4Arjqcedq28DOh9AmgNOAjZIa55uDZmlZXHfX6U8X5juwNVaKnrnCreEcZO7Lua92oX
	 pOO9+7PSSt0rM672/GcVwDoDKs6rzdogW85z+2dGiCSOyqiM4gNwLkqSr3vdGTZtzRULq
	 IBxhB56WvA9zlwA8qiRVCSchl3b4D39K2GZP/Ky7OJtUT0Xq2kxwucdaHnIxszXar5gBf
	 oThlJww4hB4yWGfmrFk/XG8JU+my6A4io+8BGpyLJkqmK/hQd+8GL1dPtfyEz5dzvPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzdV9ohT;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346E1606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 03:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 346E1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzdV9ohT
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so3730711eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 19:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589533; x=1794194333; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
        b=HzdV9ohTmNFyqmLLsDCqmODyoy6Sx31mv0ijemiLjdQg7hHw0X40I2CBE+mz0w6uWC
         aNYtC6Yu5CBBGxnEVhvE/Y4P6wEZVejk2WgvWSIhziXfRTXvLOnmEUo9UxTr7iP4XE/3
         2eEplDFJDBFyraV/0AW3CWGNlYcrVqQIpT2k2nOGcHrMMk5JghogbQjvZYX+UKpoAakp
         Y1Cxg2O0X+lnxVEt7t0wL7ZtoESdT4GuM4+mampJwV4M+gY1pIlnVR9DJfvSBaw9QIpW
         NQcWRXEroXcZLMc6vUr7ZvMWPYeFlup5uPOXrbCj0dmNQE52XCFrdmOQbDZhTClfxJTa
         y+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589533; x=1794194333;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
        b=U6pHnrjn6Bs3pqSOsuOypat5UKV8g8xiVQk9o4dgWHKwi1F3Y+Kl8OED9dNGec7zq2
         rMsQZxEZycQM31mAhGa60qDdMubSH/j5k5ZXHii7G7ZqLN73mUETfZQyoCEGQV1XCb6h
         pW3EB7DhBq1s5bS4w6dEJWwfDUDdGILU7cALoJprvLnsAtHfCF5wxRZKm6m7IeoSnLEu
         yPs1IFeSZsFVXz9ynvd2DAuz9CibeYvz2VIpWtnqEc2wPFe3XCx3p9ODr/TLUrtHFwDm
         /mpC1GhVB60vm0V8uTjpwPqgewZGr5exmeDfJKob1VgKQQqZ9aCUUGxNpbsIKwOkHyma
         wtkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYt+xPLt/2NA9NYjVjM0S2z/jtpGVTrVxIvPBW17KWO64esnXeMF05yM62KFlyqKq9K6HLTsQzoLQu@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pl3OAGmfqS+K8Gp5fYLVsx4YhK2S9GDxugCYYeOduY6XOj4WQ
	4gYXa5HdbfoNHG/kWJl3YyaDpqMmSsA4TWyWzhTVHdLGZ3BCxcivU2+0
X-Gm-Gg: AYBFou3XFjNQTYYFuUm6VZ5gcyk7i67E5cjl3s+fhnqArsr6qbfEBAXcu6z4t8uJK5+
	hn5b99bOSJD1vJOe3W+rPaVArqLNXjhjYb/yZvagMNZJszX96VZM2VPYNHST9eER0DzrsKdkzC8
	J0jk+V9ORM81xZ/arBAqrH2fj98isHBBGUtbkGtSI7+q8eKZEkTCOgcrandVfaOiHyJFk8bout7
	Tn/OJFZZ6ZG9+IBbiR56RUV/Sv2hy7JPtfVTDO7J/z23tvtrEhSUJ8LsOj2OfctyUheh1gFBrXI
	h9RhhpKq9k1zQ9FQeWMjzjHSxd04SRnrjZgnjF6pcS/i3UMh4vy+b6mlCc1rbBlJk4DmN7uB1IA
	XHVsfujuhGaR0Ohxk607Y7LgwmJKDQYJADSr0pdIXf/8wsOmYsI4Y8Li2SFLi7Kh9E2n55d25kc
	jWfDoy2O1Eo5/YYcbvaYatKJexNt10fUBknvuV6V5EndEVRYhfhk5CxmfudevEycDZiydGnEyiL
	qgxyEzcPoqg6RXdduHoEsATZ9DRCaPViillTC/BjUOcDunPbU9kyQOEExxc+EKWVRgL/l1QJaXq
	cV7QEDFKlsNn2gGIs+UuzLU2u6b56udjlNJW776agzQs538Bpk66N3pQc80K4bcMuoTDFXw=
X-Received: by 2002:a05:693c:20d0:20b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a42435927mr13964731eec.40.1793589533040;
        Sun, 01 Nov 2026 19:18:53 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:d75c:a9d8:6c00:c5c6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm33411882eec.24.2026.11.01.19.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:18:52 -0800 (PST)
Date: Sun, 01 Nov 2026 19:18:51 -0800
Message-ID: <4590302cb7f26ea6173018f5d7083977@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Petr Hodina <petr.hodina@protonmail.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] Input: support for STM FTS5
In-Reply-To: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi David,

On Fri, Sep 25, 2026 at 11:22:18PM +0200, David Heidelberg wrote:
> Used on various phones. Minimal viable driver.
>
> Includes device-tree enabling touchscreen on Pixel 3.
> Also, tested on Xiaomi Mi 8 (device-tree is not yet inside the mainline).

I applied patches 1 through 4 (leaving patch 5/5 for the Qualcomm SoC
tree) with a few small adjustments folded in:

 - In patch 1/5, added a missing trailing newline to the reset timeout
   error message and fixed a typo in the comment in stmfts_power_on().
 - In patch 3/5, wrapped "const: st,stmfts5" under "contains:" in the
   allOf condition so the check keeps working if a fallback compatible
   is added later.
 - In patch 4/5:
   - moved ABS_MT_TOOL_TYPE setup from stmfts_setup_input() to
     stmfts5_setup_input() since FTS4 does not report tool types;
   - dropped the undocumented "stylus-enabled" property check so stylus
     contacts unconditionally report MT_TOOL_PEN;
   - checked X and Y resolutions independently before applying the
     10 units/mm fallback;
   - added a check for !sdata->ops in stmfts_probe();
   - fixed the GPIO name in the "mode-switch" error message and a couple
     of minor comment/log formatting nits.

I will also send out a few separate follow-up patches shortly: one
teaching touchscreen_parse_properties() to parse touchscreen-x-mm and
touchscreen-y-mm directly so drivers do not have to open-code resolution
handling, plus a few fixes in stmfts (not aborting FIFO parsing early on
non-touch events, validating the 4-bit slot ID against
STMFTS_MAX_FINGERS, and switching coordinate reporting to
touchscreen_report_pos() so axis inversion and swapping properties are
honored).

Thanks.

-- 
Dmitry
