Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036A5392C2C
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135804; cv=none; b=ECZ8xKTVqdjTfD+05Frw0UU8n5pu81VT3Th9X/ndFSONvbJ+nVcip47mC7JyYNm7NJSPSzo2wTO7R+3X1NvxaYh2xEm4WXgh5UEn5MaGz2fPTeB6NtOkXUJtAG8O6VZQTaohBWGR+8IWG8noIDSNxodjJ+2BHO5CKDkB7LPD+vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135804; c=relaxed/simple;
	bh=QzaN/O/VlVMdJSFQy2H+lcyumcLYvF1o8hZeXgqCS2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACbq7gKG7lmnOlA6QkS92qzjJX4mwWLIDu6GaeGNNuc+TCcF02wRQXrQIDwaSGm9bgDao1180Jmofxu+zNiFuwNte0kvPRU/O+Ja5vYb8iCjohuc2PnbHuuQbywa77XskwZ/tQWL3IhLxsu/dCpsI8aXSppcwcNBhw36fFR2mTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msGf+D36; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msGf+D36"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38be5e86918so37340661fa.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135796; x=1779740596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiJgbjum4jxo4zX9VgnCn31yV0goVxaYIj4uyBltCfk=;
        b=msGf+D36QGPX4Ec2wrtXvmY3rm4T1+tihRJeG3wlE/yYqqyXSCjPQS77ARYKcXIbbV
         i7CkYoEiNiyJALRwpb7w8WJ6O9vZU7C+83PckOxLULYd0cx6jSbr+biU4gmz3I7nYAVp
         WV17g3mgMZgBOnK8/4ounC0TLMK4r8tZQlOoc2eph0eQOdSWma2gKIVtiO1QXmnKq48e
         qnL5Mq5U1HaQoRlx6GM7otEUv0vw5xJJSLDNtQ+lnwN8EBDPna5Y98fCoicCtRabN/rS
         vILakx9gd0uX7ZoydRo38+KRKQMWT3yz78nf18wDxtLUmiWl/LAg4RLGEzcam88D2E7q
         1iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135796; x=1779740596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiJgbjum4jxo4zX9VgnCn31yV0goVxaYIj4uyBltCfk=;
        b=Ry2mMjhfhLXwpphLDqwlx1YSw9fCUZtrFI96usWi+eOI2fli98Chd51Iy7Y1eRliI0
         BcaHoAQpOOQCVSC+/gqD9mrPxpnwKeG0JDgPjj/3JO8kEBlDlBDgRNjWCkJk6gfPBJXf
         +VbLchVu7F/5lblqIvhHBsl+hZOoW6Ab7zBBOnOUgb72GZsfGII326zMSBIU5RfVDrTT
         iToWy5MEGaxYkFsRG1QgnZdR5P5TLlXqRCwEQRAmNKgD0/yKXITxX0aNJHIk7CnY40DS
         0k9taznJrs0PQyT/sirC5FIeB/vSh7jZV+rVdacamTLav+zvNps/kWQqwE7SCgYlix7j
         qPcg==
X-Forwarded-Encrypted: i=1; AFNElJ9TmX1ClzpD6tQo1Hily/Wbp9xE4B+xlBUUylczF6wCCdmBv9xFtQJ5mFhPpVsEYItFWaXI1IXdpre/@vger.kernel.org
X-Gm-Message-State: AOJu0YwqsUr7OL07aEBZQBt2P0ZhukU40SVcEQtDzN4svgmfrCdEsqNy
	XMFiSlPx8DZ5HW/gQ1jjr2UUVd8lufOXozgSUY4EMjOZnInggYDHdX59
X-Gm-Gg: Acq92OEQGCCTWYumSXbYH6VXRTFA17reQaGVNRfkKERSujXptgt/dCpf5LNSzjZcXQs
	6nIJknEhMAb+u61CDgmDOLD3SRRXkhe71gMUjQo3LclGH3lZPa9PAchtKPgqKnCKyBLAWXGn+Yg
	/94rUsPdQiJXW6nFCdhaXEQTXzPZ7AWR04bKSd0V7HENj2a2jFCWacMp5J4cLfpJ48Lv7xPq48N
	z0zPDL0B/d6qDn7m1T0O4kYrVrG0t8X71kA71YpP8Jm8dwfZEE9lAWMWe3IGchKTjMNA4w1QWTM
	LzDaXTJ10OV82CSjHYTFpZ9CL0doHTMIcec0DtjTNPos+WC4em18FoTAMprpkLJuX8rjea8XDdz
	hLhM42mi+m8rGUm2crxKuTnAEaNHjoCEeuQPh60l1vi7Zw9T4uRUneCiYJUqU5MxuTzDOjTdUSn
	aOeh6bXTaQSeMOTWd3zbeCN0oSz5kI6KyU44/nLYOG
X-Received: by 2002:a2e:8a95:0:b0:394:635:70b1 with SMTP id 38308e7fff4ca-395619b0b28mr45511291fa.3.1779135795950;
        Mon, 18 May 2026 13:23:15 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.23.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:23:14 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 6/6] MAINTAINERS: add entry for Qualcomm PMI8998 USB Type-C driver
Date: Tue, 19 May 2026 01:22:51 +0500
Message-ID: <f77068e556b6a166ef05f2758d61234a4e1b954b.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry covering the new qcom_pmi8998_typec driver
and its device-tree binding.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d79275c6..d2861fdef012 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22120,6 +22120,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
 F:	drivers/usb/typec/tcpm/qcom/
 
+QUALCOMM PMI8998 USB TYPE-C ROLE-SWITCH DRIVER
+M:	Maxim Furman <taygoth@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
+F:	drivers/usb/typec/qcom_pmi8998_typec.c
+
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
 M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
-- 
2.47.3

