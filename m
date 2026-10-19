Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440422;
	b=yGLbkLtJKeC8AMPl6+fRhO6nPBcnRLSgDLV8J1zX4A39d+DW9ikB+ZB+/MpPIQyajICM
	 fE+kBAGrySQr68IcBf6OMVZvf4qz2lmo0hgk/vtS9YEcZaR3tKYZTBBHXnSSQNy8PVIxl
	 ll+jjkd+eNIqoTowV4XWmetPp6YT6/+5E9JsrmHuL5E2UM0LxFQM1QHfZWdFRxPtucMAw
	 tDXnrlB9+hmuneR/auu9TgJ0rtZDJt5CHR8cGuP+yxjE6ZwWRg/ZkU+8gCNka8p6G3KII
	 GBCpYJ1JKidK31K1pdoOeS1WG6Aignqy11DN/jTMJpD/av6cwTulQhOxnWBd1rPI5ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MQXVI025privUEtANhdwM89LTKKhsWNz40cUmpuugYc=;
	b=O0GNhzPP6YxbQFwexomksm7zhdQVemZNreULTenJHrhPYTmAvffdyZaobSvKQf4iS6x8
	 C4Slrl1FDunse6maTzXIrJgx9Hf6OWgKlMgJ/QY6dsX2NlOCah7R1+YLbhllfUMdDfw8q
	 iQ1n6ymfyLrCM1uenbnKQNeDko8tfxN3jEqGTtxJj8uArNrbYxaNlVaVpzHr9fpalGVWw
	 2dOYrAK/589Dd0e6/osPHRu7dO/l1jhQACl121GFVO2koq/jbRnX0pIU7tu86Hv93tuhF
	 3Kex+E7k5We/ooEsar/pwNmIXYvtW8HVBwdv3/Cbm2PH8ynrbpw/68Eb+2TF6WTd1jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z0mwdAZT;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2261F606A31A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 20:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2261F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z0mwdAZT
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac3b6b2ceso588042e0c.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440421; x=1793045221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQXVI025privUEtANhdwM89LTKKhsWNz40cUmpuugYc=;
        b=Z0mwdAZTrhQsrFAWnmaf4+LGT9x+W+BMs8zyNOThm3icLQe29j1vwCnAgVBH7Mex1m
         qhEbE9zybpU8dNzkTLgY6FEQdhAf7T6SV99GuPvFIKAThCMUA/Sk2n2AQZJeUqVY/R8O
         ou1FNzc8jqXtQvheh6k8uBsZ3znXwiWPjX9GuSi4Dq2l/byJfkt23I2AWc3779v7m+Vc
         0crrNiS4Mn+DD3+6x1PebiNwSl6PpxID41wJ2bUtMuq+GUyyQ/h/lzTN4ey8sjwOS5Nd
         6rN5vyPCrj/wngt1DZN8S99qFLMYh5jQH8MLzJSAqx1Iz9KQZcSNHuBynkL5j711TuSk
         Oq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440421; x=1793045221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQXVI025privUEtANhdwM89LTKKhsWNz40cUmpuugYc=;
        b=kGzJB7+aph/RzP5Q1mTKi2SmlbY7TClxFATZa8B73gOWefeiwzy9Isgk9+o9mQm/4Y
         +0dcEw4mFil06Oj4WW2CKiOSG3+Wl93INDz9/DFoeQuXlCLtjDoC6QL/LrQy3WnjJADG
         ONeg7hIlcQbW5VBy5kAbhIRnsbg0SRn7TXyw6eAFOuiPw5km5utjeanVDLkIpVLhAtkz
         KJfIwHsonWbe7itkQJ3u8rY1RBIH4Q//Opt41+zQSl0Os4womzKeU8/0JPbpCAWiWJlU
         UcQDsakDhKlWWRa2b5fBR3epzNwJzgmy/P9Dv2BbmQRciPB4dVipS/ZfNee3hUzO18uS
         J9hA==
X-Forwarded-Encrypted: i=1; AKwUvBzk2NUWB/Ey0re62zSd9Tszx8e/fRKy+JV8jIRoVeetkgoorMaNprHMgyJQEN02uYY8tSHBOv9j1Pg5@vger.kernel.org
X-Gm-Message-State: AFq9FYLiK0h7ndk/GyUWoJ9lxNzsWkLHsiZ0jcd35/2cW0Lk6EG/J46F
	fDQqeRIYhrA4wSntD5Iwg9ZhnSpVM0BZo52Gd8AEKCgUtHoudwznwNs+
X-Gm-Gg: AYBFou1nrOr0E9T6FB/ul8nB0/7yf2mtRREtu79Dotc+ZXBbojyo5KNcuG5YqNYyajT
	sIqEx15KiIKwYxA0g6/PDHQnZkdBzja6Of8isU/nM9REWmWMlFjsLbiRVLTL1BaQ4qsSsisvt21
	DBxqpWgP0CPq+wkCBkd1tS3f242OjuL7uy+k7i6sUl68WDbq88SaqBZUSHVjr2UWewYUqs8at16
	wiJqRwybJrXNX+iKLDJxUcTMx2Qpo9h//4+Ak0pPXSjiON/JB4G5x/nJqJafbBCOtNc3zn5uHVx
	GfUK8G88O/ETsZjRt67dXNWFV6cjpo14ULh5Yqmih3ajwMLO93Jx4qhUXlyHE6VVw3TwpM4rYnW
	Ur9LjI87nTs0kghwf4VqUDy3voA1kkhAD+pXLEVnTc/7qWbeOEBMbCDAY0+OBfJDqvgUKJ0IPcz
	7ZSzhrupNIRc3C73hNErmdB+YiH4R8x4DqXyLKcC5jstffRiPnUvhVYtx69K/o+gimRR49GShSV
	lYYGKXO4Db6/s2CHrvOV51dzF3rJi32isJ94aWU2A4Ka4J30e675fXHYspVaEOJsgg9kqkdXdTR
	gx6U2/E=
X-Received: by 2002:a05:6122:4004:b0:5ea:7126:38a7 with SMTP id 71dfb90a1353d-5eaaa62c43cmr2437882e0c.13.1792440421005;
        Mon, 19 Oct 2026 13:07:01 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:07:00 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH v2 2/4] serial: 8250_dw: Only accept a contiguous DLF readback
Date: Mon, 19 Oct 2026 17:06:11 -0300
Message-ID: <a79114e72d029732db6764935dde12aa5d497706.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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

dw8250_setup_port() writes all ones to offset 0xc0 and treats any
nonzero readback as the DLF register. DLF is a bit field starting at
bit 0, so a real one reads back as a contiguous 2^n - 1 mask. On some
Allwinner SoCs offset 0xc0 is the RS485 control register instead
(UART_485_CTL in the A733 User Manual), whose implemented bits are not
contiguous. The probe still takes its readback for a DLF of fls(readback)
bits, and every later divisor change writes the fractional divisor into
the RS485 control register.

Only accept a readback of the form 2^n - 1.

The probe itself is unchanged: it still writes all ones to offset 0xc0
and then restores the old value, so this only changes how the readback
is interpreted.

The A733 reads back 0x19f, and Andre Przywara observed 0x9f on the
A523. Without this check the A733 RS485 control register reads 0xb after
boot; with it, the register stays 0 across 300 termios toggle and
restore cycles.

Suggested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 325793f20256..1b0192efe162 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -225,7 +225,11 @@ void dw8250_setup_port(struct uart_port *p)
 	reg = dw8250_readl_ext(p, DW_UART_DLF);
 	dw8250_writel_ext(p, DW_UART_DLF, old_dlf);
 
-	if (reg) {
+	/*
+	 * DLF is a bit field starting at bit 0, so a real one reads back as
+	 * 2^n - 1. Any other value means this offset is something else.
+	 */
+	if (reg && !(reg & (reg + 1))) {
 		pd->dlf_size = fls(reg);
 		p->get_divisor = dw8250_get_divisor;
 		/* Keep a hook the driver has already installed */
