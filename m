Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738BE36B05F
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774789956; cv=none; b=QnqttA07/I6EQQKtkDsp+X3TwKZQmHnUjppDuwxpElJIOmsc93RrVbtCIf9zbFgqxjMXWgm6OQdwMLjAuGr2ue3KwKXb95UtkXpgUn0zg2OvU0JcdDpsyj/5p47gsCWJZTckHB44b6YGxSX9Vp2y7D7kQ1U0NeZvORa5amI4DuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774789956; c=relaxed/simple;
	bh=LMrqkwZu/ieH+9iFcK6MY5ZjY7001IIPbG2c/91dYX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X13Oy/Jtb0hsYhVltMGzJXVRKqJGFRNmZtp0bbXODJE6ijUNE4Z0oJ6c/8HPu4VsLjs6ObPDh84iOjKEdFCEXhkywlxcXsMKmEJ1Wvuaz4xRWnYSPQFJ1Tb8P6HEP9KZqHRchxt0AQI1IRI8qiDt+TaQFcZKNpgkD5yUlFWxzGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0oHk6nj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0oHk6nj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486b96760easo39680305e9.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 06:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774789954; x=1775394754; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pMp+g178cIoRt7ghKFgZJSeiR1C+eeY47NCArU/8ZAU=;
        b=F0oHk6nj38MTY5bi1H173YZIfs8ofg2GJrIWjhNO2jx1gl3/ulCytAGy+RCWcOP94f
         QheKlO3EwR88Te1XMXhfwg8bIl34eK201ZBFeIsIgsork4MgvS2JpUY8fygqL4HwvP5A
         zD8x3Hlf/mePpRdxXW5kYAR9JQdguwxXnWeIOUSPLPsurAV39SWNB+tmgaSUryLMkb5O
         GIq0rX5QNWSqb3odD6aGgE/590koNwpW54xvXnvHtWcCnmntiIyojCBXyehcpd0YN6dS
         s/20fGNy3/8tgh5WpOKeI3rZRY6Jve4u8oUMBrmYW9loPcd7+jXcDqmvk290Ul8MJclQ
         sieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774789954; x=1775394754;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMp+g178cIoRt7ghKFgZJSeiR1C+eeY47NCArU/8ZAU=;
        b=md9DfNaBv5pSpz0iedrT8vXRlsjutwQwyoapBcDY7/By8w1gj9y18v8rxD9sOLq+WO
         YbI6mRKgsww3jVMCGoiBx8yUg4CY6vaPzqMeIA8N1PvVjYNkUxC07nt0YBIGtIVHdlOJ
         b9cd/XrCCoy+PmnRmDsMMGTBbU6r/Zbl5tlDrbDRUEe8AJdgr+bCKIGcWFf0Coxb+h/w
         COyaoD+ns/pRHnUsWwDXXR7I0bal6AQCaCXInosH7gSkM3U8/JIvdR7T2BpP2IVIh0jZ
         4JpOtZB8QwDLo1ZTZPcnTJ7nGH8dGvJnXjMBWoezCWvqElHw1j8b+FQyfpxoMK1lSM4M
         oM1w==
X-Forwarded-Encrypted: i=1; AJvYcCVrGwRCHrTKtZfo4xHQjO5owUfw9tysGp17oJoi8KoNKBZ+NUi3nN1dceCWD69KvwnF8u6OPohKNGsw@vger.kernel.org
X-Gm-Message-State: AOJu0YyBO0M5qIGbt0yrlouHq0MMGQMg/agHCfvTSo+Jte/uhLgcpmbb
	olvJJhj9yhkKl652HFLVcRpbCD6C/bkp0vVq0suEMLi95ki8Fz8Pah351EoxdR5fRE4=
X-Gm-Gg: ATEYQzzZNAlUJI2OadsBwooff121UdCHBXWWFhX2wv7MF5Ggj/Cor2brfFujRwavh+Z
	LiVZYHfrqxkhWED9efzQzgQzl9xAkx2voQkr0gDxbYKdT+umZyFeRdF9Ezviu/HXNlcJK7NTZ/l
	0mO/wmsJNi/Nj0Dr7PfvUNwMw3ibMdEctm2LexNpOfZTz42rsaPpFxSIziK9ZMAOByccE/j9Crh
	Jn5yKgessNlJzKgJAl53ovZ0AvvWWLMFRsm0ZgosxNTqAD+STfNXj730oqHbrERwj2ET62j4SxV
	/bIU/AjCHPbejvIMTkj3lFBx4s+DDlPUWPcBYeqheLhNUhtBu4dObNA4/ykWvCOVHlNycnvgm4Y
	9XRXgQPJF7UQ1jxoK5uxerDARrsaNM8k9TtoggjLV5Bq5CpRYBIi0fcxTaD6Zxr0R0TWixShqt8
	IW1jWOLWxs8tRmuY1U+kHeVW4OvYPzAn2Wc3NK6zJPluJ9byTtRWcNKD7ozIl9zvim50QZvdPpF
	3m9OTjhZ4+I
X-Received: by 2002:a05:600c:a02:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-48727d59d34mr152817225e9.2.1774789953803;
        Sun, 29 Mar 2026 06:12:33 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b105sm422368815e9.1.2026.03.29.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:12:33 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 29 Mar 2026 14:12:26 +0100
Subject: [PATCH] arm64: dts: qcom: msm8996: fix indentation in sdhc2 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-wip-obbardc-msm8996-whitespace-v1-1-ba3a278f043c@linaro.org>
X-B4-Tracking: v=1; b=H4sIADklyWkC/x3NQQqEMAxA0atI1hPo1KHYuYrMoqapZqGWRlQQ7
 26Z5dv8f4FyEVb4NhcU3kVlXSrerwZoCsvIKLEarLHOtNbjIRnXYQglEs46d947PCbZWHMgxo8
 30VGbEjkDNZILJzn/g/533w+SQF3rcAAAAA==
X-Change-ID: 20260329-wip-obbardc-msm8996-whitespace-490d6c3ffc60
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=860;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=LMrqkwZu/ieH+9iFcK6MY5ZjY7001IIPbG2c/91dYX4=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBpySU8OzchjV+uTceOsXUKj8rGOEiyXOrUjZ+Td
 xJwDfCxaoOJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCacklPAAKCRBjTcTwaHBG
 +DXSD/9WCMjJZDXjZfst3IxBGeibEEIdtAKAMQtSBqbis41DhIWMZ4B1Jp0dEuA6OtLOobVJQS8
 F2sVDlpw44XELRAnwZQc9tWT6JsYEVOBiK8M38mEL+wIjBB2ax9rFXJ5lC2lVmGguvZNcalkmrG
 VbhTBcMmRr0CnVdrSwEDPqYqjML9Sex7d1gUtteQ8BSHxXovriQrn+Ns3UI+0ax+I7hQsNwU3W8
 AfRdYEay8x8vuosZ5NAagjcZAItfqaA1l+bXe1rl+XJ9R81W73kFbzRMbwY0K09fuZKbssinsdE
 YTMiBCe3r2DLtzasF6+AzULHZGPZQ2dKHqAdHQi8Ce+IHGXWIPgMV0MTqtWVrrF6mttYnLa/99F
 J0UOHLeXoNI/d+IbBAS8Ffzo0oqmf/ghoq6HaW0WpANYGOch3OT1zUGBA5QYvmSMZ9QNC/anxip
 5Fgg1VArBJS297vOX6LfWDHUZxViXPgSPLnaC/yschP0J9Ghjbn6wfI2XIKOgjmwt2Aabah7Ue9
 fd4b7C6a7R3d02iPNtG/rRcbTXT50PBAaEnxs+8jcOhNIPmjcB9TDDknNgsLDuHwuhpDionAink
 RU+G+MtiYVJIaB2sIpGKqEk+2yN8ilOE/MmHc8Uq/z/I80alTVOIilU1eh1VgyyzoLTXuwYsnxS
 P8YI2hCiq7zd6Lw==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Drop stray leading whitespace from sdhc2 node.

No functional change.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9d4ce47578fb4..2f67e665996f3 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3255,7 +3255,7 @@ sdhc2: mmc@74a4900 {
 
 			bus-width = <4>;
 			status = "disabled";
-		 };
+		};
 
 		blsp1_dma: dma-controller@7544000 {
 			compatible = "qcom,bam-v1.7.0";

---
base-commit: 54f966f63b379d0c62bb044b7903319776443a4a
change-id: 20260329-wip-obbardc-msm8996-whitespace-490d6c3ffc60

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

