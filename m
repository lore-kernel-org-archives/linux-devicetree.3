Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605521;
	b=GdfazHyLoRrVQ4skOEARnuELUFX1iBNmCme4PQLZtY2gwzEXQPZDafxcwa8AiBhE6wdx
	 2pbFkn/a2htIc++qSVebconV3+EitUb6CulgaiZs9I7icPNLcoGs7KUGMiw6YEyz3xC1X
	 w4kdMg/zt7LCb0rxnzplb42JtOAOuGpeHVS/keh8P13K8K+tk60pxaenscwJ+fh95mqe7
	 7vfGP0DA81Ytzl/Z7HjoZYXuekySU412b48/ThrCSkcTm5oeCE0Qol0lrXrzjA7dVL5Xm
	 ED8WYB0wLOKU436Nalg1qpGFtVcnYdYupKF3OqxHzY0LIEBXSgDrPcDHQCLyH/c1n0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ha1K352wfyqdFbF8DNVmHU8vhoz9syKvY98S4jY+g6Y=;
	b=gXNdRxlzX7m8Uzy+1qLEg5q9V0jliGnoaTVbtKFmBy2hlXVT+Y6DEFPSTa9pJSBCt4yn
	 yBhc2KeXtHVmAYBoGYE3ty8hsvvTOSWEWOvgyfIACFkNL4iWZ+DunOJl+TbpAdMuq9p78
	 va1F5MVFFGFWOmK9Hh7gG6PMVbs8qgsdMaMzNYPYGKJwjbgTQ2lAcvA1zzMvNkPga0VjS
	 shmZs3Uf5KqiUXxBGbkLCQVVFLorRCBRf/sdHpVE+VuUz3apQE9UpdnvpV8aR18JcfwN3
	 YsU6EHKJxPZkuVE3Oj7/iTJpJBVosAkTRabjmORxF5eENnQj+JeaAGSZVI0X9uLmbhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FT4pwh6g;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B41606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B41606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FT4pwh6g
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98c78660542so654757241.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605519; x=1793210319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ha1K352wfyqdFbF8DNVmHU8vhoz9syKvY98S4jY+g6Y=;
        b=FT4pwh6gpGaIQ6svkDMoqALbka3hBJJwgkHvkiaYv/qNWOGa5DhCoyrhMuH9rgTIJx
         baThPsKkl3f9EaTmvHlonm7bADrrg1Bu3W2cbchx1i9d3oEFPmfwzJxAPDW0ND4ZB3I+
         8DQuQNXHSbB90S/57d7YMWMBAN+tY/0o4x8VIb8yR321706XWUmk8ZQkkApNsaZO8Mxe
         DnMdp053VU2HdjfXWOS8Z1gwoLWH4Z4FVQa+9M1+llC5mYY87rbhsSNrgmcDyFPxLoeC
         +rAxusdHJf0kJ6URDKVvZa/j2/fs3AatLn7za+iZP/Pr5A66JlTmX+NV8duUTeOHKxkG
         a5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605519; x=1793210319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ha1K352wfyqdFbF8DNVmHU8vhoz9syKvY98S4jY+g6Y=;
        b=scNTQzBim5uXK8JC2Sp3fUc981F1pcFjnsXIbIch9e/2ksMKZifhOfy7q+8kpx87SQ
         FmSWaykJCG/LI1JKLjB63fQJF4g92svE8TkZrRgZjHWAI5d2l3dFofNzNbUTj6s3z9GS
         Zudk7415UtSo19qDUTrOX+0SD5Lk6c1zG3ynBbPDdL4p9s1WIBsYv5Zj51Hxbgjjj87+
         2SEL1D1+/MJjIi5tZdroNjHv4w2wOrJqDXGbJDGYWSchW1PqQLYwoxVhJ3uTXY5owdt2
         DzKRkyPtLdto9dMCQ5CQdBZ9M0lGWJJ9yKOQQQ1+aJqlE7ySxvUieoaD67JvIcePDbnr
         55Pw==
X-Forwarded-Encrypted: i=1; AKwUvBx+QF4Z41wOax99+E+tM6j0rZdQccykL+qIZ0w5BrPXmr/SSSZe4QaQdLT6tYRx/6dsbblBqZlWQIJi@vger.kernel.org
X-Gm-Message-State: AFq9FYKci3TGF4Je/npzerP2tLqkqjOWE+A8BTSr0vfz0Ejpm0fZ3lSB
	l75J6ojg/zvyQno6QyWR6m9Yg6P6lvL+Tpw/wXynGZp1JfDqIo1uny2i
X-Gm-Gg: AYBFou07E0eXWzs7LqlScb2CbIvM36s4Tg4sjuqUE7Hb6Pl95Fuxza1BU9NuagsX1SS
	OdOJ5WV1v9JHcwISKmwjEw6K71E8zhgEnINM3a7a4tGuQxkZ8p5Pgi+0fcqDH7RMK3YOsIk6fTb
	+Njh8HbnF60eIXkSqbTslWorLD+lenqSf91XKXIAsW2RntQXRq7iOl/DZQgY45wsG7aT4YV492Q
	czacoKJPpi3j4++BAukKFwyszYPR2y0HzjcXjkTfCI2A8lScK4q/biCn/3oF7vZVUNj/mof8/ho
	konjYc/RVOqFa34B9BUaO3XKlwS9dW8xtv4ijakMxFERGGD5fsAGA57aV/Xnb8xoDG1/hRc3YlL
	D3xuXQJiuCDlTqAuxNHRddLLnfWxeApvhsw2z6qjr4Qp/4uw5bgbz2blS5OIidvK/psmX/zQe6k
	3izV0biulPY4YEu8L93TlkyngIuY1nBrC2QgucmW0C5vOhbFJKGx1uP9ryBcCxBXEH0wqIb+uSL
	1s92j8gMruNvSzNIOISVWGr1AM6kYgRi5YF7QZXKC4kZk/kUpvnse107aeKNMt2K9Lvj2v8Q4nP
	+qSCOaANUtSMvEZPHjul5RrBkXNQdKZ4l0hwzfEo15Ic6L59+O/oTU4BEbWiNK+Xqp7DvSnUmEJ
	/QUbDFRRvDg==
X-Received: by 2002:a05:6102:508f:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7cc9271966dmr1231907137.25.1792605519613;
        Wed, 21 Oct 2026 10:58:39 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae9788c68sm4090944e0c.5.2026.10.21.10.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:58:39 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	ilpo.jarvinen@linux.intel.com,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
Date: Wed, 21 Oct 2026 14:58:22 -0300
Message-ID: <20261021175822.318717-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <414bbb7a-1018-41ac-a580-cd41708c6a78@arm.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <414bbb7a-1018-41ac-a580-cd41708c6a78@arm.com>
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

Hi Andre,

On Wed, 21 Oct 2026, Andre Przywara wrote:

> So if I understand correctly, this compatible is really there for the
> clock gating issue, right? As the DLF part is now somewhat correctly
> auto-detected?

Yes, the compatible is only for the clock issue (SKIP_SET_RATE). The
false DLF detection is handled generically by patch 2.

> Can you share what your termios test looks like? Because I assume this
> affects more Allwinner SoCs (the DLF change definitely does).
> Then we should add more compatible strings here. If there is a simple
> test, I am happy to run this on a bunch of boards, to give you a list.

I reduced the termios test to a small standalone reproducer and retested
it on the A733. While the serial console is continuously transmitting,
this program toggles CLOCAL and restores it:

    #include <fcntl.h>
    #include <stdio.h>
    #include <termios.h>
    #include <unistd.h>

    int main(int argc, char **argv)
    {
            const char *dev = argc > 1 ? argv[1] : "/dev/console";
            struct termios orig, changed;
            int fd = open(dev, O_RDWR | O_NOCTTY | O_NONBLOCK);

            if (fd < 0 || tcgetattr(fd, &orig)) {
                    perror(dev);
                    return 1;
            }

            changed = orig;
            changed.c_cflag ^= CLOCAL;

            if (tcsetattr(fd, TCSANOW, &changed) ||
                tcsetattr(fd, TCSANOW, &orig)) {
                    perror("tcsetattr");
                    return 1;
            }

            return 0;
    }

I compile it with:

    cc -O2 -o clocal-toggle clocal-toggle.c

and run 300 iterations from a shell on the serial console, keeping the
console busy:

    dmesg -n 1
    (while :; do seq 1 1000; done) &
    gen=$!
    i=0
    while [ "$i" -lt 300 ]; do
            ./clocal-toggle || break
            i=$((i + 1))
    done
    kill $gen

CLOCAL doesn't change the framing, so the output should stay a clean
1..1000 sequence. A bad run shows garbage characters and missing lines.

On the A733 I ran this test five times without SKIP_SET_RATE and all
five runs were corrupted. With the A733 compatible selecting
SKIP_SET_RATE, all five were clean.

Running the same test on your other Allwinner boards would be very
useful. I also have a small script that checks the capture, if that
helps.

Thanks,
Vinicius
