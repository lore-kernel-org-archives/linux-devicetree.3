Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184454;
	b=SrNke0GvZVaapSfUTBhhzhbg7jY/NjLAR/odcN8sP+Xd0OAPJtzv33bRajtIdLuQYcxK
	 CAIPRZNqKTr8F7Cnhixn7gD8ovpz8RJiWbiT83d3bBAVm2nf8lWE5VqGXGL2pUvCVwUJb
	 6IarTR8Xs70MeO2p8uZPgoJBLPLxhC9Cj7IcnQHoNv3U1qZouacRx5C7yg5F3IJTaN5R9
	 58rrXnGOFOvpuq1SdMki0OBzsyjLW/fO1dWcWvGLQkHRUUb8R5mL6PETlPoS4c7qFjUHr
	 sxNDaR39w7HQpuLcqYCmq19AUn3sQT8tD+AJx+6WvQK7MEe0s5v8bXWuQ3mnrPWeAaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
	b=byDS4MO/K83gws2ZTrbM35lFgmHP54PE9YCUgCx3KOCJanDuwGRipH/2fvfkrDI2Dilu
	 4hqiK/WJNehtuDmkhga7O/YWY5vPanxhj3zQ+mgCRgd95Rk8PkgAEeoKbcqcPHlUNZR80
	 AQdTDQ2udSehNud+7QjhFQ+IUq8Ed+hoR3BCOXVVSwJt1nYkXpgfr/WdM3xNKIGacDTdY
	 TVWS5Pbx2xo5VMselRUWleAZ0T8HoFaqXMAmJwdLwQsPBwUmMdg49Hs5cGZZnoe1JVpAr
	 SCqO+SbWj5UcV4f94AbyCN/mP8KQyBjW22KQsqK5vvkULroYmnVlIHWmZXMFT4zVLhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umF6j5At;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367C0606EE8D
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 367C0606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umF6j5At
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e4831c028so390425f8f.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184453; x=1794789253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=umF6j5AttmWrzMlF/KQZyI0KXH1YwvPaczptCwrQT345yLijjcx6iSsqOlX5KCD1Mk
         81IVQcYSQByved1oLZtfvz31EEtFJl8JdhoQ65nRSPU0kQDnBOItbKbX1fUEejMPZy6p
         METpa5VGRkb7v9AxKCwn06Ti2a+76f2PAO1fYp6OK7f3YoHRXXgMtR6eIOyl0wZr1XR+
         Q+Q0b8evofiGdpmVDTQLjHcuU3ANrLntmTVs+p4/Be+4Iw0IjImFcnD8OEhWh+sz8qV3
         VCshHfU3qUyeCBVw7vIdWPRJVTwUI9OA/sBzhqc3Q3wO+TOkhOJYlKm5WwJwlbBly7NM
         zXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184453; x=1794789253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=dXTvBy9vbLEguUcwHAOTZeKGw+6s/981/lk8Fco9ohvfslFZRdKaOW7FP8P/bf2fQh
         Jbkfn/9UeC+HJ64jnIyrKuL1JELuV8270o7VyHFFFw1vooBWFSDtSXAZpWQeXjc9DIQJ
         MS8gDUjb5VTxiBj5+q1AeO2x8D6vKCSrf9VD2H49olOTptGH2rKaOIu9YQoohydIAlxm
         W+K9HdgK0Hz9HaqlddXMO88mx0fZboFYH46GmZ+HiJDgNRVMaXvCfguLT0zzka9TFaOO
         dH9gxono1F5MMnuRRXXJjHPEtoz0lCptIQJrhoqx38GadSHiphsyA44x6XYYUZtaPIFk
         tLQQ==
X-Forwarded-Encrypted: i=1; AL+hErEA4TH+cdlPE+fKvBv6UzJ798qj6NI/05ZG3JVaMTsU1gKMTRWDD/FVfsUy8ji+hmqTfc80piD1eReP@vger.kernel.org
X-Gm-Message-State: APuU4Z/AT5sf9PDrOmivEsox0Nc1TjPttbKqDnFi0LrhDQSEYLDGKx18
	I85KGEkdqUsj9m6oJXTQoGUboaUGt0HHsfVMYYVX12G78HyR/YObEaYj
X-Gm-Gg: AYBFou1HW3+b7GYDawDdXJ/eUHLByB0rMm9D/VC1a06RKFpTBajhle4kKC9Jig1BKxw
	qUG8rtG9Ybk0A7e54HJ6BmvC6FboqNziFazx1Ga7ltmz1926p0oHFOJMKFurzcCbhgxcZ54nZxn
	f7syV5C380MeG+W6PBZljufaXRMCMUG5vOTurg/YxSOags0eIU8lfS5iiRQIK1FyxGhUvJS1c75
	ywlTCm5z/YF4YpPrbbhS4npJV0ovUYeCee/GSgx9viOJx/TRFZyHp61Bhvx9IUM6T5pcoGLU1Yk
	vmVujzG/nsXoPbq3ct/rVltXsieKVRG10WJnSzwKEhCkVYYH01Ium1t90RP0+6F0pQETGFufCkB
	YdqqSvobaMJkGV5evhHCSN6sOnAGg2jF2Zy7y7EdJYsW17QoGYpD16/ligvwRMNj6TOEbn7QZCz
	G5bgtWPOfnqTO/d2wxOwejmcjVj5nBbWJWN+cUoy1FFRZkmFrTaipv9hy3IQBbFJyoECmY78jvj
	jgdCKMPhCx/wD6rbusgxTTfw0D4YZpx39TdM3K6k8tbirWW5NcdYXd6+oHJIk3tC/Qg0DdEcRSt
	SAkVx0EabnlRHVB/1jGEPrPMuBX6RtWwzHuKT/jm
X-Received: by 2002:a05:6000:40db:b0:48e:3d2:44b1 with SMTP id ffacd0b85a97d-49585ca3e5dmr5109174f8f.52.1794184452788;
        Sun, 08 Nov 2026 16:34:12 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:11 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:21 +0000
Subject: [PATCH 09/17] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
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
Message-Id: <20261109-halliday-dts-v1-9-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1028;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=e5+pG0dDXEqC2bp77Ez+oDydvwUzWtL2BPwcLeGQJvE=;
 b=iWkySt37dA02PFmmfguFJEKrCwxdhGzWk24XOJRJESzAH3T4aPp1n4WJJawTbnHxhzVp2Ej2x
 6zP4CwoB/ABAxTrRpUZjqAEi2nTiW6DG09fAo8ednu84TwNnmQyJB1n
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the UFS host controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index 3c407426d697..5d1784baddd7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,halliday-ufshc
           - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
@@ -40,6 +41,7 @@ properties:
           - const: qcom,ufshc
       - items:
           - enum:
+              - qcom,halliday-ufshc
               - qcom,milos-ufshc
               - qcom,msm8998-ufshc
               - qcom,qcs8300-ufshc

-- 
2.55.0

