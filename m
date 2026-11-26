Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695115;
	b=ct2pFhYZ5H7lfJT974QFwo5J8/B8uXznnYKq416XGITtuelBkQqUa/WiXUAUvP3ZTmy3
	 FtSLOT1D1flHytSt2s0pWQpQOjFpbuZ/EhYqY4achdr+DlCVENnNc8jx0ZoEpAGSkvnh/
	 uO2M/fqGk2lN/UFjSqSli6bsNd+pRDzE7wkF95guslMgUgR9tlMZyXsRoNczP00k2uGUk
	 41Or004anwgnJt9mJOKjPON1phDOAFfoJQRESvadxWqyaZ38aYtL1gbfH0Lf5bJEhCZBG
	 5aX2YaIlI0Z5RY8V4rZyMksGS+g8pKWocafyVLmToYUXapyLcGBC3uh/7kMGPIr/jhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CnKchJGd221CmUhU2CN6qD0GhP92Ow0eY2JeeRWT6S0=;
	b=0vyCJY1mMn7ixjFOou+BypXYhBLhHzeXIABUDTW7pTX/Z0DAX2S8t/ExjLvsUzrPDqDc
	 aeV6HVMAif5d21IUefF6UlU9YWH0wgCVDGn3/G7wnRtG79bJfBZrZ7vMkyApLAaRhXF50
	 eX5Zw9bybtMOkE110YwTXDtQJjB7F3r6d8DnwrOJ0YwiJj7lCadr9zHw2k7wpK/Y2Qhb+
	 rbRTIs+eyQ7lADHgfylCFgYcsxyEO37sqr5A2TA5yEX8FHy9mEIb5crPM4Hr6pnihv50I
	 UJO5P+QYJDShRo8Ds7sBvSUkRDB9ySP2zf+DywxK+aGl6cVUFeGx4+kpG8q8pziOGuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WNj3X2Fd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rr6hppkW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4E606A336
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A4E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WNj3X2Fd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rr6hppkW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVNSQ3893643
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CnKchJGd221CmUhU2CN6qD0GhP92Ow0eY2JeeRWT6S0=; b=WNj3X2FdUlZ+m9Q0
	yZPxTJLUrWYsvIvFtSikF5I7WW14LDtpUpLk6oaFaDuP9sDuBWHTjUI0JBOF5Taa
	1ZhAXcGLYqD2PJpMvDYgxlJY1E84hASRWW0m14olVko5yOBgFOQxis83zN5nSWY0
	YtWRkKMUD5KcVJ3vPV16IuND1zAgujAevGVFsL7oA8ZmTU29DeGOfnmY52ieTVjF
	yvC/G3UUfXEIVQ+TWpZWoNV7yg19pnQ77idLYKK3u4QO7joqLsClvz4aYe3JobJh
	gFZMc2wvhd+Qwq7CQBJcFZuAzfmYEVVI1Puekbu9eZlKbrS1GYk5EXaybHKq9cwJ
	6oXGbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80r9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so1359728785a.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695113; x=1796299913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnKchJGd221CmUhU2CN6qD0GhP92Ow0eY2JeeRWT6S0=;
        b=Rr6hppkWDCqVC7N9VgdykG/aTkuHJ+nmVgLfo+GRU21VNM1oo1DdXE+F+mIzKlAC73
         2pec1Hrio5a0SGe93BY3SBmV+WcMDyOraoxcV4SaOjOpEsn/BcbAcbE12QBJCpPfQHOl
         92yP/vF1Ktog22Y1aZXWgqTsxiFt6LD8xEee1vCsvB1kVLQRoh6SmenKuNXPvxk6KiDf
         JXiTMue9vbFp4yd23PXqE6sYYm2WkM7g/s60d7U5G1jdeMNaiGCInIeCLzNktNsJmXsl
         gor49JDMQY2OO1pdZZx73G3vwRkhPMauhoZUt7ldCWBTxqCNF5cQI6HZiQypzmwh8bdx
         qO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695113; x=1796299913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnKchJGd221CmUhU2CN6qD0GhP92Ow0eY2JeeRWT6S0=;
        b=HYbf6IBn8ORMtDkPcAJhMmBWWYVSoy4EMNa16FHxvrevvXutoB08yAONB1l6zDoKx0
         p47Y6irIyo5kqumtydkIXqp1LLa6b0e5uUPoDMg+o7QpTyWxT5VeTYtuDqczcYDLXUpy
         jLqca/hAMuSTJKmGDmMhmSwgbma5jA69sJrhzNU52mBZwYEZS3IJBiu0PQkTMo5M/395
         v8DNQ3TVDT/T7bc/hGx4xbl6mOcUNnQocjc3TTe0yj5IiM4uJ/8JJzljn4Pbp23Jo5zt
         JHze5a4LCpJe/XGtJcIUx02B0/hIZgOCaUPEpCUXJESAoDbXJ4te9fGOb64dC4VYTaFm
         3k6Q==
X-Forwarded-Encrypted: i=1; AL+hErEiyCZSsN9zp4nOzys50/HIziu34QqgliwCRFKUSt8KRjn4O2vNwHtWcgan1rSq2ilkwGhybSns1zdk@vger.kernel.org
X-Gm-Message-State: APuU4Z/vXwvBxMVeHF055QfiXwYJIpbyxHsGh5c2wXBPGoASCd8bW24X
	pqUjZOFPpiSgvGAb5Kx/MhXg9r4nOmqC4HgnXr3950FCMBojvQVSMfdwh6Jm0AFEWKs7kgz9yOW
	GTOgMzbr6UKFT3TkoQMEc8Kj8yjB6QNufA+3vYaqPU5DYFEcDyN8BqWcfgHWf/X947PZFi5pe
X-Gm-Gg: AZFdTZcOQMnwdgeKmyh+6OMl54aWs2e5PN7FQGn5ogaUw0lqlYzCDNMgUNm9Ai0gDs+
	gZju1jLqT0tKQUw43+JGJU9Ra5BnNnHg8eguH1N+yW/JmY/SRpk6sd/T2aPBGWLD6yahdvBHR59
	RI9oY668jy4J1D5meMnoXvU3Jj1Dlk/wbL3zcouALOJuPrnw2Ptx+nmGogStpUF6IGzdUWGRTcU
	813XRKIf0x7mUf31UXI3HK6hEENDl7VdJrhUAPIdo9ezjzYMyWhhWpxV69cDjVUTByanf+3bSP8
	5Hg/FzK7cpW5rh1YlN3exjvrb03kfs2lrDXTNqFos9AWTSqXK2oyMdZdxQN4BHjLAc83toLKHI/
	Z3EJikE5u5h79KvmRyhaqEj+Jy1bVkORST/5unqVpQsUdsm0MNBtaHz2pTmVpXB0626d/kCSswY
	fYDUU+lkEXb9XK
X-Received: by 2002:a05:620a:8801:b0:947:8230:5328 with SMTP id af79cd13be357-949ba9cbc05mr3527092185a.34.1795695113362;
        Thu, 26 Nov 2026 04:11:53 -0800 (PST)
X-Received: by 2002:a05:620a:8801:b0:947:8230:5328 with SMTP id af79cd13be357-949ba9cbc05mr3527087785a.34.1795695112850;
        Thu, 26 Nov 2026 04:11:52 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm748736566b.40.2026.11.26.04.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:52 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:11:39 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: qrb2210-arduino-imola: name the
 QUP firmware
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-agatti-el2-v2-1-1ed468b4c52b@oss.qualcomm.com>
References: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: tRfREifg9dzv6NaRLC6uzF3bPx7hrnlq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX0VeeVXz4ImxU
 TULcWKQX5YUlmVE4svyemJWTs9fapzkADqhggnFoKMm+09LnpGbywyA3QHq9CcF8zA2xz4iUdLT
 gSdmNugoHpAyahcUrQv0QPtIdy8Z5ho=
X-Proofpoint-GUID: tRfREifg9dzv6NaRLC6uzF3bPx7hrnlq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX8b9sXyca7+Rq
 VSXDgyqRCXdEk6H7smIzDXOeTGklT8GIS4I/u0yn123FJkuZCOKg3PIuYgshcqbs29xr8/+8mN7
 7rib1k64LR+BWnvZrvMwlQ9bJlsMOPuxEJplk8u7zMbl911t3d4Mxzl+W8GhEiU/1H/UXvJBPrb
 EHSazl+L/55RxX9I2hud7p5wyooh2GrmC/R3yeTceB2R+sXYfoaOu8DZynuxejLVwzGDSe9otpd
 3LDzJ5RTo8nkqds4NjkVFXyWyFcNsOw3YWAV2ScBPXeW36hdY7P2fcyTpqkpguafj8v2GnCr3Sd
 4Gfdt6DnkhfXpsjSkkOTJ/3AKUrdz9GCDKmgt2KMBx2/v7kxslGBH6y79MlhjGrBIVURrh2nYLt
 so6sh8IxTRQVQrvE07Wi80a8FiPtkei70nJosKTbj7YTc50N50L++UC+q3+E+nXKbBi+yKAlXP0
 lUgrnLruVnG3Lah578A==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b082209 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9bc6S-rvgswZ-E9PJ8YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

The geni-se driver loads the QUP firmware into a serial engine that the
boot firmware has left unprogrammed, but only if the wrapper node names
the image. Without the name such engines fail to probe:

  geni_i2c 4a80000.i2c: Failed to read firmware-name property: -22

On the UNO Q this happens for every I2C, SPI and UART controller except
the console when the board boots TF-A and OP-TEE instead of QTEE.

Name the firmware: qupv3fw.elf from the QRB2210 boot binaries release,
the image the stock boot chain loads from the qupfw partition. Engines
that are already programmed are not touched.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..f6db8ec25133 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -338,6 +338,8 @@ &pm4125_vbus {
 };
 
 &qupv3_id_0 {
+	firmware-name = "qcom/qcm2290/qupv3fw.elf";
+
 	status = "okay";
 };
 

-- 
2.53.0

