Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496486;
	b=cDp/pm9H5hJ6Q9/whv3Gq9HRIAqV4mUJ5/9989xAVJBB8GwBkImAMZ+b4dYt4Eecmc67
	 FSq0j06hSBdwyLTE8UsWe5j4a8UXai/eKPzVYVqz5ukxFiN7s4Ij8QCUrkLHlJWqR7PPW
	 ao67DrZKW1vGEXARttTECmceijHTu1mo4dj70FfLlPbUHpMV1P0FaD8bFcjM13dGM/u28
	 VzCdFvawxCuCfcqPaWZfXB4HxTtMrPZMGuYOf05dKR65W71Aa7i2YE/1BolG53du/e8uw
	 TDZFlT+Mm+ovBP3asd6YJ3Z6XunorfnkcYDTv0wZDz5M5qudg8WPa2oFZ1R0mWOhvUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SpABV9aKqp6smud8Wfu98a7VX6J5hPF06e5DetAJnC8=;
	b=VjAke48wOASDeYOrQXaGWA2yEo8azUOZFx6ADDys0nXiQnuZLs4aX7MjQ2AR0Dru2WRm
	 yXRo50vHRboU+DOKPrb4/fMrU6F8+wmkuFXCPW7iWwLIsgSOwyRa2GSmGnyzG8PJHU6v4
	 iapzEgZQvJBuAds7lYfD4v7ldogb6zee0W675TDy0Des+gj1bop3HuXY/nUC/mSBjR6UH
	 RRy1BNZOU1X0H96TwIeVSQp6InoKWXjZBveJd6is8t0vFFoX5TXcsZdxRCYbb2JvEmeik
	 d1SeR9ktQ3SSX6VbTwQchrq3Zl8mDR5UOup6TnOHJy+m8i6r/yBkfPnzvw4Wb7i2GYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kiTuZlf5;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FB1606A68E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05FB1606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kiTuZlf5
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso49235995e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795496484; x=1796101284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpABV9aKqp6smud8Wfu98a7VX6J5hPF06e5DetAJnC8=;
        b=kiTuZlf5E9gkEl0zpKfnaUwlFCPbBI/X8mc9mf/rp6Q+KzKRxRQNm5aoSgmhHF8hyr
         EP0QeMBmCe/gmVUZkPYNIx3ttCLhaiKAFfMRiNZmw4BDSJioK+NhAZvw3hYwq3h3Dqru
         eVmRqxmZ/KoSXO0OWipEOutNvMJmw3sYs9h/2lBeWEfSl2usDxuuLZpBNtkKNWRoNsqF
         1TNqwp27o4ywTLakbf12Gd3XMlp6sKXLvRBBCpvNSEBjoybzHbluCXoxRG7gf0Tb96sQ
         fRGN07sshGxYtYNgdhqJHiCAsAJAnbKoMsytfo8W5f7qEGYO1zDO+qyqpm/CJ0wu8nZE
         ENoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496484; x=1796101284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpABV9aKqp6smud8Wfu98a7VX6J5hPF06e5DetAJnC8=;
        b=CAcQ734051flxj+faBnt6eY9tBYKj58Z3csrtjWlNnYqDqmDt9CJ8xbdQzbcoEndYy
         /6q3HrV1jnrLwrrEV2GxMS6YG3IXVxYWYxjF0a2yyWnxxtiBgwFCfMAoD3jFRVuaNBXa
         deBmGVZNLE6qf4agHO7KYLfETGEflhEJ52Wa0Vwhpsi/xb/XhUQYZR7W25y6ZyvDHE2A
         jgmYIeHWgAY5mUp0DN2WRd8wWmeak2ic4hzo99q+kEWMwSetHQVOk9f7mEzx5x2wJhf2
         VAsVMliFBF6cLr56ep5ZzcXjl2PdnyUassm0glAsFHMaeGedanSqGa4iqbtwcTnMQTgs
         eR+Q==
X-Forwarded-Encrypted: i=1; AL+hErEB2p68RzHmLFQsPs3bWxJLWRKvA6pLkqlg0kWh6YCwjbJRc1hG5K+9KOXuAqgt7C7sURmJUC1J/UdV@vger.kernel.org
X-Gm-Message-State: APuU4Z8H+OkZEJOX4iG07IclZfPMgzLlGki8Hhvm8/B1IIC5QMlJuUwG
	/Ugxofkcke558tMQ0jLKtj8A7DwEq8S79ybv8l/S6suiySbNth1+WWgH
X-Gm-Gg: AZFdTZdVFjAH2Qtsbc+vm4pQ66akGBfBpFVVgV8ivL+e5n0BQtiv1bBPGFkoseGG9EE
	u2FGCarV3SvPH2GO7d7nUudQA/WQA+KuMXFjoM3cJmJNT21zhkkUA4SeqvYlOQImTgkWdD8Hs0o
	B7zy3/Qi6INvur7PGHZCUBuwgYJCxrm1URrGEsB1xIj9qaqFUmdygLQERo4QGimWioL22n0bVO7
	VKpaKrTL3wSxgbUVAR4zJJntyuRsqS2i9zHt9Ue/l50Ha/gsn+7jCjhJ4wQEljsQT7QlJVybqYI
	/4n39UUtlO9NGIzdpeiIo7xZUf5KnQAqMzMEcUPpbPza3fS5U9Md4XI3cy9WZoqoPbhPoDYIth+
	kAkbr9xlbH1uaPgWbz0NiYfyH1VmZY7VqpulBtrz/oW+dBCxji4ODu4TEVF1HFbAftMBkTM1h+R
	/Bp7bv8BjfBGRHfLmeijXWu7+bcXGgR5QtB2L4/RxeUmpgOrXzXYtXlt1+HjhBGhy/4+DVpdHhF
	6hZnWzK28Ym31yvhgtQBlmTi4Zh4zbopxbNJkKOeJVh40opvwMj6uHfnp56oEwdn4Xveqkx9Nkl
	L5jmKmpQO5xs/FlBtn5QPfeyb5M7PYoOFMKFFCbYDpqVJ7k1S/XaTZTglHTeDRmBofu3hPzc1UD
	qLwNwYDveDPacYrFftdeopCNee+OPqJ59thaJehLU2GFp4DPtHOjDDw+EHBIJOG9nQQN8hs81eU
	78+cZB92pxfbo3iE1CaiBzrP2qL1WXeFFSSh5fNVCxC6+HfBAF0DxO
X-Received: by 2002:a05:600c:674f:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb8880fb9bmr266365245e9.23.1795496484431;
        Mon, 23 Nov 2026 21:01:24 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f512-85ee-fdbe-0621.ipv6.o2.cz. [2a00:1028:8388:a84e:f512:85ee:fdbe:621])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm353489155e9.1.2026.11.23.21.01.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:01:23 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] powerpc: dts: turris1x.dts: Use wdi-gpios for the watchdog
Date: Tue, 24 Nov 2026 06:01:18 +0100
Message-ID: <20261124050118.87944-4-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
References: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
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

The watchdog node passes its WDI GPIO in a gpios property, which the
maxim,max63xx binding does not define and the max63xx_wdt driver does
not read. dtbs_check reports it for watchdog@2:

  Unevaluated properties are not allowed ('gpios' was unexpected)

Rename it to wdi-gpios, which the binding defines and the driver reads.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---

Notes:
    Changes in v4:
    - new patch

 arch/powerpc/boot/dts/turris1x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index dff1ea074d9d..494a96a1f78c 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -363,7 +363,7 @@
 				 */
 				compatible = "maxim,max6370";
 				reg = <0x02 0x01>;
-				gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
+				wdi-gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
 			};
 
 			reboot@d {
-- 
2.54.0 (Apple Git-157)

