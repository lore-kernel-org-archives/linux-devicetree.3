Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51CF2DECB2
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775221274; cv=none; b=ofIYMWNa64fLCeZF5VXP2iQNUIWDJ0B3DgMI8sJtshCrsBEJrNHEUvYrjuegEkgIP8WHGUMRpBHpbZqAOoBBtlDGsG302amgNTDZ/dsK6PaT7cYkMl1D6tvfp/yjW5FKzV3vS9LG+cNQxyxs7b8aSiPDlSRlZCIPJ/+MlQcJL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775221274; c=relaxed/simple;
	bh=viZ2BYLfE7Jb+K6yLXxVTA1IC1vVaIvF++RPVD4z8nQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ffrEC5uOx6t9VhdeXz31gVjLe0fx0xxxJ7Vgbofw4f1+7exDNXevrbvQ2ertwXCMSo6dJyrBpfqf9nLv4SyY7YIXd/XL007Kr7pJ7hS1v2Mu92CWPR8IFWSTVWrfDtaV+0cQ1D0oC/x7gqm1+4unpoe1e4AgaWY3q5lO6kXG0nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fT6U9tO4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fT6U9tO4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1E23F1A3127;
	Fri,  3 Apr 2026 13:01:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC5B7603C1;
	Fri,  3 Apr 2026 13:01:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10E12104500C5;
	Fri,  3 Apr 2026 15:01:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775221268; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HN6EflbtZf6vQPoHUqakFtjSTjuC/o+6ozjBJwvQ8dg=;
	b=fT6U9tO4FYDa6gDRuzKKtX3r9jJ+vW2jWCXQvM3ucjB8wWrDIuc1Mmr4dreXEKBND0IBtN
	0OoV7t3rVHsuEvWboZdnnJ1rfmLEyjIZmlc17IBiMUGOO0lFoERtOP7i4hWORStrU5wYOw
	74IJU1RwfOdof2G2n/2hSjfBttmfsE2wVPk9CitM7CIgIH02Ep76+uZ71250SwRYwmyn46
	ot8aw0GDCSt0fMTW5iLKJuIKK8ZJx2lYFFD9+/VhFC8XwE7wQ8q3xG1eSDPf7UNJfXlSl3
	DEQHviUByHHamqXmnfgxEmIBE/ab+qyN5m/Y57qyYe9exQRzue/4gGXrj/mRDQ==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/3] clk: eswin: Add eic7700 HSP clock driver
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 p.zabel@pengutronix.de, huangyifeng@eswincomputing.com, 
 ningyu@eswincomputing.com, linmin@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com
In-Reply-To: <20260403093612.725-1-dongxuyang@eswincomputing.com>
References: <20260403093459.612-1-dongxuyang@eswincomputing.com>
 <20260403093612.725-1-dongxuyang@eswincomputing.com>
Date: Fri, 03 Apr 2026 15:00:55 +0200
Message-Id: <177522125518.65868.10463060970678520217.b4-review@b4>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 03 Apr 2026 17:36:12 +0800, dongxuyang@eswincomputing.com <dongxuyang@eswincomputing.com> wrote:
> diff --git a/drivers/clk/eswin/clk-eic7700-hsp.c b/drivers/clk/eswin/clk-eic7700-hsp.c
> new file mode 100644
> index 000000000000..65ad9e762ee9
> --- /dev/null
> +++ b/drivers/clk/eswin/clk-eic7700-hsp.c
> @@ -0,0 +1,339 @@
> [ ... skip 64 lines ... ]
> +{
> +	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(gate->lock, flags);

You can use guard(spinlock_irqsave)(gate->lock) instead, and drop the unlock.

-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

