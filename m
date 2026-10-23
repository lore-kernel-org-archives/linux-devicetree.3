Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768193;
	b=OFuJpnl3nKMb3xAX+1veUKWP1zOruotbJVwA2EeL63X39fXLOAoJdfb+k+FMvNK0V5zs
	 VaDcWnVVeIkECOTfOzpTWEbfvBG4YTCHBW1agepVvha1grSnjEdtbtWYzPtuig7He3VIk
	 NmkR8NqxdBlQpTxTpRHMFsBF5HIf4Hk/AF6eauF62V1gExSDwcJYIABfnbWsCUfiv31xU
	 gnyOpzIJju16Yl971M0HsmzjXwg7HLKqEf9TH+WheNa76zUnpPeRRZlkEGT9Xc20kvA97
	 TOu3TkPcBCs5+1DI8dmUbmu3ew4mfHIhPb1R0oLpZa0gk4/y1ThG4GGRV6xuGbojwpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
	b=I13smjogA0Q9EplqDh0IBR1xpMSeUQHk7TwEvoRWSegh8RdbDGwe+zVszOXtiybeHr9Z
	 GK7ukj1GdouLvBBasCQ0BAkWFYZxPCCQbQ4K3YPQ39yGPLoiYOGMBwmkzhnOQmK9kLPZs
	 yzEZzd8QM9ks6YtbSJS3DEqO+3iLUdFtmIRyl1+A4Q/9GcEbEzFes0gxASddMfL6/Pdmz
	 BeS48wtu7T/OGiVN3R41HXHh2HZG6Ctjue9RdyD7TsxLsFCswDz1iHOIPdwaB7yuXuLvy
	 gGmvEYSibj+Gt/C3nmpuPLZVgY9xAV28tvEK7nwEvhJ32C7OKNwnwK6DaBT+hY5sgQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=py6aQLEB;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OB/M08LA";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106EF606C945
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 106EF606C945
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=py6aQLEB;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OB/M08LA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6IiE3557690
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=py6aQLEBrnTvjNjU
	gz7uI22+xwpuJzETVKih34DNDaXYpQiDG/Vw+7ck3gZZn+ACPRSForH3VG12l1uw
	NKH+7didgfxVfOjWgkyT22d3pZxBhS1XNci/Bp1OApEPg7bjlXoZ/GPpfBQ4aLes
	+Uger+I0Qly92vg9OJul2+Z5ROMBDZ0FZ1gNgWYWU27n5vNPxVAoEfNf4IIrp84O
	CPSSDOrO68aODZbvMp/pDIcVEpW8dXxSPf0FdxyyrtZUDOr8OWxQ80omy320pEfV
	1njcrBcJpUu8c9UIpPmcsOyI3EbAN1EZAdKNK3oQncT4+98Gs3HRaCjF7QMcjo8q
	u6m6AA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjc94x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so167477185a.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768191; x=1793372991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=OB/M08LAGRpVrRAdzAXcFZVTLb4hx2ryKl5A5yvkq8eXC43R9QjuYq843DXi1QN2Ew
         PSq7yRGJEWBxc5vD7zClSLqf/mrr13dvFMIGrqF7pacnATxkJSJrRrBX1aTvj6XwhxPJ
         6HFDCfKzW6gNI/6+Cd4Mqz5U7vdGLoap+Qc6XHPJL5lpmVMq2KEhqqopeP7G7wSvf4Eo
         4rvZhyZ123ab1in2UAuUCUU0JKv8DMipi/dJkUT3Ie9rNamvZDWRbluvHKKk2TOddfQh
         Pank4SBpRiIOrISlbXho6+lCQMNp8R+fINWoMMZtgmMV0weWROw/afnXj+pL6CGHppF3
         5qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768191; x=1793372991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=C8kPsBS0oKIEyA5Nd31N9GZM3SjbZa1VFk1yan11epmxrU50GhC7mAGzfwk/QhVYSn
         zG6PuVsBS60eX3X5LPN2lqcUiyroD+J3dn0jT5+7z8q7b/wBgB0j/K3CQiO3pQnVSCa4
         vecX/PQQukOTMK9HHL+wps6m3T2S80YGHNAwEcM0ighIUP6PuKDZtgN4shXlXLEpXpH/
         JFOTxH2CtKngGjMJaJJRlHtKHRUGdnukqYLfgsZk4hWJt39q4PdIKMHLDFIr3B7hLxv7
         0In2+qd4SvMnpWfX5GGNQlyv5djLzzB5nMI5Lv63jcMVMq2ypijDVJBijYSiPHVzauRc
         Wphw==
X-Forwarded-Encrypted: i=1; AKwUvBxLjJZBQ7urxkWts5wPgzwArQdAqotsHbVppj9AegZ+eeZPS3wy76YU0SUtiWTGtEg7GIheJkbuse4C@vger.kernel.org
X-Gm-Message-State: AFq9FYI9uKmN6pYuBdEywgZjKISLW8YS6pk25KYkJEQECcBlJF/oP1YX
	wS4OjY9hhQcD0LimO0q7kFQEpC/BagG6+9hxOEusFrdxZxXxf+IPSosSul68DRDFXRg39zMIyGE
	evSWDecubGaNW4pYUnsVWNzpFTq5lNiSOuTrcM7lbG7kZWuKUTSeWfZSsRWi49Mc6
X-Gm-Gg: AYBFou3zfh7Awky+hmAv4Ni7B5nZTxlTh4uaWo2O3AgaWewo6TOVF+gb4t/nNtIvVUA
	GzvZ2f3DJN5Tn1yRMofw56BgPTtByDxNG3ijuhkgpUJPujDKNVOPZIHEQsEouftDtcIe81Kjknm
	HJuwxjezI7DgnQ2vGezOxxn3f28qqKgU9LEClmd3e9K+a0uth1yzAHUc119+OoM8cBpt0qHs0o7
	aKRcLHHKXEgfOPUlY0r+6NeDKuQgVQoyG9kfQx3pADspTWfJe6DGWGb5nZQKUFG3jjNMlQWKwtY
	17XNyV8VGBX+3PIwWq5id/L+DMFooQ2WjiwQfw8U0fzoSbuen2hVvwzMFjumw5fvHTe8gwjKvUU
	Rw1f2NjVNWGf9l0AJb9YDgLE2HZT4sXxZcsZcM43S1bB/h0myc2+5hrwnJxrntksCbeGcyncCCF
	VxETXo4lSHh8P5YYBeTo9I2UYdOzbPT/VxiKxW51rnqr6Tb9tvHRY=
X-Received: by 2002:a05:620a:4712:b0:93f:3bb5:545d with SMTP id af79cd13be357-93f6f91c414mr483891185a.27.1792768191498;
        Fri, 23 Oct 2026 08:09:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4712:b0:93f:3bb5:545d with SMTP id af79cd13be357-93f6f91c414mr483884385a.27.1792768190952;
        Fri, 23 Oct 2026 08:09:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:20 +0200
Subject: [PATCH v11 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261023-camss-isp-ope-v11-9-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: azGQoFTy5y-5X0nEaXHyo-0j6Qhv0uQh
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb78c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX2D951gGZFnjL
 0CVs601A0HYM72ZmXyXAYTYdJYlgHSuG7DJs1h0i8LRyIQFWTVz89FsVIg5eA3fK4MtCnI4YeUE
 NHQuHD2wqHdn6FaCcVun6gbArwicNys=
X-Proofpoint-ORIG-GUID: azGQoFTy5y-5X0nEaXHyo-0j6Qhv0uQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX6iOpSc0qq0Yp
 ydCtUDud7obEg64L/yMdNTKix67n9WqhBtTptZMhLjbnietVOaPT7C7d4YxUvr1ONyu7uhIHEEF
 quR2OFsxYueECUsS2m6u6rBBJUWOPWZ0HWRnscVFR4fjS1vY5eZL43e+McKgHbqPf4g6jme2Bmy
 Hk5COiv3D+9hJnWgQlUk7Vm2odeZn16P8kuasfBz9rZhJ9Ot1fS9ZLPKuWfdK22EM9irpPSpbXD
 cWCq6X0seSvgwixysECyoqBeXXn3gbvmq5y5oHLCgyVDL7zlD8OWEpHfx2f4ZvdaPSGOyZsIV8v
 5q3rRPLvAcKHXCPUio1OlvminrE13wSfpWveWYfRKMgyKR4M78jbznxSXmETr7MIo4eRo1wH5Ij
 AweHgLfC8tQmq2lsS9pVTcFaCKNz0BHJ69SP0JOKswfG/Bi0oSsDK4UPWCJLJkEKEirXLt4YKaE
 WAC7kxn8q2iYbVQTFhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

