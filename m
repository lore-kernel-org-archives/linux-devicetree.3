Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737626;
	b=g5C0yt7SlkfwgqjIOf+hRLNNcLciMrQ1IL0x5vwwZAt93Gysw6/a6ZqHiVlqfEv85Q5Q
	 BpUjH8CErQNXfqADkMBB/doH3UJF1uoWLVL5beC/HRDUYS2vGVpE8q41NSx6V7rONaD3W
	 9NUfJ9p1s+hobP5sZqR5CjOrmquR+r9mKX9FLZmbqkrpbSzKah9Toh+suAzKIPvnuyZ0h
	 ocE4WfWtf6PnjbpRvvCgqLitrsX/KEmrIUj14tsH5+ntBP9NEBECd4AZN3dVQh50PMNdA
	 w3q5UBDSeHSKBdKYuTJOWZepj66JmWLeEaXvAWL3u3ZCVEz70hSQ5EzuYylcOf/8MVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
	b=Q4ZgLkNxiiZN0AXKqUHNh0rjesTfUGRMZaO0+tbr3Rx/qLJImPvwNafXDUSLTup3CoXL
	 IHaX069FGkgjHyLHJRuiHWv01WpVfUn8rLIbh84MXkLWjOAIV9SHnrofHEuT8sFfzHNl2
	 vUmEyM+K67kgxi2xnmO6AO8SA7Ifc/oNxLJIMR3sRuZzwPAChrUYkF5REj8IH4IR1nNdf
	 EdJ9b4aq+sMXhwRv7rAs0A8VqRT4Eq1Pe5WulRXxRQlTQ4RhulIiMo1Jh5YCiFN8Jkb/a
	 SmdWdlP2VqI5Wnk6jU1whSHxjsVh2g0i46jkRoHVyfjifp7xcilYH8HEgm6c4sUDmrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFvP+We7;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5060A3830
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A5060A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFvP+We7
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so255109f8f.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737624; x=1793342424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
        b=nFvP+We7XiupT2noLK/fzdphPCutvS5h9ja53Rm7jDjlMjuga21PPGPfl3QjU/ECb7
         vJXjzgQQeHxBnTcpUCcDz9Mkzk1J149NiWxkGB4xjLLXKDnJufFFaCU+5G3nko0GgXB0
         p4oO49kFqiWVFd2j4tcut2GOmsdVA4DYdJYWI0HSTZX2HY1wTTai3F7dSrdaqCV3ZQ7R
         sxqKvZlsc7pcylJJ4PVh82aybrbqrD4CanpDTI8g79zfZb0x4tUAx9b9dY8phosjMRNf
         zP7C1OdO/tgqr/6IKB5+tnOqKqj13NexQpJdHS14JPGE4cAzw6Y1th+arl9wwks5uVeg
         Gc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737624; x=1793342424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
        b=ZW2z3xZ7bpqQjBVs/878kTXk0A2VQJBjtAnkRiIQ72y9Lp6Io/fjZpL1/M0FZACrNy
         h5YDzkX6G9cCAD1plvo8gh8OlIJI0q46ernRqQ9lM9qjiKQoRGmHQniUcoevdE/FBsZR
         PdwOT8kGKCL6OmxznE+hn9ocGPsWVFO3ZBBMW++Tq0CIA9YLMclpkW0E2kSQjSkJ081O
         LviznxbC+mwlK9qC0a1MVJxwMxnABAzhQUBEcm7c529ZsJ4Ie63y26gFTMcnBEmKSIWG
         nqK/ff1gufCN6QKSmkxgyKZiYp0NYkArJPOzpL2OTlp5juOm7sW0m+QMN9B4eKmpioRI
         84lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMfaHLVc/7BIDXPFrjmLGDR+/vFavS4y2g/vQ/BPakfmZ2NNVWRrus6xyu/n5fDz4rWEs0DgB/qOVN@vger.kernel.org
X-Gm-Message-State: AFq9FYIKxR5QQJLdpjFPiZyEgbXJ8Y+3/GSYwhjQTYGGzRFfNl0oY5pb
	VElaU0uQQ3VO8QW6qWp1ajFMhllFH6AzWhb/KkGBiS23MPQ9bCtu7+5M
X-Gm-Gg: AYBFou0eS8F0Cnx8DCV86pIXkjkYcGPVdhYthOG3D8gphfoGsblCgRDx2NTzqJ9IJol
	zme4/OwYjSb+sGETnZQcDzbKqPfoeD33B2Gi0YNqSzpIcXUBsBoZcWeX0IV+q3u/ggqJoGNXhqY
	cugp+CCeQsg73/UeCMF9HehHXZcXMucEUMOlgXTOYiwaeblTj+GuWBPoGZ//xFIDaWx5LSM054p
	+cO5/gtJ+jTgl1MCu40jHMcpFyRD4InvehdsNA1CNKI0c3+Lq4594j36JJmYNbfhBv5zM6o5tsP
	3jyv1Jhl4gIAmaSFZjUi7ku2ncbrD+NzoLyv5HXdYcHJSQoiWu9NXBHCxOLwJT0xGS1jeewnnfz
	GF85rmA7+S8T5MgYPKd4FhCdyWM/piJoGWvVRQSgEn1RvZjauYyMMdDp+PEtGCjNKgxxznVJFN6
	XVsJaQtHHILSEBRpuuFKJm51fFUxePMsuonY51HStjKOQswHyvc38fzf14wgpN1tAE8V16zKmcI
	3Gs8lhLpfjfKL/4m4zmDuGq08PnqWpXhQo9m59PPCXvtBxFWb/nN1iEZc7fOX/c5PJiD9zEcj2m
	K4kGXbI49K71T2AcMnHOJqN/bfvNnu2sVtu6IUR/mJtDxxFSiDGQaEbI8zmEc88CzrwmN+EEFAJ
	LBwuwFn9/lFPL9rxp9+lVNqpx
X-Received: by 2002:a05:6000:4910:b0:48e:1c2:55a1 with SMTP id ffacd0b85a97d-48e385c0867mr1563144f8f.52.1792737623908;
        Thu, 22 Oct 2026 23:40:23 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:23 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:40 +0200
Subject: [PATCH v3 15/16] arm64: dts: ti: k3-j722s: Add second submailbox
 to the C7x cores
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-15-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

For firmware that uses something other than RPMsg for communication with
the Linux kernel.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index a59c3648d805..611220ff2655 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -86,6 +86,11 @@ mbox_c7x_0: mbox-c7x-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_c7x_0_client: mbox-c7x-0-client {
+		ti,mbox-rx = <3 0 0>;
+		ti,mbox-tx = <2 0 0>;
+	};
 };
 
 &mailbox0_cluster3 {
@@ -100,6 +105,11 @@ mbox_c7x_1: mbox-c7x-1 {
 		ti,mbox-rx = <2 0 0>;
 		ti,mbox-tx = <3 0 0>;
 	};
+
+	mbox_c7x_1_client: mbox-c7x-1-client {
+		ti,mbox-rx = <5 0 0>;
+		ti,mbox-tx = <4 0 0>;
+	};
 };
 
 /* Timers are used by Remoteproc firmware */
@@ -152,14 +162,16 @@ &main_r5fss0_core0 {
 };
 
 &c7x_0 {
-	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
+	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>,
+		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
 	status = "okay";
 };
 
 &c7x_1 {
-	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
+	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>,
+		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
 	memory-region = <&c7x_1_dma_memory_region>,
 			<&c7x_1_memory_region>;
 	status = "okay";

-- 
2.54.0

