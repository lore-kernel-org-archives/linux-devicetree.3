Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985430;
	b=PEdIrDu20bLLw16arco5/XuX2EvUCngaMIzPTVcnmf1ijNZAgLqUpvOZ67pFduuJxb66
	 wo+WWeE6N+6e+HKh6alFrO1z35XM4wsg71rBwMlxFp6eYwt+UhieOf1BvMeY5S4WXLiFb
	 VceNRK1Ez2+KaDPr3LdDWOb3U6NWjC1ITQhy7zZAzI6mW8Fkrm3WM+YVxyRfyAfiQzwRQ
	 SAIhJ5QXrcfEZKwxo0IJHd0pYi2DYpGhX1g8mJNa0uUFZrUr/+UAGcTa+bAuV1X490HBV
	 BoXfidD8YrOXqfIOLIPeBEORyQSetE/qZ74ji/Wx4Sli2oUG1PSORsZnaZ0we2SesHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=;
	b=A9sKiTlv4cQzvpJgIzf6HBZxT/wR2e061dSkOSejSGBnMcsCmxXEyc/jG0D8qcJOCFkX
	 08HSyEiHgvdQxM19ogRoEsb0JJPNW/A2yls6JIfCbx3yzqB+YYGhsiuaKkeWBWj0n1nHE
	 A/7rVmc9iWDva/E9MLFiOk9kicMKeNfZkelPQ+KeXyUeW0eWzFk7e+ndKtvXOEl2+21Xd
	 sT4/7ComTnjIEKU/FCH6eQ2YFiG9PZbbO4gQ2empqoAwuU6Rq+QVg0xfhm6rdVd+3s2nc
	 dMA4mLwo3WJZSEfhzgB8NqolWyZhAmEsU/UsxikqB82IycGbBfiMM3Q4JlpUk4bQjxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WdXe2tDZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFM8MqLq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B46606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B46606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WdXe2tDZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFM8MqLq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvEu2453547
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=; b=WdXe2tDZ7AO7Dnmk
	un24RsBpgcptwArLeHZdZcJgWS9PpKr6H/ciP72hTBPG70SbDhmVShXoUC60Ne3f
	UFeoI4t8KykS/UjBiOk/pIGbfkiEiQHTJIZf6S3HjMCO0zp3cRRxBd4dwA5//ao0
	99MKczL3hODhJ+Z6eoyl3WJP3P6lyWI2uM9Qw2C15qFCrKWV00j32wbRZ7PmiGin
	bii6UqvLtUp5lWAv4VInwx0Qw2/EHjIZmGs/cYhsay6o4f2k2r6eroHDOQUbpxsi
	MF74hikY44h6NwxJ2pTNohT7zQbwhTvVQ9jong3JiyhR4Zieqog2Sz59AwDOfxBv
	HOl8MQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99pn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e987ec84afso5988635ad.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985428; x=1795590228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=;
        b=CFM8MqLqWL2fde2SIJ8TLdaxcAH3pP8/ANJNeuzbMkkpWzCPS9fAE/rbw47crgXCvr
         84FtaQX2R0sox42PfvadWid9SQfZFWReNark60unUMkzj3jEw798u1I30N9DthGhMR6M
         1UWQFATTwz+GKfdvl0e/OZQndMkgryIEWZQHDP43smhs1/8YJ3vmjMG+seqR3XTMpMVM
         fYFPJbNToxcieTBLR2xgRkd2jlqa7dCfX+itwIoIKXZng5iR+9p5H9Ov85I4KntQPaIw
         rZ5dfXcbx46M6du10elO/XE0LUEKLjjjozvIdk7/AOyprtW6QT62N61XjZv1aBQWkC4i
         vdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985428; x=1795590228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=;
        b=nUomiBxjQ3p0jkzptvFnnXTt4DlszHVTfTcW+yUMqkrt296Zt4RVrmLB2PuB5EbJKK
         EqxmjCO3t7HgKg8zfS7IdaxGAUFRy6eVTSEaUZ+kjVR95RpIP6tB4WhR0h26iFk+KCLD
         SLwJCmdLNkMAkgMdpRneSgXRXF+BFfGB438wJ+A8ofv8q+hwQxZhWr0v9oNQ9K/LaH6U
         FGzxHo+9sNsx4EYesYbUWV0bE9aqueR6WwuH39URxAe7MUTw/xw6IlilPN/5v9HkM/Ud
         kNZ79HiMWNKBPn5+5TmQuXDsxkAri5Fm8zekCrNn75dyTbD1NKWvZBJxAqy4ZOfy2mBW
         lAJA==
X-Forwarded-Encrypted: i=1; AL+hErFxQJ/B6xUbNFXdCZFt1adQYOG64aAF0YVA7Dkd2tqFNd9n5GkSqbWTyr3/EJsGbf/EAVIqBXYWR7if@vger.kernel.org
X-Gm-Message-State: APuU4Z9P7XXRAr4QPyMSMQEvyXZzniO/lxeGrmdQnqMWsjaZbDkdDyKf
	td0lB4sjk5pV+upyRqGkPkdZqyWfR0H8u9wYYfwHFQF4HsG22hzXWbQ5RCJjJYpR4btX2VPK1Ec
	hK4EMISif5eodKQD7X2QL7b3M3cOXeBTeYQ8euMiXsVE4+saZqgufc3Pubs/rFwZY
X-Gm-Gg: AZFdTZd7w/wDfH0+OOO6hAD9TaHfBat87IjUgdwkXocEqkrnaqG4nRxnk4vz+0FeDT/
	p+Yn4AakrLC+OM2q21nPPCcDLDMFVm6+04e7WAQRmv+jDrLpaJfV1/DRDnsf7LVys9rNXV16CY6
	P2cey+7Zsnx+vG4HmuOQkrT7WV7vSMwbpE5drps7gdomnK1HtB+s2rPk12FAEIfCGKNyvrJipmR
	TrHP+Fwl7Ofb6qggnOP4HtH5/LciPtdyalz/Q8V0gsu5UofOeV/xKvCA+nkPjIXu/H0eAbn5PO+
	mfEaYonU5A/z9ojrjP/n6IUXadk5wJeLoJqxkF7IgCpxN4xHUapfTxP/7GzxMMW6PPosZSBXUkM
	VlvB4GXJ5P8fL5ZFdEHSm7i5/Vx7yUWujfL6NenvvCFgVNXiMKct2pS0GvWQcNTdwPs3vUz9wQV
	YJkUeUyZi2wZKxuJuvVqRG0AYHxouAetORxU54
X-Received: by 2002:a17:903:32c1:b0:2e9:79db:449c with SMTP id d9443c01a7336-2eff758e055mr14931175ad.47.1794985427887;
        Tue, 17 Nov 2026 23:03:47 -0800 (PST)
X-Received: by 2002:a17:903:32c1:b0:2e9:79db:449c with SMTP id d9443c01a7336-2eff758e055mr14930935ad.47.1794985427423;
        Tue, 17 Nov 2026 23:03:47 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:46 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:46 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
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
Message-Id: <20261118-fix-tracenoc-probe-v1-4-0298dc5f05ac@oss.qualcomm.com>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=1737;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=mkChMr5QJ/I0Rmy95rl3BK7GGoBPcuQy2FyYA5pTSnM=;
 b=Bs0qa1GAKffiP3TzUW1yvs8s3AtA3FM3Teo4ZoHZqa3aWneuzLoi+acavijCagjS60VI3FNG6
 cbJ/3P1xwDvCdDipCwe98kdwXeJ5/P9mnqV+1mZ//dZpPW7Ja6K4VmE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX5zKyhYe9JNQS
 Z6DwezlMdHpRO52F0usAzMlZe/9ScsX1Y5Mh3+z0+jHmQ1MnxaZWAsMm3VAcysqYN38JNDpAoD/
 7UD1dTbek0h9DdSuxVbutR8tGhFJePc=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd4dd4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXy+PDDGHjG2dq
 cbS4TkFXtnjEqdnRccFgAo+mzcnyG+9bqsFUTcKWp+FKIBWsfqnGH3OTC0cXUBKrunOSamshvF6
 DkCw5zRYk5bbQox9Dx8DyKFpdw/eutCs+sVfJbQaPYYIc0OuhhEZSOjCfo5JKSTT+PUcVhzja/V
 231rumbDVxiV6vSVVOJtYWraQ/bg/0sd7mRpeXWCGtVxbV3aMB9d+yFpRXVOyXjt9LJnVibiJgb
 XSuNNAhH7LXxb/rWylIoF51gPQGuO+C9G8IgP8ofj+NY6GatnFcT4eFTU6CFOLiaMyHvHXFmvDf
 L6AxHMs2qrKQOOMMLpqhCa+vmbXXrUfafUlf46if2ilezm6mMMJKNif7xTQMcNEX4krNpzOFnRQ
 2g/sxlwFzuQYd3m2tE1SidSw/4q6YOh9eqOJ8Pt4/RB8wyr/B0TxfBFnEBJ25iyXDKN+ciDGAQ/
 myUYthipAFRx/G7NmbA==
X-Proofpoint-ORIG-GUID: Q1nmNKwvUJk5mdnvhZ__FDq4k-GxdmM1
X-Proofpoint-GUID: Q1nmNKwvUJk5mdnvhZ__FDq4k-GxdmM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It was marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
an ATID. As a result the aggregator had no trace ID and could not tag the
merged trace.

Switch the node to "qcom,coresight-tnoc", "arm,primecell" so it is
described as the Aggregator TNOC it is and is assigned a system trace ID.
Rename the node to "tn" and use the "apb_pclk" clock name as required by
the Aggregator TNOC binding.

The Component ID returned by the hardware is 0x00000000 instead of a
valid AMBA Component ID, which would make the AMBA probe fail, so also add
the "arm,primecell-periphid" property to have the AMBA bus use the
specified peripheral ID instead of reading it from the device.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f..323207989d25 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -7389,12 +7389,14 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000 {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
+
+			arm,primecell-periphid = <0x000f0c00>;
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1

