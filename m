Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9F034DCF3
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328194; cv=none; b=IThSsaK90XR+W1C/qmhAm3/eGm/JwMcIbkqs1Sfgylw58uW6htYsF0sbSUEXlwLJIDBg9+MO5tNbHMeoFyjnJPXcKGfIyawfAhCvRhDyhXIFpxOY5ZQ4kiG/WA/xzR0ZETDH/PJrNKdNnrFQzC6gGEzs0GUEIlmv0z0It4tvXx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328194; c=relaxed/simple;
	bh=EjjG9uuZ18434Z0RkOsgtZXR6MNgb5E28wxf+aLVEaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2PF2ztGX7zLplR0iR4WkkSLO8RnAVQKQAgu9X/2YnMEwR46wBfSJALmhhcYOHQBbn4P2soxqZbq8Rr2Pgc5vMfcHl8h/6PR/AooMEjj0CItTPX/TMwgwjE7M9rThgfKjW4OitTqPVHJrTyT293DHsc5uVaE6eBZC7USu2MlCbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lg57O58U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUoyzjSo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lg57O58U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUoyzjSo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHjhMt3493487
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ULdsh5tb4p4
	rfzFEsYW+kqHFfBbm7/GT404amy2Ackg=; b=lg57O58U/0aY95t5GECFcjp78M/
	yBwQ/UgPrriFKq4TXI+8EHvEliS+imZNYqv7ncgjLBZhxWypQY8ysDzxpWj+kbtf
	fwiMcqfKZlLnkT3eIQDg9Lp5w6U6RNaiygT9UzTfZePDjzeQypdg7UWASzlMd2r3
	5B4EBoPn5wiAy+qwY9bclHNIsaE2yvvyQu/S8DmxOqHRveiqrrFfDp2bjmklviuw
	Jj7U0VUO52UgZlnzkeoXlRweZNzpEeY/GjHzmADtqSzqoTqxcTJ53E+X56nuFlSO
	FTpqbL5tDvk0jWQD7ba6k/OTs+tyKre9eyRAZjE0bN1mgkPJiHBsknKFd8A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfbvff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84540c1fff4so2276844b3a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328192; x=1782932992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULdsh5tb4p4rfzFEsYW+kqHFfBbm7/GT404amy2Ackg=;
        b=CUoyzjSowI7fDOG11uqJlLL41I5LDEwNe7YmV+O3ZoOZ3Zw3onjdMFEJnQP2NoBm1B
         FkAX5HFeoX5icV+XWq5X1YQs6PFLTFHUSZYH+UajrNxuIKkMgF/W5zPjWq9GwO0I4qEG
         OmekPma00zq3Yjh58/iWSv89cgERh7KtoLIU6Il/0nGGnTLzHQpqCp+Rmnl/OCcIEfvW
         gNaosc2TRuk29tK/fRvfjnpsTekCfTD+4D8yNjAPUEQFh5FczqmkFU/6ZP9doS7BNWwG
         L54E6ykBXsrLSxvcUlJLRClBOkNxajj7FSxxGqJ04UIuaUF/Nc3atFwzWbQG9skZhJ+f
         CNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328192; x=1782932992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ULdsh5tb4p4rfzFEsYW+kqHFfBbm7/GT404amy2Ackg=;
        b=dkYv/zblmz7LYonweOGXytfOVq7C02jVJpPv6DMd/65caNkHNEPSBSmgYpIgNgdFEr
         5TegTngRXBOmrxWB5tjgyUnKkmRtb3vKrWzhfqYyuQND614u5XiLZ585M7L0XcsSCWeJ
         GiLMzKXC5JkLvkbfcSwr75HdA12dbD8JHa14uqJhGACrdqv0sl3kCAnmivEka+SYdTfc
         fRJHgVtEhwqxbHIjqC2GUNbSmQlYHsgt4tIIuAkv6Z3cvpMBHc1Q4OzUaE3Iai2r+V9x
         4gaXj2k8jmzoXs+EN1zFCHTRRP5jMY+nDHF/sVmmS/vowLTvvDIlKCBTAOMyewY3fcoO
         luSQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyRgqLY4fc28aOqM4EbDvOmXizQEd5K26jAAnJSu1yBDCvAWepYnUgpxBAF7lGUSbKw8u2XjNuS6Q5@vger.kernel.org
X-Gm-Message-State: AOJu0YwsdNdbqIcle1k2KLCEzDeehwEqOLchKHmQzGrnkACfKNA7AWcH
	SgtcOpRIz04VP7mfyDCfGcDSeHbxE7oPsEgyVo4q6WDYPQk1k2Y67y9IPhawFZs+xYVNeEFtI2T
	pqXePw2Ixj9SvITcTBxY+yz03r/jJ6uIA6k5b1dTweldIg5AuFpy0cSsCaNwtmABB
X-Gm-Gg: AfdE7cmfcpr/hnZapftV8wTwxuqquJj43UHJtmHKBbnxhUtU/9GNKDLEbUqgHdLGBRw
	l2Kl9m09jpWBVlAMo/Nl9Tivz8+rOMbLSbXOH3Amcs+ql2X0VzLNB71qwqcf11s7G7/9Ll3nE9O
	nERGrG9Fm0NZgHmL5xID4d5HEU6gOR5pbUIvyQMjwhmSgYTiaLy73b1Yn9JWHMBrDhw2L4qJk2k
	eIDYedLih6IZfub4K6/yhfCPgJ46SeQOQVwkKLvvToJ9Sd7IjgJsmCPFmCV7uCmzbsBqWXWeVKD
	ivL2rCuX+BI49J/VnfqtVlRJCkWNW0UaOQm55x+WU0B7YkGt6tgeZF19Mf45reT6M76/Azr+XyO
	+VAxEw9UmtOAMuW/Uih7w/uyXOaWtFKCiudNARg==
X-Received: by 2002:aa7:888e:0:b0:83e:e897:a394 with SMTP id d2e1a72fcca58-845952108bamr10208909b3a.7.1782328191553;
        Wed, 24 Jun 2026 12:09:51 -0700 (PDT)
X-Received: by 2002:aa7:888e:0:b0:83e:e897:a394 with SMTP id d2e1a72fcca58-845952108bamr10208851b3a.7.1782328191039;
        Wed, 24 Jun 2026 12:09:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 17/19] arm64: dts: qcom: sm6375: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:28 +0530
Message-ID: <20260624190830.3131112-18-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3c2b80 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: fbtHn1sFwHyCfDBx3QZalz--uEYYlSfb
X-Proofpoint-ORIG-GUID: fbtHn1sFwHyCfDBx3QZalz--uEYYlSfb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXz3RysTGr3xN5
 nB6PHP+ry0gpSLw5u7tnCScBrRzpbEsMvUXimFkRHtfyr8g9O7m0gWx/O2PTACgglYChgGrtNre
 i9ey1wvX68WB0lJ2CS8smEOlQL0y1HQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX1Qabp/E3sqsO
 BAZNzuNwB6u0nhir7vHEMkuBzATs6fN2qSUunqUFKqqVgCPNHqt7CLky1hOR10BnKagXj8Wn7iw
 PJBmnEaUO7dOkaSKcmvefv+mqD6DZeO/lc7AFYf2kKyEo/Xm5aaw2dHgiLKZ4wlwLZdAvf9iaFD
 Ru8/ZdALgvd3noVKq1ntebaO4UEhWiPA996fjzhICc5nQuYOHEJLqFhmForpdcPg6LHlxjdHM5/
 SD/WECZ4Q1WGYEjjySZ153ZRIGdbJw3uQU3lrgRXAFDwKBKaWmh+NgBYJ+Au7uD+FgSiBdmH6HC
 ok7IIHTF9TYV3KGzYAzKyKwGaycsf8PkJH9XhuCJBa775VI/WxBq9fft9/AguRg+w/nqXOUXpu3
 VS9Bm0uVRGKNHlvOf2nE5rjqqamPyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ccf572bb1549..71a228597093 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -307,6 +307,7 @@ scm {
 			compatible = "qcom,scm-sm6375", "qcom,scm";
 			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
 			clock-names = "core";
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -1645,6 +1646,10 @@ sram@c125000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

