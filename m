Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D47362122
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 21:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774040427; cv=none; b=muOEZzBdotHXGHU8MmGhBLXKrpgS1osRFbyQczLFOtqATtSxAXLYyOUCB3INjfqCwcnmR2TL7VKEPMmfEMcPTcaoleHaHHbl4RU4MUKDH42SCbLXuITP+pRdqXS3fHRraYdM3YldrbWnhfU+b9bQQGlA7+aVH3p3uKYXUyhlS/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774040427; c=relaxed/simple;
	bh=PEOkUrGvh4ZL/cDFKvirJiFoiHQaBcuOpBAyxuKRh5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mmn2Ti6qhm9ivR2MAYAngaIgSVWARW43/ZZgfiGSEbMlCnWIVPw1R2/zkKogifnBeBoE5ytdZJHAGK4a2NSrZpT/yv11HcMVob7uYBzV8QAMDae4Lx3Ud4V3c6Q8UDHDr9oYfcExifhs8eK5IF3p2i9G2FDq/3WFnCZ9fTk8WW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UlN3rPgN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UlN3rPgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774040422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpkCsWsoSCr3sKnLDZksVk7D3+QyXSSGqq/pW5psIz8=;
	b=UlN3rPgNU2pDQjiEOc6FwAqcVZWV16Zl//9mBWHesPMZPDsfehSSi07fuQpjIPrPriFIfa
	0rRavFjQPQt4DcrRbcfj64dW7S3oenqB13pFrhU22Y9fqHtdLfHoKUGk8LKcdRffbNik+E
	BC2MBWCOpXxhkHF5sMq8XH/GkLeNTK0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-gw6tkQWbPsqSr-K_qduK0w-1; Fri,
 20 Mar 2026 17:00:17 -0400
X-MC-Unique: gw6tkQWbPsqSr-K_qduK0w-1
X-Mimecast-MFC-AGG-ID: gw6tkQWbPsqSr-K_qduK0w_1774040415
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8168D19560B4;
	Fri, 20 Mar 2026 21:00:15 +0000 (UTC)
Received: from thinkpad-p1.kanata.rendec.net (unknown [10.22.80.230])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4CA0130002DF;
	Fri, 20 Mar 2026 21:00:13 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lei Wang <quic_leiwan@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
Date: Fri, 20 Mar 2026 16:59:32 -0400
Message-ID: <20260320205933.992852-2-rrendec@redhat.com>
In-Reply-To: <20260320205933.992852-1-rrendec@redhat.com>
References: <20260320205933.992852-1-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Lei wang <quic_leiwan@quicinc.com>

Add unique ID for Qualcomm SA8650P SoC.

Signed-off-by: Lei Wang <quic_leiwan@quicinc.com>
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

