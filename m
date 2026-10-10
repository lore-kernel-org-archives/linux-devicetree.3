Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497F412BE4
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615215; cv=none; b=YVLEUvUGMrnQBGOu1JV8V8YMrBrZKpFKJGYqaCoctRfvTeIX0dGlX1JxlKaJZomRbLAr+zjqS3glBU2QYwDZONQw7VjvOLyZdtXd3qkgn5bTou96d3Lo2QLE1gseXW0U5kyoOODXaMH3boSrSFBxUeHki0GifMScUfFSsM2vZeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615215; c=relaxed/simple;
	bh=BJbdZ1qjwzTIJ8gWfsXQMP60H9ANekoYJIQma6jacu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQr+mCPzrvHZLtV5Am/AubNZIXSKFrCoBCCxtjLXvyQ62ZH35SMBhrKRvWP1CLSOPYrYIY5n6yi6eJA+Sb7CQRunR96/R8veHh2klpdT0GYupqa8Vq5QLyPxTk94hetyNsOC5js80qJEq1LfKJp7pgEnbaiGn2A+N025Ig89mh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcEB9/ty; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcEB9/ty"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-354ba08cfd1so719933eec.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 23:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615213; x=1792220013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfRbfRDY9eIlz5MV6EtJbnJLniP1KYHIxxFADZtz7ZM=;
        b=GcEB9/tyjEcjKvZmynesAVKPu9gZZisaNeXUyV2VmZUb3bfcP25JzxQ5zHZHPSv8HE
         qPo2GoURn9hgwULYaj8XVj4nj5rZqYmkY/hjXvzZKSQ6uc2grJ4MNrCuKarmETGA5gkL
         hlxOWaC7B8DcWjOP50INEMHy39jAAVOUk7BeFc/dRfuRjBc3j1kyY6Cus+oXv2tmELpJ
         fF/aEuKGE9+Qnx9sVnrO8e1vOuepRIpJz0BzQsmc8fKwTKmUr4NM99BJ48i4EQdcRegN
         sHZxxu0fDC/qvDAHnJIcbORiukLnrdYJmxmJhBsAUHLfytT4kbtBfCTEm2eG302n9mat
         LYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615213; x=1792220013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfRbfRDY9eIlz5MV6EtJbnJLniP1KYHIxxFADZtz7ZM=;
        b=JVb9li1zxTXD1NAmSEHDt4Oi+L8Dlr+eLCwMYs8A2G4gnW9NNxGgaah6jQZedt+vxB
         LIqbXGjUSRRhVH508SsyjwTJQFYRWjjkezkrspD/RAGTWLMDcvCL3wnmB7Yd9BUEMdAx
         /IPXx0Oo5oHd6U4tyRbKEh1Q/n2OUXpb8XTYSH/GR1dIGXHR/4BG4EuSSvo8yIG/NrJq
         IITrtGD3u4n7bQvo8bQPMZmTKFw0YFd+T8LR6Vq9vMdw5hA+dNrQVsWNR/P73ucZ2v0G
         igDbxD2DqAICmvTQzMWTR8zOLJkNXb30Td2B5FHPazHWNKx9PZgnwXhiCJvzT5HRpCfV
         NxCA==
X-Forwarded-Encrypted: i=1; AKwUvBzlSsPRjFQzB9jkdlLnhG8mKiej6S4IiCaJmy0Ljp60583IvUh1ZYojcuif2rt1TB3erHgB37fkmRfn@vger.kernel.org
X-Gm-Message-State: AFq9FYLQw7Y2R07XYATBB+RUjDKMSrDXVXHo5oKnPHWR2aWwuCYjWLTr
	LFLn5rnvzcTqHcTd77MV/QWIftgqR88CC9JGK7ZfjI3xLZd5E/5vgvK3MvfeUA==
X-Gm-Gg: AYBFou2Ip2YNsNh5T+dS0mwwmCHlSmTj5dVmW49ZZVuwmfX1KI6INAJNatMg2iFXXqb
	7U0KZmzVQ9I8S1qspxiJal/CP4jFzsEwzO6wiyLkqwHo2qrqyrGV7OLIth4I6G53LmKONHu7ofu
	zsGPft75pJSHlDPpnl1hgW8BDJ/nwQPYkBUTMvL4U3dtKk5C7f9nQWnJ5qlzvLcA2HmOFr0YN16
	mq1bXQkB9XlI5B3rgK9XAkg08h/7qM+FCgNbSiSoXspVSd/jKRF3E/F5HwdEkEPpdwYIC4YJO/y
	6iBZsNbqLQpj9rDjZ9N7Rd0Ndbzzt1aW+HQS/iq2U/tKNgTSsmtVRN/s98k6fVwbLK9Idxy1YHH
	gc4CpC0WnyzCn1L+s/qjHc+DAER8eggK5M54EaJmVkMZ9te6HG+biSS6+Fg7Kbpq2lKjec+pv+k
	QQiEsku1PINwReXQaDFBKQ0Vwojn2u1v7aZOcYjLgu7b+/bt8H7loEURoRxgqB+eqcrdBYzBZGv
	G6s9mLbkHoxP7TSA3AX9krj+RfQhPYaDiWJfKg=
X-Received: by 2002:a05:7300:8819:b0:351:657e:a426 with SMTP id 5a478bee46e88-3537dc8b4a4mr5992720eec.0.1791615212719;
        Fri, 09 Oct 2026 23:53:32 -0700 (PDT)
Received: from [192.168.100.70] (host-200-61-172-117.iplanisp.com.ar. [200.61.172.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm13009650eec.20.2026.10.09.23.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:53:32 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 10 Oct 2026 03:52:40 -0300
Subject: [PATCH v5 01/10] dt-bindings: adc: add excitation-current-chopping
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-ads126x-v5-1-49e331cb2fed@gmail.com>
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
In-Reply-To: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=BJbdZ1qjwzTIJ8gWfsXQMP60H9ANekoYJIQma6jacu8=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFknHzzdczzM3LlX+XhiUO3R7p/mlaxPPHuO9m5jaH1nf
 Pll+NaNHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRXn5Ghvcvtz5yuOl9cvI3
 Lekz+27/vpa6peoMbxdr5NL7k45++beD4X9awheD4nth8/3tr8cc5DqtwDNfMjpudh/jb70NxeH
 pjqwA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add a generic excitation-current-chopping property. This is a feature
seen frequently in ADCs that are designed to ratiometrically measure
resistive loads, such as RTDs and strain gauges. Enabling this can
reduce any error due to excitation current mismatch by swapping
excitation sources of alternate conversions. This can have side-effects
in timing and filter response, so it is not always desirable to enable
this feature in some applications. Therefore, it is best to make this a
property that can be enabled or disabled in the device tree.

Suggested-by: David Lechner <dlechner@baylibre.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index b673eaa5d072..fe20aa8f1bfc 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -109,6 +109,14 @@ properties:
       sources. The index in the array corresponds to the same index in the
       excitation-channels array.
 
+  excitation-current-chopping:
+    type: boolean
+    description:
+      If set, the excitation current sources are swapped and averaged on every
+      other conversion to reduce current mismatch. This generally comes at the
+      expense of added settling time between conversions, so should be omitted
+      on systems with high-frequency signals or high data rate requirements.
+
   burn-out-current-nanoamp:
     description:
       Burn-out current sources provide current to the channel's input pins for

-- 
2.55.0

