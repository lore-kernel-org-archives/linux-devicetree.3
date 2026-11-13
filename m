Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581550;
	b=EzH1QZ7NXMGeVfXLTeWj9+p8rMk7Vw8IzSiKzpeWJMZdqck4VbMwuM/3vTS0YFPd1n4s
	 prs7vY1FBnxcXCk/NsWSISUBIaHBJ8PgeU+hkXmgV5BjtrHsl5ErrcMszSkUuRNTDENtC
	 XLA8XvKQ/kSsipi8xKr06TbYLCH/NInr26kB9IJBqFV/2wtitCUaTCcPPZQaGj5AjtXje
	 gKpkGjq38w69Qn6HL6S+CBCtaGqUOkbz3d4y94A3QwtTV2raNxF/buwJCuXf62NYBcHt9
	 CsNmGT2xJ75vD1v16aiZgyIMGaxIyeBOVDsRf/HJXHm/tOYpmjZQqPrbPdYGRGFwLTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
	b=RfVmmsrTQ44MLz4MvxebIUIcU8lbgZfwg56GRF7FSuYkBfEbS+XjcSQgRkZ45Rr0lhtd
	 kk47DaUZomViI7yDqSFoSMME/ZzEa9hThekU87k/27tdXeGMGiRO0/GoJS8Q908MX3M30
	 YK3f5OaHJGsqjK0P4WDBJkrKrCdB9UzNtU2KRdG5cFO+aVtmzongo172J4ERJ9PvhAWnz
	 webfx2Ui8tCi6NTzcbz9Y0+/aC4NkKqxFAcp5DXdmbF+wzLUUEucYLb+f8SJilgckDisu
	 UIi6keOKBVpIPkssDf9INXz+ynqiQWWWrRNR/O04mq9SSyAnf1I+9K2UusBvudWldug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=aFiWn8oQ;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1C606A32E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE1C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=aFiWn8oQ
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5080ef9b31so227981166b.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794581548; x=1795186348; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
        b=aFiWn8oQ/Gdg4T0XFGfb0riUMpESOKfoO+blWZhQoaQ3KXBLpAxYHhpASVfVWlv+eC
         hd5Xkd7VZxaaS34+U6oPmvp7dqvXD7S9GrX8nSgOCXXex+j1laODKF5G2z2+tjJAWGOc
         qAiaOWTXBxR+RiZ+STVemTty5R4xbYnIK613+GcMFWOTO3jj8zBx3R3FaIf529asBtYc
         ImLVfQ5UaMskbedLnsU9Qu9C6whXAOZGo7ji3n8sI3PLB4jq5aXvMhBrJdfvh+uU3Y84
         BPj6BYfSvF26pn2G5W0aZk51yHCVjqsU4upU/LCx7kRUaSn6MnJGVrBdWvyeCH03LQuL
         D13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581548; x=1795186348;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
        b=IwB4eUUN1stQZrZdug4tMa/4ua8uYR9eyScOuMvnThyMZ0GBL/+S7H+LAcM1RZtgKU
         Ht5E67+hTAkz5GFL401gsjZgQl2gq3i4SekwgbBsYmO75IC5uvtEcV6H9Ee9RjRBzAe1
         BHwNOUl76tmWaeFBZJWNr5758kuW/YqW3xsr6H7HOXCfHwkCLSj5TapzFRNJa9LW50OQ
         79CI7NtoutOjaN8+puQYf+OmyP8Pe7F2A72/FFHD584TXcKvbp0/REuggzN5E4fZPMnu
         9U/nvIIM8hInmg3ucvHSeOCmIOnRWWuR9gEUo2c1nM6XgaunRxMQGb66Jzv/rzU34w0y
         5zpg==
X-Forwarded-Encrypted: i=1; AL+hErFwC2PNCOhXgPeF8BJ81SK4Z6Bvdi387kR3CDHZdO3MVS5g/A1uwE9HPT/t5D9EMIbWYsr+wr2bwS2K@vger.kernel.org
X-Gm-Message-State: APuU4Z8vKqtK6W7ZSrWpZ9boJ0qXu/POYw4ImfS/L5jdUT4V3AYNLYyF
	yE4QHPOtSjVfq308bfDickwA8FJKI2QxhA24mYcNKcEhbX5QBIpS3hpk83bpOVwXRVw=
X-Gm-Gg: AYBFou2JXHAYh2+CjDf4b9dctsoJBtz/ne8c3e14LaytTpD0msQ+vvT8WJmXBkG6720
	yXIl2Q7P+jFO+4qzxYJ2jzHtGTud69oKVrbFmbqBqAFKTzkyROOl6dVSQC8UlNBvyMPa12Wsx+C
	uXMzvKk4A5yBibcN0zOcKgdqY7wiYfQjo5uUWB7paCVsnHomBHfw5PaOQ5Mbpjck7OFAPcpg31N
	Mu+RsnhWJzaXu3Kw+BNb99O736s6qyVcH43tbSBHMCQWILzNJ0Bmlyyq7mQLG4vIkdt2P7ZDJ5Y
	ldxPVTSFxFHFakxliGToxNxDVTj7VfRWeEJL4/R8xUMHMcJIHa+d/bfphWh89R8ty7+TmpBiVq5
	fhTiKeU7eLlzocfmmFGhOVOszKkFNP9A+N2oN6NxjmahCyfDy+ze6LM7vHuB0NBmqNXaiZDjGpT
	aY5XBjMnbYoIJkBgBQmgy92ZuJf9tRyUNELpVx03EsYeoYSbBS4/v1uUs6OSU7kUaBqDTjES7OT
	3OdEfHmZjKo267LomymftBSpnfrgaMufkBfCnrSK7OfR5XqNFSF6LPJzru3qbQKfvnQY0VD6j0G
	a0D8/FB0Z0WYK6ipsxLlhdKm5sTkQKVTTuuPOdzbC2dss54U7zUDG0ea61o03QBF9mrrbIEGzm7
	BzM9w2tc=
X-Received: by 2002:a17:906:f59f:b0:c3f:c856:fb7a with SMTP id a640c23a62f3a-c509610fe94mr243168766b.3.1794581547988;
        Fri, 13 Nov 2026 06:52:27 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40831sm112988566b.42.2026.11.13.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:27 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 15:52:23 +0100
Subject: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Enable Iris
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
Message-Id: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2kkYDBi5imHR1qmOCQU7xZAQ7
 m4Vli95/78VlJOwQmdWSPwRlTEWoJMB/7TxwSj3wlBXdUtEZwxTi5JE0YXmcrWhIm4Iij4lDrL
 8r279zjq7F/v82x9G4vdcGnnXwFll9OMwSO5M5CXj0SHot+0LWuOClZ0AAAA=
X-Change-ID: 20261113-fp6-iris-bf579af01e51
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794581547; l=900;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=eOYybVYmm/vaSHdcDuworLmH2a8ysNCRIzxyd+Wv6Bk=;
 b=Oakb4yTV8EJe4CaVf0hGwMlwSdxXutNjtX2IXg+EVnvMzeZGSXydLJ2z4lMzaqf3VkYczrgNv
 kEoaXwbIYsXB/26LegEkRQcsr03nJhNjnMVCkPp4psMIYflweIFUM0L
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the firmware-name and enable Iris so that hardware-accelerated
video decoding & encoding works.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 5c4581410a40..e46db1b794cc 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -768,6 +768,12 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/milos/fairphone/fp6/vpu20_2v.mbn";
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };

---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20261113-fp6-iris-bf579af01e51

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

