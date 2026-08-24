Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A242CB00
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583820; cv=none; b=m2u9k5i+RNBoLkZ9Jbm66S2qZADlIIysl0nrrjy1376NG1yuG02IQ1+rJrZcYqkFrxvTWeAoGGteOrSexLQY+1LKiGEM3fs+gn94kqu8gzGyypkVu4v2E+H95j/coqINhCgfmsXQrOAoiVyaHHKUqpE5qMBelx4600jV9oJb9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583820; c=relaxed/simple;
	bh=jKh+XPUoJmr7fIpNbx8/2EaPd/67MsZW4ebNDZ/8MPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBWgy39szuVBKRtnmmMn7rnVxQCkFmQ3U4zdt4lQEqRYUFasGL8m0B23BYd3ePZwamYVDKVKJNXOuzZYspQN+zgcvgU2uDCKUXDmrPmELWSE80xiJjo5q6fC3x9PzPWCtnw3XXvSeFOVIEKWQT8mp8/Ru91cCYJ+zsL/FpNl9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AllZ3pxt; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AllZ3pxt"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb6573bd52so3606316a34.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583817; x=1788188617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=AllZ3pxtD6h27T4HEHXep8mB2/RMKUx6IV559NoJnnklENcXMvKQuvoSjumQG8sPC4
         brIDIlibXMiuCnKDGjWJdbrHSO9Tak3xyCP2I9VHPLHvQuOtOKnoiaTHTFtBVZ+YzJ/z
         ibpilitEFi49VmhtQBke7sCROB2xBwmGgEe0DjDABHWfWZudgwdwF90OdAcOtmvOo/bL
         XJZp+5MbXegAhpUAirb3cHylk9Aa1fIKrz/jdd0mwUFnvsz4NWKc5MmaU3ixhn8bmkp4
         eXJ0qguZpWDs6AFzbspfXzEUbY0iyP6h9XJigpK4W7P73tWcEFOg8oEkQQWB66M9mG8m
         V5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583817; x=1788188617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=noG0qelUHCGTVRfpLDTCEoQwsheAs3MZRmW5bJfi5ywS7tMyIHyX95GjNMCDMlwTDV
         U8ONiFs7ZGbjlrJrdT1AN8X0ucYwqq99/SIBeRQpDsEV8EgN1alKPKJczj5/nOwbmYfF
         x/Emw9c5dzpVXR5z/0Hqyi6TEDCmmxemiFdRDLq4bmghILK/hJB0G7DoswSDUVRooKSQ
         cAZ9bZ2f4ReV60OKFgZjck8foPqJ6u0VTKFHqu8i7mKyd45JK8ShgF+2SUWdRutBAve7
         oamde2yJ5mMFNbT0GKP/t3yFcaIlfG5UQ3PkHA2YrvCOfKgNnlYF1P4b75jEMtFIYBOF
         xmgw==
X-Forwarded-Encrypted: i=1; AHgh+RrWbKVODqo535qgUYleLeixOpZEmyjUjjxT/V6tCGfSgxqyyUSiE6SVguAY46P4o9ssFZLSvjjnvOlw@vger.kernel.org
X-Gm-Message-State: AFuF++lvI5YEjF+VmApo4UzfGiF0BYWkeZArk8xGehFh1sg/BbghXFhZ
	oCj3uVK0pPSNcAcDZDYyz8OsrvYTU1eDYOerNSv94naWl/IiDEbQhMIo
X-Gm-Gg: AR+sD11151UJGCFT2UsaG7C0zJjxBbwkX9EkpzGMUVr+dMIzR6erLfwc6pP/Y+9cHN3
	xoEVpSXgsAhD9H7RjFWmRizhNDsW6T7ZJYEhF1TLAe2NHmg62UKhc9xBOD8QXY4njyrPRCVw2cv
	OHThFTuwT4QGeYshQ0jJf2bZZ9sVgtQzCNnCCkD6OvhhHhQrrSSgaDAPAy6lvLxUm7Nhl2akFO1
	u24Vrw36D+1oim+27EBDmWy95OLORPFKE5Mgc1L31uv5twZbPcq9SJNIPOiG5HYD4HD3y7p56Yt
	aYQAGLGfYf4DfXx1x9yr/iBlJg4ujNIl7hU5KCncYO2khkBkmmei26k+pQW4776GcTF0hVTVdFd
	9fADULAWjGUGMTXq6wilq6ev1gEWT39g0jvtt5Vz+wSrYutNYJdAuR97jBtbOgsYahcbu15/Usb
	U0Pn3p31OjKtriCtkoh8G1AnzlKKhIVXXu0DHt1qRM4KtFRmQi9csHQvFikq2WeAyuEyr9MLbsa
	XGxfkuTTbz/
X-Received: by 2002:a4a:ec4b:0:b0:69d:e4c8:86f6 with SMTP id 006d021491bc7-6b1592b8c96mr26911121eaf.15.1787583817353;
        Mon, 24 Aug 2026 08:03:37 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:03:36 -0700 (PDT)
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
Subject: [PATCH v6 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Mon, 24 Aug 2026 15:01:50 +0000
Message-ID: <20260824150156.1310-8-sreeshankar0910@gmail.com>
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

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

