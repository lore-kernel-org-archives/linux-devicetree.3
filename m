Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4957367F31
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 21:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774040429; cv=none; b=I30LFupnzAbpD5mbSOTiYWXxLpHtFfLoQ6RYwNRJAH2MYXIeOIctRIXbMMqBfheM4cX8IIyB4GHq6phvy7Qqh+D/jNCH4mMcuv+6ZR+LAsWLT34HQ4nUt1Uoqf1+mmr5/uQ1Lt0O6ak+fUiCegCZgK+AW0kYqSaQc1hbcJgx59Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774040429; c=relaxed/simple;
	bh=keKlHlst5V7dd0eTBjB1gI2RvQNSB0rgwa1IH9vtTTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/AHyLwSx2vo08dpftN+DbUG7pnCRfa99ba3lxGFvLQdCdxx9lhORcaTigVTT+nVRfWApnqZ+MOn8oDE3iLjQgHHbNKuS9qnNbeF7NyrZTUWD/PSPIVI/eMqgFsoZAjKM+HqGWpjlNjFTkL5IwzymB+bXr7k9PncmqgaJ5zM3Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UnpX0aRt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UnpX0aRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774040426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBNlohgJFhWbvPzN7Vcf3Qsvi9qXq5EYQMtXwiTWMTI=;
	b=UnpX0aRt0nx0JeSCxgqB8wy0cFcouOruMfUmniM/sPOJO7G4+haU1RrDB0ZkCmv2SsCXM4
	QbokJc9dGo0fAUigDxQKM0klBQZSyzGUmSxJEKz0cRkDKS48hbJdx4fS2a0uNTj31BY9t3
	MiP5Cik3CGPBT+V0nVbxjwjEkH7JYPQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-377-UggHaPG0PRyVlbLe1KHyMg-1; Fri,
 20 Mar 2026 17:00:23 -0400
X-MC-Unique: UggHaPG0PRyVlbLe1KHyMg-1
X-Mimecast-MFC-AGG-ID: UggHaPG0PRyVlbLe1KHyMg_1774040421
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4010519560AA;
	Fri, 20 Mar 2026 21:00:21 +0000 (UTC)
Received: from thinkpad-p1.kanata.rendec.net (unknown [10.22.80.230])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1682D30001A1;
	Fri, 20 Mar 2026 21:00:18 +0000 (UTC)
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
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for SA8650P
Date: Fri, 20 Mar 2026 16:59:33 -0400
Message-ID: <20260320205933.992852-3-rrendec@redhat.com>
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

Add SoC ID table entry for Qualcomm SA8650P.

Signed-off-by: Lei Wang <quic_leiwan@quicinc.com>
Signed-off-by: Radu Rendec <rrendec@redhat.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 003a2304d535c..01eae575afd27 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -488,6 +488,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM8475) },
 	{ qcom_board_id(SM8475P) },
 	{ qcom_board_id(SA8255P) },
+	{ qcom_board_id(SA8650P) },
 	{ qcom_board_id(SA8775P) },
 	{ qcom_board_id(QRU1000) },
 	{ qcom_board_id(SM8475_2) },
-- 
2.53.0

