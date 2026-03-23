Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9C38837D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259428; cv=none; b=GOPsVo6ksCfPzgNjAxk5qZxx5HyjlJSYZG5ilr0wXyZfg31eEXLzLXCpb7pAud/R1OpHFrfvRRSLGFtZ/66afHRyOYfIJShcE1TIM8/y4hb+Gz7SHVFUAAU+3cCJmpueXO3s7BMMjEpjpJCn1iBjxJyCTRvW4/YyhzdxtmNrkD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259428; c=relaxed/simple;
	bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0UM+KntQGAawmAuyZ4LwOhF0PLcBGdZ6v7Jtpr/Jkf5ijgkn9DoNVAtrFbP5A+mq4kcZ05whM97h1C6QHgpbLU9ddvzaZ7BWSKpa3BKLSuOVGhWKrosZStVae1BoySJkSrzT9zR4qgiPG4dMODnYWx1rQveaWUZx+AmRjmN42o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCE01tvS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/kKQSHb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCE01tvS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/kKQSHb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5VcRG930002
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=bCE01tvSrWvcPg6l
	QuWF1UhU6fkcPrb2rKKR2EyuZkD4TsQAcY9qe2Yha37rHrs5yUofLu8DkCiEvm9D
	dpq/HOeVA3/pGFXTpbZabPu1ne3iJCZaMq88hau2VCY/41xPdzuvvQACaiEyjF0v
	5AP1YjbsHd1KLBaQGtPyVs8dWduEk7k5CbRooViVNu65UXnGj65y1NbGOAr5WjhQ
	Mv1cGL5UWu1zlKcAzMIuAqyakBqTnuaI+s7Qloi0oj0YKazRT8pPjQkTO1SzVKB/
	05t+3ZEjxQmuoj+0J8YrODDp5CVEdmEmz0eLNY0GCfUKxjysUrmxs2pGeNIkzGZw
	w+EYnA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kducrtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so3282760a12.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259425; x=1774864225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=d/kKQSHbG/2x3i1Zj6oESE8AuKVhtVS3CVhTmaCpuRLllgOb0yDRkc9U5ETL226vSI
         tBLBwjyu0sXkJpVV4ugSCx2Bh+p3mt5RnjX4/whPuuDZBmeoNWl3v3hrFid9t8nIc8h3
         X/GQj5WG5DDpkRVnEZ6GuNmYV49A5fIqtOCgHn+yFd3dN0YiSpFPfBh/30c14/iKHwmu
         FnuprMd0Hxjj46+oX7jlgsyB0MOEJdtnFB14UbYeTBwJTawEHkKKajJK47I1dbpS4ir4
         k6RWicc1Cn20EosJq7/kRaoKNq1sulMHEncSIHmMa8jGJRfCeKTLPoXFlcKhEGUm46Rn
         EDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259425; x=1774864225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=EGjYZ1kMwMKm3dm4Hf3lqH+NKWHbXoaPlZ8JgJeJpMa4GQxzuM++/oJ6XG2jIWDi8D
         mIbxt+CMvuodETg1hMEH1IqSeoFJsEA8rEPs+dlFBia2As9y1DMXhqA4sduUnBawENxa
         Q9rAt3zPPlPMLWaE/7EKD67D/TJU+wI9VvPx21J0xJwky3klrwR724er5QxJQDC2PlH5
         uVEoMPIXWzy5RcgV3nnyGxUzQZjtR9kh9c8OUHnh+6VFTPFZJ3Fd2Yr5lxBLyonU5Dab
         y0h1rx/Yl7t/0Sfx9NSrWixxK0oKAs8ccHZZBx4lZdNn7fFCQthN0SI+d8/EgdZgFP+3
         3xNg==
X-Forwarded-Encrypted: i=1; AJvYcCWPZ04gm9J0t3tLCp3kbTyT8QBlDAxa2rOOUFRTAeacLgxue3+g0633QqfqWVsGt3EJkvQsgLbpPbet@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/C72qcR2mxDfNly6j862FLPvVUQKurVgMaHUTy0aXxBvtynCu
	l4pMJrOND6jBFXniC03E4T24AvMjXgY+Ssmv0c2sTxBDcPP/dIUQh5hKukPedJ9hBGeZRzrzR2A
	FuWUF3GVAEeY3fju5T63PmJ3dQ8F5Ca09mdVq2mgrizm9WunH/SaQxturV6czg1hb
X-Gm-Gg: ATEYQzyzIiFfC/lhfytVS+ya5LnRkCkJiNc3VKVypdvQcfxRMjiZHlGeuSLs8bshenC
	GPGxJgOiF7g2IIhTufJh+i3LdR3v3PCw46Cj9gpGG6UK5D0/HUIg5sAJbZ+AWA1dERdFn37IbgD
	z3TzdH8ORBqEdguuhKz41DBrhkIJZT+QIyz2KB9mF3QuXhj/erEZbI0+pgrQC7Axof1U2R3zrIy
	Uy1pqZBScJ7rU4gDmNzZld8yH8s2rIRpizpSg5ShNJ3IopYGHH25r5oGaiN65cRvZTslJWlLXxK
	vcQfsb5xnZTi1kfF9Yb3bfahK3AWE6Dog7lhjFqpcbd43cI13GsP96N1z/e3ptMv2JG/EF/Az0Z
	zaAfkWFpxyReZXTN9hGBUE6fe3hXet8ROFBjqpBvyVP4230UdMtvqV6g1uPho4nx/DUYFRhs1ex
	C9j36J8Mn6
X-Received: by 2002:a05:6a21:e082:b0:398:71f2:59dd with SMTP id adf61e73a8af0-39bcf0df18emr9614584637.9.1774259424623;
        Mon, 23 Mar 2026 02:50:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:e082:b0:398:71f2:59dd with SMTP id adf61e73a8af0-39bcf0df18emr9614550637.9.1774259424127;
        Mon, 23 Mar 2026 02:50:24 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:23 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:32 +0800
Subject: [PATCH v16 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-7-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
 b=kKXIWKhLADAUr9KJy3p82eIWtpxUIV/8MOu6/roEzWF1+EwFIeX1+5C+emzLimc1QIZOOYu3/
 wo7Qb6HSAkUDKSzCHF9Nr51Q9mEUiuWPLEJIqUF/83MMsnHZX5bNQgP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX8Y/hivd7QMXk
 1cku3/yOZhl5j6inV6ix4wGnHFxazfaxlhd8+B1Gm2aGrwvidl++AnqSJrWt+gNQgHByXwUI/dj
 W4MPTLsLq093nOiKKWor4UpRuJJlrkUASs7bVzX1yOWspU/7qUVPlhDuBQeYWZ6g30aYr0JpsNR
 Ks+wXeahCO7qdED+ZqgzUIdWX2xLGL8W8pQtnFSH2HDPwURgy77LYfcUVUyG2SxYGZW0r+YKog7
 cdoXxQfl+AJ7XyeyxEQynyZBgRj6ensTlR82pXKhN1csPQMdm11BGUzm+qPALIz6j4rRRleBMzy
 X/iUYl7nvJfSvav+7+AhUjfL3CL0K/X6lWGxLssQJIlE07svUVfulgcjfWb1mNf49HNuyLijNMy
 4GUeyalcGEsZVAsYGHRIVKN5Pz7l0Jttam+I5Lbc0aPJJEho/yRVorX8+zqcYKtg/b7zq/F3w84
 u+/gHrAvl/bePjSOkgA==
X-Proofpoint-ORIG-GUID: qAKjpt5QSkqHsfiHyQKNgG2YL-FmnSHt
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c10ce1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: qAKjpt5QSkqHsfiHyQKNgG2YL-FmnSHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..e8a20789cd58 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

