Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336D13DFC8E
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764613; cv=none; b=pAChG8Nu3QYvDflRe2Cmx2SI1ycDXSZXXRkT54ETxf/QOGkygKubjr107UKOwZh/ivIy46gl9jfUuhesrVIUixi3jGkg1Q9sDhiItnCoZUcGWRzTDJJNuT+aMrK5qifjit4DjTNvNFRTtsCCsvqeT/KrWb7+Rt4DOEzw9GjtP90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764613; c=relaxed/simple;
	bh=rz4pAC3JmkokksupZBh5SY5itEvF9BJ3dxlNr3lUXsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VkFJR8mu/iGVp4K+yqhAKOjXmliPa7yqaWZNtJFAK0bN154VpGXNAxz2O6Tc/SrE9gJWEh5srvnU3G4c2MGBdrlJOjbZ1Kk0t0hHB3sQPI0vBzCCZwcEEZi/NkE+O60B8u1M1nbZxyJTgw/HstKXX8R3ZnVtXWi5mxCx5WGXXG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgIiWZSZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NS92vSc5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgIiWZSZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NS92vSc5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeVQe2261560
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8fctHXbGxI63yquHiTvFAqh3nJ5cncAR/B675vKBXMU=; b=mgIiWZSZWp7VehKR
	ozbUOrZvHTRPatZj8yrMDGKSqeay0QXPAZt32spZRD9xAHJxbNtJZQXtcUVZf5PZ
	OTVLWvcu14ghNM4OYZP0a87yC+g3r+sMMYFJGCRVlh/1GqRJ3rHL/j8W3OOSI89Y
	OXYT28kSAGnuYC3liS4b7SwJnNjsIoIntInA50JXv4oiNHAsHywwL2lhxYI8HT/T
	X/mK+QYVbDJ4Qrbvc0W9v7xW0ycnXY8Dr9itoAshsNui8w/xXP4XAn87GnJbCovn
	poxtuBbUY0WXRjbpDJcl9ISYAcR5BrkUgg6fSncTCsj7x58U2Uqngv+Gjqhb74LT
	SGNXUg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hhxbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:16:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso5471045b3a.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778764609; x=1779369409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fctHXbGxI63yquHiTvFAqh3nJ5cncAR/B675vKBXMU=;
        b=NS92vSc5iWiWmMTPtgTH66uQNHvoY2RYdhy7KTIDHkk+zY0Fi2lFdaN6kRGdb61/gb
         wGm8rEb47h4pToNOjybDBaXNy/gcnvYPmW2+RkYrWh6p0djEbhK6wkxbk49ETFngP2iR
         NSrEM4H3zgZLz/KvL5Hw4QNqKWOfxNLdMtuC5IvuYLHmnVeQT8cO9aE1TLJ+MBxwgLYl
         LEQi1KQUKvRdKyW6fOH+pOna4yTZFmOFNO8UZsKM/8ccG8V0xIxSeGc9f2vKG9XJtU/u
         bE090ztqBmCVo/T5ufNRBs18su4Aefsg4TtVS7GZCpN7jC+wtBzHpnWNsN3Y3BzHGope
         0veA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764609; x=1779369409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8fctHXbGxI63yquHiTvFAqh3nJ5cncAR/B675vKBXMU=;
        b=Bh4dqETl5d37BrTUjhep4Kk/B4Hg9KKsJGaCsSSiQgZzbpcl8C67jhjgfmGs4jaxug
         J60W8I4YhE0noMG0ytEru7L81cWgWfKLwFXT/vTFXZ7xzy9bMMxZi/kbEJtn07RW5cX2
         B/yErunHYDX3yKyik1GIbWR1xBWi6q+lzqDcxy5HhwUVw5LF9tRssLrF0Eql9nPYiETF
         bCx1PUd8CpaQ4JmLIENzodD4Eyef0iWqDmaascZVgAj1qU1hYLBGZXinV71HceOSDJVJ
         yK4G5d48abmy/5DzejIp7hO51sSdA+NgnzUvmXVJFA2QMW/ElL1gUR+Ss4Q4z3/V4FdN
         lc0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+GQrtbgxJmz6JZNuvfmIKvERkNP3b+jUsZ2HjAJewDb7zlISKbfCkw2dboClc8WovGsHPTnwhVPDT9@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAR+IDS598dlq21HhrKXjgoP0DhSgqHm+bOOvtuZo/TQ18H3B
	cHXqv8cgAz7T8x/b7gErQEqRPx5UsQ6j1dARgnkH8opDpugZkaghc8YfJApAu6nJGOPDFYdgret
	xikla6iatijeGH+l7emZS/12Tcgd5qBSsa28QCieAJ9Je2kMXxW+Wlxmg83GRlNLf
X-Gm-Gg: Acq92OFx/IhLejLCsqQwSiO5AlGejsaItJYVRR9Q48ft1akMVeyPxzj6QpM5MWWqURE
	3UF4y3SlT97/Dsvozw7mbsTF4Pz5xKRk9TDMomFXhRyf2OscoWCa6wkTrr6nJ5EIZcdSO5gbgL3
	WmAEsX9mUNhxPvFZvO8vdd76R8BRW/pPe54NjS/4DBos8+d2ogSarikwcj5k/G5WRd8BL3YBLrb
	yz1Lnat0jSCjn6/+xxZmk5e14gJwsfwbxmO/BUKMuxbh6+/h8ejV4pgitkua2c51dew3+3gJZAu
	P9cLIZ+5nBCgYGMlYDgFXMkYGwGh49+3NOIJ15vOKWt+qjoWZG/Plx3ir6ZiENTX7tq8lMwHTM4
	R+hzzZmTJOUvJwAxvAW0j18KibNRTc6m31eWMcvG20+SMgx7iJyzflgk=
X-Received: by 2002:a05:6a00:4509:b0:837:db9d:9606 with SMTP id d2e1a72fcca58-83f042903d4mr8160276b3a.23.1778764609130;
        Thu, 14 May 2026 06:16:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4509:b0:837:db9d:9606 with SMTP id d2e1a72fcca58-83f042903d4mr8160225b3a.23.1778764608625;
        Thu, 14 May 2026 06:16:48 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm2666656b3a.43.2026.05.14.06.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:16:48 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:46:25 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add TRNG support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-shikra_rng-v1-2-4ea721a1429a@oss.qualcomm.com>
References: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
In-Reply-To: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: mv-Hl_zUTwhMie2JRRpMRPKmmkNaYK4J
X-Proofpoint-ORIG-GUID: mv-Hl_zUTwhMie2JRRpMRPKmmkNaYK4J
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a05cb42 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=h2DT8ufvGNBHFgdSJ10A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMyBTYWx0ZWRfXyn6dRm+x1M3o
 nz7cvNWEwi2iQEZ5ayqmIdiSjHEMUuZui+ZnhzT87y7ARky7BxPK0f7VyvR9cb+kAniD14+S/62
 YsuFAZSG24kZBL8bPY5bDFH9JwGpfowXKpJZi23SoHSAg0orJAvsUybV2da+5YRHCReo/LuEnn7
 XQYh4M8wzUW01VKa28Z5PC9ji+uaXNI9pBCoXOLLsFeMpAkZy5VTOtUlz55T/CGCaINGYwaEk0f
 u40cakuDrm/6os7tb65pD9pgOygtGEp6AXZ9VFdzwXBYi4Cbt45a3906A9cFMO0BuJBCwf1UP5c
 cFvkSPtWslC9vLLAQxJqR1P40Ow/1uXRvwNOCQkvhThuyt4CgUTRk07Cs/Yz7QDfm0A7zanDaGA
 PwKv+V3DjW6rBZJLvtv+Lkep7oeswWoUoJvqzPs6eKhr6ckMXks4T8XJqWpbxGbRmDKXRNPqT3l
 GUYW4LPh8awFJ8XXdxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140133

Add True Random Number Generator(TRNG) node for shikra.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 262c488add1e..e81210254ba4 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -580,6 +580,11 @@ spmi_bus: spmi@1c40000 {
 			qcom,ee = <0>;
 		};
 
+		rng: rng@4454000 {
+			compatible = "qcom,shikra-trng", "qcom,trng";
+			reg = <0 0x04454000 0 0x1000>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;

-- 
2.34.1

