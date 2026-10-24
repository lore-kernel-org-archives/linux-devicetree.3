Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792827212;
	b=sUbFFJ3rzMXMWg2IzMQeIJSbtsh5/A7cnSuWcwcbgV9ZR0jEXC6kY8va1Jk1hDY3ZVm8
	 LCRskR79+ww7dRlaPR00X94yeERBoO0t3jZFpcjhRAJrdjJdCEVNgUHFeJFs3kmkgSY9F
	 cP+cqWTSoVmV6g3BwQY0Kxw922O49SodFzZuW9nYdYtMvnhniwhoEW9cyKt7ig1h9BqmE
	 VLZz+uQNiK3FfcMHKHrBBqoc1ZrA43p7l9Kk2vqsqBotniyayKB3KH0LC91OImrSbpSqv
	 r9WuAqq6peTtQTjIJhl6+uDNcAC1kbncpIsJxY3f8+UTdEaDc0ikncG8rzrHlNMTdow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792827212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EizUEZn6zIBi8G1IeAjstYEBnHs91ety8PPfTu13Tuo=;
	b=3s5nSOwdU+ox+wwhjJNxaLQlMOCcl2Vp3XELGRwAmZmNo6aYLYKvV51kxUfIsbW3C7xr
	 HZf7OIa/N4s2XPCClp4SlN95ifkK19RqyZtERN6OiA9pzYHaldFta27nqKiRH2lS6YgWk
	 9+tchkRAcj66RBSZ9OjBF431+CXLSxj2SvM+SK43IDmC4ItS/WAEFnbyUdJxbpwYREMjj
	 cdoGAAGwc1EKLhXoAjWbG1pjRPnaAMlsSRix/wdkyh6LimGfdDTQYaCbsIi5n7MyfVU43
	 rmn/eJaNcmBGegtg8sr1DfNV2Yw3C6HDe8IJPv11RWD19xN3erv1EJqnLpprMXkiKCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="h/nhEG57";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E3606A326
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 07:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124E3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h/nhEG57
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1397a4855beso91648c88.2
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 00:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792827211; x=1793432011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EizUEZn6zIBi8G1IeAjstYEBnHs91ety8PPfTu13Tuo=;
        b=h/nhEG57h+Lg9OmydDnC/PAhyAF82HN17Hdx+qIDe2YpQQU5kl4a2iiwUz4tzpE67O
         HuMCnjk/TvX5Q+2ITw5ISZfE03NVA9+Te3+g5F5iSELzfkOgpefeB68vPuQliqcp7VLm
         OPOPnYTtexrTe6z87YGKpZmovoPlz3f5G1WDLAZ7hz+76BUlhI8WHS9Qd2qQ1SOK2zL9
         zf3PprR++JukjDdlSh2ugTqPCmfYaxROhxdhvm2/hmYqpgIPpXKtWbfNqPMmGpON2XGb
         Rvdr3ecMyK0ObGDb9DSe15Yezgt5zO7laSJWBU/X2tS6lTdFow+5qAck3ZXeLDxB6jw4
         uAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792827211; x=1793432011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EizUEZn6zIBi8G1IeAjstYEBnHs91ety8PPfTu13Tuo=;
        b=e3iweLVNNZtOw9QQzTn86gprH3XLJz5WJ4kjpCZjbd1ZYT1BbV3Em+zYgeFHn3aYxE
         eImCSCLsNBzLtNat+CawpBLkQTjZxtDvmz4u7PW7RRjNpYSneEMJBI3T4U9mIxRksSSa
         g3OwFFYJrRMJvKjTnHfXuAFwKQsEmqs89DRh8jY9C9hYg8ds7JPkZmA2MCXtwOZDRyg9
         Qow7HyVu7kPiWmDR3lpH0WEJOZYgrUeuznSnTsl4DI7ZqOTFindhS7CovPGEIFCE55f+
         ns8Sm8v5N689iUEGpneFG0issi3UnAar27bW38Xx1hX9S09FxvG+6mxmKcVI4aXMiaMZ
         4ylg==
X-Forwarded-Encrypted: i=1; AKwUvBxREHOckRqJLZeTdXdnrPEh9fILEf3B/s7SGqpPEl0Ftj4XmFA8QtJjMA71Xs+OcyBkj272+9zDYnuU@vger.kernel.org
X-Gm-Message-State: AFq9FYL4u9GswXpEE0XGGrl1rJCqgg0/JUfF9BssMPjFiJgFgXRroJ07
	78Aw2vdKlwsDBLrkgAOqEi39hpqypZvLSDb7B0hcLmYb7+LeS2W0Bhp9
X-Gm-Gg: AYBFou1J1xm4HmKLiec1eiFDs4ddPHDouAaujxztjser8tlC4BQqI8Yl8+KO+NEwEgs
	iRUPt5PiFO5kxPyGveUGAx1YJaDa6kwj51V6l/iTwuG3YzDiUv8F//A0h6ZzArJP/WKJ0tvEENW
	ZSD4Y+sUH+GTQ9jt7nBCuPujy0OnMlMNMFy95B6Gx6EzXaetXebmX165sNnuFrqGHd37eUzsnpZ
	Wpq725TK3w3B0DtLpuAJSRVcTNwECvQ1i3nIdrDF6K+3/RQiEtgGN7PzyJLsBVLdrN94kL9t4L7
	/Pau1u9HkpljM6kfSWJJ5PAPG0MLtJviC80di7yllDVsD1RM3IZ3oCxie9x7+on+Mh/D3j1aJ6g
	QXtJ6kdaL/+8BOfAUXStSsMuQyJT8baG/2iP9i7eMYmapEPkG3UecV0T9u0lnLxDRwyTOUylYZA
	iV1CUs5aWTSUuJ9ocEsZ2SAGjAhsOG0ffPjDObyNVplIJ1CBJaxzvDNsSD6SmjK4OXg/qwWI0YX
	l1pNx+Ex+GzhNQ3zTrGPw9Tjg0iroPbphxYEA/tq+3ZhvAbvJwPoOzTVSJRdUxK9xVdsMU=
X-Received: by 2002:a05:701b:4516:20b0:143:5c2a:e45f with SMTP id a92af1059eb24-1991b1423bdmr2509746c88.0.1792827210988;
        Sat, 24 Oct 2026 00:33:30 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm5402319c88.10.2026.10.24.00.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:33:30 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: kaipeng94@gmail.com
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v5 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Sat, 24 Oct 2026 15:33:24 +0800
Message-ID: <20261024073326.3018902-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023180513.36417-1-kaipeng94@gmail.com>
References: <20261023180513.36417-1-kaipeng94@gmail.com>
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

Hi Kaipeng,

Thanks for v5 and for the detailed notes on the eUSB repeaters and the EC — those are very useful.

Two points from my side.

On the naming: I'm fine with the model string carrying the retail name, i.e.

    model = "Acer Swift Go Pro AI (SFA14-11)";

For the compatible, though, I think we should choose a name that can be found on the hardware or in the firmware itself, and "acer,swift-sfa14-11" does that: it matches the DMI product name (SFA14-11) combined with the family name Acer itself uses on its support site ("Swift SFA14-11"). The archived retail page lists the Chinese product name, but it doesn't show the device configuration or images, and in practice users identify their machine by the name Windows shows (which comes from the DMI) or through Acer's support site. So my suggestion is: model = "Acer Swift Go Pro AI (SFA14-11)", compatible = "acer,swift-sfa14-11". Note this is also the string quoted earlier in this thread, while v5 uses "acer,swift-go-sfa14-11" in both the binding and the DTS — could we align on one?

Second, please add the machine to the QSEECOM allowlist (qcom_scm_qseecom_allowlist) as a separate "firmware: qcom: scm" patch. This device's firmware does not accept keyboard input, so the EFI boot order cannot be configured from the setup UI: without QSEECOM/efivars, the only way to boot Linux is to press F12 and select the entry on every boot. With the allowlist entry, efibootmgr can make Linux the default boot entry. This is the same kind of change other boards carry, e.g. the recent addition by Srinivas [1]. My series has it as a third patch; I'm happy to have it folded into whichever series moves forward.

[1] https://lore.kernel.org/all/20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com/

Best regards,
Jianfeng
