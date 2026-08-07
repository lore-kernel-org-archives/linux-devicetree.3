Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9369385515
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 05:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786081874; cv=none; b=qZSw3HGn1CP2G0XQFuoV5IoJBmkJ46X8ZCxlu+CCqIgChm2kD/8T34q1idaM90VSvApe25EdjhnitDFi7UtIrK3volwCXPYrWkcRAs6yNf0pxXqm4ewkTNECq+ZVHfIwuCsq2XBUyuBt9co1lDQpqBLcdHpGzO0mEMCTVyqYKao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786081874; c=relaxed/simple;
	bh=v/zTiUNCxB4Ng7mmLXqr5PO4bNjNHxLDHwbVMZQQMUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YiLdEpUGtPzYe5Lf41LEpt+Da4x8imThxoAwiumQbBKFDWtleoWWEguF83PsxolxN+eAMML4FG+qnGHp/GCrU1uSbUdF3VFRRD0Kb2ZssC/Md0156Umo3mpwHw43L9uhyJrgoAWdxJ8Usk+FPu8nesV76BGTUg93rJFoASRkVAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hn4v8D/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jm6AdP4a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hn4v8D/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jm6AdP4a"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GwIB3477289
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 05:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UVKpc/MMmcoTzFiiMBAxOc
	9ZT5E/QMoAN6p0lflpkvg=; b=Hn4v8D/8+kF5wPvLHQCY9kn109XMrFjn1lpedn
	Wk6wmxHPr05YwVXZH958VMeOd8PfEOQZHpwYwURdtIp6fRahvm0MWhtlAV78YPON
	b7EAViHX4KU6Dar7hqWbBe0f9vrsU2nm8Fld/YzjmwVrZpphsuClW3kmqTwollDQ
	nMD7kH8Bg+Mz7S2eMxBPpWO8wrsHJ5rs13nVHlD1LqchZWIfnbpgoTXqLVSytJtC
	lId3xw57WgonSn40dG5fHnaVA/gewGHE7KLj8xMEx3FJkBbelgyJ1Bre3Bk9TZrq
	WJ2qo+Avh63a9BSZhobidq3Rk1fx6KyeXElUvkGF+NpbywbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6haey8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 05:51:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so34864915ad.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 22:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786081871; x=1786686671; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UVKpc/MMmcoTzFiiMBAxOc9ZT5E/QMoAN6p0lflpkvg=;
        b=jm6AdP4ajN9t2vQJPYlS28BiOtwpDf2nGiOHqWNjKcIkcvjxCrpn+tZu5ZmX607a6a
         kbA3VMK2uirIyXgdKi1Kba4emYzzUBuWB0vESLown36deQQtZyGO9Hr3x9XOEFzknRkD
         nqHOf2cIvZccY0JZShgfbNAzYl6rapiE96QXsdPSsNp+Fn7ffRhC8hpTANUEwKf/lvsO
         QSovYbf4QrcTAw3NwkTMn7p5pSjgh7CtSeI2jQbdxk5FfUZfPCPk0aiKis/rkFqYpg1t
         +5C6qc2GqK8E9HhEoyGUo7B7sYZ797IjfjInl83l4qmmAuPXf7s2yCe9C1DRWd72FFN/
         gomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786081871; x=1786686671;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UVKpc/MMmcoTzFiiMBAxOc9ZT5E/QMoAN6p0lflpkvg=;
        b=lGJib3z0E1mT9SmuGOsG2bgx7YuzJeDOOiUHst07SOvwVNj7iXaoeINNfyC6kbDbeM
         zBJMejKNwCnvlnjwe8J5O4ireBf1waf7YVQcEfZbHw2CQNMZLuyJthVxcHan/rTej4dk
         zXz69pjvk9gZUQkBFZOAcj3mTrQpnoaxiyL8oQ1/EoNWnHqJTcTrQX/d+WTar1eM7Si6
         rsg8+i0DYNM3dIhEjjQYUQv6pYqGeO06l8SXXuiGrCs3ZkkkVd4qf+Sm7/u3e9t5IVHQ
         FL0uHKR1WRf7DT7f1QQ6aP0NGC09tvQcWgeQs9P/HSihdXyo1p5Due5I03aCR2rRkgOo
         HbUw==
X-Forwarded-Encrypted: i=1; AHgh+RqNJv0YW4n06bVFWAmUZJ5duCUekh16KpR0p13Nh8zTpzuMxE2l9DcTZPO/boiMiNKd9SQBKa/pNzJv@vger.kernel.org
X-Gm-Message-State: AOJu0YzYTJLR5Cqr8WSSUcMNsHsJEe+KLdJUOItEyDsBeNB6BD40kAYU
	2tkHkJ+x3bPxHkGlx97My6AH1YpkcXuOAVujt0ZukXZIcHf8G5T8N8qgHg53EWjC3LZ8kKo6M28
	OJPLT59eo933TX0sPsrf7tUpkl/Iu1RElh6qfGvFiaCvIUokwHB+SnbmMU3CKvyO1AXTJagbS
X-Gm-Gg: AR+sD10cJVmXlUMl3X3erSfc/nRBeuRR28cQYfyyhxUD0Tn0yUbhXRNSF4XJxfGTVLg
	+/h63nuJImo+gdeaXHprdqy73yepUsOB3XDLYMsKGpqGZm+CXhxRTTMYd15VtGZjDn8SQgEeVTq
	JRRYln01zW+UEpvpfhBEWEAqF8rK8gKXyML8MQIHQq2f/GDpQI4Kv7EgUjyiKCIqObUuM/CDZCZ
	fU1vOAYGDYcJi5P5ocoPgR1uCuTgWoWLvQcAYFHx3mloIuX+gCh4ynjt46+zxZJ5wLfXw/ce95r
	//8tTRIT1QtnZ/xqHyvGq2pLSGsO7BYWRjbSdo4keunHlH4PcupxEcM52XRXhREGA1bI6mc8DiI
	uQtcFNAqKdsO3952HnBxiSqjmpl041D7ypA==
X-Received: by 2002:a17:902:f60c:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2d0ca7afcabmr239335935ad.1.1786081870704;
        Thu, 06 Aug 2026 22:51:10 -0700 (PDT)
X-Received: by 2002:a17:902:f60c:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2d0ca7afcabmr239335445ad.1.1786081870314;
        Thu, 06 Aug 2026 22:51:10 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4e957esm3431895ad.75.2026.08.06.22.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:51:09 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 11:20:56 +0530
Subject: [PATCH v2] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD9ydWoC/3WMwQ7CIBAFf6XZszSACtaT/2F6oAu2m9hSgTaah
 n8Xe/fyknnJzAbRBXIRrtUGwa0UyU8F5KECHMzUO0a2MEguFb9wxUxvUiJmFkueHc+6Q6tPxjU
 IRZmDe9B7z93bwgPF5MNnr6/i9/4JrYIJhlZppRAbxO7mY6xfi3miH8e6DLQ55y93osg3rwAAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786081866; l=1572;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=v/zTiUNCxB4Ng7mmLXqr5PO4bNjNHxLDHwbVMZQQMUc=;
 b=jmnf1vZpwUOFZet0Nov3erMBPpRMxcLCqjXFnJ/1cq2lf0Jm5ijyZW/g1ZkVa/5H8ovN38m2r
 8aw8Fn9vETDDdwQP8KgL3FkxPFz3uSdMjW0/uE5+f8VTf6txYAgKKnV
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: Rc4EjvZE8S9ghZRiRIUp4j5PpFSqF4q5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0MCBTYWx0ZWRfX1ehZ4cV2KxuF
 vxHuOq0sr5GcNtj20Mq3KnSQg2wpr+iC1Z65S0ThqQu3pInUUquN5VIr000QA5QcFlRFEOW0mAa
 UDSmtJ8DVT2dUuDh+egzOy0pQn34NviXp75J38QbTES6wnAXulcrmgA7GTXGWaex31LIrrmPKnZ
 A4qiC7m1/2akoajO0NESzNP2KtHxHbTj4D9qtgry8HEipsQQAwT2e0wKrkzWyNinthb6y8D6mBM
 UI/ODcEYAmpM66jdI6DenuDFLTLtLX8YFVEogcR8/08Lxv59wiye2mh/1IJJRas9UTjq/St3WUP
 2sUn1jAw4nUMtLXYIiRe7wo9Hum2hS3rcSMkyHOGIfV1luViuhS5w72uNNCNTKiBsKh362XSkqq
 Pc7tKX5SpHJMKmsi3lRFDJaymuoNP31eUg5PFTrUiHPgUu34c+I7fXu24b5qrkey5Y+99ecMwQV
 sT8o9a4M0FwTYIntjVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0MCBTYWx0ZWRfX7exeIGcAEskv
 bp2VOaRV8KCn4MKR/ZR3EN1vuhDZ4+gN1RbvAfagqngBP75AoqZcHBgq5rh67FH8a3v5S5zeB9r
 OgLqRAbmqpdd7kPouVbEqPxtbbcXrFw=
X-Proofpoint-ORIG-GUID: Rc4EjvZE8S9ghZRiRIUp4j5PpFSqF4q5
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a75724f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xTAV2kzwEx0x-571GnoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070040

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v2:
- Fixed VMID list alignment.
- Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 590bd2432d85..2064eed01327 100644
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
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 
 					qcom,non-secure-domain;
 

---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260806-agatti-audio-357bcd74ae9c

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

