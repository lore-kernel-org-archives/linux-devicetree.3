Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37B2472F6A
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250076; cv=none; b=Cy65Z3AFu+SKj8fZNL73i7YX0zaDHjTWBWeq3Ta0zMd+hKKL1IrDjRO25AY6x8Vi55rjOv0IBOOezg6aqUA+buBNWqi2NxehD+hKUfjmaluu68WjRZFX1s5K6vr+YDJvDl2nRWE0pmsrHsdouMRi4LmUBnEclq1Q5zzOBzDhWtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250076; c=relaxed/simple;
	bh=UoWZ6TMFmWJFZ4O/POChI611r+ZIq82nn/iwUb724B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T1gOXOoYUAc2drT2XmkF8WyU1q/AaUxrkjDdaXx4BERXd1mXraFmCWHHyDtGKeP62bEjWfYE4SLVjJmX/kwmpbkhlxV9t4KLky7ESJ0kfYiKhubtCypXJzVQ1PotmnVbd4C4e32L7jwWL0x1LAJxqlAqR+KBFjEqcr1GqpqGJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxflbmEC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3UBQMgi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxflbmEC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3UBQMgi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179LmU1282730
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VthTsFAOIiFAa1hk8/UzDRJb1bvhW1r0SIVjbBCIy5A=; b=AxflbmECYybRtJry
	KVU8CE6+nRIu2fnCyI8veNSG1hjMPrSsxUZrt9bexW1tq9uvz6fY65THHmECvoKL
	7w1zpG7/GQUSR00Mc93+IrF8V1UR4zHX8uAY2L9xmxxwY7Nx89S/zaWTugcsIW83
	CKWlDJewKBye/8vz+qj7Tsqq4iH/7eXpaXm/sBGhag0gVPHPAaArgcdgudu7hhlx
	XAblabep1cgk4PGQ0e8eh07YOfE2sKVcOk3veZbhlZdVR5yeyesAU1hvE5Xcc7UZ
	DiiWu4Kvvnm9IVySKz/4A0FZ+KPyT6XcW3YdJ/Zu7fBRf0+0kHu1Mz15ubK/TrYd
	u/MMQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx9cj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:07:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ec3146553so1080104885a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250073; x=1788854873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VthTsFAOIiFAa1hk8/UzDRJb1bvhW1r0SIVjbBCIy5A=;
        b=E3UBQMgiDGsoj5xk+cWA2c6yLPlFnjW16sl4gROIx9gpXn+7GYyiY4oNtY/MRk+qXN
         GLI1nfrSs5fQgXtbh5Nwo2mapZrx+DAEKWB3NKeyC01H2MBVQpllF0hkTSupkRG4nfvU
         VV0z64tG6tEoMHGqBY8jtznh0dPDPp2ci/rCbj+NX3omlWdXPjFNlcjROfMGAQ2XREn3
         RwtJlT4RWc9N+ov+Ehnh09J5MB6MIWz7mI0x+2pYy1KMZHn8wz+nbCDe1Kg0n7Q7eH/o
         gxlUnSp/V3pOxLtNhjXL/g6+kVBN9hzmzrg41+OTkB2hCszezRI7JpBN9/H57RdiTB44
         B/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250073; x=1788854873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VthTsFAOIiFAa1hk8/UzDRJb1bvhW1r0SIVjbBCIy5A=;
        b=o+slLc+brJZO+pgUgnGX56/H7CcXwjfI2f1VsGNe05UFZfI3SFYf5yk78f4Pt04Fo3
         dPqFMcAK++N4Hy/A5ZverwxHwlVobkDNXLOfwyDT4R8UPmhw3EAKgn0Ycann3+P8GVkH
         MMBH5UENKs1A6B6RWi5ifkxbMzG8xybydmmrlObavi0RwFFEELCb2vjMM1SggUPE04tM
         cQIVqjMjAOxzJS5BabVcy/wUvmK/RitsUaD4SiX+fmCEOVE4d4t3RbswfskwiJ7uMQV9
         hQri5jH7vBhStVBxa70NO0kfbcgBVVD4kwAzAmPC4m231Ojm5QxMuZ1uOFXzu9nsbMJY
         INtg==
X-Forwarded-Encrypted: i=1; AHgh+RpVlAAnokpChnHBx+cgL71R3TFe8gMDqOGo/yfTSCvN7Oq1rWFg+paW7UuA1lcRpLLoLbtEh1QIehAJ@vger.kernel.org
X-Gm-Message-State: AFuF++kvhfnn+djfMCmeU6ybvPmespqhm5sV/68JifE7lzRv3KF8vOLD
	jIWi1ooHl+2WYz0XD1Vo003ZuN9ICUYmY+O4qZLFriViptfERZOEICLQgFqpJN0jKp+DHtehTf+
	rDW+5tUzCC1VoahU6YDvkuQMu+UiBaoaEGVo90KOoFOrp92NjnOy0aEO5pmQLUzuL
X-Gm-Gg: AR+sD12lGXTcOzK1v+eROtaM+qKqygeSumE/jSH9pr+qWxmXNns2f8Xrq6gzxgAp2rH
	TcWhrKnVHGoNTBFSPSOaKD1kn+VXeyzJeovh5kbEq9o9ZdBkOXXD9MII83DbAz7JzGgwWEUKZbX
	d1AO5YVaQZfEDcmtam7jyWziG+mcYyLiQQs+uT4B0zEnGpeUrpqZw7TjfDU7uL22ALrrPKJ8TFk
	we78b3sPKMDggzwdhC+GwSvXLL8ugyCSkXm/IcHN3HKdKz/r1Kwk0bywNwTvKNAoBWeByJArSOE
	NjhmkhJ3lczlG4WfOONXwQjk4QB+CZ4WSFfeYdKE8YZZjlOQkFPSFAJrcOE5VP1bCN54WDttayM
	mbOTaHe2g
X-Received: by 2002:a05:620a:319a:b0:92e:541e:632b with SMTP id af79cd13be357-939137b4683mr3656991385a.2.1788250072356;
        Tue, 01 Sep 2026 01:07:52 -0700 (PDT)
X-Received: by 2002:a05:620a:319a:b0:92e:541e:632b with SMTP id af79cd13be357-939137b4683mr3656946685a.2.1788250066708;
        Tue, 01 Sep 2026 01:07:46 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:04 +0300
Subject: [PATCH v2 07/16] arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-7-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UoWZ6TMFmWJFZ4O/POChI611r+ZIq82nn/iwUb724B8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloexHpBqmOWIJuXlw6Bcl6qKwGst0nN+/60//
 vI0257CQtSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHsQAKCRAbX0TJAJUV
 VrMeD/0VtpuJDBQVtLsVUaKIAraeacEXb0+/dha8jQmAOTd9kzk6XdlyB9J5YGV01h1mXoBryRc
 XvqUNrZLZVmZLT6F+YZjv8mzvfD/Jq1ev1SKbxa6BAE7GJ3RiksvyRPi2vaMONkAXp9VWTPODC3
 LDaswcsMYBJGPNfcYntJl8VcvqIwiXrAWeTaDE9lteHw+WjH5weVwd5cw27flq0RQnjBKfSkVQX
 Qif1yKk1sXfH1G6dMETcagE5wdW6bpz/KX/JeUdics9rA9nqby0unmLw8mqIluMn56dtc03qy7V
 5hTBtLEaWBTX23TkUh+oU0xgAvHvMHx0AswblJ5ZBq7a+Qb5Zy6WcGqke2pmndMh00zarm93nEK
 WgQiKvlfyz/Zy7Ds4p2J4ytkxpNWENjyTXGGVWmJY1Hz9FNxGJuD8EAEUmVrQz1JBjJ9GQgEiQv
 JnsiBlcHXrDHoRR/bzEO0qoWl2r7AIXo09U/HWbV1z8U+p6/XfNQoZHDEnWohmkyKrpfTY69+Lt
 pP8RsDF4XhufdBv9E2j/3tpS7tjhEELDDpe6wWgw6H/7N5xGGCFBACFrXYv1mrM9OGiLPleG7Y3
 Cxz6oDVck3eJVqzaB8dQ0HEM86nXZ9oz7AL84n8cWlE7zmNnCGfXAE5VhZsXqApD2KDqkxmmJN/
 VzWBqTpM16HCQvQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: OxhlERXXdMnxzWPRX8eLIAn6HItdXkl1
X-Proofpoint-ORIG-GUID: OxhlERXXdMnxzWPRX8eLIAn6HItdXkl1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXzqwtzpyCpm/1
 sEc6XpjWtVamEwB6hj2DLPvWJ+UuHVLkaGesAf/8HHCUfq/68TeUm18QX1PszA8Ya//DehCNkar
 lxPsUlNQq0d1ljHr+Yr7NUZR+CQ2CWo=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a9687d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX4vJepSBPdWan
 QH6dOuTjQCG+e8hxSpQRC+TJKWReCJrJCmZE7mDJoYuPC/zAB2Be4hP6r+OVckTlcVatsk9gmlT
 W7c3NxYggIB65DRqTUpYwTGGEgCzDYOB80l8YbfGI3/LFvQHviU5tW+LdSPuti6ydu2iir0Zi+i
 g2DiHjxKTY5YdUk1WwQCSwHe2gEOsw5iLnYtUR8GqOv6r5kHnN7ONKmOJAadexZtb+K+OqEtAaK
 PwMrGH/3YPBVSmK61KKkAuxkLW1eIXA6qKQl2kMvjoEevzzw9x/m/uxD2AeszdXAoFkxnwlRMUP
 MKCJ2ausjSTrPR1HgLLyUdxxuytEgGAaw5A57aPwI38pS2ccSOEcN/BR542HN6BCuxF0UI+KEtZ
 BXWtkj0bEUaangsRaKIcb4qqu8iMZ3uz/p1yrvgv7K8UzTFXn2qEzm1GEcnLIIYzDtS/O74/Qj7
 TC57gIOqdooU73FXiXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 8cf65490cdb0 ("arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index e4a0b86847cd..4b45f293e167 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1251,6 +1251,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <28 4>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

