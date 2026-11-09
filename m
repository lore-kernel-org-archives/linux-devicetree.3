Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184481;
	b=YBTPJAIrAokJpTCrzqezQKR8Sc3iCEvdE+dSS4W9tcVtC7t/WJi3eNbtG8tcAZ/qALHa
	 hmWN2ux7PWqJPrcESEZ2mtFJc1RTTO6TQJg4gw8akHcbhaCFQj3hm2G13jbM+n9B1dd3f
	 v4skIQV7NTyJoULEOhO7OulLskoiX2gWXHL67R4gT7oE+TbDOX2RsJvPp4PPwEVzDjFyb
	 lN1yz/5mfueu1Xab12XLb9307n1XIPYlYm0ohwzXNa222o8hB0kdQN2hOz1q+Lixu3ryV
	 tLwxoZkw+yj4dOGVshnsIrn1yOsfl0obr5v21zZeJeuPGboNh7765OSKrqjpf4ovu+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
	b=L/209Iond0v6Ps542Fm2J82TqDFtkfC30saPfCH0nh3u6xY8MLu3yETzOgvC4TestLO+
	 K8rNWA+2s+QEgfRL+0neYDY6GzpSI03bUT8BQsuI/6/lffVw7s5aC/XW46dIEiuw84o8i
	 kmLirQOTQ/w2Jgeaz8SU6/tyz2fM3O9nCJ+GLKdLFR/0T8/gE50ogmsg7zTTn70zmhY3p
	 Ls9CM7HOQdeT3GsUiSoYpm59MESM9NF1oSlbeAlz6YkPv5R05iUF99zdUi4HXoN/L9ys9
	 quJRc5znK1/MKAmZ8f0b1LONkUWIs+Eks6ShQw2Sj0gd9qPho1JZL1Wva1fbqLLaJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVXS0Dfp;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E0606D817
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E22E0606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVXS0Dfp
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491846221ffso227763f8f.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184479; x=1794789279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=IVXS0DfpUIsNMmmlCVLQc/sr3m1dEoc2PxYn9Q1ZBDZgge7WUtw+jdTyqhCup5beuX
         p5UkKtqsdQor407ZN5+sThyv2nEYmcDa0uUa+CnKgMYC7zlI6qui62evwV2DL9VYinBy
         BarYqmMFrc3QEZTIlC8ssJP3XT4AbNHEFJZW9AzKMaUXkbZAhWMFSvOd7SRW3KD8cBll
         drhaytrMXaHy1ToVY72wpbCvSuNZPazRJo4cICaGRiht28G8IVeEueDOvEoNfrZLf8pw
         YGCplgziHwLWFFjwnfizo2aTCI9Yr266yhB2sLiV1K7bPAt2DOuj7ztQV7B0vgLaulZy
         apqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184479; x=1794789279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=dBmFGae17FC4WkWrL/sL0E7ZbokVtzoM034uw3zFUtknjFneRYvx4/tHXTJ16mp1rF
         c/mItFhl6iCtpPdjT9jJG/IRnNSDuQhoi2BfVu6enxGeve+NmtnHVzKLajEZWnau7AGa
         RnN0ojvVSWBov0Il+OQuKq2JfWQa5LOjrnDHq87Rn2q8ZZiPG/A8PqcnEiwNXF129zKm
         ElveOmVYHg64RlSKK67cd0dBOPnnaI3mMNiPxjSV6AibyySkzZgI30q650RFspWF8XUe
         5TttC0aL58jMIAeP2rS9e0TUfjXjUIc6CPm/YLrgJ4dKgz7oeAltoc0adwYXIUq914O4
         2zxw==
X-Forwarded-Encrypted: i=1; AL+hErGcBh9XsusUVViG06B3OpoZksfeQOjX6SNsE084pLjt57SrlnF8aPGA6q7SL3kDD5+1VpcXB1Qfs/VP@vger.kernel.org
X-Gm-Message-State: APuU4Z+eyiG4yTOJh7bfXqk+coJ+7kr1zTfwJkLJsok+pxKzaUOkNu5/
	Z4hUyGfFvtYejR7z9wc9HWUVUBxHG5Dt3ZTfZ1fwBP/4dRts6ZLsEPlW
X-Gm-Gg: AYBFou2wP02A4EWv0CKIxKE5L7GF14szYLJJdH0v4jqd9A56NRUehDsncVlvR53CpBl
	/2g/tQEBFIbGvWemI5LEABC/r5u0sHGS1uzGmyiBsTKZDLOcJPelD2tCDjUElf5QlIcUYSnQTAM
	im7wXoNfbczrEPW/5lW/4HuvpKT9RobU0ehD/IOC3jHpuTZM5GFlplbyKm7rAS8isg67IQRhJqh
	lsuiuOcn+hb8WHHZwlPmTGG34WC99ExajxBhMP2iV54v78f3M0hsYUBtx2l/U+0z4M6wg4pHqKb
	bARamcJtO+C5aSTYe242Vd/URKoAHTxDbTpoPeKnL0DflFAFW1nnlPM+vr+twKcvAg7mS3qTUhQ
	6QGQWshMiguZ3N5RX8EC2S1v+Kr+yJJzaZC85c2oQ3JxTsPOm42MGyx4spwl7svz82P/yM/iX8N
	aMGk/Yds1gXOZoRDIKV76NXr5BSZQnVVVEZlXXmD9c75IevTdRUEIkXZKYQPHSUoDK5mUvtj208
	eppctr1597xbrXYTm4mR5OR9GAm6AMHrDEh2P/kEqrnrSenrxDeELqS8QCxpYyTUms6T7du+6xg
	a2wHR3Oa6a6wmTDJTMyYDiefY082JuMdZfXPZzYQ
X-Received: by 2002:a5d:6f0f:0:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-49586a3c015mr4911501f8f.3.1794184479389;
        Sun, 08 Nov 2026 16:34:39 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:25 +0000
Subject: [PATCH 13/17] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261109-halliday-dts-v1-13-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=Nal1T+ROAiQwIycyxEfKMIQ4y4aGW1L0uJ4HewmCRmGIZfSJuQVD6Fg2qPRcOrHnEpA/WiD2I
 u4aa5TB+J3JDBwhP4O82nlPD61zqIxNlRPMGwQQVcuKGnMJPv1tp6Q6
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

