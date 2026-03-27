Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335DA36C5B6
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581651; cv=none; b=lavGK2Wme8FCoApBeBDLnwpg1yx4hWIffljX6VwIyLpxxLpc+ln0/WMPrljLOf2mOS43tV+0sDsqZknzb/OQzkVVf035/+NULrn7HMHlMpBVd3oAr3QF+6FQu+t9hoEuSEJPveJttBJtjbDJAPMnUPE7+haJfBgri6Wm/jTDPIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581651; c=relaxed/simple;
	bh=jnjzuVtelo8CXER0TM0K0RH4G54o831qlENc7Khgyfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gSn2sz+eEqUZbApMED5dPKoM2VMs0Mtnvmausbr+FUzSbnKC49uFGf20UcEzf5+NwWUW2dsIp3Ozoo4U91xfz5vEoon+U5welufsJz70qeYd7Jpg39mAIUCgPJNS/RVdhFgt9EpMfu2KLl57ZY9LPt9p5qg6ogfmcffkVAHPRf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtzG7c0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNm4a3OJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtzG7c0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNm4a3OJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R19EOn334176
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+1qADo6v2Md76J2yLTczcWIKgouJ7vkv4JBXiCOewo=; b=TtzG7c0bVVQvZtoe
	lyMWy0jdnyzfst7UGxk+/Xt0eRlejVjKMLcTOe+0JCQOdM2HdIYMTsVpJqk7sQbu
	ZX0dCUD555k/edaA7ZGrsuDzx5X/kegrofg7WcrFgsOhbb/b9ppnuSSMAhHg4CSd
	H3sRlb+HTDj+oTk7PkLV/cqP7bOcyPdnJtYMyreWX/RSEBTY3TcnenCowBpJplpK
	5319+WgNJl5E3kSNV7++x/YjWKhZJeDA/SrNa8xAPd8VEYimu5h5e8Zgf9DtPhM+
	yw8Y4QDj78BEhUKtNaGAQN16IhhU/PnTVuu5GdvF1PYL6iO6EeOFh3VA+Ds2mtqt
	ebMTlQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527yubjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:20:49 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1276e71652fso1765426c88.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 20:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774581648; x=1775186448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+1qADo6v2Md76J2yLTczcWIKgouJ7vkv4JBXiCOewo=;
        b=GNm4a3OJnBYa2MPtjFrTEQoNrrWELwrv0e5zVR0Pz536b6hfV5Np61W2CBo1BMLmyb
         HxVqFqq4G6VHlbt+aEsdMbXybshPBjbSyjl820cYWTSgIGchBJWhD6FQdzZn/hHUyqV3
         8BrO7DgwYo5UEWI8qlbA1WviQbk38LEMYabGybXZKw8cGpfhOuhSgxZRrnmbh+KJQxA2
         rzl7994vqajkV1j0ReBVgBpXcAa7UYb/TMU0SoIUAh1dmibgpUL6GDHPxgsIvV0u9Pa7
         ouW7wSDFUTnxjKQ/02+pQNtld2lKNVsONN33bp/VA5ciBLb6tnlEOTLTuv+VhaZ6y8yN
         nLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774581648; x=1775186448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C+1qADo6v2Md76J2yLTczcWIKgouJ7vkv4JBXiCOewo=;
        b=brhK8HHmKs1eh07AuInFmraTiw1eWeS03/YOwobCV79lrWdOkRzLcr1U+EFWwgmuR2
         e7RDt61JlPUdTE11D16POB9rDcapAA7nro/QI/Eu/jSkDSdC00/QKFwmbhABttXJRDRT
         7apFSoWyCCi6UhCDE9PVLL0ZxIHFz/GbwdfSkklFkQzIqGU8emuraP+QLsvyTsb/NbcN
         mze5INCpA6I6WSZZMxr3xYcl0emjUVXylvSRn5QyYIy50ZtXsQBx0/iBimabxdzhhrWL
         R4jcN5YOL7z+vLUTNf8RXy4VED6vXPiCuckmwOH4eOjdgtscBQsw5z81rbSYCwGZsIiB
         +dMA==
X-Forwarded-Encrypted: i=1; AJvYcCWiD9oc15gMitvO/kJb0gZTULmSiETJFPg8/vwihrv+zc4iaEFOL/KS7z5sM9NPweIQlkzXsqJDFpwu@vger.kernel.org
X-Gm-Message-State: AOJu0YxSP2WGAGuBEGAyxA7FC6EktRyD3Dmi8ql8gYRkUV8QRmmvcwmH
	Uno3swUfOBeI5QKT1tfRGXhnMelbrSi3R65MrpwRn1BTwUwz/yId0YoJpgXMb3QC+yKRbqRxX99
	IfeLiaXGF1Nx88XebMysMe2lwJ5OQ2vmdJzgq+0VxI08CWcHnIKD7MB+ccvJok2hk
X-Gm-Gg: ATEYQzzz/BXcjwhdR/evQShIm4F5JbE9Ix3Jna6ww+WjjWbeC3HGkbqQFJzco6l2dVL
	8pO8IriczcS2elkT0ACDVDtguYMAgh2x87/CU3iMQTzIAlQv0H2mE6rNe7Dp1plXttWHESXnpo6
	E09Z5h6w+xbUd2wrdaHtJa7ieI2Ic7CbWyikwET6f4qIxxZwSM95b/jRvLl7M8/QT21125PwoZH
	Q/QI1vqwdF8XhXi7J878Flhk2BsiKG181acx3VdHYec0MEJ0A55IUZqzqHmV7XmnwizgHzvFsXN
	jpq5EmabTzphZEC7mD4ZKFMQT5H6o9XdTWZeohZ9mlOZh/k0TJOB0dAgXfPyDMlXXYd3pHNaCPt
	UsMM0gTpJGybD+lTnmigAe8wD1CBzn9ZzUAYH0bWr+u2yDgiY9xXhqKNUdtzwCQ5iDszDb3P2
X-Received: by 2002:a05:7022:4388:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12ab28f5463mr583346c88.28.1774581648236;
        Thu, 26 Mar 2026 20:20:48 -0700 (PDT)
X-Received: by 2002:a05:7022:4388:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12ab28f5463mr583321c88.28.1774581647715;
        Thu, 26 Mar 2026 20:20:47 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edde435sm4361337eec.25.2026.03.26.20.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:20:47 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 20:20:30 -0700
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali-mtp: Add SoCCP node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-knp-soccp-dt-v1-3-a60c2ae36e9b@oss.qualcomm.com>
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
In-Reply-To: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774581644; l=697;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=jnjzuVtelo8CXER0TM0K0RH4G54o831qlENc7Khgyfk=;
 b=JaMY4BtQlzEjsRR8lzM8GpD971fvGCLww7uSRsx1GQ9xwabiYwJFns6gxmepUXs6e6wURnXqF
 AsgxifALQRPAf/gH9zHJk48sjb5mHSATSMhjxnPoZvwaZVK/xjfVbkY
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c5f791 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cQaW13XGgu9xvPHtD3cA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: MF19y7KxqSoW1EWnN_tWv6lc6FZ1aY-P
X-Proofpoint-GUID: MF19y7KxqSoW1EWnN_tWv6lc6FZ1aY-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAyNCBTYWx0ZWRfX2JeIqqb+OXbz
 D462aL9gCtpJoxYzvAJc6RKonuRtWDjNvw2tdIVChoP07/5h+QJXKOym+HRgfHzH55QdJDfZEX4
 qIzTVlK6kgIvXGkll9oT6YQOnW7jINHPlyIjvv3Gj63epURwYQqfVhl18klpCJmKp965NPNYayT
 N06ZG5Zz25CV14kO2dLtVQUwC+GUM/tSrfr4//28HOqpXCAOwBfm0uHUpI8BBOSqq+lAdgaHUgI
 jVwq+sxKree/lC69jNA8pm62dZW0Qg1K7/R8iQgEc0gyBQqjX/yb3hGbAkdEiIXOpV7n0bysPlC
 E7/5lY0wsj3aPdZks/xnbUu/kWpK9GkDy1MZo/3P7DOJWMIics13FzGDJbE3mIpV2fGZe0w7p90
 zk/aNAnvn/iOo41joHjQHmwXhvijuSABbFG7TxJC+OBwh6oTPN8589+/aoIWZGbFBd2du95a0QG
 99caWJMVPSavvFueQwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270024

Add SoCCP node on Kaanapali MTP board.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 07247dc98b70..a603f3056d83 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1071,6 +1071,11 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/kaanapali/soccp.mbn",
+			"qcom/kaanapali/soccp_dtb.mbn";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
 

-- 
2.25.1

