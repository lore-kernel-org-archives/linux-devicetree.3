Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883983B47F4
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093171; cv=none; b=o8GgZAJmIcTmgTQsVPUJDpJxOCZRbkXohkI37FhCMNvpq8WMcxW2QdfsjINmby8U90zNXoOfd2GmA1VC+bFXe+iBF26rRntY2ENJR56SgtxLTHrP8SQwWQZvm4jSGXNTrdg6dML5FV3yWaHnlYgw+osQe/tUIjQjxP/zhTZk05I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093171; c=relaxed/simple;
	bh=e50auPVBSYp+zh5QQtBYOWikwJBXIX/ory+C1siRYls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzQ5/mQeLodSa4Npfppky0uKotdb9xMx5sFJ78iEexNkZ9olvojMptmq/wWbBptqygvP5/Jy9SYMlM9xAlrCm8tUZspk5JFP6smPkOBH8gHJFS09aW9lSzKVIDduJOtl0++WTwD2syL7FUM7b/mIwYw9NKgPKROnFe0WwM2ivuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qj3rcuYH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qj3rcuYH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c564ed4dso3664845e9.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784093168; x=1784697968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/g7VD1QoXW2WdCPMiJ8z9UXoHJaiBqtkLX+/3dRHoc=;
        b=qj3rcuYHxSEa/FgHXGrxs/F9kOWxWniK4GHJSqXlEhkLOtYAuCYslOB+mfhhFuqK6k
         pR0u7K2rb96hJhapIAH2kJ7TdR931UGkmvVjX8VnbPe60eKTwSUw8XsdHxreq2Tny+O1
         usOO3IzZoI/O3aOOoBjFwM7ZxKF2UUB/kqI01CBtqfaDVGTzi/Hy621XaZz6G73LqfpR
         oPASV0YmNuHEb/3lJlj9CKVvdrvqBShYaVLFqVzcso9LKi06fzRqNMA44TKbBk1cprWp
         Pt19PjQZSSg2yGkymujelxbOwOD2TI7Ev+zCnDIaAhi7dYj+094E/fJPy0AZy0IQSByN
         GyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093168; x=1784697968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/g7VD1QoXW2WdCPMiJ8z9UXoHJaiBqtkLX+/3dRHoc=;
        b=HnS7x2nbTlp39tXdipZJBk5GJZk1BdoufssAqJ6Aj+/ZXCPol6auNdDIPjidvM1qaE
         sqa8Wg+tAcZNMb+YGjqOfgkT4LO54iGp4yTIXn6JqXfx/haTFudfcfNTwcHtb8CGA/7j
         ARVNMi8+IkVnDrMyVwp1rWzdanxxdgRlHKbj9qkqb+MOEwClJlhYxQcwGKs2PGkQjFa3
         fIdds0d77mY+r22XpuswRjinoya2QnfNvvMCAsq4M17xMypVpAWtF7Dq6821rWddNPHo
         0SF1S6XDZOsgtFTREL+Eqgl6I//vW4ac+cjjkM47LyX38Oj8E8SmR1otQnkWzht2nqh/
         770Q==
X-Forwarded-Encrypted: i=1; AHgh+RpaSVYOdoDgi81dtOAmo+aB3nGJbm2ur0wRhbUcE8k4UgfeNTmG6CJLZ/GMtidXTfSDvqOARR8AukAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YygzA5iyfW8NNwM0AeprL2Qj5XmysBrwjxRwJ0nSCqa2RMMSzpG
	I2Q94Ct3Z5BDIvF3YXjPWTD9R/LyzuYocDzZntImtOSj+Uo2e+NXBR7a
X-Gm-Gg: AfdE7cne9BDSGouRflso5hzg/wB/CR3TF6SOdastZDGTsD1taK6enMwoOAJurqeLKGD
	UX/Modpfap+rDZYe5RXMFMUVbZs2RdMHY4kHp7lk2JQeN6AvV/gOwOfJxj2edqNkulc4aUmHN1Y
	kCRv9XD995xC17qP5tueVIlWPkZ90hMBs7qzrwo1xwXjeErt/Xzlj21YBRpQ9rX3mBao332BvPK
	G4y7/gwNjiM2Ho5TlZefdZUs6K7hSJW6pRYBENnhPzXl0rfFa1qi1jii4zHDCxMj+VPz5aytJdN
	4OiIg+s/ao7LcC8U77s8fLWs1hi8vVcQz86NyDEhg8evetNR7laO2fWbDzNvq2FahJ+Doq2zAy1
	9ka8kuSS4QTuX9wTngNKfJq160kjtny8Z3fCupBUZAysePUh1MBFM0jGn66izhB7JUW4ZIKfjnz
	kGd8tkUtj4Wmy/hQvyVggYfNXVdTbMXHZrypB9Dhcrq5+22ZzojMbok6BhMfAidhzJFfbbL0yto
	iuR53JMtBdDKiF7DNeOBsL2GDpyZ0yX
X-Received: by 2002:adf:e19a:0:b0:475:1f75:b7f9 with SMTP id ffacd0b85a97d-47f2da6f920mr11304178f8f.0.1784093167657;
        Tue, 14 Jul 2026 22:26:07 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B883700A9E699EB87FB5BDB.dsl.pool.telekom.hu. [2001:4c4e:1b88:3700:a9e6:99eb:87fb:5bdb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm13003669f8f.27.2026.07.14.22.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:26:06 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [RFC PATCH 0/2] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed, 15 Jul 2026 07:19:37 +0200
Message-ID: <20260715051939.64652-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds audio capture support to the Synopsys DesignWare HDMI
RX driver, which currently handles video only. The controller already
extracts the audio stream embedded in the incoming HDMI signal and can
feed it to an on-SoC I2S interface.

Patch 1 documents #sound-dai-cells in the binding. Patch 2 registers
the generic hdmi-codec as a child device of the controller so that a
simple-audio-card in the device tree can bind the HDMI RX audio DAI.
The audio sample rate is recovered from the ACR N/CTS values together
with the measured TMDS character rate, and a periodic worker keeps the
local audio reference clock locked to the source by nudging it in small
ppm steps to hold the audio FIFO fill level near its target, avoiding
FIFO under/overflow and dropped samples.

Tested on an Orange Pi 5 Plus (RK3588, i2s7_8ch as the capture DAI)
with several HDMI sources: stable capture at 44.1 kHz and 48 kHz,
sample rate switching, long recordings with no drift-related drops, and
live A/V monitoring alongside the existing video capture.

Sent as RFC to ask whether this is the preferred shape for the RX
driver: the hdmi-codec child + DT sound card plumbing follows the
pattern used on the TX side by dw-hdmi. The board-side DT changes
(enabling the I2S interface and adding the sound card) are not part of
this series and would go through the SoC tree separately.

Igor Paunovic (2):
  dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
  media: synopsys: hdmirx: add HDMI audio capture support

 .../bindings/media/snps,dw-hdmi-rx.yaml       |   7 +
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 244 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 3 files changed, 259 insertions(+)

--
2.53.0

