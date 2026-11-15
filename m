Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748944;
	b=FB0xdkPy+FH40adKsNJwS1GYLxhg0+Ikw7s9EkP/ZiOASg3P7UgL6JO/y+fsLBNRZ/2E
	 CrUh9TPdj1vhWCBdl/7cmUhHYtpyBx/VnenD1hZveGn8xOXwdJ1NzHIg3OMhFTYIkS0IB
	 gjkFs0oHZRk36AJ4UHPEC5hp0Hjd+oweh9XsRhJmtDdEJcpnFHqLxPA3oiTOuhJ5vrkla
	 +oUWiWz+BYg8jaUhS6ZR2ceygIwrIdDj5wSj9SUaANtYMPj2XG4gj5YWBcCTRBDnPv6b/
	 L2MTR0YGwK1CQh5koPH9cYbFzCLE8CMruh3mV6nEGydLzH7yfjj6i/232C4T4pGnyrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
	b=NhJaSmsff+Pt1KPSh33X3ZanaaFAQeXxq+Szxtvz4uUgXvLJhvbBD2zzm5JGu0Jsv7zA
	 8rFyxciNXq3QH4HfsLsUAmhZpJ6zohLo2v0MpRi4r/t20YteIYAW6bUG/BKys/fJQYvYN
	 VZWADRxuEp3oyf8n2RsxaJ1pWFYhXNhZdXdHkvvAKn9oQtE4ctxymZgFEwLUbm5LDGbyd
	 +VJJVBtT8W95FvSpsK8CaZ100JZFeLZnf8z9tdqJ2zjweS6wCGiT0Vj+JaRnZbRvv3OZW
	 hpa30jnOYxAIBLuGqaJIP0Mc0EjBSiM1x21Jlp7h4sP7+3JKkSB2LsO8xJc8fGG0fBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwsuDxur;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB08606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB08606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwsuDxur
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-497614c95f0so1097352f8f.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 05:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748942; x=1795353742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
        b=YwsuDxur1kI1mkhlLa3A/Q4nD1dPZFsvR0Q+FIESHwBbm9ST7VjNZNMlAbHIlX/iK3
         KcJjmnOYR+t2OL4YS7DP+pUZI+gP3kj2F3iAKtVS9cOgSfT47AK+1Gbegc434VxOXZWo
         HuTYt8xy/MIoY2U5PgzKf4CFJCiYtzuIUS/M2zN6ADp8v0msyOaMfmTRvPwpFcz1W9LW
         HbbTUJW5zp7Lr3cYxENnPxuKo2wfXpktiLAxHH7yoQqMRVZZJfdRN82E0Kpgj+hN0tg9
         NwBXtiLVdQODW/aJ5hahcKv9WhekqsaLI9k6I7JinSwT/O5J6owyOcPJUp9WQ3TcaE0/
         d2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748942; x=1795353742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
        b=iGJMDHJ1iG1A0J8BQNbw1wwaxvbodURp5KApPOFhxJkEBztJOefEw1NtANLaIXAyk6
         kcoTCP3PVhHHHDNt1y21Fu2izF+CnkojaRa7ruoAFVgym3U5Vj1ii7vZZH/W56Q4N6a/
         MZ/91XkS3I9s6Dyg7Qf6qWQeX5r8gO4OYmeqIbSnajGO3NeSkHj/WY+e2ZM1EOVWf9hA
         A+/jT+pmFdSW9Tijst9RDTTdMSK8aLsPWnT89/I9z0nR2X6QUSI0lzAtq+bGOUA5M66o
         jgJCxe1AEDLmapUEi66cM4IbfsiCnQ4yip+UHfQ1lOnXW61Bu9/cqI6zQdQUrUCPrego
         mt5w==
X-Gm-Message-State: APuU4Z/lLw7gU/WhHqG2vcd7v2xcGPfyroYJsPlZya3OPTbSjeCwbu8r
	DXj7OU7TS60nDlIm5gFm4M+KB8H+olT33+Q1+z9xfN0rrjLZ0yzp6m90
X-Gm-Gg: AYBFou36S8HwfZfpUkgek+IS52up0y830lVh4ai0XQNptERZYXxbUF6xeJduiM561ng
	JI/aabRnw8XhjntuH+hphlEKonK10haqRhWbO4BJcTxMkFxTdlinbOOn2aBUMyPWJ4Hy9tM2J9L
	Ztlq6oNHkPcAc5MdazlDMkBG1ogSAM2f3ad22oQH7CJcVxzQsmqftv+n9aurcXC+rDdCDzpPqne
	Bkd+nronPl658FXXOuDkcbX/n3MylaqQiMlSZvRvofZQUYHnDgbVt8sZAhYOqiRN9rNok5dMwTp
	onrcczwRj5Jl/ua8eeNjYIjC3O24IwAmnVzWvy9Myv86yZny3LQ1gIBsLxDoR3VItDSEZal7gaY
	4BWvpluYbyK1OEmneG0hokAEOyj9VuXjH2Vq3kwHe2pCfUKndZkp9+0Wgu79ZiOA0jZsWafgoEN
	yCY+S898e9Wjw2+LUsgWtVrI/e0os43DMS8Fqs1fy+XlWrxXnPWgEuoLeh5ttrJyFsjL06enu7I
	EFhPCCYBDp+KG4Y6q3XjXPE6cr7HD+gTjrZZ1TRi4LOYp0g+K0CSyCXR11q2o+lJWQQDJZ7XQ0b
	ggzqtirg8zH5ibtgKKy+xlUEPdlHsJv0RdXJKffBjUQBdYHkEOe3FZc1wUijcElNr/NZRHKCNNa
	pfKE2XduQ+b7m29TwpA95sC01vJJaudKgPwUrgW48EnkEp30bHht9UdOukuJDUPQoeqX5ZDCw+R
	x57cWsC78YGDDpXyJIbJShDMBkxRyo4nvKuRqEMbzJ85kEeHVIW5HwhxEvR9Cz1Q3Y98rbzvXQO
	4JQz7cOswkHwUL8s3/1JEglBxFHxny2kkA=
X-Received: by 2002:a05:600c:3b07:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb5de1f216mr129069365e9.1.1794748942112;
        Sun, 15 Nov 2026 05:22:22 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: allwinner: h6: Enable GPU and CPU DVFS on more boards
Date: Sun, 15 Nov 2026 14:22:11 +0100
Message-ID: <20261115132215.289236-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Most H6 boards don't use the GPU OPP table, and the Orange Pi One Plus
and Lite2 lack CPU DVFS as well, so their GPU and CPU run at a fixed
clock rate. This series enables both.

Changes in v2:
- new patch 1: add regulator-ramp-delay to vdd-cpu and vdd-gpu on the
  Orange Pi One Plus and Lite2, like on the other AXP805-based H6 boards

Link to v1: https://lore.kernel.org/linux-sunxi/20261104184940.882833-1-jernej.skrabec@gmail.com/

Jernej Skrabec (3):
  arm64: dts: allwinner: h6: orangepi: Add regulator ramp delays
  arm64: dts: allwinner: h6: Add GPU OPP table to all boards
  arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling

 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 8 ++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 11 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

