Received: from mail-pz2-f30.google.com (mail-pz2-f30.google.com [74.125.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805073DD871
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975735; cv=pass; b=bTjG/N0VOOIuPYxAs0HdLAHdJNzfIT4idxNbA7p8xCk6azZvHYUgv9V7wUhTYGnKsRGDgNMcew1b1ePnItrGBlcWDqyoAyKJ8MSzXipUeSMcrLAtjLrULRMmfIRSh+9XPv3x5JQ1VLmj1h7lJvGeMdUEAewa5SEnpISG0mH81Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975735; c=relaxed/simple;
	bh=lxo3rItzOI5E9MqNdGIwnwpWKqkISYML5yv6YHZcizc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYC85qlnhaWC+Zgt//8l7CFeECfjk2vzVtJaats0B35NVJnjOfSNGvyOl4vtQpOyP8MmcdeRMWWsyGOq8rHLin+ejj/NNiw5w3Q6FAa8PQIfGJPUh+9i8rsJM8AKqcs6xjp/cULZ0gY9mk7UPk+A/lSI9+8/ycVoew1EuJw5qVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPK8/FO4; arc=pass smtp.client-ip=74.125.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPK8/FO4"
Received: by mail-pz2-f30.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so1074483a12.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789975730; cv=none;
        d=google.com; s=arc-20260327;
        b=Ff6bddyCZD60OE3ZKfTstHPGGYWYBNGxn+r/Y2OjNivB1TqxafqGybqBePwO1YbplH
         KfKgRZ05O9qtgwN9GpCZqJwWImUtlAs3dJgr6R0r/g5T+2+4g5M80lf0Nts0g8KtT2Ji
         NpRZPn54qysWQfQtrO/g4BfpS3kk2TpC457cK7T+STc4xYIMU6xRBk6VraaylOD1okS6
         OppVhgduVUSHCwFIRV85zAtH1exYCKYSKBJtqGs01TPX+MBLiWlpfkNRMbaWD9vURa2O
         vYrNn5Ab73dBu/jeusDn+r8EC+U3hZNJUG+vd7mF3GbB73Tk87mBNjfCfUUbm72yavoD
         ouYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A6cNT/xOU7D+9cHzOo3kYyxs0BX7F75Svm7QKlu1XOQ=;
        fh=2S19mWitZevCxODI7XtEiYkQzLn6KLUpsx76Fj6qenw=;
        b=dWNEDfm8ma9yQjbLor6g2BkLeZQiyHbJDrZeUC5YDPyTH3ENr1+iNHE1nyjbAozlGJ
         zD6IP2tq8Hf+q430NoiHCEsGAz8cSdwuofyVszTsHI4R0U3LxPjCwSWdgGtKKDwMvgHf
         yjmEcpzapX5nzXq1HSXLXsXoN2aF5lhGiyj/bqMA/Tyz/eb4VO5507VulHEA3W00+Ud6
         ytrMUvr/oKOueJp1wHwO49WcvQxUhiJPi4kcEl3N0e5XQTfWSuAWgJFV24iyuH0+fOlA
         VUZvPVYojZq6bB+/edYRNILOuT5BevUeJbTTkN7t3d+D55kQ5lIFZ5JqR75X/o07m4ks
         9Uug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789975730; x=1790580530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A6cNT/xOU7D+9cHzOo3kYyxs0BX7F75Svm7QKlu1XOQ=;
        b=BPK8/FO4MZk8LnmE3C0zsRMjRZqsdw9FI0zUn8r7RNGdnKb8QXCR0SKb6oDI7lAhVP
         m9qZlWhIUIonYT5m76UqY1uDUOLanucx1YBHwsRlm4XGCwief3ZJdpiTTKqo7TKhXNV4
         K2jsXoDnXpe7PSO//bYlC7kIframl4HaW69jsN+ZUy64hEPs+PRo7TIduLimrD9ZotFT
         o9UpH0mmaaJMZT2p06Yowyf9oOQkZHSbRbIPTCgJR+VT4NS89+xVr9ius11hEbIRgyp+
         zOvA3IbebjUViAfJxgkVzNd12W7Lp7a7i75bwlVfVS5BuI66X9kmYCA2civlJw6KE4st
         KR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789975730; x=1790580530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6cNT/xOU7D+9cHzOo3kYyxs0BX7F75Svm7QKlu1XOQ=;
        b=EEdB72332W4Nc8QRC7IDxN4sHSqQcnSE0aXp0EZugMiJ3tC3llX8Jvh66iGEesNnHw
         99OdKXRKzhlGiRO9Q83irWeRAgrqYWQZCyrxr862wenKm/iW6AejlXMyYhzfpc7CLRuv
         /py7jQtxLil4oYfZmGvUbaUvJYqTXoegl/LLQPEXSStR3pV+ocr/+rGKlFUhmn4RxuwC
         f1rF0r2qjhBNvOTMvHkvleqEK29fm/KbkqJny6YWpfWanpZfIJridC38A8V9BICIJOIn
         3rpqmYvubtZDgWoOqIX5Rh7B4mOXJ/UUIzFVrUaqq6IkOH5MUYpfAwUZ/kVgCATM6zKJ
         utzw==
X-Forwarded-Encrypted: i=1; AKwUvByr2APJdKdcsNvK5Nh/9TLLMb2Xdff3hdZF1jt5Vu5VnM2iM5XM+4ravtVEfAd/1naczcnwmLWsPTCO@vger.kernel.org
X-Gm-Message-State: AFuF++mg9SoPuQ/3YZ+vTqOO11V2MTygpH6aYzKkajhx/t9PxzPgUR1B
	YnJ4d1sPgMBRrMsGmR/37o6H1yHi68iSACBrZZ4xljWd5TZedXcWU6FigR8bgUP86kGT8IMbaAZ
	dEq9F1W3i/4kcKMLoEGFda+83HrFd61mwkQ==
X-Gm-Gg: AYBFou0bU55jetgiHZbBUlu5ScDpaWLFfmSXe8X9wj4mzXoLyAboJAZB5Vb4UAz0dJU
	cjPvnJyg2OdDod28V5ZkuhTHdDe/+Gdtnu1vqDskM1j5RThPGKQt4eazZcz9dsaqUz2pgRlwRxT
	TG2LRwZY85ZPseHoYw6Al6FDT+o4dAWmSEYSf5igIrJE6xjDFKFnF2CmGZ3NDi1wGGc5OFUucJD
	CiMsA89zCz2kvTNow9ABZ90/6RFROUNnGdk+jXL8kvptHSz8nN4tdYb6UGk5HBywJOmkhko2M0M
	xSqt49TCu90QL9X84KJixqVdXJZzHPvbuhrqAy4cLwZe9aiWlIN2NBEPDKSfVomUCckihV0S/qe
	QNj3REawf0YO+
X-Received: by 2002:a17:90b:4c4c:b0:39e:4c7f:7307 with SMTP id
 98e67ed59e1d1-39e5506f80fmr15344793a91.30.1789975730612; Mon, 21 Sep 2026
 00:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731114106.169398-1-clamor95@gmail.com>
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 21 Sep 2026 10:28:39 +0300
X-Gm-Features: AcwNN1WIubtOA2Pf-MJxcDjvG4Mtn46SZcjDO-qZ5S8wuOcCU4q_uN3xE35GGCo
Message-ID: <CAPVz0n0jQCLjBPbJcmJLgW7MAjS9pCZUpVv-aMFp768Dqewm_A@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] ARM: tegra: tf701t: Add new features
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 31 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 14:41 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add new features recently merged like CPU DFLL, MC and EMC timins
> along with fixing some existing issues.
>
> ---
> Changes in v2:
> - removed vdd-cpu-supply from CPU node
> - fixed typo in thermal nodes
> - adjusted MMC flags
> - improvements of commit descriptions
>
> Changes in v3:
> - expanded commit description for BCM43341 related commit
> - added Mikko's reviewed by
> ---
>
> Svyatoslav Ryhel (10):
>   ARM: tegra: tf701t: Configure CPU DFLL clock node
>   ARM: tegra: tf701t: Add core-supply to PMC node
>   ARM: tegra: tf701t: Add MC and EMC timing nodes
>   ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
>   ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
>   ARM: tegra: tf701t: Tune MMC devices
>   ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
>   ARM: tegra: tf701t: Complete power sensor node
>   ARM: tegra: tf701t: Configure UART-B line used for GPS
>   ARM: tegra: tf701t: Add chosen node
>
>  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 885 +++++++++++++++++-
>  1 file changed, 848 insertions(+), 37 deletions(-)
>
> --
> 2.53.0
>

Hello Thierry!

May you please pick this series if you are fine with it? Thank you.

Best regards,
Svyatoslav R.
