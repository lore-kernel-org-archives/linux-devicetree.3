Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF95456E19
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014901; cv=none; b=mbl1ILam5GMNfieGgNK410fZ3knQQJezgCWrJ4ATkodL/5Sf0LWV3rbT4EFZ3s9uKxKxly3otjhk14wgm51Y9cZMy/x/hq2pPGLnfRTm+SppK0tkEl8ZsT5kZMqeBY/dTD/Zp6Yo7hiZFZ8SuyCla1FhOXzt8XyszjDpfdH1sQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014901; c=relaxed/simple;
	bh=zP5yDhKGNSt37383K1tZOpIC/KrHwQCgV7HfXdEKYpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lp+QaltPZcMDLfQeTgEWPznnmxNx3tDquF9xctofRIlkn048nmym0WXJMDVTwTFE2dy8YHwz5sUBzkuItsuJsZbRlYcD88XzRKMvR4BBJntGIUYM9JVcxwq7Cg2nyVqL5nJEJSUOEeWZP2zMkjcwA7pBpwKkzaiSTDaEWJaxbxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vag/dI0w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNynX5li; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vag/dI0w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNynX5li"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nlew1871437
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 11:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E9iURRvErCPOU4STKiuTTR
	soqVUHZQEauJAvTV0DL+o=; b=Vag/dI0wo88JwNZzZvkOSigUlueDp3oPmaK2qb
	I2eBI/vbxsmmTFxH3Vhrb8AK4D0KfgYEBq2fpZBW9UZ6s+kroI0kdJ5jhfrv2ppE
	RgzUFxt+Lr61wo1P94sZP3Wexwlnhc/qhMJH30cGWLPk7910p41eS944W9autUnC
	h6ZABh5NnvUUPrdwk1Qc2HBp++jp98B2S2Ah2DNxyIvj57T3dEQvlKWxL3ZENYdx
	q0zaYmAyTfi+dgZiLWwim/KWp1XWnux07LXgwPwYpVlUE8+nrbQ3gYe/Gt9f269w
	jvSQ/v9eLD6oMYd8H+HShc05ZsE7pHwjBXyPvDote/F4uslg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud1sa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 11:14:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848662cd2a1so2654827b3a.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 04:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786014896; x=1786619696; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E9iURRvErCPOU4STKiuTTRsoqVUHZQEauJAvTV0DL+o=;
        b=cNynX5li5byYZv4rkCsxIfDC04FGd1/SzvIXQko/ppZdVIN8DtbGVErTLyLI3bIBe6
         J9BzrbMSbz9AOPT7PtEJPLOsTyp0kiZh4lHfv1bqvbY7zHSN0shDbngaxCvF5aWRXCt0
         xZ4xogKw62tqz8pIv9SkhRETv22fVkHLbPnxtRvJzmAKEKEpKZN1rkUOzQ57v51wRh/T
         eEvoncgBF2LOEP929+9Uc1x8uWjALXdm3zJKBmpEzEbP5IQbQO+swmuemLJ5StfsgANe
         uQRCne/1AZ7+TdKIHwLxsrh22GVN69vPnavpWuiXHgq9ztobG4t7dKacYyN/vQl+bPhy
         UGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786014896; x=1786619696;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E9iURRvErCPOU4STKiuTTRsoqVUHZQEauJAvTV0DL+o=;
        b=Oyqp1O3wogTab7hJ3xcMesqEewWGKaUgfVOUVQ8smAr/4cFq/iBYt6YN5KQls6zFrX
         6RxkUnF0oUmcZG9AvLJgVSQ/pSeZhYLUpxWEHu4NyOQzTU6YRdlpgD1cquY//rFcK5s7
         3GsvqGZUDXqUtsXgfEkKa1Weg2oNxxAZpDK4kGOheuHjApjLDx3HcFNQt+ZX4dJax+LJ
         1gySXVh0uhBguAKvY83w048jyCROeLqRzhwqpHDbYsGXLsEl834xWeM5FX0sVG/6xIxj
         jKoxuvo4hdtCQbUggFqO+Dq0D4Bqi9mKoquLoz/I6LkpI2bHERKrp6cnS//9/5wvHUsf
         LeGg==
X-Forwarded-Encrypted: i=1; AHgh+RqsAshUpTz7Biek4XgOXJl368PmRbQ84CByKEx23OuM4te73xXaql2fT1Seo1n2wwFrMimhEOi6TJOL@vger.kernel.org
X-Gm-Message-State: AOJu0YyOjcrbwJeLHgX7GURzrEWKtqQaRjQNIDYDq4+MkyAq8hBl95DN
	33aqHt0qMA+CSjZfjJpxoX2qJPGVsUarO3T1R3MoImcZyuwj2BlwRqBD9/YdmbsDPE+Yiiin3VB
	Y9TxJNtShZpm2FtoUc/tScJ2zwmt3eGRpC1n4Wy3iWbrhbi6HDK15y2J8mQ/mOUoi
X-Gm-Gg: AR+sD10IPM+8TKljWoplhYtPgYFAfhEvljcmSpbbOC8tdhcJc+fD4jOc9mBH2q6yD8s
	I9741UFYDlwjrlPz+nYF8uEwiAwBI5D4U+KJ9HZlCh5SFpejUevku78bG9QdHCPGi4xTBHR86eD
	FyvaBmigyEB4KZvV8wVGQf17EUw6n5HON+ww+4GZmLHAymN7ZRJ/y9rFdV4vR2UuUFcIfNmUVkW
	QGXgWh/j+Y4ASHaVN+DkX74fvwg0fBSnjDgalywIw2H76Nc73K0iEIaqVAWGo0XtyVH/M9g0vAF
	yR/SNejK7/gxRi0I7EiOzAjHpETQmGKa+2JUamwjIbIretjJsvRv6V5jzBOJjce+k0sqAmIsgOj
	oXbWhcrMd7MwxUlvDABfp7gSrNsTJbFc5DQ==
X-Received: by 2002:a05:6a00:4392:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-84f2e03173cmr16766875b3a.10.1786014895544;
        Thu, 06 Aug 2026 04:14:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:4392:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-84f2e03173cmr16766814b3a.10.1786014895112;
        Thu, 06 Aug 2026 04:14:55 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f4538e489sm1215461b3a.7.2026.08.06.04.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:14:54 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:44:41 +0530
Subject: [PATCH] arm64: dts: qcom: agatti: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKBsdGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMz3cT0xJKSTN3E0pTMfF1jU/Ok5BRzk8RUy2QloJaCotS0zAqwcdG
 xtbUAhe+NJV4AAAA=
X-Change-ID: 20260806-agatti-audio-357bcd74ae9c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786014891; l=1419;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=zP5yDhKGNSt37383K1tZOpIC/KrHwQCgV7HfXdEKYpo=;
 b=fyOwaLwClfooF9gcQGtPmBDl7KRDTHxpkMYSop+8huORDvfyQpCK2Mtj/fdKuZIXqmskv1NHl
 MTZuuqJloClBnfhVVawonwugg6hpiOMCUyhjjT7YHtg0i+URwDmQoog
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX/Nl2ZHHYpWUX
 N6NXDGu7s9M29freFV4bseH53IsI4SYpudmbwXqldgiOqzZw34iFoa0M7GHMsYfOt9t2YmLbkTS
 OOy3yXgIy5kAHOXbTaKEUVXRYZ1anaKNG4V/Vz8sWL5/J+s5twIxrh79OCCYa4WkLyMC9vTMkj6
 LYpd9nzzfewuhUqb9Y4RpQnJmjnbG/TgjrpVcVdyaEJYdq63De2G84+B0BOFaaC2xwhzCQvvKXd
 ltFGgd+SuE1BrU66catk49VDpwrXrfFjibBb9ssxxRVC6lFNLAYq+ESORayE0dmAaaI+P2cTok8
 0/7Pt/QECF7eWUt57iksbnx8DYaxpksZZ4pQOfdQDr4/yPMXn+bymaAy9RqHaRcGdVGuxQFJxy/
 SY2vTvKX4tfoXSn+d2NrPcD/Vm9Ct0szRwuYDi0emsMpopiJKKk63I+8tKA0YbSr9gQT/UwG9oo
 qvx0bT/t2LbXvUqZyOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX00sCkFJFzg8y
 qsb0VrSmRjScy00R26wJ+QyfyXoQ6Q0jhX1ChtBVXFhrC7jP51yexAsxMfn+WTihvX0u07TZLtc
 fdv/4BOoh3Nftz0knRRRE5uAS0NAFtc=
X-Proofpoint-GUID: Dqqs0NmsjD4Eaj7L7Ys4fJByQdYVJCxJ
X-Proofpoint-ORIG-GUID: Dqqs0NmsjD4Eaj7L7Ys4fJByQdYVJCxJ
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a746cb0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xTAV2kzwEx0x-571GnoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060088

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 590bd2432d85..f2277d7d445b 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2348,6 +2356,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						  QCOM_SCM_VMID_ADSP_HEAP>;
 
 					qcom,non-secure-domain;
 

---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260806-agatti-audio-357bcd74ae9c

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

