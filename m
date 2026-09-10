Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B647AF75
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 12:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042278; cv=none; b=FADAILxwClYbhx+XAuXl8g+5/r2uRJ9MnEbDJvnvPh8LRxw5yQXIRZGojzLfX2T4xwnSFKQ46Leyi2ltCo85qPk+Cp57nizZV31qMh1V3gamMPg46fCLv0XlNMBrXuOBFULkfGSbd2uTtW+831L+Rj86T/vkvXllMZJNEScpSfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042278; c=relaxed/simple;
	bh=Z4TG9gqsATkZZLxrzKjyJEmtHPOEPPy+9nNx4oYsL+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=VvHDFt/67w1U3IERcoHx4eZHFlr5oH4IFCtYZHBFVN0m9F7uZaW+zXN8xhH+To+doTplMJzpxNG0RHk8ErmwWHWZcHAUwCOFDQuwqy/RQZsNsFhwbcH4vPA1pRlUK4xQtDiAuJuwJiujGJKP5ALylq1lPGX6hB9Fg+xQJFfzjJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipp2ag1j; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipp2ag1j"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6bd07679624so2559449eaf.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 05:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789042276; x=1789647076; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z96/yzgqxZwebx+1STswIi+Go/ctjBNtJnkegSe2jjQ=;
        b=ipp2ag1jESoU1+rDQjDffdmrBGMdcBqm7iqrrKrjN9p3RToVU82ttLzlEItbV+oYqC
         Mnt05FA58N3D20x13y3Aziy2zwCX3wiLkg1XEEB4MARA90fGexAWgmgHlNxFBikyG41k
         7UNxpI/DuxH1AdoUG1lY3SkPmCCzjXZSZaEQ2/ZPc2c4Tkdh+4DW1XQ+JCU7Rwmmuw+G
         QwE7Ncz2JZdodPixqjLA/urpguh4yEnDdC2w62cUlnPJY3yJ77gnJrB7TbcUW7iOEx61
         4SRuZepfrRDyW42hLYKlFjQ/MPSS5XAT8eXmr89zdR5eRH5YdegvJTnJoOHxwBPgBm7a
         camw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789042276; x=1789647076;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z96/yzgqxZwebx+1STswIi+Go/ctjBNtJnkegSe2jjQ=;
        b=KhNtvvHRVGJAbu2TEeuyq+w1u8lD/avkoDZonpzbXUcfnfeYp3FsCMFnCO/ZHtKQxf
         FXQAYZwgM0bZ9/SzZ4vQdmhWtJKVo71HuezJ3bJgbuWhntkLyXtjCRTOH449KApEL68J
         37k94fKGu2GqYBiJoThmE9ha3RLh826QwnKRNqY9WuhQSwdDMuJC37LLlBuI3yg0mi6Y
         qa91duXC4pEUQYqkVBCfvAT1YR+5Jz0w2h6WiaQVKmeKU+lmO3Ys8nC0V2VABj7XlQ5T
         ad2T5y/6TwLFcIJ8RsOpdRv8r87FH80YmY6F36CUFrjvW7wBnsy/fPcf672eommgye2z
         XK2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMbYZjH7juFPY82dumtkZ8WTOYhfTqafdVhmPtmfr8Ky8bxze03T4tMWH+wjH5AUshixb+QwFLY9cw@vger.kernel.org
X-Gm-Message-State: AFuF++mtA1/G7dzN3wqv2QVZsUGgRxhsed3J7LxhdycMjKOf/oyD3p21
	RFMZR6O2QlgO8o11ZOUhfHxPiZrwLyJEpoN/Vh80eb1cctPYuAFZIaM=
X-Gm-Gg: AYBFou01mvBO1WZS4pDcC6xm+ez07MH3jzBt5SWn36n/5wIJ7D7clVZ7w55cevjAfDe
	3pwkfQoLneGnkYOQYJxH9BAx3UeR7YQT1psCw79hTO8GZMevupShYjNiGePQWzkE7JNiTf53Gxw
	tnoERgHbAd8G76Zh+AHxZGUktfJOODFAX7PgOKNgqn5EVj2hMcgVS3C1P8RvEuYamLFLxF89jEU
	kNxTt0Yi/lnXQJ1ViQNY59z4pz3P3jYa1WmTPOf7yQAU1W1aeTsdjRdH2IeRFEBrrLf29qQGXSB
	FsnV3LR4YWwt+DhqvF5Q5IB6IV7Q3Ldfpw2L95mgOf2p0ouiCxwZwnZy0xPoqIVKFVX9V0FdOT/
	YTYDzd/XMHqE5ruXuRTrG1IxJWbWc20LK7efAK9wV7+n8XoXB9UGv/LIiwnzHPD2xgjc2s6MyQZ
	HFJcGYpLQ24epOJQ07ir7hNghGwJRROXcbKraM0GFSyVFzxpmrENxcAFtqgSyDNPSfaocIwZqnv
	tqkMqNs2kS+0+Z/nH8d93D9AZwOL4te+J4d9WlpBxyYhIco
X-Received: by 2002:a4a:e84a:0:b0:6b1:4a71:775a with SMTP id 006d021491bc7-6b6fcbde97emr22252414eaf.19.1789042276189;
        Thu, 10 Sep 2026 05:11:16 -0700 (PDT)
Received: from matheus-note.localnet ([2804:7f0:84b3:2201:fb27:8354:17d:2bcc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm53156354eec.26.2026.09.10.05.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:11:15 -0700 (PDT)
From: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
To: andrew@lunn.ch
Cc: 25181214217@stu.xidian.edu.cn, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, b.larsson@gmx.com, cjd@cjdns.fr,
 conor+dt@kernel.org, davem@davemloft.net, devicetree@vger.kernel.org,
 dong100@mucse.com, edumazet@google.com, enelsonmoore@gmail.com,
 han.junyang@zte.com.cn, hkallweit1@gmail.com, jes@trained-monkey.org,
 krzk+dt@kernel.org, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, maxime.chevallier@bootlin.com, naseefkm@gmail.com,
 netdev@vger.kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, vadim.fedorenko@linux.dev, wangruikang@iscas.ac.cn,
 xuanzhuo@linux.alibaba.com
Subject:
 Re: [PATCH net-next 1/2] dt-bindings: net: econet: add EN751221 ethernet
Date: Thu, 10 Sep 2026 09:11:01 -0300
Message-ID: <0bwM5hNxQhuX7GLiig7ffg@gmail.com>
In-Reply-To: <a9eac625-f0f3-47db-ac2c-26c7df66f52a@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> That is a very unusual phy-mode. Is there a reason this is used in the
> example?
>
> 	Andrew

the GDM1 and GDM2 behave something similar to the newer Airoha, we have an MT7530 connected to the GDM1 as internal mode, and the GDM2 is also an internal one that communicates with the xPON and xDSL subsystem.

the en751221 has two mt7530 switches, the dsa0 limited to 10/100Mbps and a dsa2 1GbE connected to port 5 of the dsa1 in cascaded mode, but it varies from chip to chip


