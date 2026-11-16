Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827010;
	b=dicHfBbYQZ1Fd4WKtQLbbpMJ5XFN4NyRhq1O2rHTLaEmICO1qJdfeAq3p4JXsQS7zfYQ
	 yhxDfQQ/jx7l50spjBStK7LZCRMHJ6QoaQe5Du6bCDg8yTKYmRMj/RrV5XX2UFYObEUbq
	 tf2LcCSbLD7Uh3M70AOdPXMB2dS3c/qp+ydY1VbZOM1gEgsM3zjg0fA3isrrBCDiLxzch
	 cKCW0F+wu++dh+P4CKZnd2uduUMJaEDYGr9zQbjjr1GbEqdxk61mey9jD1x68+Cy94ksF
	 vsMM7uFdw4BQ2VFRorSXI3T7GzNxGFDCW7S8zkwgQ9z14qrtAuDA/jEBhtEJyCrj4rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
	b=P53GqZVwWXvsFiEbBrXLf69PNehQZnPJhJ8npWB5YCvp5rpIF8nWjRpEAM5XToE8zCPM
	 /Fo1x92UvyJs8HQEGdDEJaLrjmehEI/PgVO+Ec++Pfh2xvN1M6/D+SDGx3YGVy2+twX3D
	 Kh2BZvjOmtgphaDeUdKMDu1URPveHKFugEfBvcqW/OafJ91uhmu3x26x/+rgNFaezP1AK
	 MpXdmwenLqD7Z0IWQymqEMrWl/M6T637gX5AXiqkwYpbzkbjAvEMsM3hDxU76sISQWgAu
	 fSseDx17vELEfYo0HQDA1SY3wT/xTcY/EeeegzPmV7ERwAtqKR1la5uOaqCmTmJzadQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8UMAqiD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYGqMBa0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05330606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05330606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8UMAqiD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYGqMBa0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7exdF3488793
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1ng8Ocvz7fCDJlR+ot4zgt
	aeJUok4UFUIh130ek/3jE=; b=g8UMAqiDvzWqaJx+jr9HP3VmQrajYOcDXvunfs
	KQ+ho6F+A9hm2V8ey1jBA6nFNSld+eJGyv4NRKt/GZoZ7Ez6EYt8r3R2WVbUihZs
	xcCPv7V9KSqRu3gtCBYmI/sIBi+NbsrG4xc2Z+4kTXqhnwGT8DxwVuJgQKRiOPbI
	JPLMKef6fj3k7KIa1jerUQ6sAteybHHuJzhImIKPQ7j7EbheBGOqW5JrV3OVd71C
	lMaaOomiZk6x0E3ZyFrE0aiC66q7xRbCRQwTRpZKhgATNd0u8Qo3k7c6TADzsya8
	VT3Y+0qr/18Rydy9BF5y0eAk4vNfB+lcfaX9jLQzyBrAnZTg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmce2kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:03:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a073778890so2512307b3a.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827008; x=1795431808; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
        b=WYGqMBa07TldRM1uVVNJh/WuGNYpnZ2AKIamy6p6aVt05UbGyb906tbRUFhQLWka0L
         rHfWCw0ftNUH59/Lu+dQEJKY9v+0VrHKeuXSpemaeEgRqYju8wVLI1yK7P6GZRBNXt+B
         tvCk/pITpQNCLw0YXij7ihv7FiVG1hFJ2CDOdooAKxlMrwtkNNRFYnCRE/T/BqMIDydy
         /ej2ohnHXyEanE0qW9/Vev82s4TFsOMKmHo+UD0IRJnVKyUvAcS5j/2Bto8vdFdgZi4e
         xoOJpASAzqN6b6eZUS0wXN0Yws8MK5QArwV44sCNdFFlULwNu7VWnDn+fJrWC7z/Cu9e
         iBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827008; x=1795431808;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
        b=AOAKi+OK3w6TDGCpHraVBgdTkmKmPSmue0kP9PwjkosIsbunS/MtW4q6rjAzRRQjj7
         n7BD/u5XwbJjZbrR4gZOJ4RDbEyLQ02Sq+U3M2G2HBVz5PtMnczsZS9Oi/YdbAMLa2AT
         Z28/2ufJE1Qf3JtKs59fXJJClt9nKr086QJsH3hjt6ichZ5MfRsvc6rgB+gPgOZTm1Jc
         RMTxfXqP9u4IPTpSIaUpyld2TSLgBE8EXJAbIkxOwtHE/9CvYbcOXDPvgau8g3ahszSX
         qYZYE3URXxFspU/Gx4E4Gz+0PVoSQ0SF/SbPwjZwREYVQcv8weQQObqR3XBNVFQubaZ2
         rpow==
X-Forwarded-Encrypted: i=1; AL+hErFxRIsMlWOfEGTOYnaf4WqAoq/vbCr6gBU1Ptbjb+jYq836CF4OZ4Ls6NpGerU9BPH1MFZn8zVYn0xa@vger.kernel.org
X-Gm-Message-State: APuU4Z+eZ50cIy6sjy+gw6QTkzIPAXqBAmDJRDkLfuwwBk4W4g4WkPYn
	5V5ZNN+QNk0FbHS6fAXO6LkY469ObLWUBoXj/waUo03I/IvgX4zyqyBXr4LHoxWjMad2FVIlYit
	+ch/ocsMcrt7keN2uIPoIajc9SgAnPdgVo9EoTTqboEq7V8EH0virH6p3BStPN6M9
X-Gm-Gg: AYBFou16oJgcDNMhWJGFPvS1uGBxUkTHE41lUB0Ax2rKFbocW70vO+1Hb9N4v1nrvsc
	yloT7RBdmb7yv3E2lGyApWAH9Ve2TamWcXC9pBfd0gAwXSd6v5yNdADfMWg6KnxbrhzolI/XCCQ
	KRYBHkK1vtFlh+Lb86e8018U27JIUesLbcK1Z5nQwlumNqJi76L2uyP3qYnWoD+CzPh3hz0GQQC
	l1nvM09bCeFj4f8o/bOBGHzpr6GNmhc+LLDSb0G9ZwPUYorg6gT9ix3gzlgjx9bRV1fpVi8aa5w
	xYZUpq3AGvvnZUqTve1AmXGVzuWRWe2NcSmCyE4V/Q+2GJzVJjHmJ4gCNz3qvMR96S3IxyN3yUV
	4BTRQrKYb2KG5zaicckUZBc0BgCnIf2AB6klN2L/tcx3rrKKiUvVLoE4oo7Q/rDNO63ZVXdXk9U
	RMfVeDF9CmGYgc6flG19Vb0ftre8MANNECYbA=
X-Received: by 2002:a05:6a00:1995:b0:8b6:d2f:72ae with SMTP id d2e1a72fcca58-8beb53d9ea2mr10042030b3a.18.1794827008538;
        Mon, 16 Nov 2026 03:03:28 -0800 (PST)
X-Received: by 2002:a05:6a00:1995:b0:8b6:d2f:72ae with SMTP id d2e1a72fcca58-8beb53d9ea2mr10041988b3a.18.1794827008017;
        Mon, 16 Nov 2026 03:03:28 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8121sm3499779b3a.20.2026.11.16.03.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:03:27 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 19:03:01 +0800
Subject: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
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
Message-Id: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOXi+moC/x3MQQqDMBAF0KvIrBtoRK3tVYqEMRn1Y9EyI1IQ7
 97g8m3eQSYKMXoVB6nsMKxLhr8VFCdeRnFI2VTey8Z737gE4/4jQWFxD3FDGFYNNmFWdvWj4ti
 2zzoJUy6+KgN+V//uzvMPM4fa9m4AAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794827003; l=997;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=odo/rV5qNFliIRkRRmj1dui5NiNAsjMnmpo8SoR/RjQ=;
 b=jknWsnBgy2n9uBICUy4HdpeRPU1LJHz5YpX8UZFlu17CDjHJA2PIRahJc+OKyVYSSiUj8Auce
 386loIbS9/fAuK6x48tCWT21m5rC5Wn4c8VOUfzCuS7dw/jkvAbjkMV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX+EwZPV3TZViV
 lBfSXvXIJfTB5MPtb8CDA2H1g76bcbF8MmRsvprxzKcucCQrjai7k/z78wGS6TZgBT0csN8ATwt
 MfuNNR9GNsCZJoBzX1GJL9ywRg3hwWs=
X-Proofpoint-ORIG-GUID: qYm_gbY0HISZo58thjowOiVTpqWaS5FK
X-Proofpoint-GUID: qYm_gbY0HISZo58thjowOiVTpqWaS5FK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX7A7aND+L2czx
 JQ6vhxDVkiQlNQWvMPtLK5oR8XgxiS4SST2t/AtrBdEjEskVQ3UX6Kqwac59cbJzC7mpoCVGnOg
 LBuaXfmxNTHEyQuugNBTrmtj7V5bMAFZ01JYJqx/T5i0Hfci87DGT6dGco6hef0ucfFuXPVsHjW
 cXHD0kokh2hZnqt8BoLxDXLKaiVqgjpd/0OFxLXbwKaTdQCVh0CYY+QETFOUIYcctnFi79DlGrd
 VwXSYC3cPFM8JZVh4vFP3l6BHRQoP+uymO/eutoslNwod6Cqn5kW6X7qQKSHJCZnPZRmnRu/Z4D
 j0mZsIiF44Kcy3c/qMQ84ApPcLXqhD+wM5oK3i/RHzIJg2cawABoJOAsYDAKN1GsoGU3zKVhuTz
 Ysyxn5ESIZWG7T/WOi3PtgAllbCENjpFsQV26ZKkgZcZCZcwdA1EjJI3XzgjswCb8uplGHzoEZ4
 wuAe9umjNtAEn59bExQ==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afae301 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r7GndIfPiZ8jbtywizEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160043

The cti_riscv device is suspected to have a clock vote issue on the
KVM enabled path, which causes the device to crash during bootup. Mark
the node with status = "fail" for now to avoid the crash.

Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..5f5a786fbd2c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3996,6 +3996,7 @@ cti@982b000 {
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
 			clock-names = "apb_pclk";
 			label = "cti_riscv";
+			status = "fail";
 		};
 
 		tpdm@9860000 {

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

