Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA711E5724
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106818; cv=none; b=ixFAdcA3ipjbD2m7RZLfYfByMnlics5Q8R7hRoJwG/Uqem1jGkoIldgpAEFZv2E5hpftL0VVRjUxWcl3800+n0vZhkeMlzEx+/2VfbIyfoXsz3o2/7WHrpOYVuvuYSorBreNhUuk2U9iVEzR1tic1SzZRRknFqSh4RqX5oBz8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106818; c=relaxed/simple;
	bh=OPe//ygJpUEg4EAt82rAUPohtW9y5kYGjdkCTA9bQOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DiUd85VBfWAiQXVCkJiMpYT4yta2nh/X2ZgNrZu0XumnNwBFcFLOBkWC3HrgyvcdZhydpsrIzijagSRoa8XiQ+3vYnIwmvtJeZIay37xPYSpr53Y+mF1cS455dF/cFc8Vm705LrOSrwc2400TuG52b0z6cw6I8k3c/bqRKTwSDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DvY6kEKx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvY6kEKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774106816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hq37koiQiFuoxFk59QcXCaiCMINRwsI36H+6oPKr9Vk=;
	b=DvY6kEKxiNwjotURFOOQFJ6cG+0YbVypJdOzV8La9W5+6s0fcXrYqYJTIV81E5IcY9PrT2
	I9M2bftfGKWij8A86cC19T/RUinZcjfyTU3LKTGpexcRwkBjcMzZWw1tgplpk5iVg6dBzU
	AzrMl/g0KZ4x6HyxJttGY140US9qTM4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-kD6GmNyOOyO_ldzICMmoYA-1; Sat,
 21 Mar 2026 11:26:50 -0400
X-MC-Unique: kD6GmNyOOyO_ldzICMmoYA-1
X-Mimecast-MFC-AGG-ID: kD6GmNyOOyO_ldzICMmoYA_1774106809
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 147BE180034E;
	Sat, 21 Mar 2026 15:26:49 +0000 (UTC)
Received: from thinkpad-p1.localdomain.com (unknown [10.22.64.6])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 84D7C1955F21;
	Sat, 21 Mar 2026 15:26:47 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lei wang <quic_leiwan@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
Date: Sat, 21 Mar 2026 11:23:06 -0400
Message-ID: <20260321152307.9131-2-rrendec@redhat.com>
In-Reply-To: <20260321152307.9131-1-rrendec@redhat.com>
References: <20260321152307.9131-1-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Lei wang <quic_leiwan@quicinc.com>

Add unique ID for Qualcomm SA8650P SoC.

Signed-off-by: Lei wang <quic_leiwan@quicinc.com>
Signed-off-by: Radu Rendec <rrendec@redhat.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8776844e0eeb3..85282029d80cf 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -260,6 +260,7 @@
 #define QCOM_ID_SM8475			530
 #define QCOM_ID_SM8475P			531
 #define QCOM_ID_SA8255P			532
+#define QCOM_ID_SA8650P			533
 #define QCOM_ID_SA8775P			534
 #define QCOM_ID_QRU1000			539
 #define QCOM_ID_SM8475_2		540
-- 
2.53.0

