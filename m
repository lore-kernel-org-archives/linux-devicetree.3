Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874007;
	b=uMVrrMpO0uBcidFiMKBF9U6Lu7nskbycl9ETcm/csc/Iw0sNVcHT04inKzZ5pO0Nfi1J
	 p7xDGIs9gnjkjw9CtbbCgD/4QK0YJq4fQCvpxihKbYwFhXQ96F0PtZdtpig66NANbsWqc
	 8HkyyewcFEX0KBWCrjw1swM1wpTNy+qiZOQmseEhJmCrhE7OTAx/dECGrzegkXJ7Z+0Vk
	 5AODSLvzcl0qDFgfu0k0fqR36amI7VDrW4b+DciyZJGcysTLHIzI2v4xUeUiZ+7eLitLY
	 E8klqVLWvEmU5TkZfJSrGmeRC5ehooNGCO4pzABfvQaZEZWAp9DdFurmVz/OsBgr/fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/vJlPqiL/I=;
	b=XIoNw94pXuvvZaHjG6oqgzSfabaCRbgHQi8Q79TYGo4ecke+D/MdQc03dnNsHB3oXKip
	 1O0bcj0ghU4+GQU7VsGOyn4pk6TwbeTXpV4mhZlCrJZ+sQGWd7JdeTFRmheuk00DI1ZwG
	 KNk2u6Oeh2HEB/J/T5BmSpr7jB5MH/es1iYMlilbPX6tBYYgFL+NGzteE+GRwJMdtoLU6
	 TU082/57jxbsw2e63hr8Fd4c/TwnRR8VkGZUCyCJ4mQllcqA4J7rdbCua8rrWFa0FjX2d
	 aRSR4t03pWXNo8xr0y36eLtvxqAXBHGN+QRVH8p0tnd+Rd2uavsmheVboHWH1c8iVYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqJTKMBh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKCykvVc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968A606A330
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D968A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqJTKMBh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKCykvVc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tJkj3684598
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 10:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/v
	JlPqiL/I=; b=fqJTKMBhW4aavmTcQ0VMupvk2GhmzYCL2OcT6vje1EbdODUGgny
	DX0PylBe9xVUfhlz3yU66mFmhhZ7SjN5H/8gtFf61txmTEVhsbIqKkcO0LK5YdHI
	sPeqkjPTMhks7Byo5eFsHS/QNZ9itxzJRbcXSoqsZrPh2y3iMETwe7013a7FKNaU
	A4I3M57QT3wEyT3U8s061gEYyf8O+wIcY0SPvVuIH9SzbUzPWS9EqRjpAniLqmBb
	oBa+fhpgECJpZJ4cELFBaxGBslCVVEGDluCU5VMDIVs6tqf4ZeG/dNn78fXAf9BI
	X5y3Y7oSCk9pXi7WYHDYws8lmp8WMErucQg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43hhfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:20:06 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so2900808c88.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874006; x=1794478806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/vJlPqiL/I=;
        b=MKCykvVcNhQegd4+Gj02Sp/Q+XwH6fKK/BS1d6Rh3DwhadTjoG50ek+7kEqEot/5pO
         D2Ocpys08g6l/p7CAYfJX39343Gg766oSMWj2luRlkFbym6eMDikgXBzfCBz2Ak280yg
         jBCraBtEKH19EVHdMPJ7Rv1LxFj/+qYRdtcaXTPUwHEmkDkRNG/P2M/quxBUw4mlfiM0
         4gCt/2N4P5AqfDWfE16nxyH0hmpI2+tHL4erRhO30mwUeyIiLwzQ9cgRvEAVUCHhICDU
         EubS6VLtM6Cs45Zsvgx1xLDeCHXKTYDVZhpbyCHHh0N1TLgdPdG//D19mPrtGgCrddSF
         Nrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874006; x=1794478806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/vJlPqiL/I=;
        b=Yk9nndz55T1U413VaAkJtX4+RizzRHefm7cdC+tmXvj5baUqOzTZlWDn/P1dzlYV6i
         wFOeeo/nzM1TnDzU29FBYwGKbJZLqyY9K2Jd/b/rPTJj1usVrwebEdxLFafJXCpPD/lw
         7EQEsPK0nwQfLTwejV7uUWcNbt0RxrCTMsrh1kvJ+qDN+oxHt1/Xas72zdxmc7Hirkk9
         OkESa0YvM/z+KVsDgw9p4ZQ76T0mTis7VY9AfdzcVO8H7wYmGw+biKPEPA4n0UWfjYD2
         Ld9N5UjBkWXhLm3uV+9t+khHeQtgsFuY+y7RbjmeJY/ET7yKsykyU5WsgtyAKvW6A41J
         CGJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxliqNxpGx9kPq1xEPi+TREzr0+Ud6mAYDYWo4uAWgMcD261x5KvuVvZSvE5+LkkIQBEBUPlGyBEPWy@vger.kernel.org
X-Gm-Message-State: APuU4Z/B9mXMJzztM4dFm5PY63Te1BEbWBdUkYdnWg7yVKJ3lTWM4UJz
	wBCXCh/W2T2beheYp/ALFChuAyR9xwE1HErZRJzkNMEvlzjFa3YKfec0ySTtPnMOA4W49Wc8b5H
	2viOUkU1C7SKjhKAngV8d9rHpwD/J3EMdzScRtrHGZAXNdhZ85XW74roFtf6TFFPh
X-Gm-Gg: AYBFou3ZcTugR8zfqwljJLloXeVZYLkbVU00bDE3etGWJ0VCxPFb7tuRf/MJ1vbghoi
	reQcjJi8Vm2IAvG4/YioPcZcl5pVuuxVf7/2hadN52YkPLtnIBDr/UWHkLI+VCiv47tPXc2Zh4W
	TqIz3JDzPzIrCbY+LKDZCWzCF7IQ9iBLH16OTteyg7PAoYQHh/7j6LDwCZWXiIxJTFvJ9HbdYMN
	JB3RghS63v8kpE8gxm+yukkGPpBCRGK2gN2uq6tmEMWZq6e7AI4jy1c37QWWQJ5GJ60/EXuzf6y
	BolBaFhRis7AP67TOFHje4MIygza7mNO37ZyDMiw7Xj5PFtbsGOBbxzIXPXWeOggWtf7jb5pvm9
	aAxEoThC1XA3B87ERgGq7xI4BSORsbm78ZNe9TVVIKlZ8iq0l4cRgdK6UYY3Frbjkmk2z98OVsY
	levVlYvNrQ
X-Received: by 2002:a05:7023:a5c:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1ac5e6f4f90mr25354573c88.30.1793874005179;
        Thu, 05 Nov 2026 02:20:05 -0800 (PST)
X-Received: by 2002:a05:7023:a5c:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1ac5e6f4f90mr25354538c88.30.1793874004436;
        Thu, 05 Nov 2026 02:20:04 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:03 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V6 0/3] arm64: dts: qcom: Monaco: Enable SDHCI storage support
Date: Thu,  5 Nov 2026 15:49:52 +0530
Message-Id: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OwOfAX2XHhChieBJr_BaW1Pz3sQwAxY5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX+3CiCgCdH2tt
 ssz6suUhGuo58wag59a3+VEErnZo1Ke5kr0S+KZ6U3AXmGCrZse7nK6mwJGuPw4RiKGjUW9sLTQ
 G4Ao5Z8h5I7CdNsEshn2QN+MLzx07RymhogETcN66bSFwvsAFDiGTwSV5gYXTz5Ovk38rTSBjNp
 qrQgK9g6/mtiFKn69jjhqFyRJa8l3ZHw8vLGH4inS1LL/bPFbvSCDyWfqZvOaK+RHbXy3vBJZVM
 tUIDJsT0VnLYzJGEH7NLCBo0Zw/iC4AX+KwwX91Qd2vylWyeDb3xOJSiQNfy2v2c+XCuh8EQM4/
 UANw5uq89GYu/CcpFsmdgF1eE28VdoqG6iZAlDSHyOsojIbM8MdxVkkn4emA+Ww/wKYaoeYHx+A
 i+oK9wF4ey+LZr5VhZgKSC5rbdBWhNL/2m+87KWDraJJzQeKI2BVJVqDGc5WXj6iVAmLRJ0O/qN
 bLqzjtICHrB0Pcw09iQ==
X-Proofpoint-GUID: OwOfAX2XHhChieBJr_BaW1Pz3sQwAxY5
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec5856 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Q5OXD4evTFBxQrppJ00A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX2o7JcwWG9WQG
 bAUOp2qSm+2KUxJDGrfE9fnOEQhuzsQutHq0PAWdKMxgxSpo0ulwK4sJsPosdceCrd107vEeww0
 98sD52ii/JmKAndFwBjY271qDmEdhf0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041

Respected Maintainers,

This is v6 of the Monaco SDHCI storage support series.

Changes in v6:
- Propagate Reviewed-by tags (Konrad)
- Rebase the changes on latest tip.
- Link to v5: https://lore.kernel.org/all/20260826112456.482982-1-monish.chunara@oss.qualcomm.com/

Changes in v5:
- Rearrange the Makefile entries in alphabetical order. (sashiko-bot)
- Rebase the changes on latest tip.
- Link to v4: https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

Changes in v4:
- Remove the redundant regulator node - vreg_s2s, which is already defined in
  base file via another merged patch. (sashiko-bot)
- Update the base monaco-evk.dts file to make it storage-agnostic by removing
  conflicting eMMC specific properties. (sashiko-bot)
- Link to v3: https://lore.kernel.org/all/20260701081715.2580329-1-monish.chunara@oss.qualcomm.com/

Changes in v3:
- Update the patch to handle the supports-cqe property for monaco-monza-som
  platform which also extends the monaco SoC DT.
- Link to v2: https://lore.kernel.org/all/20260616130347.3096034-1-monish.chunara@oss.qualcomm.com/

Changes in v2:
- Avoids using the reference to direct supplies as dummy
- Updates the eMMC overlay to remove the static UFS host disablement and
  vreg_l8a voltage override, allowing DT-fixup to manage the UFS-eMMC mutual
  exclusion dynamically for flexible UFS/eMMC configurations.
- Link to v1: https://lore.kernel.org/all/20260227105055.2364348-1-monish.chunara@oss.qualcomm.com/

Validated on Qualcomm Monaco EVK with both SD card and eMMC modules.


Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  8 +++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 11 ---
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 7 files changed, 109 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1

