Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143958;
	b=T4fwrdb0oxUUOtUEzM5GNFjik8RsJIsQBZjfccTsG+1M/49iV9U/t1zodJHTscHqOx5c
	 oZ1EXEKdejMWgO03Cx7Dz4b1a4RezH/JLN7i7gmi6C5Yf/aLrjR9Msl7rYcedWrCd1M7S
	 3h2cy08LuAw50CuYr8CgyF+dZqOVqO7PXELfqgwyAOe7OksH0YNL7wCSLu2iIlqNmTKyr
	 BYD4Dq34uboQzyT/2mCu0WiWvSk9z/qsIjy/Ad2VrmAFtqGkefmEI//ni1j0vsLkK0+7x
	 RKC3clFQ1mkufgSIBrFurlzP4PPcv3DR9p4RkQeb53pcY9WiG3Pwa4/KCVkJ+Ne8zDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=;
	b=0BqRvLMrdCmsqiPptQUnOnCrLkm0EHjVcB44Hfpcww48XEO6pvrUEMRh7bB8OHCev4eP
	 QpsRgNC0e1hkkAtonEHZEA4c81FE1h2iuw9XLt8YxJWukVqVRsIJI5+i/ujb+J0PKhRSr
	 CfnGS0DtXHiM0sJMH5d1851khGQJDhU6ApZvFoDgnv58Mnt1bdEKpxu6iLTBtP7C7hbH3
	 IYwM8a2DgDXpwoqWecFbyXREnk900rYV0K0sAf91bl3sa6X0HUOMFVIAr+ACSwquGyo18
	 lfdauXDGFFtDtB5PoCE8HdZTRXoqTanuFZtUvCyHhgkOpNY1yfVyl2RCJ7BHiRygs2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gZaDpRYk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFPD2K6s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D8C606A33B
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D8C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gZaDpRYk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFPD2K6s
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AgRoC284091
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=; b=gZaDpRYkMHh0Ss5e
	j+StO+2Q5fi9WoSckpNGxZdDF7nzVTeNZG3ICQ5Aqx92+rKbMhNFVf0H8Ac76LYw
	1bWjeL67DpdGQRxyyurDaUoTI9J8s0vOW04e7+PEaxo/KqPIzUBc+EEjK0C8L15A
	PFC6yULyxht6u0e6joYzAp7U+pI0ui0pJnhua0WYL/+EV7IcttPR6DLGezdj/lZR
	fqoCBbZYnkR49cx3kk42FN8dVrEfXoMSStKoxr/fH3W9IzZgoxcD8WV2OTKwiYdI
	3j62I17vVT908+yM7AEKDJJWdXv+lT9YJB8RNNiS7HgyU+uajDT20N5CDHxeLjog
	JfBmxg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99jswb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:19:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so377441c88.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143957; x=1794748757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=;
        b=AFPD2K6sMXtvsgwhYwtNEeKEecgDvwpv1Nc50jnDKr9VdaItzEgN0TuzCSxhHx4Oc/
         rj/w8thcxtvSHkjcXuPa8qqlH9NjU4I1h3M67ScRZHnKjWBQqMiq6oKQjLDhH11iK1P3
         itW+i7+R6Qfqwids2cUPuZo/AMPteJaJ2EM1pVpM9PB65m/stfyVLVAEQeRpDE4XbtCV
         V0ZMMlLtul1CqbTC+RfIZd+URI0+LpoRyJ2kQFAQfJqTgWvfRLRplSXVb4OU67hbiKeK
         Wu4CFZdW9stRkIHvcvExQcD24Ul+AgKOYt10/9eAM3JD9ssFkMgOmvGeGm4jKM3PsYas
         jq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143957; x=1794748757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=;
        b=D20CfK5MtIIqb2jxgLBKhz6mnQKDuGrEykiVihTsIHu/UNhXuZif8EHH15q/MAfXC+
         CFZKujS6ZICDX55zBeObMOR4LYplQUcwgnKF5GnyvphnPvOdCUt9uZXzTO2gBz+p7Fe7
         Z7QaiszDi3gnJNzPI+xE85Giv9gzcVdSIOODcdNvMxTB6CDtif+iALCV1dckOssWeg0f
         fDiYtoG7FezJwvJUPpEOwGZipQrd1ASZXBdDlJIz9DGgox7V/O7qcV/9+lzWg1zIBnUg
         etEXH4jzSmBV9G+WUmq9/faLWa1THnQ2xd9ArntZ2c6cZmEeZFu1rkW4kBj6gUJk8Zje
         K0UA==
X-Forwarded-Encrypted: i=1; AL+hErEt7ZNqR8gqvCmymyDHsU5eyxjc0nCLcA7+wOqCSnd6cXNmBJ8eJq8MryYqW4Bi9uGE701DXedn7cLe@vger.kernel.org
X-Gm-Message-State: APuU4Z9SUk7HKw3457uH4AUqncABMbdwNkiQQfrJ0eTyMP6mAlt4t54C
	oHZoneKB+FDjfX67lk6UqA/95qoMQ6sl/P1oNO4Phrh/t1XaIxhNgyE+02bfIV/UQWUvUR+NlYy
	YSnCTZbz8TEiNaCFTaCvcLvZ19eY6E9ByeBTkF38dDyUI+jrryw7GqknWKyg8b9JJ
X-Gm-Gg: AYBFou3lkNSNpieMIMjHxR6ZgWHs5cjepdpkDg8TGe6dBGrXE8ubGienR/zGP0HU9Pv
	9WaKkaV0L9c208fmmCmiz6cC80a2Lz52Lz+8fbidi+HI+VqkpWIvtXvpEiBZKjMXVPbSyuUBYlt
	U8RtFTeagItMqE+NbyP63UTXo4N3hT5uINm3mGUKi+PmMbcjVLyNaRCoNZOCpn02cKLsywTyQCR
	AuwaOtHw0jQDOcdKnSMSK/CDLk+t1iSDjRUz8ilPRjZEl4LSgtqd8Tg9f8EPdvdsTozwocpVeIZ
	IqEuGONT1Esb5fVCbW4ku2cAtCk5lfB3xr7mXBnhQH884n5FY6LcNA/E79T0dSRyugweOhAy5Gp
	htrvVf+DxL8SVoAE8tUXy0Imi3XbhlnB6o/npuxijZCNT1f8IhAzlhkM7y3QaT9WVadAo16GfPm
	jlFwM=
X-Received: by 2002:a05:7022:5f11:b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b39fe879b7mr1875861c88.15.1794143956874;
        Sun, 08 Nov 2026 05:19:16 -0800 (PST)
X-Received: by 2002:a05:7022:5f11:b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b39fe879b7mr1875834c88.15.1794143956331;
        Sun, 08 Nov 2026 05:19:16 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:15 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:28 +0530
Subject: [PATCH v2 07/10] arm64: dts: qcom: monaco: Add support for TSCSS
 node
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
Message-Id: <20261108-tscss-v2-7-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: PE1zw51HlGaZJ8h_Nn97BjcsW-coDBdu
X-Proofpoint-GUID: PE1zw51HlGaZJ8h_Nn97BjcsW-coDBdu
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af076d5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=03a50ROZyo0H9j-jB2QA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXzFs1V9nd6LuY
 Vf7I3tp1wJd6FlCnR9sDGQSC8aPhE0vZ9UHhOmG0lgUPxRNKdMHjuXLyfp4qDfv/bSFuCNlS3VZ
 nxs/erqhhM3sSXlb9VMx2LLoMf5adsJr0aNxrJGTmTEXocwhc3resvqOcH0JgBdJ7KdaIl296wQ
 L8fpt8CTuJP9Oag3TSIJPiQm5gTheu4zo2FUrDZvpcL71fyXWXtVX8eZo+RJv2FUuHhdDholCSZ
 Uo1xv/GOZY/pJyNfohm0TtJztUudq9vlylELfgTVrSxHpbaNdG8s7U/iZlC1pKlSQ/W/aRnf8K2
 0ADpIlGaYqUZq8a1FIW8m4oFSVbPXepLXiC50JzJNuRLCQG/JPbwY9XKK00wvenLudWhoFQDYEx
 e2VzYF4JxU2d500U2x5F3vFkslXji3OqPqqHax6WGnz/XJl0g2eK1WO8CeOc0xcw5PauZ75CcWt
 jQFGY9j6/2EJipnAOqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXw8+h/lOo7arJ
 fjzQGiP3ppiVsqzMGzVu79K/gngDf/oqETg/usRnYi/SQkviNSmeTHqxQJhkFnZxiYqLaQCqE5F
 d6hPV7zWs/ePWppQFe51CRk1yrDcuPY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Monaco
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..b87ba4b3a5a6 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2628,6 +2628,18 @@ pcie1_phy: phy@1c14000 {
 			status = "disabled";
 		};
 
+		ptp@1c80000 {
+			compatible = "qcom,qcs8300-tscss", "qcom,sa8775p-tscss";
+			reg = <0x0 0x01c80000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+				 <&gcc GCC_TSCSS_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+			assigned-clock-rates = <15625000>;
+		};
+
 		ufs_mem_hc: ufs@1d84000 {
 			compatible = "qcom,qcs8300-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;

-- 
2.34.1

