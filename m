Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670768;
	b=WiK29s9VRGTWUm09SPuQAdDCYUeoibQz8Zxba3LgVGI43I3x6d7/bWEufEsRFtzOaSmo
	 v7QvRuh97YP379T0knk8+IDmcgB64tw2DeJRSiOqXycTtKUrK/s4eJVUBadg7vJvZNDvL
	 /X66WDjSGOUkIXBQfekGWSAu1hIhG7xW4RxktK70c11WTwK0rzClrS/1UVhPs5cPCusxM
	 +M8RObTwYxoxVU7xawpHYK7uhF6VCeh32s5sv8Q/xHX39LoqJz9guOo14T5la3U5mmdq2
	 93y2isTiia71NzwM1xOcS5Py/9NCMfearjwKjOIBafrF/VGFaKz8q/VK8DtRiPTv9Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SWyi/ZODTru34xfLJVEvqhlK68Hp/OcA3GQnx4mgLAg=;
	b=QfwuO+Ttvyn6G8bRBprjwRxk1E30GNoI6NzQU+2Zj4dQquCgFXr2F/wCFU7xa6VwzT2O
	 zjK16NArNsBS686gtsw+ru6XsdbABDZLXn5dIyXVOxtEBqc1k+f1oAdx4la+8EFVAMKUL
	 capZMVYRf/5SdV88REtq53sQspiSp/X2RyPjghdNDU8CQvedM1OJzShPWguz2RNSq/pk4
	 HHRcLGMGXRiTPo8Mm4iQYzPM7JBFSitRmUzby2/Dt8nDfDfPF5aWRdJ6UcWcRtWF1YgwZ
	 aQ8Z9cBSBoGzYuAqqlj7K5EbMt+2OTpZVq8pbIzjgP+4ZpwMJ9l8+P5at0VgkGb8Cvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LnuDwwMJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+yAc+SY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C0A606A89A
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C0A606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LnuDwwMJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+yAc+SY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkZx42214167
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWyi/ZODTru34xfLJVEvqhlK68Hp/OcA3GQnx4mgLAg=; b=LnuDwwMJ0nP3Gowz
	V5D8a7egBvEcXU/Xt1BSCA8qfWxHxtfYFc15egPSGFvX945dm+8bTgUk20rhOTm/
	rXXrHfgQV6xFwVqxp7l34YjVqyVo8+V05F0CyMvxybE8EllHV9CEIrjqYD8ObI4q
	1Qb2DLH0H0Zp5Hz7dzdnMid6bNxdf1fbJYlIx0M6+AucQwGCxTowqoMI5RLsg/qc
	kJLwzvPWbtDqQPnMdaMsslOIdvn6i2/KCIQqQgq9AadDQKuYdGqPZlC/osw/jkb3
	NLIsYQjiP7KsnSviwnLR2qQcjp+40NfYf/7f2p8oE8fJKdIDQ9JpOim5hinCSaD+
	6BtlnQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj4146n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91f184f3334so40741446d6.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 07:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670766; x=1795275566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWyi/ZODTru34xfLJVEvqhlK68Hp/OcA3GQnx4mgLAg=;
        b=Q+yAc+SYYEe+IEInY5O9V5ySCG8cHb72BTuP2ostcloBTbLcb8E7kQNMzPxHK4pM6Z
         X0ryVwJBGgCr6+I0PR7SxIQ8MysLknvbJrB4RqkUerpbS0eup+MZvy+Kk3Koce/I2z08
         4sS1hEG+aKs94FSifvlymChDXP3YNFM8vpTpUB1lz6Zm9vb+otxdBVFgEFu3h0i5oTx6
         rTWoG8iHi6AjJbo5gtVgI7BH1C4vo7xfTVuYz0eMREIyr553OiqzE3ZFwNg6b7ibNpfB
         EmYnvjVYtoDOExGSpd4bdn4Mfa5jg2qgb/Fvtpi9c3t7H3G7cquKhvAouHZXTZgSTiua
         BMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670766; x=1795275566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWyi/ZODTru34xfLJVEvqhlK68Hp/OcA3GQnx4mgLAg=;
        b=SEKL+uLEilvxTT6ireQCQj17MSu+X8obOMtxJ+oBarCHij6tWFRIyq3Y1Rl7XKiXfk
         0h2cxXqEzdgWJ/mwU1anNSDxiDrwg9qml8OwMLLrUr6Cu9ykSt/jBnqe/IDx3fHpWS0O
         PtCdtZGhOefwlQ6uUaW2k6Gh8O+dSYM4aRBZlC07If0EKPcAk2NhRhk3/EouV6PLYmaw
         2k/Gp4RXaToInyridrwRyCe88tsUFvEB9WR4kqswI9rHhVnf01xidC7CDcRZfd+x5fhe
         PbMhWzzt8Ri1LGWNZ5kYIKNTJypkH1ZnANfmdUutj9h+S+jqDUl9sQ9r85RmDKZS7T19
         3Aiw==
X-Forwarded-Encrypted: i=1; AL+hErGRVU0nyXTQjcitqCTQQTeNmj9Bu3EUNypytvMB78gqgEoLHOH2hFr9dShi0EekW50+IX2D0p8VQNLE@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tha1Dty5aPr6adKg7qh25S4H4BRp5Y7VE42/V0o1n7/gt6WGv
	NJo79PtHdGPjxJ5ANTmygSC5KE2oockkSPQ9mywJ+3IkiIHqqk1reqWJWlNq0Zxu8X1QKgIOOCB
	Il2yhCkXpFI6bBFLzY4U4CrlHIv2FYEPG8WsZMnlic1w6VhVGtjBplercrzHXVSje
X-Gm-Gg: AYBFou0tVa/kX0RiurGtXyYAMQOE6jAiBKseQP/PkBHuLiO0AmfDBR53uY00y5jfDtq
	s2FSBt2++OMflBp/zBeDWLXtjegmo/eJDi+5NGbl1bqtPBf0oxP8MMWBGgV+B5lm/oTkgZjyu7i
	m9GdaYXLWP5K5Smy6l6J4iYQKimEL6g9cZM0wzclOyLsoGyirrJP18gGsB4pO/zkgRmD2rozzfK
	JXyBzEVZjhDDx5lNiR4r2eMtjlQOtcCktH7PHiKX6gv6ztVYBB3XN7Euw8RObs8sW1XBETz+3gb
	Vo1wh5AzriFQbV/tiR8W2jfj19zSnNjy8eJNwuc5TcXdf3raER6GKfKEj1XPsIyQ8PQ/C2T/O0A
	4uK3myUggOsScRSIn3488oV7ZKmbseXrSr7VFwXcF5OazrGY1j3dPUtmUlxwZACTR75cWFKd4Zx
	MGYC1FYh4TwT0+
X-Received: by 2002:a05:620a:a98f:20b0:949:6530:8170 with SMTP id af79cd13be357-94965309f73mr235195485a.16.1794670766046;
        Sat, 14 Nov 2026 07:39:26 -0800 (PST)
X-Received: by 2002:a05:620a:a98f:20b0:949:6530:8170 with SMTP id af79cd13be357-94965309f73mr235192085a.16.1794670765567;
        Sat, 14 Nov 2026 07:39:25 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:24 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:05 +0100
Subject: [PATCH 2/4] usb: misc: qcom_eud: set the TCSR check register
 before enabling on QCM2290
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
Message-Id: <20261114-qcm2290-eud-v1-2-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXxL5/VfzJYa0V
 gAUrfvVFBJdYHxPKIyJaeqH17NwAYzhkPq0+JYvRdq+Z9Vljr3+6S+XWWh/dP8nmXAeRjfMI1U4
 DNJISAshtqhhEUtrZgMXEWE9NToG+x5W14DCxLP7p5VQxyW6zbm7nP0hwXpxXg4LC0vXt/ATpN7
 F44qn7xY2L+Cn4z2kHVJFjsaFHzkiXKWJQBbi0bxtIWsKHcfSp0MY5TYSWcgmzcnl3TcG1eOYiP
 ZioXePE4a3KSsp+QdbZMVU3mcMuknYS0FzOjN62uDQbEwugzSsAYP6s6MSiLOaBxW8uYMTVbgcG
 HyCeSvx+/FbOUNCepVH3CMwaIFdS7EAlp2OP+ODEgxInFWfFUbPAa9yLP1bsE78ShB/2ZvX3nNg
 JAYSJ5BppgSqH+5SjAUsm10187DaP/IY6xi0FZ1AuQBcImhUQganEMOoNfkdT0mF7h/pihX49HR
 pRFnF7FXKey1ifOC0Jw==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af880ae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ECuajReLB9cn1KhF9ZsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: yTOYNPz71vrEZGrYc8xZbsReFP6f90TZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX5cmKQr57jzjJ
 8vxpGXueA3lWLRPP12HYBXtp1TQm6CPkTv4RDlYtYtl2G8qVbf2sGJhOs8CyKj0YsE5R3GjJA/9
 D/9S1ayqB9979uo+b6ea5UnXJvL1owQ=
X-Proofpoint-ORIG-GUID: yTOYNPz71vrEZGrYc8xZbsReFP6f90TZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

On QCM2290 the EUD mode manager ignores EUD_EN2 unless the TCSR
register TCSR_APSS_SPARE_REG1 is set first. The boot firmware does
exactly that when it enables the EUD itself (TCSR_APSS_SPARE_REG1 = 1,
then EUD_EN2 = 1), but only when the device's debug policy asks for
it. Otherwise EUD_EN2 is accepted, the driver reports success, and the
EUD stays in bypass.

Take the register from an optional third reg entry and, like EUD_EN2,
write it through qcom_scm_io_writel(), right before EUD_EN2 on enable
and back to 0 after the disable. Whether the writes are allowed stays
the secure firmware's decision: QTEE accepts both when secure boot is
off or debug is not disabled; TF-A accepts TCSR_APSS_SPARE_REG1 always
and EUD_EN2 in debug builds only.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..217f6c1791f0 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -36,6 +36,7 @@ struct eud_chip {
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	phys_addr_t			mode_mgr;
+	phys_addr_t			tcsr_check;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
@@ -46,6 +47,16 @@ static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
+	/*
+	 * On QCM2290 the boot firmware sets the TCSR check register before
+	 * EUD_EN2; without it the mode manager ignores the enable.
+	 */
+	if (priv->tcsr_check) {
+		ret = qcom_scm_io_writel(priv->tcsr_check, 1);
+		if (ret)
+			return ret;
+	}
+
 	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
 	if (ret)
 		return ret;
@@ -65,6 +76,9 @@ static int disable_eud(struct eud_chip *priv)
 	if (ret)
 		return ret;
 
+	if (priv->tcsr_check)
+		qcom_scm_io_writel(priv->tcsr_check, 0);
+
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
 	return 0;
 }
@@ -218,6 +232,11 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	/* Optional TCSR check register, written through the secure IO SMC */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
+	if (res)
+		chip->tcsr_check = res->start;
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;

-- 
2.53.0

