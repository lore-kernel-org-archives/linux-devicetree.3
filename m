Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851B4D17B9
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832220; cv=none; b=iga0bmfWf68WpX2O1TXI+e2kDxpD+PgWI3QDd86of/IpQmiqWlfCMOCpIyksE3ZpQydyg51dRYyC7ES3QeAlo6nAe1BzT9iqWs1J4fEQO2oBYR23RDJq1XPWFd7mEIjkOAFU6q4yP87NaypYvizkJTL06uhx4hl6zV0o8/VK5tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832220; c=relaxed/simple;
	bh=0++OQnsnodoFBA+6JtVfiCpmPpE/uYI2by4VMWbbVt0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=En1VJQBPgA/AG8k9/rce2eWUFRBfUOazpq7C1MZP2Ev5O0GFv+Cmb4jUlXoS1ZlOwLfRboxBYd1TLFIb+YRfycriTkpHXs+uPoKQIEuGIxEivh03rwSKvHRl950Ge70hFkURaaGR1nNCeCba/qLK5OJYZMFQKFXQDQU80Qn4X+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NOugOiSC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NOugOiSC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b0584ad71so1215707f8f.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791832217; x=1792437017; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7OMJ6SPz0N9qiO7f7FRcF4sIfMyC3KFW6sFDXfK2+0Q=;
        b=NOugOiSCTSMWU0cMd03TBYvIYlf1Jup6TameJJ/jlAiOUqVz5AEzKcj1wh0nrfhoBP
         K65eFJ3+E+qQXJ5nIs17eSlpUtmPtj/H9AOpsgG65N7cA/97zmwM85UbhEPBe8IybOxY
         utNor2haU2ekldstbHcxkI+I5d/CuOwXxdEs8c+PF+QcSM2V8IHKPY8tGCw2KEs3svwG
         3dEtw4zX5Pa4XKPB9Q4J/rS8+qGSg8/Q0iWQCSFMPOpIOQ43T/1DHUOWSeqq0x/p2OVu
         EsdwZ+JuHO9Y87Z93/DC8XkozO7xZZiklUfJI/SSk82y96QVosiaqM1F0RgHUjhmd4Ui
         l9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832217; x=1792437017;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OMJ6SPz0N9qiO7f7FRcF4sIfMyC3KFW6sFDXfK2+0Q=;
        b=Ry8LnTY7G9dpjXAeSH1mTS7QKBS4w/i3HNd7Ko982Kx1AfhC/4n1rA32OC0NaKEROu
         RcscXbIShMHMwdhUJV4+ZxjLIsDIt/FosSOMUlz/YXKEXvgGuXkW49zfU/W4eD3c7ioo
         m/BL0tlrMclkGECUlI/OXatPci9xqgOfT/cj0o1BugJ5UUMKaDRnXa0dz0K9xSEt3Ldp
         0+9i+fXAY7Ndu9RMlbvOqHSO2UPxZjkIJmhwoojV+Bia3bogn2lpkB/CThjQLO6bh4yA
         NEKqYm7O4hnV0PSmTGCfKg/6v0pV8clDD+b62+LObr4OqTVD+cPZ5FJYanpwkIITKxQt
         fMkA==
X-Forwarded-Encrypted: i=1; AKwUvBztG6Mn03KfocEIJak5+nUEode20W+n7boO/cwOytLirOUjLEZrjN5zNiEkuZPSKFkpmrdeTeaM0eVU@vger.kernel.org
X-Gm-Message-State: AFq9FYJRB+btdRzgYhQUHAUkDXJUfNa/GZCW0uhF9hnrz/eOEdAeWvMi
	5bbI171lNtnKAD0XciRUMLaWtSNBYNB3AOsX28VXjzhRHENATvfODxwq/7WkYP33cAU=
X-Gm-Gg: AYBFou3BE69VsxD+DwOTO3csmzr6vU7TeanqFxcmYrM7CmqtywkHddDF+2SA+6KCGYz
	71ZiiGVXghkWQzLyk+2FXjUElcxPDn/3liQxxOVC96WY7/k61ICaNoCrVLeBsOoTsinxai1glf+
	ZrZ7SFxrwuJO0pakBuvhKVtbReNQpZYfLFKZ60ylDxhAQ4qjpSD9TuC5sTCCrnzPvrkWtqBMpE2
	QG+uaUSsXICMHdkJ3TNvz7jWna/HdgJWW3RppLjfcyUymsi3tOgah7YBKI4jZKzXMzuAjv7dXBW
	ZYJ3sQj07NH/lI5Hcb/RcPjq1wbppEykMPPU042usVpEUlmuI2Mbo08i/YrRrQNzib5uJpoj2AD
	zpANBG2wNsGLG+/AcKlklA05xQ5zRFNy2a8HlcxmuHFckQezZNYPImMLNEb6C6A0hUxQ9Deb3LI
	RDDlWs1y9ODvT14OfioU8vUM6f2/uhBFoFAj6StrLMmIZVs+CXJDlB8BXX5LZDVmuPBcewNLCRb
	J3Gqm97EoWxBwpC6w==
X-Received: by 2002:a05:6000:470f:b0:48b:74b:4ce1 with SMTP id ffacd0b85a97d-48dbad00328mr17013251f8f.32.1791832217095;
        Mon, 12 Oct 2026 12:10:17 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc91e2sm854527f8f.55.2026.10.12.12.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 0/4] clk: introduce TC9564 clock support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
 kees@kernel.org, gustavoars@kernel.org, mohd.anwar@oss.qualcomm.com, 
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012152408.3729237-1-elder@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
Date: Mon, 12 Oct 2026 21:10:02 +0200
Message-Id: <179183220207.266355.4262660703229090399.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0++OQnsnodoFBA+6JtVfiCpmPpE/uYI2by4VMWbbVt0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnDXqKk5oKeaK1dwRzL8wylpbZcavZWlv3/rw1Mnpff
 av/c/zoKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwESWOzH893h4YJK4smjWDC21
 a2bH1i5YW3SO7U6qdqymb2FOrUP0Z0aGzV99tOwevdI5kM+o35D3p9jw1hGRoy41nO+2XlhzLsy
 FFwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> This series adds support for the clock controller present within
> the Toshiba TC9564 SoC.
> 
> This SoC attaches to a host system via PCIe.  It includes a PCIe
> switch with three downstream ports.  To one of these ports an
> embedded PCIe endpoint is attached, and it implements two PCI
> functions.  BAR 4 for both PCI functions provides access to the
> registers that enable or disable a set of clocks.
> 
> Both TC9564 PCI functions can provide PCI endpoint buses via
> devicetree.  Each PCI endpoint bus provides access to one of the
> function's BARs.  Subordinate devices (like the clock controller)
> can then be defined as nodes accessible on the endpoint bus.
> 
> Only one of the two PCI functions is permitted to define the clock
> device node.
> 
> 					-Alex
> 
> NOTE:
>     This series is built upon linux-next, with this patch applied:
>       https://lore.kernel.org/lkml/20261002181849.790275-1-elder@riscstar.com/

next AND a patch on top ?? you are not making this easy and this is mostly
to accommodate the DT change that could have been sent separately.

Basing on linux-next means there are other deps and you just did not explain.
This makes it very difficult for me to apply your series if I wanted to.

Next time around, please send a series on the clk list with only the 2 first
change. That way we do not have to cherry pick, we can use your cover letter
for the merge commit, which makes it easier to provide an immutable branch
to another subsystem, if need be.

*Clearly* list you dependencies if any. Please consider using b4 to list
the pre-requisite.

Thanks

-- 
Jerome

