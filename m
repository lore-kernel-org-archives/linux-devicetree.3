Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DF836403D
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781862631; cv=none; b=qTykVn3iGheEu+oxPCu8lft14eCNoR+UUriewpSCvR4VvMKAq4F5hL5aljALRTkvjIFTQdd8XQbWIzfzfiRLrwcVPb+t5hr/wCrzXDQ4YRYjDAB4RXgE3H2oDZLOA/9Wh61ic08uFQpaHIV6FE3m74uT2cfScNWq3N34620EGmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781862631; c=relaxed/simple;
	bh=T+uKpBm6Lhim3Jf3vS23fgw7smb6MZF63zyhIlgxM3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jIjsGTZatMSWOioM0NxfNcQEuvsbvouu5IMT8VXlD3HmN79ynsZWI36l11iAmR6N30BnqyfSMebOsXM83FHw4lnVmaKonUxXBZ+lUjKT1JnlAOFpRJfHvngTN4u0Kkym5cRouQC1/YF/ZfNDBVya4ce8HborHU/We4DcKrmN2JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PG37/ZEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKkBVGNr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PG37/ZEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKkBVGNr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7QxcF081514
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 09:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XkcwAOf1ZNNGk7R3X50Mhi
	hR6h47SAlzpuY55G1Hpag=; b=PG37/ZEvTNaRvKijCNr8i09l1hLs4GjZ3Soa02
	5y+4ivaBF1foqrEG3U2cvlaXXzkCr4O+h3cd8HekQ3C2Mp1he+Qc1u3VI5gYMQb7
	seutlG2CHJLLeHNurYKv+D0qZ9X+ma3gq1VGFZn1HHkqxaEQ1HeCQGJRAj9gkoWA
	UHaszO0G/njhpN3UsZmqY3FzaDAHjn/AZJL1BUlS9qd1PDn9xHYUJNduveA03s2F
	DA5nqE+VZc6OST9vW38dSlaH1apzR4n+P7FWVh4pHPDcs0vVzSv4w+PQYeu105ag
	m5/i7zP+JCU+aNn7A64zqc0NYH8D7ZDhMtMcS/ZdzHG/GjYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtjb4pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 09:50:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2b64850easo40855635ad.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781862628; x=1782467428; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkcwAOf1ZNNGk7R3X50MhihR6h47SAlzpuY55G1Hpag=;
        b=jKkBVGNrz0CNNeCb20FLwh/QLPLNzjIHBArcyZ3LpRpOLEPukE1wzRTZ5+2P58EUkU
         atUz5zicxGM2/Yg8FTRtv6zRRmYBnpBRdjumpixNIG6q1chSCKVrA/eDjxTOdokze9z6
         u+ezlgtG64MWEODntyUE1j9mARuTmxKq4fRQBfmaAfb95SYjFiiouhaZCFRohnUgl9Gk
         H0SiC9GiPC/Zx6paNIkXu4rPeyDjqvJTRUaQ5whhTVW4OQInm2nAZs6b8H4CCZiiFuIj
         3IbiNZeVMrba4Bi/2Wh5j1EVrcuKviyvcDC55yvvwNlpJcSpWCuFhqTGwuq6mA6PHASH
         XKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781862628; x=1782467428;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkcwAOf1ZNNGk7R3X50MhihR6h47SAlzpuY55G1Hpag=;
        b=hgezfaHqL+jif85/IrebE4hMbyQ6RvLjIbiQV4XNI9g8119vpXaD/8lgaBWlzYfm1F
         0AoOK0+Ek+mhkUN4T5RPpESFNILzwDVZEImFEe3m3fDRjGvBi6snuyRE9JMzUnpnt0f6
         fJmh19Ym8y3q0jzjEIc6aCVMjCRJ16Z90vnvatzo86luEOyRAboqOGTlDt4quNkW5JRe
         pc8Fit4YrsfwkymWUvSQeTqjx6YC56DVPJ9sZS/ziAP9XprmUCMmVfbgiVVo3wp2Hspe
         70pIWhcQ0qhpgRgiQX6ubnv77UccV6dMz9cDdbThfWTO04jQnh8V1UXSFdeQ0tC2sA9R
         9coA==
X-Forwarded-Encrypted: i=1; AFNElJ+7CnuRebbuDxGyfUYpPBINA8JQ4nbKp9KTK0CkfBdBdo9cX+nE2e3NfHSJR3F9PnJZpmkjs4RV6p51@vger.kernel.org
X-Gm-Message-State: AOJu0YzgDPGd2FcmmpHYds26L4jM2YNaxCS7kA72ebiFXFJYu0rXM8zo
	x1Og2kieSju5eCYPSwO1mqbdf8dFKSLyiKo1+845mUhZyYd+oRiGT592s2i19SV63XCbYm/dwlE
	MnyPY59IriVeMVrYvrft9Fo/vxQd5YngXLH7G3pC5eRhXXlw/rzLVK1AbmoaMuTjv
X-Gm-Gg: AfdE7clAhrAmDBA1FI2NAhgxH6hnaPfdgVXoaLkmB/A31MSpVO/tpFOd1xSDCRNE175
	5I2D07IFQ8sNOf/TDmK/PSpe2+fhcXJwDezn9+xIQEmwyu2t3ebkokIJlDxG04dptOyJBWlwvpE
	oyqH38qU6eUGSllmwavNXKxmjrkJlYU4LfNzvFZmauFUtPdlnhtRqZzrJdKJx2/CXR12vAOgxGZ
	kVywJOpUz+4Ol6yt/HS6AYlA8sN0CYGWJi6uMHZ3qGresMVA4Q5fas+SLjAJecLbSs7PweJjRtt
	teFiMmxl5XBQz6Tsp+J3eg5fCkmJwHtYXW45UnaECX2jrNeradrWClbBStbqKPSbRVwfdBM1xXo
	O5yPYYWAPROFTHKYrIb7kM1N3To7tzSjVpmDuE5gaNKdN
X-Received: by 2002:a17:903:38cc:b0:2c0:c4c9:4cb with SMTP id d9443c01a7336-2c718ca5cbfmr32878225ad.14.1781862627722;
        Fri, 19 Jun 2026 02:50:27 -0700 (PDT)
X-Received: by 2002:a17:903:38cc:b0:2c0:c4c9:4cb with SMTP id d9443c01a7336-2c718ca5cbfmr32877815ad.14.1781862627312;
        Fri, 19 Jun 2026 02:50:27 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209bd3ddsm18193975ad.38.2026.06.19.02.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 02:50:26 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 15:20:08 +0530
Subject: [PATCH] arm64: dts: qcom: sm8250: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sm8250-audio-v1-1-8a76e033e209@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM8QNWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nz3eJcCyNTA93E0pTMfF1jC4MUYxOjZBOL5CQloJaCotS0zAqwcdG
 xtbUAzNYrQV4AAAA=
X-Change-ID: 20260617-sm8250-audio-380d342c48cb
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781862623; l=1782;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=T+uKpBm6Lhim3Jf3vS23fgw7smb6MZF63zyhIlgxM3U=;
 b=En4MTb8L6o+yEP26qNmHzGnL8Sk+KF8LMbRzpzqILvytSON4xcFSoBFevIjmtJ107EK8i6keg
 qz7fZOszx3kCNcCryaH0WgVEurRXVhWkQSykaUlUzMhOfzd6xW6I5d7
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA5MCBTYWx0ZWRfXwMcthybvrEsu
 DpYmEa8xhyG0G18NMBCihdYyybQTrP84OheqTAb4EfOn0Pw69x0kE25DAGOyr8frRGUdBP4tuQv
 oegIJC1XNT4QaE0EueBW0l9wB7UTJZk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA5MCBTYWx0ZWRfX2+6ja9TLxA/0
 BXL9xEkilpeDBwaOeTbO0eMyoY9t4D0lQm8Y3R/wHZWbNkYWLFjEqJKDN51bo2Olv+yC4GOCTJe
 fUecEypzQ4cJox7Mq1csqu8iIa52IOkvYA+ieU5JadWWL+wfR9QOU6TCOm64n/AA3HaBobNMXrM
 R6fGXwLaKvfut2OWNe5ik4y0l/g/fNS+t2+XoNij/AwgHtYZTfr3MOVasSwBY4kRU8e9tpgh9Mc
 Ij3sfcMf7kBWzegUotbTkfkNXFSsFHsaJKYi3ClwC9icZisvc7sU9JYvHtp8yNtkMd4vCo+5tsw
 ZtYoV1C+C7g2HutF+rBrZTVwdpXd0W+DmzErv0WzTcGDJtYOv6gBkN3iSpfdrw5iGs7M+oG+0DW
 JCNkGfaLi0VApc5z4jGUVu+El29r7RCwhGX1aJGoBiPmm5hQlJjG81q9ox1eMjDHBFWk6drUayd
 GH2dO7zTX2DvmciIbnw==
X-Proofpoint-GUID: mJ6mXM98svM38CQWYD9pI4Bso9KUNuRV
X-Proofpoint-ORIG-GUID: mJ6mXM98svM38CQWYD9pI4Bso9KUNuRV
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a3510e4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xTAV2kzwEx0x-571GnoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190090

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..3f2f1b644db9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
@@ -863,6 +864,14 @@ cdsp_secure_heap: memory@8bf00000 {
 			reg = <0x0 0x8bf00000 0x0 0x4600000>;
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
 
 	smem {
@@ -6077,6 +6086,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-sm8250-audio-380d342c48cb

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

