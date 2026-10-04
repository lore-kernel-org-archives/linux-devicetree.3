Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5188A418365
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106497; cv=none; b=fROW/MOgN/levy6emLrXkkhKGxjvwLEf8tn7CnkXrt2yXlfCHmeieLJ4QEs1hkQrdaPU6KeK4dfhPLhOrAp5IGXx9dzncsPdL7vf+3SP0MEZiKvtI576OzNY73EReT868ZYX7WE7GS6k4eUlpYWZw2/XFmuYCkaBVFQHf6y5xow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106497; c=relaxed/simple;
	bh=WGiqPu03Hx9bYtodW4R+dJT8EyhvwKq/2ya9h1+2Mt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aY19L7pWt0vN21Ajn2bC64mgCkxm3BcaYecZ+jI1zpvUDv+Hg37bX5lLyCn7naAVW8mCotuObyu0W4lCiA28LJ/1oYocHnOE3GGQyHm4vCueR+2bzeqZWLpUEEJ47r7hYpwqUBoeTOnLCp5B72tx0jtEWW5+cf64d3GoLHUgcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd3XCK01; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd3XCK01"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-86aecf49833so101503b3a.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106492; x=1791711292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMFsAlTkgLQleDkb6BgHggPAQsd5lT/CEjafnTCRCdw=;
        b=nd3XCK01dCMPey50rbwtI+hfsRKQWrAmJLFbL+YCGlh9J4LvT1xLjAefoNbN81Yhjs
         5kyxhh+GS8gOijFjCa1/HyAtWT+fnf6lb7VveTGyTT1CkAsHzmX6fCowEuK1a89BPoaX
         aTA9o3yFwdWTlIttPZZ2XM/IOsSrvYRlVRbO+vcxjXH2rHqhZ2q1sL25f5U+iRyfLtoe
         ZLsyQ/PSy/MS0deM2orWCsuNhJTa1yMDhkzCzOIIpiJoSdcsAzbR2zhj6FABW5XOKmd9
         Mr/gFTSKPMMDd11rHm3V/K37qBZBy0i3xD6BKVuEvUYwwg9/NJUHMrk99sjI/pXdLdI8
         7uVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106492; x=1791711292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMFsAlTkgLQleDkb6BgHggPAQsd5lT/CEjafnTCRCdw=;
        b=VPWwvk/VM6hCo5GQt1BF6OiqdyAMvySTsYFG8b/+/teQAFDYh3wGJx8Y3Dj1x+PKYR
         YhdfkKuwKokzbylqJrz4htqtmLreF9hmJ4tTTI+CWEFUuZ7s/6c29fnRw5+4LWDgBeNa
         5lzgwMZChT2TEU9mjShIaxEKjABGZGvCNulTu4leJq4Be0gcK9c6+fIoGxs3KnZeUK1b
         A8g7gGJQp6pDSXVwD7lze7BoynCGXwHAAMequUvmyX9lSYEV/7vsTkIbRx0DTJ2JNSPX
         knVnkvVmjFeus349eYN6e9cF3h57Gh5cZzFw6exxyd1Z3/03+Dpdh3yf1RO1DXYpuPfb
         gauA==
X-Forwarded-Encrypted: i=1; AKwUvBxJjaOkIqVd5GVFlrLdL76Fpq9uvcu7AB6gef1KILvHrKdKdaMpusTK5c0QY1dpt9/DGkzCkwG0vPxt@vger.kernel.org
X-Gm-Message-State: AFuF++k1MmQTec3mr1f4MWgLDDhz/pLUX8b5xo4NYy3oY6FhBrz8AScV
	JkEm9dWi6nnWRpOEpg+5j9l4UkSPX8wRVd+nTzysKGjZimh6aZHmfR5g
X-Gm-Gg: AYBFou1Ihh8mfhhiOHlJJrp8iFHWnsx2zM0Mtm6+E9z6EDDcpQ5MOrdkaMrqWrsZKQJ
	bpfVv6ecYQ1TdMSHu7mILgQ54D9EjbE/iNy+ghUnx0e4n6d8bTg8Kb5cHjivNKbOdbSq/+8wfuc
	Lhy6mhoxbsdiW7MycGYEcR4aJknsQI8FXAAgebC4MFhI2My2WKhXxbOtTlZi4dNh9R38I+xU9/D
	Vav9yM52Zgd0cmTvFl/bnXQdjKs9ihjs0LeczKOyWXVYx32tgMh2WOMXxjmJnuxY71k7auSxAhF
	aJdtx8llkZ8J/P5jEI1f7f6LlMEeP57FxR/INWY5JfgyCN4sWUIgmJkym6AR/GXOTHoNoZ1UnSN
	1qTNcoXlVzZq6r/8RQAdhPMAZkJ4DquwAedbsnhv3g4kRN0yVN4RoJnKv/6juX13Wx5Wx8HXKwv
	y9L3vAQ1ryoq4tUOv+1izXc5hsjDPrTh4SJyAruJoApgq5cTKY+EcpsHPUe6OYQxcwsJWTKLsRZ
	OI5KosvNHymeg==
X-Received: by 2002:a05:6a00:2d92:b0:882:4cdd:140e with SMTP id d2e1a72fcca58-887fd634a7fmr6960101b3a.15.1791106491984;
        Sun, 04 Oct 2026 02:34:51 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88d62aaf2f8sm620337b3a.10.2026.10.04.02.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:34:51 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] Modify interrupt handling for eUSB2 Phy targets
Date: Sun,  4 Oct 2026 18:34:49 +0900
Message-ID: <20261004093449.74244-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 13, 2026 at 08:10:43PM +0530, Krishna Kurapati wrote:
> Changes pushed on top of usb-next branch. And v8 is only compile tested.

I ran v8 on a Lenovo Legion Tab Y700 Gen 5 (Kaanapali, M31 eUSB2 PHY),
v7.3-rc4 plus board patches. Host mode, wakeup enabled, s2idle:

 - hub with a FS keyboard behind it: no early wakeup in 10 RTC-timed
   cycles, and a key press wakes the system (dm_hs_phy_irq). Without
   the series it woke up right after entering suspend (dp_hs_phy_irq).
 - FS keyboard directly on the port: a key press wakes the system.
 - unplugging the hub during suspend wakes the system.
 - wakeup disabled: no change from before.
 - low speed: not tested, I have no LS device.

Only the m31 and dwc3-qcom parts were exercised; the snps-eusb2 change
was only built.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Legion Tab Y700 Gen 5 (Kaanapali, M31 eUSB2 PHY)
