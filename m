Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD81F33F589
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569516; cv=none; b=AVzhFfbEZmVQtjlCW6DXUr8oIWVEU1yn1bzPtmEnXgb8av6tUlg0Sfv8p5UUZESk7VAgyO8tXFXwEydXvabuF112hOsOdq68AuE9GhnvPQ014yu06yDL4VigQYs0blaPnBJ9GaryaCleObGgc1hIjHrAgyH0n5EEc+4QGKrw4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569516; c=relaxed/simple;
	bh=9AXM41c/CFmxW6CjzvCZjX4c4mZQ3fsXpGmcF6Ejg+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZSPOx6mboKkp91K1qUO+MVQL6gp+F7GXPXfMYdnxMLI3mKCAdRgr4HV/HcuhnDsvH1J4mZhWuMYVa0Db6rd3O6z4tvzvJeI6sxjxlpuR92VHkm1LeEJ4s/7ZjmVNFOULbgNT20dkFQNfBqou1hWdgcaxQHku6fyF08Z+8bhcDV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RREybyxY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DU5XFf8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RREybyxY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DU5XFf8W"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5PNpK2172834
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WoFn2XA+69GleLNnsHwn+2x0S5QjMtSmGgBjROqAkvQ=; b=RREybyxYBRFrldZp
	So6ufbghC/w8WFu7Dh3+UV+ip/NQ6UH0tHD3UdPBxbMvD9FlLAjH360CzyX1oHw3
	WXmGtldhr98oBTnYm7OB37cdevTyor7bWj0zEwqFIPPu/qprakDRI7CJwQzert9m
	8/M/Jy8sSxqWztFTA/C9GQ7ct9mAL6p6sRfpqIW1tIdUZEmtrmoTeeHSbW2LTgmu
	LOQVDRKkXIYbfiD++g5ELFZt6AwLJBzkEtAkDp2N/UsOVwsLI2Fwx6kkfGLxC0t7
	fksEpB89lB9fl8Ncua9SkVn246o50qenQrvibv/yYZ3jqkRyJiY6DXPlqOn2JJ5l
	owOwug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvj9yp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:05:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so3213267a12.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778569509; x=1779174309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoFn2XA+69GleLNnsHwn+2x0S5QjMtSmGgBjROqAkvQ=;
        b=DU5XFf8W5inLYAak9xL2OJ3//lwkA7tGr/iDxMWitKYdovVK6a1dqz5312DdA8Vvce
         UOwjJvzoV1L2mnWd0T8BmK1OAq+1RyU/AoUJGg2EDXPA+HMuZrppiTujTP0uM/IeBvCd
         wKJ+XB5cEWbru9o840bI4uD7k7zqgZQCN/82afQlWlom7wLXJUiG7+rKkJZl0eW5tBuq
         BJvqSasAopDlb/RSavT+u2yLLuy/T1fuS01jQqGsrpfPXcADtp9PhDJ979Z5B2jU86jb
         dMI7e773/zS6uVUVgzIdUvoAqThFBzkZnOgt/Qs57bTjyfh8EzFXGZoloPeCsfCS/GLx
         PBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569509; x=1779174309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WoFn2XA+69GleLNnsHwn+2x0S5QjMtSmGgBjROqAkvQ=;
        b=eIgebS+VIlG7tzskuharEbfo8hCoTXY5fjK0gdPoyBd9c4W+ZcijCgAw4+TalmXJAW
         C4fUOEBVSiSS5jkfm/2Zsaeu/zsLxCI5Im7LkO/1267sTDGPb14ODMsYP2rrKx/vCrqe
         zCOax7Uzylt5nDEUdceGz4Mqkbj1BmHlopRS2xMvLhfwAxwx4yO4sNXXXgVC2Tf0F/i2
         L7UC91eGSovIfIqhVdrQpNoyXEx/3auKVSztS5fKeFDFt7gZ24kI/By6LcvEFRx59oOB
         DpqqL2MYxdzu4lKyrubMQR0yGC0hFiBtv2ZZqnLMm7V7w5D6Td6+uN+kemd3L9poc768
         oa9g==
X-Forwarded-Encrypted: i=1; AFNElJ/jh4/BvDKp8KlqzJzEMo0QVV01awTwaEYmzWOutsExbBue3JFesaNmGt2QHykPl97K/8vVOkfdwJYb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj6YqC3uCMJ4T2w6EwhFAtU6YHEAhdH6PYZSzI0RvPlxB9lwCG
	OqQ28YnrBDj9GlyTAktUQZqsZ478WUIQ/vntXGRnmUp3lHpXJS0M13tjA2tz64RDIbgIqTZ3vyy
	Ch4e6P+Jxbvg4B8YLhbwYOEDx5lynTv6v+Ru6te+9LhTTfA+s26gf/hx5HKBQBSnf
X-Gm-Gg: Acq92OHQyf8oBSTEOJ0Z1YnWQuhegVV94mZWNGYU4qlnUoGxXJemsvoCY390js915wz
	Mzw3IIyUIZe2ynVD7tenUGew/6w5HhbD08bnFhetkLd0/mckDGFYi7a9rXnXZd96yYqeEHtNPME
	rGtBnO830E33FnBQw4qbs/FQixXljLs66cGJydhtUSvVrxTKORj+dJ7aS9RO9hizUhyhk6uCTP0
	+NI4cC0cBeEqqKsu/jjALoFbD1qce7i//CSOjYtPhYUXO0PHPnbnPI+lW5FZDqW8g53abZt0qjy
	Kqv4cUuWv+g5kC+R8IDAcqtdzYEftuGD3W5SLkjdA3wHTjkqIznxVNLt3r76ShgbOVQfmGdzP7H
	OPGQ86n52mLfoVhMkPZKhiNS+mEV+Tpy89BOwFDCZnOV/TsIZa3IlLP78xlQozSF3g+TQ+Ujid0
	f+zZwe4ZY7btwfq1eoIrgrGJ/Z2GJQ2VMcdiD9A7RSmawXDLcpvjpiI0T+
X-Received: by 2002:a05:6a20:2449:b0:398:8ea8:5f9f with SMTP id adf61e73a8af0-3acd42a9bd6mr2567052637.16.1778569509276;
        Tue, 12 May 2026 00:05:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:2449:b0:398:8ea8:5f9f with SMTP id adf61e73a8af0-3acd42a9bd6mr2567019637.16.1778569508771;
        Tue, 12 May 2026 00:05:08 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711b21sm11354488a12.15.2026.05.12.00.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:05:08 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:34:55 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: ipq9650: add the download mode
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-ipq9650_more_dev_support-v1-2-c4c627351d80@oss.qualcomm.com>
References: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778569496; l=1000;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=9AXM41c/CFmxW6CjzvCZjX4c4mZQ3fsXpGmcF6Ejg+s=;
 b=E8hqeMEzp+28XhECNKkjcJmWns5SyV7R8IptXYFhS1W9keYOtqLhTGBQj9zgEHU4iNo4BsN0G
 9wtSyb1km47Ba/X/Bf5OixwVT6UaDuhAlx9vS0HX8ml6lVb+LNn64sk
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: gKzNIjMuNAiBfw6ucgGPF4Z2JinxejRi
X-Proofpoint-GUID: gKzNIjMuNAiBfw6ucgGPF4Z2JinxejRi
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a02d126 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HaTVWnLGvC5sb4-HCggA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NyBTYWx0ZWRfX8z3Fze+OFMYi
 jd1uG2ZV+jWMB2x/oznt6Iokctkfhr+E1Bl2rCtQ/wSDQHjGC5OtieS8wtpv9K+QcvO3DdHqEDB
 SQku6dLoIplqTFgmFStsxE1MGYY73w99QIa/EZTCdYeuUL5IG9CjGaR9Bwcz1J9anzjuJ7lWRTD
 Rd9hjtWXlCmLuqzp/aUCwZhl0ZDSloOjAXuGUKJThmW/N4Rmir6WZzopuFvQUd7IjCG2XPPSo+A
 1R93TEaxspCGHL+CoXYSfLrpW9y7agVP81e4PdJBYQuF3Ht6JRWuKRzegy17+8DxFI08GYoRIPW
 egLH55Wc60429ZWufaKSRX39C6Un1pwfWOv8K11zYR+yWihsvnl8LTuJDFH/+nMgtqXzZbnW4DK
 eLr1SGC8iVVm+XhwhuQIvsFj6pX19fWpM0n1HLqAZYrIAEUnFkSfHi25cmB/jkD4dwzuSJPmhbX
 BSoYxISSvybPsIDgBYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120067

Enable support for download mode to collect RAM dumps in case
of system crash, facilitating post mortem analysis.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 3e7527609591..1f7f547ad550 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -140,6 +140,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq9650", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -233,6 +234,11 @@ tcsr_mutex: hwlock@1917000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq9650", "syscon";
+			reg = <0x0 0x01937000 0x0 0x37000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

