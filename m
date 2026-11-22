Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375161;
	b=Du3NJnVWiH+wThYlHS0am/AHXpU/31Qq75Zgg3LoGW6TV5lDE7vtl/9rgStS+viojatW
	 u/kePHniNnxMnlqTBGscr94fzcydJ+S/GtDFGJBAM9K3LChTdRPBD9xMxwGRlo74X7sw2
	 RTA2J86w31cA+1HS5jCYfFwhZB+Qqz7v1A6zdr4392I7k1ObdAaBb08kytUCnMzrtkezM
	 szbWkOscbc5UKg/4rCCmSoyrNSt4izodK2MOXN44WJNA4HJ2PwbNxBgBUf64mAYD8vTc5
	 oRfVPSFTU98pAxpsJsD+EoQKZhXe98rork1S7DuxEHS6TxQr51cwFVQob9IZvzvmuOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
	b=RkFS2JK7aIrTRx+p0g88C5EeMPFatwXfXqeDZQN6dRiwxnV4ORe2NteukPgi+eDhmB04
	 0cvV31Sy7HVGh23q8PiznE5rhUtR9WriqJQNJhVlbQdwypcP1NMPYtNlOfASWTvxHru1V
	 IyFqFcmAYw0unR+yWQJmOWfaRS97TzFOyVu8loreeLOFVF3oi+wK7cKZc8e0Ia1UFlNF0
	 GtNFB6L4672ksCjLAP7ezBoFQFNsdLXkE8ICGvFWroxVg4hdvmN9XjdDclET6xXgbF6Sq
	 6YqKSmOTxElsNDRjfuZX9yRzQNlQhu4imMavBAbZVyZTvMDoQUdQHGICKUJjKgv+uXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6dSI3LA;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66206606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66206606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6dSI3LA
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1797096f8f.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375160; x=1795979960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=U6dSI3LAe1VrIYxBtdeXBr+mcGP4NRfxblw/6vXiYnN/hUemD+dcYCiyg4bNuRa7Fc
         PDwZ+RAy6HDwdH38XPhpIuauHU4m9/cBQGAJp0M9lxLx5Zqlssd+OGlQ2IMKtEDYLJCp
         Pwzi1BJffZMEU2tbHRY/eDAW/aJmWrUEqrJaipHLzdRtcoGWFieYvDL6hWqR8w3W0WoG
         +JhGcDs0po7rES+U5o4htIhLKEGZGca+4iPm1NpNTrjk1wnWIXEfqMQugIr4tUs31hSB
         ZHA3ckOWe1qPgo1hIETJIS0bSY4TNEtx4lKiipEjEtj8uarOyuCXIe4lTBMn2cinS4Re
         bvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375160; x=1795979960;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=tO57Yhrjxd49+/NvJ57RUfLWwOjUjs+vLLpJFAqGupPTAiwVshBk5gkwzRJ0axSgQv
         38TTlt//v2S7kWY4AUvzjcEtysTBPkW0kyaelL4l/HmIZMjeRHH3ssqAh6L4LBPwGJUI
         wlLM5ex83xsukUKnSsjH8TLLo3n9RzP36sKXa1wGXkO+RayiP5y8GaCa+Fq6AkG1QnuE
         cUVAUEsumuOBp9bTSdSug4TtmBH/wlEulmTy93hIXYZAO2il0b9uejxcCDSJsD0MsCT/
         v6KkKzwmfgJQHD84x1h+Ib5g2Wfk81TpkL3xdgStE11Ni6xzeX0vWyyintBrXt/9Dpnn
         Sljw==
X-Forwarded-Encrypted: i=1; AL+hErH1wUcMzVDZUn2A92laMb6NEnP8eIQb8Kob5HguVAv8KzeTD3EwrXR4TIclu8zV/BPJWzpUL8BrbwcE@vger.kernel.org
X-Gm-Message-State: APuU4Z8abG/AOeU2xkKWZSUttZvDFeVfqUbjEfXjLskv/E+a5Lc6eM7l
	piDqBfaywnh5SeCplwb+yCa/XPh4jdfMi/ZyoOCC9INvWh5HaselrHbh
X-Gm-Gg: AZFdTZdNO2k0lE/pSIADjpAX7Kv1BjLQg6JXBcqywSjveZcBp1scyAVBKs11pd717jm
	7/YkBH0CMsKeg2I7Y8PD8wxxfyztJiYotPfNGonY+lytg1HHreUJAFz8lnN3g69msjFEAOpnlJz
	Jdy+mnQ9JSnwS6Y5nRsqrV7sovg6SxCGkkIH7cMWsAEJ6GPNF2y6fXZ8u+A9gkw0tciPdvUjFjh
	HfrKmdLql3soqqAZEqfcs4t5GWgCYZ1uMMCaDvy2ccqryGf2xD54T0eRt1DNrGRn+pNGc9R1Efo
	DTsCcfwWiFuq4jpmvYexOQtLdK0sQ/zCGHDCOQxLH43O234cvQGH5DLn2D0EcnQTTjkVHdsENUF
	VsDKaS0mgzxJzjL6dOY/Ay62BBHomH9XU1mCT/PVBlKq1VgmC5WySkADIWVKsKTK7fx5WamVRnp
	KD8YYl9+bVJ/Jkg2Q8LnPofBWiTVtI3wV8bf/dh+1COO9ccTevsCQ3KolToxHGHWzbejCTB4flk
	2vRF1V0gmxbw4SA8r9Y+NZ5AOKGSMQ+y4INWHViqap/XrcxutPEuy58I1/hNfxPDuNHlSK5jY2x
	MSsA+GbDOgQdbWu/68iitJQrTuxxjJMeJuqut895OsJkcproYZW3HuqcpK21b4kkRw==
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb8880f283mr208928685e9.19.1795375159763;
        Sun, 22 Nov 2026 11:19:19 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm389657845e9.13.2026.11.22.11.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:19:19 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 7/7] riscv: dts: eswin: add watchdog support
Date: Sun, 22 Nov 2026 19:19:18 +0000
Message-ID: <20261122191918.2184139-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-8-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-8-pinkesh.vaghela@einfochips.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3;
details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
