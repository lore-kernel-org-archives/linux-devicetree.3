Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1D536A352
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583865; cv=none; b=CnUj30t8TXyt48kcXZSOMEV6zslrzJsYgRn2eu+IQ2twVsy/rMbDMPzJggYBFYAvMQfht+Nr0slNVQTbQrgXgyxeT6maPsS8kpoKhDD8m5PAI3bQZEXZsx0RTB8IKeEisktsKPX8Puji4KC+Rq+5e0IJMfZXOH9oNaxemUBTs8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583865; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FicNnas3rlIJPCtfHUnKpBCvZ85Y2qrPhk6WUlfjCQZylA4gFx5DgsdMKfvwCEeMWtequvnDulU3WURhRl7DcrMQUX4RqvX7fec90L3/Rdr64tUcEet7yDbGjVEAASRR8hjdaJzt6nrG3bEqeC3ExsJMn8tF8wTX702sQkngVto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaTw5697; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaTw5697"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-43bf9548df4so3467309fac.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583861; x=1788188661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=YaTw5697FD1kqvVQXPTNS/kRliBDyW/xsDtkgLaaTJFhU8ZElkqLujkpGFmMvu7XQP
         9ehfpXgmX1gvXGVkfSZRqjI4ePY6LARgs7jWW9Xd6qp33Msji51+ms+DiMkxMh7h3h0R
         2HM1QQDWPdgUWQ8bdFjysXrTILBdItQ+nY8NBD4u90TtpOFLtk3b9gcNwEVu7WVemtpT
         aXo7JGtzzsYr+TLUsbjQrnxtVlUgyhVpflil8DlSUpq5VVZV70nMiSZ76X/7IyYk+yHq
         89Aghdfu67rssaVIH0E4wtSYqE5c6DzqUHXAhjWula2gakdJk1M5jsCtWvWf90F5n2gO
         Vxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583861; x=1788188661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=JthN3hQOZ8TkQ1frnQ38WOXaGZgbLWGcGsK7IUjjgxBA+iqEdGK5p0asPJbjx8WEtz
         dH00dwzCWQgZjglwxEl5NBmlzZIXDKY9Cn1AkVU0W9cbxZPXZuyYyjC0P0VBG0Q9YnZv
         1yVJIf2rIR2dU9xIiUMuwvTPtAmgRout9GFIDVLeAwu6mmEK9DLyLOVyk5sYLDFx2m4P
         slX+hgwHVJeJz5Lybznk7PZvXANt8XxaY7lliOHylroa90KmSLiGXrOfX7KL29515kLq
         oXI4g5sRvxQKQ2bw77nA+tQlNLAWgYV/gVeAgi9lNlc9IdkrkZjRQVYHT0PAK7sAaJG1
         /saw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/bvVJ0bJd1E/XUeTW5gGXjyuhM2SotWWzdArg12abUA6JKyzVJe0upHS0EpJ4GljDZHRq1T9x8KYi@vger.kernel.org
X-Gm-Message-State: AFuF++nJNkjqMsQrEBZnDpD4R7ZxgJlDMCTx38Z7/jckem71AcpTnEHM
	qobxtAa3Wqk98kankhVsXFDx5Ot51LJxY69k6ykyCTU6vLg+D6JYU+3g
X-Gm-Gg: AR+sD11vRP5/N9+ZFvQsuOgC5iJu6QhaLAzsff+qBbOxfHLoS5ttqvXXCUyRiV4rbMY
	fw0+y4NtWg6zYU1iYmXZc+U+vplDC+hnbcDhzNAvKHKlKeTy/3ydRCZOCkYEaefbHmh+5eSPdO8
	UNdJN3uZG0U1OnTeQRTiJrk7iwKV+Sy8r+6nrIyn3DGFHeu9+Q3EL2qNOx+BOftn8WS/RgCuSSq
	RllV17kSUSCh49oPSbZ2zKyoLMMmaSMOwbD4e6QVcUoJREBusofLTRSVxVtuHJ3zCN1wCSNJ3LG
	0NzWOUrMnE7NuUc2J/FD4vqKpoO17EcusvQYzdxGpxTfyibQv+G0dfsN0j4YdUq0tjyf5n5T++i
	/8DIwezEll3Zcsbv2yA3D4nhmtwfu8uRLb4mnlY3DVWPbonM7CsmSvfAEDMptBKMWE5QUEZql+9
	WdTmyCHxZHz5euL9tPC7IBVy968pnlxa/i2YsYAzfOBQ==
X-Received: by 2002:a05:6820:2089:b0:6ae:4ff6:8d99 with SMTP id 006d021491bc7-6b15941e0femr25985466eaf.26.1787583860088;
        Mon, 24 Aug 2026 08:04:20 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:04:19 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v6 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Mon, 24 Aug 2026 15:01:54 +0000
Message-ID: <20260824150156.1310-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

