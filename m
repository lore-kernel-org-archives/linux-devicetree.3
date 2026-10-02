Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543D4473C86
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933308; cv=none; b=jFoZPQgoRxGA/60kw0CMwEH/8xbMTe8bvIh++hgQW0xMaIdh/erIVEMF6bmoeugu0ODLLg8bEvxOj41OBUisHUIlvEVfZ8qXaNUTZDc6JN8yJRPZ3E8v1vqyMhaVtYQPklkviXpQm0w/AG6SZ26ZmSw3f+bS9XpPTlBdyseP6Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933308; c=relaxed/simple;
	bh=28V3Kxby+YZlF9FWLtqHZaq2wjTysNjYXVOheRP2p4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RFXJQO2rwn1RctwqP3uG2ssGmCmsVUWvXr27UrI9Gz8tv/9Sv362RpueG/PhoVgxGWeJeCyD4G3JHsVl5tRJJOLGfuHUt+rHPl33w2ALVpIb1OpkETeG2tcez8gj/chuFBO8wyahMKUSYloylbiuLSA3nRTNLWgHKoVx/eZK/3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5L1UytK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5L1UytK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so45096665e9.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790933304; x=1791538104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/xGjEmegI8pTO7Ox5jxESlFHhUmyOfP4GxHY3lbaDc=;
        b=o5L1UytKjTPeJppITrQlbdNjBGOD7wHLM99SZBGPDBaE3vAW/F1ZClUWngCihKspjS
         qFInK4HXswkrQlWn+Q5YU3pzQ0EsswgY8pJPKeNLduHxOBAjSpcyjuk2KPxxAvDsbaBE
         7FeerGnDuEIKDtMcUuo3pF/nhf1Ki11pfoQZqvm25DqQvj2dMxKNQlqAroEapn/Kj+WE
         fyfsP06MKCQ1az0rUtOlTWmpD9/lC4PlCm8HqoGkGo55BKigQjuJtHVPWSI13mxXzmbH
         B0F3lrbH84U0CLScFDDAoyaK7Hd3spwXRoP8HI4b0c6Q6/a1wgfwNwnIfGXAC4nfgJ2h
         17mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933304; x=1791538104;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/xGjEmegI8pTO7Ox5jxESlFHhUmyOfP4GxHY3lbaDc=;
        b=TzOpFq9wsflj1VB0TH1eGBEpIk7K+jR9LrxHxvpTMZ+uPl4QEZdiZAcOGfOu9Qiawf
         Nusxbq1M9LcNdABDqpatnJCw4JwTAOASSbbQEFqJMqm5t3++FKEUyBlU9/vwSBuDKhWf
         G26ZlraaaF1PqRu6k+NgWqKDDxFYs7VM4VtUV8bxXH/nLF64Eo4AiOG5KmGtlpR9VKc9
         knfltscRNDc0E6/L7zvGHiCd4N1HsJv9Kk4Yy5Aq9nbiwUJB9ba7iSDgjLEypboi+mH4
         l/W/besezH5RyNZaHRSLtbLjR9nHqAlxTPSu0W7taKwuYpwke13DwE7Jpwi7VlueWJAp
         xKjA==
X-Gm-Message-State: AFuF++l1GcLr6hjFaDKprMpgWiDMRyEF6z4JP3mTOCxccBJIsA1+Pmyk
	cSkRIsHDPuUAOLWRTKZ/fuOItO9kGG4mOh0DPW/6+EGfpRcR+Bk4g1gh5AUd3uUFETk=
X-Gm-Gg: AYBFou1iqzUBW3Xxr91YLqQwlXjffMPhSu58zI7m665Oh1ZlzunmZHlEHprqsF8Q0LR
	DaHHAKouavzQSMCtgXm9zRJR0r6pYYEm5jU4uWyyWX5h311mzy6yUNPckJKdOVC9ngy5jPe0eyg
	uLefO7AKRKDsClk0eEcEeNcpKghtLtcD+mxdz01U8Sp7sK9y+QA3OCT01kFeoMUYcHGTBEKpkaW
	OocWBprKeinAhTFQ3i+S36urH0P/ncMrhhWTX3D9tj+vrQ+iyt1hp3vcKvPjFfgFch4pcpDBedz
	CsqENTgg7h1AYZXFY/E4Jhh6ejNrGFY5QDYqrhR83UbmFhvDQhsILzfRIYrHkbBbdUTnhgsdIh2
	I0RLhfOxVHyqeFYb0Cpo37h5pMzYADCrYGdWeMIZFfkBj9Jl4P14gpUNOzvnM4R01n7wFSx8yDv
	dpb6wzZuQ0/iYEkiz5svcuD+QqsfaTAILubp9Sr5wn6x4OEiw6IRhMHNRqX08xc3O3JZJ1Be7cf
	qwoO/kzGZ/nLvneI2o=
X-Received: by 2002:a05:600c:840e:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-4a0276ea428mr38917245e9.27.1790933304386;
        Fri, 02 Oct 2026 02:28:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03950375dsm22989995e9.1.2026.10.02.02.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:28:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
Subject: Re: (subset) [PATCH v2 00/12] soc: amlogic: clk-measure: Add
 support for more SoCs
Message-Id: <179093330346.2296861.8852172233922608550.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:28:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Sun, 20 Sep 2026 18:25:02 +0800, Chuan Liu wrote:
> This patch series adds clk-measure support for the Amlogic A5, A4, S7,
> S7D, S6 and A9 SoCs, listed in the order of their release.
> 
> The clock names for the clk-measure channels are kept consistent with
> those used by the clock driver as much as possible, making it easier to
> identify the relationship between the clk-measure channels and the
> corresponding clocks in the clock driver.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/drivers)

[01/12] dt-bindings: soc: amlogic: Reordering compatible of clk-measure
        https://git.kernel.org/amlogic/c/b6dd5a5465bb1c24279c1b18d9ee738c996f9ec6
[02/12] dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
        https://git.kernel.org/amlogic/c/668232197683898b1dbab05d6f1e7f93084160c1
[03/12] soc: amlogic: clk-measure: Support more measurement channels
        https://git.kernel.org/amlogic/c/abb63af22300c59e0e8dca322c21ed186ba7e51f
[04/12] soc: amlogic: clk-measure: Align compatible entries with DT bindings
        https://git.kernel.org/amlogic/c/8c6e2215b7ce72901e6aa2fecc4166d75e60c7e8
[05/12] soc: amlogic: clk-measure: Add support for more SoCs
        https://git.kernel.org/amlogic/c/5508eab53e4b79a1b45f78713cab6e7154131800
[06/12] soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
        https://git.kernel.org/amlogic/c/a848d72aab71e19ea78180f2502ad7d12818723f

These changes has been applied on the intermediate git tree [1].

The v7.4/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

