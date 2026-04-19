Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3086B2DCBFC
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 22:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776637951; cv=none; b=k2Q+ddJ4crWD7YLIPQ45tsUtJnC9Y2qIZfkkVTsBHpezCq7u5GNfi0QcBmSWSMcywePg4z4/Bg1Q4NaH6BIRbu0JfEob7/EAB7F8OctsFMuEh9JpHbsxytT3Gp9obmMmEhYA8UpFeBFtfhY1jVj2SrrmJPd9T9s9MZ0uL+6KZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776637951; c=relaxed/simple;
	bh=O7NUV8Pe2RmvQWUsJqHIlQefURCpl02rH1+1ojlP9QE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pSeAQuJrqMPt7oY+LoXgpiyVbEecD/htCOAwEI+O6pb8cHgCNsCZcEuOfNoRoxoKyiVywscM83ctP/V1el4lLV/d2aH6pRnizuxoCfENpKOa9leAOmwMoPwBv0tBCXfDZw5LyDWEVu5P8bBmRAEDGadV4tbph2TWwQgtImxzxRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=T/tt5ccK; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="T/tt5ccK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776637948; x=1776897148;
	bh=RyR+f1EAhSv32vDVp/1bJqSCJenBgZC75f+fh+zlEFs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=T/tt5ccK+EloMuoaUUbueRv73Vl9NSKLQ0+qZfKLAqlvbVEeeXkEWq302FzsmpO3g
	 So4ZAYfRrpjABhS5QY50SGuX2fLCwiKe6n02RFYlrZcD7H9CjoN4xeryThW+OZl09w
	 X7Rpj0b4oOxPIpmhQ8hSEf+ApIj1PKlM/JtuVsf5KdOs0Gl7xpCh9ggM5NJ5w/qlXT
	 MeDuyBQ+prAGEgLyZcIbYk5L4O7mW3c4E2lpJW+3rwHxQDo/qVAIhRKaC197LAHuL0
	 cVFl4Rvli++MxQUDSWKXgzfzYahSqFxU/q2kcGgK4DWsB7+ywMp5GFjWk8N+EK/6ue
	 xUx4FI5ZTghzA==
Date: Sun, 19 Apr 2026 22:32:20 +0000
To: gregkh@linuxfoundation.org, jic23@kernel.org
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: andy@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dlechner@baylibre.com, krzk+dt@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, me@brighamcampbell.com, nuno.sa@analog.com, robh@kernel.org, skhan@linuxfoundation.org, Hardik Phalet <hardik.phalet@gmail.com>, Hardik Phalet <hardik.phalet@pm.me>
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add QST Corporation
Message-ID: <20260420-qmc5883p-driver-v3-1-da1e97088f8b@pm.me>
In-Reply-To: <20260420-qmc5883p-driver-v3-0-da1e97088f8b@pm.me>
References: <20260420-qmc5883p-driver-v3-0-da1e97088f8b@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: e391c6cfe0ebbe4e32b2f4dc70f0430f507aca13
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add the vendor prefix 'qstcorp' for QST Corporation, a manufacturer of
MEMS sensors.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..4ecf438f1a4a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1337,6 +1337,8 @@ patternProperties:
     description: Shenzhen QiShenglong Industrialist Co., Ltd.
   "^qnap,.*":
     description: QNAP Systems, Inc.
+  "^qstcorp,.*":
+    description: QST Corporation
   "^quanta,.*":
     description: Quanta Computer Inc.
   "^radxa,.*":

--=20
2.53.0

