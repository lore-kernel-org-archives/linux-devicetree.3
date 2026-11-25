Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578243;
	b=GoaS+38nIf1KLkFNUi2VHTZBLCm/0fISo2v9eiyZvWNOfN9jBDxCbLsua9j9oW6Z+7RK
	 ZFu6f9vpqLxK8g4p97oGh8qpF7MBzFutkvBm4aXK9dFPo/783vl7Ul2rwGktiSAvj8aL0
	 ka81I/VssftVjsorOZKByRWi0w9qhWV+zHQonM7cuWI6Y2Dm3brvWVCBoMM4DvbyHoKJn
	 JKXCJTwv5UtB8URcwGXnErfA6LAsv2mSqM1FU7djufw5oeMVLD81oWTUgbD07dTjJABk4
	 KxsGjrSwXC8hjfWaBWEU/HQmRcu6kO4b7mJwBXoBHqqqPrfeqx/SDJfjt73Is+Cgb4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Qj41oco+fV9s3p+rSbInvqyHiLCYdw0nt/lz84zuf3M=;
	b=NDmNFbMwZyI50kN2tBGjcbpXaCsQ1RU1YJJNw3ZSchd56Xs20BvEnf1tdVXe8nKCHmdW
	 62y3YMCoubAjcna3l7wqI8UB3bmwShL9FL1yI0l/qTPiY3WawsmaMWs6Jtozn/Y3bdzIy
	 X99szM89OAg1feZ8hAUygvyENPH6VZRPz9uAoQYLGXfvCPnBzW6q5u1ko64fXQCWwPgVx
	 cRF300kYPTz5U/o0G41Cva5YM2UzJwAHjl5dslbVW96iPeWdfVfIVMV39d6JCyPrtKCjn
	 cExsoeh5iThRQC0IVdIqlP0JTSYC9HRQSUAceE0oCjVPVEUBAPoNYhtkFwlENpxj7cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xpr89P2u;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB61606A334
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB61606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xpr89P2u
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so46113385e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578241; x=1796183041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qj41oco+fV9s3p+rSbInvqyHiLCYdw0nt/lz84zuf3M=;
        b=xpr89P2uVdNEVRU6ZFdn2eBT/t60OkWc0tfbtiVYSzLsut2olIQ8iMmMG03Qu8AXhV
         czmwY8klQILCpnQxdFXqLNpFHHOS3Fz70w915u6j1DQXaPm0RounccIivcFGNkTf7AUu
         Nq+70UK9MfiygohK2bEE6CLN+4jPinKxmEeKqfwkKmoHDDzWt0yNUPXMaIXugfvdARTl
         hp4EfLLqSIbgqR46C0zYggsGERYvEiVipCsnV5Pu0km4Qm/IUdXE9XNzt6Nv3V2YkFQR
         /QVF3UdadDR4/OB3HYNvw6ycaxZMdJnVuqLL/wTu56z1P7BgeqaDw9Eho8qpcwOOcKw7
         MHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578241; x=1796183041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qj41oco+fV9s3p+rSbInvqyHiLCYdw0nt/lz84zuf3M=;
        b=CWOFM61eYihZxgw9+5UwyeGPAkAqxbWvyc0ifJ2Jf4+TggA4YLUhIkC7PHZxi3HC7l
         fMJt7k5xbxqVQ7JAJQkhPVLsahPmxRs14o3YpI5TnwDHCDliFqJxDeZONKIKaLeJNhPG
         aEx3JutJqee/2g/OdpyevsalFy4604icDM11SjQBctgUdHJ6uoot9BU8gGIIF8o1WdPS
         0U75hrKqg5oHaCLiozjkjT683C1fDJ0hWRjdj89Kj4qUXSyaAeSocBCJhvsZZ+d2lFM8
         t4qy1qzehdSrtOnh7U5p5R2PvpftwEJM+umOF25ucqr8gXzgEUuKPJh4CJQida91HXrV
         Z+CQ==
X-Forwarded-Encrypted: i=1; AL+hErEFYbYaRDUfYCNxMJNukdtVAE6xbNpSn546PTjqAxVMgU2LQKm77Uq/jPtazdROcbeOhgcQN9yGGhTi@vger.kernel.org
X-Gm-Message-State: APuU4Z/Jy8+bG07qsz2dS9+PAHP2aqT2alF/DCte025tp10JOO90xmqu
	N2zpiG1NG1A5j5vjYra/xc3zQFr4s/ZsQ4FuXEgYiBp1Gh9iB190vef1
X-Gm-Gg: AZFdTZdjZ6869L+kNpuF0SdzEJ0qGtPwNTPmU2ieUVt8Z47X8xL5R1HrM2yDVcszCHm
	tc5CRRMHgDkwk05ZjZOwAGE3wMTzTC6+MMQiPZxXNcBLFqIQEek/lVS/9Vez8cZSwGe3WocWDXd
	RZzgdCgFarHmCYWBJ5r7wtd6KiIzCWtsRBvdFMnxmu5KeAfTVBKCkKD2TBF+dg+vQaiLK42sIzw
	xQCxXqNRj35kLex4VEVW+OoZW/wYzgfCJT3lqp+U/m6sOgnwxNYtu6TTSMZK5X6e6Vrtn8NlEm1
	8RhjSqa082ZqeRbCJgREHjT00x8LsLDfzrdZWMZHQ41MbFucVPBGcWWiGY/Pw6oUzYN3tnz/vdB
	MDNhcWx92mIeGiDC2HXctlRIivK3bdZdEu0X71j3Nfj4GUtPGBUwDg0x5DHqSeAQ2d3/olLhlJ4
	LNQ49MVDldFmDZrxZfRqbovrgA3N9wbxBB8A446QBMb/5OxUjXYxlICHbJFoMUC5uWDwqvjrmtX
	moaQ/rhr3Ap5MfhFwekOJOo2ibJDEFiW2QucDh2HpcooNq1DT4GxyJXl0dqOeSZCR2EUjRIH6w+
	bqHfAJXy/RRpVlL5PIWBuHMajsioB3qQU73pzPS7TDUcoeTrGvw1ECs2/2ob
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr321134335e9.12.1795578241263;
        Tue, 24 Nov 2026 19:44:01 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:02 +0000
Subject: [PATCH v3 06/14] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
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
Message-Id: <20261125-halliday-dts-v3-6-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1066;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LnBBJKb9fDjzFgKcPxLWG+G1ECrWNheGC13yLk2PP7U=;
 b=AK3HsTIHMWrfVz7oshpUweVMA1RMXUBxsZdz2vUtNRXnyYZuhyvlqRD0igQTo19XNPCP3yBIj
 lrBLDzvfhh3Dy0LccQPBEZwfCNYpwtXoUv7VnuZeXacHd0nFK00aqKC
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0

