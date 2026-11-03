Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713873;
	b=YSHc7MRKYZfpCXV/GdUtIpSpYYVT0qOJ4NgRYgHB/nz8EBICa1C9GBZlvpEKL5DdaRq/
	 Lh9MN8B6tc/cWtw9aBEY9olVR0VlaCV0Xd8k8LVeMbxJwm+ZYLajkQacXHdSrCdsYDhoC
	 phBhCcR0b9DTSO/cc4inZsT4fII3Cv5jF2k1RvW69YEfYEkbXo29kIIB3LDzfrpHik0il
	 5X+eMIGwXNWjs1DsVa6IOXzWm870DvWOEvky0Qk6+lVG5WLerIqmtbmMxDgG2qzQAZjWl
	 FCKGXDWFoVtVIpwIWTLFD4L4m/aJa9G73NKYFe6gP4kFzH5uAe4De9og/qrwvn5n2kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
	b=jtOYA50SXhRv81Su66RBvvtZ5ZzSHxPtSpWZXYrt1YJo7rp5rp8r9njXCApBxwIqPda3
	 qaF7cU5sli70+gWyhC3PUr0K1N3danO5MzG5FHE6RlA6oUDPO3JT0avOtc8IusJrMO3WH
	 B2TwM2r1+Jd7FMUIYego51RShJtyyAdvU0gjr638iqfkGW2TYVnvb+hLIgc/LeHSgUpC+
	 CWjlIjt2AAovkJ7Hp9Za5Y/OrhATQ5bZE9CKnH7cHqe30K4JYaN5d3wZj+N8QswHJ68CT
	 WqAlhExyO1HfIDZ80GFW8vW1plI9Qi+uyLJcyP2hYrLgXQTtQpt5phWF4BqM2xdifvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublNyEuV;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE786083629
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 13:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE786083629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublNyEuV
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so5270256c88.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713873; x=1794318673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
        b=ublNyEuVZhEs1i6z93JX/R8YewpZyMQAk3YlLFwfuXYBFSs4sfkWLWIfpH7P/AJNuS
         5qixV2Ch2exi433cUqhwtamsH5RTjKKU5h+UnV5JwGoMz+/z5255XiDa4N8V1E1e5/5m
         xIef+CIO+jQgdVmK4fVDAbtkxiq0uhCruvAI43NOs9cjwT12hiRlo91JCbLIKW80eVtA
         AT2480xZi4B6M19h6dw5RIaZjKogbNOIf3kkerNxRy0JgoNulp0m+f42w0sQV9RigTM6
         LTzwtARR6jVp6JcgqjxdNtoiPMyOT/xT5JoPXvxsPpU9wQ//lqBy9S1SjrH+olHgj9zq
         xKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713873; x=1794318673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
        b=VscjqSJdtco9ej90A3rFwkOZ9TRHiwI9CZ70WbdLsAaHoJtQx/wgcK/19+Ql+LWRNF
         XSO3EWBpYc2xyo6WVc85VJyO1FcfLVzl5xkvbhJwFewHSIwbUU737lWHSsqwPXbgLYx1
         hlvHkAO2gU0kQYGr7d7z/vUDpwJqaUEy67618HMja7Tr6xSVxVLrdgmbVG2noptaxgDD
         ro+cVJgk2mSMEdAcsjL+jvcebaI5y3EMiYeEG41qqTuB/1cPAiVNim9hBZSRP++f5BYi
         ZN03g5KUrNJRN297iT42l/dlv2Oq3DCQOkAkvs31pFM5lZyO3X2aT8JPs3+FEmOzg5eH
         BzCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFPbjp9B+YPc2ncfnky6oUJf1hQEa/JnJbywOdlXvGSNidwtZJ46zs9L3N1SRtp1bsEFvfk8AR9Nzj@vger.kernel.org
X-Gm-Message-State: APuU4Z+nxEt9hNg6WklOR7D8EJbNpAj1xvKbKh0PU5Dm+qRLdjrscx7n
	lz0f608KwUhVWigTTSiqPAOqUvCmAQ4O9LNKMqCFkx9FfnG6xePv+afL
X-Gm-Gg: AYBFou3r42BpGaV/IXdIJxqWeE5W6lKopVthdLoY+bnLmiKSZeQSrk65jY8Z6OPIcAL
	FR7FjHGr57Zgub5fXHqwYyOnQFsEmqND8JWtBblMmbWqPd9cf7DpnXPDk6k3k2OUwOTnOHiy2q9
	hWsODVyasCVlXuHY+kJFlz2nsjCWt/GR7GPpCuK11kHgOZk9lytHQFML1dg3leW2e9oqoDzBS/t
	hCJhry4/jyuiF88T+A7QnkJ5stAsw/rTKI/JzHI1Yw5W+d7YiLAiaLynzw+N3opJpNHL42g7rKI
	gV3HrWZhsBHAtBCvCXVEU+WpkIqNSMM8foCbzzmt4Hvfc4Wc/gHKEi6mwaF6GXXSfjTdtifzMU2
	HNAPzaOOCrQFNZoRhdEF1r1FkOKBdZpSp0/p2P6NEw6qV+SKrHPM/fd3ugvmT8S7892qIcjP9F/
	1fwIJN+R+fSw2u7uRVPWBZmM4pnlPBqOF3rKVS+81HuU91o5bzEKpkxE0+NcpYDDTNbKvJzU8hm
	yPXpGGUThQcPZ0OYCxdMhrB9yvtZCZnr+uAZ1ijf2Y2qMPeT6ZA0e+BVTdYE0pzffCWi+efoGr9
	fuG2bs/LD4CccjqyYRIkboJmbTQ5j4DFL461ftMlSjoi
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr24655310c88.27.1793713872384;
        Tue, 03 Nov 2026 05:51:12 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm42837321c88.5.2026.11.03.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:11 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 22:50:57 +0900
Message-ID: <20261103135057.1682-4-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Make the USB controller a mode switch as well, so that it
moves to the UTMI clock first and keeps its USB 2.0 port working.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
The "mode-switch" property of usb_dp_qmpphy comes with patch 3 of
Balaji Kalkonda's Kaanapali DisplayPort series:
https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..a06d5d867488 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
-- 
2.43.0

