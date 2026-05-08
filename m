Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3233D3492
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236873; cv=none; b=NI2HhUoWzBN48JMZUtj3FMt6FiSPsZVjUsfgbZIVZtWeAd3EeBVdEVzKILjgI6Rjv7FBNg8zYww3XJNa7eZLMpFFohmBiL5d4jyrjMdgyWvVrOgQUjC0Ao2qzEvAVzClPHdB+w/8B7rHm4YI4W89VORKYllV6kK3kVWAeqr92ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236873; c=relaxed/simple;
	bh=vcmzycQO+v5rtn0fILDKSKDqMmq9F3JiK93nKYTWSPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjq5fdz91GxZYiYlAK8c22vd7Wv8m+Uu57aGuPss9buxEFb71xdzCtUpcAbEEy93Yly1nxRMCOcTv71UtWPcfsp5cmN2UN49OPlAf7k0Zyfx1woe4K/P0RewOGOB8ZsT0kKPgUHtgPgCfqFYJFxCNky70M7cQ48fSyy2HOYxYps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3itWh5U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUVEXXwL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3itWh5U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUVEXXwL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485ZkHh2199598
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=; b=K3itWh5Ubpw2rK74
	lqy7dNT8ZlwQkgzZrv0eM2sPFEoxljv6/+QrWa1dZen5udYdCclHvcWgLCZY37Bg
	NCdlIJlBIPuNr5PwjaF8NykHJmAgNErKwVdjMG4H+0vrKLEcqtPdX9GuZEOruEgG
	e7q2CMH2vV7MKIOCHoosQfJMD4vL51gTtzphFlYJorugmq1TrQHpoRU3zw3iZoI/
	UUr2yEIDAwD1W1YLMROkmW3pTPF0lZs86waXdb45uflRN6seUqrOKyCq+OhM9qaJ
	0x+dsKOYT2IJd9e3G60iQGul1dqcYSR/VJGCpYfxbgR5XgaBm1xPZjPXGfb0mUIF
	DuEaiw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sjwg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:41:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so21211645ad.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236870; x=1778841670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=FUVEXXwLR0dCy+9xWCXrqUyv9OCL6UBAIqmgHXaX0zpJfDLt/z8Y1UH9ndCepWSiZa
         EyA4XUK24dsHzJ88IA9XUmduY7zaS7fb2qNCSJIigvNHdHTb8pL82Fkjh6io1MeMto0Z
         +uVJAKzDkqFhfNMLr4qdXYjLtbsMA66NjUfpOgrfjy54SMgUvKDbW0LPYxeMRO7qmlJJ
         9qMIwLERoJuKq8gAfwiMfJsSpNYgqgQEAQp4qWnvpj9rn3Ghf/83QT0SqdTko3wOoitP
         C4Atl8go45ZcVqUobCE3BZSWtYZwQNP/C+s+cMLwe5BOUUuYY+y+1XKyZ9JDX/kbMW4d
         GSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236870; x=1778841670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=bw0bzQb2HEa8FU3SUyVRFhPAk7eGa7SySDy3Yrbs+F563NDuqnpYhriwvyiriVsDL3
         w3TxHoLCZJ2MyVFuw2UGxDvn5e+Xo9ozgmMFMOQru1WagAPmzZo0stwnOxXk1ZEyeqW1
         FWFG9FK4Y5NCOQg9/zKtAnMYd1Q641k6vaCGipx6yx1gSlEuy2Rr8FTF26ifDikakfb3
         4ny2SyUJQ+g8N14tSP8A4mgN3AJWawMILGDv/nXKe5zdR8N/MhwQZii/Gku+IjUhpC5B
         EUvVYQQ++Z0xnlvFLc1sTYxs3PmKwZxu7VnB+y8vkOu08slH0ttxjsjIJSaujos87wxn
         HfvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YH91xD2PjtSHOqyedx6ZUmCdYhDmxEzfF+4zE4xlQ4iqXYQMyis6wkxlTF9fpXXZ0IvG7qvqD1zZ9@vger.kernel.org
X-Gm-Message-State: AOJu0YzSE9ffx51TQv4+4m6PQHiwV9cCpZOuUJZgUhJqFflj8NkqDwy4
	vUKUfDJjKRN/C69xtzmhMvgFaIBAA/Gms0l1UYE07rF3tP1sYx+ysl6izutVLh3jnjst+Bykr6P
	cicx2JXa2XaDcdytAspYjhqmpe+ke2DqzkZV5wywXq7YWrjLLSNlPtYiAUd1WpNKk
X-Gm-Gg: Acq92OEuRjQbyteICk+kUa+UXU+VQhOC9OUb4Rv8mga3/tAqOPM16078aglJWC4KUiO
	eJh+fvj4j3ImANmAuMUCPohqbZAh2FWsRWHBewdNJszBNOa2jOxMeuPAUSEkm6W54qmDcqXsue+
	F7FKYxXE2lsqHWlAOChYnxFtlR8BubIt9hsKThzIdwnylAboHdXrBlOGl5KMghNeNnD2qf5kk8K
	pwfFGko+V2uskSFw+54VOgDlTuBodocr7Ks7XZRx2lIOl66lPdAsvoGOOIighdKRgfDlXvjQnS+
	RU+UYBgy+w07RflRCnhgufFDZ3Xi1+BmjX690vHvNeCpun+YiAHsySA/+llZDhCdkvTRv1JCVWW
	vtI3F2DC+bP3664sXVth5QVZaRw4jUKU2tqIP55wBGzMUb/gF9YQ=
X-Received: by 2002:a17:903:903:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2ba78f7320amr121388715ad.16.1778236869928;
        Fri, 08 May 2026 03:41:09 -0700 (PDT)
X-Received: by 2002:a17:903:903:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2ba78f7320amr121388555ad.16.1778236869455;
        Fri, 08 May 2026 03:41:09 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm16692455ad.18.2026.05.08.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:41:09 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 16:10:47 +0530
Subject: [PATCH v3 2/3] dt-bindings: remoteproc: Add Shikra RPM processor
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v3-2-698f8e5fb339@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236855; l=962;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=8hvVNB5nM53jnXbcU14D0R9X7GK1i2upQQ1liBM2/Vw=;
 b=TdD/3G7zPaJCIrQYL5OupXjbI71bA1kBr7f2NF0gIoY+oc/Q8YE8Zza302+pQS8Jkb8Y7X/6d
 39RS0c7ksNPDJ2wzEt5exS3wXVmWO2Ev4Q2C8Ey4QPJaoiNdahDXgfp
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX4q2iKF7mEtXQ
 4XVi6Hl6kaZh6zG98nL6hC0vGcXmBqurfZPtpkrSehd+8c9f/5JgjMhOCIDg/xlVv+W8ndYAVeH
 zMJOiyzEL5dhtiACRmd9XYuz4P8Qn81tNXtAPA4Ps3qdx3T4ZWDG/I1iq/m/PKbDZU/8nXM7qcM
 TTxP21RKcp0seych2jq9WRvwjzPHijycE1I5Xhl52QJySLJhpV/CnanqgEjnBOft0EGnQ4GMzIg
 bt7xVHVTdzsYXwVdtEREAqQF0UUkSzdDmn1NnkY7vk2gaV5aloNyLa8jGyC48AzPa/lUaZh2Srz
 MhNJRyu5aI7AzHhkLLaAPzuy2uI0tFCmR2OFxVh0xhcFXk589Z0yrdkW5VBU9AJWX4kJxkvwbkx
 bj+rE0FfmTpiMcjJcsJaq1MkJdGI+dF2QTQKjzOzW3A/hgkxt/njJnsrkKCntzUl+6/DsLsRixO
 7lmioHiiXoL8Gfg6Lag==
X-Proofpoint-ORIG-GUID: f7YSeUjf4uiFC3ONX7RjWV9f6LZUqak_
X-Proofpoint-GUID: f7YSeUjf4uiFC3ONX7RjWV9f6LZUqak_
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdbdc6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zr5sphF6OBxrw6KR-80A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra RPM processor.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
index 540bdfca53d97d9c18fefeb50fa68fe704b2008c..823304afaa98f8acd67667c6aa3e36ed743ef554 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
@@ -87,6 +87,7 @@ properties:
           - qcom,qcm2290-rpm-proc
           - qcom,qcs404-rpm-proc
           - qcom,sdm660-rpm-proc
+          - qcom,shikra-rpm-proc
           - qcom,sm6115-rpm-proc
           - qcom,sm6125-rpm-proc
           - qcom,sm6375-rpm-proc

-- 
2.34.1

