Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C24848A8
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450922; cv=none; b=nyPdPLv3c+gD1BoMHkgVJY2tESNwhsWqQaj62mRSU8TATifoOD6fMEwM/PpSCwjZxGgSTvJobFXOmqO3fkhMOxmuAtzC9RcM/aBF0T50v7KWiA7v8MHveZ2D1Ik35ISIKSYjko07a+phn2A6qsNu5xM1v6fai+jh7rOtP89a1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450922; c=relaxed/simple;
	bh=IQF4cz+Rpi/wpP0+xNYcy4785qN3FcQI0Q4cCr8mSNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hoyviVy1iJR09V7zWhIF42kPQ1m4FaACAnZ87/BR6APqYwS7POVxH/RsflkQnDzYgY/hco3qUSL7sETZtC43OdjyqPS9QRTmexsdoKl2NT1Ux1gl3hhzZJbs/xe3hv+uVF2EdCIFjEVIgK25IVznqySA3HPEymCpeY859eXbINA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOpPyMga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPAuCphA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOpPyMga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPAuCphA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KBLB1574597
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwaAuuKQkcqcSjfeKVy94YdxpndXpc1raivuSHngRT4=; b=cOpPyMgamQXj0Ifu
	u6TKLMIjJipuP1Wxsi2Ja7l2RhJrk+MRh+AQSmnqxkDZLkA8nsTHe6uMNJj2U014
	O0s6uEFku1lTT9PVjRt2VvdLE77aGvEZTzoa0vcBufQWSg9JYVQSB01GoyeBTSvI
	rnIV7WC/LAoQvtK34Da1Hwp1zIP/OCMzOH4M6YDCIjzbMXBjxlEtHYFMFNUvtF0Y
	pN7UFaoFT2MLdcPxm7fir7PUkSENsePh+PTezu/kmVEHANqNky62KjVLAtv4ZbMk
	WJ6pQUyZoIEHoQUnSNWvV7raG0f5m2qzzU19m22a1XY4XYixn46X45FPi7BKIFYk
	SPXTgQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe524yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:15:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso5151377eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450913; x=1792055713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwaAuuKQkcqcSjfeKVy94YdxpndXpc1raivuSHngRT4=;
        b=aPAuCphAifyp1KMGVmO7YC2Dt1jnTzf/Z6PRGEQHTXT1SWe2dem71rbIDSDq2cNYM4
         c9bDUYFWdpur6Kh9BVCVd8pxumJKDMRYWzHVplJvoEv6mW4ql5Sj2DEiCnOm4PtjQ/iw
         D4zwWN5Yg3EgFXb/maqqp6HmHWGQtOAyUe3fXpQJ+bNS8CI5ESzDrFhEq3JRQafXQekm
         brwzJXwyhxM3tFxApxa+nv+7T7CdwNSlysliFm8UrRUgsFFocLsVm1RktJRhdjT4pEQU
         nGvAJEmLSyzJwyHlB5O0Fnd7Bktwn+Sh5vckvYyix9guJmkQ0yL4i7hlbUpNCrq91Ptk
         9F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450913; x=1792055713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwaAuuKQkcqcSjfeKVy94YdxpndXpc1raivuSHngRT4=;
        b=f69Rr3FixCa3IDExhxomEKB7vTiFOabWMuvv2NRSZTl7WrPZEdUEn4KeH0NVzcL/nx
         cDWwplUbaQFXdoPGzIQ/+SxqKBSuzpuYnM6wARRBFRI0GqQB1/mfSxrLXTo2sgxSIZNC
         apWj2KK/ruPCOw4dKyVWHil7Uy+npH0OY8mnzxsSn2h2+aLb8xwv+putEqs4kKmpHHmd
         8y4LOHcwdPTAh3BV+XctvMSFfoeATyKpdQIfzV6rf7edCs0tewa77gTU+mDHS5KC8fNG
         XcizHa7zdpJLr7Pt48yKuYBrWnPdlOJ54WacmGKPu6YawF8fqNPt6Wz8r51qUcuWT4+y
         HDeg==
X-Forwarded-Encrypted: i=1; AKwUvBwk7Vjqq0Pg0ugCMu4gT1dX1SmOZfnt9ncCI2Y2Fcj+IKDXDQfB8472AnLWotfPrr59jqUtnMIH7f8A@vger.kernel.org
X-Gm-Message-State: AFuF++lb7lTAc/mL0jERpN6ynFJjnraTr6inNpK52FN/am6lHuroRox4
	zYWvOTQRfm3rm9a8pWYQhsx0zLcjSUqFC/jZca0Nz1BOfQsHPwwvkgxTbsTChfMTDEmWceSWrNi
	XyUB2svYHhmWGofsYTzgDDur/3NIqMHpAG/fI5F1xZUsBnxL1R+JohT7vzZaYZncf
X-Gm-Gg: AYBFou1eBDuX/bgz442viftjcOnAJFO3ypq1mNw5fjbvjevn9wh+1tpDFz/JFa7kGZm
	SgHUeUzSU/f2Fs5a8gykQ7fckvep5ilrKMaWtIva78UX1zODVLXhtDP0PVQ6NCNyvyjVbKF59CH
	fK8kVUk0GzSONdejBcFJuXE0e3f+26zFjuDVEb4kKH3TphWKdMK7yZeAZsipmcpxC9TTDsCD2E6
	LX7HZhL1p+Sq4MKd085Vqm0Isw1siy3wsjHG8o/h4KLTvDRqM+jGzGWq7RY90gYXWKic4ccSUbo
	A/08myUmT4jAeMcTCNJqw+pSDaOc/WYjMIZLWIhT2nX7zI+6PHHfYLq0C/5BBbJYxk1hFHjv0Ef
	cMU8QNBQB7J66UZCXAWu14eXTOun9NmtA85nyQJ0fGQcg7WSzE0Yq3d7LAxYXHox/U5dN+C59Yw
	8Gy27MyNZooOQ7P9dnPDmL3FfhaUmI
X-Received: by 2002:a05:701b:454b:20b0:14b:355e:2888 with SMTP id a92af1059eb24-165a9abbbaamr2148698c88.27.1791450912912;
        Thu, 08 Oct 2026 02:15:12 -0700 (PDT)
X-Received: by 2002:a05:701b:454b:20b0:14b:355e:2888 with SMTP id a92af1059eb24-165a9abbbaamr2148656c88.27.1791450912256;
        Thu, 08 Oct 2026 02:15:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:11 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:30 +0530
Subject: [PATCH v6 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-10-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 8CvmaxqTzy5glVZUFM4VkEnpAJDl8zjg
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac75f21 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lq6IrNssKMGk0eY42nwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX1hueRiDoFzYH
 POg9KXOOpE6wITiyk4uVfzDqPFCyb0ti1WTvN+t81zgbrdv2948VCJxNmwXsXgL8TAKmVlJshti
 rDOeaUto5RafVk/pDeNN6t2BIcOhAfw=
X-Proofpoint-GUID: 8CvmaxqTzy5glVZUFM4VkEnpAJDl8zjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX2nugM8QeWhBe
 V0uDpziJGgguEXD6n7ZbDPhQ0HKt1rVZMWnoNsWRejbA8sH9hJXjUvnNsKHWBslk5yIvOelwQHg
 DNda/Ten+ofDStsr9cmLcFLOD2NpqgUVTCjX4551gLmOvjL7wwicrbEnHgHJXcyAte/LRrciPj2
 lc3jbU8TkNgDwmabZYrp/WIxhqNZwvWml3m26MrKq9xZiwqYfDWhqwQ+CMmwvEYvL3yQY360Nyx
 Dsh7dcPUzVa8kEi3ZaOrslAG7opjIgPgU1CevRVSTwJkWdXG72hHLmGYQTPrIduewh6W1DY/AnV
 L7Acx4yH1muoifciarT2fNQ5BoNnICIJmhp0Mi8WPgsr2FO/iG85fY+zfnr+gbmeJNDWwa0VaNU
 G3AV8bJIgyhlKH+Ska6G7brVdccSk9tg0/Mb5DUd4OOYEadCqsGIvPN3QQRDpFgh9JBqKDb28Y/
 xfWJTdMQKEhdE6HGKDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 50ce79219fe2..23a2e27b70fa 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -418,6 +418,17 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			spi0: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x1a80000 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				assigned-clock-rates = <50000000>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x01a84000 0x0 0x4000>;
@@ -456,6 +467,17 @@ i2c1: i2c@1a8c000 {
 				status = "disabled";
 			};
 
+			spi1: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				assigned-clock-rates = <50000000>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@1a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x01a94000 0x0 0x4000>;

-- 
2.34.1

