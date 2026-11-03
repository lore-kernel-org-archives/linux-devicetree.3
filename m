Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713897;
	b=cPB43QTbRHVLjxsPIlZnmdxU2HsPDxrnepBYNFIlQBzYBlAMGDdXdArl/BpKcibNCl1Y
	 qu10PkaAe3gCWr7AJygAFkS3w0yeLj6NhwDUE9g+5dYiyHhrMvehNDwUzZf9OsfEocn8X
	 I38bM75uPPFOD7JDqroQvbwNTnpJc2hxgyl8KgtumSsqleia+kWzpLC1eb+vhztQ3yHvj
	 S0iVcqeKVB+pPI6rUaIrr0EI28cNQ455TlwECXFVJSelaAZ2US1Tj0s4p+Ffe/4+4M+ny
	 ERxVdae/vbdEdXTzYU4mw7LpGmE3HTzjSxPRN4Vjb9hs/yf8Ay+i7Gbl8Irw3vY2dmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
	b=P/Ox+0GOL5apVRNYmUD0yHskTU/G30YetZv0CnqiT22RoWgXx0Mz0qPywwVZFdVswlLC
	 7AF8QM4bBv1lU7Etj54vs2+6+DdFHYxYSE3FuRAUKmk2JI3eHKbSqNeXVHHMkiIAfTcop
	 D/H4H8ritUef5qwrWCR6nGzxpcTyud4rn9EIXTmfXCII9r1zvIBgAN7wmHFd/PtNw/Ulr
	 GsDvqbkeQe29sVMgFjuSeHXMB3MXNwcBE9oKXODuOobp0qUxi0YPIlQoqKCBvM0PZjyX6
	 PyD7Plvk01Od/677WX4s4EkyPAgN3OSvr5U5+90EmJsPBXhPqv7msyFWerq1Etcp7lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIBDzcKJ;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1684606EE83
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 13:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1684606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIBDzcKJ
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1adbf62dd31so4589165c88.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713896; x=1794318696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
        b=mIBDzcKJhns27qPQuV9fTSNMWAJy5I0qPLMthCC9g48zICpI3YpMKO5EHSiKnVe6E+
         uxWymqV4VpgPfeX6fTuM7YjQlwLhf7OellePlZQDhVjzOIkn5zBPbqD0lFRGhVDkVMFw
         BuRy1wjXQa5QNXEphT1gRs/kPWjz9RByIvqB33FtAya1PAw+olxxve762cQvyU2KMm7l
         9f8aLszCmdt6evvxP3UVh5hGoIF+iHWEK43hLl0KmIvzqCKg/vzbhKoyuKcZ6yBSuqFU
         UB0fJ8QgGrvUA537lqglqXCKvHYVqwVnYb6pSZUcNGGmq/Iafdu+fPNjLv9CrG4JOe3s
         60tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713896; x=1794318696;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
        b=HXE87LMSX/TCcdPiPvjE1yFJ/GBRVzIEMo9974KkbB4qFiaViLffsfyzH1zOV1ytgZ
         3H0RqDgIHq0YRB966gPk66hnqsVq6YPADmZt6uP9QYZVwk7tQncnWSrgZpJ7mfUaqCW8
         H7+ykfnmFUlc7YiWtp+wGtjyOlP+9XsxK7YPwgPDr8omi0uCxfa+ZxvzJ2zdxyfDvLCl
         DuglLDTbvD/RJylv3a4ovwBRNbTHGDg6pCyt3oM5EkdctAfYB2fVYhUcJr7Nc1Ipe6MN
         C8Vt6IBY4Ci+HgVWYWHeDJLOltALvlqPzrdTtpe1IedEKT9s1nKcCBb6NReL4o+6L75K
         4FzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdoN+M/mEJanXiOxujBORj1yiSNM5HD9fR2cdA5kwnTr7QRBjMjsw2jpUCK1TlJ3rKx2qJFZNisIGH@vger.kernel.org
X-Gm-Message-State: APuU4Z/nIV9YWZf+Z/dkPSAyuOmX0FBbiBU52KEWAl49SAIz2MBe2pUP
	raa2GmK0JPbXNQckLJK+qDRgWptpf+iXtGPc20NK/uwiG7uQLBeFDc5b
X-Gm-Gg: AYBFou22l33mF+UjFsmTc7gSkXF5aUpHBoNc7rtm08B+9eWhtzYOtFF0TjEwFPfswgK
	B+uRH+DdwfLRBryGef+WeQQ3ODUSdRm9gd+CHw/+1KsWkbShFZWHPY+eIQ2jSdLL6B5BqW7JXzZ
	A0adIQz22Z8EcW4PzW4uzOV5QIbORTt1+wE1Xssg9z1mdUwBo+/T2tclh8eN3ktPxXN1WGQyFF9
	5GUWsroCO/mzqP//8WfOpDjUgdbG8f8iy3lz1Sw21N7ogomqSU2CVxs2cLkq1dM4T7SV+3FM9Yq
	b94QGFtNVZKqD3t01FOUaOi8mKrU+S3vTg5k6eIHI2PxH1xK7a0WVOcqmEbRIP0P8eyz+gP2lbp
	prCEN0uhQxw1VfCPrPuy6kNXfABK033KzOAKdR7Knb90Bg5SNgbm0YH0YQqo9YbGmU2yh+8yY/H
	P6x5ig0+ljI9u/lrZA/boL5D1FlKJ6bC4Sb1mrgyRcajBK3Y3nM70vvTXMzXJ0WV+bpLpVdzp6X
	qVnhtLyxeOa/7NWTckUTkesxBjl5xjeZGiq1bPN+0tHYHrDn0NZtBsWuRPS8qRwfzbi3tYiX6y1
	jTPeQlnpOAClrX+LhydxUq6sZDC3xlyOT4eDqQOy9gnz
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18652995c88.26.1793713895766;
        Tue, 03 Nov 2026 05:51:35 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm41742846c88.23.2026.11.03.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:35 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Joonhoe Kim <26rote@gmail.com>,
	sashiko-bot@kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 22:51:35 +0900
Message-ID: <20261103135135.1977-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-194270@kernel.org>
References: <20261102215121.738-1-26rote@gmail.com> <20261102215121.738-4-26rote@gmail.com> <sashiko-outbox-194270@kernel.org>
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

From: Joonhoe Kim <26rote@gmail.com>

On Mon, 02 Nov 2026 22:15:59 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does adding mode-switch here expose build and probe regressions in
> drivers/usb/dwc3/dwc3-qcom.c depending on CONFIG_TYPEC?
[...]
> [Severity: High]
> Can enabling the mode switch on Kaanapali leave the controller stuck on the
> 19.2 MHz UTMI clock after exiting DisplayPort-only mode (Pin Assignment C or
> E), breaking SuperSpeed USB 3.0?

These two are about patch 2. They match the review of patch 2, and I
answered them in reply to that review:
https://lore.kernel.org/all/sashiko-outbox-194253@kernel.org/

In short, the CONFIG_TYPEC problem is real and is fixed in v2. The
replug order is also a real gap, and v2 switches back from the mux
callback. The in-place D/F and missing safe state cases follow the
PHY, which also keeps DP-only mode while DisplayPort is powered. This
patch itself is unchanged in v2.

> [Severity: Medium]
[...]
> Without mode-switch on usb_dp_qmpphy, fwnode_typec_mux_get() in
> drivers/usb/typec/mux.c will not match the combo PHY, so the USB controller
> will switch to the UTMI clock on DisplayPort pin assignments C and E while
> usb_dp_qmpphy is never notified of the mode change. Should usb_dp_qmpphy also
> have mode-switch here?

No. Balaji Kalkonda's Kaanapali DisplayPort series adds mode-switch to
usb_dp_qmpphy (patch 3 of v3):
https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/

The cover letter lists it as [1]. Adding the property here as well
would conflict with that patch. v2 notes the dependency below the
"---" line of this patch too.

v2: https://lore.kernel.org/all/20261103135057.1682-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
