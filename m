Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483599;
	b=ehXlg4pLHHZPAjZpGgF8bwhR19M42zmF/noeNjFThFO1RDIMq6jaK5c/uYBFoeHcFxiN
	 1AAGjlx5o9KEwrAajQbkoE7RpOrho4aezESp7yDOvzCPoOXYXvlXX29dq88hIeEyRGm2l
	 xf1Giw9c73WHBTYUlwn2hM/xxGI1+FUnuQwq6S4HM51ynuDVK1uEvt0aqh1FFKdxCDJL1
	 KNBb1M9CAqzdQxb8ANuovchJ8GHb4jMbjC6WOYgRqxC0JmBrcLxKaAjz3PLK1zadC4VDH
	 0ULNJ0upOiBn05r1gddT9oC/hTszSVqMwZCanICADsZ7yVTD5RpLYyNIig+K6X9Rk+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wvzeSRN1LnFuQrjCW1cXNkgqhbYpZ/s7WcQkRBfJar8=;
	b=dP3kxbTgAZbQlQhndT3u1UlpG/jflZ4tTMEz9pPLjzgvNke9LUiZ+6KeNmL9cxwr7/S8
	 8tC32g5ifNz7pfXUJs8hJBBv5yFLJQC38O78n9voh/3utCe+FGXCEfCTRPeHmB62Yida8
	 BbYKufZQIHLRR+/63tTJYt9hgDnWs7HjDMFBSmPmB7UFQ6UX0gp2DQ1iPaX39vQiQ6ivW
	 nAanX/8FmGqh/3lVsXwLujbFRHcPRyEQhCJN5IxJnAb4s6CUUJOOWgOsV3JGNlfCEcKsa
	 nq9DahBpDktDhowFilgYNdTEmY0zUyS9yKTM+qUf+trrUIL+z3M4k84svC3jsLx70xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6CgA7Xa;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6353C606A32D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6353C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6CgA7Xa
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso6994078eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483599; x=1795088399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wvzeSRN1LnFuQrjCW1cXNkgqhbYpZ/s7WcQkRBfJar8=;
        b=T6CgA7Xa+cVkv2hSHOQWAxxU+GzxdpUpsHUeocnBwjETXvZDphUtdviLfhq77/SV13
         Ph4BpYspEPzgljg7wu8frf+cR6OFDiHwQB7YLoQ35y4iwHMkg+BeGp3e6wHiq8/H+tK1
         9GR+aM1Lwnoyl+CEkrmpqwd4tkG5wl2ygPGz4ppj6jfrJFGiDJthObRp3iSlwwdI6Dct
         OUNFqgfEMshiZAKzhPp7AW45P317r5rbjIFVzYYg/1JbByenrqrAklz+Grdzwqszhh9R
         QKx/9CjeHcz0GXqlzCkFs+oXV7js+yQxjMjweAgjqktHgbjkTwqhX7iuvuZOr7ra8yIK
         /+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483599; x=1795088399;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvzeSRN1LnFuQrjCW1cXNkgqhbYpZ/s7WcQkRBfJar8=;
        b=kSIiJF8J9DVNV1fv/cBvROKeXhlcX9NprpcbaxF32GzLX9tbDUbIb1JTKLUde8XW4L
         fymrWj0Lw0+KbUdghb00jXcrOwQE1yjlHUq+Gc2Q8aryAALGcNN7a0PRXqPrenOOKfXs
         Wk9bnO03643c0wNNHOuNYI8r39VRTrAm9nW8hF/v25cBgOn9tMCP8ALD2CfSHACFsFkH
         GBlVMzDVe5P/3q/avpKWLIZM9OBWYr90GSs+G7GZofwCtxgtPktak/9pQx/u7rVu1H99
         xCaAeXaxJ+STv7uOFpbU2x1camCsfT2vZnObNfgiGoMEW7Fjz19GS4BtKiOn10LWltwA
         yxpw==
X-Forwarded-Encrypted: i=1; AL+hErHBA1OXT14fQlcCI/8BERibtxS2MXd/kq4bwCHx4O1/zgHDxXFh0AAUDy28RYsD00OrxoJUAyVlBC+T@vger.kernel.org
X-Gm-Message-State: APuU4Z88PQsLFJAQ8U0omb9YEJcf+DSE4mXVQ5F3i1TI6WvmLd/TGBZz
	44FtoWp7I697Owdeykctl0HYNkekiNp6jJLhBwCEjFBAAHpWo1oig6I9
X-Gm-Gg: AYBFou0GIDPDlMaZXaWZqQ48FOzxDcxWzp8CFWl0n53LQhzFLV6a5AmLFe+JTD8YNcL
	q4ok0pWVnticJLN00PfCb0iN0orIWqZgiEMnz6C1dcvzJnYueaEouKEjPlIZ3rGgKKoPNX3D4J/
	vBbVnimtWoiJOCS/Cs0YQ+wwlDV2F8Nsv2NZ8zAHcpYysnXqngl86wTUs1yohwh2wWlY36J8L81
	mY8Cderg/m3x61Zs6NpFfYYAM6Wl1Auw0DBM2/yGWHUfgNOCfHRPEKY2Fimfaq+Ty6+V0xQF9sv
	2694Jy9dzPGtiJOufVDAb5q3e1+KgmJDmI4oKf2E943qVFx2h9vRH5tUuaMhH5bTsh9wiKMqx4J
	Rd/3toXiJt4ij8f6SrzIHx1G5VHL6cc7Cj+rhpKNhUY2kVyjx6kFIIf2QksJgSl/p8deC4capw5
	4WieL0fLi1tws1FW0WWQjMmac8BR+ZshSOJBwCCvYYMTk7ghpwAylws+UekHDdhntLowcKTQgGj
	Zfu4Vp/t+iyAfBqyUoXebX/PN0Zvrm9rq3C6dJYdham70d2PinArb5S5eTWidWxF7U1asjmRKa8
	L8iAvWUdC1A9/dEq0NcD6EDIJ+5ReVnt9pUO+zzZ+mZp/k4TajSxQuTNVGbE7yc=
X-Received: by 2002:a05:7301:4902:b0:376:f63a:cb24 with SMTP id 5a478bee46e88-376f63ad124mr4989397eec.3.1794483598526;
        Thu, 12 Nov 2026 03:39:58 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm50308720eec.23.2026.11.12.03.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:39:58 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Thu, 12 Nov 2026 20:39:58 +0900
Message-ID: <20261112113958.166-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-195459@kernel.org>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-3-26rote@gmail.com> <sashiko-outbox-195459@kernel.org>
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

On Tue, 03 Nov 2026 14:35:19 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
[...]
> Should state->mode == TYPEC_STATE_SAFE and TYPEC_STATE_USB be checked
> before inspecting state->alt, and can gating qcom->dp_only on
> !qcom->dp_active miss valid transitions to DP-only mode?

Yes to both.

typec_altmode_set_mux() passes the DP altmode with the safe and USB
states as well. pmic_glink_altmode passes no altmode with the safe
state, so this did not show up in my tests. v3 checks the safe state
first and treats only the modal states with the DP SVID as
DisplayPort.

The USB states from the DisplayPort altmode driver (exit, removal,
configuration back to USB) all follow a safe state, so they now switch
back to the PIPE clock. Always selecting the UTMI clock for C or E also
covers a change from D to C/E without a safe state in between.

v3 also always selects the UTMI clock for pin assignment C or E. It
keeps the UTMI clock on a change from C/E to D/F while DisplayPort is
active. If the PHY switches then, USB 2.0 keeps working and USB 3 waits
until a USB state follows the next safe state. The PIPE clock while the
PHY is in DP-only mode would stop USB, so v3 errs towards the UTMI
clock.

> [Severity: High]
> How does the synchronization between dwc3_qcom_mux_set(), system sleep, and
> runtime PM handle the following cases?
[...]
> Could the clock selection check be performed inside dwc3_qcom_resume() (so
> both system resume and runtime resume apply any pending change before the
> core resumes), with qcom->pipe_clk_lock and qcom->pm_suspended covering the
> full suspend and resume sequences?

Yes, the cases are real. v3 follows the suggestion:

- The mux callback no longer resumes the glue.
- A flag set under the lock at the start of a runtime or system suspend
  and cleared after the core has resumed makes the callback only
  record the state in between (cases 1 and 2). If the suspend fails,
  the flag is cleared and the state applied right away.
- dwc3_qcom_resume() compares the recorded state with the clock
  selected in QSCRATCH and switches before the core resumes (cases 1,
  3 and 4). v3 has no cached clock state any more. A change recorded
  while the core resumes is applied when the flag is cleared.

I kept pm_suspended as it is, because the resume interrupt handler
uses it.

Tested on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali); details are in
the v3 cover. In those tests the mux state came after resume or needed
no clock change, so a recorded change was not applied on resume.

v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
