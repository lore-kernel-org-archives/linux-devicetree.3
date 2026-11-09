Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184452;
	b=j92VwlAegASdFm0nF94imT5HHYlXgEBoIz+vDzEUL9J5ZLqYto+tS5yeKkInRPMsPcUB
	 GpYFeUoYEboyn5K6IqxUlPfBLZov++uB2b3VpLkZnx0M+hH+RB6efjkuchDRaS/eZkVW8
	 an5n1u/+LH1GTM2Jsr9lbvZvhoCB89GFlHv4cb70v3i7BiXuYBl0HWatz55F+hDxWrQ6u
	 C8imc+td6uLlSvoLsH6v9CQJgWQwC14vopexydtMMCJ39tZVeE1/+R71dJBNpERPFL4f/
	 igdeP184b7TbfRTV8oUksC7Iq97c0Hx7MVTXt97HYijyAgxOcFvpdZpM9o04RHufxtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
	b=fI+lsN21I8Qi9FCnzRZt68fD+TrsOt3TY7xzUSmVoZMAc7CPpSvMxKshANNARXhx0dW/
	 xBPW+gJCnfC7RndPjOpCngpGb0rtBLY5+zCbep4s8A7MkMuWVLolnwzF3fu5rDFTnIBKH
	 NSaxmeRWE+hgKJuqQ8LVZhyxbAxxIuPjX5FyyyAWLUZa3xq8uxBHBOJ+ZHo/Er0EhhGhn
	 KGE1RbHIxmLSkb2gP4GF9uSzs2HQ6M9x9wIs60QcazvP0vlia9nB4Iz3IiATApD0AW1Du
	 Qzz74epcvSW2KC9uo3sf7Zhb+EIC/4WouNqwr8MaiHX9mpjc0JS5L8syytdKNe5Rhqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULEuYnxb;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386AF606EE85
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386AF606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULEuYnxb
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so187534f8f.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184439; x=1794789239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=ULEuYnxb9uEPYMVwaCZFAhBSr3XRRf7x47G6eugQCaMON9WlvKKlg8odFviJChKVQz
         L5ivnacejg1JFvAECb3CXO3G4CGlkXkRUf5nvRqM76uVba7f3AbCgFEyfN//93jXlobk
         RRpUD1wxP334PPruCEBCm7XnO4U67yem2Q++cYePF+tA6Ll3cXA7KHUYpVW7bHGXPv3W
         01KWH5s+I/rChWyEAC4I/nugfLSJhWg9sy7NvKigj0oOHHQWEH6RZ1gw31QBj3pWz3YO
         YoqU83BPVVunbYylhg8fGTfC+v6UuQYbRsQ69PfH+mnbpLdKnjMRZknNIjNiF3iaLp2o
         JADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184439; x=1794789239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=OS1iB+xuJGWW4OkKSqhL/Y/NBuPnflFt1u5qnXl7qsgqKbcLJOQjD+Rs9rzIOpyJX5
         9lLTLwIBiTKHTTEGzKCQ9p+DyiMUvX+8lvt5ekoIVZcDSp+ofPK0sxjTR7/FTUxwg9AI
         qJrs9nWg86/BejPZ9ctbkccoxBHPk2UWjA3Nq7IMH6WT+V01cNVDKdGFWbtlYOp4Hfg/
         /jEOwgMzDksWweRn/nDw+ga4CKoHsKLYrs5769cPUeTVF6Pg+1FDKxWpZsiF8zWB+F6n
         QLPbXC4P2wl/eVVklAy4XXCUkd+7eEh+gXKGeBcbP1/fqHWZU+I5BEH+bEtdhMxrkwOr
         UWQA==
X-Forwarded-Encrypted: i=1; AL+hErFWOI7nDxV817sNM6VUYTmoK0+0yKQOImSt3ILuYs5rSWTCiwVCA5Kh2M0s7bb8q4cZiPdlsARBOdut@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Zx9pegbYuU8wK9KJOqFrU0WnDBCLIOjsMo0vPqkGlj0mqOdw
	bM377TAmdytHZF0aTkKhskeRdkI7p6UupfxSeb6vcoaIO5b93dA1A8jB
X-Gm-Gg: AYBFou2K7sYYls3koHWLRKLjy5XjVB/oHsiwdCGGZiqd8UTsp7oeT5d49xHSPDoKEkQ
	Xj0Bo7J3NOp2az7BSKATrBpbLMhXzqmdYI8aQKoXyVL7nTSzwCHGHc8PC5VDaN5zhqyBQ2HY6QJ
	iiCgxMBjlEK/3sghyitMG3CAB4DESg5theqEZN7zgkl09mIKjDTSMKWb8VG3jVM2SVTpHUi5G70
	cZ1kXyLjwngXccmm2oZGMz1nT18UtpsZbj+e0iopb8iGGmyIiSUJ+lySg6ZD6IYitHk880kF+IV
	4kPHq29mBZdfIL426FNKfPEDyIkOeuI9rf+lvawVwwzRqDPkrOUflvwuDdeNuXbsnjaJ1HYs5Zb
	dUFVLWNMvqJAwmrqJBnai98zu53aoQT0Ff6G41ahOFPaagP+UP35Qo8V3hm0LeO94WW8GcsG5FP
	X+NhsDSFjqjyYyryNEuDWf7Ptn47OP32sBwSfq8onj5KOPOhy/lDlWCFSq2GoqXrKzbyQilr+yy
	tVsZtkyRjqXr4/eVzZbyGLFBkCbXDXzo5eUnFeD7ZAaf04qDuT/BqFy2QrEynTJoP3uprCLflkG
	BALI3+Z/079IoH2kmP7Z88Jepy141mmytOfETuHTHaG1qf3A1CRJKEv816bIJQ==
X-Received: by 2002:a05:6000:3c5:b0:493:2376:81b7 with SMTP id ffacd0b85a97d-49588ecc152mr4851434f8f.27.1794184439552;
        Sun, 08 Nov 2026 16:33:59 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:59 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:19 +0000
Subject: [PATCH 07/17] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
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
Message-Id: <20261109-halliday-dts-v1-7-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=cCyX7eu7E67i1+mb+zFb+/V3MZ2Z8Bvs+BbDvfy8HQI=;
 b=HQwzvS1g9UbQKH8v0/XpwTYPPGyIcJ129Y8yti74NjNwgnbgo8LwZJmaOxKeuHMuvgkZ+EP/2
 IP5h1J7SLhzC0/e/TSquB9CwBZEDq02qBgUbIWpMHDatD8Y+sZaCkxU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..7a8b72d2929d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,halliday-dwc3
           - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
@@ -209,6 +210,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
@@ -570,6 +572,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3

-- 
2.55.0

