Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E8919067C
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900344; cv=none; b=nQ+ENxMLWRNsaDwK6qwU2BgkXT7qJYbgBvqoE9PFbq1LawIpEGw/fBfw9LFf/1MlVSrTjhP+FLKFVtAtrE7s/hQKCNv2U9t1JsjbfFkZ0R2zMAW6jsiXgTaOqXn8oMJ4+MtRzV+DcWn2iscRvaru0mAXlAck0Ia5MpQ/v3OyraM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900344; c=relaxed/simple;
	bh=bEv4c+NCVeDI5hZyy74vI/X5n2oJ5cUMsCpcfYOUcp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IS0t+ZZ2DhZv3CWCRRLtcfY3NCKkbR7jkq67eF50NDlbzVFUewZrFPR10TrzFeeilVpDNsrORJdJx7IwhhGEIkx9ZtFD/CLFZTELhlQybFAtn3B50P/awrgQ0D4PBc5ralbwVg5rneUfGJ2yY9PyzEEOSM+Jp5Gt55eoDpvCnE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5OF7EwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EceMmhdD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5OF7EwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EceMmhdD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A3vB9710812
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AwDwOpiFPSF0ZI1/vfPczW
	kGaSZksvs43+rkmg5AbT0=; b=n5OF7EwCgC0ipxSnjDFLlHBhJQU2nahpC+0Pmu
	SEinjDARNJsCsM8ii8h6ADUv7ex/lRNHgXSDi7z8rOvHko66NL94bIgraL37CBSP
	GxK4Y2dtM70p9KOBBOUeJ0nqLztALGmq+L7KGhhuY3NKX3YvEjKu5Dqr2xToFqtu
	0qSNdZEhSIGyxwpO9RQ5ilxDIwyOA/6Vym2EDOwh4aSWIJjMufaMFwa3hl5ikABz
	z6SZYO5QMkQ5nG+T8X5qgY2/JVnzdcgDOVt4s7FT0ihgPDsXMEJ320kzfyNeE4Io
	6B4fEU0cwDMg8w+57EZdiLFZFec+Vpdo0pKBguP/Urxazevg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwbe4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:05:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so1197874a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782900341; x=1783505141; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AwDwOpiFPSF0ZI1/vfPczWkGaSZksvs43+rkmg5AbT0=;
        b=EceMmhdDQbTMWQwFViX7T4C8aDq2fXbzloHwtPoSFPqYvd+ALu6zBwmcP2OOuMrHKX
         kN5kIrZVwF3wIdpzATAJk/iidbgUHVIo4jNN6qSywLpgI0iMZiBs6Sgp4s81zJf/3VcV
         JWRdaoU6Rs2KexPT/DrHN5DO1u67Kt+F0riUahYHHyPX3o6r7qB4Bdrc7vgmemMI8pue
         3hf4RJE/FfjB3E7ne2o6geKkNhZj6ldM4xxZZFVph79qDAuxqkX95JM9oco1uXRWjdTt
         bijFUee9zqIIK7Ji5WkdX00zxiULOSa1qzpUM3YJXPngWvbSnhem+a3Nkb7FPvRxYR7J
         9uYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900341; x=1783505141;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwDwOpiFPSF0ZI1/vfPczWkGaSZksvs43+rkmg5AbT0=;
        b=o9UcbPyUJI/WBuZ7c7poS9xa581HQt+yNEiqhkCfQGVZlOThs7D/XkYep+p1KNf2Qm
         uclG58X4g3Xaz3BEzbvYt5xyk5suzbJ8BvR9Fbp1mCWmuEBadXyNsejWXJhx4SUMAjjV
         aotBBx/hvBewnpoaBDajOtsUJC4fMhsZMPx2aVXF3823T8hKzUYUgSTT64bDVfiwkJ4R
         wZXCnX///XhcL/6IY0V503XYlvolgVJdfBwGMKEsZPOIXiP4Uizu7se8olJu9HZRO4hX
         nwJtOzGbOkyY/c1cI1scpCHyLI5dQxEeZxtKKRTs2SwvR2Nijfjzu/Y+DTcWK9yKucJh
         +jFA==
X-Forwarded-Encrypted: i=1; AHgh+RrZCPyhjeETRge0spzZDN78EKZriHKjTg9JeR4AdfjpMo3toQp2YKzefRXFUMg3qTZsi9e/YoVGkPqH@vger.kernel.org
X-Gm-Message-State: AOJu0YzCtnWMcXWGtv7ljYFz8HpS6aRD1RlOqSd0euLPlqbdTqpVnIcC
	vKVmB4XDzJiC843+zDDU0oJXGuZbSTMhlFtKMWYM85Tn9azI7q3RcVpkkUBzd0IMhPMiSVi+87Q
	SEM1AP6lSLH/zav6rxG8KnurmH8BbHnA2UZEeBUSkdb33JQS0TWHeSpkmGWRPRX4n
X-Gm-Gg: AfdE7cn9vYnWZB+3kmkJBHMAMv8A4vIEO5xCC+GgPR4kGyty+IFsVWXwGHjMa5bl9/P
	EMkDUUtR6Tryrbe379Wt0O3zH4Sg0HMJhZXHoLm+D+fR9JkXMhDPBxGR8eyslcpxf9RTrBLivlD
	C8BJC8SOcrxUT5moqSTheRvRgupcGuTDhW4jTuUfg9DEtaDSwpmRf1/n5LWiDdD23gRFpHsnr0N
	z64klCMR2yEPrrVTe9BcMSlktWdYCVMdspCSBKxViGz5EgfbHb71kRysK8Xp89s7agjkqPTTUQq
	oxqnlILMYjr775m3OsCzN3gDIYmqJ49VTkpvUr6kyylyxrUJVHI6+3Yr9oVJiFTObjQa3wp2V4q
	c1lr88DvlbgObTKJPTLE2y7ayj8fEGeBqjg5+Yl8z33It
X-Received: by 2002:a17:90b:1dcc:b0:37f:c232:f075 with SMTP id 98e67ed59e1d1-380aa1d454cmr815967a91.12.1782900341328;
        Wed, 01 Jul 2026 03:05:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1dcc:b0:37f:c232:f075 with SMTP id 98e67ed59e1d1-380aa1d454cmr815947a91.12.1782900340852;
        Wed, 01 Jul 2026 03:05:40 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d6d45asm1618994a91.9.2026.07.01.03.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:05:40 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:35:31 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGrmRGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwND3fScytzSIt3E0pTMfF0LYzMjQwMT4xRDE2MloJaCotS0zAqwcdG
 xtbUAIrau9F4AAAA=
X-Change-ID: 20260701-glymur-audio-83621043d143
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782900336; l=1780;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=bEv4c+NCVeDI5hZyy74vI/X5n2oJ5cUMsCpcfYOUcp8=;
 b=2P/+Er6x2LZiw24Ws7UEotRge0G9Z1NJKmN2F0EPWyZkU0z8vYkU+OJRL896p0H0qRbG1EHrf
 +ipYp7DAQ45Dekyh+sLpNiXppKVb90dFXHBVUW2Xub64SZNAZ7YsK62
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: qKbtj42hGYyR84nKERa-vEazmd0nxw2M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwNCBTYWx0ZWRfXxR+CF9gCGm1M
 XcylPgUXKU1RWo4xRACMkZLaAagWzJPp4X3WFp7OMTuu0Sr5flMhwBKtf4PwcxFQHsWli9qNmQo
 p0gQHnRbvPf2ncA/QWo06lnyArWrH68=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44e676 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xTAV2kzwEx0x-571GnoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qKbtj42hGYyR84nKERa-vEazmd0nxw2M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwNCBTYWx0ZWRfXxb2VKPEUi4x5
 F+S56z9s5GqQvVWbawiLM0noGdq3aJs8oQNrtEeL7/jrdjx9aVdrvp4tHHEJqPAenwDRo0Bl0sc
 Sw4Q+IMuKXuhTg+1LlJaIzNsMNGwXbXrnFoF+BcOXULJb2zIj2odEy6bLVNUiIfNFwVp/W5NRO1
 DXPONqPz1HI9apMG2U+QCPhHYgzAjCZwkvPlAFXmtUbV77+xnY2BMxLf2WXmelSu1LAzolBwRwl
 qyzHGeFp/nDjBJFArVo9eUK9N9jycru2YzWBfWDGDtlruTNXXu2LI7GWh7ZKcN0OWDH7DxuqL/T
 vtHed/kDzrdbHwSIlbf0MG0J3Y34fTXcT+oDuii9gVPBQYZWfTYb4kE5UHdWqzNK1L7sr3ZFRY1
 mrFxzNUfMCYhuiLKn3Md4djZCWsvv6wU5fqhd+M73aosxq8kkyHbmkM2ZYgfnPNbHcpNOYHta4U
 Mgo5ooncREF8QtQqQ9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010104

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..f403f542aa00 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
@@ -663,6 +664,14 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
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
@@ -3845,6 +3854,9 @@ fastrpc {
 					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-glymur-audio-83621043d143

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

