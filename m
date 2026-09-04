Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F448F83B
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519410; cv=none; b=H2ywX5G7+qgU3lSukKOtLOSZZ3x30nXD2Fi8UQ7aIFYAwFLY06ubbiGxCxzl8vJ+BUhJ9SkLFls6xvYd3pZC4nNRWVLNPLMf9ClmFR+hTCqrJdSlcbSBwsdURSrBQTMHdaDHuWsfzRmtUs4pvXkXTe1Y8oMAEy65R2i+rdm/i00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519410; c=relaxed/simple;
	bh=YIHQ8bdlgjCWtdVge+nC3WQMRQ7b+PI2QP9xU/aHDok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQHlRw9U8m//B5uJNDxmhxEWoqAmAFRuKJS7EoF/FduWrtfKj12hyRWp2e5X/tIVcQ5d8cTs0HjhAj/nY43kqmBRR48k5neThwIb3uPuyEwYl1MzlNuOfQVCgWpfo/+WByJd0XameHNYWk+7EbTCbL/C1cKEmt8DALJR9I4CerI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eir1scMd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eir1scMd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b965570d7so9705835e9.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 03:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519406; x=1789124206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofKngm+I/M34aU+twd5ZTUQtVapU3M8PXngwPLd065A=;
        b=eir1scMdyfjpdbHEfP+v7x2Si7kGyhbHvRVE/aQTN/JjCGT9A93C63pxduur9YveGQ
         DUToEOz+5SW16oRqNUaQ3/M11IGnuOeqDMfUW5jt88BalQNCVGWFcIFowt8LEYfVu8Rn
         aH8oM0fh0XKKtk/y+8jynZ7oBQRMVSvM6ekcZRVGwYmpXrm+AkybRv6hgzEUZ+US1znE
         W5mpTG3T0267fbbJ2SgaEhMJD5BDBMlEC4Q5kX4KbSIPmiT7tds8kQzNt3zQuDGEVsbd
         n6V9q/j6ukFmMxL7rvu3/Y/5ftRkyeSW9xiPrkSWnE68+mOi5TYVMm1C2kEIA1ZiYzQf
         fuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519406; x=1789124206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofKngm+I/M34aU+twd5ZTUQtVapU3M8PXngwPLd065A=;
        b=fn+KCiVRaICB9vB+IIFSikzmThCwOciBsWbOSdHetWmjwJZq3rB3v0aHVUkLjtRwOT
         X9uF/+2vag95Tvrih46GM07IPhJoW5g/tjVpeIBnbV3HwJlyhK7sUIyvuEHf3KOq4SQD
         c0XZoSCJkTDBiqMDfA0Ch/nbB6ydPuXYJH1dPOl09Ol0EZ9QhG2dXMGGoqYMgXwZqT4Q
         eiEM/DVDdn27ScRzfgzrttJT0whgJiLAqjtP22r6+oKZHYbzk3Sr3KU6jqoRoDbV2xHB
         NygC1zB2d5e/uQbGRPOae5OiaPy1XxJARO+s31RAegSGHyyrFJem+VXhAoj6LkbSnThw
         6Mpw==
X-Forwarded-Encrypted: i=1; AKwUvByoeRq5221YyI8szSPSMjNz0F/3UztCsmDvVyryJAkm1WkBz3aq8IwFkwakhXVjO4dyjZV/B6mmO1TF@vger.kernel.org
X-Gm-Message-State: AFuF++mYOEa4YM+S0EkU4beQz/1TJZiPv94w2BA9rM43V676p2QqvO0l
	eyirex4G5LXYhTgZCwA+8f1HHeAeS9vzzRe7K2sQMm7Q3FSSW5dvCMzc8TiiB9jH9j8=
X-Gm-Gg: AYBFou0j7cisYWRQHQsHokW4g/Nae2IUchFfZ9LwJgdK2VbmiG+RbbZuAGxY5Nuxe4X
	zVvR8lpJr/H3AIEprTxOJNkCO0D6XJaxi/6J/+pfYrj+1He3lrD7iFJc/x0GkAD8DYYTJBDGHWc
	2kpTLBksqdODV7M0XerFclbo9kXv047jfImbJ0FYSu9qe0sRtkJEhf365lW7WEhVCL8g5xWWTeS
	uMcAKOlwgw58epew72DPZ0ZmikyNk6uilPx1YUWY0uehzSZo+Zz87hnRuHV3mUIfA4ObHx86wKJ
	eGSfNoIvifu1CsoOH/9NBLTnVKfx8zfzkQye9NKDY5zxDBWLmYVFkaULrKCbbrEs+tdd+qMZ3e5
	ad3RPguYfuh9rBoKdlOmLqknRV9lKsr+6cSKqRxjp6Zb3NHUH4RnPs6nPXpa71r5emZq/I+kM8V
	n771tf3LM33/SCVYKbWVbz9T/jumdMdumBo3zATua8bhlJ1MVxpAxJ9G75aeAv1m3RAt8Jf8Qj
X-Received: by 2002:a05:600d:864f:20b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49cfc6e8ed8mr18400195e9.33.1788519406434;
        Fri, 04 Sep 2026 03:56:46 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:45 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:34 +0100
Subject: [PATCH v5 02/13] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-2-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=YIHQ8bdlgjCWtdVge+nC3WQMRQ7b+PI2QP9xU/aHDok=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPlOtXpttnNErtShLSZ5xP+Ea4r+NoviUQf8
 54zxnoQoMuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5QAKCRAicTuzoY3I
 OpAaD/9IXuoeQWQ27TY+20jjKe//oTJboY9pJ1YDiWzZE7fVyiQf4kE8B3jUE3XbhOZdeWCpJd6
 ujq7uLyTMj1P5rQILzAVDaIbb8irEHvZnDhZZanKb8vMCC3q0JBs8Upg6Ny7WBLv0AUGEeCmeJp
 ZuFAqBW/6pTLcTfirlkjNz50n/DHpG6jUgWTO7DNRkhAsMe5Pu0NuRqfVd2KP/FVSE2DO9C/86B
 xH0aPVugONmLfa9XhOqctfFPJ0fPm2mMZMYCOHDtJAWX4BWS2akSCKdIC6jwmNMpkRA2nPgfe8Y
 0NLW92Cg3xWlBC/FYvb7expYra3zVZkGxhOU59Nn1uFtsa1AkYNaGlgRAwoh9vD7t5wgOLnLYKV
 FA2YE/wcsBNsRj4IuGF0eRqKsAqkFK2CfRqMnXQz+XRAGKCpGyJJSlVwDcqNg4DKKEcMPMC5U5C
 cyQTPtRte/64uoUXFReiOc23+FN3OSybMlL75Zue1iG6kziu9Ag1Rtelyo/0sO0QdEeH7o15RcI
 6++eJVfSFy2xADjoJS9IX8yRdHMnAUDsAkofOcy+YgBK1JidvjHDeNiKiNiic+1MSZXZ8kU+DQk
 mfFY8JpcyACBWPO3vHX2zeYlf693cfxDUoRhQtAGSrP2jddg3Mw0mUXAxew80axHGRxlORAYZBG
 EqyArHubt1Vge1w==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The vdd-csiphy supplies power the CSIPHY blocks. CSIPHYs may be
described as standalone phy nodes carrying their own supplies, in which
case the CAMSS node has none. Make the supplies optional; existing DTS
remain valid.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 126400772d028..57a838fe2d229 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -186,8 +186,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false

-- 
2.55.0

