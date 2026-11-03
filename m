Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713891;
	b=xiChx/Vjp807YpC5NSSAFydQRTEVdtNtOe3qA94G2rUKusFjhpFUK8GLuFsjBEeha4o3
	 KWXTQWzKNA1NNXu0Uecw7PURS9Y0yd/dSI0NK+bLuVDOjUEDRLDVvDGslkATvqwasXB1v
	 jEK2LY9wkb8r3UzsUHGLVFXB5gvkOXxmBrIzgJXtknCJdW6G26udjHBvAFJiaX20snDjr
	 +RMl2ieMIEwn5p1+tNSf9rN3pOM17WARZX68sQSE5pdHH3033OdDMQW1m0lYOY0Ro2A/G
	 zhLrl+V1W1UvrWbg7yNLXN1Uk4QFdIy84JZ/msCnMvNBNam4BegvFn9U5gDyRo5f9uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jHC5kGjbwQHUmw1E/Aen0JCdyqsz5/FnNe71zqbNXLQ=;
	b=zsl88obZAvoNh0oWGtfK+7VVhb/aDQFQmYqLWWzIHIAbTzsS7wFrpWZXaWnZBLbjKegg
	 0Xphe5gQxtnJNAolDQwYQP1B3V0T3WbgABEeJLm7gTROap8Kxr/lLU0PYasr8bVzYx41J
	 tuNFMG3J+se6CxXJHffIyMMT/gd7yKCnKxX4cgh8PmPUz8KaHYbnX1tQ3srBF1r+Cyfgw
	 5jhhuqNMTPmE84P9bviI5y6Fc7ZQm1zzyYQFms2yJXzDELxfHg+PzfwdZ/S0WdaiM8z5v
	 zGkRdxqZFEX+LrR8rCFhRMBBk9OU/js8wNSF1DCYfbbbJn8cowF/GzX7TherQnqBssA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zm1negIp;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6808B606EE83
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 13:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6808B606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zm1negIp
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so7096299c88.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713891; x=1794318691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHC5kGjbwQHUmw1E/Aen0JCdyqsz5/FnNe71zqbNXLQ=;
        b=Zm1negIpQGDf/Ln/oU0zxpMkFAiyc55LkNran22vq5iS8FGwzt+aUAi5HmvgVY250U
         oZpDOdVnHTtmrpXe3JchHhhO7HzcV5PkL1NLfw5aR5JwNY0LcuR5sq43I4s3kaygnYlt
         GF2CNVoTXD/oKjrgDvnfRFpcZdeOFfUNYNm8Iu/BWHxhC9l3ITxsdZ0sBf2X6qq1cHy3
         WGqi4C75gUCaqrFz468LBpulgmQo7qvVdEbSH23zu0SHESRVoIX8ICYhW3UWFnJR3Lc6
         tiCEREx/nBeZGdqcV6BGUrJI6RL7k1szrItQeonIRO2cUhBDYo0Un7mSVsrYzNvh5AyK
         zMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713891; x=1794318691;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHC5kGjbwQHUmw1E/Aen0JCdyqsz5/FnNe71zqbNXLQ=;
        b=BcrGRskphNaQeURynmaVa6ou9zxBZJ3t+tljHAnmJWYkqYWlz+V/Mde3dfGiGSQBcd
         MU7HYvl3jbJlPOFDKwpucEebefLDZItFM/l/ZpbVTThZJDKmbx3hU/9xmW9rocYuVAZ3
         7aE2xHDsrUs/3G/0CjlEIMY9eotckS2QLGRztFQ/oIYY3O+Zy52Pu6ZIawRg0rV5sjQO
         PI0VlBu9tbYo+wxhCsolIFOTPRnI2qivn89pMANkd66wn0bW8blFAN63LRxkNc9neiVW
         elu5fW8vFVDqgvoliYvyF1rzs5aLwMoorYOKPqAzlil/1zaK3uuPFdNl0Ujr6pboisx9
         KPSg==
X-Forwarded-Encrypted: i=1; AKwUvBz6Q4HWdBCnSJDxIoYy1hxLu9lNB4+dreeRhs7CFb76xrzGzA/gP2MYdt9g8tsiU5KczhpGQl1u19KY@vger.kernel.org
X-Gm-Message-State: APuU4Z/fAaePCVWno3VtHiyFe9z/a5wiE1p5hKD0MEsoeXZOEWXacuJh
	HFTB0eQVU7f9SsyC2Yiiqe36nGfb8ESpk/znGwZ4YRXR6jywRvj3Afpq
X-Gm-Gg: AYBFou0yU8lSph8iiUAqs3VbEtKIm47zqI4qHBBnVp8nILb8b7xuAN2eeXrzESkzms7
	40YrFuCftsr8ucClXCR8DXQ0gV2NHCU01Rvo1LKzommTT8k2xE1Z1h9zPWYmaOwIMSLqETirbKy
	uMO17pcRxgqtoWMZHJtq2IoP6BKcsI+Ao9upTnabM+zTYosUPOmfRKRdmcBbfSIMCV7z3Hc2z55
	IuA21xJgLTo63O4WDMah29+lQEEvO8+C2/Fb+tz/usATFfh9v9iu+jlt9iWiVagO1bZdDzrrJpU
	fTvZTEwJw+naWunO8GrEFxJSjTrTVrYPhk/NI1Ct/DAhidzBbshqTp92TgfRy0GOdXU+hEVcBwY
	LSLH8ATxK2QytubxR7BAE49Kb6rvpacxyiQW4dakYlgs8f5xw0mufyUsqhOLwcx4TVwicu/nRpq
	Lq7dcc2HbcSXGY6bQcCDvvS8AASimmLwGvVb9jebzCs54NQWy9386zQNO5dXxH5wubtZ1CT3ETL
	Q2I4mWSk7VHMRdPEFTaCzqtEWSd5CQGIqjKMGyUub2twNk9i4DuDES1QMQiEcHL04YkZPRvnWFq
	ij9lVxnLi+eM3CdZN0ggrJmpnJKyaiPUXr7OYxYR3IjKvA==
X-Received: by 2002:a05:7023:d0b:b0:191:ac4:55a7 with SMTP id a92af1059eb24-1ac5b024d1emr20755825c88.23.1793713890250;
        Tue, 03 Nov 2026 05:51:30 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm39536340c88.3.2026.11.03.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:29 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Joonhoe Kim <26rote@gmail.com>,
	sashiko-bot@kernel.org,
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
Subject: Re: [PATCH 2/3] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Tue,  3 Nov 2026 22:51:29 +0900
Message-ID: <20261103135129.1961-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-194253@kernel.org>
References: <20261102215121.738-1-26rote@gmail.com> <20261102215121.738-3-26rote@gmail.com> <sashiko-outbox-194253@kernel.org>
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

On Mon, 02 Nov 2026 22:08:43 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Can the controller get stuck on the UTMI clock after leaving a
> DisplayPort-only mode?
[...]
> 1. dwc3_qcom_set_role_notifier(USB_ROLE_HOST) runs while qcom->dp_only is
>    still true, so dwc3_qcom_update_pipe_clk() does nothing and
>    qcom->current_role becomes USB_ROLE_HOST.
> 2. dwc3_qcom_mux_set() runs next and sets qcom->dp_only = false (for
>    TYPEC_STATE_USB or TYPEC_DP_STATE_D), then returns early because
>    !qcom->dp_only is true.

This is partly right.

The replug case is a real gap. On the Lenovo Y700 Gen 5 (TB323FU,
Kaanapali), the USB mux state has always arrived before the role
change. But nothing guarantees that order.

In v2, dwc3_qcom_mux_set() switches back to the PIPE clock itself.
It does so when a USB state arrives after the safe state. Once
DisplayPort is powered off, the PHY leaves DP-only mode in the same
typec_mux_set() call. So the switch no longer waits for a role change.
If DisplayPort is still powered then, the PHY delays the switch but
the controller does not. v2 does not cover that case.

The other cases do not leave the controller behind the PHY.
qmp_combo_typec_mux_set() does not leave DP-only mode while the DP PHY
is powered ("DP PHY is still in use, delaying switch"). This covers an
in-place change from C/E to D/F. It also covers a USB state without a
safe state before it. In both cases the PIPE clock stays stopped, so
the UTMI clock is the right choice.

Your question made me find the opposite problem, though. After an
in-place change from C/E to D/F, this version clears dp_only. The next
role change then selects the PIPE clock while the PHY is still in
DP-only mode. v2 keeps dp_only unchanged while DisplayPort is active,
as the PHY does.

> [Severity: High]
> What happens here when CONFIG_USB_DWC3_QCOM=y and CONFIG_TYPEC=m, or when
> CONFIG_TYPEC=n?

Right, thanks. The arm64 defconfig has exactly USB_DWC3_QCOM=y and
TYPEC=m, so the vmlinux link fails. With TYPEC=n, the stub returns
-EOPNOTSUPP and the probe fails.

v2 adds "depends on TYPEC || TYPEC=n" to USB_DWC3_QCOM, as
PHY_QCOM_QMP_COMBO has. It also skips the mux registration when
CONFIG_TYPEC is disabled.

With this dependency, the arm64 defconfig builds the glue as a module.
If that is not wanted, the mux part could go behind its own Kconfig
option instead.

v2: https://lore.kernel.org/all/20261103135057.1682-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
