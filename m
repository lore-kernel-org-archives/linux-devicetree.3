Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6312C37DE97
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479650; cv=none; b=c4GIKjghV7n/8hzebDwAg9tW3Y0sSLZzF9drg2TEAh2zZIZiodGpK5VE5QdIb3pdX5niDIDaoLPDyI2PEokJADnQddWeEtdpAWaGftUkUrH9Z0He+DrsLnIeIgVYie2pwFbAbH7P6h+b9/5deOO4cI1KAavcTq5sryK6QYBL1o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479650; c=relaxed/simple;
	bh=Ir5UQ6m0XZACy/aa3aVE/G9MiH/ns+zTC94Ny++IQMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCa2oqasJcxtnVdw8wYaWuZdFjYSVc/WDGxN8oed2rMXLc49wnGMPf3BvM8LsLMSlUeFrjK/h/oXd7f8qfGZ1NDwJiADUvfX75K22mlcUZFEHEILKZvWXftd2gRX+HyHqDGW056qc49OrFxXJRGNkNEfYcGxtrVrDxqF/w59R80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLImMkLb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dl1J9Ict; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLImMkLb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dl1J9Ict"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHY3et1800770
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TfTnIol6t8Z
	6QvjjgxBhVOVknkQUpX65xcktnI9WvMM=; b=DLImMkLb3teqvttEzlDCaZYkCGe
	CWn5ygW5PsD0vX3NjSmZiaqoRG9hXnaD+Nb+Y2DdtOP8aeRxrq4HEb/5Z1Tk0Wt4
	CicJw4A+/XC08rVubEkiG0ax9SiNjVjfVdSU8JC+0D6OqRcrjTbnX5kfap/623ht
	tJNJA3zJwV21kVDMuZG2cWTE9v2TL0zUIhbTpo31WIxkGWgF5dGm4ZYBapReTo2Q
	pXGqi9PaAUVnIzD443F5XI873WF3kkTkQ0kUNaq/HruBOM0NYsMoWxnQBoB8i/zv
	9IqF9jw/UDCoUXHZL1mtBcP3o3AGepL6zKTQu8AJFM8J9gN5X2HRqzppIkA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g25gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba224c3ffdso181865515ad.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479646; x=1780084446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfTnIol6t8Z6QvjjgxBhVOVknkQUpX65xcktnI9WvMM=;
        b=Dl1J9IctWd74Z+iHxRKuv0MBqDjmyShhHesIigW2P+5stwPsZLHBImJ4oYXCDV9XUl
         JSL/fNwNguc4yj+kxsdNiveymsSe9tPqQkn7PvRaehF2fU6gxm0i3dagFLDroorkr+Iz
         49XQD+aF/59yUVCBA4UQWUwdlRxFdSk9LzRVSyV+YLn9aVVDiEKFT2+VIm7GqQnrQT/q
         +5bQtPdlCxcSSbRkmwecbrEtvHIHCER4qypvISWnVrar8NwU+uGKc+IgAM6BRux5IY4s
         +j3x/Yqzr2m25DZ/r2KkAebOaHUZPNecj/HNXpeKyJmxuWO3RFZoeauyn55rwWHTFI4S
         N9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479646; x=1780084446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TfTnIol6t8Z6QvjjgxBhVOVknkQUpX65xcktnI9WvMM=;
        b=UIFWABSf7jR9XHGAnVBOWw0c792fXodszpbrV+kH1szsiL3CMDXE/X776n2VD16Mii
         w/XZLdxC5yvKeihBUTTN3L+rHbfJ/yVNMenPAhALYUcYVhvMtuzckMxCYplhF5IrO7Sz
         iEgX4VJ4vFIz72xO0Q2fnKlWaIdK2+A1UPLMnRBKvSz8DN1Ei2UIRUmrV7RZayvsMfZt
         shlT9nJSO6EJcuain7NnyvZLjiO7tpEC/fID6NHM6WMMGEZ5rlx3RLux5avFt6ElW5Ll
         qQcxp7Sxb65wqiez/R9G7ma7lNcMO040PNclEQhV+4xs1ukq8QzJg0OOX860D/2kjpg4
         pNfg==
X-Forwarded-Encrypted: i=1; AFNElJ8QmaPGvbsbywuMjPBj17zRvngCMdAZRCErka+qYMtTSrjO18ki7oad3FdR04wlhyEZ0g5mjWfFa3Fa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/rf4Nw81FcLlo8cmssJsElxbJZOHnYy58aXEX3lFpUUKExtSD
	mYB465nv32wZcXWR9WBbSeKImID+sgrG6pF428ZZxv0n6m4AZL2giEFatTDp4y5Uq1PX+x3JzDt
	HuC4KN+Psiq9Oy3ZMbCzmKjcHP9O0tk/YV8SJHQJtQPwRJUd5cU5KFW8YsttsaMrl
X-Gm-Gg: Acq92OH0f29Zo5w+yieD/+Bwk+aVrmlsMU9+zdfzR//pUAVBHUHX+Vs3EfX5JKk7tK4
	Hvm2c/7YRsIDt9Jcn1oD5TWRz2qn/VlqXektYAsLpnJwrAzg2zu4arhpUCJAnq3tVftSfkQWmrk
	hPMPw8axQOHOTv00Snd5D5z4nNcnA54ORMe/04npXHD+ZKS++KMbrDMSpGlZbUCBdlwZ6mUOKcm
	dUMWIWwpGSAJ4bdL+Mrf+9IMGCbc9Rcqe2POtbeZsKmcM8wqNqlTOAK/mPvW7m4UwTW6ERQmk/0
	j9V6ErHvGe1RyOP+70XxnxQIsImYsAjPtoLDkYOGJd0c0ikpaHahiASlkUvKqvevZrM7pwbczbv
	GxQVTyKpReB4aVSnLei3wTHpHyyjZ1pmUT6YYDmlDFj0DK1AufeyeGCWJLdU=
X-Received: by 2002:a17:903:2f4c:b0:2bd:61e8:1ee with SMTP id d9443c01a7336-2beb05d9fa4mr59101805ad.21.1779479646001;
        Fri, 22 May 2026 12:54:06 -0700 (PDT)
X-Received: by 2002:a17:903:2f4c:b0:2bd:61e8:1ee with SMTP id d9443c01a7336-2beb05d9fa4mr59101565ad.21.1779479645452;
        Fri, 22 May 2026 12:54:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 01/18] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
Date: Sat, 23 May 2026 01:19:52 +0530
Message-ID: <20260522195009.2961022-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DiVm7re1OjhlBoZCxeLZHZtXQ9plGDF3
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a10b45e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Uf9RHLb8GrDHKnSoJrcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: DiVm7re1OjhlBoZCxeLZHZtXQ9plGDF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfXwwuZCa9tpvkM
 dhmQD8Y7QQFJZXs/uwbEyvKd4N4iVA7rS/o2AM1CZdJQsH7m3pp8c3BBaxMVkYiqCiVBJ28Vfef
 GKwTqJHAca6KAnY2Tw+1jBT3488lRN+D//lcYH5SIWwu5D46CHi9f1/kfIfTyRfbc49Q+LUYFgt
 EpfDmud8392WWu0P/BVeQkNQ6RF9KZJiwGqVExMjw0eBlDGDS6awpBIwIa8MMvzycGcXSYrZym4
 KjgTdfoErphQ7b7hA9w3na/3sHKWAFYVnxFk30OxNCs57VbRIqYMpSizuGRQaAh9eaO+5/PNm2U
 O1RVGrXNGzrtNxw6NX+AUcSxSh0i+BIe1bP/bE06GsNvFW2rFlfoOK4ZBxt6tZugeC/uWG9gUTu
 ZG/aIKtwJT0UgFcnOQcwHRUBtDERFbJC6arkbP1lMAaYjnUYq/yfoPKjJo+QnY6Nm6Y35ph6iXD
 8lTeCBpAfWkd+wyllNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
 to deliver it (USB upload to a host, or save to local storage).

Add a 'sram' property to the SCM binding to describe a region in
always-on SRAM where the minidump download destination value could be
written. Boot firmware reads it before DDR is initialised on a warm
reset to decide where to store the minidump either to host PC or to
on device storage.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacbc91..2d68b4065341 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -129,6 +129,13 @@ properties:
           - description: offset of the download mode control register
     description: TCSR hardware block
 
+  sram:
+    description:
+      Phandle to a region in always-on SRAM used to store the download
+      mode value for boot firmware to read before DDR is initialised on
+      the next warm reset.
+    maxItems: 1
+
 allOf:
   # Clocks
   - if:
-- 
2.53.0

