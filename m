Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BCF3D47DE
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199879; cv=none; b=MAjhFeLkDvZH+rFwoRaVvtgXMO2tx4PRNipjJzbtozJhpSdT0iyyVT9BF+kGoGMp9dasEA56Zebo28/aYlLEixMgJTrZCCTVsR52OIla7dI/ssgcMInsFC+ujFRaONq2mv1tWnthQG41HXBI0lR/1RA89N3jMdF2GzpFkL1UC+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199879; c=relaxed/simple;
	bh=bFwA0sriWkTlKXRDjn9IKo6h/KLj+VklQAPyEN2y9fw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SP6whkg7boBCdfBq5vrVQ6cbda3XtYHXdM4bHYrCW2uxjicCEU4NzTTA4gykqKW5U3oWnCrwSyaCByqCexOio/uLwloc73nX2P94P0uT1wl7pBkzjCIwt3mVOXy55YXre814vUPvY2GEBkKdw60bHjdypuIVAPLg58T67qlA9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YXX+AqM1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YXX+AqM1"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso3867155b3a.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199877; x=1788804677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPRLJsmBIOe0A/ppcX8+UUJeiiOHfTZv4IvoKZ5g4Q8=;
        b=YXX+AqM1DIvN/VJGXXE+xbzosC/g9aU1PuKZFMZcqT5veZpSLaZDLma2P4IjEXsM4s
         aSeojHdFdc21MIGB795dL9VLuXYXjzrpqwGTivic4J1ufbeBjaXQfVfnC3iThmX4rJYK
         Xk+96FTfYz3WjpJxEB99Q0GTCtAwC9LMKpusJNug8MDMu4+V3QhKoQ1m/fPy6eL4ZwR0
         xXs2YriHfyl3JsJARWvfMQiG9WHVYLJrc6UWF2oubjQFR5nMdEXbOhmNBpcgprGXiqdk
         Ek7qyAI16VS+YaCqu1NfovXxzSNPIDWNXFD8SvT+OhAntxYitvcGNmGe6xAuXj/imijI
         LJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199877; x=1788804677;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPRLJsmBIOe0A/ppcX8+UUJeiiOHfTZv4IvoKZ5g4Q8=;
        b=C7VmtKPyIEpMxP1WCvmX/AGinBX+gnGfcOjvY+z2ziFaA61QEfrFFW9AonuphQNt1Y
         vwJ1vroQv7T6jSx4u+NVZGb+m+6nwhuPYfSSNdkizkf6XqtvXXLT3rVyXSqD37PwHdwL
         ybEy1UKQ2FJWUfyFLWxpvag2EOsFazlIsgBjDm7mLhj5Bq01zEyouOfJanCwB37fjV0m
         QVt5TLZfYgpOczPvjJAfGc+s0cwI1enRGKS+iYBvfENd64qWYyKr3j7bEzhmha3fn0nb
         QmN/l5BxESoUgD5w0v1bP2JZey6OzffgaTKpVCh+tKSupy/IVx3XUd1w2QqHUbbkQW33
         Qprg==
X-Forwarded-Encrypted: i=1; AHgh+RpVwNBQL4b/oN02HnJb+xJqrejkDAOJh0+0cZXYIMLE2rO87X0aZv7KbwPlrwMwtLPWfURQPGHdgMHF@vger.kernel.org
X-Gm-Message-State: AFuF++kvhk0JH/sMkeymbkpuaucqkkvCm1xW9BV8I5qLFqOuXibvIDh4
	dTHnvluRmSyXkNz6ApdE66NVYPYyZyiGpZAm7MjtF1QyyS9Qj3maB5m9+IhLPZ581ONZvmbu4Xd
	YGCF0
X-Gm-Gg: AR+sD12tRbD0z1DzyaPlIJXGUC4dZV/YX5XMwo5dF+vHAu/XQadp/SOA4O0+EHvzRJA
	QODsNNcZlSqh4TEvYlK0KLu4lPZya1W05JV8IR+z78jOxJjp3FhgBjB9GzBKbCOR0wkNGR2gnCb
	AR4Rjuu6081zkuf/H/Eor0Y/gsRt7RdmkMsz7oZJ/8QlNwPwzHbrqJQ2Fn/VsleXSr1wLRarHRR
	3z8nHXN/KICo/15FkkSecaoGdYj2yrIJfh0o2FVQNESKpPhbRhsp0H/O65SbJQw0QWAE0eNrLTb
	Vp5TOB9q7bSuikBk4rQZaBOSnLnf9wPYOV3V6dYHgaEDbAP7pVJbYaVn7HOL86JGvv0AdTRmeg1
	gxu8v01PtgbOLOnPOCzLDi/3HziASb2rOra6w/ekwN8GBR2kFupLQRAAZBxu4qy7lV8VwBGC7g6
	tmD2rjuuEsBt8EUSjg1HtmRMs8cwH3cmlU68Df/vFYt9RLQoZwTI3AvJ3Heg==
X-Received: by 2002:a05:6a00:348d:b0:857:7337:5dbb with SMTP id d2e1a72fcca58-85773375f79mr30960283b3a.25.1788199876932;
        Mon, 31 Aug 2026 11:11:16 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8569fa79d0asm4201641b3a.14.2026.08.31.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260806070306.40285-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260806070306.40285-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3] ARM: dts: ti: omap: Correct white-space style
Message-Id: <178819987124.2869653.12350593238892028766.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:11 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Thu, 06 Aug 2026 09:03:07 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied, thanks!

[1/1] ARM: dts: ti: omap: Correct white-space style
      commit: 0fe80eafa36a20fec620ba16992016137bbf3d6a

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

